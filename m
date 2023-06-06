Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB0724F90
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 00:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A9683A;
	Wed,  7 Jun 2023 00:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A9683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686090467;
	bh=VkeqlGB3wXPwI5ihVJgjWYgOfSLYxnrXiEN/hdvVQbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lBF5Ffaf4WaAFdshz9JZzWdJQ0VbAbZPpXAsuo1cO1lRfT0QyVmTqDWg9fXbdIoFD
	 WPkEpZzF7X4MdrO9DV4eypezha1Xa3OSZMnbXsojDy0iL1BFKAA0COy9HAE3edvUaH
	 zmfPQfS9lKpijdhFZAV81r/SuRe7aC9Ju80+b8wE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242D6F80579; Wed,  7 Jun 2023 00:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FA2F8056F;
	Wed,  7 Jun 2023 00:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B956F8016C; Wed,  7 Jun 2023 00:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83EE5F8016C
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 00:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83EE5F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mGMGl95a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686090348; x=1717626348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VkeqlGB3wXPwI5ihVJgjWYgOfSLYxnrXiEN/hdvVQbM=;
  b=mGMGl95afnu8iUA/RNXesN7i18mTw/noN30FJ6soyZgTWm3CtmyrqflL
   VEec1BJlB7cgEc22oH15k/QLc4Z51yMlSAMU6tY0Ejm8Wl9E8AxsBvIcf
   B470OojuO/LESQSxyPM+JR+uI35U5U7jmaW1U7xsjVkCX9QjagAS6Kg36
   lp44HPBUBvHroII76soSQOxQu0LCUc0opfDjSN5WavM2JhXhdAzNiKwEg
   jXn2RMhtndHNCANlLCHqM0tKcOtCUl6IWKpJZSQc89+pnFiNwkCq0Yv2d
   SVL6DbiQbNh604LAs8DNu2+QUgwHli/ArKtPBr0grqZhdPaLAYDAKEceJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341465403"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="341465403"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712356551"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="712356551"
Received: from jrmonard-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.150.10])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:25:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/2] ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
Date: Tue,  6 Jun 2023 17:25:28 -0500
Message-Id: <20230606222529.57156-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
References: <20230606222529.57156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SRGJO5NMZ3Z76VXUHIX2P6A2GBSUIIDI
X-Message-ID-Hash: SRGJO5NMZ3Z76VXUHIX2P6A2GBSUIIDI
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRGJO5NMZ3Z76VXUHIX2P6A2GBSUIIDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The functionality described in Commit 61bef9e68dca ("ASoC: SOF: Intel: hda: enforce exclusion between HDaudio and SoundWire")
does not seem to be properly implemented with two issues that need to
be corrected.

a) The test used is incorrect when DisplayAudio codecs are not supported.

b) Conversely when only Display Audio codecs can be found, we do want
to start the SoundWire links, if any. That will help add the relevant
topologies and machine descriptors, and identify cases where the
SoundWire information in ACPI needs to be modified with a quirk.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b1db940f9f25..64bebe1a72bb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1391,12 +1391,22 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 			hda_mach->mach_params.dmic_num = dmic_num;
 			pdata->tplg_filename = tplg_filename;
 
-			if (codec_num == 2) {
+			if (codec_num == 2 ||
+			    (codec_num == 1 && !HDA_IDISP_CODEC(bus->codec_mask))) {
 				/*
 				 * Prevent SoundWire links from starting when an external
 				 * HDaudio codec is used
 				 */
 				hda_mach->mach_params.link_mask = 0;
+			} else {
+				/*
+				 * Allow SoundWire links to start when no external HDaudio codec
+				 * was detected. This will not create a SoundWire card but
+				 * will help detect if any SoundWire codec reports as ATTACHED.
+				 */
+				struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+				hda_mach->mach_params.link_mask = hdev->info.link_mask;
 			}
 
 			*mach = hda_mach;
-- 
2.37.2

