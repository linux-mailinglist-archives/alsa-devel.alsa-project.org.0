Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C9576CBB
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Jul 2022 11:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017A61947;
	Sat, 16 Jul 2022 11:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017A61947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657962837;
	bh=2OBG9rQoAFY9GFgblzZdfRa/AZ5TMV50Sy7cfKSNuHY=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GaQJUIcKShxF4lzy82QuVqoyN+il7mp4JQ1OS8uksotH+oeu6sl/ZilcqM6O4xpyt
	 inEg5q2TS1z659ylYM9iku9jRent3tdN134VttNlmozqMC10F5fIT4CM/P+2MtGcLa
	 QWFKP64vyNDuoTQLIJTVG4ERpaLNfp+ldYJn7o5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 726EBF800AA;
	Sat, 16 Jul 2022 11:12:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC82F8023A; Sat, 16 Jul 2022 11:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9079F800AA
 for <alsa-devel@alsa-project.org>; Sat, 16 Jul 2022 11:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9079F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dbbs3X4f"
Received: by mail-lj1-x231.google.com with SMTP id v15so4307249ljc.1
 for <alsa-devel@alsa-project.org>; Sat, 16 Jul 2022 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3QZVtFqHuiCcgoTBA6HrO6NXKNNvRGFtA2MSu5wIdn4=;
 b=dbbs3X4fgMBMXFvWiNCEDftamKZ1RI3KOuv75zfbBp1d8JFb8UxgsU1xs5xJLewqku
 4dXIjgzUHwELozlQ2KlIGII7KGxu/+lcUbcCNlaGk1UXPlr5OP/nVV09iWKZ7aC2NalV
 kzu7gpUkPLOy5sq6SaGf6GMaFN2Sd/9kfLlXGaicexa++GWAYVhvYXOOw0lsllaeC9El
 wOYXN6oMtMxSPylytkP3IGB+2Kq9de8n/nUtn9aCMkkxJ+CWg+j5rjW0zbH0tYg++9sU
 ufMK1zHELV//6pLiRjw2wOxoQ4hSBdKZEvIF+SeAI6o0UykrIFGA1SDYr+hkhzIsSvXz
 dEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3QZVtFqHuiCcgoTBA6HrO6NXKNNvRGFtA2MSu5wIdn4=;
 b=wksr3xRwqTqc0ZwgSOT5ffAKYyNenzoYmup6fWG4+vPSuyT8/KfSeu9cpzSHPo/vDq
 v+WW2OwmWVon2xLmqk1Ne8ZtclyA5WQAh0JWKwCL3XSrEvWm3rX8rt5LB5vK/1oSIC1X
 Nh0wC24c6Jq3M5th05yzXMhb/nzf3y962akGZEmrQKmJCtj35zjQI+JI/pkS8BaKrX41
 veavikpIaP+av3MJ/Az36+k0NSLsVx4lp3yO8j0F3CpNJBLoVYul/dj80i/7C3cJne2C
 nMAkjoTm4j/2S78h0cOVKbU/zMm8M7xJh4CRUUQkdOXcq3+LfKv9CTY8+lPUoH5ghv97
 upxA==
X-Gm-Message-State: AJIora87/DkNQtAT6hmsdKVdJRvYt9gZj/SugQzdVOGaw4ee1g1aDtDI
 qUDW0gSDDk85lzue+fmcg0HTik/W/rC0MmH5gw==
X-Google-Smtp-Source: AGRyM1upNDloBaniyi/j3Rv19qKaeBnKgqtHrM/AqseVD7CcIUvnnXp3WdY2eHY/m7wN8RPHsF1KnDpdMNxFXSKG9PE=
X-Received: by 2002:a2e:bc17:0:b0:25d:50b7:74fa with SMTP id
 b23-20020a2ebc17000000b0025d50b774famr8666342ljf.444.1657962769637; Sat, 16
 Jul 2022 02:12:49 -0700 (PDT)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sat, 16 Jul 2022 17:12:38 +0800
Message-ID: <CAMhUBjm2KOZZj=M3=yLvLm4QcNYpOTa+2_dPcHr7nHm4GE73DA@mail.gmail.com>
Subject: [BUG] ASoC: nau8821: Found a bug when removing the module
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 wtli@nuvoton.com, steve@sk2.org, Vijendar.Mukunda@amd.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I found a bug in the driver nau8821.

When removing the module, I got a warning:

[   64.226442] nau8821 0-0010: remove
[   64.227621] ------------[ cut here ]------------
[   64.227918] WARNING: CPU: 5 PID: 243 at kernel/irq/devres.c:144
devm_free_irq+0x80/0x8c
[   64.235307] Call trace:
[   64.235501]  devm_free_irq+0x80/0x8c
[   64.235746]  nau8821_i2c_remove+0x28/0x3c [snd_soc_nau8821]
[   64.236982]  i2c_device_remove+0xcc/0xf8
[   64.237173]  device_release_driver_internal+0x208/0x368
[   64.237406]  driver_detach+0xd8/0x12c
[   64.237583]  bus_remove_driver+0x90/0xd0
[   64.237768]  driver_unregister+0x3c/0x6c
[   64.237952]  i2c_del_driver+0x54/0x74
[   64.238127]  cleanup_module+0x1c/0x1d0 [snd_soc_nau8821]

regards,

Zheyu Ma
