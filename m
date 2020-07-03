Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C922134A9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0210016B3;
	Fri,  3 Jul 2020 09:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0210016B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593760133;
	bh=dTWZF9dLeKMEnAnKepyXOfmDwfcDNzqH2XK5xFHAcI8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyJHlpp42jd0eDNKUlK2CbBOs0iIidlnMkm4wbdnp5Z2SPwBdekdZm/Lxp7uLTZj5
	 NQ2+qBfmVpSW+ubjILQaTDsIUZDM/27l9D48ZHGsHRJZfNenCbjyVo2Zd6TT6iuCv3
	 kN//6RsrEGJcVudlGMXsLU+8U5sDLMKtZBBtZxtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F96F8021D;
	Fri,  3 Jul 2020 09:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 969CAF8028F; Fri,  3 Jul 2020 09:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF7CF80269
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF7CF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="CVuXoOBO"
Received: by mail-pf1-x441.google.com with SMTP id m9so3356979pfh.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 00:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qZjFkIVJTz9thTx+GrzMJX0wDRAys5DOTPVI0ovJ+iM=;
 b=CVuXoOBOVKnzWQ1+4EX86/AeV4yV7/24FrDAkOtOKsSTcP0e7nrxWMsW1cJBLHTzYo
 rvsZzOPMI26z2LP9nY6Zc/yPLYWQfU+0ad7x1RIpMJFnb1qU+wVhkVjGevC3VXaNNG5l
 qeGf8+s4geDIaq2rt0pV8OShhDUD3XXJb+3abQAwXTox4ZVpdBVYnpvBXupyz5KT1D8W
 zSzBDD7ifHAaf1Fv2IenQn/AWWai64JG3swoTUSJvJumxHb9AIHTLJUI3QQ72wCqpaHq
 Lsi2m6PP4hFocDXVx+6UYgB+yXRFOJus2vBlbySvd0rEw+SHLnT11yGzbSt6kde+kmFc
 DUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qZjFkIVJTz9thTx+GrzMJX0wDRAys5DOTPVI0ovJ+iM=;
 b=hx7NQEdrW4bVbiErguqpw/r6mvv8ZWTF/FWUw9EmZBeKGmKI4BNIxJ7Eq1X7pSlEye
 T0T7rKSUNQyeAyLarvOgT9xVrd8GmEmqSCfUyat8Sml3t35KjsGYIm5uI5e/WZyG/MxX
 810Fkdd/8ZyOHHNWGIdbbWzS/tI3PuzRkFF9gXnjqqXdfLWu/vL6NofCt79uIJCx0HDe
 Cw3kB9T5YbWD2DyUV6bUb3rM/FGPeaA+h1AXtHtpOGBiZ3ytC3aLvFe654J7IpSTfS4o
 clcxbEGlQvFT5eHiEZ6DfvtTyZQc5EnfCgjWxJGV7Pl0bXo7nOD81ht7plZfHTTboPAR
 s+BA==
X-Gm-Message-State: AOAM531D7MFY7ZF/ZLi3gpREJHEWnKjQGFNFLI8LIxWJdwIh5TPLW72B
 USW+cuSv3vyn5rQ4xrxMT3PH4A==
X-Google-Smtp-Source: ABdhPJyy3l4qFH7FwIRz0AG+TcbmJt6Z71Eiyguflbvc+p56xo8H509bviHjQYsZvaxm9C/QxUEdBA==
X-Received: by 2002:a63:135b:: with SMTP id 27mr19533356pgt.37.1593760014502; 
 Fri, 03 Jul 2020 00:06:54 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p1sm3529764pja.2.2020.07.03.00.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:06:54 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] ALSA: hda/realtek: Enable headset mic of Acer Veriton
 N4660G with ALC269VC
Date: Fri,  3 Jul 2020 15:05:16 +0800
Message-Id: <20200703070512.174394-3-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703070512.174394-1-jian-hong@endlessm.com>
References: <20200703070512.174394-1-jian-hong@endlessm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux@endlessm.com,
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

The Acer Veriton N4660G desktop's audio (1025:1248) with ALC269VC cannot
detect the headset microphone until ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE
quirk maps the NID 0x18 as the headset mic pin.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3255da8b3849..02054a2a742f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6151,6 +6151,7 @@ enum {
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
+	ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7349,6 +7350,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, 0x01a11130 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7370,6 +7380,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
 	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
+	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
-- 
2.27.0

