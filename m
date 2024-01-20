Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7EE833572
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 18:06:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE656741;
	Sat, 20 Jan 2024 18:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE656741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705770399;
	bh=05tSa0uPxWfu64LdB0jSPRng5R8g25ju7BtoxHU43mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lyGpaRR8czveSL5Sc4jIn+HdasstTjvS8qJx9Xvt8RnCMoFdwv5lihkEX6+6aekSt
	 jHLQFWkWTxVDxxnrU1CDB6RglccPBroUgwpXvnsdtaRuEBT70A6DVo+qvD6ZFpArKU
	 Xz0OuCPMdytS7l8/QC8WRZzNeymft4wmLVZRIHHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21A4BF8028D; Sat, 20 Jan 2024 18:06:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8352CF8056F;
	Sat, 20 Jan 2024 18:06:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ACA3F801F5; Sat, 20 Jan 2024 18:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65856F800F5
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 18:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65856F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q9QL97Rd
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-595aa5b1fe0so1230976eaf.2
        for <alsa-devel@alsa-project.org>;
 Sat, 20 Jan 2024 09:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705770346; x=1706375146;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSSZ+uUrBnGLtLNByRJO3k6mx1p75ru6YpoQqSrwF3o=;
        b=Q9QL97RdCW2GxYyFeFApY39Au9kEpNUiJbEVkw8j8/KHwgGqnE9tL2NpBvTTU5y5Th
         Z9zVQVoHDwDXDmleOtAINkQ9q1GytUBzn8E30xREzyadq1QbQH/M/XKsv0PE6G8wC4r6
         0hOyxi1boNR3d0PLZ0mKSDW6NVhIl/BlR5hSmnet89KWidvdA3Z282ZgijMyvXY4owPh
         uy84zyhbMd9GprfF/hCPfKsp3tQvFckQUUMLnhO8/OxMW+iWXdNJd/wJfm8oKwbXjEZ/
         3Zk43215xlWqeth91MfKaEA1sBWnOtmh49E7MT8ZrU2OnZC1eqHQGQGlso+F2uO9UBUK
         u0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705770346; x=1706375146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSSZ+uUrBnGLtLNByRJO3k6mx1p75ru6YpoQqSrwF3o=;
        b=NySW5Z++zsuppX6n1026M8AVP70vkwB5+DB9wTkvKD5rRijljoM84AqdoyGE0cSmdP
         iGzCAQ2c52DOk9TnR89bwbbYM9Ajbi08LjDOao2ZM8MyFuZ7eznkVicjt5XK8AdeRzn7
         tB5WX1IHkVHu5HA8AYNiIP/ul+92O2ek5VZAH1LCsty0voPFmljAT+ePZrdxpaovq/aV
         w3ZC++h1jh3IEYaFtGQVVZBniLmM1yXrIgwG991Nj6Z4q9aHPpsAgb5KLeSzx9E4REbT
         I3XSWkSrCViBgT2mtTj/jaKGkXT7xxxeT4YHXw8gwvxCxn6d+6dlRiMrVNVo2hIyYxtJ
         tUzQ==
X-Gm-Message-State: AOJu0Ywf9C+QJsejb81TkPnII4kUTaZBsP6rzU6TUiZl6mB450c80cVK
	GCUEAxHbBuw3iIlt9L56iL0g4i11aQUwHWc9JamYVNrOaw5HVYc4
X-Google-Smtp-Source: 
 AGHT+IEe7Tj3eDqHrVJrjBOmoIpluh5tLTny4B8bIrKkjUIC1uwOw716UNoMn8WG+UEWOZm/G457Fg==
X-Received: by 2002:a05:6359:4c15:b0:175:dbd5:9190 with SMTP id
 kj21-20020a0563594c1500b00175dbd59190mr2218797rwc.15.1705770345598;
        Sat, 20 Jan 2024 09:05:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 r18-20020a170902be1200b001d73ac054a0sm556505pls.33.2024.01.20.09.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 09:05:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 20 Jan 2024 09:05:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: broonie@kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
