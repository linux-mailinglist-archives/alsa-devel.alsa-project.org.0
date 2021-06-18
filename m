Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E73AC8C1
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 12:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BAF61718;
	Fri, 18 Jun 2021 12:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BAF61718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624011961;
	bh=759SUMUfqmtYBedo4nGFAc0MmuBPt151bJbCzRn83co=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=akrxJ7ojtaLSjCzSQqRL0D5U9F4zNz3jQVLl8nqJ8prHR9T4sc7f+/M5UxVFiTBuq
	 7ISc7GLWBrMaYZQN+0lliVLal4VRqN7gP8nqkV+zP2KdIdNN+RtGUBNLAVdnGx7EfD
	 /JWeEVKd7Qmbni7hqkmswxd+3EC9tX1kcFFLGmn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E64FCF800E1;
	Fri, 18 Jun 2021 12:24:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6CEAF8032D; Fri, 18 Jun 2021 12:24:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B92FF800E1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 12:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B92FF800E1
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1luBfl-0001BW-3c
 for alsa-devel@alsa-project.org; Fri, 18 Jun 2021 10:24:25 +0000
Received: by mail-pg1-f197.google.com with SMTP id
 o1-20020a6341010000b0290222cd5792d0so4958696pga.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 03:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=759SUMUfqmtYBedo4nGFAc0MmuBPt151bJbCzRn83co=;
 b=olHOD28cc1t7I9A3UOmnca2yYWmyXZX/7RhWqI1PWuzp9sIFGKqyaXmkKyCcYAGc4K
 u9F3hyD2+8LlnJD+ve7sN4yx3uzdtIlhSmEW7RJZIMCkR8OUWlL0gugf3TXx+SLMPSSP
 rvqExjU32OW211RYWjhwDGa7ELYwWu03ZN6T+TCLWKE9ZZ9bKGDo8SCiDrlLZdfGUIj9
 voymljbScCpN3s++fnsDV81kWdnwu+Jo2Il5OHy0XDX49xs7e27rVeSdaKnxINBLhsmC
 Y/dfDpS37LVgdxqmH4VzRRw+4XyPQdTr9VIFoQAXs771qICgapuOcAEbY7JMVstE1oue
 A2gQ==
X-Gm-Message-State: AOAM533fH8gHEH1y272k9ogPPaG0LSV1nmveZkNaAkQBrb1Nd5KAhZUD
 WXjWIPuvAn+9pKKkuBvnZdml9j/0upUH5XYC7OkXvnE9Gymc2+3uJozpFUuejmMTVDQAoYQIIhS
 SWkL8bwk1DS3dai+eU6lMyqM0KwtFBRW+yeekeeQh
X-Received: by 2002:a65:48ca:: with SMTP id o10mr9315014pgs.296.1624011863893; 
 Fri, 18 Jun 2021 03:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTpSV/htT6r/ZqZk45Ir07zo69nWItNQjbvbD9gx8YF7HLHoX6dbabV91DqYgXXGw4/uc9fQ==
X-Received: by 2002:a65:48ca:: with SMTP id o10mr9315000pgs.296.1624011863677; 
 Fri, 18 Jun 2021 03:24:23 -0700 (PDT)
Received: from [192.168.0.101] (36-224-193-219.dynamic-ip.hinet.net.
 [36.224.193.219])
 by smtp.gmail.com with ESMTPSA id t14sm9412182pgm.9.2021.06.18.03.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 03:24:23 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Andy Chi <andy.chi@canonical.com>
Subject: [PATCH v3 1/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP
 ProBook 450 G8
Message-ID: <89f7d50a-7fec-15e0-0196-804198c6c5e7@canonical.com>
Date: Fri, 18 Jun 2021 18:24:21 +0800
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
Subject: [PATCH v3 1/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 450 G8

The HP ProBook 450 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 v2 -> v3: no changes.
 v1 -> v2: fix typo from HP ProBook 440 to HP ProBook 450 G8 (https://lkml.org/lkml/2021/6/18/325)

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

