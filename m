Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2E3AC765
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 11:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65F216F9;
	Fri, 18 Jun 2021 11:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65F216F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624008411;
	bh=PZHIJb8V57r4Bwis5uLp8FoGAnWanjj2H51slUSKVpM=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RjIF8Yt0zjcDGGhpRnMMtE2SJTN6lTn7Tr+JeN2YhJ5UT6zB6QZcU4UU3C2ZcdDuv
	 cYmq76COhOmIWeowugAjQbFf/VMcOl5QDCIf1mu7MNGYRW/qdWsZV4uq1XEYJ/dADB
	 dGTSGLd6sbjCrJgxOzBfTzT+4YtmUbv+lS+pBTps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DBE7F8032D;
	Fri, 18 Jun 2021 11:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4985EF8032D; Fri, 18 Jun 2021 11:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 410F7F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 11:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410F7F80084
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1luAkT-0003qb-Il
 for alsa-devel@alsa-project.org; Fri, 18 Jun 2021 09:25:13 +0000
Received: by mail-pg1-f198.google.com with SMTP id
 l28-20020a63571c0000b02902224bbd5ea1so5496934pgb.16
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 02:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=E7KqypH/WQUMF9Du8fxlBjjhwnPAUXJyG3rzSTA+emY=;
 b=bGfetSwvuvfkX8IxDVh7Wzr9A2NYuDte4bL9/ojVFMhy6Tnc/u/vBQFFUHpu78RYuO
 Pl1XimfhOpguIpy2M42IISRMXTkmGWw3fdlP4V42nymElkDSEVlWnOTaFicvCpqdpKiT
 AHan6wNWvykuFIT+uy0ShJNZ3NOd+U57TcOOjhJ4WVTZYVBkeQJE8cmCelBGBp3pOEI4
 TCvPPkuvHCPdLV3uA2x+iwS4nZRH4aOdsPyk0YeKFiU+rL52AqPDkG+6B+N+4SWFnSwo
 qOMK91o52QJ9rhf4z4HDzSB98DYn5dYsexuzEEecF80Z7wOHJFwd39EmpAkKAIO7U2eX
 u7Fw==
X-Gm-Message-State: AOAM532EFV2++fZWi3xMksq71pGAnM7WUTdWvFzcfZAuQTbr+bhsTtW5
 A6F42hp1e/Bb4JCHm6Zn5Wpconans3IZ4OWlTcA8XtLZyUfSzYiK7yJDdtwZOANtjYX21irhQFp
 jICgBVjr1yfwl1POiGCGXvH37jov/snGezbkIgoCm
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr4000883plx.50.1624008312362; 
 Fri, 18 Jun 2021 02:25:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBfPjy4mQOWDzzfnsRaE2kmGYfR4rlU94En6udVPlvJdf1w5SSLHY/oatMVmTc+0nXg05gHw==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr4000863plx.50.1624008311911; 
 Fri, 18 Jun 2021 02:25:11 -0700 (PDT)
Received: from [192.168.0.101] (36-224-193-219.dynamic-ip.hinet.net.
 [36.224.193.219])
 by smtp.gmail.com with ESMTPSA id r19sm7292633pfh.152.2021.06.18.02.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 02:25:11 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Andy Chi <andy.chi@canonical.com>
Subject: [PATCH 1/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 450 G8
Message-ID: <7797aabe-83c7-a63c-7749-73dea0e25f54@canonical.com>
Date: Fri, 18 Jun 2021 17:25:09 +0800
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
Subject: [PATCH 1/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
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
+    SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 440 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC",
ALC236_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
     SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.25.1

