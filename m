Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB868071
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jul 2019 19:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3A11668;
	Sun, 14 Jul 2019 19:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3A11668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563124782;
	bh=1TAUkX4Ekd1VfHZSNkYg5JLFcuZi89H+S5VZxbgCsUw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YxWm2kcymkpttZWFXW7PZCJoMNg8g92TNyolcpCijADnsv9l4F+jvcnLXstmEBmT5
	 ybLhguZyrTIt78yyjUSmnP56lGvxgoLex/TBv4oQuNVIWskYzJfwQD2MV5HwNbIs9G
	 1AVTMQGVc4+pic/kbktK2pRVjOziq2cyeRPlBROQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A181FF80390;
	Sun, 14 Jul 2019 19:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AED8DF80377; Sun, 14 Jul 2019 19:17:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 019B5F800C8
 for <alsa-devel@alsa-project.org>; Sun, 14 Jul 2019 19:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 019B5F800C8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2019 10:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,491,1557212400"; d="scan'208";a="172027150"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.4.28])
 ([10.252.4.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Jul 2019 10:17:45 -0700
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
References: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
 <20190712145550.27500-7-oleksandr.suvorov@toradex.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <e9f0f7c7-4c11-36ad-679c-503f6160b83f@intel.com>
Date: Sun, 14 Jul 2019 19:17:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712145550.27500-7-oleksandr.suvorov@toradex.com>
Content-Language: en-US
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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

On 2019-07-12 16:56, Oleksandr Suvorov wrote:
>   
> +enum {
> +	HP_POWER_EVENT,
> +	DAC_POWER_EVENT,
> +	ADC_POWER_EVENT
> +};
> +
> +struct sgtl5000_mute_state {
> +	u16 hp_event;
> +	u16 dac_event;
> +	u16 adc_event;
> +};
> +
>   /* sgtl5000 private structure in codec */
>   struct sgtl5000_priv {
>   	int sysclk;	/* sysclk rate */
> @@ -137,8 +156,109 @@ struct sgtl5000_priv {
>   	u8 micbias_voltage;
>   	u8 lrclk_strength;
>   	u8 sclk_strength;
> +	struct sgtl5000_mute_state mute_state;

Why not array instead?
u16 mute_state[ADC_POWER_EVENT+1];
-or-
u16 mute_state[LAST_POWER_EVENT+1]; (if you choose to add explicit LAST 
enum constant).

Enables simplification, see below.

> @@ -170,40 +290,79 @@ static int mic_bias_event(struct snd_soc_dapm_widget *w,
>   	return 0;
>   }
>   
> -/*
> - * As manual described, ADC/DAC only works when VAG powerup,
> - * So enabled VAG before ADC/DAC up.
> - * In power down case, we need wait 400ms when vag fully ramped down.
> - */
> -static int power_vag_event(struct snd_soc_dapm_widget *w,
> -	struct snd_kcontrol *kcontrol, int event)
> +static void vag_and_mute_control(struct snd_soc_component *component,
> +				 int event, int event_source,
> +				 u16 mute_mask, u16 *mute_reg)
>   {
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	const u32 mask = SGTL5000_DAC_POWERUP | SGTL5000_ADC_POWERUP;
> -
>   	switch (event) {
> -	case SND_SOC_DAPM_POST_PMU:
> -		snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
> -			SGTL5000_VAG_POWERUP, SGTL5000_VAG_POWERUP);
> -		msleep(400);
> +	case SND_SOC_DAPM_PRE_PMU:
> +		*mute_reg = mute_output(component, mute_mask);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		vag_power_on(component, event_source);
> +		restore_output(component, mute_mask, *mute_reg);
>   		break;
> -
>   	case SND_SOC_DAPM_PRE_PMD:
> -		/*
> -		 * Don't clear VAG_POWERUP, when both DAC and ADC are
> -		 * operational to prevent inadvertently starving the
> -		 * other one of them.
> -		 */
> -		if ((snd_soc_component_read32(component, SGTL5000_CHIP_ANA_POWER) &
> -				mask) != mask) {
> -			snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
> -				SGTL5000_VAG_POWERUP, 0);
> -			msleep(400);
> -		}
> +		*mute_reg = mute_output(component, mute_mask);
> +		vag_power_off(component, event_source);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		restore_output(component, mute_mask, *mute_reg);
>   		break;
>   	default:
>   		break;
>   	}
> +}
> +
> +/*
> + * Mute Headphone when power it up/down.
> + * Control VAG power on HP power path.
> + */
> +static int headphone_pga_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sgtl5000_priv *sgtl5000 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	vag_and_mute_control(component, event, HP_POWER_EVENT,
> +			     SGTL5000_HP_MUTE,
> +			     &sgtl5000->mute_state.hp_event);
> +
> +	return 0;
> +}
> +
> +/* As manual describes, ADC/DAC powering up/down requires
> + * to mute outputs to avoid pops.
> + * Control VAG power on ADC/DAC power path.
> + */
> +static int adc_updown_depop(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sgtl5000_priv *sgtl5000 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	vag_and_mute_control(component, event, ADC_POWER_EVENT,
> +			     SGTL5000_OUTPUTS_MUTE,
> +			     &sgtl5000->mute_state.adc_event);
> +
> +	return 0;
> +}
> +
> +static int dac_updown_depop(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sgtl5000_priv *sgtl5000 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	vag_and_mute_control(component, event, DAC_POWER_EVENT,
> +			     SGTL5000_OUTPUTS_MUTE,
> +			     &sgtl5000->mute_state.dac_event);
>   
>   	return 0;
>   }

With array approach you can simplify these 3 callbacks:
- remove local declaration of sgtl5000
- remove the need for "u16 *mute_reg" param for vag_and_mute_control
(you always provide the xxx_event field of mute_state corresponding to 
given XXX_POWER_EVENT anyway)

The sgtl5000 local ptr would be declared within common handler, which 
vag_and_mute_control clearly is. Said handler declaration could be 
updated to again require widget rather than component.

Cherry on top: relocation of "return 0;" directly to 
vag_and_mute_control. Leaving it void (as it is), however, might also be 
appropriate (explicit).

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
