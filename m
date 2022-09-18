Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FBA5BC47B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 10:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48C81640;
	Mon, 19 Sep 2022 10:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48C81640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663576881;
	bh=q7pJqhJaHdxu1JMiZQjqbP64Iu+NchKYpNeUZ0o62PM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LhIEgAlAXEAHJaK0JiTkGNszuw00UGkyLQ8SGXfQhXNcmKr4ZfwPi7XRvTZlOUmsL
	 vXCj6zYTB7YWdH+44Y5V3iAxbNPDsWv6jv+Ew7yEXsbf9+NtF9R2P3xYZJKd05QfM1
	 av6NcTHsDr1BB4jORQHnIpRumAbdFPO64n2VnKNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E67B0F80134;
	Mon, 19 Sep 2022 10:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCCF5F804B3; Sun, 18 Sep 2022 19:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFA9EF80134
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 19:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFA9EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PXZoODrW"
Received: by mail-wr1-x42d.google.com with SMTP id n12so3332765wrx.9
 for <alsa-devel@alsa-project.org>; Sun, 18 Sep 2022 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=bdLlsx0qQ1Tq/c9TtyrU7bglWcYLVdx93s3ZyR2mNek=;
 b=PXZoODrWWaLFGLzul2SpL4FoFQqldoksZAr/vJFof7HuQIzgKUUdKLt99iNtorWfEK
 Hot+zzxZPWavt2jfR9wWwB3A+mVPaySmXMqY/Q9xn9Sn3O0CJLdE92g9i7IMn7i9Jauf
 C9PZZrEIqgXVDJ4+GbfmuH9874zUOaFZQ8+H0NHej23K3vgnbZ2llbLRrMosg677whCI
 Mre3kwK/1/vc32psbeXusEIvHtWNyPq/oFZgKsLB+2qO/tHeb1yhMc1BP0etCi8GO7MG
 ZjbiXlvKilhCjfL4CAcwgt7zXA4LgpjK1YK/MIIEGbxmiqV8p9YsQjXa3YB3SSpSCaj0
 D2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=bdLlsx0qQ1Tq/c9TtyrU7bglWcYLVdx93s3ZyR2mNek=;
 b=WHSczv8wTlXcQEHxeK8AKrlGnci8Vq4EcsqpTIPL00TYQvaY4ZPNKJHqLinR/uf3i4
 +O+HZn7A1Y2aaEmqbCiMoiRjTlxwIoKXqIz3AZwFgSMDwwSThGUbO00tx+oh2/RkZG69
 zOqhufH37kJ6d2RqokBfx0HUUpYiMdGfJ/Or9WqXakkA38TSuHQ+LpOl1V4smSsyQ4/j
 2pwGw7d/fqcRqFKGsYwEmv9De+M2dcFEyAq0Bx02/kOXlP8/MQIDcpiXtu95KDzLtDop
 CRfRTwbCqs5j8KIo2MjiQOwqqLGGdZ0Al/H3jMj1j1QRx9jVNQPbDdZY0odvjKzEvqQY
 UD6A==
X-Gm-Message-State: ACrzQf3AYWu8KvK9mdotvsJ1arzcAWE0WC50zfyDcK4Cf+cF+/WISn5q
 AKmJMJ0HvNKkmsqa5ORx32I=
X-Google-Smtp-Source: AMsMyM5eysqyw2DfBkBD8jpTovlJciF+4EwS3auvmkvId45xusVDC7Ymd+wMpux8I+UcVs9GNo4T6w==
X-Received: by 2002:a05:6000:552:b0:228:6296:3b33 with SMTP id
 b18-20020a056000055200b0022862963b33mr8945415wrf.615.1663521195986; 
 Sun, 18 Sep 2022 10:13:15 -0700 (PDT)
Received: from daptop.. (host86-156-148-202.range86-156.btcentralplus.com.
 [86.156.148.202]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b003b340f00f10sm10375728wmq.31.2022.09.18.10.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 10:13:14 -0700 (PDT)
From: Daniel Houldsworth <dhould3@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Add a quirk for HP OMEN 16 (8902) mute LED
Date: Sun, 18 Sep 2022 18:13:00 +0100
Message-Id: <20220918171300.24693-1-dhould3@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Sep 2022 10:39:37 +0200
Cc: dhould3@gmail.com, alsa-devel@alsa-project.org,
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

Similair to the HP OMEN 15, the HP OMEN 16 also needs
ALC285_FIXUP_HP_MUTE_LED for the mute LED to work.

Signed-off-by: Daniel Houldsworth <dhould3@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 38930cf5a..c7d07d6df 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9265,6 +9265,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.37.3

