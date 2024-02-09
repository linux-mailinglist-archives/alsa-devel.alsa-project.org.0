Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF484F966
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 17:14:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E3E584D;
	Fri,  9 Feb 2024 17:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E3E584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707495287;
	bh=TOaIsn4yv1mTA0TpMq05BYPgiz6QZO4r2h74tSDkKW8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TATERJQR4F4Xov0bzrqqxhlLQn66SDhZBJ+SWb2/cDZSJXaiF8q1zVNI31hmRzNUn
	 P/7ONxlYxqqwr+pzl/WmGTkvXzF6P7QbNXxAXUpz0G8stt7Hqi5/rovMUlFG6P9Yzg
	 elzqsjPhAvNFJ0d2jyVlmd0I0VQm0dS9LaDXV1Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E467FF80589; Fri,  9 Feb 2024 17:14:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78D1F8059F;
	Fri,  9 Feb 2024 17:14:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52508F801EB; Fri,  9 Feb 2024 17:14:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1BCFF800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 17:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1BCFF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n/qHF9oG
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4106cf2e9e2so6432225e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Feb 2024 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707495235; x=1708100035;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISVQjlDhuxktgdvlQkAYJcUhQrr8fLt/EuWGjCe2nWo=;
        b=n/qHF9oGPwCxMquATnJhQSSfGk3qpOkcgjR7QoGCzo05yM+YGqB2HpOK3MFYPYbMh1
         vne02uRMDtCcA8n56BpU7D9R9aK4wlULRNqdnKLml5dVZeJSzBTviH4djyS+OWRvyxiU
         NuHcpYqLSn4wuWgPRrO/2/VK0LYd5iTXQK47kKSj843h4Y+d2WAJhuf6r5BnMG+M2ult
         +PbDXYn/POgreT0e1nul8Ft7QUByhtybdYRMdrAwg4Az3qE4q5JoVRLQ3YbvwMI3rlKg
         +8U6JHiA0gfBbY5FFiK+0U5Y6XEqoRmxeLDissWeyt/ZknsvceU6qtMqyypSWcSn3Wdn
         Uc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707495235; x=1708100035;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISVQjlDhuxktgdvlQkAYJcUhQrr8fLt/EuWGjCe2nWo=;
        b=UAyOXiC9OWpOTPuyGjmaH6Opyj6Bn0L4kTpy+4qrZZE7d71iVK7X686UU+YgcXMZr1
         Ey9r7F5uyQDsDAzneH+fuS2lbbFTnz3ygNYwVfvdGltytyQSrakXDeWmHBJqxsXdSA4M
         0KLOSG+S+zSTbde7obOtJ7Ib/5/e1fEqMZ64k/nmReONMKZ3nKMG1r8BWCc36PP5ufT5
         NYMzQ2n+QpkOX9/UMYE5nJArXm/9s8J/ZHyIfcb7x4O5A8dXp4xacteJkOKcr2qQA3wa
         c29ysktVgAukiwCYgrDRq13oA2eIVRlpDXKE9jpmf21qIwLr8eFbkpJIrksE83YxTLEM
         fKuQ==
X-Gm-Message-State: AOJu0YzCG4pjyAd1JwH5YcXY4THnvEWF3bRBn9WN01zlZBm/rPkmxcvq
	jO8vgER+U93xSqgO1/VrSAVKQDczMfVexGgScp39uVrKHGMIb4rXnhlE26hjj5A=
X-Google-Smtp-Source: 
 AGHT+IHNXgGcu2a4xAMztcYxQsvAn119baDjUiN1sOdu4laW5FMqfT1Xd+U4nI4trQf9VcVjOxKC1g==
X-Received: by 2002:a05:600c:4e8f:b0:410:7980:72a3 with SMTP id
 f15-20020a05600c4e8f00b00410798072a3mr1044002wmq.35.1707495235379;
        Fri, 09 Feb 2024 08:13:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWF9ZWG8EjCTnWx0jkyeDG0Qr8YdWFzC+ONvCzW3TxFZu/8e0GoKxPRmAmFosVMJx9f3ENvvTYzE8VGh/wMu3BuJm6x7/39QGv3S34hBE/WYGN+PZNwxgy7jJs5Dh6nxkk24wi/5EbfE8/K3us2WG/MATNRtkqe/sep40BlUeeQsM6fzYclywF9xHIR1t5BpDhUQLqkF3FDPbxgC41KgbPWBm+bbI9Ls0om4YQ7hN8FRSyYEBKXPxRzwGHU0kEojdBrqdumf6SBbDF29dQRp0mNc/SoD/gOD8AKd8KS22DECkyg2mF5iGaP5PWfY3VwuTNxOvNwAIW344cS0LIo1T8ZixGinvUbTFSSpwuTyFuXlIdonsOCAJVLWC3lwJWu1q4WXV846RajN2IgL2FxauGK+JH/+66f2yvlP6qRFiqb4/7V+lNjdruQwzNyyHocvGGVFZSxnJQVw0virYE+H5aWtFELSMFlZzrHziZJ6ejtQd9QmN3iqOMY6mMjjllS8wiQWdHuBznQOLnCBtUUbYZp5UEJ0S1UpgSZ1+cAzfrXjJ/j6+jWK7vNyar4tq7ZzSUVTADY+XpQQJhs3c7Rx835/3zi72jHBTvTcvnTQP4fx615KX2wOx2sH7bHpr/lOO6rQrBHKZcMEjrXEoiku5RBe/z4mlu68TKe4z1i2gUH2m+q+RXEJEoIi3vXzXE8tpCNZi/ICBr6XGilXUtas9XBev0xDTwzeUoyGhWsWtj6w7vgwx+azT9bWTKbRugRGUFqs7Jrg2A1WT1g4zbgZUz03EER7uDjLrYAOVjIBKY5LLxd9khEtvZFnLQleX18EzrKYbYoQvTqKce7xU2M1liC9/nkkRfgXOp75CGb82w8RBBehQy1BzF5IF8jxWPC5AiXcqfO2opl4uno1zFjMvkxjk5WBvghsCZoUsp9kbn7gTNr
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id
 25-20020a05600c021900b0040fbba734f3sm1041447wmi.34.2024.02.09.08.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 08:13:54 -0800 (PST)
