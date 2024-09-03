Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A787E969445
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 08:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEEE7850;
	Tue,  3 Sep 2024 08:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEEE7850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725346666;
	bh=KDzQuzkYUt5uN8B02lIWkvIMU82Np5HDorMBdA2uot0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=azcEUKp/DoOBrQy81ssfvA8i21F6wGWnp5ne8AELtgGCoEmQj5w5TSJw66ugToKG7
	 jRoCrz3VimA+2xShbAZJuxESujy9AXgCNziLK5gLhPh+F5dnIRqOg9iCIE+ctvvDwD
	 t57B5NmvRUXaOJoOAr5UZVJaDIIJxv8g1z2eLdp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09595F8059F; Tue,  3 Sep 2024 08:57:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46414F805AD;
	Tue,  3 Sep 2024 08:57:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14FE0F80199; Tue,  3 Sep 2024 08:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEE1BF80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 08:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE1BF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=py2V5hI5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A3ADA4144F;
	Tue,  3 Sep 2024 06:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EB7C4CEC5;
	Tue,  3 Sep 2024 06:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346626;
	bh=KDzQuzkYUt5uN8B02lIWkvIMU82Np5HDorMBdA2uot0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=py2V5hI54niUENqDcdTVSTMWPHZXJdcAaD2N2qyTdZc7Po7WrzzDHaxligKaEEnUd
	 AgvLsF4AGpqoiVujVtbvhLQoN+nxF+UxJ9orTvtilvSlpli/7zq9lAFIjh3gNyf+nq
	 HgTTzHoeoL3vcJCIgF7qvOO+OPVXNLpjD2VA82cA10tWkbguUkU8no/Z/WSmOLoIa/
	 ZiBKQpiKfCucXRf4WWqW/pkE0GIIN8MxtSdISa7knpsTvD/2xZcgWGR8kDkHkjf7Sa
	 CkKftfOyDNPZkwNA1eR+6sZbDZ39zA3TlfD9U6OjoprZk0m6S5oh8ujHe7hp+tJp6+
	 w2uuHqp5Prluw==
Date: Tue, 3 Sep 2024 08:57:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 application@irondevice.com
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <3gu6u7euavq272kaf2znmyn5p3rd3vupvqldvfxnq7nh5ul6jx@apwfcxvgkoyj>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-2-kiseok.jo@irondevice.com>
Message-ID-Hash: 42XPWYZRVIN2SS2ACAUCNUCHFNNPOS7I
X-Message-ID-Hash: 42XPWYZRVIN2SS2ACAUCNUCHFNNPOS7I
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/42XPWYZRVIN2SS2ACAUCNUCHFNNPOS7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 03, 2024 at 02:44:33PM +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  sound/soc/codecs/Kconfig   |    8 +
>  sound/soc/codecs/Makefile  |    2 +
>  sound/soc/codecs/sma1307.c | 2191 ++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/sma1307.h |  454 ++++++++
>  4 files changed, 2655 insertions(+)
>  create mode 100644 sound/soc/codecs/sma1307.c
>  create mode 100644 sound/soc/codecs/sma1307.h
> 

