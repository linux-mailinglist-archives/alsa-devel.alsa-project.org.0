Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C906E2521DE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 713D016D0;
	Tue, 25 Aug 2020 22:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 713D016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386863;
	bh=2adDQ8hE1lWCbeEuwSIiU2/iSe/CVM/p6+31ngBH99E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1BzXwzxsTiJrqSaU6YdiEshVK9iRTL8dM55sP+0t6kLvQ562aMtFRHc3OSxbhXSv
	 Fs1/TOXDoEEEyFyY3Drv2QsL+M/nFpO3RyvYWj7SnRYj3cY535+9OVQpRL71DvdqaP
	 49pWEOcGNlk25avqp75/MZXO6vwzlQfWIJD0xLgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6306DF8035F;
	Tue, 25 Aug 2020 22:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E5AF8032A; Tue, 25 Aug 2020 22:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D80F802EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D80F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GIP3jMK1"
Received: by mail-qk1-x743.google.com with SMTP id n129so12305939qkd.6
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NxP3rQXiCSclAsMcIFJFVBcoqDGCfKXN2d02ZJbg+bQ=;
 b=GIP3jMK1OzR7Aq43LTTYjoeRlqIaCXyJWm2lJtUo4jyZjHNrCm10gBr7AOom0R6gtV
 7NnSfLT9Jg8IWfgmdzo704nD5kIwv9hAaNlr9OUbeJJyUETugpgZ1ESlNOPeCysNdS/i
 z2SScJCAGXFsceEwsYHDcRI9FwRJlG2wK12IoMSYtVhTzn26RsprCK//EJ+e/PKZNwAD
 l62v2xn4Q25nNQ924y9ob8hlXWjZPuwByRxIpeAmIYCAYoy+TWLTYr+kr0rBCs9CKyrV
 48QntxFKjyIbR1rh6WOGLn6VXlOQ0wE5g41eajOOfmstzj98LgHO9+01DoHEJMevujUM
 hqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxP3rQXiCSclAsMcIFJFVBcoqDGCfKXN2d02ZJbg+bQ=;
 b=QNRtHX/4uabWjso/2wfuDR/7EtHqpgLOuOJKGup++cDWpdATydl4ugcQs//zxPAm1a
 YzloNqpBzRhdMH7bvW4oWmdA6m571+QuQ4kHPprndUB1T/jLKi8jlBbbln3Nq2II6EvG
 7ttKwRtuCoo4bOOfzFHhDijPGwAhcIefs4BXLbijSrYA8sLadckJfy3GwSMHOH1IEqf2
 Em2I2EcoKAI1bC0vH/bKoXYma7tjBwkwCruDs86YN+L1sx646DHKSJ6ORLlJHcUfTy0e
 xCX8yEyANu0Oo4gwNZPZtBLgH6J4WChswbtJDQzNXbkAt90IecugFJqh9yY8hWfDqaLL
 TmJQ==
X-Gm-Message-State: AOAM53179KxSbN36LzYHw7lbx80G1HMXGpkkaFY7CVtDojsTbUaag1ZS
 0HvZGtvF0ekBMa8og/atQWo=
X-Google-Smtp-Source: ABdhPJwvqY/3gycbChlBkROJ6M19+JYts0F3JvZuSzYyZ0ZhrS9L+WsYU4fy9e7VNRjpYPRGIR4Mtw==
X-Received: by 2002:a05:620a:15b0:: with SMTP id
 f16mr10917378qkk.191.1598386286791; 
 Tue, 25 Aug 2020 13:11:26 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:26 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 14/20] ALSA: hda/ca0132 - Add pre-init function for
 SoundBlaster AE-7.
Date: Tue, 25 Aug 2020 16:10:33 -0400
Message-Id: <20200825201040.30339-15-conmanx360@gmail.com>
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

Add pre DSP initialization function for the AE-7.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 70 ++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 10aaa4806946..cd46112c827e 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8786,6 +8786,16 @@ static void ca0132_mmio_init(struct hda_codec *codec)
 	}
 }
 
