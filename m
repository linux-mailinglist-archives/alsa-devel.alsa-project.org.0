Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5A2DC089
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 13:54:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F9C17C8;
	Wed, 16 Dec 2020 13:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F9C17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608123246;
	bh=9BNo1Fc2C8Cnt1QzeNo5Ru2q/THrh58zyUbLqtbMOwg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n5IsCs1NmKU5hPgIwys8BKNC4k1gDOM5goqHAHmpZh4U5xWDJlQ7Br+ctUkL8hiWt
	 IudlBppAfC7ZW1wO7sgdHnjmZ/Gguv2RE21l6A22MlpkwbV7flDmGvqimKW5//0vuK
	 Peyv3mV8a9OGziRDEvYh+7Z8juW1TjIRH7xbX32g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D154EF80240;
	Wed, 16 Dec 2020 13:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC1CF80171; Wed, 16 Dec 2020 13:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E0E9F8011B
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 13:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0E9F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="iUVT+lVT"
Received: by mail-pg1-x52f.google.com with SMTP id z21so429707pgj.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KpZvtsYiFNOwRZla8T0Qhj6+pqcPtnaeSWOjOiatGIs=;
 b=iUVT+lVTwy1dlwOKp9+69djqcL7Ube77r0wZRnaf7G5Eaz1vexgoRK4oq6P+81DuG1
 SQoONEvfTAuJsY1yy6L3mzkBeE3cjGFR8HG5E4NQJza3m3NqOVMkCSjZrohVgVT7ILFg
 iI1u7Ga/Bcuw4WOjRWYLMDP+Jdu8sy5mc4+A0HgD7Q8StEj0Ef5RRfvX075v2GuHTdem
 WsrGOrWMoqJ28pwgpmIqU5D69b5etAFJXtwShUVlE6sStVNpQ8V/hTOlaZgrsuDqRvVr
 vjswLygwPTwloMVvZstQ+X+Pyhvwo7tuUrUZ3AeC8B9xVOX3O347T++H+lD7MVZ8Q81O
 yHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KpZvtsYiFNOwRZla8T0Qhj6+pqcPtnaeSWOjOiatGIs=;
 b=foKyW9tQFEkKQEfRNibFqCsFZp7cY+VYRvj/Kiytd2hQHBEkoGU08B302D6uWY09AK
 KHMmkvXoWfILLk167wIM0ZHwUls57TmiLhcnuo+KQ8CJbC6OVhTWFgJKEN0IQDMjZiyS
 F2fYBVOmfZL4mDkV4Wft4U5Ka9QcMIV78X1jZxEF+0CYQNMLbAJAjeOHOh+e7dzozTqM
 5U1pYHgVVbDV//lsTWh+jdVFyYzwHHw6bel0weLVOVBfsLviLc0nHygeZ9Zo3QCd+YTd
 HZ3l2/ClYPNgnJMZQFBOTfbnfzb5HD6mvqwzSdVbYGSUeonT7cjmAuPA/RDgWs7KrZJ6
 J0dQ==
X-Gm-Message-State: AOAM530+hW4f1JEvBNwth/YLT+ib279OeTj4++UGM/5PdLt/IpNUUov1
 +rDl4F4Hfrme9/c6jlaWaOs8VKZa2Tx7IA==
X-Google-Smtp-Source: ABdhPJzflfKak82tuSvOYbXdaImhee7Mip7Lv10SjwSDydRA7ub3KjzoYpOwwE8NX+zsZX3EgvJ1jw==
X-Received: by 2002:a05:6a00:22ce:b029:197:9168:80fb with SMTP id
 f14-20020a056a0022ceb0290197916880fbmr2610695pfj.38.1608123135610; 
 Wed, 16 Dec 2020 04:52:15 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-3814-b22f-bb79-0f7b-8e3f-1374.dynamic-ip6.hinet.net.
 [2001:b011:3814:b22f:bb79:f7b:8e3f:1374])
 by smtp.googlemail.com with ESMTPSA id ck20sm2197595pjb.20.2020.12.16.04.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 04:52:14 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek: Remove dummy lineout on Acer TravelMate
 P648/P658
Date: Wed, 16 Dec 2020 20:52:00 +0800
Message-Id: <20201216125200.27053-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, Jian-Hong Pan <jhp@endlessos.org>,
 linux@endlessos.org
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

Acer TravelMate laptops P648/P658 series with codec ALC282 only have
one physical jack for headset but there's a confusing lineout pin on
NID 0x1b reported. Audio applications hence misunderstand that there
are a speaker and a lineout, and take the lineout as the default audio
output.

Add a new quirk to remove the useless lineout and enable the pin 0x18
for jack sensing and headset microphone.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8616c5624870..e7edcdbc6ca3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6366,6 +6366,7 @@ enum {
 	ALC287_FIXUP_HP_GPIO_LED,
 	ALC256_FIXUP_HP_HEADSET_MIC,
 	ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
+	ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7789,6 +7790,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC255_FIXUP_DELL1_MIC_NO_PRESENCE
 	},
+	[ALC282_FIXUP_ACER_DISABLE_LINEOUT] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1b, 0x411111f0 },
+			{ 0x18, 0x01a1913c }, /* use as headset mic, without its own jack detect */
+			{ },
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8560,6 +8571,22 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x12, 0x90a60140},
 		{0x19, 0x04a11030},
 		{0x21, 0x04211020}),
+	SND_HDA_PIN_QUIRK(0x10ec0282, 0x1025, "Acer", ALC282_FIXUP_ACER_DISABLE_LINEOUT,
+		ALC282_STANDARD_PINS,
+		{0x12, 0x90a609c0},
+		{0x18, 0x03a11830},
+		{0x19, 0x04a19831},
+		{0x1a, 0x0481303f},
+		{0x1b, 0x04211020},
+		{0x21, 0x0321101f}),
+	SND_HDA_PIN_QUIRK(0x10ec0282, 0x1025, "Acer", ALC282_FIXUP_ACER_DISABLE_LINEOUT,
+		ALC282_STANDARD_PINS,
+		{0x12, 0x90a60940},
+		{0x18, 0x03a11830},
+		{0x19, 0x04a19831},
+		{0x1a, 0x0481303f},
+		{0x1b, 0x04211020},
+		{0x21, 0x0321101f}),
 	SND_HDA_PIN_QUIRK(0x10ec0283, 0x1028, "Dell", ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,
 		ALC282_STANDARD_PINS,
 		{0x12, 0x90a60130},
-- 
2.20.1

