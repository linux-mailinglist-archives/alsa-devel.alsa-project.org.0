Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 745484F35DE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14F6A181A;
	Tue,  5 Apr 2022 15:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14F6A181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166899;
	bh=MjatEXGkPWpUP7SbP0LQt4G0Jpy9LyRZJ3CKykRy7n0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/TVGBFGSfe6Imz5Fr6dAJeid1Xcr6uNjAIzd7UO9aha6e6R/MH96F0gByidvHCJA
	 MIawahNzH/2SvHNyd4ckjs0Pb7ZZfTfrEOFoaBwz7mRbh68OtV2HgLUKCWdBjp0jbf
	 SoQvSGXW/T+uqUAvUNxjnPCXTZ30EwLMQODCnhrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA719F8049C;
	Tue,  5 Apr 2022 15:53:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54E82F8016A; Tue,  5 Apr 2022 15:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31190F8014B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31190F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xg/fbS7b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4480618D5;
 Tue,  5 Apr 2022 13:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EACC385A1;
 Tue,  5 Apr 2022 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649166801;
 bh=MjatEXGkPWpUP7SbP0LQt4G0Jpy9LyRZJ3CKykRy7n0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xg/fbS7bLgk0iHWDL2QcGSP7iEiuRr9OvORDQ0n9IDh5c0PKhYKsg/kYBttWGNYmp
 6mD7gLFF9zAcExkfNa5SmHRIXZl7FYjTK3gVZEwSsBVOPU/WayGV4c8ZMHuMWc+HW0
 WCiLSzjH3qsGfQBjDslYDCDM1VAqaT7Dctw7egRkWCYGo02jgxJwhQ83Z4m41AELnQ
 m6rZNWDJtgUeknduCb2kS1SXwa7X6DyJitQLOOZCAiCn1p9GcT3lWBEnPobXNYgWWX
 dX313wyjHli3JqGYZAgEd7+QZmOo1XjoLlets7VMmbD90nAzSmeKGTIZ4RZbJ6pLdt
 LQGntiPLGRHQw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nbjcV-001lTX-5L; Tue, 05 Apr 2022 15:53:19 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 RESEND 1/2] ASoC: Intel: sof_es8336: support a separate
 gpio to control headphone
Date: Tue,  5 Apr 2022 15:53:16 +0200
Message-Id: <02c5b525cced72fb14399a9e8120d84f85d7204d.1649166634.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649166634.git.mchehab@kernel.org>
References: <cover.1649166634.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Some devices may use both gpio0 and gpio1 to independently switch
the speaker and the headphone.

Add support for that.

Acked-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v2 RESEND 0/2] at: https://lore.kernel.org/all/cover.1649166634.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 60 ++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 5e0529aa4f1d..bcd80870d252 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -30,6 +30,7 @@
 #define SOF_ES8336_TGL_GPIO_QUIRK		BIT(4)
 #define SOF_ES8336_ENABLE_DMIC			BIT(5)
 #define SOF_ES8336_JD_INVERTED			BIT(6)
+#define SOF_ES8336_HEADPHONE_GPIO		BIT(7)
 
 static unsigned long quirk;
 
