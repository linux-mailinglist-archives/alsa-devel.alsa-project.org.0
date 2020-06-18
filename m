Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8D1FDDE5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58451678;
	Thu, 18 Jun 2020 03:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58451678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443766;
	bh=kPxEmnmOMxuJtqjZV6a2AVPBdrlNhs4Uq5+RKIVKpaY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sq4OIaxv16sMBQO7m6n1UVrOFPgqYhPSYoO1CUS3ij+uTEbPhJZHYRJOGQMh63Pwq
	 mjatDq2AzDii8hMEweFQhlWkvAMhgSFEDKA8EUtVyLk5/6RQh9KBv+6RlUbpkbE30s
	 LWMJvEZfKHnADgZxTSSkbVEmtmICrE4rhupY+XsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40042F802FE;
	Thu, 18 Jun 2020 03:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CD59F803B1; Thu, 18 Jun 2020 03:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6A7F80305;
 Thu, 18 Jun 2020 03:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6A7F80305
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QNaUCmsx"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82601221F2;
 Thu, 18 Jun 2020 01:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442883;
 bh=kPxEmnmOMxuJtqjZV6a2AVPBdrlNhs4Uq5+RKIVKpaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QNaUCmsxjy3lRmut9fU0KMqHYXcJydVlkMIgQ1yp1DKL0gOFkGAPWSUrPbXr/BkLm
 ynBVrQa2t3S5b1QdeWrstSiKABP3ni617sM/BICtkVG8ZZH0zHirL7G/5EkeClanSU
 jcD3SLfBSLjgdyLHcf7A2Ru3kwBoC6y+Fd26mWZ0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 307/388] ASoC: SOF: Intel: hda: fix generic hda
 codec support
Date: Wed, 17 Jun 2020 21:06:44 -0400
Message-Id: <20200618010805.600873-307-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 89d73ccab20a684d8446cea4d8ac6a2608c8d390 ]

Add support for using generic codec driver with SOF. Generic driver
is used if:
 - snd_sof_intel_hda_common.hda_model="generic" is set, or
 - fallback if no other codec driver is found

The implementation is aligned with snd-hda-intel driver, and fixes audio
support for systems like Acer Swift 3 SF314-57G, on which this issue was
originally reported.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Hui Wang <hui.wang@canonical.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
BugLink: https://github.com/thesofproject/linux/issues/1807
BugLink: https://bugs.launchpad.net/bugs/1877757
Link: https://lore.kernel.org/r/20200529160358.12134-1-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda-codec.c | 51 +++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 3041fbbb010a..ea021db697b8 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -24,19 +24,44 @@
 #define IDISP_VID_INTEL	0x80860000
 
 /* load the legacy HDA codec driver */
-static int hda_codec_load_module(struct hda_codec *codec)
+static int request_codec_module(struct hda_codec *codec)
 {
 #ifdef MODULE
 	char alias[MODULE_NAME_LEN];
-	const char *module = alias;
+	const char *mod = NULL;
 
-	snd_hdac_codec_modalias(&codec->core, alias, sizeof(alias));
-	dev_dbg(&codec->core.dev, "loading codec module: %s\n", module);
-	request_module(module);
+	switch (codec->probe_id) {
+	case HDA_CODEC_ID_GENERIC:
+#if IS_MODULE(CONFIG_SND_HDA_GENERIC)
+		mod = "snd-hda-codec-generic";
 #endif
+		break;
+	default:
+		snd_hdac_codec_modalias(&codec->core, alias, sizeof(alias));
+		mod = alias;
+		break;
+	}
+
+	if (mod) {
+		dev_dbg(&codec->core.dev, "loading codec module: %s\n", mod);
+		request_module(mod);
+	}
+#endif /* MODULE */
 	return device_attach(hda_codec_dev(codec));
 }
 
+static int hda_codec_load_module(struct hda_codec *codec)
+{
+	int ret = request_codec_module(codec);
+
+	if (ret <= 0) {
+		codec->probe_id = HDA_CODEC_ID_GENERIC;
+		ret = request_codec_module(codec);
+	}
+
+	return ret;
+}
+
 /* enable controller wake up event for all codecs with jack connectors */
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
 {
@@ -78,6 +103,13 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
 EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
 EXPORT_SYMBOL_NS(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+#if IS_ENABLED(CONFIG_SND_HDA_GENERIC)
+#define is_generic_config(bus) \
+	((bus)->modelname && !strcmp((bus)->modelname, "generic"))
+#else
+#define is_generic_config(x)	0
+#endif
+
 /* probe individual codec */
 static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 			   bool hda_codec_use_common_hdmi)
@@ -87,6 +119,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_device *hdev;
+	struct hda_codec *codec;
 	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
 	u32 resp = -1;
@@ -108,6 +141,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 
 	hda_priv->codec.bus = hbus;
 	hdev = &hda_priv->codec.core;
+	codec = &hda_priv->codec;
 
 	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev);
 	if (ret < 0)
@@ -122,6 +156,11 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 		hda_priv->need_display_power = true;
 	}
 
+	if (is_generic_config(hbus))
+		codec->probe_id = HDA_CODEC_ID_GENERIC;
+	else
+		codec->probe_id = 0;
+
 	/*
 	 * if common HDMI codec driver is not used, codec load
 	 * is skipped here and hdac_hdmi is used instead
@@ -129,7 +168,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (hda_codec_use_common_hdmi ||
 	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
 		hdev->type = HDA_DEV_LEGACY;
-		ret = hda_codec_load_module(&hda_priv->codec);
+		ret = hda_codec_load_module(codec);
 		/*
 		 * handle ret==0 (no driver bound) as an error, but pass
 		 * other return codes without modification
-- 
2.25.1

