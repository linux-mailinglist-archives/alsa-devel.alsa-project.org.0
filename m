Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1581425B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 08:27:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E80A4E;
	Fri, 15 Dec 2023 08:27:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E80A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702625272;
	bh=aqg2CjNIKnioeuK6yM1afwCmElZz7xkBGeciqnPCgio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bem+zGmRkCa1NAEGeWYMg4mKcE+X4X0RF0EALU4mwfGGXLKY/c3LEyqrYmHDRiQei
	 fYHhPe996kaqxFhPSZkstwHdtCnJ4l+08rrJ8pUtWNRXGJ4BNQ0/zwBU9o4F5L4Oh4
	 1Gd2k/9Khj5KLJLw/LvUuB0nHvDP4ajoNGXxj5hM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5234CF80588; Fri, 15 Dec 2023 08:27:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 257E2F80578;
	Fri, 15 Dec 2023 08:27:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E4CF8016A; Thu, 14 Dec 2023 20:37:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B61B9F80114
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 20:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61B9F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=San18HG7
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3363aa2bbfbso2047130f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 11:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702582620; x=1703187420;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFubgADP9XhdCLx967vVc5Kz7bKh+8vvZX0YN/15/s4=;
        b=San18HG7IIyQ+XJE+Q14qPhYLUEpLhuIfKifO5AyGvO0iDOvOtUlOPw2fUr5IvaX9t
         wkvQM1j0CA0p9hU9DrrShEyCOpon3JIaBAfC0e8K/+TbNMQXreBiy5zyZatm4IOdwKip
         sHjn3TEN/EBnYcIElTvYmp79jPe5HyaNHTpcHe8Jj1njHmgbaJhDQbyURi1BCrOEbA3v
         lY+0ddSDbmQter5Ls4C1RK8hapNLhfYRsAMi72kapjTCSEY1SpoFryjfE323Qjq0G5oG
         weF6tk+wnu9VvX/C7cJlChx7wiv7p2pbZAfx/Jul3i0eqQV6D630qOYzwwlsqIkkjZeV
         QG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702582620; x=1703187420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFubgADP9XhdCLx967vVc5Kz7bKh+8vvZX0YN/15/s4=;
        b=CJluop7tXprJUNU+GVlRdMnQRsY1x5zPD29zxbWVScEdRYsj5aUzTjn6nJzM29v37+
         YS9lGylAfdCNuDG5O3CJKEnL1zEP8aV6gUjY+f0QbKRhvKap0evo5hnPmDb0TYTJglOX
         zgGT2c5hjhvP6yZTdHIXYTLuskmjGxUFvhSCU9S6RmzsqoPq557aaCa3Jh2wMDqDdMpY
         6N7kQ608+c60hiZWURPKgxBa111Sqfm6Z7bceQRgxLZH9tp7Vib4hd/SJ4KXxWj1zg7R
         GecId7M2Mb8j5IHlilR+jIGne0UwOuZhp9LIYCzzpY/av3GjiCEP9HgCecY/a5xHV+mZ
         qG4Q==
X-Gm-Message-State: AOJu0YyFOZdGFl2n0dsEW977m1XeByD2bMoTARFCatsruxQHaGZtc2JE
	3HQ5+URzAszNlGWeJKSm+A==
X-Google-Smtp-Source: 
 AGHT+IHcXLj5OmgS9QESNFSohmdOoItGwQ/x/a/xAWVvqRZ/S+U9+6YbzNiEtyuMCorI4IJWVesZXg==
X-Received: by 2002:adf:ef84:0:b0:336:4b83:3e6b with SMTP id
 d4-20020adfef84000000b003364b833e6bmr655940wro.117.1702582620265;
        Thu, 14 Dec 2023 11:37:00 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-153-16.cgn.dynamic.upc.ch.
 [31.10.153.16])
        by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6282000000b003363432c0ffsm7090118wru.113.2023.12.14.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 11:36:59 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: tiwai@suse.de