+static const unsigned int ca0132_ae5_register_set_addresses[] = {
+	0x304, 0x304, 0x304, 0x304, 0x100, 0x304, 0x100, 0x304, 0x100, 0x304,
+	0x100, 0x304, 0x86c, 0x800, 0x86c, 0x800, 0x804
+};
+
+static const unsigned char ca0132_ae5_register_set_data[] = {
+	0x0f, 0x0e, 0x1f, 0x0c, 0x3f, 0x08, 0x7f, 0x00, 0xff, 0x00, 0x6b,
+	0x01, 0x6b, 0x57
+};
+
 /*
  * This function writes to some SFR's, does some region2 writes, and then
  * eventually resets the codec with the 0x7ff verb. Not quite sure why it does
@@ -8794,6 +8804,18 @@ static void ca0132_mmio_init(struct hda_codec *codec)
 static void ae5_register_set(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
+	unsigned int count = ARRAY_SIZE(ca0132_ae5_register_set_addresses);
+	const unsigned int *addr = ca0132_ae5_register_set_addresses;
+	const unsigned char *data = ca0132_ae5_register_set_data;
+	unsigned int i, cur_addr;
+	unsigned char tmp[3];
+
+	if (ca0132_quirk(spec) == QUIRK_AE7) {
+		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+				    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x41);
+		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+				    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc8);
+	}
 
 	chipio_8051_write_direct(codec, 0x93, 0x10);
 	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
@@ -8801,25 +8823,43 @@ static void ae5_register_set(struct hda_codec *codec)
 	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
 			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc2);
 
-	writeb(0x0f, spec->mem_base + 0x304);
-	writeb(0x0f, spec->mem_base + 0x304);
-	writeb(0x0f, spec->mem_base + 0x304);
-	writeb(0x0f, spec->mem_base + 0x304);
-	writeb(0x0e, spec->mem_base + 0x100);
-	writeb(0x1f, spec->mem_base + 0x304);
-	writeb(0x0c, spec->mem_base + 0x100);
-	writeb(0x3f, spec->mem_base + 0x304);
-	writeb(0x08, spec->mem_base + 0x100);
-	writeb(0x7f, spec->mem_base + 0x304);
-	writeb(0x00, spec->mem_base + 0x100);
-	writeb(0xff, spec->mem_base + 0x304);
+	if (ca0132_quirk(spec) == QUIRK_AE7) {
+		tmp[0] = 0x03;
+		tmp[1] = 0x03;
+		tmp[2] = 0x07;
+	} else {
+		tmp[0] = 0x0f;
+		tmp[1] = 0x0f;
+		tmp[2] = 0x0f;
+	}
 
-	ca0113_mmio_command_set(codec, 0x30, 0x2d, 0x3f);
+	for (i = cur_addr = 0; i < 3; i++, cur_addr++)
+		writeb(tmp[i], spec->mem_base + addr[cur_addr]);
+
+	/*
+	 * First writes are in single bytes, final are in 4 bytes. So, we use
+	 * writeb, then writel.
+	 */
+	for (i = 0; cur_addr < 12; i++, cur_addr++)
+		writeb(data[i], spec->mem_base + addr[cur_addr]);
+
+	for (; cur_addr < count; i++, cur_addr++)
+		writel(data[i], spec->mem_base + addr[cur_addr]);
+
+	writel(0x00800001, spec->mem_base + 0x20c);
+
+	if (ca0132_quirk(spec) == QUIRK_AE7) {
+		ca0113_mmio_command_set_type2(codec, 0x48, 0x07, 0x83);
+		ca0113_mmio_command_set(codec, 0x30, 0x2e, 0x3f);
+	} else {
+		ca0113_mmio_command_set(codec, 0x30, 0x2d, 0x3f);
+	}
 
 	chipio_8051_write_direct(codec, 0x90, 0x00);
 	chipio_8051_write_direct(codec, 0x90, 0x10);
 
-	ca0113_mmio_command_set(codec, 0x48, 0x07, 0x83);
+	if (ca0132_quirk(spec) == QUIRK_AE5)
+		ca0113_mmio_command_set(codec, 0x48, 0x07, 0x83);
 
 	chipio_write(codec, 0x18b0a4, 0x000000c2);
 
@@ -8918,7 +8958,7 @@ static int ca0132_init(struct hda_codec *codec)
 
 	snd_hda_power_up_pm(codec);
 
-	if (ca0132_quirk(spec) == QUIRK_AE5)
+	if (ca0132_quirk(spec) == QUIRK_AE5 || ca0132_quirk(spec) == QUIRK_AE7)
 		ae5_register_set(codec);
 
 	ca0132_init_unsol(codec);
-- 
2.20.1

