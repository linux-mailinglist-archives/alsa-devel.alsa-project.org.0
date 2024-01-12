Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC782C5C7
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 20:12:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36950741;
	Fri, 12 Jan 2024 20:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36950741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705086720;
	bh=JIBLF7WqxKvBBBJ0C6Bk6HRJGM3b2NfBq8Y3ROLCBBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NRqTusCanIUJNmtbpFgQbYUo9YS8Yd3Sm2hIKSUrjYH2AVbX7iVaAmKSfuLqRGw36
	 a12Wf8DHPgCkm8W16hkUKiel1XxBrr2OMm0Cz+Zk519iE2ZAHf0WzA/xJ0v82KYjmy
	 zrKy1G5vKTRWCIQWGq7WEHnMjoUaJSpXskTAJaFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17365F8058C; Fri, 12 Jan 2024 20:11:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71EEAF80578;
	Fri, 12 Jan 2024 20:11:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D76CF80254; Fri, 12 Jan 2024 20:11:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8116F8014B
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 20:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8116F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DKIDdM+A
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d9b1589a75so3638682b3a.3
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 11:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705086670; x=1705691470;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwA/JlHMoC+lenv5aURa8KNcjbpsMIVNCCYhJPebYBs=;
        b=DKIDdM+A40KCxxv4xwDmVdP79BOXzyvbnEkPnojrERZBlGdC3bhGtZj/KidlcWqsOJ
         fjP9DgF3+h4SlcT7Kct2K2VLSy+TYRHXT8C24qCMdwsns1IraHTbzl3uj8XCdVy//+Ne
         hn1K1ZvQ1hmM6PiTJ7+V4/h8jsK2gZiNavZPqCq+xYSiPg3jdLGuEfGv8nunEdoxERT4
         FePkQPZtQuSKu3h7xbZ9LOeq/16HdW4xbh4NtfgvIG/80istBo2gWXp3lb5vsOcM5tMp
         AUDgAPtAISsk/oS1s5LI+jmyf1CboEt3bUoklWxZwzVKy8C1QkcXUw+GbsdKQAVN9pJc
         FByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705086670; x=1705691470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwA/JlHMoC+lenv5aURa8KNcjbpsMIVNCCYhJPebYBs=;
        b=jtYuAw9s7t6C4tHIO30jOeXUnDeXOK3NhEE39vf49SdoQsX5RAT62xzStICQX9ab9t
         FnKjwXT/Ip3S8IqjvkzX2wXolSS7UR54rIr2iOp3WyILa/HV/yN9Ie6rjFAHx/fd531m
         cWRwmyIaCAT4KhtqchFv0XKYVngLf0UmaydW9TO19AK1VT0El+AlXNas7soM8nDNHHCD
         +4gV2P4fFZWMOOlzOJICubvLXX54stp+hd0ELnWBBahz8FLYdFOQjiW3GgDxlkzXXElf
         Yqh/tCVWCg1p2qXz6j5tK3nNT9XCfqEIJtOTjN2Qcss1Dfzc6EwXMMvdK99o1tFB2Ezy
         FYAA==
X-Gm-Message-State: AOJu0YzNI5e7Qvqc68jS8+u+7WX9BbN7d2IVZLerwGvcM9loLIEvbsVh
	L+XgC17TYlaYRY40TFFLhKw=
X-Google-Smtp-Source: 
 AGHT+IH8dv7Dzg/uWgk0oHxeoU9Apwneep3s5N4dqYIZaIeUvLr03trHvJQBFGDFnJTOPUKqx1U6Dw==
