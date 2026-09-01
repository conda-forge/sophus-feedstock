#include <sophus/so3.hpp>

#include <Eigen/Core>

int main() {
  const double half_pi = Sophus::Constants<double>::pi() / 2.0;
  const Sophus::SO3d rotation = Sophus::SO3d::rotX(half_pi);
  const Eigen::Vector3d expected(0.0, 0.0, 1.0);

  return ((rotation * Eigen::Vector3d::UnitY()) - expected).norm() < 1e-12
             ? 0
             : 1;
}
