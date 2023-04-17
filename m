Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E06E4B3D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 16:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBD4E76;
	Mon, 17 Apr 2023 16:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBD4E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681741057;
	bh=QW/AIuLmWJNbs0IGzSAaEWN24Wx+ii6/AKm3sB/4gAE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PdEzGZGbk0/f7DkyEYuyd+GvyabjxsWUitPf9Znqu8hUL8YmFCUAi9xlLvGg4BU0y
	 SQZqgOJL6Hf78Yaty9rwGYm+RkPzjQBLYK3HiyYfuOjxxAgWu2xBJEWjDAms62iEgK
	 2FwLF9POzONGG7ZvoJM2RvQ+mKx4fYlu/uhpag9Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17906F804F2;
	Mon, 17 Apr 2023 16:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54099F8052D; Mon, 17 Apr 2023 16:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76AFEF8049C
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 16:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76AFEF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JR2AESFF
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-505035e3368so4470758a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681740990; x=1684332990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVQRzgONTjXgcIxkUzSecJIpFbUF/z8zPatZhBjABrY=;
        b=JR2AESFF0BC+QkXNEMd1fyoFzNxcA7STjpz5F0nsNpOnZo5UEei7/goAt80LRQfUYY
         1g4Hf4HFnC1gAKhYF5InoeQuYnsmsq7RSGaVS/7NaMAgGQLTSB/ROSSrbqGahMtVIgtL
         sOyapjl4n9Ob0mB1pL91p2BcKrUXfod4S5kC5MrnNEhr3W1j+vvr6xat0h60lRHxA3O7
         qiMKeFzqIl6f6B499g/4MK3g+sHkzMRybDdVgOsTnoSQZDtfDhOB2PVrqTmXC5nkNEf2
         m36JoYyw7xsdwNyYqiaUayZp839SUz3Vj7vWpBkBRvjHP6xlEbYWacpfWVeW5YXbSxI2
         0n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681740990; x=1684332990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVQRzgONTjXgcIxkUzSecJIpFbUF/z8zPatZhBjABrY=;
        b=CLlCDB5L9M8jMK6O75bitnQh3yZS2rqBaT0Mnf7KXAHVnIMPDcmKWN8AS+534OYnVs
         ONhBJ2BqmRTU4txagyTur0MBFEYXjUw7NPRKK1S5gyJFn/ZdUASn+rxOW4KffZmYQ/xu
         /e2MZQ/oEyJ4nkS8b7yzo4EdUifDn9D3YjHqT3gD0KWNS7Kp6FSunE+xlCoeayUUg8fK
         jGpqq3oeZYtu/DPnBZ8Hzq77ichIFKL9Zvr5rRkLkAI6hX3netF96sdoIrbCl764Q5/1
         pCogGV+HymZSUgedsW3kFfn8B8yBEtaWgCvOd4J0E22MrfYBZDphTRx050+HqUQGnEto
         1JhQ==
X-Gm-Message-State: AAQBX9c/Fcx6CkbB3GdI/PkvhbVWc2tAOJPqARK66qXuiEcYPgQHW0zg
	aOl3F7pzZjq99hNYbUz5N2jxSMeLKx++9QKqIok9uA==
X-Google-Smtp-Source: 
 AKy350aZvD7dqPSR14EhguXP0BaRVtu68WfxF+4FDPU3OJWaId59qnrxRKHVkTGD2yDgSTgenaausA==
X-Received: by 2002:a50:ef10:0:b0:506:b88a:cab4 with SMTP id
 m16-20020a50ef10000000b00506b88acab4mr209225eds.3.1681740990555;
        Mon, 17 Apr 2023 07:16:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511?
 ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 b6-20020aa7c906000000b0050687dbb5dasm4025762edt.31.2023.04.17.07.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:16:30 -0700 (PDT)
Message-ID: <dccd1951-9fbe-272b-541d-72446ea892e6@linaro.org>
Date: Mon, 17 Apr 2023 16:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 6/7] soundwire: qcom: add support for v2.0.0 controller
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-7-krzysztof.kozlowski@linaro.org>
 <f2f1871c-38f1-52b0-d90d-d1f263048606@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f2f1871c-38f1-52b0-d90d-d1f263048606@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JCBOLPZD76NUDCVVOV5DQJWQQY4QKHTW
X-Message-ID-Hash: JCBOLPZD76NUDCVVOV5DQJWQQY4QKHTW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCBOLPZD76NUDCVVOV5DQJWQQY4QKHTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/04/2023 13:27, Srinivas Kandagatla wrote:
RM_INTERRUPT_STATUS_RMSK);
>>   
>>   	/* Configure No pings */
>>   	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
>>   	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
>>   	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>>   
>> -	if (ctrl->version >= SWRM_VERSION_1_7_0) {
>> +	if (ctrl->version == SWRM_VERSION_1_7_0) {
>>   		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>>   				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
>> +	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> 
> we can move this to a proper switch case rather than if else's

OK

Best regards,
Krzysztof

