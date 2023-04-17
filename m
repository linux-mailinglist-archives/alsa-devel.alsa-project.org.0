Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D1C6E4DEC
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 18:02:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF84DF3;
	Mon, 17 Apr 2023 18:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF84DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681747325;
	bh=DGHS3VOSvqJNuGewrE5PlsV7lNM+QJhTU/RaatyzEg0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SLMqDKHrtRooTu8IhWSi40mLfm3myku+hfO2BHjDZzev8wfZ4N0Xpl0fMtH+GG5AI
	 l9njCSw3KFQf1/JV6PPU/WOHi5n6h3URKaRYRMcPSGZ8U/xybC1JE5uKKaFmPpVEMm
	 Wd3d7cmo7iKtuJfq8qdxKUer/YuHi8V3P1ML50a0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96059F80212;
	Mon, 17 Apr 2023 18:01:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE3A2F800E2; Mon, 17 Apr 2023 18:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EA17F800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 18:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EA17F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RKtmfhmf
Received: by mail-ej1-x631.google.com with SMTP id kt6so27319032ejb.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681747261; x=1684339261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGfj7dhEzmUyz7+syDE2F39t7UKzS4afv7ZNVWEs8oE=;
        b=RKtmfhmf04iXYaQnoCUfBRfqrnHwSdKnaffoZSgvc1HJMmswfg3m8Oh7JQXi0h0Z3X
         zrRwu/cUTw2RbD+bpbhFgta2inCjd8JqjnTY2vdBd/nfExSBCMJshEaZKicjZ/62E5xm
         omM2dfAFfEh/AZmC1TgLpzZRaO1qO3PNfOhRh5IbTZNF59KQqgeAtulEZnnBzQAKhBYV
         sgjZLxi0g46qlIQrPcS5cmOLN9I2l4ovI5Y9xIWjWhvY/1dOCNHfWzN91SU+gtS2FhmB
         FFEpZZaQNOrgltQgknDXUd+54VdurJyhHqoI7BGiiLDNCWiHxXlGvaTgEfWHt3rBLaIj
         UP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681747261; x=1684339261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGfj7dhEzmUyz7+syDE2F39t7UKzS4afv7ZNVWEs8oE=;
        b=MIKxJFYlnFgXO7cRm6Oso7f6cOVyIIoQjWh963gviFRynFLghNBepi74blwwkScW3J
         rGzB5Hzl3JbohtZNpa7XfYmauXU4cSdFefpVTc9+4TuPy3Cqd4q33RjV+kteS+FaiEkH
         QZpXl+iPGDfWsEEbyw95RUkWowgJBypKhVv1gMmM1OR7JQOmDHiljFnDPVrAQB9HwKEu
         tig/QojyJNxD+jW6pFW4w100Ljs2GEHSQgEulv4i6Py0qz9D+LBmuwz8clD4QQU7RjBq
         Tj4+/LYRM1nya7868r8zvwadtC18xH54mE0FWD767IQ8yn2NVLnYl+61SACELvkXeeBg
         oIKQ==
X-Gm-Message-State: AAQBX9f/qa6oTIQJBJjnRMMPzhX0S4Wt8I6qY9H04+LXz0TZf97OKiV0
	nYfNw5uZfF2xTJG8k9/0ZKEciA==
X-Google-Smtp-Source: 
 AKy350bwoDbML000tkSfu3RK1XvtX3xs9Z47Frf6gU00ujf+0MhVCVn28uwpnRfUijyUrwaT8AClZg==
X-Received: by 2002:a17:907:a047:b0:8fa:b2b:9de with SMTP id
 gz7-20020a170907a04700b008fa0b2b09demr6941122ejc.25.1681747260869;
        Mon, 17 Apr 2023 09:01:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511?
 ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 k26-20020a17090666da00b0094a64196ed6sm6790426ejp.54.2023.04.17.09.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 09:01:00 -0700 (PDT)
Message-ID: <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
Date: Mon, 17 Apr 2023 18:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
To: Mark Brown <broonie@kernel.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
 <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
 <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AQARVI5GLKAEOKX7REJD34BXBNJLU6JQ
X-Message-ID-Hash: AQARVI5GLKAEOKX7REJD34BXBNJLU6JQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQARVI5GLKAEOKX7REJD34BXBNJLU6JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/04/2023 17:58, Mark Brown wrote:
> On Mon, Apr 17, 2023 at 05:43:03PM +0200, Krzysztof Kozlowski wrote:
>> On 17/04/2023 17:33, Mark Brown wrote:
>>> On Mon, Apr 17, 2023 at 04:14:51PM +0200, Krzysztof Kozlowski wrote:
> 
>>>> -	if (IS_ERR(wcd->if_regmap)) {
>>>> -		dev_err(dev, "Failed to allocate ifc register map\n");
>>>> -		return PTR_ERR(wcd->if_regmap);
>>>> -	}
>>>> +	if (IS_ERR(wcd->if_regmap))
>>>> +		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
>>>> +				     "Failed to allocate ifc register map\n");
> 
>>> This is a functional change.
> 
>> Hmm... I don't see it. Return value is the same, same message is
>> printed, same condition. Did I make some copy-paste error?
> 
> You've replaced an unconditional dev_err() with dev_err_probe().

Which is the core of this change... so what is here surprising? Yes,
that's functional change and I never wrote that dev_err_probe is equal
dev_err. It is similar but offers benefits and one difference - does not
print DEFER. Which is in general exactly what we want.

Best regards,
Krzysztof