Cc: alex.vinarskis@gmail.com,
	alsa-devel@alsa-project.org,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	josbeir@gmail.com,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	stuarth@opensource.cirrus.com,
	tiwai@suse.com
Subject: Re: [PATCH 1/1] ALSA: hda: cs35l41: Dell Fiorano add missing _DSD
 properties
Date: Thu, 14 Dec 2023 20:36:58 +0100
Message-Id: <20231214193658.18969-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <87ttokpyws.wl-tiwai@suse.de>
References: <87ttokpyws.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alex.vinarskis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GL67LQPPTU2WVJO6FVFCTAVBAITGBDDP
X-Message-ID-Hash: GL67LQPPTU2WVJO6FVFCTAVBAITGBDDP
X-Mailman-Approved-At: Fri, 15 Dec 2023 07:24:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GL67LQPPTU2WVJO6FVFCTAVBAITGBDDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> Can I be awkward and ask that we hold off on this patch chain until
> then?  Then we can add this laptop using the new approach.

> If/when the chain is accepted, we will add support for a few Dell
> laptops as well, including this one.

Sounds reasonable. I'll be looking forward to your new framework.
Once up, I can adjust my patch, and if everything still works as expected,
push updated version for review.

> Instead of erroring out, I wonder if we can noodle our way to the
> appropriate clk and clk_set_rate it up to 4MHz for this particular
> laptop only?  Stefan's taking a look at that.
Thanks for the initiative. Potentially that would work, however, it would
require to go up the clock tree to the divider. Since its clearly a
firmware bug causing lpss miss-configuration, I intially thought it would
be best to have it resolved there. If you need more information, I would be
happy to share results of our debugging with you via private email.

> Also, any SPI rate >~100k is probably just about usable, so we don't
> want to error on <4MHz.  Quite often the spi clock is set at some value
> just below 4MHz.  It's unclear if this is going to get fixed in the BIOS
> at this point, so we don't know what exact rate we'd eventually receive.
I'm afraid I have to disagree here, 100k is _way_ too slow. Not sure
intentionally or not, but wake up from suspend is held back by Cirrus
driver. At 100k, I got these results, on boot:

```
[    5.561244] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: Adding DSD properties for 10280BEB
..
[   11.251145] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 10280BEB, BST: 1, VSPK: 1, CH: R, FW EN: 1, SPKID: -19
```

And on wake-up from suspend:
```
[  307.162720] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: DSP1: Firmware version: 3
...
[  312.515588] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: 100000 Hz actual, DMA
```

This means ~5.5 additional seconds of black screen on wake up, in my opnion
this is completely unacceptable. With 4Mhz, it takes sub 1second. Moreover,
the first time (after preconfigured by ALSA delay) sound is played, it
seems it needs to communicate with amplifier, and it takes additional few
seconds to start playing at 100Khz. With 4Mhz, its practically instant.

I agree that it is unlikely for Dell to ever fix its firmware. Thus either
in case of intel-lpss patch, or via clk_set_rate direclty from Cirrus
driver, lpss divider would be set 1:1, SPI controller would receive 100Mhz
clock directly, and set it to whatever is requested internally (currently
4Mhz). This way, lowest 'usable' rate should be irrelevant.

> Quite often the spi clock is set at some value just below 4MHz
Perhaps to address this, we could error out on say half requested rate? In
reality, it will be either requested rate/just sub requested, or something
totally off, like the default 3051Hz in this case.

> This will break once you pick up AMD's multi-cs patches, we should use
> spi_set_csgpiod instead.
Thanks, will correct.

> I suppose the error-out was due to safety reasons, but the clock
> adjustment works, it should be fine.  Let's see.
Precisely, since it is indeed unknown when exaclty/if ever firmware will
be fixed, and/or when our patch to intel-lpss will be accepted.

Regards,
Alex
