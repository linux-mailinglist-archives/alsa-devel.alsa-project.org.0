Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACA12A8DB
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 19:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C883116DE;
	Wed, 25 Dec 2019 19:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C883116DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577298367;
	bh=uA1Ivtbtc73ekF1mzvD918xPRYHyWTJd//OmhCq5HPs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hezheo4aH/PH6mpKJ7SvWcxO6Hv3Hje9ijuHnmNp9n+6fGTcGu/IBoConV3tUMB0H
	 Bdel2WZqgOdvJJtNN9ktc5teSPl9k89VeCpEkpP/N0qF4neQJ7XA08sIitTKLrD5Qf
	 yUHItPYoFCYh4ur3uIR2gwijvBpO71QSn/d8qQqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F669F8027D;
	Wed, 25 Dec 2019 19:22:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14712F8026F; Wed, 25 Dec 2019 19:21:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68217F80146
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 19:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68217F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AqQ16Y1s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pxn/ieVyTSiVCErDygLj0SpEorvFVkKpreUL5AlGLyU=; b=AqQ16Y1scX8i
 6L9CgwrYdEKfkNhrRWHzzfBzSZwg5QXTem4/au47zSmSgQ9qyTc9LUdXQZpg8pd+zeYiBPxngPEaq
 QUVrDYajTF5pnC06JIqS/RabXcxASnJ/Z1idoEs+HwD1zHqUdlsmIY3dwt7txiCDIgTmoLA/j3rDF
 DDqYQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikBI8-0001oS-0J; Wed, 25 Dec 2019 18:21:52 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 803A2D01A24; Wed, 25 Dec 2019 18:21:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Date: Wed, 25 Dec 2019 18:21:51 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: wcd934x: add basic controls" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wcd934x: add basic controls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1cde8b82233275a72db34a8c1efa4cf6cc8c894f Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 19 Dec 2019 10:31:46 +0000
Subject: [PATCH] ASoC: wcd934x: add basic controls

This patch adds basic controls found in wcd934x codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20191219103153.14875-5-srinivas.kandagatla@linaro.org
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 506 +++++++++++++++++++++++++++++++++++++
 1 file changed, 506 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 825cf057e8b7..27a864f2ff77 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -120,6 +120,21 @@
 #define WCD934X_DEF_MICBIAS_MV	1800
 #define WCD934X_MAX_MICBIAS_MV	2850
 