What are the differences against sm1303? Why it cannot be merged there?
You have entire commit msg to explain this instead of just sending empty
commit.
> +#define CHECK_PERIOD_TIME 1	/* sec per HZ */
> +#define PLL_MATCH(_input_clk_name, _output_clk_name, _input_clk,\
> +		_post_n, _n, _vco,  _p_cp)\
> +{\
> +	.input_clk_name		= _input_clk_name,\
> +	.output_clk_name	= _output_clk_name,\
> +	.input_clk		= _input_clk,\
> +	.post_n			= _post_n,\
> +	.n			= _n,\
> +	.vco			= _vco,\
> +	.p_cp			= _p_cp,\
> +}
> +
> +static const char *setting_file = "sma1307_setting.bin";
> +#define SMA1307_SETTING_CHECKSUM 0x100000
> +
> +/* PLL clock setting Table */
> +struct sma1307_pll_match {
> +	char *input_clk_name;
> +	char *output_clk_name;
> +	unsigned int input_clk;
> +	unsigned int post_n;
> +	unsigned int n;
> +	unsigned int vco;
> +	unsigned int p_cp;
> +};
> +
> +struct sma1307_priv {
> +	bool force_mute_status;
> +	bool reset;
> +	bool sw_ot1_prot;
> +	char *name;
> +	enum sma1307_mode amp_mode;
> +	int binary_mode;
> +	int dapm_aif_in;
> +	int dapm_aif_out0;
> +	int dapm_aif_out1;
> +	int dapm_amp_en;
> +	int dapm_sdo_en;
> +	int dapm_sdo_setting;
> +	int num_of_pll_matches;
> +	int retry_cnt;
> +	long check_fault_period;
> +	long check_fault_status;
> +	struct attribute_group *attr_grp;
> +	struct delayed_work check_fault_work;
> +	struct device *dev;
> +	struct kobject *kobj;
> +	struct mutex default_lock;
> +	struct regmap *regmap;
> +	struct sma1307_pll_match *pll_matches;
> +	struct sma1307_setting_file set;
> +	unsigned int cur_vol;
> +	unsigned int format;
> +	unsigned int frame_size;
> +	unsigned int init_vol;
> +	unsigned int last_bclk;
> +	unsigned int otp_trm2;
> +	unsigned int otp_trm3;
> +	unsigned int rev_num;
> +	unsigned int sys_clk_id;
> +	unsigned int tdm_slot0_rx;
> +	unsigned int tdm_slot1_rx;
> +	unsigned int tdm_slot0_tx;
> +	unsigned int tdm_slot1_tx;
> +	unsigned int tsdw_cnt;
> +};
> +
> +static struct sma1307_pll_match sma1307_pll_matches[] = {

const

> +	/* in_clk_name, out_clk_name, input_clk post_n, n, vco, p_cp */
> +	PLL_MATCH("1.411MHz", "24.554MHz",
> +		  1411200, 0x06, 0xD1, 0x88, 0x00),
> +	PLL_MATCH("1.536MHz", "24.576MHz",
> +		  1536000, 0x06, 0xC0, 0x88, 0x00),
> +	PLL_MATCH("2.822MHz", "24.554MHz",
> +		  2822400, 0x06, 0xD1, 0x88, 0x04),
> +	PLL_MATCH("3.072MHz", "24.576MHz",
> +		  3072000, 0x06, 0x60, 0x88, 0x00),
> +	PLL_MATCH("6.144MHz", "24.576MHz",
> +		  6144000, 0x06, 0x60, 0x88, 0x04),
> +	PLL_MATCH("12.288MHz", "24.576MHz",
> +		  12288000, 0x06, 0x60, 0x88, 0x08),
> +	PLL_MATCH("19.2MHz", "24.48MHz",
> +		  19200000, 0x06, 0x7B, 0x88, 0x0C),
> +	PLL_MATCH("24.576MHz", "24.576MHz",
> +		  24576000, 0x06, 0x60, 0x88, 0x0C),
> +};
> +
> +static struct snd_soc_component *sma1307_amp_component;
> +
> +static void sma1307_startup(struct snd_soc_component *);
> +static void sma1307_shutdown(struct snd_soc_component *);
> +static void sma1307_reset(struct snd_soc_component *);
> +static void sma1307_set_binary(struct snd_soc_component *);
> +static void sma1307_set_default(struct snd_soc_component *);
> +
> +/* Initial register value - 6.0W SPK (8ohm load)  */
> +static const struct reg_default sma1307_reg_def[] = {
> +	{ 0x00, 0x80 },
> +	{ 0x01, 0x00 },
> +	{ 0x02, 0x52 },
> +	{ 0x03, 0x4C },
> +	{ 0x04, 0x47 },
> +	{ 0x05, 0x42 },
> +	{ 0x06, 0x40 },
> +	{ 0x07, 0x40 },
> +	{ 0x08, 0x3C },
> +	{ 0x09, 0x2F },
> +	{ 0x0A, 0x32 },
> +	{ 0x0B, 0x50 },
> +	{ 0x0C, 0x8C },
> +	{ 0x0D, 0x00 },
> +	{ 0x0E, 0x3F },
> +	{ 0x0F, 0x00 },
> +	{ 0x10, 0x00 },
> +	{ 0x11, 0x00 },
> +	{ 0x12, 0x00 },
> +	{ 0x13, 0x09 },
> +	{ 0x14, 0x12 },
> +	{ 0x1C, 0x00 },
> +	{ 0x1D, 0x85 },
> +	{ 0x1E, 0xA1 },
> +	{ 0x1F, 0x67 },
> +	{ 0x22, 0x00 },
> +	{ 0x23, 0x1F },
> +	{ 0x24, 0x7A },
> +	{ 0x25, 0x00 },
> +	{ 0x26, 0xFF },
> +	{ 0x27, 0x39 },
> +	{ 0x28, 0x54 },
> +	{ 0x29, 0x92 },
> +	{ 0x2A, 0xB0 },
> +	{ 0x2B, 0xED },
> +	{ 0x2C, 0xED },
> +	{ 0x2D, 0xFF },
> +	{ 0x2E, 0xFF },
> +	{ 0x2F, 0xFF },
> +	{ 0x30, 0xFF },
> +	{ 0x31, 0xFF },
> +	{ 0x32, 0xFF },
> +	{ 0x34, 0x01 },
> +	{ 0x35, 0x17 },
> +	{ 0x36, 0x92 },
> +	{ 0x37, 0x00 },
> +	{ 0x38, 0x01 },
> +	{ 0x39, 0x10 },
> +	{ 0x3E, 0x01 },
> +	{ 0x3F, 0x08 },
> +	{ 0x8B, 0x05 },
> +	{ 0x8C, 0x50 },
> +	{ 0x8D, 0x80 },
> +	{ 0x8E, 0x10 },
> +	{ 0x8F, 0x02 },
> +	{ 0x90, 0x02 },
> +	{ 0x91, 0x83 },
> +	{ 0x92, 0xC0 },
> +	{ 0x93, 0x00 },
> +	{ 0x94, 0xA4 },
> +	{ 0x95, 0x74 },
> +	{ 0x96, 0x57 },
> +	{ 0xA2, 0xCC },
> +	{ 0xA3, 0x28 },
> +	{ 0xA4, 0x40 },
> +	{ 0xA5, 0x01 },
> +	{ 0xA6, 0x41 },
> +	{ 0xA7, 0x08 },
> +	{ 0xA8, 0x04 },
> +	{ 0xA9, 0x27 },
> +	{ 0xAA, 0x10 },
> +	{ 0xAB, 0x10 },
> +	{ 0xAC, 0x10 },
> +	{ 0xAD, 0x0F },
> +	{ 0xAE, 0xCD },
> +	{ 0xAF, 0x70 },
> +	{ 0xB0, 0x03 },
> +	{ 0xB1, 0xEF },
> +	{ 0xB2, 0x03 },
> +	{ 0xB3, 0xEF },
> +	{ 0xB4, 0xF3 },
> +	{ 0xB5, 0x3D },
> +};
> +
> +static bool sma1307_readable_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg > SMA1307_FF_DEVICE_INDEX)
> +		return false;
> +
> +	switch (reg) {
> +	case SMA1307_00_SYSTEM_CTRL ... SMA1307_1F_TONE_FINE_VOLUME:
> +	case SMA1307_22_COMP_HYS_SEL ... SMA1307_32_BROWN_OUT_PROT19:
> +	case SMA1307_34_OCP_SPK ... SMA1307_39_PMT_NZ_VAL:
> +	case SMA1307_3B_TEST1 ... SMA1307_3F_ATEST2:
> +	case SMA1307_8B_PLL_POST_N ... SMA1307_9A_OTP_TRM3:
> +	case SMA1307_A0_PAD_CTRL0 ... SMA1307_BE_MCBS_CTRL2:
> +	case SMA1307_F5_READY_FOR_V_SAR:
> +	case SMA1307_F7_READY_FOR_T_SAR ... SMA1307_FF_DEVICE_INDEX:
> +		break;
> +	default:
> +		return false;
> +	}
> +	return true;
> +}
> +
> +static bool sma1307_writeable_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg > SMA1307_FF_DEVICE_INDEX)
> +		return false;
> +
> +	switch (reg) {
> +	case SMA1307_00_SYSTEM_CTRL ... SMA1307_1F_TONE_FINE_VOLUME:
> +	case SMA1307_22_COMP_HYS_SEL ... SMA1307_32_BROWN_OUT_PROT19:
> +	case SMA1307_34_OCP_SPK ... SMA1307_39_PMT_NZ_VAL:
> +	case SMA1307_3B_TEST1 ... SMA1307_3F_ATEST2:
> +	case SMA1307_8B_PLL_POST_N ... SMA1307_9A_OTP_TRM3:
> +	case SMA1307_A0_PAD_CTRL0 ... SMA1307_BE_MCBS_CTRL2:
> +		break;
> +	default:
> +		return false;
> +	}
> +	return true;
> +}
> +
> +static bool sma1307_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg > SMA1307_FF_DEVICE_INDEX)
> +		return false;
> +
> +	switch (reg) {
> +	case SMA1307_F8_STATUS_T1 ... SMA1307_FF_DEVICE_INDEX:
> +		break;
> +	default:
> +		return false;
> +	}
> +	return true;
> +}
> +
> +/* DB scale conversion of speaker volume */
> +static const DECLARE_TLV_DB_SCALE(sma1307_spk_tlv, -6000, 50, 0);
> +
> +static int sma1307_regmap_write(struct sma1307_priv *sma1307,
> +				unsigned int reg, unsigned int val)
> +{
> +	int ret = 0;
> +	int cnt = sma1307->retry_cnt;
> +
> +	while (cnt--) {

Sorry, but why? What is so broken in this hardware that it requires such
retries? Maybe just youro board is broken, not this codec?

> +		ret = regmap_write(sma1307->regmap, reg, val);
> +		if (ret == 0)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +

...

> +static int sma1307_probe(struct snd_soc_component *component)
> +{
> +	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =
> +	    snd_soc_component_get_dapm(component);
> +	struct snd_kcontrol *kcontrol;
> +
> +	snd_soc_dapm_sync(dapm);
> +
> +	sma1307_amp_component = component;
> +
> +	kcontrol = snd_ctl_new1(&sma1307_binary_mode_control, sma1307);
> +	if (!kcontrol)
> +		dev_err(sma1307->dev,
> +			"%s: binary mode control error\n", __func__);
> +	else
> +		snd_ctl_add(component->card->snd_card, kcontrol);
> +
> +	sma1307_reset(component);
> +
> +	return 0;
> +}
> +
> +static void sma1307_remove(struct snd_soc_component *component)
> +{
> +	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
> +
> +	cancel_delayed_work_sync(&sma1307->check_fault_work);

Why do you cancel work in two different places?

> +}
> +
> +static const struct snd_soc_component_driver sma1307_component = {
> +	.probe = sma1307_probe,
> +	.remove = sma1307_remove,
> +	.controls = sma1307_snd_controls,
> +	.num_controls = ARRAY_SIZE(sma1307_snd_controls),
> +	.dapm_widgets = sma1307_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sma1307_dapm_widgets),
> +	.dapm_routes = sma1307_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(sma1307_audio_map),
> +};
> +
> +static const struct regmap_config sma_i2c_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = SMA1307_FF_DEVICE_INDEX,
> +	.readable_reg = sma1307_readable_register,
> +	.writeable_reg = sma1307_writeable_register,
> +	.volatile_reg = sma1307_volatile_register,
> +
> +	.cache_type = REGCACHE_NONE,
> +	.reg_defaults = sma1307_reg_def,
> +	.num_reg_defaults = ARRAY_SIZE(sma1307_reg_def),
> +};
> +
> +static int sma1307_i2c_probe(struct i2c_client *client)
> +{
> +	struct sma1307_priv *sma1307;
> +	int ret = 0;
> +	unsigned int device_info;
> +
> +	sma1307 = devm_kzalloc(&client->dev,
> +			       sizeof(struct sma1307_priv), GFP_KERNEL);

sizeof(*)

> +	if (!sma1307)
> +		return -ENOMEM;
> +
> +	sma1307->regmap = devm_regmap_init_i2c(client, &sma_i2c_regmap);
> +	if (IS_ERR(sma1307->regmap)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(sma1307->regmap),
> +			"%s: failed to allocate register map\n", __func__);
> +	}
> +
> +	/* set initial value as normal AMP IC status */
> +	sma1307->name = client->name;
> +	sma1307->format = SND_SOC_DAIFMT_I2S;
> +	sma1307->sys_clk_id = SMA1307_PLL_CLKIN_BCLK;
> +	sma1307->retry_cnt = SMA1307_I2C_RETRY_COUNT;
> +	sma1307->num_of_pll_matches = ARRAY_SIZE(sma1307_pll_matches);
> +
> +	sma1307->check_fault_period = CHECK_PERIOD_TIME;
> +	sma1307->check_fault_status = true;
> +	sma1307->init_vol = 0x32;
> +	sma1307->cur_vol = sma1307->init_vol;
> +	sma1307->sw_ot1_prot = true;
> +
> +	mutex_init(&sma1307->default_lock);
> +
> +	INIT_DELAYED_WORK(&sma1307->check_fault_work,
> +			  sma1307_check_fault_worker);
> +
> +	sma1307->dev = &client->dev;
> +	sma1307->kobj = &client->dev.kobj;
> +
> +	i2c_set_clientdata(client, sma1307);
> +
> +	sma1307->pll_matches = sma1307_pll_matches;
> +
> +	ret = sma1307_regmap_read(sma1307,
> +				  SMA1307_FF_DEVICE_INDEX, &device_info);
> +
> +	if ((ret != 0) || ((device_info & 0xF8) != SMA1307_DEVICE_ID)) {
> +		dev_err(&client->dev,
> +			"%s: device initialization error (%d 0x%02X)", __func__,
> +			ret, device_info);
> +		return -ENODEV;
> +	}
> +	dev_dbg(&client->dev, "%s: chip version 0x%02X\n",
> +		 __func__, device_info);
> +
> +	i2c_set_clientdata(client, sma1307);
> +
> +	ret = devm_snd_soc_register_component(&client->dev,
> +					      &sma1307_component, sma1307_dai,
> +					      1);
> +

