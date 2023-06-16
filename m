Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B763A7327D9
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 08:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E96C826;
	Fri, 16 Jun 2023 08:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E96C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686898134;
	bh=r6LsE4QDPJaN7RaevDpadKMDhy3dpH8r4JpXYj/mSig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fUr2nnpl4gSHjsQcfhGJz708qkhmT6TQCoVSnjV4OmSvt9kOCeJPiDT3XJBGLQbic
	 i4SPThVkDTGL1ChQItYVr0Xj1bKxnlKbVfLQzX3WPpxp0t2E52g8g+nCOjix3iuXiI
	 RVmGWvit5fD5yrt1WE4RVELxvsLiEK7K8thedmb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE79EF800BA; Fri, 16 Jun 2023 08:48:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA62F80132;
	Fri, 16 Jun 2023 08:48:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68FD5F80155; Fri, 16 Jun 2023 08:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9ABB5F800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 08:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ABB5F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EwAsCja8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686897770; x=1718433770;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r6LsE4QDPJaN7RaevDpadKMDhy3dpH8r4JpXYj/mSig=;
  b=EwAsCja8QP2hZ0ZC9UspEwSlbNl7sT52IJHf+KKG3woFXNsnx3V18m6O
   3fodwD+TSadI/c7DY69TmYD/cQSlBRbWMehh4sOIWmVK6k6H8WNNQdxU1
   LNCrFHPYY9XHSwIQa4bGcmLLbTwY5JMxrc7FtsAD50i3yBBX3igz7Q9VO
   cATIn3MCQf8N5F6Y3qvvAftUEx8ymL2QQE3Z6EcpWjT1ZQIJwoLgQmEzc
   9hA7ghVCxzlbiN9I0RK72TBOpsls7pZKmY5ExO87E8WeR8LyQWmzfL3o0
   phqAvfASYvOAH2aT5ebcmidt/U4vMBAKdYHBNDOEy2WEMtmOza15EPIkA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="358017035"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400";
   d="scan'208";a="358017035"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 23:42:12 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="746062639"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400";
   d="scan'208";a="746062639"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 23:42:10 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	htcheong@chromium.org,
	zhourui@huaqin.corp-partner.google.com,
	bard.liao@intel.com,
	mac.chiang@intel.com
Subject: [PATCH v2 1/2] ASoC: Intel: sof_rt5682: reorder quirk table
Date: Fri, 16 Jun 2023 02:36:16 -0400
Message-Id: <20230616063617.25900-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3M5PRGDEQVMIFXSELEK3JCATOL2B6FLW
X-Message-ID-Hash: 3M5PRGDEQVMIFXSELEK3JCATOL2B6FLW
X-MailFrom: mac.chiang@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3M5PRGDEQVMIFXSELEK3JCATOL2B6FLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Terry Cheong <htcheong@chromium.org>

Reorder the entries in quirk table to group entries with same platform.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
For the purpose of rebasing PATCH 2/2, pick up from
link:https://github.com/thesofproject/linux/pull/4419

Mainly pick up mtl_rt1019_rt5682 driver for Chrome projects support.
Link:https://github.com/thesofproject/linux/pull/4417

Changes v2:
  - missing Signed-off-by in PATCH 1/2, added it.
---
 sound/soc/intel/boards/sof_rt5682.c | 52 ++++++++++++++---------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 86bbc1fea6ff..be34d7595537 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -981,14 +981,13 @@ static const struct platform_device_id board_ids[] = {
 		.name = "sof_rt5682",
 	},
 	{
-		.name = "tgl_mx98357_rt5682",
+		.name = "cml_rt1015_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_RT1015_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
 		.name = "jsl_rt5682_rt1015",
@@ -1000,33 +999,38 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "tgl_mx98373_rt5682",
+		.name = "jsl_rt5682_mx98360",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98373_SPEAKER_AMP_PRESENT |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "jsl_rt5682_mx98360",
+		.name = "jsl_rt5682_rt1015p",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT1015P_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "cml_rt1015_rt5682",
+		.name = "jsl_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0)),
+	},
+	{
+		.name = "tgl_mx98357_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
-					SOF_RT1015_SPEAKER_AMP_PRESENT |
-					SOF_RT5682_SSP_AMP(1)),
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "tgl_rt1011_rt5682",
@@ -1040,13 +1044,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "jsl_rt5682_rt1015p",
+		.name = "tgl_mx98373_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
-					SOF_RT1015P_SPEAKER_AMP_PRESENT |
-					SOF_RT5682_SSP_AMP(1)),
+					SOF_MAX98373_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_mx98373_rt5682",
@@ -1149,12 +1155,6 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
-	{
-		.name = "jsl_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
-					SOF_RT5682_SSP_CODEC(0)),
-	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
-- 
2.20.1

