Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E020952A71
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 10:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24A192BC9;
	Thu, 15 Aug 2024 10:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24A192BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723710507;
	bh=7+jVABBsNbizGOQnYnTrHTlhtmzfjykh6P6vndW5SQs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QEWaqdsG1Yu/+vC772jJ6DUlShjENlsBot9mIWvlp7PvJtTlEl1//zHzDZNR8vt1o
	 AcDcv2QHz3fWzutfBwyLmpf/WyuYfbEle/aYy356+JJwznMY1XlSejl94V23Ia23Rt
	 UKJ+4BHB4jbPD4DRltBuPbUzqjPhDFqTZiDfm/Pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACC1EF80CB1; Thu, 15 Aug 2024 10:24:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DE1BF80C92;
	Thu, 15 Aug 2024 10:24:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB2EF80423; Mon, 12 Aug 2024 06:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E406F800B0
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 06:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E406F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JM0omXXb
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-710bdddb95cso2194214b3a.3
        for <alsa-devel@alsa-project.org>;
 Sun, 11 Aug 2024 21:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723438447; x=1724043247;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySHO6O2H5qje2VBKy2Synv/wXJFARS3WfeCV+1C16pQ=;
        b=JM0omXXbuvFSwa1eZdPD5XQTu7oGgl8oL6c8bT1H9nNNWC1BAduVV2f+X0t20LFwv3
         wDyAMaX7iUMOgEft9HXFOLbfcrvl+V2rq+K3gn3YEYVQ7u/rtj+WRcFa6BhQI4mKC2r1
         B6MgQV1HiZtjBclV0+j10ZSoEqSH5R8CzUxOR1RWuBpGKw/jJA8/eb8OQ1ZMWPYLJO5i
         Br8YE1BzvQdf0j6CE7phiUb6e9POjkj2W81XeHl3MleSDEdIyPR16Ghi9Y0HClwa+ZwG
         DMb1mPFXZodO4EfxcqRZU7gJh/55GRx2UUoe515hXr8wb3sBzZrzhzK/aNTd1UWFyaT6
         v4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438447; x=1724043247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySHO6O2H5qje2VBKy2Synv/wXJFARS3WfeCV+1C16pQ=;
        b=oyBYj4RntMlVVoPVlop84v0K6HAiylcstACzcc5+efT6W4OZMvSBci7ZCQEP9W5/Wk
         VBktporFR59SFQqrkGnGIxJhHOJFsPFMzYjEk+zJv/7UwKvljL4uXsqhwiebWc93t7we
         kTK4V9MtbYApyVcqWj4XSjZ5cNKB2ji9Wc83V3VFp3MQn7h71VU2bJ0aAmElDjcYO5VC
         bLsfPt+/XNuWa+1GJZkwWiWteiIfae6/a+Ue9alnpEn54hOfkTeUxNk43JbolcAY19IV
         mMOpgIfdvS3mjoEN+LCwcjDfR/Zjnpnu+d0meadyBFiPAMWbjXAoRF5WY3WQF7J1PNSQ
         4VxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2rO9/KzNMYRlL2wtzU+VVttmMa3mvKw2jDdjMlvIKU2s3peqs5WnG9z3DDr2twttvGUERHl81gFCKi23xnmYteX1SsbKwWh+fRL8=
X-Gm-Message-State: AOJu0Yy1uYWiImZWNVN/Vi2vUCWowMpNWVTxWEgXKLw4rnEyV1XRx93E
	Kz6pxm8MYfThlol0C+aZnV9MfVmOE04fRHHUdAS2SdomYu9uXdtn
X-Google-Smtp-Source: 
 AGHT+IEIkhd5ULm8pjy0oWMQmysodM2aF4d/rg/YAnViabCyPKOCQwwX1ciUj9E5aL49vpuif3TNlA==
X-Received: by 2002:a05:6a00:21c9:b0:706:6bf8:bd2 with SMTP id
 d2e1a72fcca58-710dc899ea3mr7338886b3a.21.1723438446505;
        Sun, 11 Aug 2024 21:54:06 -0700 (PDT)
