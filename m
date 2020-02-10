Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1C157F95
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 17:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658CC166D;
	Mon, 10 Feb 2020 17:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658CC166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581351656;
	bh=RPHlvUMtbDvtS/2x9XAzuu9UT7hghl2Qo8AwlQmPdR4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+1BbIENG7xboF4thuP57+7c/zwOMhKX4/dZ8GxnTpO2lbJUEoqbg1rN2FnGXWblg
	 vkMuxPIJ9QUyCiiCuALqFKTbjMDAIdoQYguE452YkubpO7Vt9UTFcUyft759bHftVv
	 Ep9OjBaSIEUOfY+1psTgNX9yO5i8DXK2KRsv+pfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD7D1F800E7;
	Mon, 10 Feb 2020 17:18:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 753D7F80277; Mon, 10 Feb 2020 17:18:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EF73F80234
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 17:18:54 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D2E9FA0040;
 Mon, 10 Feb 2020 17:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D2E9FA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581351533; bh=6ExE5SHf5KGKP9Eqe2SGbKrxUq3WaQaBxGJiWXG6iko=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m6FpaT80CfDEzUcWXaCKcDjQN/pSyIlaAET4eDBtPaN2KirUghpS8G8SgbXcaN/9H
 nB5jAGCrfLvAYekHW9v5mj/HIACOQiEcmxP4MFGjiuUbKijeZZGyoc+vKbI0/VcjA9
 o5TOjxPCsD7Bz2Z/SW2usA+Xnawsc6iFHXnPVrac=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 10 Feb 2020 17:18:38 +0100 (CET)
To: Adam Serbinski <adam@serbinski.com>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <317edce5-a982-549b-84c2-84cdc1d92c9a@perex.cz>
Date: Mon, 10 Feb 2020 17:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-9-adam@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols
	to set PCM rate
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

Dne 09. 02. 20 v 16:47 Adam Serbinski napsal(a):
> This makes it possible for the backend sample rate to be
> set to 8000 or 16000 Hz, depending on the needs of the HFP
> call being set up.

Two points:

Why enum? It adds just more code than the integer value handlers.

Also, this belongs to the PCM interface, so it should be handled with 
SNDRV_CTL_ELEM_IFACE_PCM not mixer.

The name should be probably "Rate" and assigned to the corresponding PCM device.

Add this to Documentation/sound/designs/control-names.rst .

					Jaroslav

> 
> Signed-off-by: Adam Serbinski <adam@serbinski.com>
> CC: Andy Gross <agross@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Patrick Lai <plai@codeaurora.org>
> CC: Banajit Goswami <bgoswami@codeaurora.org>
> CC: Jaroslav Kysela <perex@perex.cz>
> CC: Takashi Iwai <tiwai@suse.com>
> CC: alsa-devel@alsa-project.org
> CC: linux-arm-msm@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   sound/soc/qcom/apq8096.c | 92 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
> index 1edcaa15234f..882f2c456321 100644
> --- a/sound/soc/qcom/apq8096.c
> +++ b/sound/soc/qcom/apq8096.c
> @@ -16,6 +16,9 @@
>   #define MI2S_BCLK_RATE			1536000
>   #define PCM_BCLK_RATE			1024000
>   
> +static int pri_pcm_sample_rate = 16000;
> +static int quat_pcm_sample_rate = 16000;
> +
>   static int msm_snd_hw_params(struct snd_pcm_substream *substream,
>   			     struct snd_pcm_hw_params *params)
>   {
> @@ -33,10 +36,15 @@ static int msm_snd_hw_params(struct snd_pcm_substream *substream,
>   	switch (cpu_dai->id) {
>   	case PRIMARY_PCM_RX:
>   	case PRIMARY_PCM_TX:
> +		rate->min = pri_pcm_sample_rate;
> +		rate->max = pri_pcm_sample_rate;
> +		channels->min = 1;
> +		channels->max = 1;
> +		break;
>   	case QUATERNARY_PCM_RX:
>   	case QUATERNARY_PCM_TX:
> -		rate->min = 16000;
> -		rate->max = 16000;
> +		rate->min = quat_pcm_sample_rate;
> +		rate->max = quat_pcm_sample_rate;
>   		channels->min = 1;
>   		channels->max = 1;
>   		break;
> @@ -121,6 +129,83 @@ static struct snd_soc_ops apq8096_ops = {
>   	.startup = msm_snd_startup,
>   };
>   
> +static char const *pcm_sample_rate_text[] = {"8 kHz", "16 kHz"};
> +static const struct soc_enum pcm_snd_enum =
> +		SOC_ENUM_SINGLE_EXT(2, pcm_sample_rate_text);
> +
> +static int get_sample_rate_idx(int sample_rate)
> +{
> +	int sample_rate_idx = 0;
> +
> +	switch (sample_rate) {
> +	case 8000:
> +		sample_rate_idx = 0;
> +		break;
> +	case 16000:
> +	default:
> +		sample_rate_idx = 1;
> +		break;
> +	}
> +
> +	return sample_rate_idx;
> +}
> +
> +static int pri_pcm_sample_rate_get(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	ucontrol->value.integer.value[0] =
> +		get_sample_rate_idx(pri_pcm_sample_rate);
> +	return 0;
> +}
> +
> +static int quat_pcm_sample_rate_get(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	ucontrol->value.integer.value[0] =
> +		get_sample_rate_idx(quat_pcm_sample_rate);
> +	return 0;
> +}
> +
> +static int get_sample_rate(int idx)
> +{
> +	int sample_rate_val = 0;
> +
> +	switch (idx) {
> +	case 0:
> +		sample_rate_val = 8000;
> +		break;
> +	case 1:
> +	default:
> +		sample_rate_val = 16000;
> +		break;
> +	}
> +
> +	return sample_rate_val;
> +}
> +
> +static int pri_pcm_sample_rate_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	pri_pcm_sample_rate =
> +		get_sample_rate(ucontrol->value.integer.value[0]);
> +	return 0;
> +}
> +
> +static int quat_pcm_sample_rate_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	quat_pcm_sample_rate =
> +		get_sample_rate(ucontrol->value.integer.value[0]);
> +	return 0;
> +}
> +
> +static const struct snd_kcontrol_new card_controls[] = {
> +	SOC_ENUM_EXT("PRI_PCM SampleRate", pcm_snd_enum,
> +		     pri_pcm_sample_rate_get, pri_pcm_sample_rate_put),
> +	SOC_ENUM_EXT("QUAT_PCM SampleRate", pcm_snd_enum,
> +		     quat_pcm_sample_rate_get, quat_pcm_sample_rate_put),
> +};
> +
>   static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
>   {
>   	struct snd_soc_dai *codec_dai = rtd->codec_dai;
> @@ -182,6 +267,9 @@ static int apq8096_platform_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_card_register;
>   
> +	snd_soc_add_card_controls(card, card_controls,
> +				  ARRAY_SIZE(card_controls));
> +
>   	return 0;
>   
>   err_card_register:
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
