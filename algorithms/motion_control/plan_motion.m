function [public_vars] = plan_motion(read_only_vars, public_vars)
%PLAN_MOTION Summary of this function goes here

% I. Pick navigation target

target = get_target(public_vars.estimated_pose, public_vars.path);


% II. Compute motion vector
%public_vars.motion_vector = plan_motion_moCap(read_only_vars.mocap_pose, public_vars.path);
public_vars.motion_vector = [0.1,0.1];

end