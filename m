Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA2252967
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 10:43:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A786C1714;
	Wed, 26 Aug 2020 10:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A786C1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598431387;
	bh=XYPp4rWPSOWRmWtfeewy/QAt7FTlH4Mu1Ngkz09GZWg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AX7IKh2Xp1Mxq9KHqVjN5HV7bDq9IzOpH5KScgGxdIg/ufUWJpSt9LlRAyIp7kjE3
	 /2cWVivQ4COf/Tb6zXTFD6uOToQdwkfHb5GJfW30zfPEwGgwJngpEgZY6cKPAWZC8f
	 srfdCHGqM+NmpjA0bqQxIm9VzU1EDKXDtAjYelCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0402F801EC;
	Wed, 26 Aug 2020 10:41:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E1EF801D9; Wed, 26 Aug 2020 10:41:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33205F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 10:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33205F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PQq/z3XL"
Received: by mail-pl1-x642.google.com with SMTP id h2so563171plr.0
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSB2W5Pv/3jJUL2eOsemL7QFgNmO3p3U0SiP4IFkLZM=;
 b=PQq/z3XLXfqrcYlzOat94mH5VVN2P4F5ppN9gEsqYf03TAqcgj7Wji62URYcH5PZsG
 Awy4gf2qQvrbT0pYqG9c83OyG7RGlC8GWsgoUQHpfdJFMPNrnamAI2UtyNCeJ0Xmp1Jp
 MJBZZMG29YN2xcOARSHGvkzJdbbPbV6IVu7w4PDy2K9+rDZ761OmMTH0F6u5JVIg0CUO
 gRq8WSvFU68AjQdWdasGMfRJ7SMJl0rlYPpRL6J59J6nDopXQ+RXzOQR3fNHQL6+Tyfb
 mwkhFXtOP8+zE6W9+TLBIrLzfR14ftavvEv9LB4W1h+7UTJqqtwm3cSVu+Tn9GRbRJbm
 V1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSB2W5Pv/3jJUL2eOsemL7QFgNmO3p3U0SiP4IFkLZM=;
 b=uK+yhaFDC/OkwZw58hhugM8qZysBt/tQS+JqZQlTRPb3kz8JX5rPOh7tcauPzwR2g+
 mjhf9fsBm5rAer4PxlSBwVKclPp71OBgWYsuDfBiUfqr7vEg0obaSzGTFGdPonhfXLNL
 ysFxxPSnqHhjqe3kpyYTVRdhAyl5K35Uh/igUVFxXnPw1nUeUUVrc61XA9T+pFl/oqDZ
 wWXJn6/yapINkS3teVm6/Y2BfQiOgIVn6qNxdxL/TY0eQaR6jeVenbIisIZdI9WbOIQl
 oSQhMM4wKjRg0GvqyE09R106i8Bzg5qZWlPKQ+dAmjebo6pfep2n0ZvUCADpSCH0MYxr
 kADw==
X-Gm-Message-State: AOAM530GOH0oNY2nTdyPaBFvtKOwca6VhYIDP7JMnvn8df7RsVohq5sA
 7qvlmdgOCf4cjCUB3ACIXO0=
X-Google-Smtp-Source: ABdhPJy9APVzxgOYOZiHI0TdEJ/seh1vsiahqNDOJJu/WZXmE5WovhWYnhQHA5qolszt/3+VG4nxPg==
X-Received: by 2002:a17:90b:1984:: with SMTP id
 mv4mr5165533pjb.32.1598431278282; 
 Wed, 26 Aug 2020 01:41:18 -0700 (PDT)
Received: from localhost.localdomain ([112.214.139.41])
 by smtp.googlemail.com with ESMTPSA id e12sm1462284pjl.9.2020.08.26.01.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:41:17 -0700 (PDT)
From: Adrien Crivelli <adrien.crivelli@gmail.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
 NT950XCJ-X716A
Date: Wed, 26 Aug 2020 17:40:14 +0900
Message-Id: <20200826084014.211217-1-adrien.crivelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Adrien Crivelli <adrien.crivelli@gmail.com>
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

The Galaxy Book Ion NT950XCJ-X716A (15 inches) uses the same ALC298
codec as other Samsung laptops which have the no headphone sound bug. I
confirmed on my own hardware that this fixes the bug.

This also correct the model name for the 13 inches version. It was
incorrectly referenced as NT950XCJ-X716A in commit e17f02d05. But it
should have been NP930XCJ-K01US.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207423
Signed-off-by: Adrien Crivelli <adrien.crivelli@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a1fa983d2..98789691a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7695,7 +7695,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
-	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-- 
2.25.1

