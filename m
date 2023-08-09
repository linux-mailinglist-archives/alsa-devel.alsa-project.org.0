Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E66B774FCB
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 02:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51D9E88;
	Wed,  9 Aug 2023 02:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51D9E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691540870;
	bh=GiJTatH4BYZVMsecbKqkWIEI/eqEn/Lnpb78rEeXOIY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jsR6oP8zsPCnbXlPZyhyA3ANB5VakthxMJ7/NdMb38Fsoh9VbLCTbg7+voLyH16B/
	 CtCNSJsKphSSnzpKVEYdh9MIqstA6FkXkeedk82g08g9/T/S61RTblIC3tyrhAjtHi
	 UNvnH/5CtPVHYYldtPJ8y9oXeAnIvki1gouiUBSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35FFFF80551; Wed,  9 Aug 2023 02:26:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDDCF80116;
	Wed,  9 Aug 2023 02:26:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A34C0F80134; Wed,  9 Aug 2023 02:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3FDDF800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 02:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3FDDF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=ZCFXKbMG;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kauL0Kyi
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 225B73200495;
	Tue,  8 Aug 2023 20:26:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 08 Aug 2023 20:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691540796; x=1691627196; bh=rR
	tqgDjSHC6zpSdxLBWeeLdRL13mgci/pWM9aygzqjE=; b=ZCFXKbMGVC+9vMvS+p
	MYKGppvRc8G+6h1Iz3WMb2Y8EdVeJRoWr66q7ScI43yYoIDKhm76gUKIiJarWX9q
	a5gMwMRaWnVscbAmKM77UkeONDHE5YI5XW9Dm51E6A46YxP+RqSkPWV5Gq5PTVQZ
	v9I5ph2GLFC63n/Tp1zut3jyhyTsgbM1+8cueTdz3+wquY0vS2VI3Sud4AOhZ+3o
	smCSOpQ/hZwjTIk64XV/OogO0XdY8mD1+SaRpMtpnDtP8nskhC4wDdwNMtacP+o4
	avOSOqjUYBXAyoP287NvCVOqJ4ykfl8q3Gwyd4aA5ftsssVLFDv3ASxRYAiFHHBd
	Xfeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691540796; x=1691627196; bh=rRtqgDjSHC6zp
	SdxLBWeeLdRL13mgci/pWM9aygzqjE=; b=kauL0Kyimpe6nzr7+N8sUdWWwc/+0
	nNPeVmBRKXSg0czqupSLb21CH2fqmeUfoYDInw0CYEZFOaye2IHk4iJaxj2GNnm4
	8IDeo87JNCUKcIET3Pik00P9Q4uFJwWQcYYg9qHDfCiY8Xg5GNlRoL1igD9AJ/TV
	rY/pfyA9tCG0jel4WJ2eNoTn+9azMLWhLb4G4ImUNKJCmF/cKm0W9JXkZcBVAmfV
	bNCf/eFLyGJw35Oku9P54BQU/NbPWe7UvaVDP1Jnttn2/VdK2sZVoyzy613jleRY
	sKPuNCLAj13eHqjkPE0EDTV4stNF0o4xZz0JA4uoro9fq7HOHTV0L56xQ==
X-ME-Sender: <xms:PN3SZGDlrjsXCQCOcNt7ho9556wk2TxPEIa4QBrg-6pK8st20JKuPw>
    <xme:PN3SZAgGAohsEBZh1Kw5tJKh14sFwpUY5pXD7aCh9eJfiUL-gxxEMNVZGEvOjUgL-
    T-S6HFCk4ItMeZZSpI>
X-ME-Received: 
 <xmr:PN3SZJkZCDFawlSvpeE6jp0L2TCKWk8GnyjTVFcyvcDXq6Hy_7AHIz0t3SpRrBgNTocIq16l3TESVQsZuPyrLddrRaC0ZagpCBjsbaRaHAvM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrleefgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhi
    ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
    enucggtffrrghtthgvrhhnpeffvdeuleffveekudfhteejudffgefhtedtgfeutdfgvdfg
    ueefudehveehveekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:PN3SZEzIYbMNf_IOiIW2snvs2insnWot5h9dQlo66OMRjVi0jHQkAQ>
    <xmx:PN3SZLRU6gR4xokaj9eiCiIYcUQAyrfNnE2f6u3cUVGfoU5qSC88Cw>
    <xmx:PN3SZPZktk40lbn8wtdXjTLIwWu8S9dgAsimboCeJlmef3MpQ59z1w>
    <xmx:PN3SZGfEn_OX4KwaGMAyOkh4q0mG9zzvThO-QUuvrMpHgIRgEDJuLw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Aug 2023 20:26:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
Subject: [PATCH] ALSA: dice: add stream format parameters for Weiss devices
Date: Wed,  9 Aug 2023 09:26:31 +0900
Message-Id: <20230809002631.750120-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MU2BHMJJBH23T4JMWNRGQHYDYTAHS5CX
X-Message-ID-Hash: MU2BHMJJBH23T4JMWNRGQHYDYTAHS5CX
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MU2BHMJJBH23T4JMWNRGQHYDYTAHS5CX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch is for kernel prepatch v6.5.

Hard-coded stream format parameters are added for Weiss Engineering
FireWire devices. When the device vendor and model match, the parameters
are copied into the stream format cache. This allows for setting all
supported sampling rates up to 192kHz, and consequently adjusting the
number of available I/O channels.

