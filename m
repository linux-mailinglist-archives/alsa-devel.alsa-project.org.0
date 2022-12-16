Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A937C64F552
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Dec 2022 00:48:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2428116E3;
	Sat, 17 Dec 2022 00:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2428116E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671234499;
	bh=HJDFdvLuzuVRUsBi3mDaovfCwLQuvHrr/9wvS/8OE7M=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qTXNY/IyBRnDMRSoMRdhDGjqEJyvrMQ4DSi4vZ0HCReTs1iLUj/dj/C/SnHhIHIJC
	 Y8xlxEBYe8OIr0yVIIvT2VVfhAZDSESFLcdOhHPFnIbOGBaYmUIt4HrVen00VmrROS
	 PEum78nT71rt5QpJbVjsGmP6duqdUOiYa9n2+mk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA07DF804CB;
	Sat, 17 Dec 2022 00:47:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3031FF804E2; Sat, 17 Dec 2022 00:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42ADBF804D7
 for <alsa-devel@alsa-project.org>; Sat, 17 Dec 2022 00:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42ADBF804D7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=csoQxFmo
Received: by mail-ej1-x629.google.com with SMTP id t17so9728699eju.1
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 15:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:cc:to:content-language:user-agent
 :mime-version:date:message-id:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHMmmido3nXTHMEbDUi50QRCKsCrWJz9nzirvJfWkMI=;
 b=csoQxFmotzwpUL8SeawGxp9S0H2us15OpOoYyoUP33kyWFGFWRH4dqqh6aVO9rO+fU
 LriTAksEiG6yDJ8I/HQEyFAxKjKpSFo4auFAn85aiUj2CVHPCt9OjMxVrImFYZ7AMS8l
 vMIQGz1WTF5rEsBHEs9ZOWZAL72jzQuGh4QuMUq0gU6Ert8LkerXYkgw5KGIKtLNzy9I
 pE+NeapTEPFovYXLS3KTFr8q9CgQEg/0WOEzNZNiUGBA11J67/2lUYlOKVaeDeBow3RO
 PnrO3CbdXwKnAIUd2CNnqoFwLvac3ntbuo2OL8uDu+MXmeUg4m3je9P2Vgh4rC14Jqkq
 mxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:cc:to:content-language:user-agent
 :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHMmmido3nXTHMEbDUi50QRCKsCrWJz9nzirvJfWkMI=;
 b=y/ozJtaOMtzAghS0A1qdiHeIucpm4dhgD854Mfng1va1BBcpS4x/uxQpwWZnGsB0mC
 iJnWuKE6OzYvR0tKmPlmiby8qcewgl6iYqPL7wQDbXI9ymDEp2xeQaJI36YZ3mhfjiPb
 +aIi6yh8ArH3k5HM7t1U53mxtSxCHcHLxuI1Hj1CWPJljGwilfcjpPccyJ/Suw7VPNM9
 XuSkBve++0o2c7vrBrDE/DMhM86Cwf86frk91upW4Skg3AKQhidDzUqKQYRrFSUm5uDt
 3+CPPsKKor9yhDtK7gt6rFSZBSVEzxKNoA1OfGfcYmZuEquJ0h4UtaSMc01Rnd0DD3yI
 d9UQ==
X-Gm-Message-State: ANoB5pmUE0hEZ0FY38WasOoHYNJf9lyFfM45nMq6skdWaTxLRUJHoMUE
 SK0QRe47L66khhC9itjWy+JU6K41+HZlmg==
X-Google-Smtp-Source: AA0mqf7c95+jPEu42uKRI2Xii8b7yzXdpEjXvWFZ/q14r4kCosWhrPIrQGAHjRQlHO5hnbzaa1FmEw==
X-Received: by 2002:a17:906:f106:b0:7c0:aea2:e910 with SMTP id
 gv6-20020a170906f10600b007c0aea2e910mr40798327ejb.3.1671234435390; 
 Fri, 16 Dec 2022 15:47:15 -0800 (PST)
Received: from [192.168.79.191] ([151.30.119.73])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906300b00b007bee745759bsm1357387ejz.20.2022.12.16.15.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:47:15 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
X-Google-Original-From: Emanuele Ghidoli <ghidoli.emanuele@gmail.com>
Message-ID: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
Date: Sat, 17 Dec 2022 00:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: alsa-devel@alsa-project.org
Subject: wm8904 and output volume control
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Michael Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,
I have found that output volume is set to the default value after a 
limited time (~4 seconds) after play stop.
I have analyzed what is happening:
- at first play the volume is the expected one
- After stopping playing + ~4 seconds wm8904_set_bias_level (..., 
SND_SOC_BIAS_OFF) is called
- Chip is reset and regulator is switched off if "possible" (not in our 
case, it is important to note)
- at second play wm8904_set_bias_level (..., SND_SOC_BIAS_STANDBY) is 
called. wm8904_hw_params is also called just before.

I see that all I2C transactions are good, registers are written as 
expected, especially volume control register (even the silly HPOUT_VU 
bit, to do a volume update is correctly written).
Reading out this register, using i2cget (bypassing regcache), report the 
"expected" value. But the real output volume correspond to the default 
value (hw default, that it is the same value in wm8904_reg_defaults 
structure).

I checked that SYSCLK_ENA is 0 during register writing (needed if 
MCLK/SYSCLK is not present). I do not know if there is some other 
constrain on these registers.

If I rewrite the volume control register, a second time, the volume is 
set (tested with i2cset, from user space. And from kernel space, 
bypassing regcache).

I resolve also by reverting e9149b8c00d2 ("ASoC: wm8904: fix regcache 
handling").
I'm not here to say that the commit is wrong. I analyzed it and seem 
perfect (in few words it align the hw with the regcache avoiding 
potential incoherence).

I'm trying to compare first play and second play register programming 
sequence. They are similar but not the same. But on the first play the 
volume output is good.

Do someone remember something similar fixed on another codec?
Any idea is appreciated.
Thank you.
Best regards,


Emanuele Ghidoli
