Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D513A7433A0
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 06:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C289A846;
	Fri, 30 Jun 2023 06:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C289A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688099649;
	bh=y+fYXJGrs8+d26IldMA2D8R2ZVVdwP6WvSgae8tPrqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RBiX+PO2t+bmJ0WaQWmE2oQE7qlfpjPe4M/caO2H8+6hny6kO61ssfd6GVsR+Z5ox
	 +DLf3+ogwa2AnR93vMcyBVUtFyvVKJ+/xv+7plKREteN4YZBrVkqCLds2MNLjyjh57
	 38lo7bvWqyc3SXz0BLPGBUzAP91E+f9BJ7H+qkwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 732D4F8056F; Fri, 30 Jun 2023 06:32:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2163DF80544;
	Fri, 30 Jun 2023 06:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67FC2F80246; Fri, 30 Jun 2023 06:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49BCDF800E3
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 06:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BCDF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=kEVaCU9L;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CQC9bYWO
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 11FA73200919;
	Fri, 30 Jun 2023 00:31:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 30 Jun 2023 00:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1688099484; x=
	1688185884; bh=57Ar0Z5PkxbqAqRL5TUEKObulBq/y5OcnzsbzdU1dqs=; b=k
	EVaCU9L8TcBJEXEjy4j6/kDMx3ovkQfVH1L3UxSlsCsB6DRIW2qwowroKZXtGI8t
	ATxwJ7hhOfl319ZMSwNlFkA6lZsCgOVyAecUcLGK8LJZpXXl2gwX3NLxpJBUDRhB
	3y8qWqeEaH2x6vYL5Kh4zSMZ8gcHWjGpOORqJVfgGeoKjhoICfdXJAXM0BaeiwsZ
	UfZkL/UU5Vsp6hBwRvcyuqv4EcpqneUI0WajS+8zXsCPKo/F0VMOwXxP7rjc7Vcp
	2G/SrRZhI5cZqDvZLXwI5bVV2bBXt/IgNk26Yo1v68gbax+dDTgm14wfvt9NnsKT
	iQfDUo1R8e0yHvGQhgYTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1688099484; x=
	1688185884; bh=57Ar0Z5PkxbqAqRL5TUEKObulBq/y5OcnzsbzdU1dqs=; b=C
	QC9bYWOtt44Iugn9iaKLWfi21LPBNG/sNzLTo7zrHt8XHLDtqtvax52atVVH1mVS
	eug1IjAxjh0SVYThOl0gx2EfWuXGyVUUpPwpILfLmzm03oDB5S2FhU3GFLiZNeeX
	QKvXhlBqW7XqGzVBazXqsEDfMDlrd372OQrQhFEHMLAZI0qNrzu9H0huhguOBWbQ
	sVwEkBO7HfNwGmbnHYfvs0nK3I/Ga4oIADC6FBnajxqaRWIOETIu/qMBRVqdWVio
	yf01Lqh0eaJZGiJbU9LV31NrXTx9IRIRyRIr2usqIOekW+wruWezQjOlomuGPeyb
	7e4b598VcbTsZSwk1m72w==
X-ME-Sender: <xms:m1qeZOXuqwNSzKHfWIXHwWWhOg9wYQMjOS2qMwJZYs-_9SA652AJVw>
    <xme:m1qeZKmR6CGvZOy_kmX_Or6v4nxPIcqRf0SEaWhSBU0y7oiyLIFZRZ4hX2hqRlQGt
    3WPxufPE0GG0GejZdI>
X-ME-Received: 
 <xmr:m1qeZCYzEDC2ZkkgbX61-mtNUSkswAPa9wnMn-gSNnwZfcMUFTpf9TgKEfrZ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugf
    fgleeltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:m1qeZFVXxWQNw3WUn7ruHd_K98JG3RLw9t0fnlNetgfBcGSlhXnL5g>
    <xmx:m1qeZIlRHKnO-lsLTOr4X5khCBPwpUza8W3O2jKRRoSE5pKAFNSbTA>
    <xmx:m1qeZKdpgus0NTfQi-hBSNex79jdG3jRkFTHhhS7X-ngNJ-q9hWAYg>
    <xmx:nFqeZHs46kx8GTvnjXA1YrdhXFhKqHQlXVuAN9m5-nyfojOS6EBnmA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 00:31:21 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tangmeng@uniontech.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH 1/2] ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
Date: Fri, 30 Jun 2023 16:31:05 +1200
Message-ID: <20230630043106.914724-2-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630043106.914724-1-luke@ljones.dev>
References: <20230630043106.914724-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XZFN4PPU6ZGCFNINGNAKP5IZ7LCABRFR
X-Message-ID-Hash: XZFN4PPU6ZGCFNINGNAKP5IZ7LCABRFR
X-MailFrom: luke@ljones.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZFN4PPU6ZGCFNINGNAKP5IZ7LCABRFR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GV601V series.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dabfdecece26..1c26f24b1246 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5883,7 +5883,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		alc255_set_default_jack_type(codec);
-	} 
+	}
 	else
 		alc_fixup_headset_mode(codec, fix, action);
 }
@@ -7065,6 +7065,8 @@ enum {
 	ALC285_FIXUP_SPEAKER2_TO_DAC1,
 	ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1,
 	ALC285_FIXUP_ASUS_HEADSET_MIC,
+	ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_I2C_HEADSET_MIC,
 	ALC280_FIXUP_HP_HEADSET_MIC,
 	ALC221_FIXUP_HP_FRONT_MIC,
 	ALC292_FIXUP_TPT460,
@@ -8051,6 +8053,22 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1
 	},
+	[ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_CS35L41_I2C_2
+	},
+	[ALC285_FIXUP_ASUS_I2C_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1
+	},
 	[ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9525,6 +9543,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
+	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650P", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.41.0

