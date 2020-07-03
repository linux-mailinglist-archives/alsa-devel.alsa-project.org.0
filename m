Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED492134A5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05FC16CE;
	Fri,  3 Jul 2020 09:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05FC16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593760069;
	bh=guwZ3uTVWKwB76ayS4xqkdxbf3lCvN2ndCZaptvz7x0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lS76avSFzpLxzXYtua70ox37XIxjrmkAIYF8zgLqteGa47wVVCqeeUuzLaf+Tc0O4
	 QgFyKsjBXcYxqNj6IvUQwCtOCQYw4GId+lr+czCSHFhJRyfPpMak4IQdMJgcC+JoXY
	 RFc+/grDnO92oDNWKJDdJfGu9RC+tTGsf1g3BevE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC6C9F800E2;
	Fri,  3 Jul 2020 09:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B11ABF80217; Fri,  3 Jul 2020 09:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1911CF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1911CF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="WK9lutSV"
Received: by mail-pg1-x542.google.com with SMTP id o13so11719395pgf.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tVzWaBcXcAIcSS8sXY9snxZzqYH+2Rl4YL7e8hJOjM=;
 b=WK9lutSV8aohCLhH2O7vvNVP18AgWz88xGPef6Tk1YAI+DQ2HqXCXRy4bqeyBAiReO
 S9SBfaT+E/rsH5+uawtdGO+5wNZwnR8NHv5wpZ+Sz61fmvOGelKdc+SnGEXTn5ZOFskc
 5ynnceAafFB6tto143ZnsyfGU550y+q8VzxbYpMifE2ptXE5b0H0McCc66XbJ4cfFIQc
 U3Xf0MM8mBczuJwupscYlUSaBf5RI3Lv6VgpslVT7Yw635ZTijRx8rAFsEqUeQk1sZbd
 WkKCHGpiyLofO3iBBtn5liXFUyqT6ZAD7ZxIlfDqNYxUJkoJcayn6mrfix/UH4wzfqjz
 7Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tVzWaBcXcAIcSS8sXY9snxZzqYH+2Rl4YL7e8hJOjM=;
 b=b4rdi4io4U+3TI0ouW2a6ojz+Al+J4A6+2GBKSX2wUpx4vAPIxY7+X7CKKWArD9eMO
 CJG7jdFszP8lgSbTmF9kgikciF5H4osTkLHTZqjM/uYNqjcmgKL+ujP52egKOA5T1BnL
 PIlZ6FtAynMyNJ/9zRNNJOemTTx2xo5zyCHvY5STf7ZRMSho6802DoFhMz7HWtVR8nGZ
 abWba26J+sm4HQKDbimKGTFxbTFKyO3PYDqa4k3TJ1OWSJZ6eLNHXzc+uLnbKp+UKo6m
 wqAtLC/C5S9R+J+lgFyDOOPwt7j66NdMdNS3DyZRjEa8nJva4N9Wlnej+4PxIB1XkRmd
 oJZw==
X-Gm-Message-State: AOAM533tVUPRwGyEog3BabPpNG0KupDdCJtS1mO6jJOAk8dzRCYATCVx
 92x9ZSaIedPHOqaIjKhN7lVYGw==
X-Google-Smtp-Source: ABdhPJxGi/BdYlejGmgrE/rcM8LCpXTxUzO9vwzvnCwG+dyaUMn01oiAAfHbABHUSHjkCn8XHOLXjw==
X-Received: by 2002:a05:6a00:4f:: with SMTP id i15mr638018pfk.93.1593759955267; 
 Fri, 03 Jul 2020 00:05:55 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p1sm3529764pja.2.2020.07.03.00.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:05:54 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ALSA: hda/realtek - Enable audio jacks of Acer vCopperbox
 with ALC269VC
Date: Fri,  3 Jul 2020 15:05:11 +0800
Message-Id: <20200703070512.174394-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Chris Chiu <chiu@endlessm.com>, linux-kernel@vger.kernel.org,
 Jian-Hong Pan <jian-hong@endlessm.com>, linux@endlessm.com
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

The Acer desktop vCopperbox with ALC269VC cannot detect the MIC of
headset, the line out and internal speaker until
ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS quirk applied.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 737ef82a75fd..dfb4bca07d3f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6149,6 +6149,7 @@ enum {
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
+	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7327,6 +7328,17 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90100120 }, /* use as internal speaker */
+			{ 0x18, 0x02a111f0 }, /* use as headset mic, without its own jack detect */
+			{ 0x1a, 0x01011020 }, /* use as line out */
+			{ },
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7346,6 +7358,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
+	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
-- 
2.27.0

