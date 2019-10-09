Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF67ED0AC6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 11:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 419FE15E0;
	Wed,  9 Oct 2019 11:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 419FE15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570612672;
	bh=gBc+nUuRQugyAeQ48NhrWbORxVX/562pZuPcSFz1w9Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aIahng1etam3Ohf9s1SWwIBFx1ZceWWkq/ybyOTy0zizDvCyxkqcEhGra+bkrdCR3
	 D8qELR2599q/dGLd36gvu7k6DK0AB5+Iwb3VpHzPBOoUjqT8XmUSGZp74xpPuKL5zw
	 k+k0ZuHcyAO7TuHEC3Asi3f/AZze+pElft33iK8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C77F802BE;
	Wed,  9 Oct 2019 11:16:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF7D9F802BE; Wed,  9 Oct 2019 11:16:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE0AF800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 11:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE0AF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RPKWFHDx"
Received: by mail-wr1-x442.google.com with SMTP id v8so1896001wrt.2
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DpjFTGbI4qNYHIgz64XjVtVrVxEwcl/e13wZ4mLfGKg=;
 b=RPKWFHDx3MvWYg5JOgxBZWlQNgbrogdLCXS0nKqYTZ3acmLNcK2E7HvsrXc7azW7gr
 9NO2Rpj5U+vFY9XwxtjWGKBPO2BznbDOwgCXpY/0dxdW0cfTzdVHXoyf9RBgfb1xObBm
 Y0P2yKV4bqBOfsOehicbZr0KuAtJfcCY1QCLjIbEwCpXGtg+tS11ReVaZbHz4DXN0Wks
 hI53eWz9WQuJdUdR5LDaC82XW/dmczdd94FbFRCOWYKv5/6ChWNtvwMgvgs4fjVnlgZ9
 7srxMab2b3Ld9YcrEkYy95htwlkSoAslG9b3jChWiE7OX4SgwjWtBb70LWV3wbUGYLjK
 QvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DpjFTGbI4qNYHIgz64XjVtVrVxEwcl/e13wZ4mLfGKg=;
 b=g1JxwR86hF1Dxppse80vd04+xyHduJJ3sDUDbWCS4KZrSkwK8IWTmx+J2vaizn55V+
 aBeNgc1hyW2r9FRYRtr4MSbCfwaGCz/Je01WDDT3SjtFWWjm+xfWWM+3NUKioVKgsvUZ
 30Umf97pXHLM9lg1AMk2Ozx2eT0GiFATrQfl3e4GkTl6QSP2NsS/O2hlXg+77RcYbV1V
 CbpSbkOE/iJd7wFV/Y+u4Ut85wFtyaDG9ZPnpCiaxTLPbBV42RFcYVEoBlucH1z/bNpE
 3zUQpqMwnDm7Q7nosM929rGpBTQ7yZE66JsMDRRAGvVgQfAJYg3qCmeHAGOg171Z+DqH
 5WiA==
X-Gm-Message-State: APjAAAWtl1DgtYhCIQAnCrC6PSEe8CEJ5UKHr9XB0CTtcnVqHtfQWbmG
 jelSK6i5Tnc9w9y8hccb/pxxhowXxOY=
X-Google-Smtp-Source: APXvYqx0CLSl6TvrxhsPd5zP5aqOQA/c35mS+HkI6ljlL3Hd6braJ6F+5JhCKyiPvAwNWWWMpZ93zA==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr1974976wrr.167.1570612558718; 
 Wed, 09 Oct 2019 02:15:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n17sm1658860wrp.37.2019.10.09.02.15.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 02:15:57 -0700 (PDT)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20191007181952.34786-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6d324680-de9b-8fe9-5093-abb7cb1f1f83@linaro.org>
Date: Wed, 9 Oct 2019 10:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007181952.34786-1-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Stephan,
Thanks for testing and reporting this!

