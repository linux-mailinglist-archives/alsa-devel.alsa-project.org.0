Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5C298BD6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 12:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53D216EF;
	Mon, 26 Oct 2020 12:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53D216EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603711293;
	bh=UBkXRzDgi1l73AkPFzD2IDEqELXSl/ae0MIMXmf/MP8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ry7jyTN2GQgUf5oRNK9zfDOqFa8mnz9JDWWzNfCHLrjETc7KF5ZRe4s9f9nK53wH1
	 74Eyq9C2SnP4+O3XrlWvOiPhON04yhzy+H2wWYjsI47pEijBm74DQphDtYQuspzsyl
	 tNjAJL6N+Z2zCALW4eY+XmuAQ/hsnaRuaQjZ8QOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 968ACF801D5;
	Mon, 26 Oct 2020 12:19:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F455F804B3; Mon, 26 Oct 2020 12:19:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A40F9F8026D
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 12:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A40F9F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jJyr2o9M"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C3A122281;
 Mon, 26 Oct 2020 11:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603711147;
 bh=UBkXRzDgi1l73AkPFzD2IDEqELXSl/ae0MIMXmf/MP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJyr2o9MFGZkBQ1CNXQXoebQer9oipZK0+mnMy7h0Mmji1O9SIoJwPRlED7rCc1cm
 wOSkd8goawyqIShw6i54dqfrqMJmmbVYrxW0rzgBX2ZgRThLlfbvVxYJgVc68cFPbX
 dw8KEDM3PKall6e+lgfmlfFMfepOPHemhkLoO3TI=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 02/11] net/mlx5: Properly convey driver version to
 firmware
Date: Mon, 26 Oct 2020 13:18:40 +0200
Message-Id: <20201026111849.1035786-3-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026111849.1035786-1-leon@kernel.org>
References: <20201026111849.1035786-1-leon@kernel.org>
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

mlx5 firmware expects driver version in specific format X.X.X, so
make it always correct and based on real kernel version aligned with
the driver.

Fixes: 012e50e109fd ("net/mlx5: Set driver version into firmware")
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
index 8ff207aa1479..71e210f22f69 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -50,6 +50,7 @@
 #ifdef CONFIG_RFS_ACCEL
 #include <linux/cpu_rmap.h>
 #endif
+#include <linux/version.h>
 #include <net/devlink.h>
 #include "mlx5_core.h"
 #include "lib/eq.h"
@@ -233,7 +234,10 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
 	strncat(string, ",", remaining_size);

 	remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
-	strncat(string, DRIVER_VERSION, remaining_size);
+
+	snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
+		 (u8)(LINUX_VERSION_CODE >> 16), (u8)(LINUX_VERSION_CODE >> 8),
+		 (u16)(LINUX_VERSION_CODE & 0xff));

 	/*Send the command*/
 	MLX5_SET(set_driver_version_in, in, opcode,
--
2.26.2

