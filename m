Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB316FD71F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E5971057;
	Wed, 10 May 2023 08:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E5971057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700562;
	bh=bp5m2/s9zA9Ea9TVrVdozjkVv0sxDowNrCh/mBL2GcM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=INPoxjOvhSZ1OKsXIVKK6InXJh1Wc3ps/aT7EUxzLs2N1W8QH4BojWNQCe1I20D6Q
	 Ve/TsMdiCdnws/K2ffuKmbimw+kGF/W33uaNCc5r6G1tR1NBs4rn2G5MUYs7aJBKrW
	 UFEAt+j0Of1P+jsHD77WmDg+kMOGPFfrT42tiEgs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F77F8053D;
	Wed, 10 May 2023 08:32:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 350D2F8032D; Tue,  9 May 2023 18:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36514F8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 18:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36514F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=IMMiCUBP
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f315735514so216055365e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683650327; x=1686242327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PRwJ7afnhvG5N+v0cvD49y4wNVJ1gg0C5EbsfgsL+c=;
        b=IMMiCUBPTkIyKRnJ5FicSbkEMs32j4pjYtKqPIy85vw3TbM2OajKwDxFRae6bhkxJV
         GOTeLU7kgJMyVHcRGrjbDWLumZ+d17fhV9pc9gp6Erk4A4xnfnGsA6gAYHthgxCZsOHG
         xzIoFH68+/sz2zNfN8qhXHK+KIKBtGKFpuguBsXfIP3S+l+nAQ/0XE++rhWNbjrGqQqy
         XXIx25riM1OHU8A6WLMv0xp6QaM2XCNTFBk1V1kdwBRoRWLjiGyaxZxAH+MKNQiSRHiw
         Dkm/Vx6ZqknWBLScEJr3v1w3OUZvaYo1pVR9FsrcUQwEcodyk6KfARlNRb+4Z9jgMuNv
         s+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683650327; x=1686242327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PRwJ7afnhvG5N+v0cvD49y4wNVJ1gg0C5EbsfgsL+c=;
        b=HLWw+vgAMae0pxsVVbBn3BrZDzV63JC/fVDkOLM0+BSMdNHFhvwZCHZj4C7SFpdTZF
         eGJg6aB63fVU10PXC1NEuKVhxPxk0MrCY3pXXHNUGDTQ6QZh3pU1xuE0JZLlppwmKttV
         4L1MfAV6UjOyscgfKXDFnm0CdEiNu1WXeNdJlGwHCwuWFEIOK2UpZD32fnUn8C3Ox4Nw
         pObhXQ9O1DWiLrl8qPqJIUVLWEnGpieXgqzKgrOGQftUTdjkDw7d5aw07aoLU8CTZZ/x
         vA9ujeCRONIxMiOXp3zH/3S68lruzxt8tM3qIMHA46MuU2HjwG0IcXVc+8c7ARfmlGKi
         g26Q==
X-Gm-Message-State: AC+VfDyxikNvgdauDCniOdlmWQEpqvyLxfHiPtr1sZh8gH2TgJfHFyiH
	AaWg7p+wM7YfpICf9rgSaW0=
X-Google-Smtp-Source: 
 ACHHUZ6szIfcwpjYTBix40H57HaQDeT+mI/3tygZHWaU1auRMOIJo9upz3bX1rW7I8QsDRlowSeUpw==
X-Received: by 2002:a5d:680e:0:b0:307:9693:efe1 with SMTP id
 w14-20020a5d680e000000b003079693efe1mr5272677wru.18.1683650327277;
        Tue, 09 May 2023 09:38:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0a:b207:af00::b5e])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a5d4681000000b003062f894b64sm15097952wrq.22.2023.05.09.09.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:38:46 -0700 (PDT)
From: Alexandru Sorodoc <ealex95@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/1] ALSA: hda/realtek: Add quirks for ASUS GU604V and GU603V
Date: Tue,  9 May 2023 19:37:46 +0300
Message-Id: <20230509163746.6949-1-ealex95@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ealex95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3NJVJ32Q4R2R4KFYX2CUIVWR7LRMHKHT
X-Message-ID-Hash: 3NJVJ32Q4R2R4KFYX2CUIVWR7LRMHKHT
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:51 +0000
CC: Stefan Binding <sbinding@opensource.cirrus.com>,
 Tim Crawford <tcrawford@system76.com>, Andy Chi <andy.chi@canonical.com>,
 Meng Tang <tangmeng@uniontech.com>, "Luke D. Jones" <luke@ljones.dev>,
 Philipp Jungkamp <p.jungkamp@gmx.net>,
 =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 Yuchi Yang <yangyuchi66@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Alexandru Sorodoc <ealex95@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NJVJ32Q4R2R4KFYX2CUIVWR7LRMHKHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These models use 2 CS35L41 amplifiers using SPI for down-facing
speakers.

alc285_fixup_speaker2_to_dac1 is needed to fix volume control of the
down-facing speakers.

Pin configs are needed to enable headset mic detection.

Note that these models lack the ACPI _DSD properties needed to
initialize the amplifiers. They can be added during boot to get working
sound out of the speakers:
  https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff

Signed-off-by: Alexandru Sorodoc <ealex95@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bc062c0a1916..3689c0fca328 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7063,6 +7063,8 @@ enum {
 	ALC225_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC295_FIXUP_DISABLE_DAC3,
 	ALC285_FIXUP_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_HEADSET_MIC,
 	ALC280_FIXUP_HP_HEADSET_MIC,
 	ALC221_FIXUP_HP_FRONT_MIC,
 	ALC292_FIXUP_TPT460,
@@ -8033,6 +8035,22 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
 	},
+	[ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_CS35L41_SPI_2
+	},
+	[ALC285_FIXUP_ASUS_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1
+	},
 	[ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9543,6 +9561,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x8398, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x83ce, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x8516, "ASUS X101CH", ALC269_FIXUP_ASUS_X101),
+	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x104d, 0x9073, "Sony VAIO", ALC275_FIXUP_SONY_VAIO_GPIO2),
 	SND_PCI_QUIRK(0x104d, 0x907b, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
 	SND_PCI_QUIRK(0x104d, 0x9084, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
-- 
2.40.1

