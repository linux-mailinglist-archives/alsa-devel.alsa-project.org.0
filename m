Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2F64EAFD
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 12:55:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47764170B;
	Fri, 16 Dec 2022 12:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47764170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671191732;
	bh=Y8nl3bPZho6VnWkSTaobln2om5vlm3qNMUCK0O0EdW4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=m+ekKBzeqmhHGCS6p9fHSw1dajzgDHRtuy80sYb4fjA2vMtMBkWRyOtdLjREGo3iU
	 q0y4Nbs1k7LZK4qNTeVW0f7SMrjDJ3CPhTyy1J/FfrqIw5mUTZCaHpzkLJ7CyfXWKQ
	 KxpH1nZc+9zRgL1Hg9/LxlGvf0cI7e5wSzaXZhlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AEB4F804D7;
	Fri, 16 Dec 2022 12:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B541DF80519; Fri, 16 Dec 2022 12:54:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7208CF804E7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 12:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7208CF804E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=koL4HNo1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671191677; x=1702727677;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y8nl3bPZho6VnWkSTaobln2om5vlm3qNMUCK0O0EdW4=;
 b=koL4HNo1SKuU2+7gCgbuPOE3PrIb6u9DgA6PRhaJHeNMJc7UMkUt2sY+
 H/QttE+izJIPLq9nu/20flc6A5kZz/pk9ljPILVg0K4uSqNa20b+QoTNV
 2NMTI+YPyk3+OAs+oXxttEWvJuoGX57gOJ/xg5WAwxHsk/wMwbr+rxgPv
 AdmIfa0UkjNz7pMZAODzF0oJJ4NON589MERBvy2eXof+BqmREyBs1J1yR
 KIUF4iisOwkQ9J16CmlHNiNY/WRNvkxeHIrN5rJGwAYlpsYnzm8YDjvcy
 fcBddbL2oi9hsccy3CGXgTrB9p8+LyY57+LmRU+D6kM9zcRogeGIZ7NP5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="306627800"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="306627800"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 03:54:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="599926666"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="599926666"
Received: from emnevill-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.6.47])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 03:54:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: core: Print out the value of sof_debug if it is set
Date: Fri, 16 Dec 2022 13:54:35 +0200
Message-Id: <20221216115435.28427-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The sof_debug value is set by the user, developer intentionally.
To save time on figuring out what value has been passed to the kernel by
the user, developer, print it out if it is not 0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 625977a29d8a..26a3f7c8c914 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -362,6 +362,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	sdev->first_boot = true;
 	dev_set_drvdata(dev, sdev);
 
+	if (sof_core_debug)
+		dev_info(dev, "sof_debug value: %#x\n", sof_core_debug);
+
 	/* check IPC support */
 	if (!(BIT(plat_data->ipc_type) & plat_data->desc->ipc_supported_mask)) {
 		dev_err(dev, "ipc_type %d is not supported on this platform, mask is %#x\n",
-- 
2.39.0

