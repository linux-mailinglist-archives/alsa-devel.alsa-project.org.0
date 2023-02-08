Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1B68EB8E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:35:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D005884B;
	Wed,  8 Feb 2023 10:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D005884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848957;
	bh=MCuUmkBEnBPcdd6EinFDOnx0ugVHT8srnKzl7g6jjGQ=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a/bcZl7YwMfSLZbZPtHB52+dhGCRqp2ckRBQnzlL4skNt/w04g+h8rmjmpsZZfCT+
	 TB8+G77KoaLuJYXUwg0B/VFFBjCcNd3TmHB2aEyHASqETH77jdQx6Sptj+WVwJcICt
	 Ntg19r/IcQNsxgnXEgGTTIZ08S847IC4uF4Lo7Sc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBCF1F80152;
	Wed,  8 Feb 2023 10:35:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B9A2F80518; Wed,  8 Feb 2023 10:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 962E7F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 962E7F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RfGikjQL
Received: by mail-wr1-x42d.google.com with SMTP id a2so15816383wrd.6
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 01:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4bZDzVuR8Me/WxngPWog91qqgFIe75LT50el4aHpVc=;
        b=RfGikjQLX/00EQxnZD0ATTPgkbth9KvnLvNikXrA5CllXeu7aX7e4MnW9B9NotqMAE
         /g051GgCGxva5v9NSDf+OfRmDIBrayQKapko3of33bajot1Z9qbPabzusfbhWP0FvXvp
         dFPNgUpiY3Rv4uR2oJLrnUaVU4YoQftGVifqovmB/7WF/qentm5yheY5T2TUW/KPFhHn
         kdt2dpH6jbrgbyRG8HPb9Ls1ygQTWhJih7LAiJnd28NtQZYD98Z2pLtGOoz++o25V9Cp
         eKFRUeHR4OQLsTZ4tBhQ4ljtFoui5xoIS2tl8quvMza7puRjZdW+r5mkBmMiYSk7Illz
         1sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4bZDzVuR8Me/WxngPWog91qqgFIe75LT50el4aHpVc=;
        b=DfDLOL9LRYVQJWtPqoAStCdPGwP8eaa8lcIIqP2L/PTWfLEdK5GZngMzPTIuNLmyWd
         nXI2/c0X+INvcDbPcuLZY9J9o3No46Kss154Hr53GoSoGxwKPpcNxfCK8QvKkAYGGy+X
         J7wvJygOyFZaA1WxuN1eTLL6i2BBMtNGVpKgW7S3r6l76b2u7+Wfg5Vetkwvrhq1R632
         jZgLrGjetDe/J+9AoKIMzUi/o5oz56y4tnJzyqHr+SMtqiGYF+xMS0zthD2vnXL5ZNzV
         DF7s23Rdptm6agjHM4RKZN5rM32/nDuN4uZfP7xWiWAHl0t2Ol1/+E4HdPvNMGnf3otF
         rH2A==
X-Gm-Message-State: AO0yUKXdA/JDv2N01A5KGoFe7bl1UdMBxOF3o9KGk37kOwaKauGLDizH
	P0dm9ZKCpnDz5eR/jDcohZyoSA==
X-Google-Smtp-Source: 
 AK7set8o9WP1nPPsi/wK08C2W8gBquf/0OvqI8oSV6ZOocWlQSIr56gp5ZYlTXP9QUe1q62lsHMDLg==
X-Received: by 2002:adf:f68b:0:b0:2c3:e3ec:8142 with SMTP id
 v11-20020adff68b000000b002c3e3ec8142mr5409043wrp.54.1675848895876;
        Wed, 08 Feb 2023 01:34:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b002bff1de8d4bsm13128945wrn.49.2023.02.08.01.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:34:55 -0800 (PST)
Message-ID: <18ab911f-6ef3-f75e-c4cc-3457d5c6bc74@linaro.org>
Date: Wed, 8 Feb 2023 10:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: irondevice,sma1303: Rework
 binding and add missing properties
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
 <20230208092420.5037-8-kiseok.jo@irondevice.com>
 <481a2a2d-bf2e-b707-1a32-8199eeda78a3@linaro.org>
In-Reply-To: <481a2a2d-bf2e-b707-1a32-8199eeda78a3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZZCJLM55ICHLY4QQISI5BRKG45NKSVBJ
X-Message-ID-Hash: ZZCJLM55ICHLY4QQISI5BRKG45NKSVBJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZCJLM55ICHLY4QQISI5BRKG45NKSVBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 10:34, Krzysztof Kozlowski wrote:
> On 08/02/2023 10:24, Kiseok Jo wrote:
>> Add the missing properties as compatible, reg, sound-dai-cells.
>> And then check this file using 'make dt_binding_check'.
>>
>> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
>> ---
>>  .../bindings/sound/irondevice,sma1303.yaml    | 23 ++++++++++++++++---
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Wait, no, I see you added some more undocumented properties - at least
clk is new. Didn't we learn anything from first submission errors?

Best regards,
Krzysztof

