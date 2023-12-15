Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0D8145AD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 11:33:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A32E73;
	Fri, 15 Dec 2023 11:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A32E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702636435;
	bh=iaReLo3ikUN3bT4iDYBXJWZdGHFLdastHTZ5bbcp4mY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q61OTuU+QdO1SG1cJ6HRcTWXXvSzWBCX2sRaZB13dmYvnskel2pg5KvYC1ObcaVZo
	 +hbOfzvr3ooHwDrzWj1B+D46ECYNXAHZmmnu1TvgSEgTlHbT++g7SfyL3EwH1mwDS3
	 Ht9JVR6Wm2M0VfChF4Ag9syxZdfI8lkGjtknaS24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDF54F80537; Fri, 15 Dec 2023 11:33:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5103CF8001F;
	Fri, 15 Dec 2023 11:33:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB0BF8016A; Fri, 15 Dec 2023 11:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59066F800D2
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 11:33:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59066F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XjiUtduV
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c4846847eso5470135e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Dec 2023 02:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702636384; x=1703241184;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES/8p7dj8eOpjaZIO5AxTsTeaONrf5FeKxZa57MxFr4=;
        b=XjiUtduVScPwRoX0A/7vDz2pxDN5yJ3zd3LEUp355GNoJboEWLnT0YSaBMo3EVD0Qt
         p3xoOj5zUgalEvQ4xzMDvXXPSg7aOmYH5nb3p3X+2EwmUsy9A4C/PjmzctWpRiHuU5qv
         9Zb4gZ+nS66p2/0IWcXhw7Nt/NDICGyOIWOeXtNoaP6kuXs+naWhd+TxH0tTXx+Npva/
         +IhMpNlBtTMYG3DSO4uoVjorN6vdHnAeGA2/xRAGvkNcZrv5C/SdJ0tYNij/ZFGlf/KC
         KniEXpDb3eKDXi1smSECEIfecFvfSZVwnjZ6+mVfquLoATjZO0Z0VD8D6pLT4Yv5w3Ep
         c2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702636384; x=1703241184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ES/8p7dj8eOpjaZIO5AxTsTeaONrf5FeKxZa57MxFr4=;
        b=WrP8EaSFQdGW1wfWnU4hFgZVyL6d93NW5msZJVe097O7xLoRbpX970PlnPFpsdnMLt
         2eKb11u9qbLYtW9I27t0ggp/OjRNBFHa6rVgjgm2ID/XZx6i2ccWh8rnWd5e7nwv+xMm
         AkFYiGgH4z+Qa0KKFU1jMpXDn8uDK+zoHUjt8sU8rvbEBD2+uP2p/NF2igAkDAXEXivZ
         9ROY/qY2PExw0tjsOZhIgxkeqAkDP/i6Fqd0+f4W4bDLeCLbGfsiPlUj3gC+oM04xFcW
         ArvTU6v5dIhLdqzQSGQIlwasuXcxPqHnowOnP998Rz+DFolACKQR6jclSjKZoM97NA69
         ukgw==
X-Gm-Message-State: AOJu0Yys1FPyJGjzZsli6QbSRE1LKuAZRmZDfkhgY1Id10v50zWTll3o
	cb5QNFjGiWDp7bhHd7zVilfBkQ==
X-Google-Smtp-Source: 
 AGHT+IHvCqTZH8cLyqj3W3/o6f8ZEmQnes53EWvbWxmoY2pWUTbH0iPJoL/UA8Y2YFnwr+nIL2HHIA==
X-Received: by 2002:a05:600c:221a:b0:40c:3306:c300 with SMTP id
 z26-20020a05600c221a00b0040c3306c300mr5703334wml.62.1702636383695;
        Fri, 15 Dec 2023 02:33:03 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id
 d13-20020a05600c34cd00b0040c496c64cfsm18468670wmq.12.2023.12.15.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 02:33:03 -0800 (PST)
Message-ID: <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
Date: Fri, 15 Dec 2023 10:33:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P5IOPYWV3YIKP26F5EJDZLGLIWVCZKFW
X-Message-ID-Hash: P5IOPYWV3YIKP26F5EJDZLGLIWVCZKFW
X-MailFrom: tudor.ambarus@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5IOPYWV3YIKP26F5EJDZLGLIWVCZKFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/15/23 10:02, Mahapatra, Amit Kumar wrote:
> Hello Tudor,

Hi,

> 
>> -----Original Message-----
>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Sent: Friday, December 15, 2023 1:40 PM
>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
>> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
>> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
>> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
>> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
>> michael@walle.cc; linux-mtd@lists.infradead.org;
>> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
>> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-
>> arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
>> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
>> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
>> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
>> in spi-nor
>>
>>
>>
>> On 15.12.2023 09:55, Mahapatra, Amit Kumar wrote:
>>>> Thanks! Can you share with us what flashes you used for testing in
>>>> the stacked and parallel configurations?
>>> I used SPI-NOR QSPI flashes for testing stacked and parallel.
>>
>> I got that, I wanted the flash name or device ID.
> 
> N25Q00A, MX66U2G45G, IS25LP01G & W25H02JV are some of the QSPI flashes on 
> which we tested. Additionally, we conducted tests on over 30 different 
> QSPI flashes from four distinct vendors (Miron, Winbond, Macronix, and ISSI).
> 

Great.

>> What I'm interested is if each flash is in its own package. Are they?
> 
> I'm sorry, but I don't quite understand what you mean by "if each flash in 
> its own package."
> 

There are flashes that are stacked at the physical level. It's a single
flash with multiple dies, that are all under a single physical package.

As I understand, your stacked flash model is at logical level. You have
2 flashes each in its own package. 2 different entities. Is my
understanding correct?

Cheers,
ta
