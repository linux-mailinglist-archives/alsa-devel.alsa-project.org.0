Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767D762B47
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 08:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998461CF;
	Wed, 26 Jul 2023 08:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998461CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690352380;
	bh=zeA33BKa8/o/DKqLCyRftnCpl8+VLyzMwsQTIM5tBwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m+vaBTp2lFEQmFRmRN8ElXKHISBpWtrIExCWnieYwZK79/VTZSXw49XEvSlJI0hC1
	 5QojgPXfFXtMGsVn/cHgvpKqHCiSyps96hPQ49VZZ2LTlKnJC7+eqj4X665XKQPyfV
	 LMkDqq0cgJBUOJc/BHl9fODSY5Y3v4ngXVrf0gv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADDAEF80571; Wed, 26 Jul 2023 08:18:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1635F8055B;
	Wed, 26 Jul 2023 08:18:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB1DF801F5; Wed, 26 Jul 2023 08:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4F55F8019B
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 08:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4F55F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TbMH2px3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690352116; x=1721888116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zeA33BKa8/o/DKqLCyRftnCpl8+VLyzMwsQTIM5tBwo=;
  b=TbMH2px3xt7QV/JGzACAsBsRgj1hUoUpiVsvVz6Q8QfXSg59GgleRN/4
   qbaQifAZGgZrRChbQsYlCMNcKe/xDlNgUJjcRJRqqz6CsB8+Yr6vgouNL
   As0FwW4RKxnZPxEpy/+g+J3xcBQunx4g7kxWGicvSVZzRn39JP7Y88DBy
   QGqnFsugDadBVOjLV3ZMU1myrfnfyl0u1NvTlhktF3Xw1hZhcHoPjRPO3
   2G01M+4v1arL/OuXhBIQOqfZj5O5KtsoL+ncIJHbSn6OLt5nfSQrE7KGd
   AAfFYRsRYUI5kO1rbg2u2fcifQlW9Rri8SjHrtOAcN7KDlFz1f0wz+pwe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="367950291"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="367950291"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="703606411"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="703606411"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2023 23:15:06 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] ASoC: Intel: sof_rt5682: remove
 SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag
Date: Wed, 26 Jul 2023 22:08:48 +0800
Message-Id: <20230726140848.2267568-3-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726140848.2267568-1-brent.lu@intel.com>
References: <20230726140848.2267568-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZKRSBFNDYWR7MVCR72JS3DONZKRVYO6
X-Message-ID-Hash: EZKRSBFNDYWR7MVCR72JS3DONZKRVYO6
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZKRSBFNDYWR7MVCR72JS3DONZKRVYO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove the SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag from driver since
the number of amplifiers could be queried from ACPI by counting the
device instance.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 37 ++---------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index b4f07bdcf8b4..9116f4df4752 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -59,7 +59,6 @@
 #define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
 #define SOF_RT5682S_HEADPHONE_CODEC_PRESENT	BIT(23)
 #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
-#define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
 #define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
 #define SOF_RT5650_HEADPHONE_CODEC_PRESENT	BIT(27)
 
@@ -195,23 +194,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S_4SPK"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98390_SPEAKER_AMP_PRESENT |
-					SOF_MAX98390_TWEETER_SPEAKER_PRESENT |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -850,17 +832,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			sof_rt1011_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
-			if (sof_rt5682_quirk &
-				SOF_MAX98390_TWEETER_SPEAKER_PRESENT) {
-				links[id].codecs = max_98390_4spk_components;
-				links[id].num_codecs = ARRAY_SIZE(max_98390_4spk_components);
-			} else {
-				links[id].codecs = max_98390_components;
-				links[id].num_codecs = ARRAY_SIZE(max_98390_components);
-			}
-			links[id].init = max_98390_spk_codec_init;
-			links[id].ops = &max_98390_ops;
-
+			max_98390_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
 			links[id].codecs = &rt5650_components[1];
 			links[id].num_codecs = 1;
@@ -1019,12 +991,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
-		if (sof_rt5682_quirk & SOF_MAX98390_TWEETER_SPEAKER_PRESENT)
-			max_98390_set_codec_conf(&sof_audio_card_rt5682,
-						 ARRAY_SIZE(max_98390_4spk_components));
-		else
-			max_98390_set_codec_conf(&sof_audio_card_rt5682,
-						 ARRAY_SIZE(max_98390_components));
+		max_98390_set_codec_conf(&sof_audio_card_rt5682);
 	}
 
 	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-- 
2.34.1