Message-ID-Hash: BDXAXNXTDETFKRLPI5SZEQVY6Z7XOFIG
X-Message-ID-Hash: BDXAXNXTDETFKRLPI5SZEQVY6Z7XOFIG
X-MailFrom: groeck7@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDXAXNXTDETFKRLPI5SZEQVY6Z7XOFIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 12, 2024 at 11:11:10AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:
> > AMD-Xilinx GQSPI controller has two advanced mode that allows the
> > controller to consider two flashes as one single device.
> > 
> > One of these two mode is the parallel mode in which each byte of data is
> > stored in both devices, the even bits in the lower flash & the odd bits in
> > the upper flash. The byte split is automatically handled by the QSPI
> > controller.
> > 
> > The other mode is the stacked mode in which both the flashes share the
> > same SPI bus but each of the device contain half of the data. In this mode,
> > the controller does not follow CS requests but instead internally wires the
> > two CS levels with the value of the most significant address bit.
> > 
> > For supporting both these modes SPI core need to be updated for providing
> > multiple CS for a single SPI device.
> > 
> > For adding multi CS support the SPI device need to be aware of all the CS
> > values. So, the "chip_select" member in the spi_device structure is now an
> > array that holds all the CS values.
> > 
> > spi_device structure now has a "cs_index_mask" member. This acts as an
> > index to the chip_select array. If nth bit of spi->cs_index_mask is set
> > then the driver would assert spi->chip_select[n].
> > 
> > In parallel mode all the chip selects are asserted/de-asserted
> > simultaneously and each byte of data is stored in both devices, the even
> > bits in one, the odd bits in the other. The split is automatically handled
> > by the GQSPI controller. The GQSPI controller supports a maximum of two
> > flashes connected in parallel mode. A SPI_CONTROLLER_MULTI_CS flag bit is
> > added in the spi controller flags, through ctlr->flags the spi core
> > will make sure that the controller is capable of handling multiple chip
> > selects at once.
> > 
> > For supporting multiple CS via GPIO the cs_gpiod member of the spi_device
> > structure is now an array that holds the gpio descriptor for each
> > chipselect.
> > 
> > CS GPIO is not tested on our hardware, but it has been tested by @Stefan
> > https://lore.kernel.org/all/005001da1efc$619ad5a0$24d080e0$@opensource.cirrus.com/
> > 
> 
> With this patch in the mainline kernel, two of my qemu emulations
> (quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
> controller and thus fail to boot from SPI. The error message is
> 
> [    3.006458] spi_master spi0: No. of CS is more than max. no. of supported CS
> [    3.006775] spi_master spi0: Failed to create SPI device for /ahb/spi@1e620000/flash@0
> 
> The problem is no longer seen after reverting this patch.
> 

FWIW, the problem is due to

+#define SPI_CS_CNT_MAX 4

in the offending patch, but apeed2400 FMC supports up to 5 SPI chip selects.

 static const struct aspeed_spi_data ast2400_fmc_data = {
        .max_cs        = 5,
	^^^^^^^^^^^^^^^^^^^
        .hastype       = true,

Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the problem,
though of course I don't know if increasing SPI_CS_CNT_MAX has other side
effects.

Guenter

> Bisect log attached for reference.
> 
> Guenter
> 
> ---
> # bad: [70d201a40823acba23899342d62bc2644051ad2e] Merge tag 'f2fs-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
> # good: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect start 'HEAD' 'v6.7'
> # bad: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> git bisect bad de927f6c0b07d9e698416c5b287c521b07694cac
> # bad: [35f11a3710cdcbbc5090d14017a6295454e0cc73] Merge tag 'mtd/for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> git bisect bad 35f11a3710cdcbbc5090d14017a6295454e0cc73
> # good: [d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9] Merge tag 'slab-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
> git bisect good d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9
> # good: [fb46e22a9e3863e08aef8815df9f17d0f4b9aede] Merge tag 'mm-stable-2024-01-08-15-31' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good fb46e22a9e3863e08aef8815df9f17d0f4b9aede
> # good: [063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac] Merge tag 'lsm-pr-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
> git bisect good 063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac
> # bad: [f6cd66231aa58599526584ff4df1bdde8d86eac8] spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc
> git bisect bad f6cd66231aa58599526584ff4df1bdde8d86eac8
> # good: [18f78b5e609b19b56237f0dae47068d44b8b0ecd] spi: axi-spi-engine: improvements round 2
> git bisect good 18f78b5e609b19b56237f0dae47068d44b8b0ecd
> # bad: [9d93c8d97b4cdb5edddb4c5530881c90eecb7e44] spi: spi-ti-qspi: switch to use modern name
> git bisect bad 9d93c8d97b4cdb5edddb4c5530881c90eecb7e44
> # bad: [e6b7e64cb11966b26646a362677ca5a08481157e] spi: st-ssc4: switch to use modern name
> git bisect bad e6b7e64cb11966b26646a362677ca5a08481157e
> # bad: [c3aeaf2f0ec8af93189488bda3928a1ac7752388] spi: pxa2xx: Use inclusive language
> git bisect bad c3aeaf2f0ec8af93189488bda3928a1ac7752388
> # good: [f05e2f61fe88092e0d341ea27644a84e3386358d] ALSA: hda/cs35l56: Use set/get APIs to access spi->chip_select
> git bisect good f05e2f61fe88092e0d341ea27644a84e3386358d
> # bad: [88a50c1663ffa9f6b31705c6bf7a887a2c8d9434] spi: Add support for stacked/parallel memories
> git bisect bad 88a50c1663ffa9f6b31705c6bf7a887a2c8d9434
> # bad: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core
> git bisect bad 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
> # first bad commit: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core
