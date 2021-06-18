Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFE3AC8C9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 12:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5589C171A;
	Fri, 18 Jun 2021 12:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5589C171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624012084;
	bh=i51N7OFQgUge8M8rgTD9bGoP/nO/lCSHMBC1i1xqXdQ=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NPs4K32XWxVLZortoIQOEZVgOxVp3elV6zS74qNYV+wAav1CuYMe5k7UcDMFQ6EoJ
	 XjgITZkAnlP6rRm1JozyEFaKBuhzy3RfHzdQlj9/+FiCr68aDfiAnYNph9ZwaoFoHr
	 CseXLiYKsbPnDQlhFMoF30lqnpCVfLEP8ZBlBTFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C89F802E8;
	Fri, 18 Jun 2021 12:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAB31F802E8; Fri, 18 Jun 2021 12:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED206F802E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 12:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED206F802E8
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1luBhk-0001Qu-7Z
 for alsa-devel@alsa-project.org; Fri, 18 Jun 2021 10:26:28 +0000
Received: by mail-pf1-f198.google.com with SMTP id
 124-20020a6217820000b02902feebfd791eso2707647pfx.19
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 03:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=i51N7OFQgUge8M8rgTD9bGoP/nO/lCSHMBC1i1xqXdQ=;
 b=FyG2N7y5uU8YnslGpcQr8lMxkEFEOove8rttWHHZP8JIhsXLE8QLr6LiiWym1yMOqm
 8YIUxs9AnuyV/ZQrFkPH5iUMnVlVwOZIukxlR94cHK6pyDBmLfTpDebZ2tXHCptG9vFS
 2MjLx5SS5qSnyAtPby3UdLg6zarKX670YMCMXqeaURFodDv+/QPcL1Lic52mfdUZarMA
 wQAFj6/Ax7X92siUD89evAXQPXI+8pESU1JwajI0ETRJ5nrr4tWye9/985Rn4XnHMBwi
 XWl8yWVaFBbetHEHY+AtfBU3POVkem9342zgy2H7gQI3CVmyGv0/HzsHe1A0XPcIcwgb
 dpcQ==
X-Gm-Message-State: AOAM533JyF9ZFwywnamnGdDNxC+7Bfwl+moGqNZrqiIlYg6snbmx2QzY
 QljJASDey04VFH0HeI+t6sOabePNkisWzHHbR7UIkTld1/JYEAJQAIiCWHxsMN4iXjrXFetZ84G
 aGVStPaWQzd+Y7dDAKoss+GKLfDgda8LtwaS97wxW
X-Received: by 2002:a62:cdc6:0:b029:2ec:8ee0:57bd with SMTP id
 o189-20020a62cdc60000b02902ec8ee057bdmr4282630pfg.78.1624011987014; 
 Fri, 18 Jun 2021 03:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP9TP2lIab50kwFisgDvoY1EowBbXFKViPv3/hTx+FKR8CQkqKPpIiMOnEh980wtMb4vCHmw==
X-Received: by 2002:a62:cdc6:0:b029:2ec:8ee0:57bd with SMTP id
 o189-20020a62cdc60000b02902ec8ee057bdmr4282604pfg.78.1624011986568; 
 Fri, 18 Jun 2021 03:26:26 -0700 (PDT)
Received: from [192.168.0.101] (36-224-193-219.dynamic-ip.hinet.net.
 [36.224.193.219])
 by smtp.gmail.com with ESMTPSA id z6sm4425663pfj.117.2021.06.18.03.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 03:26:26 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Andy Chi <andy.chi@canonical.com>
Subject: [PATCH v3 2/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP
 ProBook 445 G8
Message-ID: <02b15330-be55-1584-55bc-ba680f6b934c@canonical.com>
Date: Fri, 18 Jun 2021 18:26:23 +0800
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

From f6d2556f8f6bcdd2261b48604b8086fb67ae9a03 Mon Sep 17 00:00:00 2001
From: Andy Chi <andy.chi@canonical.com>
Date: Fri, 18 Jun 2021 16:23:06 +0800
Subject: [PATCH v3 2/2] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 445 G8

The HP ProBook 445 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 v2 -> v3: no changes.
 v1 -> v2: no changes.

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
-- 2.25.1

