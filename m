Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACBF215340
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 09:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9041680;
	Mon,  6 Jul 2020 09:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9041680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594020152;
	bh=45xGo23B+9/5TEYSlKxplczLnW44qwvpWqBTYRmzR1E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhflGMHFrfPHd7LA/1qx2zguKx8lhNX8i2zBpTopqoeeUYPcw8dV/5UPZZaBnNK1H
	 lZIwWqpnBCOZxQmFV7e3FhcoeeBTblf1aR8E3j8qKx+o8kQiyTcX66vHBDPoCP/O/n
	 1Lh4mgVEJ9m2aDCVdiOcz2IIQdmOGnpkgUEmk5O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3634DF8011F;
	Mon,  6 Jul 2020 09:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7669FF80161; Mon,  6 Jul 2020 09:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A10C6F8015C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 09:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A10C6F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="NvMGc8wK"
Received: by mail-pl1-x642.google.com with SMTP id x8so14094661plm.10
 for <alsa-devel@alsa-project.org>; Mon, 06 Jul 2020 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMrBCO2HX9SmHfGaTdHWGGANRpDUMASbUUrpS3Y30hY=;
 b=NvMGc8wKt9H4eVx9J5luQg51fZ8GewllQNYQDmxsgeH32r/45gfk7BhVwBserNn0LX
 ooMJLGG6IHCNW9ocWirNTotEpAHRGxAI72whR2vr+UqsyzG5yJYvWbLoJ3naFLb6LEtq
 DIzu8zmkyDBcD2q2OAJAwapFsFIcDt+xBEV48pT0T5JMaKn3iHpFKH2iwTaBbiFOp8Bs
 kikGGcnMNMKnNNyWtcXiciCRUv1C+AS1CMA4aTAQnyNxFfzNBqHEN9IBtu7ymXAF+xiE
 UbM1Je/GkYAtqVF1cfbDRAxUMj7gKFcuY+eSDTT4anJIJ6yrj38b/HZnt1Xhv40PBwWb
 B9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMrBCO2HX9SmHfGaTdHWGGANRpDUMASbUUrpS3Y30hY=;
 b=D5MYrfNNz7vKn4Kl2TnCe3cOCkP7hnhUD+emt+FhdpGFdpxWxjVMf17xvmdoZovARl
 7ABKlUg1jpXV6L+0mmDOXg5/T3I/K9rDHiLVJac5r6rTvEj2YBCfo7tw3GivCQNxoNsT
 VH0RPJgQPczNtRQqPSA3K0/Dnpj+a1EM+VFCdGQLPE0YTkkhA2Tz8Qg+kr1KU1RCYwO9
 tXc3OASMRQ1cd88/jCDthnCi9Gm3yPKtxDPh+bn2outZcrrr+40kn6lHbhYeSxA8npHb
 iBNBU5IG6e4vR7Kqkrk/fwjqYv1x3UnQo9BxArQJrBkBvEzV+8gwtQfDLE6fHbPH/CoX
 csOg==
X-Gm-Message-State: AOAM533EqtFt9vol70qFW+R4AYQ7WTz/g/unFCmEl06aUdLiUMnkd3Tx
 bb1GlZ9qHHFBXFQZudBgGZbtfQ==
X-Google-Smtp-Source: ABdhPJw+/4Nv1TzCrD3P91WHTQvkYg0j+ZGrFxxPtwmEmoIKGoIdqkWElWszB0kHPXghpPovSLs7eg==
X-Received: by 2002:a17:902:c142:: with SMTP id
 2mr41559017plj.222.1594020011818; 
 Mon, 06 Jul 2020 00:20:11 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id f18sm17825210pgv.84.2020.07.06.00.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:20:11 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 2/3] ALSA: hda/realtek: Enable headset mic of Acer C20-820
 with ALC269VC
Date: Mon,  6 Jul 2020 15:18:27 +0800
Message-Id: <20200706071826.39726-2-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
References: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 linux-kernel@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
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

The Acer Aspire C20-820 AIO's audio (1025:1065) with ALC269VC can't
detect the headset microphone until ALC269VC_FIXUP_ACER_HEADSET_MIC
quirk maps the NID 0x18 as the headset mic pin.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
Signed-off-by: Daniel Drake <drake@endlessm.com>
---
v3: Change the chained ID to ALC269_FIXUP_HEADSET_MIC according to
    Realtek's suggestion

v2: Change the chained ID to ALC269_FIXUP_HEADSET_MODE according to
    Realtek's suggestion

 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 13c32655df44..be18b304e731 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6150,6 +6150,7 @@ enum {
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
+	ALC269VC_FIXUP_ACER_HEADSET_MIC,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7339,6 +7340,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
+	[ALC269VC_FIXUP_ACER_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, 0x02a11030 }, /* use as headset mic */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7354,6 +7364,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x0775, "Acer Aspire E1-572", ALC271_FIXUP_HP_GATE_MIC_JACK_E1_572),
 	SND_PCI_QUIRK(0x1025, 0x079b, "Acer Aspire V5-573G", ALC282_FIXUP_ASPIRE_V5_PINS),
 	SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1025, 0x1065, "Acer Aspire C20-820", ALC269VC_FIXUP_ACER_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x106d, "Acer Cloudbook 14", ALC283_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
-- 
2.27.0

