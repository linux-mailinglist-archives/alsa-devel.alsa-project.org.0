Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A702521DF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176BD1690;
	Tue, 25 Aug 2020 22:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176BD1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386897;
	bh=QzQf0fa5aJxg3C1lfIn/rffGd2zDTirre25xqS8DlDE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tb/uIMpo7gRgeT8pWZ3xR4G3Fk57m4dj0TZElY5EY3bd3rFO2tkFNRKHrY87gFHfu
	 OZaW3NC9F5vpWlcHYOGO4pBJKGeQpN5y2xx9+8Y2BrrZBSzm+oA13roXaV3yH1AImM
	 9IODa54mpVdq8hDoVXHeOFA8kjgrSf18V7pSVqa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C37D3F80360;
	Tue, 25 Aug 2020 22:11:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF61EF80329; Tue, 25 Aug 2020 22:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A459F802FD
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A459F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AlTFHSnc"
Received: by mail-qk1-x741.google.com with SMTP id p4so10237qkf.0
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQ2iJzueZoe0ah52IpIzfsDk3Bg8K/9h7stp9bUbn9I=;
 b=AlTFHSncwZtMZl291WdhniRMkiMbR6JrG2XayqyfQDHaOlR1e/+rakYAJyXuO+BBcL
 +pD29kGJQ2fQerJJVqNYFYkOEsqDgWdH1XmnhLOlCZedBQmeVDLSnw4xk5eJnMj8HN2Z
 x0aACiy7jiQB4Oz/nMBaJ+jV8bPkrQIoKkpaJhboF50MZruj3pPSbPzUMpvwy2OOIXrM
 fS7mQRfyI7zd1Il9j4SssC+J3IGWB8ip/66SLOnDCzRY9dK/AJmTL6yjbzlkNR2BlmQG
 YL8/HvCrdpdwbkGMorTWaUtJn5tOKpeXeLdOxKnkBwqhQ+cq1yZHd4pWPm8jWcM/v/x2
 MqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FQ2iJzueZoe0ah52IpIzfsDk3Bg8K/9h7stp9bUbn9I=;
 b=QWbrvBqWE6IjNPxw5LbzXpWc+wnojigCdF6vDDE5CiVhy2c9B2b+/On4yFi5M2Gwdn
 DHVwVB+TSRC8hkFs+DcTVC/WzmknhUIthVWHvLusjqpGh5wy6jDc0axmH/z/bKB3AiOt
 L8oEWBn/yzU5LUp6ZOgkXmlZhPX0c64/rCIFY6rfU9zw9IJ/HCTktz36RW3O0xfobVk3
 j6TVmxdyRZEnPgia2VBJwxAwKbEELal0DJIlldHVwlbwlZZ5sD8nm39GmxnQ8USPcOFs
 LEQJNVWgZl2fV+CRV45cdniu3WsBktINM9d33h4ru4K6IUnbZCNlowGd4U7cOqocgOBq
 yW+w==
X-Gm-Message-State: AOAM531IfVgt1D32beDaGWT8r6ZOnEssCDqYSUEA8WLMTHUhARrVkIHx
 yg54dRbb5IQuuv1Cx+q8/W8=
X-Google-Smtp-Source: ABdhPJxeZs/aowP+CfcEdTW89mF78t2rG29SSZo/tjhUPpYuLZla84lNKPxTGjxXkam7N07uT61NAw==
X-Received: by 2002:a05:620a:22eb:: with SMTP id
 p11mr10751595qki.413.1598386288897; 
 Tue, 25 Aug 2020 13:11:28 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:28 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 15/20] ALSA: hda/ca0132 - Add init data for SoundBlaster
 AE-7.
Date: Tue, 25 Aug 2020 16:10:34 -0400
Message-Id: <20200825201040.30339-16-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add initialization data for the SoundBlaster AE-7 card.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index cd46112c827e..dc1eb9bfcc5e 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -3582,6 +3582,7 @@ static void ca0132_gpio_init(struct hda_codec *codec)
 	switch (ca0132_quirk(spec)) {
 	case QUIRK_SBZ:
 	case QUIRK_AE5:
+	case QUIRK_AE7:
 		snd_hda_codec_write(codec, 0x01, 0, 0x793, 0x00);
 		snd_hda_codec_write(codec, 0x01, 0, 0x794, 0x53);
 		snd_hda_codec_write(codec, 0x01, 0, 0x790, 0x23);
@@ -8911,6 +8912,19 @@ static void ca0132_alt_init(struct hda_codec *codec)
 		snd_hda_sequence_write(codec, spec->desktop_init_verbs);
 		ca0113_mmio_command_set(codec, 0x30, 0x32, 0x3f);
 		break;
+	case QUIRK_AE7:
+		ca0132_gpio_init(codec);
+		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+				VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x49);
+		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+				VENDOR_CHIPIO_PLL_PMU_WRITE, 0x88);
+		snd_hda_sequence_write(codec, spec->chip_init_verbs);
+		snd_hda_sequence_write(codec, spec->desktop_init_verbs);
+		chipio_write(codec, 0x18b008, 0x000000f8);
+		chipio_write(codec, 0x18b008, 0x000000f0);
+		chipio_write(codec, 0x18b030, 0x00000020);
+		ca0113_mmio_command_set(codec, 0x30, 0x32, 0x3f);
+		break;
 	case QUIRK_ZXR:
 		snd_hda_sequence_write(codec, spec->chip_init_verbs);
 		snd_hda_sequence_write(codec, spec->desktop_init_verbs);
-- 
2.20.1

