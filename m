Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837533DCDDB
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 23:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CD11816;
	Sun,  1 Aug 2021 23:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CD11816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627852025;
	bh=5XDA3hGaJWKny9Y/yQJWbHHSz/0UtfdcrcchcFQFyQo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amQ7O9TATh4OfUrdiKiXVLozwSN/Xo+RjVEuO1kbrf/elbdxQl2ov9Sh3tX+c9fgq
	 zQImrxTJiAmEDF7St07xcsSHdZYBqQg+EajIPCQK2aeaw79sXJR/Iy9+hH28bZsqse
	 +cd/Tj0XBCLQ/5+qCo4x/8948GkB9CFR3TKral3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67421F804E2;
	Sun,  1 Aug 2021 23:04:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07230F804AC; Sun,  1 Aug 2021 23:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C132F8032D
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 23:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C132F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="S2VpHKqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627851881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y59EHA3fDvvzvEhlJWTI3XS86dYGdQ4mqCUl5kMw7zs=;
 b=S2VpHKqMBEsPmWvCccga75XYLWjJbvJ6saf3099hg7MrggxwMcZRr+m1/ihdGaUlokCXye
 lvH4uswUIz/807RrUz94p9IPXi4fnFv3qtSjLUOzaNG5PhHTrfR/p4r8Xdzwy8Shea2+K2
 aFUvE0aOdDelznAZCgilGsVd/Nc0OdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-lPOv5XAGP2CvPcAGJWirHA-1; Sun, 01 Aug 2021 17:04:40 -0400
X-MC-Unique: lPOv5XAGP2CvPcAGJWirHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A699801B3D;
 Sun,  1 Aug 2021 21:04:39 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5C760C5A;
 Sun,  1 Aug 2021 21:04:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/6] ASoC: Intel: bytcr_rt5640: Add line-out support
Date: Sun,  1 Aug 2021 23:04:27 +0200
Message-Id: <20210801210431.161775-3-hdegoede@redhat.com>
In-Reply-To: <20210801210431.161775-1-hdegoede@redhat.com>
References: <20210801210431.161775-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

Add support for boards which use the codecs Line Out output, this can
be enabled by using the newly added BYT_RT5640_LINEOUT quirk.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 31 +++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index c403fb672594..e8a8f6b5ef96 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -73,6 +73,7 @@ enum {
 #define BYT_RT5640_MCLK_EN		BIT(22)
 #define BYT_RT5640_MCLK_25MHZ		BIT(23)
 #define BYT_RT5640_NO_SPEAKERS		BIT(24)
+#define BYT_RT5640_LINEOUT		BIT(25)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -139,6 +140,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk MONO_SPEAKER enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS)
 		dev_info(dev, "quirk NO_SPEAKERS enabled\n");
+	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
+		dev_info(dev, "quirk LINEOUT enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_DIFF_MIC)
 		dev_info(dev, "quirk DIFF_MIC enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) {
@@ -281,10 +284,10 @@ static const struct snd_soc_dapm_widget byt_rt5640_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMD),
-
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_audio_map[] = {
@@ -368,11 +371,18 @@ static const struct snd_soc_dapm_route byt_rt5640_mono_spk_map[] = {
 	{"Speaker", NULL, "SPOLN"},
 };
 
+static const struct snd_soc_dapm_route byt_rt5640_lineout_map[] = {
+	{"Line Out", NULL, "Platform Clock"},
+	{"Line Out", NULL, "LOUTR"},
+	{"Line Out", NULL, "LOUTL"},
+};
+
 static const struct snd_kcontrol_new byt_rt5640_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Internal Mic"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static struct snd_soc_jack_pin rt5640_pins[] = {
@@ -1056,6 +1066,14 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		return ret;
 
+	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT) {
+		ret = snd_soc_dapm_add_routes(&card->dapm,
+					byt_rt5640_lineout_map,
+					ARRAY_SIZE(byt_rt5640_lineout_map));
+		if (ret)
+			return ret;
+	}
+
 	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
 		/*
 		 * The firmware might enable the clock at
@@ -1221,7 +1239,7 @@ static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
 #endif
-static char byt_rt5640_components[32]; /* = "cfg-spk:* cfg-mic:*" */
+static char byt_rt5640_components[64]; /* = "cfg-spk:* cfg-mic:* ..." */
 
 static int byt_rt5640_suspend(struct snd_soc_card *card)
 {
@@ -1291,6 +1309,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3", "none" };
 	__maybe_unused const char *spk_type;
 	const struct dmi_system_id *dmi_id;
+	const char *lineout_string = "";
 	struct byt_rt5640_private *priv;
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
@@ -1453,9 +1472,13 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		spk_type = "stereo";
 	}
 
+	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
+		lineout_string = " cfg-lineout:1";
+
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
-		 "cfg-spk:%d cfg-mic:%s aif:%d", cfg_spk,
-		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)], aif);
+		 "cfg-spk:%d cfg-mic:%s aif:%d%s", cfg_spk,
+		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)], aif,
+		 lineout_string);
 	byt_rt5640_card.components = byt_rt5640_components;
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
-- 
2.31.1

