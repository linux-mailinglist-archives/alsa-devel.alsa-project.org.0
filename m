Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB03AAF25
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 10:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1AF16C5;
	Thu, 17 Jun 2021 10:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1AF16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623920104;
	bh=TJ94BIc5Y/rI2h8Plvg8qnFJbpAIpk49tsKvsh5vr7k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0XlVADmdyD16Q2V1FEGe4Ha/IJnUoY/IfeKkz3YLw54AGlR6y1EGmXGHRSbpQ4Dn
	 JYep9ScMFR74Zq+dwYDYWTUmjKxmoSwM7FCcqxzKxZW6ak9OdRTvXe9FitV8yoi0MK
	 CWbaHft/0YWXwZo2TGrOPQMhN/WM07kHc8adn/Cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F86EF804DA;
	Thu, 17 Jun 2021 10:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D3C8F804D2; Thu, 17 Jun 2021 10:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE2DDF8028B
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE2DDF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="xb1oiVBU"
Received: from localhost (dslb-084-062-104-230.084.062.pools.vodafone-ip.de
 [84.62.104.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: ch@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 66EDB81E1C;
 Thu, 17 Jun 2021 10:52:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623919967;
 bh=GkYhVu6GmZrM4digSTjDrFnhz57dLng0Yt11YKVUd7Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=xb1oiVBUirW44xdRE9GYg6l64bFXK0ng/3xMS7zmJPHEW7RdR6xIypK+FhB9W5UUH
 e8YhH7R+Yj1+NGiMLKB7Kh1+P/5UUSNKEocUx2XJbyYrVNtX0qGHMkcMQjLe40h5Nv
 Q5kcsqfg6L/1dc/z6kvPbKzj3+RjOb/oQPoOfrTfAhngEHqdHWiZT/0ceiSpYM8Ne1
 0HZv6lXympUSVaNFdu5uP00pAvAk6rWjv8BhZA5d9xo/Lb5/RGxIO5putpczMPIbwn
 PQ71vVPO+qrJ/A+Lm6ZT30RLiMQjlkcq88VTWVE2MszI23vKSmR+L3/RDE/EWEYYVT
 TJU6NljJyktcQ==
From: Claudius Heine <ch@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>,
 Claudius Heine <ch@denx.de>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Annaliese McDermond <nh6z@nh6z.net>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] ASoC: tlv320aic32x4: add support for TAS2505
Date: Thu, 17 Jun 2021 10:52:29 +0200
Message-Id: <20210617085230.1851503-3-ch@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617085230.1851503-1-ch@denx.de>
References: <20210617085230.1851503-1-ch@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

This adds support for TAS2505 and TAS2521 to the tlv320aic32x4 driver.

The TAS2505 seems to be a stripped down version of the TLV320AIC32X4 so
it makes sense to handle them in the same driver.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 sound/soc/codecs/tlv320aic32x4-i2c.c |   2 +
 sound/soc/codecs/tlv320aic32x4.c     | 136 ++++++++++++++++++++++++++-
 sound/soc/codecs/tlv320aic32x4.h     |   5 +
 3 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 247fb1e13674..04ad38311360 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -50,6 +50,7 @@ static int aic32x4_i2c_remove(struct i2c_client *i2c)
 static const struct i2c_device_id aic32x4_i2c_id[] = {
 	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
 	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
+	{ "tas2505", (kernel_ulong_t)AIC32X4_TYPE_TAS2505 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, aic32x4_i2c_id);
@@ -57,6 +58,7 @@ MODULE_DEVICE_TABLE(i2c, aic32x4_i2c_id);
 static const struct of_device_id aic32x4_of_id[] = {
 	{ .compatible = "ti,tlv320aic32x4", .data = (void *)AIC32X4_TYPE_AIC32X4 },
 	{ .compatible = "ti,tlv320aic32x6", .data = (void *)AIC32X4_TYPE_AIC32X6 },
+	{ .compatible = "ti,tas2505", .data = (void *)AIC32X4_TYPE_TAS2505 },
 	{ /* senitel */ }
 };
 MODULE_DEVICE_TABLE(of, aic32x4_of_id);
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 70a1574fb72a..c63b717040ed 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -251,6 +251,9 @@ static DECLARE_TLV_DB_SCALE(tlv_driver_gain, -600, 100, 0);
 /* -12dB min, 0.5dB steps */
 static DECLARE_TLV_DB_SCALE(tlv_adc_vol, -1200, 50, 0);
 
+static DECLARE_TLV_DB_LINEAR(tlv_spk_vol, TLV_DB_GAIN_MUTE, 0);
+static DECLARE_TLV_DB_SCALE(tlv_amp_vol, 0, 600, 1);
+
 static const char * const lo_cm_text[] = {
 	"Full Chip", "1.65V",
 };
@@ -1059,6 +1062,129 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 	.non_legacy_dai_naming	= 1,
 };
 
+static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
+	SOC_DOUBLE_R_S_TLV("PCM Playback Volume", AIC32X4_LDACVOL,
+			AIC32X4_LDACVOL, 0, -0x7f, 0x30, 7, 0, tlv_pcm),
+	SOC_ENUM("DAC Playback PowerTune Switch", l_ptm_enum),
+	SOC_DOUBLE_R_S_TLV("HP Driver Playback Volume", AIC32X4_HPLGAIN,
+			AIC32X4_HPLGAIN, 0, -0x6, 0x1d, 5, 0,
+			tlv_driver_gain),
+	SOC_DOUBLE_R("HP DAC Playback Switch", AIC32X4_HPLGAIN,
+			AIC32X4_HPLGAIN, 6, 0x01, 1),
+
+	SOC_SINGLE("Auto-mute Switch", AIC32X4_DACMUTE, 4, 7, 0),
+
+	SOC_SINGLE_RANGE_TLV("Speaker Driver Playback Volume", TAS2505_SPKVOL1,
+			0, 0, 117, 1, tlv_spk_vol),
+	SOC_SINGLE_TLV("Speaker Amplifier Playback Volume", TAS2505_SPKVOL2,
+			4, 5, 0, tlv_amp_vol),
+};
+
+static const struct snd_kcontrol_new hp_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("DAC Switch", AIC32X4_HPLROUTE, 3, 1, 0),
+};
+
+static const struct snd_soc_dapm_widget aic32x4_tas2505_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC("DAC", "Playback", AIC32X4_DACSETUP, 7, 0),
+	SND_SOC_DAPM_MIXER("HP Output Mixer", SND_SOC_NOPM, 0, 0,
+			   &hp_output_mixer_controls[0],
+			   ARRAY_SIZE(hp_output_mixer_controls)),
+	SND_SOC_DAPM_PGA("HP Power", AIC32X4_OUTPWRCTL, 5, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA("Speaker Driver", TAS2505_SPK, 1, 0, NULL, 0),
+
+	SND_SOC_DAPM_OUTPUT("HP"),
+	SND_SOC_DAPM_OUTPUT("Speaker"),
+};
+
+static const struct snd_soc_dapm_route aic32x4_tas2505_dapm_routes[] = {
+	/* Left Output */
+	{"HP Output Mixer", "DAC Switch", "DAC"},
+
+	{"HP Power", NULL, "HP Output Mixer"},
+	{"HP", NULL, "HP Power"},
+
+	{"Speaker Driver", NULL, "DAC"},
+	{"Speaker", NULL, "Speaker Driver"},
+};
+
+static struct snd_soc_dai_driver aic32x4_tas2505_dai = {
+	.name = "tas2505-hifi",
+	.playback = {
+			 .stream_name = "Playback",
+			 .channels_min = 1,
+			 .channels_max = 1,
+			 .rates = SNDRV_PCM_RATE_8000_96000,
+			 .formats = AIC32X4_FORMATS,},
+	.ops = &aic32x4_ops,
+	.symmetric_rate = 1,
+};
+
+static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
+{
+	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
+	u32 tmp_reg;
+	int ret;
+
+	struct clk_bulk_data clocks[] = {
+		{ .id = "codec_clkin" },
+		{ .id = "pll" },
+		{ .id = "bdiv" },
+		{ .id = "mdac" },
+	};
+
+	ret = devm_clk_bulk_get(component->dev, ARRAY_SIZE(clocks), clocks);
+	if (ret)
+		return ret;
+
+	if (aic32x4->setup)
+		aic32x4_setup_gpios(component);
+
+	clk_set_parent(clocks[0].clk, clocks[1].clk);
+	clk_set_parent(clocks[2].clk, clocks[3].clk);
+
+	/* Power platform configuration */
+	if (aic32x4->power_cfg & AIC32X4_PWR_AVDD_DVDD_WEAK_DISABLE)
+		snd_soc_component_write(component, AIC32X4_PWRCFG, AIC32X4_AVDDWEAKDISABLE);
+
+	tmp_reg = (aic32x4->power_cfg & AIC32X4_PWR_AIC32X4_LDO_ENABLE) ?
+			AIC32X4_LDOCTLEN : 0;
+	snd_soc_component_write(component, AIC32X4_LDOCTL, tmp_reg);
+
+	tmp_reg = snd_soc_component_read(component, AIC32X4_CMMODE);
+	if (aic32x4->power_cfg & AIC32X4_PWR_CMMODE_LDOIN_RANGE_18_36)
+		tmp_reg |= AIC32X4_LDOIN_18_36;
+	if (aic32x4->power_cfg & AIC32X4_PWR_CMMODE_HP_LDOIN_POWERED)
+		tmp_reg |= AIC32X4_LDOIN2HP;
+	snd_soc_component_write(component, AIC32X4_CMMODE, tmp_reg);
+
+	/*
+	 * Enable the fast charging feature and ensure the needed 40ms ellapsed
+	 * before using the analog circuits.
+	 */
+	snd_soc_component_write(component, TAS2505_REFPOWERUP,
+				AIC32X4_REFPOWERUP_40MS);
+	msleep(40);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 = {
+	.probe			= aic32x4_tas2505_component_probe,
+	.set_bias_level		= aic32x4_set_bias_level,
+	.controls		= aic32x4_tas2505_snd_controls,
+	.num_controls		= ARRAY_SIZE(aic32x4_tas2505_snd_controls),
+	.dapm_widgets		= aic32x4_tas2505_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(aic32x4_tas2505_dapm_widgets),
+	.dapm_routes		= aic32x4_tas2505_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(aic32x4_tas2505_dapm_routes),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
 static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
 		struct device_node *np)
 {
@@ -1250,8 +1376,16 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 	if (ret)
 		goto err_disable_regulators;
 
-	ret = devm_snd_soc_register_component(dev,
+	switch (aic32x4->type) {
+	case AIC32X4_TYPE_TAS2505:
+		ret = devm_snd_soc_register_component(dev,
+			&soc_component_dev_aic32x4_tas2505, &aic32x4_tas2505_dai, 1);
+		break;
+	default:
+		ret = devm_snd_soc_register_component(dev,
 			&soc_component_dev_aic32x4, &aic32x4_dai, 1);
+	}
+
 	if (ret) {
 		dev_err(dev, "Failed to register component\n");
 		goto err_disable_regulators;
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index 8a18dbec76a6..e9fd2e55d6c3 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -13,6 +13,7 @@ struct regmap_config;
 enum aic32x4_type {
 	AIC32X4_TYPE_AIC32X4 = 0,
 	AIC32X4_TYPE_AIC32X6,
+	AIC32X4_TYPE_TAS2505,
 };
 
 extern const struct regmap_config aic32x4_regmap_config;
@@ -93,6 +94,9 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define	AIC32X4_LOLGAIN		AIC32X4_REG(1, 18)
 #define	AIC32X4_LORGAIN		AIC32X4_REG(1, 19)
 #define AIC32X4_HEADSTART	AIC32X4_REG(1, 20)
+#define TAS2505_SPK		AIC32X4_REG(1, 45)
+#define TAS2505_SPKVOL1		AIC32X4_REG(1, 46)
+#define TAS2505_SPKVOL2		AIC32X4_REG(1, 48)
 #define AIC32X4_MICBIAS		AIC32X4_REG(1, 51)
 #define AIC32X4_LMICPGAPIN	AIC32X4_REG(1, 52)
 #define AIC32X4_LMICPGANIN	AIC32X4_REG(1, 54)
@@ -101,6 +105,7 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define AIC32X4_FLOATINGINPUT	AIC32X4_REG(1, 58)
 #define AIC32X4_LMICPGAVOL	AIC32X4_REG(1, 59)
 #define AIC32X4_RMICPGAVOL	AIC32X4_REG(1, 60)
+#define TAS2505_REFPOWERUP	AIC32X4_REG(1, 122)
 #define AIC32X4_REFPOWERUP	AIC32X4_REG(1, 123)
 
 /* Bits, masks, and shifts */
-- 
2.32.0

