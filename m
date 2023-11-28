Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05D7FBA47
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 13:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2CC1F3;
	Tue, 28 Nov 2023 13:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2CC1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701175172;
	bh=7Lbzx4VBaCgA0END4fgHmnWy/gj8Gd4i3Yj/nCvYbPw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fCVq6I6FOd69VAg7eSKsQihjE2GBtdIdRacUp+DffoKvQgWAttATvYOhuz3vTF7Gt
	 DkPiOtPC3UFhi7e+uwxT5W365cwodpqqeORBVD7cMAEiXNbSfj7MGDLU4f3iNBWfak
	 cRD8ENa5D+js7BvnPYaD3qbgMIa1oEet9l19L7AY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35BD7F80578; Tue, 28 Nov 2023 13:38:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BACDF80254;
	Tue, 28 Nov 2023 13:38:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BA82F8016E; Tue, 28 Nov 2023 13:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6FCAF800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 13:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FCAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RTqsPc2i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701175128; x=1732711128;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7Lbzx4VBaCgA0END4fgHmnWy/gj8Gd4i3Yj/nCvYbPw=;
  b=RTqsPc2if5e5NTlH4D9UHSO26fZCmVeBUCGg4AiDN4NUw5Ao7fSgUCCx
   FToBkdq6e4wqdQRNrDHxhGUG+xp5CkrQGgEHiE0hW7F2mLgR6DfIk/8FY
   ggcnzDKnMyzrTBeno4MLsted0xRWeRmRdbQBjCVnnIJDETtttcfsy81tn
   W0GWBLW6PD+dNgVJYSXA1WhSQ719CPV+4wh+NaSN341CfFGYxSq5O/XX/
   aVGI835c3xdPW+wuQm4mJr0UjZhvOm/b5y9KTIFGkDconAmr1QbUtJlAK
   My6A/oajp9qckgXasHx541hvSDhE+kPzjkrmRmZIim1ezbgh/Ir8IoNmd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377941918"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="377941918"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 04:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015899204"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="1015899204"
Received: from anikafix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.221.103])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 04:38:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH v2] ASoC: hdac_hda: Conditionally register dais for HDMI and
 Analog
Date: Tue, 28 Nov 2023 14:39:14 +0200
Message-ID: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VYQJXAZHO2ZWC6B73V3Q72USD7A4CLQD
X-Message-ID-Hash: VYQJXAZHO2ZWC6B73V3Q72USD7A4CLQD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYQJXAZHO2ZWC6B73V3Q72USD7A4CLQD/>
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

Depends-on: 3d1dc8b1030d ("ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available")
Link: https://github.com/thesofproject/linux/issues/4509
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Changes since v1:
- Drop the patch for patch_hdmi to export a funtion to match the device
- Use the struct hdac_hda_priv.need_display_power boolean as indication that the
  device is a HDMI/DP audio codec

Regards,
Peter

 sound/soc/codecs/hdac_hda.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 355f30779a34..b075689db2dc 100644
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
@@ -607,8 +610,16 @@ static const struct snd_soc_component_driver hdac_hda_codec = {
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
+	struct hdac_hda_priv *hda_pvt = dev_get_drvdata(&hdev->dev);
 	struct hdac_ext_link *hlink;
 	int ret;
 
@@ -621,9 +632,15 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
 	/* ASoC specific initialization */
-	ret = devm_snd_soc_register_component(&hdev->dev,
-					 &hdac_hda_codec, hdac_hda_dais,
-					 ARRAY_SIZE(hdac_hda_dais));
+	if (hda_pvt->need_display_power)
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