Signed-off-by: Rolf Anderegg <rolf.anderegg@weiss.ch>
Signed-off-by: Michele Perrone <michele.perrone@weiss.ch>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/Makefile     |   2 +-
 sound/firewire/dice/dice-weiss.c | 104 +++++++++++++++++++++++++++++++
 sound/firewire/dice/dice.c       |  63 +++++++++++++++++++
 sound/firewire/dice/dice.h       |   1 +
 4 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 sound/firewire/dice/dice-weiss.c

diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
index a5f3fbf28b8c..bac8712f9014 100644
--- a/sound/firewire/dice/Makefile
+++ b/sound/firewire/dice/Makefile
@@ -2,5 +2,5 @@
 snd-dice-objs := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
 		 dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
 		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
-		 dice-harman.o dice-focusrite.o
+		 dice-harman.o dice-focusrite.o dice-weiss.o
 obj-$(CONFIG_SND_DICE) += snd-dice.o
diff --git a/sound/firewire/dice/dice-weiss.c b/sound/firewire/dice/dice-weiss.c
new file mode 100644
index 000000000000..129d43408956
--- /dev/null
+++ b/sound/firewire/dice/dice-weiss.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+// dice-weiss.c - a part of driver for DICE based devices
+//
+// Copyright (c) 2023 Rolf Anderegg and Michele Perrone
+
+#include "dice.h"
+
+struct dice_weiss_spec {
+	unsigned int tx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT];
+	unsigned int rx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT];
+};
+
+// Weiss DAC202: 192kHz 2-channel DAC
+static const struct dice_weiss_spec dac202 = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss MAN301: 192kHz 2-channel music archive network player
+static const struct dice_weiss_spec man301 = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss INT202: 192kHz unidirectional 2-channel digital Firewire nterface
+static const struct dice_weiss_spec int202 = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss INT203: 192kHz bidirectional 2-channel digital Firewire nterface
+static const struct dice_weiss_spec int203 = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss ADC2: 192kHz A/D converter with microphone preamps and line nputs
+static const struct dice_weiss_spec adc2 = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss DAC2/Minerva: 192kHz 2-channel DAC
+static const struct dice_weiss_spec dac2_minerva = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss Vesta: 192kHz 2-channel Firewire to AES/EBU interface
+static const struct dice_weiss_spec vesta = {
+	.tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+	.rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+};
+
+// Weiss AFI1: 192kHz 24-channel Firewire to ADAT or AES/EBU interface
+static const struct dice_weiss_spec afi1 = {
+	.tx_pcm_chs = {{24, 16, 8}, {0, 0, 0} },
+	.rx_pcm_chs = {{24, 16, 8}, {0, 0, 0} },
+};
+
+int snd_dice_detect_weiss_formats(struct snd_dice *dice)
+{
+	static const struct {
+		u32 model_id;
+		const struct dice_weiss_spec *spec;
+	} *entry, entries[] = {
+		{0x000007, &dac202},
+		{0x000008, &dac202}, // Maya edition: same audio I/O as DAC202.
+		{0x000006, &int202},
+		{0x00000a, &int203},
+		{0x00000b, &man301},
+		{0x000001, &adc2},
+		{0x000003, &dac2_minerva},
+		{0x000002, &vesta},
+		{0x000004, &afi1},
+	};
+	struct fw_csr_iterator it;
+	int key, val, model_id;
+	int i;
+
+	model_id = 0;
+	fw_csr_iterator_init(&it, dice->unit->directory);
+	while (fw_csr_iterator_next(&it, &key, &val)) {
+		if (key == CSR_MODEL) {
+			model_id = val;
+			break;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
+		entry = entries + i;
+		if (entry->model_id == model_id)
+			break;
+	}
+	if (i == ARRAY_SIZE(entries))
+		return -ENODEV;
+
+	memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
+	       MAX_STREAMS * SND_DICE_RATE_MODE_COUNT * sizeof(unsigned int));
+	memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
+	       MAX_STREAMS * SND_DICE_RATE_MODE_COUNT * sizeof(unsigned int));
+
+	return 0;
+}
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 6c93e6e4982c..d362e4251c68 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -392,6 +392,69 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.model_id	= 0x0000de,
 		.driver_data	= (kernel_ulong_t)snd_dice_detect_focusrite_pro40_tcd3070_formats,
 	},
+	// Weiss DAC202: 192kHz 2-channel DAC
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000007,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss DAC202: 192kHz 2-channel DAC (Maya edition)
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000008,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss MAN301: 192kHz 2-channel music archive network player
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x00000b,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss INT202: 192kHz unidirectional 2-channel digital Firewire face
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000006,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss INT203: 192kHz bidirectional 2-channel digital Firewire face
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x00000a,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss ADC2: 192kHz A/D converter with microphone preamps and inputs
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000001,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss DAC2/Minerva: 192kHz 2-channel DAC
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000003,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss Vesta: 192kHz 2-channel Firewire to AES/EBU interface
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000002,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
+	// Weiss AFI1: 192kHz 24-channel Firewire to ADAT or AES/EBU face
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_WEISS,
+		.model_id	= 0x000004,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_weiss_formats,
+	},
 	{
 		.match_flags = IEEE1394_MATCH_VERSION,
 		.version     = DICE_INTERFACE,
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index 674f7d552c2e..4c0ad7335998 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -232,5 +232,6 @@ int snd_dice_detect_mytek_formats(struct snd_dice *dice);
 int snd_dice_detect_presonus_formats(struct snd_dice *dice);
 int snd_dice_detect_harman_formats(struct snd_dice *dice);
 int snd_dice_detect_focusrite_pro40_tcd3070_formats(struct snd_dice *dice);
+int snd_dice_detect_weiss_formats(struct snd_dice *dice);
 
 #endif
-- 
2.39.2

