Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCA814356
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 09:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E8AE72;
	Fri, 15 Dec 2023 09:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E8AE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702627833;
	bh=fgwi+eaNvL4bX6MAKB2dqw+O3udVvioEhkSrQJLGwdY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a+kj9Cxno4f4hW5ygY+VtGEN7LJziRCyjauo37iavCZMwXnzZuJG/rbA8J9VCuC7n
	 +x5QQVGQwYD8mferY/ybtx/j4wXDdQMuc7UZcQd7q5MxaYdTNVg3Ccd9MsDVi2Dekt
	 bc32OpogIgkJ0UFOdE6GMPYn0eBvjefLPRbfScj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A82BF8057A; Fri, 15 Dec 2023 09:10:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F940F80114;
	Fri, 15 Dec 2023 09:10:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E18F8016A; Fri, 15 Dec 2023 09:09:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02D68F800D2
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 09:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D68F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FMVW4Qtr
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so4685085e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Dec 2023 00:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702627784; x=1703232584;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBzycuIkV/6Qoafe8eFD9FYCTvqPcbdmnZw+dYA9ldA=;
        b=FMVW4QtrDvhZyL3RM9Qd/CC2LQWPPziD0fb49hxmcJli1G7DpQBsoP9QbGhrG7g+n+
         AeZvexkSL6KHYAreoMvcn+7YAo6u/03ccrvm4yXPz0ZdNmkYzU6niwY3hXi4DrOwtsmQ
         a13TqCGAiQu/eBd8QAcQAS6eDEg2v/yV7cQ1QDfXESF2JUZtn7ITgLg2WwVu3hdEUB32
         0VW0m7VTyDH6GBvw/Vo2SODnLbbAaTfzGjeDoqnhb00qnBqk666LspWChl/HL2Uyd5XW
         EkNYrdWz4bsU7wlPiSawSGfwRo6XEhJ2DwnJFt23WGyWrzff5QvdIqODnOAPxdzPEUH7
         iEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627784; x=1703232584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBzycuIkV/6Qoafe8eFD9FYCTvqPcbdmnZw+dYA9ldA=;
        b=sGZ8U2WDFLUrWSunjpJRTz5+zx32xbLGCBYkfV06yh5WInlNOqZKPUkEwmJiHhJhL5
         Maa3LRxuiKPeSke19px/cCGSMeYVHFZsBucBIofM4If1g80WjvpFVqsTHOjy1ylTpxC4
         Kx5QTFCFV6W5LRzXNilYPARqKf39gAv5sBMBA3141yM1CmJxolcEsCx2CYx6PNVqZycs
         GNIc6cPm/0QCTOZiKdX6lJXZ022g6tFmMj+qgNNDqxonWzoHPqwpW8LMkLSzrTxfPUQ9
         STaOiC3Tq20hPsdafuzk9S7Y3j26yIZ8IRjcv3Tm944gf9FFqnlmqZ6VUSQUmsc74I+x
         u38A==
X-Gm-Message-State: AOJu0Yxb0E6OtNpF16F10NZ8FB5MDiuKJULOQVBd/hRUKdn1NO9zebNG
	yHbPHEmxfWLNngDgh/KwBVfb7w==
X-Google-Smtp-Source: 
 AGHT+IHXr2aiF67iw/MCg4WJKcEoWDnyX1a4J+sk1RcPb6DkmQzspdZfGa3WNYfB3GkmOcFIJZLRMQ==
X-Received: by 2002:a05:600c:1827:b0:40c:5c9:287 with SMTP id
 n39-20020a05600c182700b0040c05c90287mr5143077wmp.195.1702627784586;
        Fri, 15 Dec 2023 00:09:44 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a5d60cf000000b0033635ee4543sm7654960wrt.67.2023.12.15.00.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:09:44 -0800 (PST)
Message-ID: <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
Date: Fri, 15 Dec 2023 10:09:40 +0200
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
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: 
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U4DLH4GLCRDOEOYHH4AF67PEZ63APNHZ
X-Message-ID-Hash: U4DLH4GLCRDOEOYHH4AF67PEZ63APNHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4DLH4GLCRDOEOYHH4AF67PEZ63APNHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15.12.2023 09:55, Mahapatra, Amit Kumar wrote:
>> Thanks! Can you share with us what flashes you used for testing in the
>> stacked and parallel configurations?
> I used SPI-NOR QSPI flashes for testing stacked and parallel.

I got that, I wanted the flash name or device ID.

What I'm interested is if each flash is in its own package. Are they?

> 
>>>> can combine a SPI NOR with a SPI NAND in stacked configuration?
>>> No, Xilinx/AMD QSPI controllers doesn't support this configuration.
>>>
>> 2 SPI NANDs shall work with the AMD controller, right?
> We never tested 2 SPI-NAND with AMD controller.

I was asking because I think the stacked layer shall be SPI MEM generic,
and not particular to SPI NOR.

>> I skimmed over the QSPI controller datasheet and wondered why one would
>> get complicated with 2 Quad Flashes when we have Octal. But then I saw that
>> the same SoC can configure an Octal controller (the Octal and Quad
>> controllers seems mutual exclusive) and that the Octal one can operate 2
>> octal flashes in stacked mode 🙂.
> Thats correct .
> 
> Please let me know how you want me to proceed on this.

I got you. Still need to allocate more time on this.

Cheers,
ta
