Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9B47F5C9
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Dec 2021 09:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B4C17C6;
	Sun, 26 Dec 2021 09:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B4C17C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640506851;
	bh=tUOANn3EQAo8lysUqOJugFPhHLkAte2PooqQ+AHKZc4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eaQa4C3tIgW4FkwNmD3bqBGn3pH97nzACnr3XD7emANHwUFCG/U0GjUozlejzHTGV
	 XrkZudYD94mv242qrrp9Tr5acolwR+sPsAJB4s6maTvw6G1QYM6VLLvZu8p3qSq2rb
	 DrNfCvfN4s0yVboNlmpEjAKnD2ALLw+3ZSy7LvOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05844F804E6;
	Sun, 26 Dec 2021 09:19:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22541F80105; Fri, 24 Dec 2021 01:02:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5930F800AF
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 01:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5930F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IFJj9qPX"
Received: by mail-pf1-x42e.google.com with SMTP id q3so2142557pfs.7
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 16:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ggQBNMAqAjGTUlvKaJU07V7AfVhAISD5RgiaV8JRGs=;
 b=IFJj9qPXeCuePq4rjbQUsEG50IuDfmVMYkqL4rtyvSh6FVkjwIgKeyszIKstG7SjZ6
 h8tlmaNzqdbK6PmnK/5xy05W5SmfBd8sM1uJKxyVGieuDQ3+Mq6+7xUjm8QoNwP43SNL
 MhW967Grf5VO/Ynyez0BLbcN+ckm7ew/RKve4EvQxHcRpJBJ5jq7BeUWmRfy8AJwBSNK
 MpcTOz/CtPXkD80BGtlg4eSzpsFexwUlc3pn0Q0gDZeBmh+BsZ6W/Sbk92NrabgTkevL
 gBYen/C9I84SBVx8sI2QgCdxmNHnjSRk0Ukr2WceEkQbvdZgsm289f2Q1lK1hZIraxTG
 CORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7ggQBNMAqAjGTUlvKaJU07V7AfVhAISD5RgiaV8JRGs=;
 b=JwDiInNsl16yAaDMUIzcYOg1B0YsbnmMqcvSlA0YV5GklsVyCDx7OFiwf8+tEX4N/A
 Szzs3/e9tnzhUk+tvvq6ArjVsAOrz343f974agDLBFv7hw5N6PjpRS9d17OKDD3iEqC6
 Q9tTsqpR0vbpvVIfTfLTWH6ThKDNwArYDyNWAVYFb1MJK7/ZwKTmOwWHoj93PpTVmWb6
 jp1ZoH4lstVJHfhqk9YsDNFbB5yomXFBlEWvY7AO18PaX2bLHOvkCn68Rn7Ca7KZEoWA
 6Ghu8kiP7QqXFtobWbSV6Q+ukY4zTFFc1HqCZRip0/dqm5bPqbDwgyfX44QBvuKnQo5E
 3qaw==
X-Gm-Message-State: AOAM533JHOBWJjNXLTCuE65P83EaNUSjj0O9qWMhkEEoqE4555fusE4g
 NaKQ9zRqi+Njs53cRNvoSM3NQiLzvCRMNoNiyWo=
X-Google-Smtp-Source: ABdhPJzSg/6HwrjM49XpxA8CErlhLiVOv7c4h/NWi+MwT5eKtODNLmmLjomN/7UBRgHeh1Cqz0fOaw==
X-Received: by 2002:a05:6a00:2391:b0:4a2:cb64:2e01 with SMTP id
 f17-20020a056a00239100b004a2cb642e01mr4460477pfc.45.1640304119102; 
 Thu, 23 Dec 2021 16:01:59 -0800 (PST)
Received: from localhost.localdomain (cpe-104-173-210-7.socal.res.rr.com.
 [104.173.210.7])
 by smtp.gmail.com with ESMTPSA id w19sm6220207pjh.10.2021.12.23.16.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 16:01:58 -0800 (PST)
From: arsgeiger@gmail.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add speaker fixup for some Yoga 15ITL5
 devices
Date: Thu, 23 Dec 2021 15:28:57 -0800
Message-Id: <20211223232857.30741-1-arsgeiger@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Dec 2021 09:19:06 +0100
Cc: Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 open list <linux-kernel@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 Arie Geiger <arsgeiger@gmail.com>
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

From: Arie Geiger <arsgeiger@gmail.com>

This patch adds another possible subsystem ID for the ALC287 used by
the Lenovo Yoga 15ITL5.
It uses the same initalization as the others.
This patch has been tested and works for my device.

Signed-off-by: Arie Geiger <arsgeiger@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3599f4c85ebf..188cbcde6e49 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8901,6 +8901,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
-- 
2.34.1

