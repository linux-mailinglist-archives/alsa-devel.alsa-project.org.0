Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674221CF1D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 08:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5690166C;
	Mon, 13 Jul 2020 08:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5690166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594620204;
	bh=in7WBjNmHm8EFHvhZfIDHmHQzyl3xevchdrDpjDENVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qBzuVer7o9fLEHkQ6j1q5PrNqOsnaLGSkrDvpYgxqelOyabq7RNwrCKzICwInOapN
	 I9Dl5wklrHlx8fQNJ55LCDrc30V9VEb61zRm4x38goEEqxHV7SqA0yrd+M4l1MhJZ5
	 8YCkZfU3c4LUNowe4CVgDT7xo/Q4kn+wmt1now1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFEC6F80217;
	Mon, 13 Jul 2020 08:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB4EF8021D; Mon, 13 Jul 2020 08:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58E51F80116
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 08:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E51F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="JZ76xros"
Received: by mail-pf1-x442.google.com with SMTP id q17so5535993pfu.8
 for <alsa-devel@alsa-project.org>; Sun, 12 Jul 2020 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2LxFf53Vw4t+h/aKJ0QZtXeuu7gpd40/hmYzclbuobQ=;
 b=JZ76xroszmXnFYWB45/hvEkeQEtmnzUjO68FcVYdc5PRKvy1of7OufanOhaJ4AWUSC
 bcLsdJURtJCIdrGHnLE9kLPZvIiptZ5LETI2tuSq9KDdMmYmcv4jBHxVa316zg5a7K4I
 n7zI0LSy8zzWUAHfHs5WRNhF6OblTZk26yxoDswi50RAORyWVs9JFeflP37FCYwYGgYF
 5KFQNmqtntpQGVfxB79V28/PiHVut4oyo9YULFHwqtoeIoA7Jqb/CmcJiA+fi+iYpaJ1
 C3xC09F5tQFytT+CELCIuQ3skpiQcXGDUfG35KPMx0ixn1d5CDeOVWSvJxwzRHfPXjoh
 GSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2LxFf53Vw4t+h/aKJ0QZtXeuu7gpd40/hmYzclbuobQ=;
 b=l9+j8HqGwk1Ve1P1fuxEa3Y+lDCnxOVUv0n62ig2FSjvhynVwyKsMgoy3rJNPowVUJ
 xiwuoTmNqDUjEJPlCtVg9gg5by63DlTy7Es4XI72kHgJmJHtEKy/TerVlsyczrpSQqSu
 qu2TOdjvgeSUrxhvf4+KifSMCBWqbe/hGkddrrVGNVAhaXO0oj6Cboe/jfbBA4h+D95C
 KFSW9ksQvs4jE1nDSr621GuBHqDRl/tahjISkd+sMze93nRv0hCplOLp27GwNjD6Yfov
 yeVVa43VD5lxk8SIeHXEPYhsTAnAHH2nK8uBDN5/xP+J8DO6kxa4UcKIDkIJxOwqrCL4
 i89A==
X-Gm-Message-State: AOAM530oNiZ0HI/5cEp6JyHRixkP62CE3VsMLVEfyzZohsCp9fZvOJ3A
 UtsDzrf3IZhTocdq2Bmidxe9Dg==
X-Google-Smtp-Source: ABdhPJwZ6C+zV54bk0hRzKX64wNLDp660zJnj0A/IRQ639piSjyjg/PViBcW+7XWQ53nwwcRWYP2Zw==
X-Received: by 2002:a62:cdc4:: with SMTP id
 o187mr53022376pfg.200.1594620091790; 
 Sun, 12 Jul 2020 23:01:31 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id lw5sm13779030pjb.37.2020.07.12.23.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:01:31 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic of Acer TravelMate
 B311R-31 with ALC256
Date: Mon, 13 Jul 2020 13:52:47 +0800
Message-Id: <20200713055246.62187-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>,
 "linux-kernel@vger.kernel.org.linux"@endlessm.com
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

The Acer TravelMate B311R-31 laptop's audio (1025:1430) with ALC256
cannot detect the headset microphone until
ALC256_FIXUP_ACER_MIC_NO_PRESENCE quirk maps the NID 0x19 as the headset
mic pin.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 194ffa8c66ce..0585ac97faf4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6152,6 +6152,7 @@ enum {
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
 	ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
+	ALC256_FIXUP_ACER_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7359,6 +7360,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
+	[ALC256_FIXUP_ACER_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x02a11120 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7387,6 +7397,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233_FIXUP_ACER_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T", ALC255_FIXUP_ACER_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
 	SND_PCI_QUIRK(0x1028, 0x054b, "Dell XPS one 2710", ALC275_FIXUP_DELL_XPS),
 	SND_PCI_QUIRK(0x1028, 0x05bd, "Dell Latitude E6440", ALC292_FIXUP_DELL_E7X),
-- 
2.27.0