@@ -39,7 +40,7 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 struct sof_es8336_private {
 	struct device *codec_dev;
-	struct gpio_desc *gpio_pa;
+	struct gpio_desc *gpio_pa, *gpio_pa_headphone;
 	struct snd_soc_jack jack;
 	struct list_head hdmi_pcm_list;
 	bool speaker_en;
@@ -51,15 +52,28 @@ struct sof_hdmi_pcm {
 	int device;
 };
 
-static const struct acpi_gpio_params pa_enable_gpio = { 0, 0, true };
+static const struct acpi_gpio_params pa_enable_gpio0 = { 0, 0, true };
+static const struct acpi_gpio_params pa_enable_gpio1 = { 1, 0, true };
+
 static const struct acpi_gpio_mapping acpi_es8336_gpios[] = {
-	{ "pa-enable-gpios", &pa_enable_gpio, 1 },
+	{ "pa-enable-gpios", &pa_enable_gpio0, 1 },
 	{ }
 };
 
-static const struct acpi_gpio_params quirk_pa_enable_gpio = { 1, 0, true };
 static const struct acpi_gpio_mapping quirk_acpi_es8336_gpios[] = {
-	{ "pa-enable-gpios", &quirk_pa_enable_gpio, 1 },
+	{ "pa-enable-gpios", &pa_enable_gpio1, 1 },
+	{ }
+};
+
+static const struct acpi_gpio_mapping quirk_acpi_headphone_es8336_gpios[] = {
+	{ "pa-enable-gpios", &pa_enable_gpio0, 1 },
+	{ "pa-enable-headphone-gpios", &pa_enable_gpio1, 1 },
+	{ }
+};
+
+static const struct acpi_gpio_mapping quirk_tgl_acpi_headphone_es8336_gpios[] = {
+	{ "pa-enable-gpios", &pa_enable_gpio1, 1 },
+	{ "pa-enable-headphone-gpios", &pa_enable_gpio0, 1 },
 	{ }
 };
 
@@ -71,6 +85,8 @@ static void log_quirks(struct device *dev)
 	dev_info(dev, "quirk SSP%ld\n",  SOF_ES8336_SSP_CODEC(quirk));
 	if (quirk & SOF_ES8336_ENABLE_DMIC)
 		dev_info(dev, "quirk DMIC enabled\n");
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO)
+		dev_info(dev, "quirk headphone GPIO enabled\n");
 	if (quirk & SOF_ES8336_TGL_GPIO_QUIRK)
 		dev_info(dev, "quirk TGL GPIO enabled\n");
 	if (quirk & SOF_ES8336_JD_INVERTED)
@@ -83,13 +99,24 @@ static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_card *card = w->dapm->card;
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
+	if (priv->speaker_en == !SND_SOC_DAPM_EVENT_ON(event))
+		return 0;
+
+	priv->speaker_en = !SND_SOC_DAPM_EVENT_ON(event);
+
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		priv->speaker_en = false;
-	else
-		priv->speaker_en = true;
+		msleep(70);
 
 	gpiod_set_value_cansleep(priv->gpio_pa, priv->speaker_en);
 
+	if (!(quirk & SOF_ES8336_HEADPHONE_GPIO))
+		return 0;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		msleep(70);
+
+	gpiod_set_value_cansleep(priv->gpio_pa_headphone, priv->speaker_en);
+
 	return 0;
 }
 
@@ -114,7 +141,7 @@ static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
 
 	/*
 	 * There is no separate speaker output instead the speakers are muxed to
-	 * the HP outputs. The mux is controlled by the "Speaker Power" supply.
+	 * the HP outputs. The mux is controlled Speaker and/or headphone switch.
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
@@ -233,8 +260,14 @@ static int sof_es8336_quirk_cb(const struct dmi_system_id *id)
 {
 	quirk = (unsigned long)id->driver_data;
 
-	if (quirk & SOF_ES8336_TGL_GPIO_QUIRK)
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO) {
+		if (quirk & SOF_ES8336_TGL_GPIO_QUIRK)
+			gpio_mapping = quirk_tgl_acpi_headphone_es8336_gpios;
+		else
+			gpio_mapping = quirk_acpi_headphone_es8336_gpios;
+	} else if (quirk & SOF_ES8336_TGL_GPIO_QUIRK) {
 		gpio_mapping = quirk_acpi_es8336_gpios;
+	}
 
 	return 1;
 }
@@ -592,6 +625,13 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		goto err_put_codec;
 	}
 
+	priv->gpio_pa_headphone = gpiod_get_optional(codec_dev, "pa-enable-headphone", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpio_pa_headphone)) {
+		ret = dev_err_probe(dev, PTR_ERR(priv->gpio_pa_headphone),
+				    "could not get pa-enable-headphone GPIO\n");
+		goto err_put_codec;
+	}
+
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
 
 	snd_soc_card_set_drvdata(card, priv);
-- 
2.35.1

