Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41621A212
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 16:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A27D15F2;
	Thu,  9 Jul 2020 16:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A27D15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594304792;
	bh=RHLsm3Khb82AcKCtjiLNRgjkv1ndXSWAV08qd5UBxXk=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=emTj6ijvK5w0CWreb8vBkjF8zCVCOjWckO+8nG4Fu2IwmNUbubAvl4MwsDlKkHNAw
	 AQMRibhhoEEpbh/VJqgBbAAgaRb8CK8I0pBtokEnS0Z/upAjt6fsgNlNwpXHXa1OiB
	 rdo++mvu/qk1V1s+xYAzrSmWuJTeIsTbXXOlp1f4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC4BAF802DD;
	Thu,  9 Jul 2020 16:22:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F84DF8015A; Wed,  8 Jul 2020 18:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35422F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35422F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wlyg8a6z"
Received: by mail-il1-x143.google.com with SMTP id t27so34621576ill.9
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WOeyxxAKkjzHIRj51TZXpb1M/mpE0jrboWoJ/yTvk9k=;
 b=Wlyg8a6zHs0UV24C7x+gURKdkmi25OaEf+x9PzW+seLYp80tEsZR2E5AhtJ0XBFvLu
 F3Jj7ZsziKPLlxGiWWK2o0r9GnDreaugjB4vXs2qmyv5+EMuGDAIMD0LPEQfKAgEeF9Z
 4iGlHmJUEfmKLrlttcEOdKR+oeMDAsvyWea0gPrAzZ9jvjlXpmjjWdqAeQuCVdsh97J+
 c1ItrTBp1rr73p5vzAcKU+kK5nRvffpVqdrVPOKOuBM4J3+709aDIQGi8dAPLsrjk3dm
 uCcmgaoVckei4Vfi1bXstewTtFJMeCfUZXR99nFXEWcVti8u3Hsv8l7eigDE7epxzfpk
 rr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WOeyxxAKkjzHIRj51TZXpb1M/mpE0jrboWoJ/yTvk9k=;
 b=Qd7017xHKXRcie38BXYyfG4TlePGRC66OLcIpz881f2q3stMlPNTQWIzcGF1M3j7CO
 RGJrgv+0pdBXiEjfc0EwozpiPIhVc2p8kw3tkrd5iNYg/n7nLO9of4uPEneKHSa/n2l5
 AaaLmrLNfmb/lRRjDJ/TjUMYEZG6XBPcm9F5WGHr2GRpnveKkNaz7iORiRgvDL1TkZJ3
 Kb1zU+h3kQFoCRsEwP5hI6ES3nlY75cj/m/6wf/gql67Hok5KYezF93ckBGSnlQN6OZG
 IBeYzswN+JaLQO95KCmr/ly+e7fjKsKJ8np6TuWO1NuTYpvYE+ABcOJGWDAtPjJkgl8H
 xKVA==
X-Gm-Message-State: AOAM532dTsqQTCikaTXR3iawK66WnMOPsXdDIYD7PbSRVPjont1rVFJL
 YoF3cIlp9EyRDkl3yFE6VpjjtdZW1qrB1fSmxso=
X-Google-Smtp-Source: ABdhPJwYlHlTh0Mdpy6Abdp8A2R8B5BaXdrFkHQhOghu7nuJucS73l3fJ061aZ0ytpqyNuuZVRUPvUFYC4UOz4lkf6E=
X-Received: by 2002:a92:de42:: with SMTP id e2mr38608468ilr.189.1594225463080; 
 Wed, 08 Jul 2020 09:24:23 -0700 (PDT)
MIME-Version: 1.0
From: Junar Wohn <doomsheart@gmail.com>
Date: Thu, 9 Jul 2020 01:24:12 +0900
Message-ID: <CAHcbMh1MPsqkAYYHk9ycq7-Mivyog_BgRJFrVT+UDVohN0bg9A@mail.gmail.com>
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
2.25.1
