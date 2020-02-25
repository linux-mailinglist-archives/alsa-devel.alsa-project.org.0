Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304616BAAF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 08:32:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3227168F;
	Tue, 25 Feb 2020 08:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3227168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582615938;
	bh=lrJpVntXrlb5Wnbrzsf32BCJCxvDECVLZeK7HLhKawQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OHODSUQTjAJnyvO2GQMN+bygK1jQipRuPR0yUxtst9r92j43UQicBUw3+ozKCi7tr
	 nNUBlzzHzh5Q0cBjz2lt4ymWO8eSBHd6YfabgrAVZt3JsBgLXe/eChonNWUjFTkpwT
	 qcCyJlMfIeP5jOZ55FquebRtgLw/NPIJQ3sOgNdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B34DEF80143;
	Tue, 25 Feb 2020 08:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F3CEF80142; Tue, 25 Feb 2020 08:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF4A0F800AD
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 08:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF4A0F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="QTiTs3ao"
Received: by mail-pg1-x541.google.com with SMTP id t24so2058464pgj.7
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E829NU76QDF3cP/NsyErXF/fNnm7bAZiWaUr7fUocZ8=;
 b=QTiTs3aoEEiRq3DT0rUxnmFQocgrrfwNw1ly2CM7jAB6Z81aRWuSBtnCqw+Tt8oY1Q
 +auweEAILHLb6ZWPUWiZErDojNz6vcZ+I5Ip45q5dna8/Of5jGzziSqbFtPZkVndOrTm
 DKOSyjrdGGIIGeT/HH4KFmvW8ZtjX1PFCzR1uRi4pdDc4XFut+Jtl8thk/LSyn6dWcVH
 yA/0wjuouCUKi33ywydJR9L3xdPEQMq+lr6ZzmW8TjrM8LJ3cR00TULafnOY27yZeXLd
 rhGArS8UOg+Shp7IcB3T8Zx1uEztrfbJxKDjAWkRJ5lFq6S0FwPQxcQURr6pF9GLAdIV
 My/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E829NU76QDF3cP/NsyErXF/fNnm7bAZiWaUr7fUocZ8=;
 b=m6tn26IiEyxl5bAjyL2Z68ExUKD07eoM5XJlSNGFdDJg8yp+Fb5yX1ZoOAlcuNFWge
 27lUu6F4WVQa2pkIdPL6QrJ2H1ouadeFWXEII8ZibJhnZJn3u2lKUCUjuU84nPknWbv/
 AInA3K1Ls+16bYs0a0Lsfb19Ze/ybwXq4mZTo5n92r+rO893dMR75g3XDqs4AXxxlokO
 FeYuk6jqOC7slSpLyjrl6ww6/2S0mSxyjv4i2e0BzxIJai55ieehDRBGYRlzMwKOLlx3
 N/gpaStRnaMiHb5RKBjU4Ap9CqUUGNu0pzoj3RlHeGWraOIP+Y6xjd8itOBPi+6rc3GT
 zyCw==
X-Gm-Message-State: APjAAAVlBdZiNw9UmVTZdst0q7Ace8rqmXKmHuSF5uFLLJVi8gKVxDWd
 d4dmCzSbTY9x4mGvfulixSTYzw==
X-Google-Smtp-Source: APXvYqzXPXVTEmI4sSnMC//AihHYA7770hDbD0z2yO5l63QvCrokdmPOorLFdPHTa0VvcKMZjmxfeg==
X-Received: by 2002:aa7:8e88:: with SMTP id a8mr33713851pfr.254.1582615825187; 
 Mon, 24 Feb 2020 23:30:25 -0800 (PST)
Received: from starnight.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id s13sm1796960pjp.1.2020.02.24.23.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 23:30:24 -0800 (PST)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek - Enable the headset of ASUS B9450FA with
 ALC294
Date: Tue, 25 Feb 2020 15:29:21 +0800
Message-Id: <20200225072920.109199-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.25.1
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

A headset on the laptop like ASUS B9450FA does not work, until quirk
ALC294_FIXUP_ASUS_HPE is applied.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
Singed-off-by: Kailang Yang <kailang@realtek.com>
---
 sound/pci/hda/patch_realtek.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 477589e7ec1d..a47f6404aea9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5920,7 +5920,7 @@ enum {
 	ALC289_FIXUP_DUAL_SPK,
 	ALC294_FIXUP_SPK2_TO_DAC1,
 	ALC294_FIXUP_ASUS_DUAL_SPK,
-
+	ALC294_FIXUP_ASUS_HPE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7040,7 +7040,17 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_SPK2_TO_DAC1
 	},
-
+	[ALC294_FIXUP_ASUS_HPE] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* Set EAPD high */
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0f },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7774 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7204,6 +7214,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
-- 
2.25.1

