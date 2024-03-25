Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B607388B39A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4B2211B;
	Mon, 25 Mar 2024 23:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4B2211B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404767;
	bh=5xGjb3mnu+FiI3TfVRyt07oE/7KWxZ54qwPqhihYzu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ey/yBMbYCaMEwwPc5qnKeo6ty3lCKjXvaMWPP6yPKd0xf/NWIinwizfI6MXctdx1d
	 3b0V0rAzKDPsV2iD1affPuapWW/673A97ivk+ifvuCmVDsOk1Co76VA7FvYwHAJw2/
	 r+x0wM1z3UbPoSQ4WCTrv2adyUpsd7YvaDbruDKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA51FF80621; Mon, 25 Mar 2024 23:11:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B555DF80613;
	Mon, 25 Mar 2024 23:11:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 519BAF805C0; Mon, 25 Mar 2024 23:11:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98657F80563
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98657F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aTnhApyS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404685; x=1742940685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5xGjb3mnu+FiI3TfVRyt07oE/7KWxZ54qwPqhihYzu4=;
  b=aTnhApySvivHXEZvRQ/Uncvxa+SF8i9sZeM7zYykifgDEio7v8vQpe2A
   N3kqiAIRkddTs0Ix1p1UBSZE/4Zx5Jh2CZRQ7HjYPaAuWhYsji38uSAY7
   jTT6v2e8hzL+8mBo/01eMAZSoNrn6+eoj718EtscJJVweIAvgvJVcLfH2
   pZkRllE4Nh+L+MeedWJ7YzxeiCfoWxHqSGvx12uCMtiHjiJf4W8b68sj5
   3vDb/3jm6BOYqRUZbhITDJYF63J3XRcTtTz7ytxpmXsoEEu0utEfyY0Lr
   s1JgM5EYmv+hOSsuhmACAom0VW8crTnUwu0YRUPYLeIVLaWrB9K4tTfqe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643625"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643625"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722111"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/21] ASoC: Intel: sof_cs42l42: rename BT offload quirk
Date: Mon, 25 Mar 2024 17:10:44 -0500
Message-Id: <20240325221059.206042-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7X5NRYV6XPNNFY55B2AXTHOHURVHQLJC
X-Message-ID-Hash: 7X5NRYV6XPNNFY55B2AXTHOHURVHQLJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7X5NRYV6XPNNFY55B2AXTHOHURVHQLJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Rename the quirk in preparation for future changes: common quriks will
be defined and handled in board helper module.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 323b86c42ef9..330d596b2eb6 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -34,7 +34,7 @@
 #define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
 #define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
 	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_BT_OFFLOAD_PRESENT			BIT(25)
+#define SOF_CS42L42_BT_OFFLOAD_PRESENT		BIT(25)
 #define SOF_CS42L42_SSP_BT_SHIFT		26
 #define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
 #define SOF_CS42L42_SSP_BT(quirk)	\
@@ -268,7 +268,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
-	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
+	if (sof_cs42l42_quirk & SOF_CS42L42_BT_OFFLOAD_PRESENT)
 		ctx->bt_offload_present = true;
 
 	/* update dai_link */
@@ -306,7 +306,7 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
 				SOF_CS42L42_SSP_AMP(1) |
 				SOF_CS42L42_NUM_HDMIDEV(4) |
-				SOF_BT_OFFLOAD_PRESENT |
+				SOF_CS42L42_BT_OFFLOAD_PRESENT |
 				SOF_CS42L42_SSP_BT(2)),
 	},
 	{ }
-- 
2.40.1

