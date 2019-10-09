Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3DD0D77
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 13:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3823C1616;
	Wed,  9 Oct 2019 13:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3823C1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570619860;
	bh=pfQ+Jf/HkImpSkjB64x3HZ48iEe8MZvDGhC2WOullfA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XrGn3FyRH82g7/g6G4HL/ZdAFgGUdA5gXOpWQvTci+n9V5rgDOxbfpPSxhLSgyZu7
	 4NdTwRfLAmmAEg6aGkleQ1a2IsaOvS0e0PNE1gHpbEpFgKNjt2Cr4ZIll7qL7e4Qhe
	 g+YwOx7rYG1/gw49pZaw99auEKcKvCo7bz+Ph5DQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB0A6F802BE;
	Wed,  9 Oct 2019 13:15:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B6CF802BE; Wed,  9 Oct 2019 13:15:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D467BF800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 13:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D467BF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="Rxn8R3Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570619749;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=gIr5w1LNV8p5VM13/Ns6jSh9ntQ3Ce19P3uUZH/6bOo=;
 b=Rxn8R3Ks0wd5/nOk3Y+/4iv3UT13LWa7tvtf0hdc+WnW8+GIx4ySi/MJlczadIwkpQ
 Tx1PGHRyVtL/EdpfRtwcxWSa1KVXCcg/CqUdWaEwLjns6CSw0TqO9SWScpR8xaaIzSgy
 OwL0aNI5PC9f9Ny0CxoTcJZ0IMwqlkCtg/5tTqsKgxoPgljDzI4/Io6NYqZigZUlqjLy
 sCM35zu0Tf5U17Gohj4BVWEUKk0kA2PLa0dI7SCRsi4vSaIt1+qr9dfiYHALAhqE8Qn0
 NbcAWceyH3rCKICBnXGMPzKPzBNBA+BS/EfJrTLKtLlND+iHbaN2TK5Ol5gyVHkl/5Bx
 lMrg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJL0PVgt6Qm"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 44.28.0 AUTH)
 with ESMTPSA id L0811cv99BFlEHX
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 9 Oct 2019 13:15:47 +0200 (CEST)
Date: Wed, 9 Oct 2019 13:15:41 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191009111541.GA170307@gerhold.net>
References: <20191007181952.34786-1-stephan@gerhold.net>
 <6d324680-de9b-8fe9-5093-abb7cb1f1f83@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d324680-de9b-8fe9-5093-abb7cb1f1f83@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Remove broken
	MIX2 DAPM routes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 09, 2019 at 10:15:57AM +0100, Srinivas Kandagatla wrote:
> Hi Stephan,
> Thanks for testing and reporting this!
> 
> On 07/10/2019 19:19, Stephan Gerhold wrote:
> > Since 5.3-rc1, the kernel (correctly) complains about missing
> > widgets when loading msm8916-wcd-digital:
> > 
> > 	ASoC: no sink widget found for RX1 MIX2 INP1
> > 	ASoC: Failed to add route IIR1 -> IIR1 -> RX1 MIX2 INP1
> > 	ASoC: no sink widget found for RX2 MIX2 INP1
> > 	ASoC: Failed to add route IIR1 -> IIR1 -> RX2 MIX2 INP1
> > 	ASoC: no sink widget found for RX1 MIX2 INP1
> > 	ASoC: Failed to add route IIR2 -> IIR2 -> RX1 MIX2 INP1
> > 	ASoC: no sink widget found for RX2 MIX2 INP1
> > 	ASoC: Failed to add route IIR2 -> IIR2 -> RX2 MIX2 INP1
> > 
> > This happens because RX1/2 MIX2 INP1 is not actually supported by
> > msm8916-wcd-digital for some reason. There were some traces of it
> 
> RX1/2 MIX2 path is supported by the codec with IIR1 and IIR2 inputs on INP1.
> 
> MIX2 path was not added when we added first codec support as there was no
> IIR support. I think I totally missed adding this while adding IIR support.
> Better fix here would be to add that missing path.
> 

Either way is fine for me, as long as it gets fixed for 5.4 :)