Received: from nobara-Desktop-pc.. (syn-076-167-168-058.res.spectrum.com.
 [76.167.168.58])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5873b06sm3227939b3a.10.2024.08.11.21.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:54:06 -0700 (PDT)
From: Jonathan LoBue <jlobue10@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: shenghao-ding@ti.com,
	kailang@realtek.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	derekjohn.clark@gmail.com,
	luke@ljones.dev,
	benato.denis96@gmail.com,
	Jonathan LoBue <jlobue10@gmail.com>,
	Kyle Gospodnetich <me@kylegospodneti.ch>,
	Jan Drogehoff <sentrycraft123@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Richard Alvarez <alvarez.richard@gmail.com>,
	Miles Montierth <cyber_dopamine@intheblackmedia.com>
Subject: [PATCH] ALSA: hda/realtek: tas2781: Fix ROG ALLY X audio
Date: Sun, 11 Aug 2024 21:53:25 -0700
Message-ID: <20240812045325.47736-1-jlobue10@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: jlobue10@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MJ74FJ65CAYMMVASUOBBFAUFOG5CFYP4
X-Message-ID-Hash: MJ74FJ65CAYMMVASUOBBFAUFOG5CFYP4
X-Mailman-Approved-At: Thu, 15 Aug 2024 08:24:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJ74FJ65CAYMMVASUOBBFAUFOG5CFYP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch enables the TI TAS2781 amplifier SoC for the ASUS ROG ALLY X.
This is a design change from the original ASUS ROG ALLY, creating the need
for this patch. All other Realtek Codec settings seem to be re-used from
the original ROG ALLY design (on the ROG ALLY X). This patch maintains the
previous settings for the Realtek codec portion, but enables the I2C
binding for the TI TAS2781 amplifier (instead of the Cirrus CS35L41 amp
used on the original ASUS ROG ALLY).

One other requirement must be met for audio to work on the ASUS ROG ALLY X.
A proper firmware file in the correct location with a proper symlink. We
had reached out to TI engineers and confirmed that the firmware found in
the Windows' driver package has a GPL license. Bazzite Github is hosting
this firmware file for now until proper linux-firmware upstreaming can
occur. https://github.com/ublue-os/bazzite

This firmware file should be placed in
/usr/lib/firmware/ti/tas2781/TAS2XXX1EB3.bin with a symlink to it from
/usr/lib/firmware/TAS2XXX1EB3.bin

Co-developed by: Kyle Gospodnetich <me@kylegospodneti.ch>
Signed-off-by: Kyle Gospodnetich <me@kylegospodneti.ch>
Co-developed by: Jan Drogehoff <sentrycraft123@gmail.com>
Signed-off-by: Jan Drogehoff <sentrycraft123@gmail.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
Tested-by: Richard Alvarez <alvarez.richard@gmail.com>
Tested-by: Miles Montierth <cyber_dopamine@intheblackmedia.com>
Signed-off-by: Jonathan LoBue <jlobue10@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 480e82df7a4c..9bc39c2ee6b9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7410,6 +7410,7 @@ enum {
 	ALC285_FIXUP_THINKPAD_X1_GEN7,
 	ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	ALC294_FIXUP_ASUS_ALLY,
+	ALC294_FIXUP_ASUS_ALLY_X,
 	ALC294_FIXUP_ASUS_ALLY_PINS,
 	ALC294_FIXUP_ASUS_ALLY_VERBS,
 	ALC294_FIXUP_ASUS_ALLY_SPEAKER,
@@ -8877,6 +8878,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_ALLY_PINS
 	},
+	[ALC294_FIXUP_ASUS_ALLY_X] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_i2c,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_ALLY_PINS
+	},
 	[ALC294_FIXUP_ASUS_ALLY_PINS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10313,6 +10320,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1740, "ASUS UX430UA", ALC295_FIXUP_ASUS_DACS),
 	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x17f3, "ROG Ally NR2301L/X", ALC294_FIXUP_ASUS_ALLY),
+	SND_PCI_QUIRK(0x1043, 0x1eb3, "ROG Ally X RC72LA", ALC294_FIXUP_ASUS_ALLY_X),
 	SND_PCI_QUIRK(0x1043, 0x1863, "ASUS UX6404VI/VV", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
-- 
2.46.0

