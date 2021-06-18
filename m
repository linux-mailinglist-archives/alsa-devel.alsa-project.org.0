Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4D3AC7FB
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 11:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B411703;
	Fri, 18 Jun 2021 11:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B411703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624009758;
	bh=USuKvuil11nrB9Z4+xl7NbrE0IqPqqNfEPXFaP8ZsFM=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=og1KRo8oGjL7ir4bryo6nqBzIH62Zr65eo+YTwTbNBWvSnyo+ncMJKyxY8E+kn9A1
	 OwFVlOV8Ohh1vDyODqVDicJDgXKuEviVA6+5eFPjNRTJF78yUtaSZIcmjfThf6HF5C
	 MINkJu1t8RqO4kFQgc5DX6BJ0ZF4mhxke1sg7D+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08314F802E8;
	Fri, 18 Jun 2021 11:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0BC0F8032D; Fri, 18 Jun 2021 11:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD601F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 11:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD601F80084
Received: from mail-pj1-f71.google.com ([209.85.216.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1luB6D-0005rm-1V
 for alsa-devel@alsa-project.org; Fri, 18 Jun 2021 09:47:41 +0000
Received: by mail-pj1-f71.google.com with SMTP id
 u11-20020a17090a1d4bb029016df2fceb76so5841701pju.0
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 02:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=USuKvuil11nrB9Z4+xl7NbrE0IqPqqNfEPXFaP8ZsFM=;
 b=EPsJBS64QxqdZE5gi4RwBwdWU12wFO1WefIYRqq0/mF3oZVhf82BbMEM6wG6gBor92
 TpiEwyo6K8GduU32plTBT7hQy3B2bGhuVM4n2Hx+5DW952To0rWV8dVm32TUHr9/TgcE
 c3D0xE+iQFLHhJ0GrgSod5IshiY2A/eYg11sUAfWBLtNZfGepsyG7s7RmU/I8sLRueDW
 L5zP16xq932nGfmsOU9TrDvvZTuVxuntVxkCOc0HQsoAil5dPZNaRtAq9OEXPAPckDdZ
 O+thT1dBSAU/aEMqowOgieYz/uavEVEIXK+wLhO3ks072AgA3Z+7oqy47rAnJH2qTXJV
 59Ag==
X-Gm-Message-State: AOAM532ZzGJKjIXsCozTJJeNtBnR5P8vI/HWojdxGaVyRbJ+qLKEvGBC
 p1WmzQ3sGiMF6XIEq7j6iVT302mCyxaOCFtAU9TsQgUdyvcW81cq/EIGRcdEjOU7RjhTl7JqBp4
 ajQUM/HNY1mGrb4QYRHxbs4KjtNiKlP22yfETKVBP
X-Received: by 2002:a17:90a:5511:: with SMTP id
 b17mr21343758pji.121.1624009659857; 
 Fri, 18 Jun 2021 02:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaVe1n6xD1nnBjU9sdmtLxXfcu0BEKi7dgHi8+dNchto/0omPNzTYbrCzcVflAVcst4l65gg==
X-Received: by 2002:a17:90a:5511:: with SMTP id
 b17mr21343731pji.121.1624009659445; 
 Fri, 18 Jun 2021 02:47:39 -0700 (PDT)
Received: from [192.168.0.101] (36-224-193-219.dynamic-ip.hinet.net.
 [36.224.193.219])
 by smtp.gmail.com with ESMTPSA id g13sm7202339pfv.65.2021.06.18.02.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 02:47:38 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Andy Chi <andy.chi@canonical.com>
Subject: [PATCH v2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 450 G8
Message-ID: <0d0420f6-ff0f-2f7b-e50f-1fa09f39b175@canonical.com>
Date: Fri, 18 Jun 2021 17:47:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: tiwai@suse.de, linux-kernel@vger.kernel.org
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

From fdeab6f32dbdbfd83c9af6efc5a51f91021b6578 Mon Sep 17 00:00:00 2001
From: Andy Chi <andy.chi@canonical.com>
Date: Fri, 18 Jun 2021 16:17:48 +0800
Subject: [PATCH v2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 450 G8

The HP ProBook 450 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ab5113cccffa..70bc5b11acfd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8336,6 +8336,7 @@ static const struct snd_pci_quirk
alc269_fixup_tbl[] = {
               ALC285_FIXUP_HP_GPIO_AMP_INIT),
     SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
+    SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 2.25.1

