Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA10767EB5
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jul 2023 13:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2398383E;
	Sat, 29 Jul 2023 13:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2398383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690630233;
	bh=vyQm7zkn+2q2A/gc6HtuQyRDHtefGsqsv19ka7OMsoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nGveFQIJGPaKE5g8Cv1Zs+3WbrGnYID+H9UFJornLJ8fVDE2xLzQoZ/R00dqzJIIz
	 +IRGUhQEaKcFkpo/LxJT3vM/v8OTm0/GENvjKNW6Dl5FwskpF7lMLgB9V/T2Dn7Tn3
	 XUQ3M8UuRw0K3/llSQoalsRkHotLzf64XKBaPuQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D19ADF80535; Sat, 29 Jul 2023 13:29:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C45F80163;
	Sat, 29 Jul 2023 13:29:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8A2EF80535; Sat, 29 Jul 2023 13:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA330F80310
	for <alsa-devel@alsa-project.org>; Sat, 29 Jul 2023 13:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA330F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P7noIDsX
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3175d5ca8dbso2755364f8f.2
        for <alsa-devel@alsa-project.org>;
 Sat, 29 Jul 2023 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690630173; x=1691234973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yl2EKCv4YXbcjRsX9gIcMNI5UcqTI5Buzhhnk6Ju+qU=;
        b=P7noIDsXbNnRhgZ1Mg3Z6aypdp1IfKBXuSfbDb6P+Y4WdJIRu8DanXwPlS9AVO2hbT
         jZ3NSkpiAR1i89IgUTyjN0WwgAo5BPK9pt+yrIN8+CvZEi/QPZCmQNhwNX0VgskvMikR
         0yYM504A/wqMl/1wf2sPqb7JrsLSrPJoripGqlv9ePgBnR5yDVPE08vx/4GGmcOcjlr/
         PG05+rkdkWJfPT+1ldi96YIqim1KM421qUQGQinyuPZ7GJ59f7u6cinCMtKr7Yn7nA6C
         T2S8U1WNRMlyKUVpUvA3bq1wxPXG7xld7mWMIvZxM4k/Xd5HrE6FBng13CfT0vwlIDVx
         /LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690630173; x=1691234973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yl2EKCv4YXbcjRsX9gIcMNI5UcqTI5Buzhhnk6Ju+qU=;
        b=hkpyZcDthmTajjv6KmG8fgA+VxJj3PlDYwYnAtLixB7Ivy7wOZ497M81DXvrrR1nwB
         MGVFTj/Lcm5D2ywFnMuxOxTo53e9mH5NOui+O3KyX2DZgeGNaahJ1Tw4veJDngDN0Fxw
         fSVOqK5PVjO5qNHoFtAVyfBGBUhKQPtuj68XYcOIEQR6LXpKXQ88BunYv8Txu/N9hwnT
         tGIs+zCyODTBy01uZVnUzNr/oV/83Y0PG9I44iDM4ugX4q0byS7wA1hcWB99V2368Psf
         OatobPOJru9Z+2nf0Jemh+SjzcgOWjiKkC3Ma3NMhNLeBPnvYnpg4vrzj7K09cToMFF+
         rspQ==
X-Gm-Message-State: ABy/qLZ3Xa0M871nHi1OpSm9wKplU6E0SQCOaw0LpmqDRLTEHgcD29kp
	bYrBuDleHCxf5LimWrrFKEi9vw==
X-Google-Smtp-Source: 
 APBJJlEy4rj/lqQ6TbWxXc1ZF0trMQbNs5KXGdjrzM2nkfjDzE3xUyG1e4YjtrkMvWKeBrYRYVhf0g==
X-Received: by 2002:adf:fa09:0:b0:317:3deb:a899 with SMTP id
 m9-20020adffa09000000b003173deba899mr3659091wrr.1.1690630172870;
        Sat, 29 Jul 2023 04:29:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b0031773a8e5c4sm7224137wrn.37.2023.07.29.04.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 04:29:32 -0700 (PDT)