Message-ID: <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
Date: Fri, 9 Feb 2024 16:13:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
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
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, beanhuo@micron.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
 <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
In-Reply-To: <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3CTXIZ4PPWRXTFLQE7CSPA457Y5VTYJV
X-Message-ID-Hash: 3CTXIZ4PPWRXTFLQE7CSPA457Y5VTYJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CTXIZ4PPWRXTFLQE7CSPA457Y5VTYJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/9/24 11:06, Tudor Ambarus wrote:
> 
> 
> On 12/21/23 06:54, Mahapatra, Amit Kumar wrote:
>>> Something else to consider: I see that Micron has a twin quad mode:
>>> https://media-www.micron.com/-
>>> /media/client/global/documents/products/data-sheet/nor-flash/serial-
>>> nor/mt25t/generation-
>>> b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500
>>>
>>> The micron's "Separate Chip-Select and Clock Signals" resembles the AMD's
>>> dual parallel 8-bit.
>> Yes, I agree.
>>
>>> Micron's "Shared Chip-Select and Clock Signals" differs from the AMD's
>>> stacked mode, as Micron uses DQ[3:0] and DQ[7:4], whereas AMD considers
>>> both as DQ[3:0].
>> Yes, correct.
> 
> Amit, please help me to assess this. I assume Micron and Microchip is
> using the same concepts as AMD uses for the "Dual Parallel 8-bit IO
> mode", but they call it "Twin Quad Mode".
> 
> I was wrong, the AMD datasheet [1] was misleading [2], it described the
> IOs for both flashes as IO[3:0], but later on in the "Table QSPI
> Interface Signals" the second flash is described with IO[7:4].
> 
> The AMD's 8-bit Dual Flash Parallel Interface is using dedicated CS# and
> CLK# lines for each flash. As Micron does, isn't it?
> 
> Micron says [3] that:
> "The device contains two quad I/O die, each able to operate
> independently for a total of eight I/Os. The memory map applies to each
> die. Each die has internal registers for status, configuration, and
> device protection that can be set and read independently from one other.
> Micron recommends that internal configuration settings for the two die
> be set identically."

Amit,

I forgot to say my first conclusion about the quote from above. Even if
the dies are in the same physical package, micron asks users to
configure each die as it is a self-standing entity, IOW to configure
each die as it is a flash on its own. To me it looks like 2 concatenated
flashes at first look. Thus identical to how AMD controller works.
Please clarify this.

> 
> it also says that:
> "When using quad commands in XIO-SPI or when using QIO-SPI,
> DQ[3:0]/DQ[7:4] are I/O."

and this would be a parallel concatenation of two flashes.

Then it would be good if you let us now the similarities and differences
between how amd and mchp controller work, I scrawled few ideas below.

thanks,
ta
> 
> So I guess the upper layers just ask for a chunk of memory to be written
> and the controller handles the cs# lines automatically. How is the AMD
> controller working, do you have to drive the cs# lines manually, or you
> just set the parallel mode and the controller takes care of everything?
> 
> I assume this is how mchp is handling things, they seem to just set a
> bit the protocol into the QSPI_IFR.PROTTYP register field and that's all
> [4]. They even seem to write the registers of both flashes at the same time.
> 
> In what regards the AMD's "dual stack interface", AMD is sharing the
> clock and IO lines and uses dedicated CS# lines for the flashes, whereas
> Micron shares the CS# and CLK# lines with different IO lines.
> 
> Amit, please study the architectures used by mchp, micron and amd and
> let us know if they are the same or they differ, and if they differ what
> are the differences.
> 
> I added Conor from mchp in cc, I see Nicolas is already there, and Bean
> from micron.
> 
> Thanks,
> ta
> 
> [1]
> https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Interface-Signals
> [2]
> https://docs.xilinx.com/viewer/attachment/dwmjhDJGICdJqD4swyVzcQ/fD8nv4ry78xM0_EF5kv4mA
> [3]
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25t/generation-b/mt25t_qljs_l_512_xba_0.pdf?rev=de70b770c5dc4da8b8ead06b57c03500
> [4]
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7G5-Series-Data-Sheet-DS60001765.pdf
