Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899097FA046
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B960ADF5;
	Mon, 27 Nov 2023 14:03:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B960ADF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701090239;
	bh=tdXAxvH7Hfxz56Ii672gQKi1RhYlx5nPdd2W5+fHr7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L6NGoY2G+qdIyBbQR5Ysr6km01FFzbw3BlO2uvOhQVV1U7Fc03TLdqx7yNk2Otj13
	 h4yA+iliQG6fRx7SjN1Js7IG3o72dHKQjfm17Re7irV/DdiwEdtJY30Qqt8lBqD9Pd
	 Lg5pNS4KhrX1y0QQkeXIYJL4Gs7raPQzH3lWkEaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F87FF805EA; Mon, 27 Nov 2023 14:03:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD2AF805E7;
	Mon, 27 Nov 2023 14:03:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E544F8059F; Mon, 27 Nov 2023 14:02:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF94EF800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF94EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mTQHMXt/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701090173; x=1732626173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tdXAxvH7Hfxz56Ii672gQKi1RhYlx5nPdd2W5+fHr7s=;
  b=mTQHMXt/PK5EnazeFAjlW5Rl5UABp12AWNCNO5x15qbQGsWcIM1jdsqT
   DgIzzdC6e2JdDe6WUkCoLPsBZ6jMndUsu6AfBMMg2TC3pSupaEjry5G7v
   ITY1W/7AXKS5bhabNnhAddNXLJaz0/aE4LO0JtFMBu7+7bQ7DeYqJX9Je
   hwMUcbdKw4juBYjBPa/Lfwa2gIL4J4DovMXgeDCUfuruSuSgNkbsO/awG
   qcTdOjZsAOsk+JH/699f8hhf5PwgSTS+sH/tPL/fv3R+KflkEAagTWDBh
   kD3PlM9BxZ/FeznfeVDGge6ZO57k1YjuSag2amOAfToU2Gd1mWxfN2p6t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391568083"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="391568083"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797228729"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="797228729"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:02:16 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/2] ASoC: hdac_hda: Conditionally register dais for HDMI and
 Analog
Date: Mon, 27 Nov 2023 15:02:45 +0200
Message-ID: <20231127130245.24295-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2HRUJXEJ2TQIDSDJUDQGUF5L63NRI4X2
X-Message-ID-Hash: 2HRUJXEJ2TQIDSDJUDQGUF5L63NRI4X2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HRUJXEJ2TQIDSDJUDQGUF5L63NRI4X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current driver is registering the same dais for each hdev found in the
system which results duplicated widgets to be registered and the kernel
log contains similar prints:
snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten

To avoid such issue, split the dai array into HDMI and non HDMI array and
register them conditionally:
for HDMI hdev only register the dais needed for HDMI
for non HDMI hdev do not  register the HDMI dais.

Link: https://github.com/thesofproject/linux/issues/4509
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 355f30779a34..72916a387ad6 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -132,6 +132,9 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
 		.sig_bits = 24,
 	},
 },
+};
+
+static struct snd_soc_dai_driver hdac_hda_hdmi_dais[] = {
 {
 	.id = HDAC_HDMI_0_DAI_ID,
 	.name = "intel-hdmi-hifi1",
@@ -607,6 +610,13 @@ static const struct snd_soc_component_driver hdac_hda_codec = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver hdac_hda_hdmi_codec = {
+	.probe			= hdac_hda_codec_probe,
+	.remove			= hdac_hda_codec_remove,
+	.idle_bias_on		= false,
+	.endianness		= 1,
+};
+
 static int hdac_hda_dev_probe(struct hdac_device *hdev)
 {
 	struct hdac_ext_link *hlink;
@@ -621,9 +631,15 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
 	/* ASoC specific initialization */
-	ret = devm_snd_soc_register_component(&hdev->dev,
-					 &hdac_hda_codec, hdac_hda_dais,
-					 ARRAY_SIZE(hdac_hda_dais));
+	if (snd_hda_device_is_hdmi(hdev))
+		ret = devm_snd_soc_register_component(&hdev->dev,
+						&hdac_hda_hdmi_codec, hdac_hda_hdmi_dais,
+						ARRAY_SIZE(hdac_hda_hdmi_dais));
+	else
+		ret = devm_snd_soc_register_component(&hdev->dev,
+						&hdac_hda_codec, hdac_hda_dais,
+						ARRAY_SIZE(hdac_hda_dais));
+
 	if (ret < 0) {
 		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
 		return ret;
-- 
2.43.0

