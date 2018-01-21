function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
% -------------------------------------------------------------
% Reformat y; start with zeros, for each row set y(row) = 1
yFormatted = zeros(m, num_labels);
for row=1:m
    yFormatted(row, y(row)) = 1;
end
    % Also found this method, credit: "everpeace"'s github
    %I = eye(num_labels);
    %Y = zeros(m, num_labels);
    %for i = 1:m
    %    Y(i, :) = I(y(i), :);
    %end
    %And this, from "nico"'s github
    % Explode y into 10 values with Y[i] := i == y.
    %Y = zeros(num_labels, m);
    %Y(sub2ind(size(Y), y', 1:m)) = 1;
% -------------------------------------------------------------
% Do Forward Prop
a1 = [ones(m, 1), X]; % 5K x 401 (K = 1000)
z2 = a1 * Theta1'; % 5K x 401 * 401 x 25
a2 = [ones(size(z2, 1), 1), sigmoid(z2)]; % 5K x 26
z3 = a2 * Theta2'; % 5K x 26 * 26 x 10
a3 = sigmoid(z3); % 5K x 10
% -------------------------------------------------------------
% Calculate Cost
lhs = yFormatted.*log(a3);
rhs = (1 - yFormatted).*(log(1- a3));

J = -1/m *(sum(sum(lhs + rhs)));
% the inner sum gets column-wise costs, outer sum gets total cost

reg_term = lambda/(2*m) *((sum(sum(Theta1(:, 2:end).^2))) ...
                        + (sum(sum(Theta2(:, 2:end).^2))));

J = J + reg_term;
% -------------------------------------------------------------
% Backprop

%{ With a for loop - works eh, likely 1 or 2 lines wrong
%for i = 1:m
    %Forward Prop x_i
%    x_i = a1(i,:); % x_i is     1 x 401
%    z2_i = Theta1 * x_i'; %   25 x 401 * 401 x 1 = 25 x 1
%    a2_i = [1; sigmoid(z2_i)]; % sigmoid(26 x 1) = 26 x 1
%    z3_i = (Theta2 * a2_i); % 10 x 26 * 26 x 1 = 10 x 1
%    a3_i = sigmoid(z3_i); % still 10 x 1

    %Get lowercase deltas
%    d_3 = a3_i - yFormatted(i,:)'; % 10 x 1 - 10 x 1 = 10 x 1
%    d_2 = (Theta2' * d_3);
%    d_2 = d_2(2:end).* sigmoidGradient(z2_i);
%    Theta1_grad = Theta1_grad + d_2 * x_i;
%    Theta2_grad = Theta2_grad + d_3 * a2_i';
%end

% Vectorized backprop apparently not perfect, but is quite close
d_3 = a3 - yFormatted;
d_2 = (d_3 * Theta2);
d_2 = d_2(:,2:end) .* sigmoidGradient(z2);

reg_1 = [zeros(size(Theta1, 1), 1) ((lambda/m) * Theta1(:,2:end))];
reg_2 = [zeros(size(Theta2, 1), 1) ((lambda/m) * Theta2(:,2:end))];

Theta1_grad = (1/m) * (d_2' * a1) + reg_1;
Theta2_grad = (1/m) * (d_3' * a2) + reg_2;

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