On 07/10/2019 19:19, Stephan Gerhold wrote:
> Since 5.3-rc1, the kernel (correctly) complains about missing
> widgets when loading msm8916-wcd-digital:
> 
> 	ASoC: no sink widget found for RX1 MIX2 INP1
> 	ASoC: Failed to add route IIR1 -> IIR1 -> RX1 MIX2 INP1
> 	ASoC: no sink widget found for RX2 MIX2 INP1
> 	ASoC: Failed to add route IIR1 -> IIR1 -> RX2 MIX2 INP1
> 	ASoC: no sink widget found for RX1 MIX2 INP1
> 	ASoC: Failed to add route IIR2 -> IIR2 -> RX1 MIX2 INP1
> 	ASoC: no sink widget found for RX2 MIX2 INP1
> 	ASoC: Failed to add route IIR2 -> IIR2 -> RX2 MIX2 INP1
> 
> This happens because RX1/2 MIX2 INP1 is not actually supported by
> msm8916-wcd-digital for some reason. There were some traces of it

RX1/2 MIX2 path is supported by the codec with IIR1 and IIR2 inputs on INP1.

MIX2 path was not added when we added first codec support as there was 
no IIR support. I think I totally missed adding this while adding IIR 
support.
Better fix here would be to add that missing path.

Can you try this patch?

------------------------------------->cut<-----------------------------

 From c54cc63897794efdf3c9fa8886d8377f80c272f8 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 9 Oct 2019 10:10:09 +0100
Subject: [PATCH] ASoC: msm8916-wcd-digital: add missing MIX2 path for RX1/2

This patch adds missing MIX2 path on RX1/2 which take IIR1 and
IIR2 as inputs.

Without this patch sound card fails to intialize with below warning:

  ASoC: no sink widget found for RX1 MIX2 INP1
  ASoC: Failed to add route IIR1 -> IIR1 -> RX1 MIX2 INP1
  ASoC: no sink widget found for RX2 MIX2 INP1
  ASoC: Failed to add route IIR1 -> IIR1 -> RX2 MIX2 INP1
  ASoC: no sink widget found for RX1 MIX2 INP1
  ASoC: Failed to add route IIR2 -> IIR2 -> RX1 MIX2 INP1
  ASoC: no sink widget found for RX2 MIX2 INP1
  ASoC: Failed to add route IIR2 -> IIR2 -> RX2 MIX2 INP1

Reported-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
  sound/soc/codecs/msm8916-wcd-digital.c | 22 ++++++++++++++++++++++
  1 file changed, 22 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c 
b/sound/soc/codecs/msm8916-wcd-digital.c
index 9fa5d44fdc79..58b2468fb2a7 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -243,6 +243,10 @@ static const char *const rx_mix1_text[] = {
  	"ZERO", "IIR1", "IIR2", "RX1", "RX2", "RX3"
  };

+static const char * const rx_mix2_text[] = {
+	"ZERO", "IIR1", "IIR2"
+};
+
  static const char *const dec_mux_text[] = {
  	"ZERO", "ADC1", "ADC2", "ADC3", "DMIC1", "DMIC2"
  };
@@ -270,6 +274,16 @@ static const struct soc_enum rx3_mix1_inp_enum[] = {
  	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX3_B2_CTL, 0, 6, rx_mix1_text),
  };

+/* RX1 MIX2 */
+static const struct soc_enum rx_mix2_inp1_chain_enum =
+	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX1_B3_CTL,
+		0, 3, rx_mix2_text);
+
+/* RX2 MIX2 */
+static const struct soc_enum rx2_mix2_inp1_chain_enum =
+	SOC_ENUM_SINGLE(LPASS_CDC_CONN_RX2_B3_CTL,
+		0, 3, rx_mix2_text);
+
  /* DEC */
  static const struct soc_enum dec1_mux_enum = SOC_ENUM_SINGLE(
  				LPASS_CDC_CONN_TX_B1_CTL, 0, 6, dec_mux_text);
