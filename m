Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A98D5AAF
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 08:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFBA283E;
	Fri, 31 May 2024 08:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFBA283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717138013;
	bh=0Re9j0u00pdevZ2KlKx4RRRmTiC+zHWbqBp/+GYrG6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ofpYc3rifz22ECpOv7YVl/x1FmZP7KNs1ddUPJPq7dAbIXUMNINzXSufBFteQfx0u
	 rvP7vOd6lF1jaNwOnK4S9YV0uuU8Nv0pwP6MIqf4CDG9AyEV81ziHK6rKessXgFqLp
	 WtAcSFeiUFd5Q+f2nnXhBhgn07maae2Q5dV0zWIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63E06F8026D; Fri, 31 May 2024 08:46:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13985F804B2;
	Fri, 31 May 2024 08:46:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFC5FF80149; Fri, 31 May 2024 08:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D89FBF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 08:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D89FBF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ddoDlzxv
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4202ca70289so7317585e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 23:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717137986; x=1717742786;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUSOp8UvNapxCeX003T5UKHkufeJYkJ0l1crerbsGyM=;
        b=ddoDlzxvin82gTgULtKHuRM0MsLQc+jG2quAPuo2feBVGEcT9myV7wdaW5KUKB18YF
         JuyAsoA/uNFeY0Lf605Oo8lYyyL0WYUsfy5G06lu+9XXBZ2fZMjJwKRD2NpQpDJIw33S
         bLLub1yqiQe8H7Uizwu7Hje/ouBguOqae0CX8zO04M148naNgPqvxk1MdrTMovjtrBDx
         TRovZSdj8HmAiZSi7RgxRQJjauS5fPOq1jnGR87B5ykXVU51kaiKQcbxw8MGoc3Vlhvx
         pdXWWuBN0nRbjXk98o3BRsMLX9WUZ8YTt6k73oDWnTn+0JqbwmcUoX3f9CwNeQTNB1g1
         GQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717137986; x=1717742786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUSOp8UvNapxCeX003T5UKHkufeJYkJ0l1crerbsGyM=;
        b=U0v3fD3sxbUUMCTTSLjAot8nxaeFdOBa3RzrzBsGkJKYN7TxL99H1pQ8DSwrJKqpyf
         +VZB+z/sRQzarbLtYZTm6EIldtwaQlhLRw699bknEDLp4A3LqJpAmMjfkrbEldNhh7Ir
         M81hrc3to65HAO/rtwafiAB8QWLqGMi6RJL9pm3RxUELaA1EGkNanR5tydlrcMPpGqpn
         j/5jsV1/g4iXKXZZnQeXt4snIyW0R62BmOSQmknapCxycap0uqGLX1xeEUTzaRmTkASe
         LLhHexPDU+AB4p15BUWyr/s8vwjF/QstXWRxNCezJ5TUgaVhDNejnlCtUjH1+BtEQP5F
         poVA==
X-Gm-Message-State: AOJu0YxyfR/dmW4rVQUfRG5EAB/IgbjyAUUih/nSRCUxD32SDmeF1OjE
	iUe6LHIF5R7zif+dynbewVLl3lAkLKHSbWAgV00BhJOhY4kxsffQ2YSfInSODw8=
X-Google-Smtp-Source: 
 AGHT+IHQ+qTokXrRqmkS/nR6JkLNEDogtK9W4N+4B+JhENUzvVWkWuxBKMJtkvaf7Hrz2xIF3TDMfw==
X-Received: by 2002:a05:600c:3c98:b0:41f:3ee0:a302 with SMTP id
 5b1f17b1804b1-4212e0ae746mr8522225e9.30.1717137985717;
        Thu, 30 May 2024 23:46:25 -0700 (PDT)
Received: from [192.168.86.191] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4212b84aceasm15051355e9.15.2024.05.30.23.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 23:46:25 -0700 (PDT)
Message-ID: <cf25c61c-6e2a-4f07-be5f-f9b5bfa35307@linaro.org>
Date: Fri, 31 May 2024 07:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GAROBUPGEJ4VP7ED4LKGFKKN3NHF4EYO
X-Message-ID-Hash: GAROBUPGEJ4VP7ED4LKGFKKN3NHF4EYO
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAROBUPGEJ4VP7ED4LKGFKKN3NHF4EYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 30/05/2024 23:30, Dmitry Baryshkov wrote:
> Not having linux-arm-msm@ in cc for audio-related changes for Qualcomm
> platforms means that interested parties can easily miss the patches. Add
> corresponding L: entry so that linux-arm-msm ML gets CC'ed for audio
> patches too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

thanks Dmitry..

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 523d84b2d613..b9bdd1f08005 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18227,6 +18227,7 @@ QCOM AUDIO (ASoC) DRIVERS
>   M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>   M:	Banajit Goswami <bgoswami@quicinc.com>
>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linux-arm-msm@vger.kernel.org
>   S:	Supported
>   F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
>   F:	Documentation/devicetree/bindings/sound/qcom,*
> 
> ---
> base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
> change-id: 20240531-asoc-qcom-cc-lamsm-be80e19f8cd8
> 
> Best regards,
