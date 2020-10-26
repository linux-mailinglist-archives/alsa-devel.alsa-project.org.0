Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC1298BCC
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 12:20:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E2F16EE;
	Mon, 26 Oct 2020 12:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E2F16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603711243;
	bh=rDc4LrhNla/X0Y0kVRg1oVTgFH8K5B4hmP11PJqBBvs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FDI7saMDLz5/tX7zLEkpU0dul3oV7REiaip9VVnQpCIK9BqMK5E5QCoW4trZIAf6f
	 fBhYmBEubzdnPikmAflNfP3yq3I5z+alcFc50vEEKShwYp6Wc6hmNZHbCrgzgTRqxf
	 mnaSBOfXGa5/f4fORNNj6VzALxy/uiag/PxYlTU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C65CF801D8;
	Mon, 26 Oct 2020 12:19:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF849F801D5; Mon, 26 Oct 2020 12:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3CAFF801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 12:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3CAFF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jMwOk3Rg"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 216BE22263;
 Mon, 26 Oct 2020 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603711140;
 bh=rDc4LrhNla/X0Y0kVRg1oVTgFH8K5B4hmP11PJqBBvs=;
 h=From:To:Cc:Subject:Date:From;
 b=jMwOk3RgdhNUiWW4vSv8C+tkoK9jrhnfZlLVnFH4/yrDSi0BFjfdwx9xFJfFoQ6HG
 MVuO1jOvrBOxoJXb3F485USFw1jEu193MJNCftrahGqOp2U+dMSKdc5CfL9kyfocju
 YKGfd0vkg5xqjtm1C4Sv9oaGfuoCMzdKLC7lsJ7A=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 00/11] Convert mlx5 to use auxiliary bus
Date: Mon, 26 Oct 2020 13:18:38 +0200
Message-Id: <20201026111849.1035786-1-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, ranjani.sridharan@linux.intel.com,
 virtualization@lists.linux-foundation.org, fred.oh@linux.intel.com,
 tiwai@suse.de, broonie@kernel.org, Parav Pandit <parav@nvidia.com>,
 Roi Dayan <roid@nvidia.com>, shiraz.saleem@intel.com,
 Jakub Kicinski <kuba@kernel.org>, dan.j.williams@intel.com,
 Leon Romanovsky <leonro@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Leon Romanovsky <leonro@nvidia.com>

Hi,

This patch set converts mlx5 driver to use auxiliary bus [1].

In this series, we are connecting three subsystems (VDPA, netdev and
RDMA) through mlx5_core PCI driver. That driver is responsible to create
proper devices based on supported firmware.

First four patches are preparitions and fixes that were spotted during
code development, rest is the conversion itself.

Thanks

[1] https://lore.kernel.org/lkml/20201023003338.1285642-1-david.m.ertman@intel.com

Leon Romanovsky (11):
  net/mlx5: Don't skip vport check
  net/mlx5: Properly convey driver version to firmware
  net/mlx5_core: Clean driver version and name
  vdpa/mlx5: Make hardware definitions visible to all mlx5 devices
  net/mlx5: Register mlx5 devices to auxiliary virtual bus
  vdpa/mlx5: Connect mlx5_vdpa to auxiliary bus
  net/mlx5e: Connect ethernet part to auxiliary bus
  RDMA/mlx5: Convert mlx5_ib to use auxiliary bus
  net/mlx5: Delete custom device management logic
  net/mlx5: Simplify eswitch mode check
  RDMA/mlx5: Remove IB representors dead code

 drivers/infiniband/hw/mlx5/counters.c         |   7 -
 drivers/infiniband/hw/mlx5/ib_rep.c           | 113 ++--
 drivers/infiniband/hw/mlx5/ib_rep.h           |  45 +-
 drivers/infiniband/hw/mlx5/main.c             | 148 +++--
 drivers/infiniband/hw/mlx5/mlx5_ib.h          |   4 +-
 .../net/ethernet/mellanox/mlx5/core/Kconfig   |   1 +
 drivers/net/ethernet/mellanox/mlx5/core/dev.c | 504 ++++++++++--------
 .../net/ethernet/mellanox/mlx5/core/devlink.c |   4 +-
 .../ethernet/mellanox/mlx5/core/en_ethtool.c  |   4 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c | 135 ++---
 .../net/ethernet/mellanox/mlx5/core/en_rep.c  |  42 +-
 .../net/ethernet/mellanox/mlx5/core/en_rep.h  |   6 +-
 .../net/ethernet/mellanox/mlx5/core/en_tc.c   |   8 +-
 .../mellanox/mlx5/core/esw/devlink_port.c     |   2 +-
 .../net/ethernet/mellanox/mlx5/core/eswitch.c |  28 +-
 .../mellanox/mlx5/core/eswitch_offloads.c     |   6 +
 .../mellanox/mlx5/core/ipoib/ethtool.c        |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/lag.c |  58 +-
 .../net/ethernet/mellanox/mlx5/core/main.c    |  43 +-
 .../ethernet/mellanox/mlx5/core/mlx5_core.h   |  28 +-
 drivers/vdpa/mlx5/Makefile                    |   2 +-
 drivers/vdpa/mlx5/net/main.c                  |  76 ---
 drivers/vdpa/mlx5/net/mlx5_vnet.c             |  55 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.h             |  24 -
 include/linux/mlx5/driver.h                   |  36 +-
 include/linux/mlx5/eswitch.h                  |   8 +-
 .../linux/mlx5/mlx5_ifc_vdpa.h                |   6 +-
 27 files changed, 731 insertions(+), 664 deletions(-)
 delete mode 100644 drivers/vdpa/mlx5/net/main.c
 delete mode 100644 drivers/vdpa/mlx5/net/mlx5_vnet.h
 rename drivers/vdpa/mlx5/core/mlx5_vdpa_ifc.h => include/linux/mlx5/mlx5_ifc_vdpa.h (97%)

--
2.26.2

