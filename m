Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFE789527
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 11:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96BD083B;
	Sat, 26 Aug 2023 11:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96BD083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693042339;
	bh=yN7idGTrle3+PqqupMjY9iyd12xDabq3TPmPq5o6P5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TiagNWZZTKWpcy+X0lAr5XY3cXexcqj8OtlQlEjP5aEkyXlBHmKyPplYmd1AZHgg5
	 q2Y64JM/7d1Pow4s+8U0gJbADAf1jbNVhBeKXsF8a91plPq1sNc6pub10j5ujQBDgp
	 tPJhNQkR/fkP/UXJ70AI3SjtVKx5Y9R4zwXXgWWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27B4F8022B; Sat, 26 Aug 2023 11:31:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E2D0F800F5;
	Sat, 26 Aug 2023 11:31:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA847F80158; Sat, 26 Aug 2023 11:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50694F800BF
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 11:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50694F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Yb99bZ4w
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-52a40cf952dso2388977a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 26 Aug 2023 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693042273; x=1693647073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EChLnWgFwtxG0VHdbqAfcg52xVSiRBXQV7i6dT2tv7c=;
        b=Yb99bZ4wGZxqk+slRTMR8Dxt/Cyko19x6lyUCAl3+zIEnc1KUf1Kiqm2QjayPyVbN4
         vFeEIVj8PvJaeNk8KyluY1OG0UdplxyS2OaUWME8zIUwL6MCEBkjYXdD2lVJ61fu177L
         Ela/AVLWGDs3XRQIAqU2USlD0wHj6X2rAr/mM3G3nlDznbMtmhVeT0NWxtIyEzhaDBHv
         JvGvjZFQPctFSYnehZ629dyaY+ZwfTFOE5BoJY/ByFUuqw3fURUTzBzgQsdsIqgnlBCd
         KrJDuSoyfKnNR92I3+iVV+ZJezdyj2r7aVk3fs2hs2HXKzEM5+VY9pvbJD62foeBZFF+
         YOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693042273; x=1693647073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EChLnWgFwtxG0VHdbqAfcg52xVSiRBXQV7i6dT2tv7c=;
        b=eMQfkFl5PElGZUgyh4UwJIZSVCb6fGph3KZlywvF0FQP1oPX95gtixjo5/5a3vKwJ+
         mxubovGSlAQuFCHRDZPvef74QuHk+M5HF9oW/XWGg/pyC8dNzZRs1OU2O/1bzZ9J/b58
         OkfLZP6aIY5Y4lYeCAZWgGPW682zH6QDaN/2wv4xoMzSGupMHzkLjZN5v/1NXKZuewI+
         iOGAJ3KHPPkOG+vW+8WjN7MDZP2r+smZbt8O8C3Hv7O5uEPJONCZuS6+Swx8cHNwP+Zs
         0SBtEnIKf1/07I88+7npJN0zzK+9PABmaozBpeSX19r47JYVqoXlI1DuTdAxWz3BZMQD
         ehug==
X-Gm-Message-State: AOJu0YzFDWH+3qLDYM0G47ieVGUN7y2X3PN57mVN/iziiCVyPjzbot+x
	RmEQdZaivYCzWKIYpMZEln7X4w==
X-Google-Smtp-Source: 
 AGHT+IFLC+zY307Od3pUJ2Xn6CVOHUDNZckaAlPAclBJHxbKZTsMTGLOoa08s9rJeTyIXzDEwnGoqQ==
X-Received: by 2002:a17:907:2bee:b0:9a1:b950:abab with SMTP id
 gv46-20020a1709072bee00b009a1b950ababmr9687785ejc.32.1693042273124;
        Sat, 26 Aug 2023 02:31:13 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 ha19-20020a170906a89300b0099c157cba46sm1914658ejb.119.2023.08.26.02.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 02:31:12 -0700 (PDT)
Message-ID: <181b5ac9-25c3-539e-6bde-773e833ee9b6@linaro.org>
Date: Sat, 26 Aug 2023 11:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-tx-macro: Add SM6115 support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
 <20230825-topic-6115tx-v1-2-ebed201ad54b@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825-topic-6115tx-v1-2-ebed201ad54b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2ZHWEGK73FBY42QQZM2JDS24VJSRJ37N
X-Message-ID-Hash: 2ZHWEGK73FBY42QQZM2JDS24VJSRJ37N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZHWEGK73FBY42QQZM2JDS24VJSRJ37N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/08/2023 19:23, Konrad Dybcio wrote:
> SM6115 has a TX macro, which surprisingly doesn't host a SWR master.
> Conditionally skip the SWR reset sequence on this platform.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.h |  2 ++
>  sound/soc/codecs/lpass-tx-macro.c     | 22 +++++++++++++++-------
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 4eb886565ea3..d3684c7ab930 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -8,6 +8,8 @@
>  
>  /* NPL clock is expected */
>  #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
> +/* The soundwire block should be internally reset at probe */
> +#define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
>  
>  struct lpass_macro {
>  	struct device *macro_pd;
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 3e33418898e8..82f9873ffada 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2045,15 +2045,19 @@ static int tx_macro_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_fsgen;
>  
> +

Stray link line.

Rest looks good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

