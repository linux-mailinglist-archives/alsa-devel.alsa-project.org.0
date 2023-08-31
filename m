Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D8578EF0B
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 15:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8901E8;
	Thu, 31 Aug 2023 15:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8901E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693490132;
	bh=JPCRz+vUCUHSZSgRkusWrOP3URi7zlDQOZ1vND9DyB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2/m+P6WpmaW9k4c1Y9Tns1OsHCNT3QdZEnhrblpld8WUtkbMILIN0fTxDEjhcm3N
	 pJ+VQ+7IaPYoNzyRAJv2k4qiocMq1m5iTaAw9fsZCrw03n6g/piGxLJdhkI8JPouEY
	 /hPt5g+RZMFP3rCALqs7gJ92/t2+q0akmJikeNYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60AAF804DA; Thu, 31 Aug 2023 15:54:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A912F800F5;
	Thu, 31 Aug 2023 15:54:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B46FF80155; Thu, 31 Aug 2023 15:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F9E0F80094
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 15:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F9E0F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=QBhIg2y3
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-34baf19955cso2929805ab.2
        for <alsa-devel@alsa-project.org>;
 Thu, 31 Aug 2023 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693490066; x=1694094866;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOuGqkTcGQRx+iRAXqiXLaMEVlHPNpp4SZcX65o0z1M=;
        b=QBhIg2y3HSmWvSmaPe1WeRNkQSxnOfrEgxrJ9iBTe4K8k9Ok2pYnf1D73SCyVLEyxy
         hzi91rFlzrefCNFAdOqFztG6CImOE/ceasz8MT8o/9ajadKbSx/n9ALzBJ08AM1YSKUg
         Q4wso6FiTn5ieIiF0Cz0e9ya0xN9cJGV33eNoGuIbisfplkhZAevK6yhiFH+np7OgSLm
         oBQmT178f5Bouf5qfoyqU9yFXuodH7jmFaxKM0XjeksfrSK+yT4Lfi+mmyLGjCaz9mDO
         5XY4mg7H5exm7QXI/B8gSQmXOpkni5n6ZERKZUdZfg4MU4RBuE1dAaCp4Rt6dPTQ7sXj
         maHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693490066; x=1694094866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOuGqkTcGQRx+iRAXqiXLaMEVlHPNpp4SZcX65o0z1M=;
        b=lgzOBw6Qjr746WTSZbf6w6SmMQUEH0mrW1mP9sfkSfefItuLI7WTl3cCfd5DOr0Vqi
         /7xsLkI6LqEvUfCMPELgxdVJ87P5niqenWZR7DPqgQdLeI1202d869rafLTXUqbt4bp9
         hvfHOOCAbz5fg0Q6O6eSiO+O3YeobIO+X8yQ50eVbyXQKxSKujWbv0kvls54+1IloxhZ
         pHHM4CYfeGmLmmOvV1lMBrvexjGFEe5oVDsosm6wzso5GGCuj9Dr4Rb0WhoOXuZm/wlm
         lJTkaNwkSB70vAn9v/UTsimZhttkjIr/Y7E5DhgMwL8z/br++oIlMxSYawfUavzJftZi
         EYkA==
X-Gm-Message-State: AOJu0Yym4QhHBqB1J2ew7gQU2l4Kd/GTluKbI+czRi7ADtZWPCeGg0eM
	FgHxqOAou1zaoR2jjhVrQrU=
X-Google-Smtp-Source: 
 AGHT+IGue5NC06PfG1MsWTONPo4UfzRset+l1+uMMwOHPf8RfejHUNkZRXAmOAc3Xcbd/j6fVXDfSA==
X-Received: by 2002:a05:6e02:12ee:b0:34d:ec00:2ce8 with SMTP id
 l14-20020a056e0212ee00b0034dec002ce8mr6046377iln.21.1693490065627;
        Thu, 31 Aug 2023 06:54:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 el17-20020a0566384d9100b0042b8566a982sm420395jab.41.2023.08.31.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 06:54:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 31 Aug 2023 06:54:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/6] mfd: cs42l43: Add support for cs42l43 core driver
Message-ID: <12eb7505-19b0-4341-8ec2-be42d6f94c9b@roeck-us.net>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-4-ckeepax@opensource.cirrus.com>
 <b122a788-acee-4747-be6d-a7456ee110dc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b122a788-acee-4747-be6d-a7456ee110dc@roeck-us.net>
Message-ID-Hash: YIWRM3HK4QROT2UF3VXN6PQUGW5MQG7C
X-Message-ID-Hash: YIWRM3HK4QROT2UF3VXN6PQUGW5MQG7C
X-MailFrom: groeck7@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIWRM3HK4QROT2UF3VXN6PQUGW5MQG7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 07:06:29AM -0700, Guenter Roeck wrote:
> On Fri, Aug 04, 2023 at 11:45:59AM +0100, Charles Keepax wrote:
> > The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> > (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> > for portable applications. It provides a high dynamic range, stereo
> > DAC for headphone output, two integrated Class D amplifiers for
> > loudspeakers, and two ADCs for wired headset microphone input or
> > stereo line input. PDM inputs are provided for digital microphones.
> > 
> > The MFD component registers and initialises the device and provides
> > PM/system power management.
> > 
> Unfortunately, on systems without pm support:
> 
> Building s390:allmodconfig ... failed
> --------------
> Error log:
> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>  1106 | static int cs42l43_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>  1076 | static int cs42l43_suspend(struct device *dev)
> 

This patch now made it into the mainline kernel (without fix)
and breaks various builds there.

Guenter
