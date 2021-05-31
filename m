Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02827396DB9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 09:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C86816B6;
	Tue,  1 Jun 2021 09:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C86816B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622531073;
	bh=T/yAJVUDd9JXhtDxDrAYI8x79HNSiSccjSzFHEQWcVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DUCBuzHKP//eeq7gfb0QByyfnikD60CZFbkIHRFpH5NUsNM+5G5mCO9uS0iBn5R3O
	 2I5SfSTEYXAJREEfByNNe4eLgj+bOC8JFoEEBfvN7fa8ay5/z6jmRULcBfUaEbBQHj
	 /y+mspf0rDK1PrtgJCjxZ1FVsY5nsPwOi7ZGIWfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD0FF804C1;
	Tue,  1 Jun 2021 09:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 033EDF802E2; Mon, 31 May 2021 22:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18AF1F80253
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 22:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18AF1F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T1hW9br+"
Received: by mail-wr1-x431.google.com with SMTP id g17so11919761wrs.13
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvSNi7GWP++Uf+d4WBnjHxk+zc2WB4sn27uaABnmu1Q=;
 b=T1hW9br+NVjR3JEXvCNmkV0zTOF4v7k6RQ+DFjLzLAc+u1YI0rFR7FI/QQrpZD1TJJ
 r3mdfyNmOxsv8MWKK353KcBLE975+agi0LRXzKU0b9C9X/u5jCnRVkEm3ZSMzPlnLT0w
 I88dgc57cRCtn7EPa351timB6mt0wWEE4ur1KwVjlRAliS67PqmyxR5Hn3RIXbnpOHH9
 9DI3eBrDiaIqyALGkyO1tzU/MiT2+/EIroiUHr8Rb8VtGDoyLvnS5xAYSywtWADc3K7i
 AOiO+cABKW8cwXtrseUrAzb8xUQThNdgL6ZBeGQ6si1g2hIBR0E3pJg/6f7KKYCrzLsU
 eIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvSNi7GWP++Uf+d4WBnjHxk+zc2WB4sn27uaABnmu1Q=;
 b=DJEjh0rCqBYtbhYnU8mO96aMxlPozw+JtLRzt6JVsHSCy0HIeOZ7zdze8o82+lCiRV
 byx/OlEavco8U88IKs4Ou5YvN5RQFWTN1EkLE8BNNvoX13wy7nwyyMPwRx0pVtKBAzyh
 XaMwoB8sZv5SKzNNIEf73N/Bz0/9aY1ihBYjsLOVw/p2MfUx52aa7Ac1d0TDjLhynyCK
 UKkPs0Cl12bzxpbcjly1tDeBGXHS9N96ZQZmBZz0uLnYxhzxFP2ZYKL2CTmMkfnkX+Md
 R7mJpM5kQ7XlANvJpLIHxgOtl99aET7eR5tdF4YD8IXkUDygJ3eiL6yc/YuRHaP6w12l
 5OVQ==
X-Gm-Message-State: AOAM532R2fdv1ajcdOKTLjm/IXW+F+hQmYJgfgty2+N64FvajJAkQb/L
 z9jaqzKca1NF5tL89aQu2cw=
X-Google-Smtp-Source: ABdhPJzIIy6XqQPefOP66e4UUQg3ZjANzkwH1c+QZONQaL4AwdIfsmkIiTZ6qE3BWehlYGbtLZJ+Rg==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr21717439wri.113.1622492441201; 
 Mon, 31 May 2021 13:20:41 -0700 (PDT)
Received: from localhost.localdomain (81.202.154.5.dyn.user.ono.com.
 [81.202.154.5])
 by smtp.gmail.com with ESMTPSA id v15sm407100wmj.39.2021.05.31.13.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 13:20:40 -0700 (PDT)
From: Carlos M <carlos.marr.pz@gmail.com>
To: 
Subject: [PATCH] ALSA: hda: Fix for mute key LED for HP Pavilion 15-CK0xx
Date: Mon, 31 May 2021 22:20:26 +0200
Message-Id: <20210531202026.35427-1-carlos.marr.pz@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Jun 2021 09:01:32 +0200
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Carlos M <carlos.marr.pz@gmail.com>, tiwai@suse.com
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

For the HP Pavilion 15-CK0xx, with audio subsystem ID 0x103c:0x841c,
adding a line in patch_realtek.c to apply the ALC269_FIXUP_HP_MUTE_LED_MIC3
fix activates the mute key LED.

Signed-off-by: Carlos M <carlos.marr.pz@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 61a60c420..43e37145e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8303,6 +8303,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x82bf, "HP G3 mini", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x82c0, "HP G3 mini premium", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
-- 
2.31.1

