Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457522134A8
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D148816AC;
	Fri,  3 Jul 2020 09:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D148816AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593760115;
	bh=qFAIffioVFFTeBF5oxOgV6xmZs51zYLLd0z2OkAbnNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FNG5elsP8Er2KS7YJzzQHpQgVRX9GlKazZjTrbDfWdCsZH2L8vw18U9Eq8cxFuFCZ
	 1rus1wMSRNnglOWVU/lg9a5ZadR5gOeRVNvKabvxrxE2XEdyQiWZhXt/5G7PtBuRuR
	 jj/GRxDCGNUAt4uKIPioXmHN7caZw7/ce4rEaNHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14601F800E0;
	Fri,  3 Jul 2020 09:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32C27F8025F; Fri,  3 Jul 2020 09:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA7CF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA7CF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="ozgXHUcV"
Received: by mail-pl1-x642.google.com with SMTP id d10so276625pll.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 00:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDYPa69LmDFvO+Xx7QJScqxnVDczXS9vz2dN5XkQbOo=;
 b=ozgXHUcVDIllwsoVOCKyOzFhQmAoGtBeS7xRsINeTILHLSCMAJRkJ1Els+cxXSztnt
 5F1xa1XAEYqYPvjFs3nTDNtanerAMu+YdgLLJZdhmh3gjNBdzutgYABmdAZHlJx1UqCQ
 3DDaIyW86f7LQkbChMriANqcer9oWb4I8BSfisxcdlAomR6IfoQ2OM/F1R1pDZ3RVVgB
 b4F7Lm7nFhwceAVhzSkS5v1KhtXfgmwVHLM+3t3pgx7pOGwfqGcHD6bsck4YsAB6dmMu
 jb8SiOve0laFHMCP+nYidOHbj5bNrLi6KtjsXLf1SaQNhSTitdy8CC6HeDkzA4R/Mvfq
 rM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDYPa69LmDFvO+Xx7QJScqxnVDczXS9vz2dN5XkQbOo=;
 b=WxEK9TsRmvTNIQiP7Wp1kO4fDiIB0D/AYTCeBPYcYUzRTOfNfNzWlmlnet+yNoFJPm
 KQe7LTBizuGWELvHp/8lnJn3F7ol2S507gDt+TfesFUlSfR98aqNgnhkk2olyqwCUm8g
 a55FIGElMsi7JaotzKkDvFZgRLtTmUtqQlk4NiGFSO/0GL3aCCDXVqvNAZAfkX7ssWGo
 +BH5yuPGLegXtyH5B3bjnUGOmpFYg45GihGd1YxV7nxiLNRu9E2UZ7oRdw6QqPKIda4U
 MFFD66UME5YBUU/FcSEWk68MYbGDi61EZPsPcOWA1hlw32ESi2KU7tMiCseQMDrXuVnO
 PHuQ==
X-Gm-Message-State: AOAM533I4JzGOgwyiw0zTsMD4pjfAIgRaPMm4KW74pcU2I3HZSBpNPfT
 8YEniZQrqY64I8HkpyHDSGl0mQ==
X-Google-Smtp-Source: ABdhPJx4PsoUIB7GYssnL1xk6WAhTBYOnCuss0AkP3hpv9zos6Fft/tE+LbljWFRS1+vvFazagSO9w==
X-Received: by 2002:a17:90b:30d0:: with SMTP id
 hi16mr38329964pjb.65.1593759997356; 
 Fri, 03 Jul 2020 00:06:37 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p1sm3529764pja.2.2020.07.03.00.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:06:36 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ALSA: hda/realtek: Enable headset mic of Acer C20-820
 with ALC269VC
Date: Fri,  3 Jul 2020 15:05:14 +0800
Message-Id: <20200703070512.174394-2-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703070512.174394-1-jian-hong@endlessm.com>
References: <20200703070512.174394-1-jian-hong@endlessm.com>
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
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dfb4bca07d3f..3255da8b3849 100644
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
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC269VC_FIXUP_ACER_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, 0x02a11030 }, /* use as headset mic */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
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

