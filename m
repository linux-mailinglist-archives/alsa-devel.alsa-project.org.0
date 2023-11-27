Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557E7FA4D9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DF0836;
	Mon, 27 Nov 2023 16:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DF0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099397;
	bh=ii0m9U9eGLM0JaSj4MdRpS4P7gneGNSwH3Z6Pu6Mn84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o49eVuynttZSXHRNtBLwEQ4JZjTRCHmlRnnmgRj7eiuypDSB5cgEDzf6Xj5nrACYH
	 9EjsXVQu0+tAm6QUb6VqKnZzI46eeQn4vkJ++nC6WybpBAUIx8Z+A6tUUVPQ/2qgki
	 YIxQOtKQH52rk3qpxw+anetn5aPfXm47NmhhP8YM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F4DAF80603; Mon, 27 Nov 2023 16:35:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACD52F805FB;
	Mon, 27 Nov 2023 16:35:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C52BF80570; Mon, 27 Nov 2023 16:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B61CBF80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61CBF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FhOHN19k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099322; x=1732635322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ii0m9U9eGLM0JaSj4MdRpS4P7gneGNSwH3Z6Pu6Mn84=;
  b=FhOHN19kAIEma2SZRWrbELYN6VfJKy6zJ4cAvcUkO3i62a/uZgB9NhMD
   iwJrB9KHS9sAYNuNSNTAAwu7hBOWQMSo2rzPZVPnb4Po8Cx89WdUYXXwR
   YHV5vhO0rSVTVOSK4EwH7h8K24lR4q5vpnG7UPY2mLl6GJtDN4h/QrzaW
   Qd3v3G9mBNiZtXCIMH7fFOUIp1AagME2+RqPUo61yFLtKIiQuvWreVxxp
   LmhjV/yidfG0pEeDMZfNJM67l+ZEYTHG/3VZxpDVsi2LkCVwprNR3QzXl
   nAM4H52Gd1OlbzwmwDi62xv5QwMmg9iV3YQPnSMVxgmxbYaz00herqZQ0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894367"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894367"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956165"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956165"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:22 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 01/27] ASoC: Intel: sof_ssp_amp: remove dead code
Date: Mon, 27 Nov 2023 17:26:28 +0200
Message-ID: <20231127152654.28204-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QWNLGL2NGOFCZV5K6IPZ3ENRCZHBZWDY
X-Message-ID-Hash: QWNLGL2NGOFCZV5K6IPZ3ENRCZHBZWDY
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWNLGL2NGOFCZV5K6IPZ3ENRCZHBZWDY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

This patch fixes a dead code problem when calculating BE ID for each
HDMI-In link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 137ba64254bc..22f37cf3a2ad 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -124,6 +124,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		/* the topology supports HDMI-IN uses fixed BE ID for DAI links */
 		fixed_be = true;
 
+		be_id = HDMI_IN_BE_ID;
 		for (i = 1; i <= num_of_hdmi_ssp; i++) {
 			int port = (i == 1 ? (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_1_SSP_MASK) >>
 						SOF_HDMI_CAPTURE_1_SSP_SHIFT :
@@ -138,7 +139,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
 			if (!links[id].name)
 				return NULL;
-			links[id].id = fixed_be ? (HDMI_IN_BE_ID + i - 1) : id;
+			links[id].id = be_id;
 			links[id].codecs = &snd_soc_dummy_dlc;
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
@@ -147,6 +148,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
+			be_id++;
 		}
 	}
 
-- 
2.43.0

