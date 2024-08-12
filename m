Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7394EA38
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 11:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097651939;
	Mon, 12 Aug 2024 11:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097651939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723456009;
	bh=JttXyWvNBrLovswX1EnPaJPxm1PSVZ+ohR3t2TiKVsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ta8WtUcJ6Kqw/krNS8OrPxFvTg+7CJZyBiLS7T1f4xT08dfDdWLdqMepnaJ+aD+Sd
	 rV0HS9cifpLHUrGd7oNH1kr4jL2s+cTNZWgQd2pdu3lnkT9LdhVAaxicJg7tou5yDz
	 mfD7xZ9t1F/PKlraVu2rX9hf5V7UPQ83Wn6VyVAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7522F805E1; Mon, 12 Aug 2024 11:46:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 583D1F805E3;
	Mon, 12 Aug 2024 11:46:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47DF5F805B2; Mon, 12 Aug 2024 11:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BE55F8016E
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 11:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE55F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gVsrUn6H
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so4313750a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Aug 2024 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723455961; x=1724060761;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JttXyWvNBrLovswX1EnPaJPxm1PSVZ+ohR3t2TiKVsQ=;
        b=gVsrUn6H7bPL3X7ieM+jKhl3RkeUlpCO3p/PyXU9J0ILOaP8M0JX//LZqe/GZ9MV3w
         TJ7LBNis0Z79cd1qAh26shXO6xlKGUbn5mAMFOV8W1xh/57Cumch418tjlA+v8v8bhAf
         j4FhojQ5iC/uS78Iscz19RhbqdlMCkiOjqIsVE61KzoXiPZgzYe2QHF50kLDE/zpFN2T
         jzhLQ6gr1/sIQEXaR1Xlk0/rCnG/FNMRNSIce3g6vaQUkOj853tKJ6jbZBjvHyohLMnv
         xx3gqrhVsESTcnl4xk7Wp1T2Za3LupUfw0IK4JM5QL3/V6gXKjkkuwBY2HHsTBEyhSD9
         SuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723455961; x=1724060761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JttXyWvNBrLovswX1EnPaJPxm1PSVZ+ohR3t2TiKVsQ=;
        b=WYwKzi2eKBtkoGZDTiVV9HEzMV4e5mXsdgOWHvi8OXpt/FG4vhGsRAFZ/mTylw2pyL
         C0MnaO1nPhGpnviOMAVMQSqTQ8s9gWpnfy/IUkdRuDxPjqRCFdg9Qt/KbDPaExBt28tn
         1q5FG1zlZrG/vG8WT7mKQuNJBFiYYrLCPYrdFCHxWPdVsxPUV0mGnricGmsRQ71HTQVA
         NZy1UeTPi6s00n0ShZDVr3pqGVf+/qZctpfarlNhvn6mZw8FgMaa3SIpZSB3bophB3nN
         T6eDa2aQkU2k+jYy1MW7vwKSm3EwBGzfuu0jqbZvHKGLnEP2rPjqYtmWnMiZzgj2Rafu
         qeeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEVq4sgVrkWKjT2USxOGDI/n1UG7km1y6j1F9oq17s10qlIwmhzb8WvysD+me6YuYvjuozszpqtId8@alsa-project.org
X-Gm-Message-State: AOJu0YxR4c6G2ppNsdqNBA8RdsjkPddXUAcUKdyf5g4rmeCnund0nMyg
	rtEcTZzkKTnWuwhAGNM5/pjIjAsbceVNHQ/fBy0PAdwQDy1/Vx7dtZXd0+SQjH8=
X-Google-Smtp-Source: 
 AGHT+IGaHEWZkOKxfoZJQYtrgry1CYeTIzGR/wr2t1cep4NpltsL9e4x6ljRA9qjxohlOrRIpWZzRw==
X-Received: by 2002:a05:6402:2346:b0:5a1:40d9:6a46 with SMTP id
 4fb4d7f45d1cf-5bd0a6b4bf9mr6210531a12.36.1723455961053;
        Mon, 12 Aug 2024 02:46:01 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.48])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a5e04e1sm1967189a12.77.2024.08.12.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:46:00 -0700 (PDT)
Message-ID: <b96f483e-314e-4e47-af58-ddb078dd6df3@linaro.org>
Date: Mon, 12 Aug 2024 10:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
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
 Conor Dooley <conor.dooley@microchip.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
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
 <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
 <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
 <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
 <20240812103812.72763f69@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240812103812.72763f69@xps-13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4QJKFK5QR5T7A7V6K74GN6TGR4OYBNIM
X-Message-ID-Hash: 4QJKFK5QR5T7A7V6K74GN6TGR4OYBNIM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QJKFK5QR5T7A7V6K74GN6TGR4OYBNIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hiya,

Amit, the thread becomes unreadable, better start a new one describing
what you plan to do.

On 8/12/24 9:38 AM, Miquel Raynal wrote:
> For now I don't think you need a totally generic implementation. As
> long as there is only one controller supporting these modes, I'd say
> this is not super relevant.


Miquel,

Microchip supports a twin quad mode too, and micron has some flashes
with similar architecture, see:

https://lore.kernel.org/linux-mtd/20231125092137.2948-1-amit.kumar-mahapatra@amd.com/T/#mbe999dde1d29371183aa53089ef6f0087d6902a7

We shall consider them from the beginning. I guess we need to read
everything all over again.
