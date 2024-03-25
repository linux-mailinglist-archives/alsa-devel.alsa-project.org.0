Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2488B3C7
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB6A2353;
	Mon, 25 Mar 2024 23:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB6A2353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405018;
	bh=Ui4/pc3t6yv4LKYzMgDyXcmrAS0utPOVaM6bIzs2a80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W/YKm4ElxEHtnYBEEUsMKnFp6PWMjHm02KKd90lLqGX+4QZyptCuVaZNqsTU7aOFu
	 n9kn3j/ApNwSfZS1b0FobkEq5Qiyysjf7Bx1bHraDyX1y2uDkviYp8WWhrZL5Anrn8
	 sla0cbwtQ4JxcFy3lTxUQFpwcYWpfu134L+yUSXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F2D6F89610; Mon, 25 Mar 2024 23:12:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55996F89616;
	Mon, 25 Mar 2024 23:12:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AFF6F805CB; Mon, 25 Mar 2024 23:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B85AF805E8
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B85AF805E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MAkshluq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404694; x=1742940694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ui4/pc3t6yv4LKYzMgDyXcmrAS0utPOVaM6bIzs2a80=;
  b=MAkshluqQ85lkSSGX9USQeAWOMSaSg5QJYBY+7G67dEd56QasbwcvkhF
   ixAH47X1fa0G1JlIMMZDUugNDaN9gAQ3z2d4YYj4pjnxwy+sbqrCNV6F8
   umUWA2ZE4MLtKluSZUVAC5AyFezB+tGHlmnfEBdgiJ6CuYIQ86dJhN5/+
   cMkwCXsEIIr+4oOzBdacV8fQ4yt63VWnhmJdFjvh/feUWkA//AWsBBnfy
   izO/avZOkEYgKa1cjoHUMZouRva5iN7eApjmeqSy347R/196jVG4ZfScs
   mLMyEJSdrtlflYL7xAxUzHTN7+F64fxssWsG8Qvvl4yE3f9AE5NBUp69G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643687"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643687"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722178"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/21] ASoC: Intel: sof_ssp_amp: remove unnecessary idisp HDMI
 quirk
Date: Mon, 25 Mar 2024 17:10:57 -0500
Message-Id: <20240325221059.206042-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RO4KXJ2S5ZZJBKRPVSXWDY3WTE33CTG3
X-Message-ID-Hash: RO4KXJ2S5ZZJBKRPVSXWDY3WTE33CTG3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RO4KXJ2S5ZZJBKRPVSXWDY3WTE33CTG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove SOF_NUM_IDISP_HDMI(3) from board quirks since the value is 3 if
not defined.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index b99af8bc4ccc..206c9b723805 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -152,8 +152,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	case CODEC_CS35L41:
 		cs35l41_set_codec_conf(&sof_ssp_amp_card);
 		break;
+	case CODEC_RT1308:
 	case CODEC_NONE:
-	case CODEC_RT1308:
 		/* no codec conf required */
 		break;
 	default:
@@ -196,21 +196,18 @@ static const struct platform_device_id board_ids[] = {
 		.name = "adl_lt6911_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "rpl_lt6911_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "mtl_lt6911_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{ }
-- 
2.40.1