+#define WCD_IIR_FILTER_SIZE	(sizeof(u32) * BAND_MAX)
+
+#define WCD_IIR_FILTER_CTL(xname, iidx, bidx) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = wcd934x_iir_filter_info, \
+	.get = wcd934x_get_iir_band_audio_mixer, \
+	.put = wcd934x_put_iir_band_audio_mixer, \
+	.private_value = (unsigned long)&(struct wcd_iir_filter_ctl) { \
+		.iir_idx = iidx, \
+		.band_idx = bidx, \
+		.bytes_ext = {.max = WCD_IIR_FILTER_SIZE, }, \
+	} \
+}
+
 enum {
 	SIDO_SOURCE_INTERNAL,
 	SIDO_SOURCE_RCO_BG,
@@ -217,6 +232,35 @@ static const struct wcd934x_slim_ch wcd934x_rx_chs[WCD934X_RX_MAX] = {
 	WCD934X_SLIM_RX_CH(12),
 };
 
+/* Codec supports 2 IIR filters */
+enum {
+	IIR0 = 0,
+	IIR1,
+	IIR_MAX,
+};
+
+/* Each IIR has 5 Filter Stages */
+enum {
+	BAND1 = 0,
+	BAND2,
+	BAND3,
+	BAND4,
+	BAND5,
+	BAND_MAX,
+};
+
+enum {
+	COMPANDER_1, /* HPH_L */
+	COMPANDER_2, /* HPH_R */
+	COMPANDER_3, /* LO1_DIFF */
+	COMPANDER_4, /* LO2_DIFF */
+	COMPANDER_5, /* LO3_SE - not used in Tavil */
+	COMPANDER_6, /* LO4_SE - not used in Tavil */
+	COMPANDER_7, /* SWR SPK CH1 */
+	COMPANDER_8, /* SWR SPK CH2 */
+	COMPANDER_MAX,
+};
+
 enum {
 	AIF1_PB = 0,
 	AIF1_CAP,
@@ -335,12 +379,112 @@ struct wcd934x_codec {
 	int dmic_2_3_clk_cnt;
 	int dmic_4_5_clk_cnt;
 	int dmic_sample_rate;
+	int comp_enabled[COMPANDER_MAX];
 	int sysclk_users;
 	struct mutex sysclk_mutex;
 };
 
 #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, hw)
 
+struct wcd_iir_filter_ctl {
+	unsigned int iir_idx;
+	unsigned int band_idx;
+	struct soc_bytes_ext bytes_ext;
+};
+
+static const DECLARE_TLV_DB_SCALE(digital_gain, 0, 1, 0);
+static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
+static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
+static const DECLARE_TLV_DB_SCALE(ear_pa_gain, 0, 150, 0);
+
+/* Cutoff frequency for high pass filter */
+static const char * const cf_text[] = {
+	"CF_NEG_3DB_4HZ", "CF_NEG_3DB_75HZ", "CF_NEG_3DB_150HZ"
+};
+
+static const char * const rx_cf_text[] = {
+	"CF_NEG_3DB_4HZ", "CF_NEG_3DB_75HZ", "CF_NEG_3DB_150HZ",
+	"CF_NEG_3DB_0P48HZ"
+};
+
+static const char * const rx_hph_mode_mux_text[] = {
+	"Class H Invalid", "Class-H Hi-Fi", "Class-H Low Power", "Class-AB",
+	"Class-H Hi-Fi Low Power"
+};
+
+static const struct soc_enum cf_dec0_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX0_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX1_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec2_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX2_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec3_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX3_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec4_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX4_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec5_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX5_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec6_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX6_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec7_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX7_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_dec8_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_TX8_TX_PATH_CFG0, 5, 3, cf_text);
+
+static const struct soc_enum cf_int0_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX0_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int0_2_enum, WCD934X_CDC_RX0_RX_PATH_MIX_CFG, 2,
+		     rx_cf_text);
+
+static const struct soc_enum cf_int1_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX1_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int1_2_enum, WCD934X_CDC_RX1_RX_PATH_MIX_CFG, 2,
+		     rx_cf_text);
+
+static const struct soc_enum cf_int2_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX2_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int2_2_enum, WCD934X_CDC_RX2_RX_PATH_MIX_CFG, 2,
+		     rx_cf_text);
+
+static const struct soc_enum cf_int3_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX3_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int3_2_enum, WCD934X_CDC_RX3_RX_PATH_MIX_CFG, 2,
+			    rx_cf_text);
+
+static const struct soc_enum cf_int4_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX4_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int4_2_enum, WCD934X_CDC_RX4_RX_PATH_MIX_CFG, 2,
+			    rx_cf_text);
+
+static const struct soc_enum cf_int7_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX7_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int7_2_enum, WCD934X_CDC_RX7_RX_PATH_MIX_CFG, 2,
+			    rx_cf_text);
+
+static const struct soc_enum cf_int8_1_enum =
+	SOC_ENUM_SINGLE(WCD934X_CDC_RX8_RX_PATH_CFG2, 0, 4, rx_cf_text);
+
+static SOC_ENUM_SINGLE_DECL(cf_int8_2_enum, WCD934X_CDC_RX8_RX_PATH_MIX_CFG, 2,
+			    rx_cf_text);
+
+static const struct soc_enum rx_hph_mode_mux_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(rx_hph_mode_mux_text),
+			    rx_hph_mode_mux_text);
+
 static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd,
 				      int sido_src)
 {
@@ -1479,10 +1623,372 @@ static int wcd934x_comp_set_sysclk(struct snd_soc_component *comp,
 	return clk_set_rate(wcd->extclk, freq);
 }
 
+static uint32_t get_iir_band_coeff(struct snd_soc_component *component,
+				   int iir_idx, int band_idx, int coeff_idx)
+{
+	u32 value = 0;
+	int reg, b2_reg;
+
+	/* Address does not automatically update if reading */
+	reg = WCD934X_CDC_SIDETONE_IIR0_IIR_COEF_B1_CTL + 16 * iir_idx;
+	b2_reg = WCD934X_CDC_SIDETONE_IIR0_IIR_COEF_B2_CTL + 16 * iir_idx;
+
+	snd_soc_component_write(component, reg,
+				((band_idx * BAND_MAX + coeff_idx) *
+				 sizeof(uint32_t)) & 0x7F);
+
+	value |= snd_soc_component_read32(component, b2_reg);
+	snd_soc_component_write(component, reg,
+				((band_idx * BAND_MAX + coeff_idx)
+				 * sizeof(uint32_t) + 1) & 0x7F);
+
+	value |= (snd_soc_component_read32(component, b2_reg) << 8);
+	snd_soc_component_write(component, reg,
+				((band_idx * BAND_MAX + coeff_idx)
+				 * sizeof(uint32_t) + 2) & 0x7F);
+
+	value |= (snd_soc_component_read32(component, b2_reg) << 16);
+	snd_soc_component_write(component, reg,
+		((band_idx * BAND_MAX + coeff_idx)
+		* sizeof(uint32_t) + 3) & 0x7F);
+
+	/* Mask bits top 2 bits since they are reserved */
+	value |= (snd_soc_component_read32(component, b2_reg) << 24);
+	return value;
+}
+
+static void set_iir_band_coeff(struct snd_soc_component *component,
+			       int iir_idx, int band_idx, uint32_t value)
+{
+	int reg = WCD934X_CDC_SIDETONE_IIR0_IIR_COEF_B2_CTL + 16 * iir_idx;
+
+	snd_soc_component_write(component, reg, (value & 0xFF));
+	snd_soc_component_write(component, reg, (value >> 8) & 0xFF);
+	snd_soc_component_write(component, reg, (value >> 16) & 0xFF);
+	/* Mask top 2 bits, 7-8 are reserved */
+	snd_soc_component_write(component, reg, (value >> 24) & 0x3F);
+}
+
+static int wcd934x_put_iir_band_audio_mixer(
+					struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wcd_iir_filter_ctl *ctl =
+			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
+	struct soc_bytes_ext *params = &ctl->bytes_ext;
+	int iir_idx = ctl->iir_idx;
+	int band_idx = ctl->band_idx;
+	u32 coeff[BAND_MAX];
+	int reg = WCD934X_CDC_SIDETONE_IIR0_IIR_COEF_B1_CTL + 16 * iir_idx;
+
+	memcpy(&coeff[0], ucontrol->value.bytes.data, params->max);
+
+	/* Mask top bit it is reserved */
+	/* Updates addr automatically for each B2 write */
+	snd_soc_component_write(component, reg, (band_idx * BAND_MAX *
+						 sizeof(uint32_t)) & 0x7F);
+
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[0]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[1]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[2]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[3]);
+	set_iir_band_coeff(component, iir_idx, band_idx, coeff[4]);
+
+	return 0;
+}
+
+static int wcd934x_get_iir_band_audio_mixer(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wcd_iir_filter_ctl *ctl =
+			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
+	struct soc_bytes_ext *params = &ctl->bytes_ext;
+	int iir_idx = ctl->iir_idx;
+	int band_idx = ctl->band_idx;
+	u32 coeff[BAND_MAX];
+
+	coeff[0] = get_iir_band_coeff(component, iir_idx, band_idx, 0);
+	coeff[1] = get_iir_band_coeff(component, iir_idx, band_idx, 1);
+	coeff[2] = get_iir_band_coeff(component, iir_idx, band_idx, 2);
+	coeff[3] = get_iir_band_coeff(component, iir_idx, band_idx, 3);
+	coeff[4] = get_iir_band_coeff(component, iir_idx, band_idx, 4);
+
+	memcpy(ucontrol->value.bytes.data, &coeff[0], params->max);
+
+	return 0;
+}
+
+static int wcd934x_iir_filter_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *ucontrol)
+{
+	struct wcd_iir_filter_ctl *ctl =
+		(struct wcd_iir_filter_ctl *)kcontrol->private_value;
+	struct soc_bytes_ext *params = &ctl->bytes_ext;
+
+	ucontrol->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	ucontrol->count = params->max;
+
+	return 0;
+}
+
+static int wcd934x_compander_get(struct snd_kcontrol *kc,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	int comp = ((struct soc_mixer_control *)kc->private_value)->shift;
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+
+	ucontrol->value.integer.value[0] = wcd->comp_enabled[comp];
+
+	return 0;
+}
+
+static int wcd934x_compander_set(struct snd_kcontrol *kc,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+	int comp = ((struct soc_mixer_control *)kc->private_value)->shift;
+	int value = ucontrol->value.integer.value[0];
+	int sel;
+
+	wcd->comp_enabled[comp] = value;
+	sel = value ? WCD934X_HPH_GAIN_SRC_SEL_COMPANDER :
+		WCD934X_HPH_GAIN_SRC_SEL_REGISTER;
+
+	/* Any specific register configuration for compander */
+	switch (comp) {
+	case COMPANDER_1:
+		/* Set Gain Source Select based on compander enable/disable */
+		snd_soc_component_update_bits(component, WCD934X_HPH_L_EN,
+					      WCD934X_HPH_GAIN_SRC_SEL_MASK,
+					      sel);
+		break;
+	case COMPANDER_2:
+		snd_soc_component_update_bits(component, WCD934X_HPH_R_EN,
+					      WCD934X_HPH_GAIN_SRC_SEL_MASK,
+					      sel);
+		break;
+	case COMPANDER_3:
+	case COMPANDER_4:
+	case COMPANDER_7:
+	case COMPANDER_8:
+		break;
+	default:
+		break;
+	};
+
+	return 0;
+}
+
+static int wcd934x_rx_hph_mode_get(struct snd_kcontrol *kc,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+
+	ucontrol->value.enumerated.item[0] = wcd->hph_mode;
+
+	return 0;
+}
+
+static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
+	u32 mode_val;
+
+	mode_val = ucontrol->value.enumerated.item[0];
+
+	if (mode_val == 0) {
+		dev_err(wcd->dev, "Invalid HPH Mode, default to ClSH HiFi\n");
+		mode_val = CLS_H_LOHIFI;
+	}
+	wcd->hph_mode = mode_val;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new wcd934x_snd_controls[] = {
+	/* Gain Controls */
+	SOC_SINGLE_TLV("EAR PA Volume", WCD934X_ANA_EAR, 4, 4, 1, ear_pa_gain),
+	SOC_SINGLE_TLV("HPHL Volume", WCD934X_HPH_L_EN, 0, 24, 1, line_gain),
+	SOC_SINGLE_TLV("HPHR Volume", WCD934X_HPH_R_EN, 0, 24, 1, line_gain),
+	SOC_SINGLE_TLV("LINEOUT1 Volume", WCD934X_DIFF_LO_LO1_COMPANDER,
+		       3, 16, 1, line_gain),
+	SOC_SINGLE_TLV("LINEOUT2 Volume", WCD934X_DIFF_LO_LO2_COMPANDER,
+		       3, 16, 1, line_gain),
+
+	SOC_SINGLE_TLV("ADC1 Volume", WCD934X_ANA_AMIC1, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC2 Volume", WCD934X_ANA_AMIC2, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC3 Volume", WCD934X_ANA_AMIC3, 0, 20, 0, analog_gain),
+	SOC_SINGLE_TLV("ADC4 Volume", WCD934X_ANA_AMIC4, 0, 20, 0, analog_gain),
+
+	SOC_SINGLE_S8_TLV("RX0 Digital Volume", WCD934X_CDC_RX0_RX_VOL_CTL,
+			  -84, 40, digital_gain), /* -84dB min - 40dB max */
+	SOC_SINGLE_S8_TLV("RX1 Digital Volume", WCD934X_CDC_RX1_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX2 Digital Volume", WCD934X_CDC_RX2_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX3 Digital Volume", WCD934X_CDC_RX3_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX4 Digital Volume", WCD934X_CDC_RX4_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX7 Digital Volume", WCD934X_CDC_RX7_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX8 Digital Volume", WCD934X_CDC_RX8_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX0 Mix Digital Volume",
+			  WCD934X_CDC_RX0_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX1 Mix Digital Volume",
+			  WCD934X_CDC_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX2 Mix Digital Volume",
+			  WCD934X_CDC_RX2_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX3 Mix Digital Volume",
+			  WCD934X_CDC_RX3_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX4 Mix Digital Volume",
+			  WCD934X_CDC_RX4_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX7 Mix Digital Volume",
+			  WCD934X_CDC_RX7_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX8 Mix Digital Volume",
+			  WCD934X_CDC_RX8_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+
+	SOC_SINGLE_S8_TLV("DEC0 Volume", WCD934X_CDC_TX0_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC1 Volume", WCD934X_CDC_TX1_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC2 Volume", WCD934X_CDC_TX2_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC3 Volume", WCD934X_CDC_TX3_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC4 Volume", WCD934X_CDC_TX4_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC5 Volume", WCD934X_CDC_TX5_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC6 Volume", WCD934X_CDC_TX6_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC7 Volume", WCD934X_CDC_TX7_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("DEC8 Volume", WCD934X_CDC_TX8_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+
+	SOC_SINGLE_S8_TLV("IIR0 INP0 Volume",
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR0 INP1 Volume",
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B2_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR0 INP2 Volume",
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B3_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR0 INP3 Volume",
+			  WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B4_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP0 Volume",
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B1_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP1 Volume",
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B2_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP2 Volume",
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B3_CTL, -84, 40,
+			  digital_gain),
+	SOC_SINGLE_S8_TLV("IIR1 INP3 Volume",
+			  WCD934X_CDC_SIDETONE_IIR1_IIR_GAIN_B4_CTL, -84, 40,
+			  digital_gain),
+
+	SOC_ENUM("TX0 HPF cut off", cf_dec0_enum),
+	SOC_ENUM("TX1 HPF cut off", cf_dec1_enum),
+	SOC_ENUM("TX2 HPF cut off", cf_dec2_enum),
+	SOC_ENUM("TX3 HPF cut off", cf_dec3_enum),
+	SOC_ENUM("TX4 HPF cut off", cf_dec4_enum),
+	SOC_ENUM("TX5 HPF cut off", cf_dec5_enum),
+	SOC_ENUM("TX6 HPF cut off", cf_dec6_enum),
+	SOC_ENUM("TX7 HPF cut off", cf_dec7_enum),
+	SOC_ENUM("TX8 HPF cut off", cf_dec8_enum),
+
+	SOC_ENUM("RX INT0_1 HPF cut off", cf_int0_1_enum),
+	SOC_ENUM("RX INT0_2 HPF cut off", cf_int0_2_enum),
+	SOC_ENUM("RX INT1_1 HPF cut off", cf_int1_1_enum),
+	SOC_ENUM("RX INT1_2 HPF cut off", cf_int1_2_enum),
+	SOC_ENUM("RX INT2_1 HPF cut off", cf_int2_1_enum),
+	SOC_ENUM("RX INT2_2 HPF cut off", cf_int2_2_enum),
+	SOC_ENUM("RX INT3_1 HPF cut off", cf_int3_1_enum),
+	SOC_ENUM("RX INT3_2 HPF cut off", cf_int3_2_enum),
+	SOC_ENUM("RX INT4_1 HPF cut off", cf_int4_1_enum),
+	SOC_ENUM("RX INT4_2 HPF cut off", cf_int4_2_enum),
+	SOC_ENUM("RX INT7_1 HPF cut off", cf_int7_1_enum),
+	SOC_ENUM("RX INT7_2 HPF cut off", cf_int7_2_enum),
+	SOC_ENUM("RX INT8_1 HPF cut off", cf_int8_1_enum),
+	SOC_ENUM("RX INT8_2 HPF cut off", cf_int8_2_enum),
+
+	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
+		     wcd934x_rx_hph_mode_get, wcd934x_rx_hph_mode_put),
+
+	SOC_SINGLE("IIR1 Band1 Switch", WCD934X_CDC_SIDETONE_IIR0_IIR_CTL,
+		   0, 1, 0),
+	SOC_SINGLE("IIR1 Band2 Switch", WCD934X_CDC_SIDETONE_IIR0_IIR_CTL,
+		   1, 1, 0),
+	SOC_SINGLE("IIR1 Band3 Switch", WCD934X_CDC_SIDETONE_IIR0_IIR_CTL,
+		   2, 1, 0),
+	SOC_SINGLE("IIR1 Band4 Switch", WCD934X_CDC_SIDETONE_IIR0_IIR_CTL,
+		   3, 1, 0),
+	SOC_SINGLE("IIR1 Band5 Switch", WCD934X_CDC_SIDETONE_IIR0_IIR_CTL,
+		   4, 1, 0),
+	SOC_SINGLE("IIR2 Band1 Switch", WCD934X_CDC_SIDETONE_IIR1_IIR_CTL,
+		   0, 1, 0),
+	SOC_SINGLE("IIR2 Band2 Switch", WCD934X_CDC_SIDETONE_IIR1_IIR_CTL,
+		   1, 1, 0),
+	SOC_SINGLE("IIR2 Band3 Switch", WCD934X_CDC_SIDETONE_IIR1_IIR_CTL,
+		   2, 1, 0),
+	SOC_SINGLE("IIR2 Band4 Switch", WCD934X_CDC_SIDETONE_IIR1_IIR_CTL,
+		   3, 1, 0),
+	SOC_SINGLE("IIR2 Band5 Switch", WCD934X_CDC_SIDETONE_IIR1_IIR_CTL,
+		   4, 1, 0),
+	WCD_IIR_FILTER_CTL("IIR0 Band1", IIR0, BAND1),
+	WCD_IIR_FILTER_CTL("IIR0 Band2", IIR0, BAND2),
+	WCD_IIR_FILTER_CTL("IIR0 Band3", IIR0, BAND3),
+	WCD_IIR_FILTER_CTL("IIR0 Band4", IIR0, BAND4),
+	WCD_IIR_FILTER_CTL("IIR0 Band5", IIR0, BAND5),
+
+	WCD_IIR_FILTER_CTL("IIR1 Band1", IIR1, BAND1),
+	WCD_IIR_FILTER_CTL("IIR1 Band2", IIR1, BAND2),
+	WCD_IIR_FILTER_CTL("IIR1 Band3", IIR1, BAND3),
+	WCD_IIR_FILTER_CTL("IIR1 Band4", IIR1, BAND4),
+	WCD_IIR_FILTER_CTL("IIR1 Band5", IIR1, BAND5),
+
+	SOC_SINGLE_EXT("COMP1 Switch", SND_SOC_NOPM, COMPANDER_1, 1, 0,
+		       wcd934x_compander_get, wcd934x_compander_set),
+	SOC_SINGLE_EXT("COMP2 Switch", SND_SOC_NOPM, COMPANDER_2, 1, 0,
+		       wcd934x_compander_get, wcd934x_compander_set),
+	SOC_SINGLE_EXT("COMP3 Switch", SND_SOC_NOPM, COMPANDER_3, 1, 0,
+		       wcd934x_compander_get, wcd934x_compander_set),
+	SOC_SINGLE_EXT("COMP4 Switch", SND_SOC_NOPM, COMPANDER_4, 1, 0,
+		       wcd934x_compander_get, wcd934x_compander_set),
+	SOC_SINGLE_EXT("COMP7 Switch", SND_SOC_NOPM, COMPANDER_7, 1, 0,
+		       wcd934x_compander_get, wcd934x_compander_set),
+	SOC_SINGLE_EXT("COMP8 Switch", SND_SOC_NOPM, COMPANDER_8, 1, 0,
+		       wcd934x_compander_get, wcd934x_compander_set),
+};
+
 static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.probe = wcd934x_comp_probe,
 	.remove = wcd934x_comp_remove,
 	.set_sysclk = wcd934x_comp_set_sysclk,
+	.controls = wcd934x_snd_controls,
+	.num_controls = ARRAY_SIZE(wcd934x_snd_controls),
 };
 
 static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
