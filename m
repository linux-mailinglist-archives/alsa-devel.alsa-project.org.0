Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7653C51A05
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 19:51:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AB31654;
	Mon, 24 Jun 2019 19:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AB31654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561398703;
	bh=alSqwC+rJVtQKz4QiPOLTRvZpDYHZeLzaO50LRC+T5E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lRe5eg2TLHOdVK+tDf9RohlTKx7mMni1z9zwLrN9WnDgPy4PssnnT0XrT3Vz2ALem
	 XUt9RQvyRYfC7Bf9/r11LEGmyw4ke5N1CH7FOxyFab44gRIOcM6F1v6de5S9XQ0X+S
	 23a/ux0r/xTXqeiLaVrSv1bP21xp0jtiw6PKr61Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A88F8071F;
	Mon, 24 Jun 2019 19:49:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 576F2F896B7; Mon, 24 Jun 2019 19:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C12EF8071F
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 19:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C12EF8071F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 10:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,412,1557212400"; d="scan'208";a="244780886"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.2.87])
 ([10.252.2.87])
 by orsmga001.jf.intel.com with ESMTP; 24 Jun 2019 10:49:45 -0700
To: derek.fang@realtek.com
References: <1561381680-5250-1-git-send-email-derek.fang@realtek.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7eee0abc-af2d-d4d3-23b2-d682a285c352@intel.com>
Date: Mon, 24 Jun 2019 19:49:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561381680-5250-1-git-send-email-derek.fang@realtek.com>
Content-Language: en-US
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 broonie@kernel.org, flove@realtek.com, shumingf@realtek.com,
 bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH v3] ASoC: rt1308: Add RT1308 amplifier
	driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-06-24 15:08, derek.fang@realtek.com wrote:

> +static int rt1308_reg_init(struct snd_soc_component *component)
> +{
> +	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
> +
> +	regmap_multi_reg_write(rt1308->regmap, init_list, RT1308_INIT_REG_LEN);
> +	return 0;

s/return 0/return regmap_multi_reg_write/ perhaps?


> +static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		msleep(30);
> +		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
> +			RT1308_POW_PDB_REG_BIT, RT1308_POW_PDB_REG_BIT);
> +		msleep(40);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
> +			RT1308_POW_PDB_REG_BIT, 0);
> +		usleep_range(150000, 200000);
> +		break;
> +
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;

Redundant return.


> +static int rt1308_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
> +	unsigned int val_len = 0, val_clk, mask_clk;
> +	int pre_div, bclk_ms, frame_size;
> +
> +	rt1308->lrck = params_rate(params);
> +	pre_div = rt1308_get_clk_info(rt1308->sysclk, rt1308->lrck);
> +	if (pre_div < 0) {
> +		dev_err(component->dev,
> +			"Unsupported clock setting %d\n", rt1308->lrck);
> +		return -EINVAL;
> +	}
> +
> +	frame_size = snd_soc_params_to_frame_size(params);
> +	if (frame_size < 0) {
> +		dev_err(component->dev, "Unsupported frame size: %d\n",
> +			frame_size);
> +		return -EINVAL;
> +	}
> +
> +	bclk_ms = frame_size > 32;
> +	rt1308->bclk = rt1308->lrck * (32 << bclk_ms);
> +
> +	dev_dbg(component->dev, "bclk_ms is %d and pre_div is %d for iis %d\n",
> +				bclk_ms, pre_div, dai->id);
> +
> +	dev_dbg(component->dev, "lrck is %dHz and pre_div is %d for iis %d\n",
> +				rt1308->lrck, pre_div, dai->id);
> +
> +	switch (params_width(params)) {
> +	case 16:
> +		val_len |= RT1308_I2S_DL_SEL_16B;
> +		break;
> +	case 20:
> +		val_len |= RT1308_I2S_DL_SEL_20B;
> +		break;
> +	case 24:
> +		val_len |= RT1308_I2S_DL_SEL_24B;
> +		break;
> +	case 8:
> +		val_len |= RT1308_I2S_DL_SEL_8B;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case RT1308_AIF1:
> +		mask_clk = RT1308_DIV_FS_SYS_MASK;
> +		val_clk = pre_div << RT1308_DIV_FS_SYS_SFT;
> +		snd_soc_component_update_bits(component,
> +			RT1308_I2S_SET_2, RT1308_I2S_DL_SEL_MASK,
> +			val_len);
> +		break;
> +	default:
> +		dev_err(component->dev, "Invalid dai->id: %d\n", dai->id);
> +		return -EINVAL;
> +	}

So, either id == RT1308_AIF1 -or- func collapses. I'd suggest a refactor:
if (dai->id != RT1308_AIF1)
	// collapse
// do the stuff

Moreover, this block (if-statement) should probably be moved to the top 
of the func. Why bother with any ops if dai->id does not match.

> +
> +	snd_soc_component_update_bits(component, RT1308_CLK_1,
> +		mask_clk, val_clk);

is mask_clk local even needed? It could be simply inlined..

> +
> +	return 0;
> +}


> +static int rt1308_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
> +	unsigned int reg_val = 0, reg1_val = 0;
> +
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		rt1308->master = 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	} > +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		reg_val |= RT1308_I2S_DF_SEL_LEFT;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		reg_val |= RT1308_I2S_DF_SEL_PCM_A;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		reg_val |= RT1308_I2S_DF_SEL_PCM_B;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		reg1_val |= RT1308_I2S_BCLK_INV;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case RT1308_AIF1:
> +		snd_soc_component_update_bits(component,
> +			RT1308_I2S_SET_1, RT1308_I2S_DF_SEL_MASK,
> +			reg_val);
> +		snd_soc_component_update_bits(component,
> +			RT1308_I2S_SET_2, RT1308_I2S_BCLK_MASK,
> +			reg1_val);
> +		break;
> +	default:
> +		dev_err(component->dev, "Invalid dai->id: %d\n", dai->id);
> +		return -EINVAL;
> +	}

Same treatment as for rt1308_hw_params could be applied.


> +static int rt1308_probe(struct snd_soc_component *component)
> +{
> +	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
> +
> +	rt1308->component = component;
> +
> +	rt1308_reg_init(component);
> +
> +	return 0;

s/return 0/return rt1308_reg_init/ perhaps?


> +#if defined(CONFIG_OF)
> +static const struct of_device_id rt1308_of_match[] = {
> +	{ .compatible = "realtek,rt1308", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rt1308_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static struct acpi_device_id rt1308_acpi_match[] = {
> +	{"10EC1308", 0,},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, rt1308_acpi_match);
> +#endif
> +
> +static const struct i2c_device_id rt1308_i2c_id[] = {
> +	{ "rt1308", 0 },
> +	{ }
> +};

Each of these 3 const arrays above has different spacing of their 
elements. It would look better if same style was chosen for all of em.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
