Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE336680F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 11:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460DE1688;
	Wed, 21 Apr 2021 11:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460DE1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618997590;
	bh=vBzBLS3lwT5CbmZNCBA/VQ8WerkWMB4Z0AKuaFd0z38=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W27++5OGBDPqVUEebQw27XiqUuWDIPK1fQ9T59cpbUKkar75y7e8qLxMDb8HFt7Cs
	 QtQnR97AvNloFiaxYu8h/9TqBkbWaWGYj0wobzboYmCrT2wUES6nM6m2J0VvGY1A5X
	 awiecvAy/uts9VQc+fMGZ+R7phq2aVfD4nnWp/Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BED61F80256;
	Wed, 21 Apr 2021 11:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76DD6F80227; Wed, 21 Apr 2021 11:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F34BF800E8
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 11:31:20 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 37041A003F;
 Wed, 21 Apr 2021 11:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 37041A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618997480; bh=nS4VdmbVJOOi4hd4As6oi+hmU06x89EGJxKXFA3vIzw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lSC2u1v+2/LAbRhzCTM/4HxKUPmjHtapgXKsvlWc++sHgORly4SAk1ZD28gUa12XQ
 qQvo13IBhp2QKPGOlr5vDg9l9QCdrdb8eS9QMY0l1ndFvfpT+2ddxdw/5k5zcorrK5
 e9GMCw45r95CwLkVtL+sjL5U4+40G3Oh6U1HU00U=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 21 Apr 2021 11:31:10 +0200 (CEST)
Subject: Re: [PATCH v2] ASoC: rt711-sdca: change capture switch controls
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20210421091410.2300-1-shumingf@realtek.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6fdd78c7-8fda-0793-f5a5-eabdaf9c8469@perex.cz>
Date: Wed, 21 Apr 2021 11:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421091410.2300-1-shumingf@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, libin.yang@intel.com, derek.fang@realtek.com,
 flove@realtek.com
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

Dne 21. 04. 21 v 11:14 shumingf@realtek.com napsal(a):
> From: Shuming Fan <shumingf@realtek.com>
> 
> The DAPM event and mixer control could mute/unmute the capture directly.
> That will be confused that capture still works if the user settings is unmute before the capture.
> Therefore, this patch uses the variables to record the capture switch status of DAPM and mixer.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  sound/soc/codecs/rt711-sdca.c | 125 ++++++++++++++++++++++------------
>  sound/soc/codecs/rt711-sdca.h |   2 +
>  2 files changed, 84 insertions(+), 43 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
> index bfb7f1c8ec8f..95ca0d74bd10 100644
> --- a/sound/soc/codecs/rt711-sdca.c
> +++ b/sound/soc/codecs/rt711-sdca.c
> @@ -642,6 +642,73 @@ static int rt711_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
>  	return 0;
>  }
>  
> +static void rt711_sdca_set_fu0f_capture_ctl(struct rt711_sdca_priv *rt711)
> +{
> +	if (rt711->fu0f_dapm_mute || rt711->fu0f_mixer_mute) {
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
> +				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x01);
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
> +				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x01);
> +	} else {
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
> +				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x00);
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F,
> +				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x00);
> +	}
> +}
> +

Please, keep the idependent mute functionality for left and right channel. Use
bitmap instead bool for kcontrol put/get . I appologize, if my example code
confused you. I just wanted to describe the logic.

Also, perhaps, you may change the register with one regmap_write() ?

> +static void rt711_sdca_set_fu1e_capture_ctl(struct rt711_sdca_priv *rt711)
> +{
> +	if (rt711->fu1e_dapm_mute || rt711->fu1e_mixer_mute) {
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
> +				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x01);
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
> +				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x01);
> +	} else {
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
> +				RT711_SDCA_CTL_FU_MUTE, CH_L), 0x00);
> +		regmap_write(rt711->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
> +				RT711_SDCA_CTL_FU_MUTE, CH_R), 0x00);
> +	}
> +}
> +
> +static int rt711_sdca_capture_switch_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
> +
> +	if (strstr(ucontrol->id.name, "FU1E Capture Switch"))
> +		ucontrol->value.integer.value[0] = !rt711->fu1e_mixer_mute;
> +	else if (strstr(ucontrol->id.name, "FU0F Capture Switch"))
> +		ucontrol->value.integer.value[0] = !rt711->fu0f_mixer_mute;
> +	return 0;
> +}

It's not so nice (strstr). Please, use diferent functions to set/get FU1E and
FU0F controls.

> +
> +static int rt711_sdca_capture_switch_put(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
> +
> +	if (strstr(ucontrol->id.name, "FU1E Capture Switch")) {
> +		rt711->fu1e_mixer_mute = !ucontrol->value.integer.value[0];
> +		rt711_sdca_set_fu1e_capture_ctl(rt711);
> +	} else if (strstr(ucontrol->id.name, "FU0F Capture Switch")) {
> +		rt711->fu0f_mixer_mute = !ucontrol->value.integer.value[0];
> +		rt711_sdca_set_fu0f_capture_ctl(rt711);
> +	}
> +	return 0;
> +}

The return value for the kcontrol put callback should be:

a) a negative error code
b) 0 - no change
c) 1 - the value was changed

If you don't return 1 on change, the other user space applications which are
monitoring the given kcontrol won't be notified about changes.

Perhaps, other put callbacks (functions) in this driver require this cleanup, too.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
