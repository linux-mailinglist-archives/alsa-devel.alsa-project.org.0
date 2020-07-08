Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5D21A214
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 16:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7C59F6;
	Thu,  9 Jul 2020 16:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7C59F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594304849;
	bh=1CewVLm+s7fVMdPViHyCrFuChEZ4jWUHKWZXpgJiBhU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TZTP3WVFLFRXXO3FOolgUVmkos8xoWrR2xebNChsmRTs+HqRkus9ptmi0Z+2p5M3J
	 l7pKEC9PkPOfR0f8g3sj6GwyQPdyaKbRcFR5Hb9E/n+gQvBtdkO1UsChq1K9mSLdLn
	 sEjr3G/EM73VHZniT6vD1Sq6MfCPq6BkxT3aL06w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C95F802E9;
	Thu,  9 Jul 2020 16:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D3B6F8015A; Wed,  8 Jul 2020 19:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C09F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C09F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RPofA+AU"
Received: by mail-io1-xd42.google.com with SMTP id q8so47928583iow.7
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BA+Vp5PUdZmdYIEe8g+pikWUOCupAwvS+IsOKUxpsqc=;
 b=RPofA+AUmfR0+dgm+EHMO5j1PHJ25eRC4h7IgANRzjSPNV69/zcvaeiQxL5dZtJuSS
 STdR01Yf5RY2F+2aRfbRGIX56sOeSG4NuAoHuv2MLxLJu8sk+ugDy7Mz00MYbvbdqZRE
 +nnXZKlzqXKpy7x7fsJ31Obp28PDUsGXhv62jNqiPWI1vti8uvbnmXBeMHUAeiyuYBpv
 hokgRNdJRr9au5E29eGB+82A1ZYdDDpks1YBjeQ7/GmwBmm0gT71O7yaKMUu+4F+MNBg
 qIO6HtyuEzJfdEjEuvyBKdVg3GDoXNHpELAae9Ce3LqLZ/7Y8cslt41A9uxRwMlWC8CP
 PVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BA+Vp5PUdZmdYIEe8g+pikWUOCupAwvS+IsOKUxpsqc=;
 b=hd0jf/HzWZXNsJMkv/sRYsv9DHPSmKNGtFa8g1k1OZQ2BC955pE/TdUwwzKQHLT7ID
 EhlNvWeZMdM4akHQqFpDTrIn70Fbr/7Lkn4vhDDTju8lAp4iJ4EUvgTW4eUV549Ic8j9
 VS89iWqR0v0kIzBp1IDpXWhXiD2gX/Rknj3ULtDZNkfMgLsZ/NUyYEWgVVhccNvmcvdq
 LyOpeEdEe+qh/R5PxllO9yio0oZc2oTrmvFrKzzahO9VhFYZVhHF950rIsX07jKD1yGd
 atpkX/fFOFzj2dCXbxQ+8TTF81kkWIN5Gmc+NVlAeMbrbQsp59RdyLe2yVgbIu0J8yNP
 IbhA==
X-Gm-Message-State: AOAM531bsby9g3CquewRNK/y98+licmR1nXeb9UjvZnFBEuIJpa81Hkj
 IqzxvEpLgVpKMoBrklOlGOUqEfEVj3JS91d00ws=
X-Google-Smtp-Source: ABdhPJxm8vqZdhTgtR+PdC+ODPxkhoK0RBvgUObrOzKTrY7+G8i40q0pWyjFmvi7ekMK/j1p1729TaH/ADHT/O4xA+U=
X-Received: by 2002:a5d:9c44:: with SMTP id 4mr38503292iof.15.1594230215485;
 Wed, 08 Jul 2020 10:43:35 -0700 (PDT)
MIME-Version: 1.0
From: Junar Wohn <doomsheart@gmail.com>
Date: Thu, 9 Jul 2020 02:43:24 +0900
Message-ID: <CAHcbMh2gBKwiC-_UvbhXLuxKCmc+jzWrmcf7_0hsQ6AZHwXZrA@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Notebook Pen S
To: tiwai@suse.com, Junar Wohn <doomsheart@gmail.com>
X-Mailman-Approved-At: Thu, 09 Jul 2020 16:22:25 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Fixed no headphone sound bug on laptop Samsung Notebook Pen S
(950SBE-951SBE), by using existing patch in Linus' tree, commit
14425f1f521f (ALSA: hda/realtek: Add quirk for Samsung Notebook).
This laptop uses the same ALC298 but different subsystem id 0x144dc812.
I added SND_PCI_QUIRK at sound/pci/hda/patch_realtek.c

Signed-off-by: Joonho Wohn <doomsheart@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 737ef82a75fd..ebedc6093642 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7528,6 +7528,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
= {
  SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)",
ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
  SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)",
ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
  SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)",
ALC269_FIXUP_ATIV_BOOK_8),
+ SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)",
ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
  SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807",
ALC283_FIXUP_HEADSET_MIC),
  SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120",
ALC283_FIXUP_HEADSET_MIC),
  SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)",
ALC283_FIXUP_HEADSET_MIC),
--
