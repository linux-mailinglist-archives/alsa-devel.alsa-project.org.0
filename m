Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7A7A1FFF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 15:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4186C84B;
	Fri, 15 Sep 2023 15:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4186C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694785390;
	bh=WqYOtyD9Q8wlToVgnjjlK0ZabaUGdpyIW8MzphKXrL8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tl+t8ElyPf0NxM/OIDodsLhveIux/G4zbrXrftT84lo+zdbkLtSfEFja7SVdvH+rt
	 BPvjai/fPCZaDx865N3wMc8ijo9jaiDkzNSDzdgF5QzkZX6u2YS3Bga4yvwW70ixIl
	 8fAGDPtKG8lr8LUAFeKaxNhY2258RsakRqrRTgh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11E1F80537; Fri, 15 Sep 2023 15:42:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACEAF80246;
	Fri, 15 Sep 2023 15:42:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB75F80425; Fri, 15 Sep 2023 15:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D9F7F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 15:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D9F7F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=guZNTAAR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694785328; x=1726321328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WqYOtyD9Q8wlToVgnjjlK0ZabaUGdpyIW8MzphKXrL8=;
  b=guZNTAARChoGwp1BDiLGRXsiNGwg3LcoxeIamfHCZOGgo7CG8EXnI/u8
   k7cmrthUaLrPndgiWcfrMh39xF6JEca37+esixkKdNZlWtQZxwfm+/vQw
   UbGHR3g6Bry0vq1JRMHPz23osDhYsi2z7xhWQqvgr0LB06/SVoL+ma7U8
   wzHh24Ap4ZQDjsNcTDY+quWarAVReAtmUoBpx0HWJxWsqGfnI3nkHbZkK
   kM9YBMMpr5Tr9RnOjCw7Dz7acIQSnNAou3YJAP9zdv5c8UhQjI89r0P0U
   QjbHAxLx9HYVtTogr5ztT4mSPiuP9MYMOpW3zPr9901quK66SMJ3RSuR4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="381978203"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="381978203"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="744988704"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="744988704"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:41:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: MTL: Reduce the DSP init timeout
Date: Fri, 15 Sep 2023 16:41:53 +0300
Message-ID: <20230915134153.9688-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CT3LJHZDZTTV5VXSXLGD5URA3D3SOZ4L
X-Message-ID-Hash: CT3LJHZDZTTV5VXSXLGD5URA3D3SOZ4L
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CT3LJHZDZTTV5VXSXLGD5URA3D3SOZ4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

20s seems unnecessarily large for the DSP init timeout. This coupled with
multiple FW boot attempts causes an excessive delay in the error path when
booting in recovery mode. Reduce it to 0.5s and use the existing
HDA_DSP_INIT_TIMEOUT_US.

Link: https://github.com/thesofproject/linux/issues/4565
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 2 +-
 sound/soc/sof/intel/mtl.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index b84ca58da9d5..f9412517eaf2 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -460,7 +460,7 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	/* step 3: wait for IPC DONE bit from ROM */
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, chip->ipc_ack, status,
 					    ((status & chip->ipc_ack_mask) == chip->ipc_ack_mask),
-					    HDA_DSP_REG_POLL_INTERVAL_US, MTL_DSP_PURGE_TIMEOUT_US);
+					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_INIT_TIMEOUT_US);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "timeout waiting for purge IPC done\n");
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 02181490f12a..95696b3d7c4c 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -62,7 +62,6 @@
 #define MTL_DSP_IRQSTS_IPC		BIT(0)
 #define MTL_DSP_IRQSTS_SDW		BIT(6)
 
-#define MTL_DSP_PURGE_TIMEOUT_US	20000000 /* 20s */
 #define MTL_DSP_REG_POLL_INTERVAL_US	10	/* 10 us */
 
 /* Memory windows */
-- 
2.42.0

