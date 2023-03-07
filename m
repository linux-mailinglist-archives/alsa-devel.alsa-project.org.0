Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F56ADDF7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:51:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C495B1437;
	Tue,  7 Mar 2023 12:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C495B1437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678189864;
	bh=NwE5paZKCc4F6cV/BRZp+8nOhJFO5PIFHzKc0KnYcVM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LJ5ZqkhohgtLesoAQQo4S55jC0rv1/D+togByF2Ea7HG9UnPWlD1pDIl3xI2XCtAX
	 4jZ3dGgoU2z1xNvcZY23s2hck5KiHIW6hJf7w3N6G/xsLjfS6VY8QBAyvs/BPxfg5V
	 qzxRSnuN+VM7DqS+E9xOTbqeFJMM0N3wtH1W9Vto=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67235F800C9;
	Tue,  7 Mar 2023 12:50:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF578F80431; Tue,  7 Mar 2023 12:50:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C18F4F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18F4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N6BpcLIM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189809; x=1709725809;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NwE5paZKCc4F6cV/BRZp+8nOhJFO5PIFHzKc0KnYcVM=;
  b=N6BpcLIMr0nSHJuHafETcGT6LY9kN980GhnalTbsrSLR+N1tVUhBlxBH
   Dbjxa+QMeeGyz9PSm3wc6bbHOoJwmeMeItAbL7KCfuHwtp1NU+QgMkgEV
   MorgrTfUsLfnoQmJKaNWml5kat+MxbatOjYGeKX+XAuNavAQA7YOaYLgn
   emBfBQOMA/bH+SUEYteKq/W6LDHXQEDE/GTjGZbOdMTdUnZP/C5gJ95gm
   2HaMiTFT7IIgclY9QcXvW0V9CZWRfy9SptGHT+ZE++eXPHUpvb5lLOnsN
   CvpIZ5qOfjgdkU7pVpT2OpXA74ppOQEZXfaoDmuqFJAiyHilJ2+Cw8OnA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335852844"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="335852844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819736862"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="819736862"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:49:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: loader: Remove log prefixes for
 snd_sof_run_firmware
Date: Tue,  7 Mar 2023 13:50:18 +0200
Message-Id: <20230307115018.5588-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FCDHSFETQU2HKKBA3JT4OAKAB2Q4Z3KA
X-Message-ID-Hash: FCDHSFETQU2HKKBA3JT4OAKAB2Q4Z3KA
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 cujomalainey@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCDHSFETQU2HKKBA3JT4OAKAB2Q4Z3KA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Prefixs are unneeded since log level explains the same information

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 81d202e5ce53..2f8555f11c03 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -123,7 +123,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 					       "fw_version", 0444);
 		/* errors are only due to memory allocation, not debugfs */
 		if (ret < 0) {
-			dev_err(sdev->dev, "error: snd_sof_debugfs_buf_item failed\n");
+			dev_err(sdev->dev, "snd_sof_debugfs_buf_item failed\n");
 			return ret;
 		}
 	}
@@ -131,7 +131,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	/* perform pre fw run operations */
 	ret = snd_sof_dsp_pre_fw_run(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed pre fw run op\n");
+		dev_err(sdev->dev, "failed pre fw run op\n");
 		return ret;
 	}
 
-- 
2.39.2