X-Received: by 2002:a17:903:2583:b0:1d4:cf2b:2bf with SMTP id
 jb3-20020a170903258300b001d4cf2b02bfmr1182948plb.4.1705086670268;
        Fri, 12 Jan 2024 11:11:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 x14-20020a170902a38e00b001d45f92c436sm3555345pla.5.2024.01.12.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 11:11:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 12 Jan 2024 11:11:07 -0800
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
Message-ID: <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
Message-ID-Hash: AGTNJSJHJVT4WI6XNNXACXQMJ3OAGH4L
X-Message-ID-Hash: AGTNJSJHJVT4WI6XNNXACXQMJ3OAGH4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGTNJSJHJVT4WI6XNNXACXQMJ3OAGH4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:
> AMD-Xilinx GQSPI controller has two advanced mode that allows the
> controller to consider two flashes as one single device.
> 
> One of these two mode is the parallel mode in which each byte of data is
> stored in both devices, the even bits in the lower flash & the odd bits in
> the upper flash. The byte split is automatically handled by the QSPI
> controller.
> 
> The other mode is the stacked mode in which both the flashes share the
> same SPI bus but each of the device contain half of the data. In this mode,
> the controller does not follow CS requests but instead internally wires the
> two CS levels with the value of the most significant address bit.
> 
> For supporting both these modes SPI core need to be updated for providing
> multiple CS for a single SPI device.
> 
> For adding multi CS support the SPI device need to be aware of all the CS
> values. So, the "chip_select" member in the spi_device structure is now an
> array that holds all the CS values.
> 
> spi_device structure now has a "cs_index_mask" member. This acts as an
> index to the chip_select array. If nth bit of spi->cs_index_mask is set
> then the driver would assert spi->chip_select[n].
> 
> In parallel mode all the chip selects are asserted/de-asserted
> simultaneously and each byte of data is stored in both devices, the even
> bits in one, the odd bits in the other. The split is automatically handled
> by the GQSPI controller. The GQSPI controller supports a maximum of two
> flashes connected in parallel mode. A SPI_CONTROLLER_MULTI_CS flag bit is
> added in the spi controller flags, through ctlr->flags the spi core
> will make sure that the controller is capable of handling multiple chip
> selects at once.
> 
> For supporting multiple CS via GPIO the cs_gpiod member of the spi_device
> structure is now an array that holds the gpio descriptor for each
> chipselect.
> 
> CS GPIO is not tested on our hardware, but it has been tested by @Stefan
> https://lore.kernel.org/all/005001da1efc$619ad5a0$24d080e0$@opensource.cirrus.com/
> 

With this patch in the mainline kernel, two of my qemu emulations
(quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
controller and thus fail to boot from SPI. The error message is

[    3.006458] spi_master spi0: No. of CS is more than max. no. of supported CS
[    3.006775] spi_master spi0: Failed to create SPI device for /ahb/spi@1e620000/flash@0

The problem is no longer seen after reverting this patch.

Bisect log attached for reference.

Guenter

---
# bad: [70d201a40823acba23899342d62bc2644051ad2e] Merge tag 'f2fs-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
# good: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect start 'HEAD' 'v6.7'
# bad: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
git bisect bad de927f6c0b07d9e698416c5b287c521b07694cac
# bad: [35f11a3710cdcbbc5090d14017a6295454e0cc73] Merge tag 'mtd/for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
git bisect bad 35f11a3710cdcbbc5090d14017a6295454e0cc73
# good: [d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9] Merge tag 'slab-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
git bisect good d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9
# good: [fb46e22a9e3863e08aef8815df9f17d0f4b9aede] Merge tag 'mm-stable-2024-01-08-15-31' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good fb46e22a9e3863e08aef8815df9f17d0f4b9aede
# good: [063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac] Merge tag 'lsm-pr-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
git bisect good 063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac
# bad: [f6cd66231aa58599526584ff4df1bdde8d86eac8] spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc
git bisect bad f6cd66231aa58599526584ff4df1bdde8d86eac8
# good: [18f78b5e609b19b56237f0dae47068d44b8b0ecd] spi: axi-spi-engine: improvements round 2
git bisect good 18f78b5e609b19b56237f0dae47068d44b8b0ecd
# bad: [9d93c8d97b4cdb5edddb4c5530881c90eecb7e44] spi: spi-ti-qspi: switch to use modern name
git bisect bad 9d93c8d97b4cdb5edddb4c5530881c90eecb7e44
# bad: [e6b7e64cb11966b26646a362677ca5a08481157e] spi: st-ssc4: switch to use modern name
git bisect bad e6b7e64cb11966b26646a362677ca5a08481157e
# bad: [c3aeaf2f0ec8af93189488bda3928a1ac7752388] spi: pxa2xx: Use inclusive language
git bisect bad c3aeaf2f0ec8af93189488bda3928a1ac7752388
# good: [f05e2f61fe88092e0d341ea27644a84e3386358d] ALSA: hda/cs35l56: Use set/get APIs to access spi->chip_select
git bisect good f05e2f61fe88092e0d341ea27644a84e3386358d
# bad: [88a50c1663ffa9f6b31705c6bf7a887a2c8d9434] spi: Add support for stacked/parallel memories
git bisect bad 88a50c1663ffa9f6b31705c6bf7a887a2c8d9434
# bad: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core
git bisect bad 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
# first bad commit: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core
