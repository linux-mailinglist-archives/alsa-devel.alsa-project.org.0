Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89D12CC13
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2019 04:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1229416D2;
	Mon, 30 Dec 2019 04:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1229416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577675476;
	bh=FusdmIvZtJwNbO3h8eeZAHwCzv78MiJoTMafvqk8eVs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sZ5wXRZhmpxXHyvSjepp1ZyRzHiMS8tDEt7D0ax13OlO3w9utuikxTGrxN7JHKLZ8
	 /AKr9tUoFOANapFvDSAS49py+Y5pr5TNxqQOkuogkN8cuLOruAVvffMn2BlUQKzlZ/
	 RP97C3LvNtXB6wBgxO8Y8sa+ZoRmrbnNm7OfG254=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB99F8015C;
	Mon, 30 Dec 2019 04:09:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BACAF8015D; Mon, 30 Dec 2019 04:09:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87071F80126
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 04:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87071F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="xhvr6vb2"
Received: by mail-pf1-x441.google.com with SMTP id 4so17608488pfz.9
 for <alsa-devel@alsa-project.org>; Sun, 29 Dec 2019 19:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=upEp8hl/kvhyOaP5IttMFvt3fWm36jVnMskRhcv5Zsk=;
 b=xhvr6vb2vZ0nn9EkANyBeJ5qsjBOHgXsLHVLUI8feB/l9fEpSQ8CzFPbJ2j+XgOIIR
 iTiPa3GdPHp13L2XH3BipCwvkZBJVaS7hNXn5OEoHTB7iAwgNr92Vf0REjYzyrDsivTX
 5Mf6DbwoQBgpgqIJfd+nHGqOxkehd0/5Tg94GwBXiXXmAD71fA2eWOu1uweHQnW/DJSO
 dwoEHY72JAtx70KLly+5E+1XP23IYi32uoEsdivHV7VSWvCkoATuCOYqbsWO2LsvbA9M
 btV+3V170bxvckTDFUlFXLaXC3NiXtaimZG1+ZzgtXouulwKL599jDeExJIg7gA34Z9s
 l6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=upEp8hl/kvhyOaP5IttMFvt3fWm36jVnMskRhcv5Zsk=;
 b=BaiWnRDhe184mQNj4R9FCtz1xnGGPGud2M/8sWdZCuDhtpSu49/iNbZ0CBHqavibzn
 XBMKJ0PqYATJOzSOErPThQAN0s9xiziILfRdA0fNpENNlS6Ie9vTBo3PzgkteW3BkAoE
 5qcBykL+hSoedRIHbzVeIdJluJCtoAKVr4Rv1QkwOPVppo/ML6nkYsslZrucPYEmOXlJ
 Ki7POATkgJEz+6GiPTMPP2pir8Khn8+pcTBZJIRwW5teoaerdCRiQuvxNqcgLaLTQWPo
 j53JHyQFgEMMVZSN04/4bVqqFgDpPx2EC1cbJBQ7WKuPnUKZ+w5WPdXnhDU97pbjQFIG
 4n7w==
X-Gm-Message-State: APjAAAXnzQhzHsRM/R+GkYHsdu9QFkfo7yUPheBRT05CLH11vocRvATb
 TDyjEWas7nsVeD9ymP5uylDaeQ==
X-Google-Smtp-Source: APXvYqyVElD4pB1vEk1hC+Kw8wCBz6j5MXcKPX1pbthfR5Z1vmDdVDy68/M3hAyrbQ6slwFEa26nLw==
X-Received: by 2002:a63:6d0e:: with SMTP id i14mr71335137pgc.12.1577675364836; 
 Sun, 29 Dec 2019 19:09:24 -0800 (PST)
Received: from localhost.localdomain (59-127-47-126.HINET-IP.hinet.net.
 [59.127.47.126])
 by smtp.gmail.com with ESMTPSA id a23sm50434516pfg.82.2019.12.29.19.09.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Dec 2019 19:09:24 -0800 (PST)
From: Chris Chiu <chiu@endlessm.com>
To: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
 hui.wang@canonical.com, tomas.espeleta@gmail.com
Date: Mon, 30 Dec 2019 11:11:18 +0800
Message-Id: <20191230031118.95076-1-chiu@endlessm.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 linux@endlessm.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3] ALSA: hda/realtek - Enable the bass speaker
	of ASUS UX431FLC
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

ASUS reported that there's an bass speaker in addition to internal
speaker and it uses DAC 0x02. It was not enabled in the commit
436e25505f34 ("ALSA: hda/realtek - Enable internal speaker of ASUS
UX431FLC") which only enables the amplifier and the front speaker.
This commit enables the bass speaker on top of the aforementioned
work to improve the acoustic experience.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---


Notes:
  v2:
   - Use existing alc285_fixup_speaker2_to_dac1 instead of new fixup function
   - Correct the commit hash number in the commit message
   - Remove the redundant fixup ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
  v3:
   - Rename the fixup to align with the naming of ALC289_FIXUP_DUAL_SPK


 sound/pci/hda/patch_realtek.c | 38 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2ee703c2da78..1cd4906a67e1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5905,11 +5905,12 @@ enum {
 	ALC256_FIXUP_ASUS_HEADSET_MIC,
 	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC299_FIXUP_PREDATOR_SPK,
-	ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
 	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
-	ALC294_FIXUP_ASUS_INTSPK_GPIO,
 	ALC289_FIXUP_DELL_SPK2,
 	ALC289_FIXUP_DUAL_SPK,
+	ALC294_FIXUP_SPK2_TO_DAC1,
+	ALC294_FIXUP_ASUS_DUAL_SPK,
+
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -6984,16 +6985,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
-	[ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x14, 0x411111f0 }, /* disable confusing internal speaker */
-			{ 0x19, 0x04a11150 }, /* use as headset mic, without its own jack detect */
-			{ }
-		},
-		.chained = true,
-		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
-	},
 	[ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7004,13 +6995,6 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
-	[ALC294_FIXUP_ASUS_INTSPK_GPIO] = {
-		.type = HDA_FIXUP_FUNC,
-		/* The GPIO must be pulled to initialize the AMP */
-		.v.func = alc_fixup_gpio4,
-		.chained = true,
-		.chain_id = ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
-	},
 	[ALC289_FIXUP_DELL_SPK2] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7026,6 +7010,20 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC289_FIXUP_DELL_SPK2
 	},
+	[ALC294_FIXUP_SPK2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
+	},
+	[ALC294_FIXUP_ASUS_DUAL_SPK] = {
+		.type = HDA_FIXUP_FUNC,
+		/* The GPIO must be pulled to initialize the AMP */
+		.v.func = alc_fixup_gpio4,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_SPK2_TO_DAC1
+	},
+
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7187,7 +7185,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_INTSPK_GPIO),
+	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
