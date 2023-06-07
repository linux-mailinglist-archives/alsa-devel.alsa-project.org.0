Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E57261B2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 15:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BE8C6C0;
	Wed,  7 Jun 2023 15:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BE8C6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686145969;
	bh=k7V2Omfk2e7KnP8GMRjXGui32bYHEFm3qSDwRIqrZBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SLRdhc8OEkoVsqwJhj/WJijOmsP+DgFI4fS8m+ZblWlZquDWvpygLJD9Wkidw4la9
	 uUBKVaP6w8gLjsD2OTeLaqE3675UyLdXFxJ8CKwepdFqung95IRoew5pExw79wPBPb
	 cuckZoQbTWjyx9Q1VrATJutnIOLQm/9KWP6BGaCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9BE4F804DA; Wed,  7 Jun 2023 15:51:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77760F8016C;
	Wed,  7 Jun 2023 15:51:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96167F80199; Wed,  7 Jun 2023 15:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0F60F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 15:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0F60F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a19VN202
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso1232070866b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686145870; x=1688737870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wF8v/Nr5lYY1iKzsnANRPfQdGbEg+1le4IAIlYm+ax0=;
        b=a19VN202ZsV1liveY7vlwvCagRo6i8nWU8cqZuHZ7l6n90fuEDFGdDRVDBlRlm0hB8
         0O/nODEGeEImVU/JWEgGN+bxOl5FXsedftfqcMEdkyVbRcjrWIACKGf858QYRGNzZECh
         DNxUFUhLM3Og2xoANYSFj/kZy0k95ETNqUJ6NTnLQ/B9wu7Iu2/pQmUfUXgjCsnFIoZk
         C/geriDvGCdrHAE5Be3Z/EGOZzS2damev1roaWYS5oTc91gim1TyWuJWp4mWSd6fETn+
         HvrqQJZPtLc8EY7uMYIhhiopqR+tw+qySsbEhh4CFnb+JZANpz1+gLc9en48anq/u2yO
         udBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686145870; x=1688737870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wF8v/Nr5lYY1iKzsnANRPfQdGbEg+1le4IAIlYm+ax0=;
        b=O4XcTDsEds/cFp2oc56NRI0PCuSH0wFpmvAdl7gJtmNuq3AWrSL93mh2lh2Hqf43Hz
         xSHj1rEHV8cL/O64CPC7F6ZOD//c2ISO3HEYpXjic7wU9NLWMcKUvlu5bkdCQEnLSSj4
         XfgDlhp1U2QT0SEzEWi1bB6kSGE7tFsWxqyp0fStBJKi5thh71/HFUbUdSNA9eX4RXeW
         0GbAV9wE1VHewkFi2lx56PJfrKenEyBloWHcZoW5LxX9GbT0ONEUbXRVBVdhmilh/4cr
         wdcjo74sX6hgwhtIX/Jnbofl6kXqWVgmTdT/ORIACaz2SUInYENWMnqTgSIjeYpHv9UO
         RnGw==
X-Gm-Message-State: AC+VfDzSn3gZsxhAsgtf1D8XBC70tJ/49SJ2jpgoq/5CGQQqWe2UphTW
	e0yNzU9OrWbKvUcfzUaU9wdIEw==
X-Google-Smtp-Source: 
 ACHHUZ61ZYzOZ4qkEgIxn3mhmXuts2TGVrNlXVWmBlSrcX+pv3KLh/o2gVDhbbzqDVipusDsFtFojA==
X-Received: by 2002:a17:907:3e99:b0:96a:29c0:8515 with SMTP id
 hs25-20020a1709073e9900b0096a29c08515mr6259566ejc.58.1686145870379;
        Wed, 07 Jun 2023 06:51:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 ss18-20020a170907039200b0094ee3e4c934sm6901777ejb.221.2023.06.07.06.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 06:51:09 -0700 (PDT)
Message-ID: <c39dc157-bd3d-a627-4eb0-a34ff43ab664@linaro.org>
Date: Wed, 7 Jun 2023 15:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] soundwire: qcom: fix storing port config out-of-bounds
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
References: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
 <ZICBvP33XyOswWFM@matsya>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZICBvP33XyOswWFM@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DBLQM7EXFHHQ72YKH4B6SJHQ2RAIODGP
X-Message-ID-Hash: DBLQM7EXFHHQ72YKH4B6SJHQ2RAIODGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBLQM7EXFHHQ72YKH4B6SJHQ2RAIODGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/06/2023 15:10, Vinod Koul wrote:
> On 01-06-23, 12:25, Krzysztof Kozlowski wrote:
>> The 'qcom_swrm_ctrl->pconfig' has size of QCOM_SDW_MAX_PORTS (14),
>> however we index it starting from 1, not 0, to match real port numbers.
>> This can lead to writing port config past 'pconfig' bounds and
>> overwriting next member of 'qcom_swrm_ctrl' struct.  Reported also by
>> smatch:
>>
>>   drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer overflow 'ctrl->pconfig' 14 <= 14
>>
>> Fixes: 9916c02ccd74 ("soundwire: qcom: cleanup internal port config indexing")
>> Cc: <stable@vger.kernel.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Link: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/soundwire/qcom.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 7cb1b7eba814..88a772075907 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -202,7 +202,8 @@ struct qcom_swrm_ctrl {
>>  	u32 intr_mask;
>>  	u8 rcmd_id;
>>  	u8 wcmd_id;
>> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>> +	/* Port numbers are 1 - 14 */
>> +	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
> 
> Better use SDW_MAX_PORTS ?

That's interesting idea, but except of value, is the meaning actually
the same? Driver claims that port 0 is masked and max number of ports is
14. Therefore it uses in all places constant QCOM_SDW_MAX_PORTS. We need
here +1, only because we index from 1, not 0, but we still index over
QCOM_SDW_MAX_PORTS, not SDW_MAX_PORTS. Wouldn't it be also confusing to
use here SDW_MAX_PORTS but then index over something else?

Best regards,
Krzysztof

