Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2163D84A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 15:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7707616F9;
	Wed, 30 Nov 2022 15:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7707616F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669818871;
	bh=kqN7yEIL5aK5hZMmOejB6TUaETuXCDW/JBGcJIwiaSw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U6jqTSa6gMV8jxa8hlH1fZKum1saNUGpirTM8O9Up7tu8Pj8hW1un0oRggOhe7PQM
	 fuxDftgGZBI12cWokPX2rtVo2KtWloodNClX9n3ZgRXewXKirl6lNtBkvSkth1RAYe
	 MFphjcu/ih3SCCxyUuz5+G4n3xKm2C6hcYLBVVMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18989F803DD;
	Wed, 30 Nov 2022 15:33:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B99F8023A; Wed, 30 Nov 2022 15:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA49BF80166
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 15:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA49BF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="g5TlynBm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="U+/sh+Q5"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E23BC5C010F;
 Wed, 30 Nov 2022 09:33:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Nov 2022 09:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1669818797; x=1669905197; bh=6OMNopQ6AO
 1yMSp4dcUyc2ieJYpLbXyh4HxfIPu+rzo=; b=g5TlynBmgy1w8rj6GB9ATTzkKS
 PJTs9STJY1deatCgHuPjoojcpYgyfeWLQl5zNA0vszPy5sgvBSzGHQcr3HkAhWHx
 Ohc/pI0GGGUjg4nfIMUBR1u3IGsqxcLpPyVjMBh/+/QBEU3Q/KmwZkoCzj/O0XWG
 g8u574u+84+nI64z7hirBgu6DKO2wB6Zbzw///z3FTU5K7eEh6xXKgbomVQf/ywZ
 zZ4MpJTXTLYR0eqFgG77wbSkfXvsZJtqKhUnASRYGUw6A6mTTS1n202R9jMwguS9
 NYMDEVA5iz/5BLbrcP9I6bySahyuvenRYXFlCJSfocQwngtClwNE84mYXDLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1669818797; x=1669905197; bh=6OMNopQ6AO1yMSp4dcUyc2ieJYpLbXyh4Hx
 fIPu+rzo=; b=U+/sh+Q5VIDPoMFbO58vEShvLtJO371JDl3oXLkdBiozHgLyPuX
 rykoI44GYtimFrbSw1H1iujvAqpQUfmYTU0VRIs+TDPxNLlKTSvpp8mXMK1cTKpl
 FRlRQ2M6VPmCbUC1VJdiLqrraLE55/whdZ42ypwihhq0Cyrd2ScoP7B3zycN/2TW
 l0OVHICfhMEWhnm0gkw9zRCxBVyri++qzmKW0LGp8K3dtTQVEb092BAySRE7S+XR
 TSdwrCqMsTpf+UWZprB08tyFltyJMv0aMmHFJBQwUNSVhdLrHdrLL4faY9QLQ071
 weIQkiiB9k+fHjmwc+PSrR+g09lGlQ9Mbsg==
X-ME-Sender: <xms:rWmHY7Cr4CHOyw5q4495eeXdPy4msVW5padhFLmXRVWyoUYAIOFBHg>
 <xme:rWmHYxhWH3W4Sa-2o9QoHYe1vzTdgbXSirxZjDODNFTvp96sVJwbsPYzZtT-GgdLn
 a1bSupXKY7tli0jyrE>
X-ME-Received: <xmr:rWmHY2mQMSs7fUU_7hrYiVcK8zvzqe9Y9jnGY3CQMerFtgcdbkBsdDZ4pvwL6QWFS39fh_tCLv-Qh66512TG_km77RXZ7inZOtd40DTTvkm5XYcWAUxWbF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdefgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkeevteefgeduhe
 ffudfgtedvuedvjeeviedvfeelgedvtdehtedvjefggedvtdeunecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:rWmHY9w-iF_wqwtqvA5TvY6nC_1YBuxoavEQ6qM1gnbem-xYvmT1Ig>
 <xmx:rWmHYwQwkAzsNCINNFFzKtfIkJ9M2aeFwaEAkV-bOfcg-uBqgkm0PA>
 <xmx:rWmHYwamHiFvKg6nrn2wE0Tk1RYAZyj6w6AuHbIx-m1p-UoRcnB_mA>
 <xmx:rWmHY7LJvcQK00VNeagspqjyIJphZ1Pd5YF2y0bDQjqoCF0DxkSk0A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 09:33:16 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: dice: add support for Focusrite Saffire Pro 40 with
 TCD3070 ASIC
Date: Wed, 30 Nov 2022 23:33:13 +0900
Message-Id: <20221130143313.43880-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
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

TC Applied Technologies (TCAT) produces TCD3070 as final DICE ASIC for
communication in IEEE 1394 bus for IEC 61883-1/6 protocol. As long as I
know, latter model of Focusrite Saffire Pro 40 is an application of the
ASIC and only in the market for consumers.

This patchset adds support for the device. The device has several
remarkable points.