Drop blank line

> +	if (ret) {
> +		dev_err(&client->dev, "%s: failed to register component\n",
> +			__func__);
> +
> +		return ret;
> +	}
> +
> +	sma1307->attr_grp = &sma1307_attr_group;
> +	ret = sysfs_create_group(sma1307->kobj, sma1307->attr_grp);

Where is sysfs ABI documented?

> +	if (ret) {
> +		dev_err(&client->dev,
> +			"%s: failed to create attribute group [%d]\n", __func__,
> +			ret);
> +		sma1307->attr_grp = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static void sma1307_i2c_remove(struct i2c_client *client)
> +{
> +	struct sma1307_priv *sma1307 =
> +	    (struct sma1307_priv *)i2c_get_clientdata(client);
> +
> +	cancel_delayed_work_sync(&sma1307->check_fault_work);
> +}
> +
> +static const struct i2c_device_id sma1307_i2c_id[] = {
> +	{ "sma1307", 0 },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, sma1307_i2c_id);
> +
> +static const struct of_device_id sma1307_of_match[] = {
> +	{.compatible = "irondevice,sma1307a", },
> +	{.compatible = "irondevice,sma1307aq", },	//AEC-Q100 Qualificated

Drop, useless. Also does not match your I2C ID table.

Anyway, bindings are before their users.


> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, sma1307_of_match);
> +
> +static struct i2c_driver sma1307_i2c_driver = {
> +	.driver = {
> +		   .name = "sma1307",
> +		   .of_match_table = sma1307_of_match,
> +		    },
> +	.probe = sma1307_i2c_probe,
> +	.remove = sma1307_i2c_remove,
> +	.id_table = sma1307_i2c_id,
> +};
> +
> +module_i2c_driver(sma1307_i2c_driver);
> +
> +MODULE_DESCRIPTION("ALSA SoC SMA1307 driver");
> +MODULE_AUTHOR("Gyuhwa Park, <gyuhwa.park@irondevice.com>");
> +MODULE_AUTHOR("KS Jo, <kiseok.jo@irondevice.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/codecs/sma1307.h b/sound/soc/codecs/sma1307.h
> new file mode 100644
> index 000000000..d0cb01f52
> --- /dev/null
> +++ b/sound/soc/codecs/sma1307.h
> @@ -0,0 +1,454 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + * sma1307.h -- sma1307 ALSA SoC Audio driver
> + *
> + * r005,
> + *
> + * Copyright 2023 Iron Device Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef _SMA1307_H
> +#define _SMA1307_H
> +
> +#include <sound/soc.h>
> +
> +enum sma1307_fault {
> +	SMA1307_FAULT_OT1,
> +	SMA1307_FAULT_OT2,
> +	SMA1307_FAULT_UVLO,
> +	SMA1307_FAULT_OVP_BST,
> +	SMA1307_FAULT_OCP_SPK,
> +	SMA1307_FAULT_OCP_BST,
> +	SMA1307_FAULT_CLK
> +};
> +
> +enum sma1307_mode {
> +	SMA1307_MONO_MODE,
> +	SMA1307_LEFT_MODE,
> +	SMA1307_RIGHT_MODE,
> +};
> +
> +enum sma1307_sdo_mode {
> +	SMA1307_OUT_DATA_ONE_48K,
> +	SMA1307_OUT_DATA_TWO_48K,
> +	SMA1307_OUT_DATA_TWO_24K,
> +	SMA1307_OUT_CLK_PLL,
> +	SMA1307_OUT_CLK_OSC
> +};
> +
> +enum sma1307_sdo_source {
> +	SMA1307_OUT_DISABLE,
> +	SMA1307_OUT_FORMAT_C,
> +	SMA1307_OUT_MIXER_OUT,
> +	SMA1307_OUT_AFTER_DSP,
> +	SMA1307_OUT_VRMS2_AVG,
> +	SMA1307_OUT_BATTERY,
> +	SMA1307_OUT_TEMP,
> +	SMA1307_OUT_AFTER_DELAY
> +};
> +
> +struct sma1307_setting_file {
> +	bool status;
> +	char *header;
> +	int *def;
> +	int *mode_set[5];
> +	int checksum;
> +	int num_mode;
> +	size_t header_size;
> +	size_t def_size;
> +	size_t mode_size;
> +};
> +
> +#define SMA1307_I2C_ADDR_00		0x1e
> +#define SMA1307_I2C_ADDR_01		0x3e
> +#define SMA1307_I2C_ADDR_10		0x5e
> +#define SMA1307_I2C_ADDR_11		0x7e
> +
> +#define DEVICE_NAME_SMA1307A		"sma1307a"
> +#define DEVICE_NAME_SMA1307AQ		"sma1307aq"
> +
> +#define SMA1307_EXTERNAL_CLOCK_19_2		0x00
> +#define SMA1307_EXTERNAL_CLOCK_24_576		0x01
> +#define SMA1307_PLL_CLKIN_MCLK			0x02
> +#define SMA1307_PLL_CLKIN_BCLK			0x03
> +
> +#define SMA1307_I2C_RETRY_COUNT 3
> +
> +#define SMA1307_OFFSET_DEFAULT_MODE		0x00
> +#define SMA1307_OFFSET_BURNING_MODE		0x01
> +
> +#define SMA1307_SETTING_HEADER_SIZE		0x08
> +#define SMA1307_SETTING_DEFAULT_SIZE		0xC0
> +
> +#define SMA1307_DEFAULT_SET			0x00
> +#define SMA1307_BINARY_FILE_SET			0x01
> +
> +/* Controls Name */
> +#define SMA1307_REG_CTRL_NAME		"Register Byte Control"
> +#define SMA1307_VOL_CTRL_NAME		"Spleaker Volume"
> +#define SMA1307_FORCE_MUTE_CTRL_NAME	"Force Mute Switch"
> +#define SMA1307_TDM_RX0_POS_NAME	"TDM RX Slot0 Position"
> +#define SMA1307_TDM_RX1_POS_NAME	"TDM RX Slot1 Position"
> +#define SMA1307_TDM_TX0_POS_NAME	"TDM TX Slot0 Position"
> +#define SMA1307_TDM_TX1_POS_NAME	"TDM TX Slot1 Position"
> +#define SMA1307_OT1_SW_PROT_CTRL_NAME	"OT1 SW Protection Switch"
> +#define SMA1307_RESET_CTRL_NAME		"Reset Switch"
> +
> +/* DAPM Name */
> +#define SMA1307_AIF_IN_NAME		"AIF IN Source"
> +#define SMA1307_AIF_OUT0_NAME		"AIF OUT0 Source"
> +#define SMA1307_AIF_OUT1_NAME		"AIF OUT1 Source"
> +
> +/*
> + * SMA1307 Register Definition
> + */
> +
> +/* SMA1307 Register Addresses */
> +#define SMA1307_00_SYSTEM_CTRL			0x00
> +#define SMA1307_01_INPUT_CTRL1			0x01
> +#define SMA1307_02_BROWN_OUT_PROT1		0x02
> +#define SMA1307_03_BROWN_OUT_PROT2		0x03
> +#define SMA1307_04_BROWN_OUT_PROT3		0x04
> +#define SMA1307_05_BROWN_OUT_PROT8		0x05
> +#define SMA1307_06_BROWN_OUT_PROT9		0x06
> +#define SMA1307_07_BROWN_OUT_PROT10		0x07
> +#define SMA1307_08_BROWN_OUT_PROT11		0x08
> +#define SMA1307_09_OUTPUT_CTRL			0x09
> +#define SMA1307_0A_SPK_VOL			0x0A
> +#define SMA1307_0B_BST_TEST			0x0B
> +#define SMA1307_0C_BOOST_CTRL8			0x0C
> +#define SMA1307_0D_SPK_TEST			0x0D
> +#define SMA1307_0E_MUTE_VOL_CTRL		0x0E
> +#define SMA1307_0F_VBAT_TEMP_SENSING		0x0F
> +
> +#define SMA1307_10_SYSTEM_CTRL1			0x10
> +#define SMA1307_11_SYSTEM_CTRL2			0x11
> +#define SMA1307_12_SYSTEM_CTRL3			0x12
> +#define SMA1307_13_DELAY			0x13
> +#define SMA1307_14_MODULATOR			0x14
> +#define SMA1307_15_BASS_SPK1			0x15
> +#define SMA1307_16_BASS_SPK2			0x16
> +#define SMA1307_17_BASS_SPK3			0x17
> +#define SMA1307_18_BASS_SPK4			0x18
> +#define SMA1307_19_BASS_SPK5			0x19
> +#define SMA1307_1A_BASS_SPK6			0x1A
> +#define SMA1307_1B_BASS_SPK7			0x1B
> +#define SMA1307_1C_BROWN_OUT_PROT20		0x1C
> +#define SMA1307_1D_BROWN_OUT_PROT0		0x1D
> +#define SMA1307_1E_TONE_GENERATOR		0x1E
> +#define SMA1307_1F_TONE_FINE_VOLUME		0x1F
> +
> +#define SMA1307_22_COMP_HYS_SEL			0x22
> +#define SMA1307_23_COMPLIM1			0x23
> +#define SMA1307_24_COMPLIM2			0x24
> +#define SMA1307_25_COMPLIM3			0x25
> +#define SMA1307_26_COMPLIM4			0x26
> +#define SMA1307_27_BROWN_OUT_PROT4		0x27
> +#define SMA1307_28_BROWN_OUT_PROT5		0x28
> +#define SMA1307_29_BROWN_OUT_PROT12		0x29
> +#define SMA1307_2A_BROWN_OUT_PROT13		0x2A
> +#define SMA1307_2B_BROWN_OUT_PROT14		0x2B
> +#define SMA1307_2C_BROWN_OUT_PROT15		0x2C
> +#define SMA1307_2D_BROWN_OUT_PROT6		0x2D
> +#define SMA1307_2E_BROWN_OUT_PROT7		0x2E
> +#define SMA1307_2F_BROWN_OUT_PROT16		0x2F
> +
> +#define SMA1307_30_BROWN_OUT_PROT17		0x30
> +#define SMA1307_31_BROWN_OUT_PROT18		0x31
> +#define SMA1307_32_BROWN_OUT_PROT19		0x32
> +#define SMA1307_34_OCP_SPK			0x34
> +#define SMA1307_35_FDPEC_CTRL0			0x35
> +#define SMA1307_36_PROTECTION			0x36
> +#define SMA1307_37_SLOPECTRL			0x37
> +#define SMA1307_38_POWER_METER			0x38
> +#define SMA1307_39_PMT_NZ_VAL			0x39
> +#define SMA1307_3B_TEST1			0x3B
> +#define SMA1307_3C_TEST2			0x3C
> +#define SMA1307_3D_TEST3			0x3D
> +#define SMA1307_3E_IDLE_MODE_CTRL		0x3E
> +#define SMA1307_3F_ATEST2			0x3F
> +#define SMA1307_8B_PLL_POST_N			0x8B
> +#define SMA1307_8C_PLL_N			0x8C
> +#define SMA1307_8D_PLL_A_SETTING		0x8D
> +#define SMA1307_8E_PLL_P_CP			0x8E
> +#define SMA1307_8F_ANALOG_TEST			0x8F
> +
> +#define SMA1307_90_CRESTLIM1			0x90
> +#define SMA1307_91_CRESTLIM2			0x91
> +#define SMA1307_92_FDPEC_CTRL1			0x92
> +#define SMA1307_93_INT_CTRL			0x93
> +#define SMA1307_94_BOOST_CTRL9			0x94
> +#define SMA1307_95_BOOST_CTRL10			0x95
> +#define SMA1307_96_BOOST_CTRL11			0x96
> +#define SMA1307_97_OTP_TRM0			0x97
> +#define SMA1307_98_OTP_TRM1			0x98
> +#define SMA1307_99_OTP_TRM2			0x99
> +#define SMA1307_9A_OTP_TRM3			0x9A
> +
> +#define SMA1307_A0_PAD_CTRL0			0xA0
> +#define	SMA1307_A1_PAD_CTRL1			0xA1
> +#define SMA1307_A2_TOP_MAN1			0xA2
> +#define SMA1307_A3_TOP_MAN2			0xA3
> +#define SMA1307_A4_TOP_MAN3			0xA4
> +#define SMA1307_A5_TDM1				0xA5
> +#define SMA1307_A6_TDM2				0xA6
> +#define SMA1307_A7_CLK_MON			0xA7
> +#define SMA1307_A8_BOOST_CTRL1			0xA8
> +#define SMA1307_A9_BOOST_CTRL2			0xA9
> +#define SMA1307_AA_BOOST_CTRL3			0xAA
> +#define SMA1307_AB_BOOST_CTRL4			0xAB
> +#define SMA1307_AC_BOOST_CTRL5			0xAC
> +#define SMA1307_AD_BOOST_CTRL6			0xAD
> +#define SMA1307_AE_BOOST_CTRL7			0xAE
> +#define SMA1307_AF_LPF				0xAF
> +
> +#define SMA1307_B0_RMS_TC1			0xB0
> +#define SMA1307_B1_RMS_TC2			0xB1
> +#define SMA1307_B2_AVG_TC1			0xB2
> +#define SMA1307_B3_AVG_TC2			0xB3
> +#define SMA1307_B4_PRVALUE1			0xB4
> +#define SMA1307_B5_PRVALUE2			0xB5
> +#define SMA1307_B8_SPK_NG_CTRL1			0xB8
> +#define SMA1307_B9_SPK_NG_CTRL2			0xB9
> +#define SMA1307_BA_DGC1				0xBA
> +#define SMA1307_BB_DGC2				0xBB
> +#define SMA1307_BC_DGC3				0xBC
> +#define SMA1307_BD_MCBS_CTRL1			0xBD
> +#define SMA1307_BE_MCBS_CTRL2			0xBE
> +
> +/* Status Register Read Only */
> +#define SMA1307_F5_READY_FOR_V_SAR		0xF5
> +#define SMA1307_F7_READY_FOR_T_SAR		0xF7
> +#define SMA1307_F8_STATUS_T1			0xF8
> +#define SMA1307_F9_STATUS_T2			0xF9
> +#define SMA1307_FA_STATUS1			0xFA
> +#define SMA1307_FB_STATUS2			0xFB
> +#define SMA1307_FC_STATUS3			0xFC
> +#define SMA1307_FD_STATUS4			0xFD
> +#define SMA1307_FE_STATUS5			0xFE
> +#define SMA1307_FF_DEVICE_INDEX			0xFF
> +
> +/* SMA1307 Registers Bit Fields */
> +/* Power On/Off */
> +#define SMA1307_POWER_MASK			(1<<0)
> +#define SMA1307_POWER_OFF			(0<<0)
> +#define SMA1307_POWER_ON			(1<<0)

Use BIT() everywhere.

Best regards,
Krzysztof

