Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2658DB20
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 17:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87CDB1E2;
	Tue,  9 Aug 2022 17:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87CDB1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660058974;
	bh=qpjNymdaV5K8kMbMWsB43Wr3eHMwPf3UBa8DYYVoWRk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V28qoToX3zyB9JsX4k/zcg+VqaQVyIHltq9ZixAJAgkQq1loFCWYdZBbV9aoCQiVm
	 6y0cuM3bguDbl7q4xwp/f8rhk0a7uxOLv4UP6UcoX9JvvIKFwGnmaztnxtMzTulG1d
	 XhLL8tfMlkvV3kfVp+SquWS/JiXkOjmuIua+esOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2744F8012A;
	Tue,  9 Aug 2022 17:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49445F8016C; Tue,  9 Aug 2022 16:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21ED8F80132
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 16:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21ED8F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zlr8ViCe"
Received: by mail-pf1-x436.google.com with SMTP id p125so7414218pfp.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=qAB7e1aa5XTYU8Wjij15vVYsEMZh8Pf+4KUmlTy3JTI=;
 b=Zlr8ViCe4vY4wGGKUGuiDHN9kPbp/RZmnoNlZUKj2UOGFGlqaD2PiYwMqFKEIeZhGH
 nHg/wzy+2jP3ZxYUJqxyhoVDUZvi2In01TMA8oXK5XPd9tsHW9A/6EYqjY5pLoWv3EfT
 4n7XjJOqawkYCoS605H9anHUdUBZ0h6yFnTz002ESqaNeGNF9ZcHvttRCdaHEV9WP6XD
 7V4mgijNaUPae8/YDJHC1pxrTnpjVfbrvNuFS0DOEf4SBoqChmrswdJZhV96NjPOiKmv
 u10oWYy0bmgeavT4/u+M3wFC0C73TZ0YjWlKmMyjg9NEY1hc3wrMrBkwBBUL+FWZ8hJc
 ttyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=qAB7e1aa5XTYU8Wjij15vVYsEMZh8Pf+4KUmlTy3JTI=;
 b=KxgTbi+KHq49nzH5SbJE9apeRmFMFRgARhOMrEIha3ZPTn9K7z2X5hc3EPwOrt+IOg
 3fpPIA6h66OCQ7JsshVx4hotDDCz+vUkc28pzyaHPJ7zXNC9+WHWDp3C+7tQp5IT/0OC
 3kaLYt3JUaiI7L6aHz4ydXsv1agYe43AWa5Pqz9Rj2K6urqNPLRLoWpP/Q6/OHcFsd0d
 fzKf3V2o6Pgzjs3Iaqk11I+VcRwDSiZ1x3jdV+WSXADsUP5qtbQ6Y9hxfRjF+iKMrGkJ
 vw5WZE0c/azVWPw353oda0s46Lq/qQI2+73H88uR9MA+MyKPhHSFTjKqvnugFPcJRUii
 v3hw==
X-Gm-Message-State: ACgBeo3QkX1GWFKE7ntnWEhw4hCaBytPKRvn+dWa8w694FCOxjmCm0xE
 mpBrEtFP+NWUPwM5oF1aujSRaKq0AqecYw==
X-Google-Smtp-Source: AA6agR45fggjE8T1r77sN+mWaiFwaVWGyQ48ahBRVpt3NAOG/akHSAfoayv7MWQHRq2uIh0zjJaQUA==
X-Received: by 2002:a17:902:d4d2:b0:16f:8311:54ba with SMTP id
 o18-20020a170902d4d200b0016f831154bamr23171122plg.15.1660055128832; 
 Tue, 09 Aug 2022 07:25:28 -0700 (PDT)
Received: from archlinux.. ([136.233.9.102]) by smtp.gmail.com with ESMTPSA id
 38-20020a630c66000000b00419acadde52sm8097674pgm.46.2022.08.09.07.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:25:28 -0700 (PDT)
From: Bedant <bedant.patnaik@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Add a quirk for HP OMEN 15 (8786) mute LED
Date: Tue,  9 Aug 2022 19:54:55 +0530
Message-Id: <20220809142455.6473-1-bedant.patnaik@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Aug 2022 17:28:33 +0200
Cc: Bedant Patnaik <bedant.patnaik@gmail.com>, alsa-devel@alsa-project.org
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

From: Bedant Patnaik <bedant.patnaik@gmail.com>

Board ID 8786 seems to be another variant of the Omen 15 that needs
ALC285_FIXUP_HP_MUTE_LED for working mute LED.

Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a57636f6..258f4e490 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9203,6 +9203,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8783, "HP ZBook Fury 15 G7 Mobile Workstation",
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
+	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.37.1

