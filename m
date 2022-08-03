Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A099C5897D0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 08:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E33A51F2;
	Thu,  4 Aug 2022 08:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E33A51F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659595050;
	bh=4zCAM/rQ7Mms3TIj2Wh5PNKxNzXcBaLg1ahjtAAqKBo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gCRw/NmLya2iJbA/HvZVKWMNW3bv5J2za5Ff1aQzL9CBJzy3HTrjiZJ7mTWECiKBq
	 Y7Fl4MwDVUyDRyFVzAmD+gVeseQEVTGlGPT8JXsIytSGhwpPc5KMJhdpTOabjqF0IQ
	 uwZI8HcHkAnVJyQIzORIjove1Wg8iLXldODbsAkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68C06F80212;
	Thu,  4 Aug 2022 08:36:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D262F8016A; Wed,  3 Aug 2022 18:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 491A1F80083
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 18:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 491A1F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Uom8+hi1"
Received: by mail-ej1-x635.google.com with SMTP id a7so19493583ejp.2
 for <alsa-devel@alsa-project.org>; Wed, 03 Aug 2022 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEbeV4OUpZWR/RMps+1B9ugXkfGh+UmPMJhS6NYk2ds=;
 b=Uom8+hi1qOe6jYYwuRozgSx+/4RerfyNdpMqKLynKe7W6Pg3e0BkhAJDHPEqnoaH1M
 Om6A6yZ+45SMFX96Nnzfqnrx7ocnw1W1aPn41gwlBxcJ9D5z+r8vDXhTbCGLdipJ5cnI
 7Wm+6A6tDdmzpymtAkAthgcofIHMRr2lWj7cl6VBRWn3LxBtGWqeYFJiii/I01+gPKZL
 OpfLznoud6Ag8kA2N/Jr8WKUANbTCqIqWjnFwfdrg+MAwITUBBGgrUXnG4/gKjrchrhI
 +0t+1b9Xxq3DLPkOpXbxXwPCQPvfdMVtXzJc2obzfc9xWHf2Asg2Vjr4CpYgQycWGOb7
 arzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEbeV4OUpZWR/RMps+1B9ugXkfGh+UmPMJhS6NYk2ds=;
 b=nq1/yg9HBGk5nu2YNh5E0YEkf5LQt7YMrDtF3LVo4zwa6JEf2Erycz/feP1jBFDNtg
 rtTxx/RAnqziEMApMQrQMcVSflCLdYKSMjnj4OXprhnmZ5jcD8NLfKjxtWw8DP9o2J3L
 RANg6hIoRZnHnIgNXLxq/r97XXIGyLh+8ZRao2oS3c73lHYRXuXy3euPfy/PCEs/Gq5l
 S5BQzAtY7gCgecZ8py95UwUX7UndZldIl9s1VSPMWpQvK2g2LC/D+pEEDN3llT2TN+9U
 H3M23Fc1xjCd5MM1k8A38pacfEAUAMWEs9r4lznwofFQEPdBRDWdoMohynFDAmO2mvvW
 yNlA==
X-Gm-Message-State: AJIora9L//SXyRYBlttGgqyJDasJJ0DXodK+/0pBnbq1fn2plsaEpxAi
 cXeE5k6B1dv1DJn1oYLBLsQ=
X-Google-Smtp-Source: AGRyM1tIanl7ZiGLSMnNLyLyjbGXKMujp6YV8c9FQtgIXaxCoMiYdQ8GUxeLX0rVHZAoX+O3H8jnIQ==
X-Received: by 2002:a17:907:9493:b0:72f:40ca:fe79 with SMTP id
 dm19-20020a170907949300b0072f40cafe79mr20805812ejc.511.1659544634816; 
 Wed, 03 Aug 2022 09:37:14 -0700 (PDT)
Received: from x360.fritz.box ([2001:9e8:a511:4e00:667:64a6:5f64:1055])
 by smtp.gmail.com with ESMTPSA id
 s10-20020aa7c54a000000b0043d1eff72b3sm8361027edr.74.2022.08.03.09.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 09:37:14 -0700 (PDT)
From: Ivan Hasenkampf <ivan.hasenkampf@gmail.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
Date: Wed,  3 Aug 2022 18:37:11 +0200
Message-Id: <20220803163711.290011-1-ivan.hasenkampf@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Aug 2022 08:36:27 +0200
Cc: Ivan Hasenkampf <ivan.hasenkampf@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Fixes speaker output on HP Spectre x360 15-eb0xxx

Signed-off-by: Ivan Hasenkampf <ivan.hasenkampf@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2f55bc43bfa9..fe43e5807b8c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9072,6 +9072,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8805, "HP ProBook 650 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.37.0

