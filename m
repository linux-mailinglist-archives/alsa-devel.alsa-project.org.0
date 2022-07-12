Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B478A571ADA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 15:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A8A1699;
	Tue, 12 Jul 2022 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A8A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657631448;
	bh=fIbebunkRkEi/QaWtIhVG21h2SSrFjbadtNMoUw+DpM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RouD2AYSp+pjq4QcAt2dEDuBgJq6ysyrQqyohmORlzMjQ3mHWHlNxZPMWfFm7HYCx
	 iOCkLIFaYkTYWv5kka+S1+dKKlRRXrd/wTTJXA8RFA+1ZSbpoegUO7iZ4oxBegQ06W
	 BN815frFhcX0wbOAED+2I7z7zVvR9KqXKWhD3LFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D45E0F800E8;
	Tue, 12 Jul 2022 15:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6933F80246; Tue, 12 Jul 2022 15:09:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 398A8F800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 15:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 398A8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DnvQPBxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657631381; x=1689167381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fIbebunkRkEi/QaWtIhVG21h2SSrFjbadtNMoUw+DpM=;
 b=DnvQPBxXG4FmkQqHJMwXYQ8dKp6fHqXcd6JJSkTaNSlGgjFsDkORKuBx
 7MtEiR/adX+6wxo0VJpUj0gAuLOMBRfhrerhfg2Vmv2yuH6ACTjQZBPRd
 LJDv7Qv6aPwtqqdOvqTCmmr40+SPP6L8Bn0e/f6GkMGklHSYrtVXxqGJZ
 iboMposK8HxDYe95MzO0P5UUcI7oypZQ0bwTvj6/gAKo53fveDxgLQRFi
 E/5lp48+Jnt6kPNb8hbCmIZM6nrpyd5dKlRshjiZCoGHmK3csdFuX2Kdw
 9lIHTrie3OunUiP90qrJC+8X/lf/WpXSa7GTXdpJ16IgLWIsy1z1Z1Dh7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="286056889"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="286056889"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:09:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="627882378"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:09:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: sof-client-probes: Only load the driver if IPC3 is
 used
Date: Tue, 12 Jul 2022 16:10:22 +0300
Message-Id: <20220712131022.1124-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The current implementation of probes only supports IPC3 and should not be
loaded for other IPC implementation.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-client-probes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 1f1ea93a7fbf..e7e78d1a8ec3 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -694,6 +694,10 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	if (!sof_probes_enabled)
 		return -ENXIO;
 
+	/* only ipc3 is supported */
+	if (sof_client_get_ipc_type(cdev) != SOF_IPC)
+		return -ENXIO;
+
 	if (!dev->platform_data) {
 		dev_err(dev, "missing platform data\n");
 		return -ENODEV;
-- 
2.37.0