Message-ID: <c4cc2dfa-ca3f-1d51-8a3b-a131ccc54d03@linaro.org>
Date: Sat, 29 Jul 2023 13:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3 5/5] ASoC: codecs: aw88261 chip register file, Kconfig
 and Makefile
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, 13916275206@139.com,
 herve.codina@bootlin.com, ckeepax@opensource.cirrus.com, doug@schmorgal.com,
 fido_max@inbox.ru, povik+lin@cutebit.org, liweilei@awinic.com,
 yijiangtao@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230729091223.193466-1-wangweidong.a@awinic.com>
 <20230729091223.193466-6-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729091223.193466-6-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W2CWTB2M5YBC6UUSBKJ6UKRVTMJZ7WHD
X-Message-ID-Hash: W2CWTB2M5YBC6UUSBKJ6UKRVTMJZ7WHD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2CWTB2M5YBC6UUSBKJ6UKRVTMJZ7WHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/07/2023 11:12, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Mainly includes aw88261 register table, Makefile and Kconfig.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  sound/soc/codecs/Kconfig               |  15 +
>  sound/soc/codecs/Makefile              |   3 +
>  sound/soc/codecs/aw88261/aw88261_reg.h | 374 +++++++++++++++++++++++++
>  3 files changed, 392 insertions(+)
>  create mode 100644 sound/soc/codecs/aw88261/aw88261_reg.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index c2de4ee72183..1e3526812cc8 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -55,6 +55,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_ALC5632
>  	imply SND_SOC_AW8738
>  	imply SND_SOC_AW88395
> +	imply SND_SOC_AW88261
>  	imply SND_SOC_BT_SCO
>  	imply SND_SOC_BD28623
>  	imply SND_SOC_CHV3_CODEC
> @@ -640,6 +641,20 @@ config SND_SOC_AW88395
>  	  digital Smart K audio amplifier with an integrated 10V
>  	  smart boost convert.
>  
> +config SND_SOC_AW88261
> +	tristate "Soc Audio for awinic aw88261"
> +	depends on I2C
> +	select CRC8
> +	select REGMAP_I2C
> +	select GPIOLIB
> +	select SND_SOC_AW88395_LIB
> +	help
> +	  This option enables support for aw88261 Smart PA.
> +	  The awinic AW88261 is an I2S/TDM input, high efficiency
> +	  digital Smart K audio amplifier. The output voltage of
> +	  boost converter can be adjusted smartly according to
> +	  the input amplitude.
> +
>  config SND_SOC_BD28623
>  	tristate "ROHM BD28623 CODEC"
>  	help
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index b48a9a323b84..9df43de213f0 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -49,6 +49,8 @@ snd-soc-aw8738-objs := aw8738.o
>  snd-soc-aw88395-lib-objs := aw88395/aw88395_lib.o
>  snd-soc-aw88395-objs := aw88395/aw88395.o \
>  			aw88395/aw88395_device.o
> +snd-soc-aw88261-objs := aw88261/aw88261.o \
> +			aw88261/aw88261_device.o
>  snd-soc-bd28623-objs := bd28623.o
>  snd-soc-bt-sco-objs := bt-sco.o
>  snd-soc-chv3-codec-objs := chv3-codec.o
> @@ -431,6 +433,7 @@ obj-$(CONFIG_SND_SOC_ARIZONA)	+= snd-soc-arizona.o
>  obj-$(CONFIG_SND_SOC_AW8738)	+= snd-soc-aw8738.o
>  obj-$(CONFIG_SND_SOC_AW88395_LIB) += snd-soc-aw88395-lib.o
>  obj-$(CONFIG_SND_SOC_AW88395)	+=snd-soc-aw88395.o
> +obj-$(CONFIG_SND_SOC_AW88261)	+=snd-soc-aw88261.o
>  obj-$(CONFIG_SND_SOC_BD28623)	+= snd-soc-bd28623.o
>  obj-$(CONFIG_SND_SOC_BT_SCO)	+= snd-soc-bt-sco.o
>  obj-$(CONFIG_SND_SOC_CHV3_CODEC) += snd-soc-chv3-codec.o
> diff --git a/sound/soc/codecs/aw88261/aw88261_reg.h b/sound/soc/codecs/aw88261/aw88261_reg.h
> new file mode 100644
> index 000000000000..7ef128a3e6ee
> --- /dev/null
> +++ b/sound/soc/codecs/aw88261/aw88261_reg.h
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: GPL-2.0-only

If you add the headers now, it means they are not used in any previous
patches. Therefore drop the header - it is useless.

Best regards,
Krzysztof