> Can you try this patch?
> 
> ------------------------------------->cut<-----------------------------
> 
> From c54cc63897794efdf3c9fa8886d8377f80c272f8 Mon Sep 17 00:00:00 2001
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Date: Wed, 9 Oct 2019 10:10:09 +0100
> Subject: [PATCH] ASoC: msm8916-wcd-digital: add missing MIX2 path for RX1/2
> 
> This patch adds missing MIX2 path on RX1/2 which take IIR1 and
> IIR2 as inputs.
> 
> Without this patch sound card fails to intialize with below warning:
> 
>  ASoC: no sink widget found for RX1 MIX2 INP1
>  ASoC: Failed to add route IIR1 -> IIR1 -> RX1 MIX2 INP1
>  ASoC: no sink widget found for RX2 MIX2 INP1
>  ASoC: Failed to add route IIR1 -> IIR1 -> RX2 MIX2 INP1
>  ASoC: no sink widget found for RX1 MIX2 INP1
>  ASoC: Failed to add route IIR2 -> IIR2 -> RX1 MIX2 INP1
>  ASoC: no sink widget found for RX2 MIX2 INP1
>  ASoC: Failed to add route IIR2 -> IIR2 -> RX2 MIX2 INP1
> 
> Reported-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/msm8916-wcd-digital.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-digital.c
> b/sound/soc/codecs/msm8916-wcd-digital.c
> index 9fa5d44fdc79..58b2468fb2a7 100644
> --- a/sound/soc/codecs/msm8916-wcd-digital.c
> +++ b/sound/soc/codecs/msm8916-wcd-digital.c
> @@ -243,6 +243,10 @@ static const char *const rx_mix1_text[] = {
>  	"ZERO", "IIR1", "IIR2", "RX1", "RX2", "RX3"
>  };
> 
> +static const char * const rx_mix2_text[] = {
> +	"ZERO", "IIR1", "IIR2"
> +};
> +
>  static const char *const dec_mux_text[] = {
>  	"ZERO", "ADC1", "ADC2", "ADC3", "DMIC1", "DMIC2"
>  };
> @@ -270,6 +274,16 @@ static const struct soc_enum rx3_mix1_inp_enum[] = {
>  	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX3_B2_CTL, 0, 6, rx_mix1_text),
>  };
> 
> +/* RX1 MIX2 */
> +static const struct soc_enum rx_mix2_inp1_chain_enum =
> +	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX1_B3_CTL,
> +		0, 3, rx_mix2_text);
> +
> +/* RX2 MIX2 */
> +static const struct soc_enum rx2_mix2_inp1_chain_enum =
> +	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX2_B3_CTL,
> +		0, 3, rx_mix2_text);
> +
>  /* DEC */
>  static const struct soc_enum dec1_mux_enum = SOC_ENUM_SINGLE(
>  				LPASS_CDC_CONN_TX_B1_CTL, 0, 6, dec_mux_text);
> @@ -309,6 +323,10 @@ static const struct snd_kcontrol_new rx3_mix1_inp2_mux
> = SOC_DAPM_ENUM(
>  				"RX3 MIX1 INP2 Mux", rx3_mix1_inp_enum[1]);
>  static const struct snd_kcontrol_new rx3_mix1_inp3_mux = SOC_DAPM_ENUM(
>  				"RX3 MIX1 INP3 Mux", rx3_mix1_inp_enum[2]);
> +static const struct snd_kcontrol_new rx1_mix2_inp1_mux = SOC_DAPM_ENUM(
> +				"RX1 MIX2 INP1 Mux", rx_mix2_inp1_chain_enum);
> +static const struct snd_kcontrol_new rx2_mix2_inp1_mux = SOC_DAPM_ENUM(
> +				"RX2 MIX2 INP1 Mux", rx2_mix2_inp1_chain_enum);
> 
>  /* Digital Gain control -38.4 dB to +38.4 dB in 0.3 dB steps */
>  static const DECLARE_TLV_DB_SCALE(digital_gain, -3840, 30, 0);
> @@ -740,6 +758,10 @@ static const struct snd_soc_dapm_widget
> msm8916_wcd_digital_dapm_widgets[] = {
>  			 &rx3_mix1_inp2_mux),
>  	SND_SOC_DAPM_MUX("RX3 MIX1 INP3", SND_SOC_NOPM, 0, 0,
>  			 &rx3_mix1_inp3_mux),
> +	SND_SOC_DAPM_MUX("RX1 MIX2 INP1", SND_SOC_NOPM, 0, 0,
> +			 &rx1_mix2_inp1_mux),
> +	SND_SOC_DAPM_MUX("RX2 MIX2 INP1", SND_SOC_NOPM, 0, 0,
> +			 &rx2_mix2_inp1_mux),
> 
>  	SND_SOC_DAPM_MUX("CIC1 MUX", SND_SOC_NOPM, 0, 0, &cic1_mux),
>  	SND_SOC_DAPM_MUX("CIC2 MUX", SND_SOC_NOPM, 0, 0, &cic2_mux),
> -- 
> 2.21.0
> 
> ------------------------------------->cut<-----------------------------
> 

Thanks for the patch!

I think your mail client messed it up, but I managed to apply it with
some manual fixes. It seems to work fine too:

Tested-by: Stephan Gerhold <stephan@gerhold.net>

Thanks,
Stephan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
