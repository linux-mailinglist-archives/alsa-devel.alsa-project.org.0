Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97247248C65
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4527617B9;
	Tue, 18 Aug 2020 19:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4527617B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770304;
	bh=iNl40HLNq8VR95HFrCtpCZUUfUuPC9FB1OTVR5WzRo4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bpwWAOY2bt0BF23xL23oR1Udyd2hJhnkbcWUhCnfmFQ01ckZ1qu6Nzskg5Powk3/7
	 euWaiUVJxsaana/j/2eZzKGRN1tGSx1/migVXm3r4+fguop4fVBO33xd77Y8XDDT1m
	 /c+6Re3KYUrIUjutU5angbQ2Lst02Cd7latAbgjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B9FF8034E;
	Tue, 18 Aug 2020 18:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06017F8034E; Tue, 18 Aug 2020 18:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A657DF80345
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A657DF80345
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J8FgvlSJ"
Received: by mail-pj1-x1041.google.com with SMTP id c10so9610178pjn.1
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eM0E5QyjmY6mhdm7T7L6Scw42Q774kfBG5y8gMakP3A=;
 b=J8FgvlSJpTnKuX73gqKANRbnHFn1NJv40M9yVBff5l4v7HvxtP7npN6hAC+ETOCRXc
 HZtSDQ6HTO5t+z3OW9L62L3dzP2US0v/i7AeXHZdFqkfFwTpm6OdR3sMe2qTGiMKj4L4
 1RMLaleS+QuETFH88cXc3tJljZyH9SuRRztmVmAjDXxwMlTFJqFbTUaHoonYPcOOULYI
 JEaNK8gGJkY1p2ttUWfr8q72KJhlqgvN170C2vJ2DWUiRpQupZfJo0kNaZXRC/tLaC0d
 PEhF37oiMiyxjqj1+GNsSuHizqmCGYQAUXFol6U7P6rIU/bNlDVlhtRQZZNiDcCNuc3Y
 yo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eM0E5QyjmY6mhdm7T7L6Scw42Q774kfBG5y8gMakP3A=;
 b=X+Yi60P37FF0WRndlx3eHoBC9JD7x/QXsIYlDZNxEALi9oC14CeFY20Pb0doNwZS+J
 J5TMRQ4xqq6Cvu+ieqaFoYXNzGLlF5QIS0FK9X36R4fOyKnEwPleksTso3NuVuTTQRxk
 TVx12iZCrw/vjJ9lweDXBL6AjomhGZp5bJD8DDmv/lLqgtTj1qVSziobhbWCWgUQvwc3
 Vm6WVzbiGHye2V2rfvjIIhX4Qq0qER/vJeZVKTOEIGSy1JZV5PzzER79/l/vZ6GE2RnY
 Tuoa0kAj8krKXqmlQh6BCIFCSPPVFDFdisg/vcFuMyE8ARI64Ta3d9U19Z980mZWTe2k
 XcQQ==
X-Gm-Message-State: AOAM532okrEp7XBQDQ0Ig6GFcIQ/bVTFKBQGVfy4BJukPv3ITzRwNIDu
 bQKlF2rMUbfWEwi7EZ6gs8w=
X-Google-Smtp-Source: ABdhPJyGM9JIR4A46+mF5AcWltJMuj4HOIgEui/97UFWc6QuKFQN0whsClLPvqe7KPq03Ztv/oT3qA==
X-Received: by 2002:a17:902:c203:: with SMTP id
 3mr16260039pll.121.1597769728372; 
 Tue, 18 Aug 2020 09:55:28 -0700 (PDT)
Received: from localhost.localdomain
 (68-123-15-75.lightspeed.sntcca.sbcglobal.net. [68.123.15.75])
 by smtp.googlemail.com with ESMTPSA id m4sm24660484pfh.129.2020.08.18.09.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:55:27 -0700 (PDT)
From: Mike Pozulp <pozulp.kernel@gmail.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
Date: Tue, 18 Aug 2020 09:54:44 -0700
Message-Id: <20200818165446.499821-1-pozulp.kernel@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Mike Pozulp <pozulp.kernel@gmail.com>, Chris Chiu <chiu@endlessm.com>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 open list <linux-kernel@vger.kernel.org>
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

The Galaxy Book Ion uses the same ALC298 codec as other Samsung laptops
which have the no headphone sound bug, like my Samsung Notebook. The
Galaxy Book owner confirmed that this patch fixes the bug.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207423
Signed-off-by: Mike Pozulp <pozulp.kernel@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 29f5878f0c50..72aa3da479c9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7612,6 +7612,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-- 
2.28.0