1. No support for extended synchronization information section in TCAT
general protocol. The value of GLOBAL_EXTENDED_STATUS register is always
zero. Additionally, NOTIFY_EXT_STATUS message is never emitted.

2. No support for TCAT protocol extension. Hard coding is required for
format of CIP payload.

3. During several seconds after changing sampling rate, the block to
process PCM frames is under disfunction. When starting packet streaming
during the state, the block is never function till configuring different
sampling rate and several seconds.

This commit adds support for the device. The item 1 and 2 can be
adaptable, while item 3 is not. It's not preferable that user process
is forced to sleep during the disfunction in the call of ioctl(2) with
SNDRV_PCM_IOCTL_HW_PARAMS or SNDRV_PCM_IOCTL_PREPARE request. It's
inconvenient but let user configure preferable sampling rate in advance
of starting PCM substream.

The content of configuration ROM in the device I used is available at:
 * https://github.com/takaswie/am-config-roms/

I note that any mixer control operation is implemented by unique
transaction. The frame of request consists of 16 bytes header followed
by payload.

header (4 quadlets):
1st: the type of request, prefixed with 0x8000
2nd: counter at 2 bytes in MSB side, the length of data at 2 bytes in LSB
     side
3rd: parameter 0
4th: parameter 1

payload (variable length if need):
5th-: data according to parameters

The request frame is sent by block write request to 0x'ffff'e040'01c0.

The frame of response is similar to the frame of request, but it is
header only, thus fixed to 16 bytes. The response frame is sent to the
address which is registered by lock transaction to 0x'ffff'e040'0008.

If the operation results in batch of data, the 2nd quadlet of header
includes the length of data like request. The data is itself readable
by read block request to 0x'ffff'e040'0030, which includes both
header and payload for data, thus the length to read should be the
length of data plus 16 bytes for header

The actual value of request, parameter 0, parameter 1, and data is
unclear yet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/Makefile         |  2 +-
 sound/firewire/dice/dice-focusrite.c | 25 +++++++++++++++++++++++++
 sound/firewire/dice/dice.c           | 10 ++++++++++
 sound/firewire/dice/dice.h           |  1 +
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 sound/firewire/dice/dice-focusrite.c

diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
index 9bf7b960a720..a5f3fbf28b8c 100644
--- a/sound/firewire/dice/Makefile
+++ b/sound/firewire/dice/Makefile
@@ -2,5 +2,5 @@
 snd-dice-objs := dice-transaction.o dice-stream.o dice-proc.o dice-midi.o \
 		 dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
 		 dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
-		 dice-harman.o
+		 dice-harman.o dice-focusrite.o
 obj-$(CONFIG_SND_DICE) += snd-dice.o
diff --git a/sound/firewire/dice/dice-focusrite.c b/sound/firewire/dice/dice-focusrite.c
new file mode 100644
index 000000000000..caf9f620c5d0
--- /dev/null
+++ b/sound/firewire/dice/dice-focusrite.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+// dice-focusrite.c - a part of driver for DICE based devices
+//
+// Copyright (c) 2022 Takashi Sakamoto
+//
+// Licensed under the terms of the GNU General Public License, version 2.
+
+#include "dice.h"
+
+int snd_dice_detect_focusrite_pro40_tcd3070_formats(struct snd_dice *dice)
+{
+	// Focusrite shipped several variants of Saffire Pro 40. One of them is based on TCD3070-CH
+	// apart from the others with TCD2220. It doesn't support TCAT protocol extension.
+	dice->tx_pcm_chs[0][0] = 20;
+	dice->tx_midi_ports[0] = 1;
+	dice->rx_pcm_chs[0][0] = 20;
+	dice->rx_midi_ports[0] = 1;
+
+	dice->tx_pcm_chs[0][1] = 16;
+	dice->tx_midi_ports[1] = 1;
+	dice->rx_pcm_chs[0][1] = 16;
+	dice->rx_midi_ports[1] = 1;
+
+	return 0;
+}
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index f75902bc8e74..6036a5edbcb8 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -382,6 +382,16 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.model_id	= 0x000001,
 		.driver_data	= (kernel_ulong_t)snd_dice_detect_harman_formats,
 	},
+	// Focusrite Saffire Pro 40 with TCD3070-CH.
+	// The model has quirk in its GUID, in which model field is 0x000013 and different from
+	// model ID (0x0000de) in its root/unit directory.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_FOCUSRITE,
+		.model_id	= 0x0000de,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_focusrite_pro40_tcd3070_formats,
+	},
 	{
 		.match_flags = IEEE1394_MATCH_VERSION,
 		.version     = DICE_INTERFACE,
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index fd440cc625f9..674f7d552c2e 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -231,5 +231,6 @@ int snd_dice_detect_extension_formats(struct snd_dice *dice);
 int snd_dice_detect_mytek_formats(struct snd_dice *dice);
 int snd_dice_detect_presonus_formats(struct snd_dice *dice);
 int snd_dice_detect_harman_formats(struct snd_dice *dice);
+int snd_dice_detect_focusrite_pro40_tcd3070_formats(struct snd_dice *dice);
 
 #endif
-- 
2.37.2

