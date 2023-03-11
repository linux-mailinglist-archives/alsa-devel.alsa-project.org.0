Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90A6B5B22
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 12:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE6D180F;
	Sat, 11 Mar 2023 12:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE6D180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678534125;
	bh=3fwrGP6s5U1Q1HZA3QW6yY6BQ0IZ5mXXm5iXoOYNaZI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mz23oicDatlhdgh9B74CmN5PopMqfhmiR85pBZ9DQ+BTWk8nUqmA3uGnHBbYysNQV
	 foKxBmFqMS8yidUyo5dy8Xy3OQ9ZGKzJJApTgRZrqKq7CSRb8tHToESArWXRDAV652
	 FMfCoJjQIS/PUt5ywc/6Jznq5XSDo1CfyWEyICJ0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D40AF80236;
	Sat, 11 Mar 2023 12:27:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C311AF8042F; Sat, 11 Mar 2023 12:27:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACF5EF800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 12:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF5EF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I348AZRC
Received: by mail-ed1-x534.google.com with SMTP id o12so30793155edb.9
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Mar 2023 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678534067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hY4Hys0PLC8Fp+eaQDoxQKvTBpvuzKMcoEiAcnO+9IQ=;
        b=I348AZRCBFTgkoW/CNUunkv7UCLakm2Bf1pXeEFjdvQ6h882ENx+16YGDts+6eGvM8
         vaK2oLBSiqsj4BXp4GhdLC1+YLubqK+6fPa46us2MuVojQ5xMt8ATGhhW5IIf9OobDvn
         0+ePJ1NR90iNwliuMs4aRvM/o86YztlUOoFlI28brOT69Lp4UpMIM6S5hC7odSlNwzvs
         Gu15oxUgNl/9lDfl5D1bM0Ep2M3YcAAyN3nVP00QBI+B/kpoXKN76wyIS9mGDaMm7Luo
         hqrTmCDbRWXxxE2hwzJTUtmUHRURkAFOim8qGpLaovdrAKByEHAGBD8oqTpcleln6OLf
         hCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678534067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hY4Hys0PLC8Fp+eaQDoxQKvTBpvuzKMcoEiAcnO+9IQ=;
        b=l5fqgBNk7dk4VNjOgKpZbu8hbTlanlU89Rtwt7KFr6X2/l7Ks9swwaiqOim+7gtC6v
         nIBLvAr/wK9jZLRtXBhc+eeNiLmFebmnvBGZyuZm/CVXzKJyr9go2PbaDmt45OT+XGRP
         S6pqqYq+mWTGAP2JedtYa/fWcd/+vcuG7GkeDzsLT0tk/Ol4hvQA7N2SuQjRM/wnzxgk
         XnFPAHQQT6ZyyxNT7/C1WCDDMHZRDtK8NYkFI/a3uuIS7SJ18gDFvd9T6CCVw+8NXqub
         51ZQc/zdImAv7+EJ9Hg3GwFK1QjO5IPQWRBhPRhX4H6BXkEuaOZQhRf7avmOROqpsxsi
         uQaA==
X-Gm-Message-State: AO0yUKUG78cyyAkDXUjUBH3qaB2YWgdeUYpO+L7B3AwvUOwAjWTCjWsl
	/kBTxovOjJy1xOp9eF/UYjZdQw==
X-Google-Smtp-Source: 
 AK7set/F7WYIVByuwghQfqPBvx4tXtULvRSGgJK2/C0DnWI6fyepiXqKt7MqE3bfLYO3WpN4g5BY4A==
X-Received: by 2002:a05:6402:1608:b0:4c6:9132:65 with SMTP id
 f8-20020a056402160800b004c691320065mr25977211edv.20.1678534066887;
        Sat, 11 Mar 2023 03:27:46 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b?
 ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a508d07000000b004af6c5f1805sm1073615eds.52.2023.03.11.03.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:27:46 -0800 (PST)
Message-ID: <1f88b410-e48f-969a-8bdb-9cdb304ecd6c@linaro.org>
Date: Sat, 11 Mar 2023 12:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/9] ASoC: codecs: lpass-rx-macro: add support for SM8550
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
 <20230310132201.322148-4-krzysztof.kozlowski@linaro.org>
 <5b923d49-c151-0ed7-3db1-a7caf85109f3@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5b923d49-c151-0ed7-3db1-a7caf85109f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y4JHYJQQH5L3IE5OREST3ZVOMC3AS7OU
X-Message-ID-Hash: Y4JHYJQQH5L3IE5OREST3ZVOMC3AS7OU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4JHYJQQH5L3IE5OREST3ZVOMC3AS7OU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/03/2023 12:23, Srinivas Kandagatla wrote:
> Thanks Krzysztof for adding this support.
> Few minor nits,
> 
> On 10/03/2023 13:21, Krzysztof Kozlowski wrote:
>> Add support for the RX macro codec on Qualcomm SM8550.  SM8550 does not
>> use NPL clock, thus add flags allowing to skip it.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c | 39 ++++++++++++++++++++++++-------
>>   1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index a73a7d7a1c0a..e322d918db36 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -395,6 +395,9 @@
>>   #define COMP_MAX_COEFF 25
>>   #define RX_NUM_CLKS_MAX	5
>>   
>> +/* NPL clock is expected */
>> +#define RX_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
> 
> We could probably rename it and move it to 
> sound/soc/codecs/lpass-macro-common.h as this equally applies to all the 
> codec macros.
> 
> 
> Once done,
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Sure, I'll move it there.

Best regards,
Krzysztof

