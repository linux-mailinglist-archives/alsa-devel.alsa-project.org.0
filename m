Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241696FF6E4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 18:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE93F0B;
	Thu, 11 May 2023 18:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE93F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683821780;
	bh=HSSlShB2KcfQLb4BwmB1j19GSfgXfbLw0QAkUoEj79U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gVNAule9bFCheof46//HwM9HWjlFdv0I8TkfLVyEX70mv9OWqvHVT3VTd+N07MYeb
	 VHLARrcyjH7BWK8Yom1p9e5zmaQ0w5OD70LrvXdvsBJYBlKy9kzzuXqa3zywCcjBYc
	 0kCUSG343oGDn0/wE0+HCvEt1pbz9rMGIuz1WBOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54C93F80542; Thu, 11 May 2023 18:15:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9980F8032D;
	Thu, 11 May 2023 18:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0369AF8052E; Thu, 11 May 2023 18:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C685F8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 18:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C685F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=b0fgib3Q
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so13464084a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683821719; x=1686413719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aLFylek1nRr29niLBba+aU+lTWwRvz+crv9/jvyTVY=;
        b=b0fgib3Qb+R9WwiEGKsu02MNyBz6T+MDKV6ZV63it1tjIu1KnS9h+5d2xNZqksCS/h
         cs5nhOwLa6NSx9eAFg1c7dmYuCiUWCT+vfM68V/caR1QgVeKBOMqBcumjDSWkd8+dXit
         1ypmtiFeZB82MHs07GJcUC+2w3TWLo7erI562o7sOOiaOQG3EmJlZH0UPBtGpHeXwjUD
         jtVXmxo3RqeXxGtT6oPFMiWCfUyHbqBbpowoo9XxDnonXox7AApqCSDIHThc2pKmFQka
         MCUMQwTi5azkOq2shk5pQH9g8+w96SSI0ht73pjyw0yw6xhJNDEN1ltpaS0jkDOKtBeR
         eiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683821719; x=1686413719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aLFylek1nRr29niLBba+aU+lTWwRvz+crv9/jvyTVY=;
        b=WYZUjYhcBP3bC5tVO9rLuWuYunf8KCYlLgZdHL00AlGOW6/0+RKLD9EP8wl+NIb1m9
         KqvSB5wcZQUXYGk+wV8cuabumzxGnTERPCDnhCWa7Jqffe9rnZS6MoQVxHO6QrKc9ZUQ
         ehw3GObX7zGd2n4Wb2jSyEq8ZSquXWV0p1CIFspLcgfaNedUrPWFfecesfICVixV/mg4
         aICmyyIXyu2dS3UKdq9IgXLkcJqgrY9U4g2GwUpCb01qckmMZgUy3lxOKh0a3U1dYoYD
         BhIwAfLLK2gRfjNIrpqqPtrGOHnzrs/gwVXUE5+Kl9+e/eHxxHL+9d4nmJj/YQTW5fhI
         n5aA==
X-Gm-Message-State: AC+VfDwb7arIOPe275NFLsbsuUTlRhJes/ob/KqsTEttTy+hl6B04QAo
	VXhYvBo28h/2PqFXILuoWwI=
X-Google-Smtp-Source: 
 ACHHUZ4MBTYqjmy2urC4b8enhRmflW2Lb0rqrX1C351MXcWfwV8pjGIzhlDmFzNtlq8JbF4XeZ4+vg==
X-Received: by 2002:a50:ed99:0:b0:504:8929:71ca with SMTP id
 h25-20020a50ed99000000b00504892971camr18032424edr.6.1683821719398;
        Thu, 11 May 2023 09:15:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0a:b207:af00::b5e])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a056402068800b0050bc9c38fb4sm2992219edy.69.2023.05.11.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:15:18 -0700 (PDT)
From: Alexandru Sorodoc <ealex95@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Tim Crawford <tcrawford@system76.com>,
	Andy Chi <andy.chi@canonical.com>,
	Meng Tang <tangmeng@uniontech.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Philipp Jungkamp <p.jungkamp@gmx.net>,
	=?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
	Yuchi Yang <yangyuchi66@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Alexandru Sorodoc <ealex95@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add quirks for ASUS GU604V and GU603V
Date: Thu, 11 May 2023 19:15:10 +0300
Message-Id: <20230511161510.315170-1-ealex95@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7SWKGPUSRWOD6OWBU43XMVJIPL7UKLCW
X-Message-ID-Hash: 7SWKGPUSRWOD6OWBU43XMVJIPL7UKLCW
X-MailFrom: ealex95@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7SWKGPUSRWOD6OWBU43XMVJIPL7UKLCW/>
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
v2:
    Fixed position of quirk entries in table

 sound/pci/hda/patch_realtek.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bc062c0a1916..4c87a95c5d3d 100644
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
@@ -9500,6 +9518,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
+	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.40.1

