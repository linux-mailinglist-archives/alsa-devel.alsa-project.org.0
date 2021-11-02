Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E1443481
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 18:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFFFF1684;
	Tue,  2 Nov 2021 18:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFFFF1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635873766;
	bh=oPNyFDFEavlYhh+uBMhhS1JfX+P5eQdxkOMSZXBmZpc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F+0TVPNF+GmuDZ1qdKaYFW4L1Qxxri/ritkjVK2dh8gTzAYF1FSyYUpzYa4FfbOpU
	 tC7UXPvzExtQBlv8DkSazSbczy0nznQyEfztayHP8/8oLZUwgJPVDLFHSpuCPxbtis
	 yWnL4LNPa4vEXbYdBZkARYNMPzpwivse/IKD9HNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43884F80224;
	Tue,  2 Nov 2021 18:21:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC845F8025D; Tue,  2 Nov 2021 18:21:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7847DF80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 18:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7847DF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LIrVszqK"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 63AEC3201E12;
 Tue,  2 Nov 2021 13:21:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 02 Nov 2021 13:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=j0XaeWJ9QjBeyOHPR
 cij4rx57iHVrHerLWqXXNWU/GY=; b=LIrVszqKNzTG8A5ZSJ3ncw7ybCP/9+6io
 3jh81Pes+B5JBdExC7WTMej4ox4IeKtASWN+lE8DHLYcPcD9SCy2gwJJGrZEXiCu
 OmeQoxYo9o/2sCo4CakC10/bH8Gce5n3FUrPXZWOHJIJcdjv6YDFkQjfqZIs+mBE
 3eioulBM69SIs0L9OD2oqfWAJ17b72r9XB+ZrtG16JlZ1IV2RCmMj8cu5GrLN80h
 51PSUKcH/ML9VH/SoXLL40w95QXUcEfW5hDr8OxhZ9a8gpLuFia2NqFVJOwrxwgX
 xQ7pactYg98CA+H9UQWK6R2Kp7CruqjGvVKb2vNnF/7LIvFwhw2tw==
X-ME-Sender: <xms:gnOBYascgycmZz1RN7XBcf1ybNQbc3tASZixDYjUqMXhm-GGh8IhtA>
 <xme:gnOBYffyLp5FnKxJgFv7ulQ2W1tM_e1xoCKFN66QrQIgeCfCtiZx0HtOXcspx9Ykd
 UaZS-Rokuhzb78cNQ>
X-ME-Received: <xmr:gnOBYVy1W63TVBIjuUh8_BRB-GZul0sS7JaEtL8aLl2qF8uLU3RrprgPmWgLcXFIZdNpNH1jRTQcukXBYAdgi_3wuAWxxCjhsqUMhF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcuvehrrgif
 fhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenucggtffrrg
 htthgvrhhnpeeguefghfeigeelvddutdegtdeitedvffekledtjefhjeevgfetgfelteet
 heefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 httghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:gnOBYVNMsHLJE8V5qUETzNv0XMZkdYRZgJUKNj1qPr-p2H-l1eK8uA>
 <xmx:gnOBYa_VasyT8VlN-QBR15VWg7gDOiL-15RCuv4RAuWPHtBl2J6CXg>
 <xmx:gnOBYdXRskXIhdGi85hET9asxr-rN9zoaxwPqqRMA0WikS3TYt_aRw>
 <xmx:gnOBYcJJkwR66do32myMQ8hGIB39rBEnbN-dT7vUb7LPCLLTwMZIRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 13:21:06 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Headset fixup for Clevo NH77HJQ
Date: Tue,  2 Nov 2021 11:21:04 -0600
Message-Id: <20211102172104.10610-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: productdev@system76.com, Jeremy Soller <jeremy@system76.com>,
 tiwai@suse.com
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

From: Jeremy Soller <jeremy@system76.com>

On Clevo NH77HJ, NH77HP, and their 15" variants, there is a headset
microphone input attached to 0x19 that does not have a jack detect. In
order to get it working, the pin configuration needs to be set
correctly, and a new ALC256_FIXUP_HEADSET_MODE_NO_HP_MIC fixup is
applied. This is similar to the existing System76 quirk for ALC293, but
for ALC256.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a3e2fe42106..e6b266416393 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6739,6 +6739,7 @@ enum {
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_TONGFANG_RESET_PERSISTENT_SETTINGS,
+	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8450,6 +8451,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_gpio_led,
 	},
+	[ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11120 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8750,11 +8760,15 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x40a1, "Clevo NL40GU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x40c1, "Clevo NL40[CZ]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x40d1, "Clevo NL41DU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x5015, "Clevo NH5[58]H[HJK]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x5017, "Clevo NH7[79]H[HJK]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50a3, "Clevo NJ51GU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50b3, "Clevo NK50S[BEZ]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50b6, "Clevo NK50S5", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50b8, "Clevo NK50SZ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50d5, "Clevo NP50D5", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x50e1, "Clevo NH5[58]HPQ", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x50e2, "Clevo NH7[79]HPQ", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50f0, "Clevo NH50A[CDF]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50f2, "Clevo NH50E[PR]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x50f3, "Clevo NH58DPQ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.31.1

