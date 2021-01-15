Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D62F714A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 04:58:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D012716EA;
	Fri, 15 Jan 2021 04:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D012716EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610683093;
	bh=qdi3vD2CGT5FgFeWhai8/Cdz2N85nV76880A3F5cN3w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YmsxS8VvjM/aV7e6JnMjfxvpsmGDiNW4gfi/EnQDDA4AnP/MNEDJPyMSU2ceAm0vM
	 u+zMzrwSvTHCO5qfVOs52Xe3993+feSzdYx31pfeUZJKzdOyZn0zxGlcRUvmVwOW90
	 AQGdethIRw9RKVkg11JP/wn8PDytTi9LaMqGgAac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C93AF80113;
	Fri, 15 Jan 2021 04:56:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 810D0F801ED; Fri, 15 Jan 2021 04:56:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAED4F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 04:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAED4F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WMoXVE7a"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Z4385neT"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FBC15C00C6;
 Thu, 14 Jan 2021 22:56:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 22:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=nZ5U2VXhrdG9UY+UIVhPFqerdo
 akNxOHCRVsnHjs3Cc=; b=WMoXVE7a4P2u5qP5piOIFjV/W4LwMfybrBXBY5z2Ld
 GlH6BbzCrzJ3eiapotn4AehRTCEiIxIiNFevLYQoWljjSDa9/XiKK3ytptqH/qjh
 Ryh085aS2aUaSA1PmaVcC8FYSq4Q+ynYjGtSebmiCr0xcNWH2qN3jY40B1FYlAVH
 +MV0qrkFsGIPfzO5pEr4xozlMh6z/8DXJ8J1tIAyCGsEAhXjKCY5JwTqR/1E2lqo
 qcitsARimPG084Rx70Sgt87J170fF/w3dwa2DRs4Un7frCXTse5DokqN6vGHMTC0
 J3ZP+8znjl+XjQFuxoFP/H3YkWDOi0l2fpnQsmCXp6/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nZ5U2VXhrdG9UY+UI
 VhPFqerdoakNxOHCRVsnHjs3Cc=; b=Z4385neTecSRaKFXMfu4DQMzhqeEpMagc
 zMvlA9/Z6jiXVVFK2+lqAVeFf5Vs74jPveZQt6AQBd6rSOdcl/Fc3B2xt5xdHe35
 yl/yItBC8ocIuSKwoH3fu3dNLf3bSuHRMJN4yReRvOCoHRlclIrp/XnHpN8U+sZw
 SkIEiFZQtpwZ4TXrlIBrOqdAdKpXmedoxBsVSR4+fdoJK/Xnxq5qXhTAmnJQsCn9
 x8DiYjn21qoWWug2K6iEeQ77Q3QPr4E9V079dE+WPj2epd98ecC3JLbUluEIgePc
 3usdzFkDVzTtDS8d8p/DwlXk6wBG2HD6tqUPP0KIV6PefGZS/Kv6g==
X-ME-Sender: <xms:axIBYFnIcnLDHmnRK_bWd0jYkW6OVDqf-nOuRANsE0asBDDOd8zcsw>
 <xme:axIBYA1g4QImyVaWHfTzk_uOEBMiRr-zg3EN3GCKDyh7e1Z9Pw40Ku-TzeqK1mZJn
 Zwq5NcfiBGUK6LKVss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepuddukedrvdeg
 fedrjeekrdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:axIBYLrrnX-mblDQD_1mMd5s1cqZfZmd3DLJcMnOFd7jte1nsCOMUA>
 <xmx:axIBYFnmYRhlbgIyAMJUm4k1WUCk8p3Dgb-st5CV8woPBc_JKKcT8g>
 <xmx:axIBYD3O8hqScsJJEzL_MXQw4l-VI17C8MBCQyl90g10TQa8nZquog>
 <xmx:bBIBYA8G80hZwFiQCLZT7-yXAYhKlxVM_VT94JbfrX7cy2_E_ny0gg>
