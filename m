Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C334A2E44
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 12:35:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A3D175B;
	Sat, 29 Jan 2022 12:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A3D175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643456101;
	bh=RSwC69Vp4UrLOvPAtkYbYdjM1cGuzcEz/Klvy4l3sJg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAlo+MhwV/Ie7ZgUQV1S6HJwz+kBIwi/In3VB73pmpq2dvTzZtK8yCnTePP9g6oNt
	 cruc72E49fVn9PNqG45wI9O984TUo5wk5AqmyAuNuqiXl17fAp2Nr+poYJRAFypWcA
	 IYoAg83OEQOt2+NthSWiw/u1oY//qlA6h5hesuYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 772EFF8050F;
	Sat, 29 Jan 2022 12:33:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A53F8024C; Sat, 29 Jan 2022 12:33:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D9A7F8024C
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D9A7F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zi8eoe7g"
Received: by mail-ed1-x530.google.com with SMTP id u18so15594603edt.6
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNNDRp1DwqScqAKKfKlwRaoAS6b293HuHJmyYnE9wS8=;
 b=Zi8eoe7gWXACuUnDq5t0aWFzMJGG4durC3+Muthlr1md1mipaKJpB5q05nI5KKSpap
 P8iZm0jVx2+xK5IJXfmR5J6isPNA/Yv8nSKeWpCN0nlatcSJFk7QAekzdMYqFPXYY69d
 2xMPRRJ58KunDFjAnjn8xprIKwaBQf+5qHq6thXwLOqcDkn11HSmOrUiaHaYVcjPVtvm
 AH4bCx/hfq/8auaG40sjTIc1bgd4CIP8ZN31sgiBb/R86mi4YpktODHw1ir1tDUnEOBd
 xugN3WOAVzI6wJle7otsVeBeqy1d6pJz0B0OHAfWpKPiMukwxuU397W+Rb2W5s+yEMMr
 Wb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNNDRp1DwqScqAKKfKlwRaoAS6b293HuHJmyYnE9wS8=;
 b=QCngue8EFfAigXxrKVViN/BeebLHGKq3MzLGzjVw7cbuB+PSqDSRzMY0DjB6X1Hc8I
 7OOSZ0oBrTOhgH7o4jsiZEKQgW8zyfLcg4dO5Yw6jU1oIPzGzJeEkXk33XlHaYV+JXyo
 9znh+8DbEOtMH5dMIfBjuQn8Mj3xJ7RC3DSB+mUT9fCJGAzxKlWQEunfjhZ+u3gMFXsd
 h02Rb4bskxiM48V3JgWcua6yUqt9hpfRC4zelkltFF7VCOTbb/XFKOb0smCvOiDVA/DQ
 zVe25hcZsf6Dqn5mx/VSDO7/YKI7K/jq8HrAbgwE16SqytRGswDdYHPjafu69SnRR8Xl
 xKGA==
X-Gm-Message-State: AOAM5332+VHoHtPH5w9hroDDhfY8oFt2Bymz6RVH5d+dz87hP7pTO+c4
 hxly+3jF5D6oiUjwF+bENxU=
X-Google-Smtp-Source: ABdhPJzcGNGWAcIyzhGn3nbQK2CtmvxSCcdePO+OD9d6F0cJ+39tKSEi8scnnzCon2J/8kOxyRkixA==
X-Received: by 2002:a05:6402:1705:: with SMTP id
 y5mr12271070edu.200.1643455993377; 
 Sat, 29 Jan 2022 03:33:13 -0800 (PST)
Received: from cosmos.lan (178.113.77.92.wireless.dyn.drei.com.
 [178.113.77.92])
 by smtp.gmail.com with ESMTPSA id g6sm8885062ejz.170.2022.01.29.03.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 03:33:13 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 3/3] hda/realtek: Fix silent output on Gigabyte X570 Aorus
 Xtreme after reboot from Windows
Date: Sat, 29 Jan 2022 12:32:43 +0100
Message-Id: <20220129113243.93068-4-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220129113243.93068-1-gladiac@gmail.com>
References: <20220129113243.93068-1-gladiac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
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

This commit switches the Gigabyte X570 Aorus Xtreme from using the
ALC1220_FIXUP_CLEVO_P950 to the ALC1220_FIXUP_GB_X570 quirk. This fixes
the no-audio after reboot from windows problem.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205275
Signed-off-by: Christian Lachner <gladiac@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ca8475c24187..a2e36bf0f25e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2552,7 +2552,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H", ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
-	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
-- 
2.34.1

