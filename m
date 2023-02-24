Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A65B6A1ACE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 12:00:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89128204;
	Fri, 24 Feb 2023 11:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89128204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677236427;
	bh=th2CNig/XJxQ21gIpjZp3gaeXw8uIbP/1zAUIwefzbI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a2dPGpKXc8QAWy8gQSYW6w6aR2eLHjxa+FPjEPwHCEyMFZcBzoe3xYbzaPZHcvcOZ
	 S0ucn/wklvWzqiI9XYfaBrYICN1SkiWBnywKdvYDPjInvq4YkThJtqE5VZ6Zvs4/sg
	 owxGPCenxy0EvW+O4CP1G8nVpqakeNLJHQjnIjlI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1620F80116;
	Fri, 24 Feb 2023 11:59:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69202F80125; Fri, 24 Feb 2023 11:59:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54161F800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 11:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54161F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uL3hKxHp
Received: by mail-wm1-x329.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so1448321wms.0
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Feb 2023 02:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtukSA39Wi90XWdmVY6UvzBxv9KPhp2uRrC15iYduW8=;
        b=uL3hKxHp/QXQ6xxqZpfnK+ZdbFhkCtPTiyzqk/+yYqbn+VoDSiH8G17tejFKbj0sQG
         Sqxqsv9U29FgWliM0iUNMh8QMmfe7m9DuuPiMK+L6JA6+dosaBHnELPLJ2E4SDNYp5gZ
         Xh7I/W1eiRMc05fMDssPr1aqjVcNe51ksM4D8K/aP0aCFZpLtR/DJsBTgf7AKmhSp1N7
         RIqDEE3o7M9Bh0aAutn7Od3daPvzZws+YrkZbEnoHN1k8ZV+BoPZTiN6i9qvldYxjFYH
         8NIg61DZWB4NzDiw720CKy3j2CypXHe7yEz/z9iJt5d8PppT+7utXZjQNKjdbIeTL2p9
         FFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtukSA39Wi90XWdmVY6UvzBxv9KPhp2uRrC15iYduW8=;
        b=kaQAahEHtqAb6K8fwybJTcpgI+50alVenPALtCzyMoY3C1/4RAL9yOESk6JpTlqYYJ
         BkZ105fmHAuUiZ2UP2fa2UVoT5alBtKCXATAjyIdlXam1XeL6ZawKVH2bkKozErj1hu6
         F5J8y167UUcmUXlmDJ1ug51BmN5AcoN4KcGiQsAxKDYquykN+MAZ0KivLOLVOIB3LpLP
         CUeFHK+GDqunNUWInsJK0E9uedBROEool/9PwrxJhl9aOMPd05m2WVPazrx30iJStYaH
         9ks0S/qFiqIkrj+QPiPR8FRjBOP+9OQd9ImEDXc/wH8Bif4iRHEdNOUEoCvWI5pt/Orm
         o5lw==
X-Gm-Message-State: AO0yUKWR4paDA82BoJjETUSRrqtMoo9hqi4PC1/GDlypO6hYmL8rJ25e
	SYBcpqiKmsbR8L8DqSQd7d8xhg==
X-Google-Smtp-Source: 
 AK7set+6qCrCJhJWKul9+wwk0Sl1OQr5LMWEah+GmhryU62cpZOQqYSLbs7n6/2LMzNjVIRdKwXcvQ==
X-Received: by 2002:a05:600c:600f:b0:3dc:4316:52be with SMTP id
 az15-20020a05600c600f00b003dc431652bemr13299778wmb.10.1677236368402;
        Fri, 24 Feb 2023 02:59:28 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a05600c1c8800b003dec22de1b1sm2601864wms.10.2023.02.24.02.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:59:28 -0800 (PST)
Message-ID: <0827a05c-117d-3d4c-2e3a-f8d80e256ca0@linaro.org>
Date: Fri, 24 Feb 2023 11:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: wlf,wm8524: Add a property to
 specify power up sequency time
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, Mark Brown <broonie@kernel.org>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
 <20230222113945.3390672-2-chancel.liu@nxp.com>
 <Y/YPkgOreByREmOz@sirena.org.uk>
 <VI1PR04MB4222996DB8494FD14A1D5FCEE3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <VI1PR04MB4222996DB8494FD14A1D5FCEE3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EPAMVIAX7I7S6FBHYFYIHN5ADLSD6WMT
X-Message-ID-Hash: EPAMVIAX7I7S6FBHYFYIHN5ADLSD6WMT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPAMVIAX7I7S6FBHYFYIHN5ADLSD6WMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/02/2023 11:56, Chancel Liu wrote:
>> On Wed, Feb 22, 2023 at 07:39:43PM +0800, Chancel Liu wrote:
>>> This property specifies power up to audio out time. It's necessary
>>> beacause this device has to wait some time before ready to output
>>> audio after MCLK, BCLK and MUTE=1 are enabled. For more details about
>>> the timing constraints, please refer to WTN0302 on
>>> https://www.cirrus.com/products/wm8524/
>>
>> According to that the delay is a property of MCLK and the sample rate rather
>> than a per board constant, it shouldn't be in DT but rather the driver should
>> figure out the required delay on each startup.
> 
> I can't agree with you more. From the power up to audio out timing table in
> WTN0302, the delay depends on sample rate and MCLK. Driver should calculate it
> rather than read it from DT. However as I mentioned in my last email, values in
> the table seem not accurate for all systems. It's a kind of compromise to get
> the value from DT. Do other codecs have a similar situation?

DT is for hardware properties, not for software compromises.


Best regards,
Krzysztof