@@ -309,6 +323,10 @@ static const struct snd_kcontrol_new 
rx3_mix1_inp2_mux = SOC_DAPM_ENUM(
  				"RX3 MIX1 INP2 Mux", rx3_mix1_inp_enum[1]);
  static const struct snd_kcontrol_new rx3_mix1_inp3_mux = SOC_DAPM_ENUM(
  				"RX3 MIX1 INP3 Mux", rx3_mix1_inp_enum[2]);
+static const struct snd_kcontrol_new rx1_mix2_inp1_mux = SOC_DAPM_ENUM(
+				"RX1 MIX2 INP1 Mux", rx_mix2_inp1_chain_enum);
+static const struct snd_kcontrol_new rx2_mix2_inp1_mux = SOC_DAPM_ENUM(
+				"RX2 MIX2 INP1 Mux", rx2_mix2_inp1_chain_enum);

  /* Digital Gain control -38.4 dB to +38.4 dB in 0.3 dB steps */
  static const DECLARE_TLV_DB_SCALE(digital_gain, -3840, 30, 0);
@@ -740,6 +758,10 @@ static const struct snd_soc_dapm_widget 
msm8916_wcd_digital_dapm_widgets[] = {
  			 &rx3_mix1_inp2_mux),
  	SND_SOC_DAPM_MUX("RX3 MIX1 INP3", SND_SOC_NOPM, 0, 0,
  			 &rx3_mix1_inp3_mux),
+	SND_SOC_DAPM_MUX("RX1 MIX2 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx1_mix2_inp1_mux),
+	SND_SOC_DAPM_MUX("RX2 MIX2 INP1", SND_SOC_NOPM, 0, 0,
+			 &rx2_mix2_inp1_mux),

  	SND_SOC_DAPM_MUX("CIC1 MUX", SND_SOC_NOPM, 0, 0, &cic1_mux),
  	SND_SOC_DAPM_MUX("CIC2 MUX", SND_SOC_NOPM, 0, 0, &cic2_mux),
-- 
2.21.0

------------------------------------->cut<-----------------------------



> in the initial patch, but the last remnants were removed in
> commit fecd5c09ddf8 ("ASoC: msm8916-wcd-digital: remove few unused variables").
> 
> On 5.3 everything seemingly worked even with that error, but on 5.4-rc1
> the sound card is no longer successfully registered:
> 
> 	qcom-apq8016-sbc 7702000.sound: ASoC: failed to instantiate card -19
> 
> This happens because a check for the return code of
> snd_soc_dapm_add_routes() was added in
> commit daa480bde6b3 ("ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()").
> 
> Avoid the error by removing the routes that reference the missing widgets.
> 
> Fixes: ef8a4757a6db ("ASoC: msm8916-wcd-digital: Add sidetone support")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>   sound/soc/codecs/msm8916-wcd-digital.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
> index 9fa5d44fdc79..36d8f619e298 100644
> --- a/sound/soc/codecs/msm8916-wcd-digital.c
> +++ b/sound/soc/codecs/msm8916-wcd-digital.c
> @@ -1022,11 +1022,6 @@ static const struct snd_soc_dapm_route msm8916_wcd_digital_audio_map[] = {
>   	{"RX3 MIX1 INP2", "IIR1", "IIR1"},
>   	{"RX3 MIX1 INP2", "IIR2", "IIR2"},
>   
> -	{"RX1 MIX2 INP1", "IIR1", "IIR1"},
> -	{"RX2 MIX2 INP1", "IIR1", "IIR1"},
> -	{"RX1 MIX2 INP1", "IIR2", "IIR2"},
> -	{"RX2 MIX2 INP1", "IIR2", "IIR2"},
> -
>   	{"IIR1", NULL, "IIR1 INP1 MUX"},
>   	{"IIR1 INP1 MUX", "DEC1", "DEC1 MUX"},
>   	{"IIR1 INP1 MUX", "DEC2", "DEC2 MUX"},
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
