Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66812BBA3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:44:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD77C1668;
	Fri, 27 Dec 2019 23:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD77C1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577486653;
	bh=HOrlQpgYYvna6rz5gZjkXBBzgGQkPJe7nhqbgqRf7Ik=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B8nyl3rXbBuNPXkq4fzI/NZrntpLWMPyHJ44iw7Ym2g7ZKRvF3cqAWxAO+yu71kHY
	 cReDL5ZYfx6aCtBkSy+wfhDv42x7VCPbXuxWXYPilQtHwmp2sJT6CLar4HGtDw1EaZ
	 //hU8qkC3jDRdenOUsZSuVe9BD9jed3SOY/hHQw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E98D6F801F4;
	Fri, 27 Dec 2019 23:42:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B20F80132; Fri, 27 Dec 2019 07:57:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5570DF800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 07:57:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5570DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="YrwbpXmo"
Received: by mail-pl1-x641.google.com with SMTP id bd4so11386065plb.8
 for <alsa-devel@alsa-project.org>; Thu, 26 Dec 2019 22:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnkNvUFtvzbbYcE5CwfaCD/l1qPrOZWX6lNmWQNNLKE=;
 b=YrwbpXmotny6FI9nIbFIyeg+ylSzXsCvExjIzikQPY+n54yXehgurNHW7qrxGTQ9RT
 zesiXNUmTMuhevDfwch77rne6wrlv23AiG84gNLfdfKymRAvkODhKqK6/pnazuqE0WIc
 0ZBCViPwePVFn3aVY6NR9uKORsTkKiCCONjxkkAn8GJkIWpi9D3hCGFTMqTkDowkHUyM
 A0VeSsnP/oiP/KDS9Xm72ld5HmU8jLfnYFvor6vE3ZO8SfX/GF0pubM87YEL2nY1asf3
 +/OjQAVs8MHejN0ga1c1SC4/+PkFQatOcO56Tj4NrOm+tHGqWrGbviyQvxB2uacBMpai
 c1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnkNvUFtvzbbYcE5CwfaCD/l1qPrOZWX6lNmWQNNLKE=;
 b=fs5YOPxtlvTr0RyFcQWjRvzTkeJCip9PV0zYb+3cOKgWvuPYkuzwR2nxs7gXUi4HWz
 MjuJostVKnX5oHYNxFqO2gK+QptZHXNKpbcIqLttI9d4yDzx4tqLkp1idzCKGdnXW/Ge
 IO/9sayIug8qhUEthHCmm/SjNbOPWUUYy6ir6botbeHDiJJJeEKp5fJf66L29890gwR9
 axzRzQPk4r6dBGMlTDY1sJ1TvEjbwg8Ujm9ZryT3Ap3WAqfqhvu2BxwMf2Y0aZ8jWpGv
 4yqPqQGOrkG+U+auHtTpPx+W6VwcBt2ek7O/XkXPObyf6GgvrCT9snBIqaqTr9eQlzFP
 7O7Q==
X-Gm-Message-State: APjAAAVlGeGrT57zmuO5eWcuCc1AQcwDwZKwAmM0xpADIH4cYxiUnBw/
 t97dTMHqGD7OCgahzLKc8dYNxA==
X-Google-Smtp-Source: APXvYqxtY/9hAi9APfUm0ya3wc7W/vrscRGRDzi+zNzns0bnB8bJqCmwIydV8hjy8GFWNUvuMXpFXw==
X-Received: by 2002:a17:902:bc4b:: with SMTP id
 t11mr14003821plz.190.1577429853727; 
 Thu, 26 Dec 2019 22:57:33 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.gmail.com with ESMTPSA id o2sm13449658pjo.26.2019.12.26.22.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 22:57:33 -0800 (PST)
From: Chris Chiu <chiu@endlessm.com>
X-Google-Original-From: Chris Chiu <chris.chiu@pacidal.com>
To: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
 hui.wang@canonical.com, tomas.espeleta@gmail.com
Date: Fri, 27 Dec 2019 14:57:24 +0800
Message-Id: <20191227065724.2581-1-chris.chiu@pacidal.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 23:42:48 +0100
Cc: Chris Chiu <chiu@endlessm.com>, alsa-devel@alsa-project.org,
 linux@endlessm.com, linux-kernel@vger.kernel.org,
 Jian-Hong Pan <jian-hong@endlessm.com>
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Enable the subwoofer of
	ASUS UX431FLC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Chris Chiu <chiu@endlessm.com>

ASUS reported that there's an additional speaker which serves as
the subwoofer and uses DAC 0x02. It does not work with the commit
73a723348a43 ("ALSA: hda/realtek - Enable internal speaker of ASUS
UX431FLC") which enables the amplifier and front speakers. This
commit enables the subwoofer to improve the acoustic experience.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index fada1ff61353..0193a8722be2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5576,6 +5576,16 @@ static void alc295_fixup_disable_dac3(struct hda_codec *codec,
 	}
 }
 
+/* Fixed DAC (0x02) on NID 0x17 to enable the mono speaker */
+static void alc294_fixup_fixed_dac_subwoofer(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		hda_nid_t conn[1] = { 0x02 };
+		snd_hda_override_conn_list(codec, 0x17, 1, conn);
+	}
+}
+
 /* Hook to update amp GPIO4 for automute */
 static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
 					  struct hda_jack_callback *jack)
@@ -5950,7 +5960,8 @@ enum {
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
 	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
-	ALC294_FIXUP_ASUS_INTSPK_GPIO,
+	ALC294_FIXUP_ASUS_DUAL_SPEAKERS,
+	ALC294_FIXUP_FIXED_DAC_SUBWOOFER,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7097,10 +7108,9 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
-	[ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC] = {
+	[ALC294_FIXUP_ASUS_HEADSET_MIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x14, 0x411111f0 }, /* disable confusing internal speaker */
 			{ 0x19, 0x04a11150 }, /* use as headset mic, without its own jack detect */
 			{ }
 		},
@@ -7117,12 +7127,18 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
-	[ALC294_FIXUP_ASUS_INTSPK_GPIO] = {
+	[ALC294_FIXUP_FIXED_DAC_SUBWOOFER] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc294_fixup_fixed_dac_subwoofer,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
+	},
+	[ALC294_FIXUP_ASUS_DUAL_SPEAKERS] = {
 		.type = HDA_FIXUP_FUNC,
 		/* The GPIO must be pulled to initialize the AMP */
 		.v.func = alc_fixup_gpio4,
 		.chained = true,
-		.chain_id = ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
+		.chain_id = ALC294_FIXUP_FIXED_DAC_SUBWOOFER
 	},
 };
 
@@ -7291,7 +7307,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_INTSPK_GPIO),
+	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