Received: from workstation.flets-east.jp (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 665551080067;
 Thu, 14 Jan 2021 22:56:26 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: dice: add support for Lexicon I-ONIX FW810s
Date: Fri, 15 Jan 2021 12:56:23 +0900
Message-Id: <20210115035623.148580-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

I-ONIX FW810s was shipped in Lexicon brand of HARMAN International
industries, Inc 2009. The model uses TCD2220 ASIC as its communication
engine. TCAT general protocol is supported, its extension isn't.

This patch adds support for the model with hard-coded stream formats.

$ python3 ~/git/linux-firewire-utils/src/crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04042b91  bus_info_length 4, crc_length 4, crc 11153
404  31333934  bus_name "1394"
408  e0008102  irmc 1, cmc 1, isc 1, bmc 0, cyc_clk_acc 0, max_rec 8 (512)
40c  000fd720  company_id 000fd7     |
410  007d7ecf  device_id 20007d7ecf  | EUI-64 000fd720007d7ecf

               root directory
               -----------------------------------------------------------------
414  00064c2d  directory_length 6, crc 19501
418  03000fd7  vendor
41c  8100000a  --> descriptor leaf at 444
420  17000001  model
424  8100000d  --> descriptor leaf at 458
428  0c0087c0  node capabilities per IEEE 1394
42c  d1000001  --> unit directory at 430

               unit directory at 430
               -----------------------------------------------------------------
430  000438f2  directory_length 4, crc 14578
434  12000fd7  specifier id
438  13000001  version
43c  17000001  model
440  8100000d  --> descriptor leaf at 474

               descriptor leaf at 444
               -----------------------------------------------------------------
444  000489d5  leaf_length 4, crc 35285
448  00000000  textual descriptor
44c  00000000  minimal ASCII
450  4c657869  "Lexi"
454  636f6e00  "con"

               descriptor leaf at 458
               -----------------------------------------------------------------
458  0006594b  leaf_length 6, crc 22859
45c  00000000  textual descriptor
460  00000000  minimal ASCII
464  492d4f4e  "I-ON"
468  49585f46  "IX_F"
46c  57383130  "W810"
470  53000000  "S"

               descriptor leaf at 474
               -----------------------------------------------------------------
474  0006594b  leaf_length 6, crc 22859
478  00000000  textual descriptor
47c  00000000  minimal ASCII
480  492d4f4e  "I-ON"
484  49585f46  "IX_F"
488  57383130  "W810"
48c  53000000  "S"

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/Makefile      |  3 ++-
 sound/firewire/dice/dice-harman.c | 26 ++++++++++++++++++++++++++
 sound/firewire/dice/dice.c        | 12 ++++++++++++
 sound/firewire/dice/dice.h        |  1 +
 4 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 sound/firewire/dice/dice-harman.c

diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
index 7a62dafd0f78..9bf7b960a720 100644
--- a/sound/firewire/dice/Makefile
+++ b/sound/firewire/dice/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-dice-objs := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
 		 dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
-		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o
+		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
+		 dice-harman.o
 obj-$(CONFIG_SND_DICE) += snd-dice.o
diff --git a/sound/firewire/dice/dice-harman.c b/sound/firewire/dice/dice-harman.c
new file mode 100644
index 000000000000..a8ca00c397e8
--- /dev/null
+++ b/sound/firewire/dice/dice-harman.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+// dice-harman.c - a part of driver for DICE based devices
+//
+// Copyright (c) 2021 Takashi Sakamoto
+//
+// Licensed under the terms of the GNU General Public License, version 2.
+
+#include "dice.h"
+
+int snd_dice_detect_harman_formats(struct snd_dice *dice)
+{
+	int i;
+
+	// Lexicon I-ONYX FW810s supports sampling transfer frequency up to
+	// 96.0 kHz, 12 PCM channels and 1 MIDI channel in its first tx stream
+	// , 10 PCM channels and 1 MIDI channel in its first rx stream for all
+	// of the frequencies.
+	for (i = 0; i < 2; ++i) {
+		dice->tx_pcm_chs[0][i] = 12;
+		dice->tx_midi_ports[0] = 1;
+		dice->rx_pcm_chs[0][i] = 10;
+		dice->rx_midi_ports[0] = 1;
+	}
+
+	return 0;
+}
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 06c94f009dfb..107a81691f0e 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -20,10 +20,12 @@ MODULE_LICENSE("GPL v2");
 #define OUI_MYTEK		0x001ee8
 #define OUI_SSL			0x0050c2	// Actually ID reserved by IEEE.
 #define OUI_PRESONUS		0x000a92
+#define OUI_HARMAN		0x000fd7
 
 #define DICE_CATEGORY_ID	0x04
 #define WEISS_CATEGORY_ID	0x00
 #define LOUD_CATEGORY_ID	0x10
+#define HARMAN_CATEGORY_ID	0x20
 
 #define MODEL_ALESIS_IO_BOTH	0x000001
 
@@ -56,6 +58,8 @@ static int check_dice_category(struct fw_unit *unit)
 		category = WEISS_CATEGORY_ID;
 	else if (vendor == OUI_LOUD)
 		category = LOUD_CATEGORY_ID;
+	else if (vendor == OUI_HARMAN)
+		category = HARMAN_CATEGORY_ID;
 	else
 		category = DICE_CATEGORY_ID;
 	if (device->config_rom[3] != ((vendor << 8) | category) ||
@@ -388,6 +392,14 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.model_id	= 0x000008,
 		.driver_data	= (kernel_ulong_t)snd_dice_detect_presonus_formats,
 	},
+	// Lexicon I-ONYX FW810S.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_HARMAN,
+		.model_id	= 0x000001,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_harman_formats,
+	},
 	{
 		.match_flags = IEEE1394_MATCH_VERSION,
 		.version     = DICE_INTERFACE,
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index 7fbffcab94c2..adc6f7c84460 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -233,5 +233,6 @@ int snd_dice_detect_alesis_mastercontrol_formats(struct snd_dice *dice);
 int snd_dice_detect_extension_formats(struct snd_dice *dice);
 int snd_dice_detect_mytek_formats(struct snd_dice *dice);
 int snd_dice_detect_presonus_formats(struct snd_dice *dice);
+int snd_dice_detect_harman_formats(struct snd_dice *dice);
 
 #endif
-- 
2.27.0

