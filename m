Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B86D9EFD
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 19:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F97FF68;
	Thu,  6 Apr 2023 19:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F97FF68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680802810;
	bh=kchLYZCtyE20jHsrTChSrJl6yL+888EKKVAUG5Jaiu8=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZLJkJ74LgAYy/7JeuSJHDMBkHaSPoC/m6c1zSJhirceK8yN1wccOUsXdGA6MqSc+n
	 yRxs1VxM8/9WUHRCPDyRykZW+SVhl2VZBeRDD/yIH8tJ1HRQ916teeghuCgIFbgl6S
	 JcVUc+5b+Nv78nlnjOJsgBhhAY3RzbYsM9778+LQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7588FF80171;
	Thu,  6 Apr 2023 19:39:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 478CEF8051F; Thu,  6 Apr 2023 19:39:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE10FF8026A
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 19:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE10FF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KQSXqvzJ
Received: by mail-ej1-x633.google.com with SMTP id sg7so3227486ejc.9
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680802736;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jm6/z3zOtbY9jNueTA1ERmfBJwq9/SWUgmv3+goc94=;
        b=KQSXqvzJuUrpkMII+mSFk3JtEuL9g/2z/I3ay1hyHJ50iCkeDXhBJu9MweUB+QlZ1I
         fWfCCO7swoD308CffMNyWm6CeZCL43P6CpUJVWZaulSgITdz5k1KC/COASsdgHv9hyFe
         XcSfqRzhbhBGp3xEUSykiaphLqAgzuFu/7QmEBc0fgJzXs+f4wfN/h0WIatJFUmJVYmv
         udqjSkuLh/kU4co+Kx4RfsTLliTxnpOsvZhvKPb74YgOMbXS7iVprfd6Sa/smr/4Wy3O
         DJY1vhyGgRN+m1F3o581Q7u2XT3QPti/MeJaACtnYaHRJiXcxT727ymWXGyiBfufmJtE
         K2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680802736;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jm6/z3zOtbY9jNueTA1ERmfBJwq9/SWUgmv3+goc94=;
        b=0ijdoScuf+/WVeeopE0c9MHbs+hbGShVgUMrQ8Cr9tMDdvqIKzs4j3TRQu5+7k+JIt
         Njkr0yaQZ8EJbVEyHgCzcEtqHOT7C9gkIY0P24e9CMPJPrxkWm9ClZf28Qxr1ipKRpjx
         37taClNbrm1Zi9ryRb7/7tsOwlZRg6cZQCQYUGnVf+3f1jGDrlXYLG7L/Zxhsn3atw14
         VEMqJXuZEml0zGNhSjyH/ZJrCkDfaRSDBLfd8kjJHYhNvDr0pBF6jX7L8XsiyELC2GOS
         MxAn+gQFlTToYh9WCoNmntHSHF2tbUjXdkYSBOUGauV7xA0+fRsECuzaUsww5tQj5WjQ
         Na9g==
X-Gm-Message-State: AAQBX9febyLs7hwIErMK+FeG1CQQPeRLgRoH5qXJGX0NjgRqB7lAr5do
	i0aDGWiRzxqfHwhZlRxOjHHWsg==
X-Google-Smtp-Source: 
 AKy350YVZrEszAeDepT1f3g3EF3G04yZ8f9eLpPBlIRH16dvMRX7+OLjWRipQpDZ9KlxMILetNOn6A==
X-Received: by 2002:a17:907:7854:b0:931:99b5:6791 with SMTP id
 lb20-20020a170907785400b0093199b56791mr6446720ejc.72.1680802735836;
        Thu, 06 Apr 2023 10:38:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed?
 ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id
 gn20-20020a1709070d1400b00946e6dd887csm1051754ejc.126.2023.04.06.10.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:38:55 -0700 (PDT)
Message-ID: <45ac9ff4-ff42-afac-9c96-a460c64436a3@linaro.org>
Date: Thu, 6 Apr 2023 19:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8580: Convert to dtschema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230405205025.6448-1-danascape@gmail.com>
 <7c1d4762-469f-0bf9-3482-ff99bc5840b0@linaro.org>
In-Reply-To: <7c1d4762-469f-0bf9-3482-ff99bc5840b0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GII7QPNE3EI6OLK2VKDLK575LM26ZOYQ
X-Message-ID-Hash: GII7QPNE3EI6OLK2VKDLK575LM26ZOYQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GII7QPNE3EI6OLK2VKDLK575LM26ZOYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/04/2023 19:35, Krzysztof Kozlowski wrote:
> On 05/04/2023 22:50, Saalim Quadri wrote:
>> Convert the WM8580 and WM8581 audio CODEC bindings to DT schema
>>
>> Signed-off-by: Saalim Quadri <danascape@gmail.com>
>> ---
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

And a bit change of mind - please make it one binding (as my comment for
wm8523).

Best regards,
Krzysztof

