Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B57958954
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 16:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3546C1;
	Tue, 20 Aug 2024 16:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3546C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724164271;
	bh=h8yl/bm1b7kGTRT5b2grebCJdkKQrrmEhi2H+FF1qog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H+2d+R0pvpbSdQcYFsmj3LFAyf5PtdX0Ixyzl+1wtIVt4Mt41AuH9wdzE017nKV1a
	 Zd2poRCoIjfp6Pf1Brnex3V9MOgLOViWExeLhl+BBRDJnLlEXB+zveTvJHKrJd/Q+T
	 NhiTeToHWf1zq4mN7ZaQima9NJyYH98pyssW6jnI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68288F80617; Tue, 20 Aug 2024 16:29:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C115F805FA;
	Tue, 20 Aug 2024 16:29:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB82F8014C; Tue, 20 Aug 2024 11:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A80C6F8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 11:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80C6F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OZwD38G4
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5becd359800so4215140a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Aug 2024 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724146985; x=1724751785;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HB9GJpO2A9Zu27iG4GJBn2lNd3c+yJqVBgrLVTv/JVI=;
        b=OZwD38G4aW5sa/e8GCHvWk3OT6rtG4+SgXUT5UWSBMuqKw8+lSiVL3rv9OV2YHVRqk
         suGhVO3FALme7iGX3MUyaYEW9geGPUhtnh5zoS5N2h1gab/R+bPxHKqAjYSBki/9s77Y
         hVlMNSTffNsxCSyq+0Ixts5VzYjEhcUI0flYGWuu8g9896iL0lKh4//hUDZfsLmhoPSj
         zSP48M5sh4e2uAHQZ+qrTqNSKJt2degA+tdbpU5et0cqpXCcLST0tgYwnpSzKmKCZ2PB
         cJ2G1zSCfWg7jYv5i3PkiUDIPs7cEs+i8t1pvgd8k2GbOuFev1fnU37KOX1b2cb17Qox
         ivrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146985; x=1724751785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB9GJpO2A9Zu27iG4GJBn2lNd3c+yJqVBgrLVTv/JVI=;
        b=ajtowpFpp1VVoUJ3IvRXBJt8eg5m2B6b4d5LFT1CwP0T+VGb1V6z0cNEx0sjIsopJk
         3CZ+Hp4EZPtR/fXZI28qyXGR4g207DB4le5qLDfe+9V7y/Kl5517v2JAETPj7DcthyEk
         hxddC64M9W/JsbGM23c+aWr4zhQfki74V9mCTxjV87lKx9ecCn5RgkncUk/rVWabQRLZ
         gR/bC77kG4UUJcxo81WYNuEEJ+pa8mV6IxFPPNuKC2ebpqyiB/zD1QylwNaNK/QgKmGc
         +0gBOs8KhvM4VbUyheKPcRpD8HRgBKsFQSkSEPt6VdL+WRXCoOQOjYsJ3IYgaayYxO8y
         xKgw==
X-Gm-Message-State: AOJu0YzktXl1CtpDZNIx5+SLpce+pWbDbOoxhxvcYvl/8UhruGmDn5HB
	7xD+8MSfNw2KPXcztlbsBvCb3YqwVH0l8IY+Cg8FwLbTHaYH+RBo
X-Google-Smtp-Source: 
 AGHT+IFPycyN8twdBzjqzi9yYN6HmGfXTYQrId5E5aQm0wwJzJHD7A8ue3GOzlLt4gOz73IDq0PTfw==
X-Received: by 2002:a17:907:d862:b0:a7a:b781:60ed with SMTP id
 a640c23a62f3a-a839292f71fmr939833766b.17.1724146984784;
        Tue, 20 Aug 2024 02:43:04 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396ce0asm737786466b.206.2024.08.20.02.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:43:04 -0700 (PDT)
Message-ID: <05d2e44c-fa39-4622-ac4f-da9da2f02535@gmail.com>
Date: Tue, 20 Aug 2024 11:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ASoC: msm8916-wcd-analog: add lineout output
To: Adam Skladowski <a39.skl@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-8-163f23c3a28d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-8-163f23c3a28d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: konradybcio@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7UQWIIDEE6M74JJCTMVY35SNOQT3JDBB
X-Message-ID-Hash: 7UQWIIDEE6M74JJCTMVY35SNOQT3JDBB
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:26:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UQWIIDEE6M74JJCTMVY35SNOQT3JDBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31.07.2024 5:25 PM, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add descriptions and controls to toggle lineout output
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 64 +++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index b9325290c28d..38949556f7d9 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -233,6 +233,8 @@
>  #define RX_EAR_CTL_PA_SEL			BIT(7)
>  
>  #define CDC_A_RX_EAR_STATUS		(0xf1A1)
> +#define CDC_A_RX_LO_DAC_CTL		(0xf1AC)
> +#define CDC_A_RX_LO_EN_CTL		(0xf1AD)
>  
>  #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
>  #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
> @@ -327,6 +329,8 @@ static const struct soc_enum hph_enum = SOC_ENUM_SINGLE_VIRT(
>  static const struct snd_kcontrol_new ear_mux = SOC_DAPM_ENUM("EAR_S", hph_enum);
>  static const struct snd_kcontrol_new hphl_mux = SOC_DAPM_ENUM("HPHL", hph_enum);
>  static const struct snd_kcontrol_new hphr_mux = SOC_DAPM_ENUM("HPHR", hph_enum);
> +static const struct snd_kcontrol_new lineout_mux = SOC_DAPM_ENUM("LINEOUT",
> +								 hph_enum);
>  
>  /* ADC2 MUX */
>  static const struct soc_enum adc2_enum = SOC_ENUM_SINGLE_VIRT(
> @@ -630,6 +634,46 @@ static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> +static int pm8916_wcd_analog_enable_lineout_dac(struct snd_soc_dapm_widget *w,
> +					 struct snd_kcontrol *kcontrol,
> +					 int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, CDC_A_RX_LO_EN_CTL,
> +				0x20, 0x20);

Using BIT(n) here would be nicer, but this looks reasonable otherwise

Konrad
