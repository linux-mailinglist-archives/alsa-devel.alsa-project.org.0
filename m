Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528315B81FF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 09:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8100181A;
	Wed, 14 Sep 2022 09:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8100181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663140317;
	bh=olZORHiqFmlKWL2+c+34lisE/oTF+pi72WhsTWhPxwo=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k9sNlHRaCRC6CPFBnxi4zoe3MUqFEopX8FrwBbk57MPKlzh4V+Zd8tLeYj+FxbX6E
	 FPlfKs8Z+gJ6UXO3KFWLY1w0EZrTjcEQQTrgRZ+S4naeuoylwwD0qh5+rzHn7kv/AA
	 /kkoqmfPr3KaDbOP1E+nu+uyAoEWTmKKlhhnfpLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDEEEF80507;
	Wed, 14 Sep 2022 09:23:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE02F8014E; Wed, 14 Sep 2022 08:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81829F800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 08:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81829F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pjQX5AGJ"
Received: by mail-pl1-x631.google.com with SMTP id b21so14162278plz.7
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:date:from
 :from:to:cc:subject:date;
 bh=pDMKKBmqy8I/eq03HKdLFKIxcA2eLwe/NtslwAB4KeA=;
 b=pjQX5AGJFygN9y2ncRnfn0Yv2cRYPi7e04xy5oYObDoGOUEBGlfOnXlVPIAqcyBFd7
 qcseiB6NEdvbzie+o2rBNdzoA4ni9QQWjqqQDBBhs0J6N5FlxXVw2croCNhAe4YC+1l7
 FpmXUZIh4NxDk5hZxddkTSKV2/6FHUi51uNArDei9OqgWPSEZ70666CD35jg2Up8tuFF
 s2pAiIGdqq9o/YHEE4hmj8wwGqnR/Gn6RGPLS/7jdwbmnTih9is2j6440QOVsBAIS7tq
 p59KjTL6IKBY/Jf0LEX+QqkzMotP4af3rriXfXfehTgcf+py0clLAkAdfqvm+ayCkenk
 nmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:to:date:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pDMKKBmqy8I/eq03HKdLFKIxcA2eLwe/NtslwAB4KeA=;
 b=KMDUZDkRyhM4VgJlL/xDkg+nZW4Q5RtOGKuYjc3jeybgxuq6boWUdn9ywmOB+HgpVo
 ByotApzWtAAulTYgGO9AO1KzQP04lN1rfjyQIqK252kItVji57fU64V479/JDUd0zGVP
 s0kvtyECByDaM+B+eZK3tjdQBq21Tz0CsAsMxO3FRjmpNSbQpH5DRS18qTidmM+VfA23
 E6mW/aLg5U/3AAw1WD1IowGpu/70k5sxAOi00tTH4wawLF+yuQDrgdrlzEFryfo2y0tZ
 JhUFMn58WAXa1ObS7vOZ0H+EJlng2v061j/fERgh2wgtCAWlWjglKmIf2HzSopli5mbJ
 o1Cg==
X-Gm-Message-State: ACrzQf1mPl5FBCkhTtomHeqeHWOmjaFZ8UW0y/tovMkPAkKfVlYbU+7t
 /h7iSuLFqx3fd70OfUkd+iKcq77pQEXjDQ==
X-Google-Smtp-Source: AMsMyM7idOtVN5R4gyJ8Uakhg7OmD88F6/QPwkxqZwGbAxGvBDzL0FNCxGsRdLmOKVsG5YFQqsGTbw==
X-Received: by 2002:a17:90b:3510:b0:202:f18c:fdb6 with SMTP id
 ls16-20020a17090b351000b00202f18cfdb6mr3170349pjb.122.1663137664998; 
 Tue, 13 Sep 2022 23:41:04 -0700 (PDT)
Received: from wolf (202-65-89-82.ip4.superloop.com. [202.65.89.82])
 by smtp.gmail.com with ESMTPSA id
 y75-20020a62644e000000b005365aee486bsm9104265pfb.192.2022.09.13.23.41.03
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 23:41:04 -0700 (PDT)
From: acheronfail <callum.osmotherly@gmail.com>
X-Google-Original-From: acheronfail <acheronfail@gmail.com>
Date: Wed, 14 Sep 2022 16:11:01 +0930
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Enable 4-speaker output Dell Precision
 5560 laptop
Message-ID: <YyF3feC4rwY+IvB8@wolf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 14 Sep 2022 09:23:48 +0200
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

This is my first patch, so let me know if I need to do anything
differently. :)

The Dell Precision 5570 uses the same 4-speakers-on-ALC289 just like the
previous Precision 5560. I replicated that patch onto this one, and can
confirm that the audio is much better (the woofers are now working);
I've tested it on my Dell Precision 5570.

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 799f6bf266dd..b0ad4856b877 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9130,6 +9130,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.37.3

