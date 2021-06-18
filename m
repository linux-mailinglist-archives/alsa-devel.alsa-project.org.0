Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE63AC793
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 11:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1689E1710;
	Fri, 18 Jun 2021 11:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1689E1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624008644;
	bh=SiLoPAvM/Fye6ghUgbRStLteWtoKAR7gjbQpjwIhpKU=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3e7PifGFXqwWplPnWsXyTysTH3bMMygqepKbb2nHgm8rE2BbBMHaRPT4eZ8sSygu
	 gWXG0ZmyhymQp8CssNuQ0UpJOo4HOU0yLnHWn9CrnyQbyIY3frXDM4ClPFFMj6jID3
	 Jh1lJsgdaZBUu8EzUv8k8hSNhEeATo6/pm7zzAiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB0C1F80084;
	Fri, 18 Jun 2021 11:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 096DDF8032D; Fri, 18 Jun 2021 11:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93B8CF80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 11:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93B8CF80084
Received: from mail-pj1-f72.google.com ([209.85.216.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1luAni-00047e-Rq
 for alsa-devel@alsa-project.org; Fri, 18 Jun 2021 09:28:34 +0000
Received: by mail-pj1-f72.google.com with SMTP id
 on11-20020a17090b1d0bb029016bba777f5fso5760764pjb.7
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 02:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2GptbyilHSJibKkapjpgEo+GB+erd/HF+VFbdT2MZPQ=;
 b=LbC/uv2bxittHkIBgjPTqU7zZQwqAxzzIsrY13H2nv1UBF2t8m3LP4EaK6qYUxNVy4
 JPcTbkLme7cMuku0AuQmEb9aoHl5SKMfBS4we/ExE/1iBSWOqwGLEmtCyOoLMk1beJP2
 wfRQ8/TYQvH+4rzQDLFOaknj6qR3dSKmckh1wQTV/fmwma1yHkXjFisVP4cJysge1h3x
 /p31z1h6E6xJ5XZVBFAq4GJoCj2+aLLNRBlnROXUPFLn/yLt6DnEdr7QkXbBfMAXxL1h
 HocN3RzIRijPVqmX6h5AQWoDQmgFZHimRJzTLJuAyj4r2zgY2VTdXzXLRtVwDdA5HFCa
 aD3g==
X-Gm-Message-State: AOAM533T0atO6sa5AHGWmhpgsKdJw/WpN9LIjy8WZSIWMI701BTmkUBH
 sKudXLGKPz+BXD9WJNZ9LT5sLi917JPQ8R1cxbI4tMtO/m4j4XWVj7aiQAnDisRYoXNOuwGL02a
 QgjWNV41s0iA1grOYuQG5i+kL0uFLLtPZ5aU4VXH0
X-Received: by 2002:a65:67c8:: with SMTP id b8mr141809pgs.109.1624008513649;
 Fri, 18 Jun 2021 02:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXnIVc7lGI0Dljcv1tKbxWJjIbevKkXW7lVWuJgHjr5aEGwcz2xPra6ux+5/PHdNe91AuNMw==
X-Received: by 2002:a65:67c8:: with SMTP id b8mr141797pgs.109.1624008513503;
 Fri, 18 Jun 2021 02:28:33 -0700 (PDT)
Received: from [192.168.0.101] (36-224-193-219.dynamic-ip.hinet.net.
 [36.224.193.219])
 by smtp.gmail.com with ESMTPSA id y7sm1654573pja.8.2021.06.18.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 02:28:32 -0700 (PDT)
Subject: [PATCH 2/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 445 G8
From: Andy Chi <andy.chi@canonical.com>
To: alsa-devel@alsa-project.org
References: <7797aabe-83c7-a63c-7749-73dea0e25f54@canonical.com>
Message-ID: <5c5790ba-d21b-20ff-7ded-b92ca597f9a2@canonical.com>
Date: Fri, 18 Jun 2021 17:28:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7797aabe-83c7-a63c-7749-73dea0e25f54@canonical.com>
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

From f6d2556f8f6bcdd2261b48604b8086fb67ae9a03 Mon Sep 17 00:00:00 2001
From: Andy Chi <andy.chi@canonical.com>
Date: Fri, 18 Jun 2021 16:23:06 +0800
Subject: [PATCH 2/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 445 G8

The HP ProBook 445 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 70bc5b11acfd..a1e62b2de167 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8344,6 +8344,7 @@ static const struct snd_pci_quirk
alc269_fixup_tbl[] = {
     SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC",
ALC285_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook
PC", ALC285_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC",
ALC285_FIXUP_HP_GPIO_LED),
+    SND_PCI_QUIRK(0x103c, 0x8863, "HP ProBook 445 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x886d, "HP ZBook Fury 17.3 Inch G8 Mobile
Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
     SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile
Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
     SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile
Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.25.1

