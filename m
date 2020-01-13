Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB36D138D39
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 09:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6768215E0;
	Mon, 13 Jan 2020 09:49:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6768215E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578905447;
	bh=imguVCRxFKALYYcyXeJvyju+FvgPgqvOWBsBBDKFVuw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nO3XpZcrO0ARfSPm2faCH7uHRX5/TGJ6/1C/WY8tLLXBlzQ0tEORhSTywSxbc7eNo
	 xuyDsUtvkDcwENCrDESUXuHzy9GqylQhXKkzTN2ix4cJR0ryY7YLPeBU6RSNHrhqfe
	 NG56b8fxI/RvNkU/+Pz7BkOBd+IeI4iLtinPCTnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7121F8028B;
	Mon, 13 Jan 2020 09:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 671C3F801F7; Mon, 13 Jan 2020 09:46:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C0A5F801F7
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 09:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C0A5F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="uHcMwzC6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KwVirmWj"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 20ADD21C29;
 Mon, 13 Jan 2020 03:46:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 03:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=BsyZbZCrzJkjx
 nB3ZVt/jUv7SRpCLvPP/Oiq/RXnzm4=; b=uHcMwzC6rVBvhuCWb0QL0AuDObD/m
 QeaEMkRgqZy0FIBTFI4DYSbLSBlp9BeQj9aQ9tScZBpJDiWDPG4eg32OtV3zjOAy
 P8D2TFHxOG335DIR9dImB2cxXQVe74FziWsALLOSWE467yApID39sApqG3WbY5fd
 ZNTrjiQgnliL+es6SFyiFMxd6mROQGw7txGTFH4RFJDWbz05KMggpT5iccsOkb8o
 I+hsDIV7RVG8/KSgnZa1zM7GiaUPckvEhEDQayhCvGz0+VM11n/JXliU04/1AyI0
 Ek9U5c8VVgFjgELamTMP+fTdDcMLHZRBvDdfAdm/5h11ZZsCtxFh0XxOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=BsyZbZCrzJkjxnB3ZVt/jUv7SRpCLvPP/Oiq/RXnzm4=; b=KwVirmWj
 GADNhLFNgQQQPvbiltf0rY5Frb3jG6jj3fVM3+EkTTJy4oROCB0VMquL6m7NAQyw
 KKeTtZlqGJuKTpVTUPoVIaD3qoGc2Z/iBmdEHjoCBaPldixoIQTH6e7cI4LpA0XK
 CMoTre03J/4Ey+3H5io4wJz5FvTF0Td3VRVi3u+pfDhdQ7ELsGm2OqT7HwMxrxFo
 re2tVsx8qmoqtIJBBX939qszsszBypMQ4/xQyRoFUmYzxbpCkqbRZcl9KkjbV9cC
 KQZ/iw2h1xOV9wFKze3PsinKWJEyMc86PJP2HUJxWXhlqaYb8I5CpTuOJgduhgO5
 g4YZQZaaS3OeGg==
X-ME-Sender: <xms:bi4cXhAGo15U-rfOC8Fsnc2-W-6dqdMbMDQVvb8s6QILqS-bdr71pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:bi4cXikA4UDHBIAg4hUwHzwrXmlACopQnBABsc1G3wP_P7ZRX9_WWg>
 <xmx:bi4cXqoL2mzwf5s_O_QzFoMhk8iF3LJuvDpQQ1ezGnch5kJSzFDw3A>
 <xmx:bi4cXvPzURK8ZqTxxXHnGw0TyzwRQpzS7G1eSoJ-h1bSIOf1o-FJCw>
 <xmx:bi4cXkAOv_vbjB9OEbSpRVB7K_9VQ7WdN4drfoTYwEjiU5IdM5Rgnw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D2043060783;
 Mon, 13 Jan 2020 03:46:36 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 17:46:30 +0900
Message-Id: <20200113084630.14305-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113084630.14305-1-o-takashi@sakamocchi.jp>
References: <20200113084630.14305-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/3] dice: add support for Alesis MasterControl
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

Alesis MasterControl was shipped 2009 and already discontinued. This model
consists of:
 * TSB41AB2 for physical layer of IEEE 1394
 * WaveFront Dice II STD for link layer and protocol implementation
 * FreeScale DSPB56374AE

Although the firmware of this model can respond against read transaction
to address space for TCAT extension protocol, the content is not valid
for protocol extension. This results in sound card without any PCM/MIDI
interfaces.

$ ./firewire-request /dev/fw1 read 0xffffe0200000 0x48
result: 000: 00 00 00 20 00 00 04 94 00 00 04 b4 00 00 00 b4
result: 010: 00 00 05 68 00 00 00 24 00 00 05 8c 00 00 00 48
result: 020: 00 00 00 20 00 00 00 08 00 00 00 20 00 00 00 20
result: 030: 00 00 00 10 00 00 00 08 00 00 00 08 00 00 00 04
result: 040: 00 00 00 00 00 00 00 00

This commit adds support the model by adding hard-coded stream formats.

$ python3 ~/git/linux-firewire-utils/src/crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04041ad7  bus_info_length 4, crc_length 4, crc 6871
404  31333934  bus_name "1394"
408  e0ff8112  irmc 1, cmc 1, isc 1, bmc 0, pmc 0, cyc_clk_acc 255,
               max_rec 8 (512), max_rom 1, gen 1, spd 2 (S400)
40c  00059504  company_id 000595     | Alesis Corporation
410  008003f5  device_id 04008003f5  | EUI-64 00059504008003f5

               root directory
               -----------------------------------------------------------------
414  0006a620  directory_length 6, crc 42528
418  03000595  vendor: Alesis Corporation
41c  8100000a  --> descriptor leaf at 444
420  17000002  model
424  8100000d  --> descriptor leaf at 458
428  0c0087c0  node capabilities per IEEE 1394
42c  d1000001  --> unit directory at 430

               unit directory at 430
               -----------------------------------------------------------------
430  00041b9f  directory_length 4, crc 7071
434  12000595  specifier id: Alesis Corporation
438  13000001  version: audio
43c  17000002  model
440  8100000d  --> descriptor leaf at 474

               descriptor leaf at 444
               -----------------------------------------------------------------
444  000494c2  leaf_length 4, crc 38082
448  00000000  textual descriptor
44c  00000000  minimal ASCII
450  416c6573  "Ales"
454  69730000  "is"

               descriptor leaf at 458
               -----------------------------------------------------------------
458  0006c2ec  leaf_length 6, crc 49900
45c  00000000  textual descriptor
460  00000000  minimal ASCII
464  4d617374  "Mast"
468  6572436f  "erCo"
46c  6e74726f  "ntro"
470  6c000000  "l"

               descriptor leaf at 474
               -----------------------------------------------------------------
474  0006c2ec  leaf_length 6, crc 49900
478  00000000  textual descriptor
47c  00000000  minimal ASCII
480  4d617374  "Mast"
484  6572436f  "erCo"
488  6e74726f  "ntro"
48c  6c000000  "l"

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-alesis.c | 24 ++++++++++++++++++++++++
 sound/firewire/dice/dice.c        |  8 ++++++++
 sound/firewire/dice/dice.h        |  1 +
 3 files changed, 33 insertions(+)

diff --git a/sound/firewire/dice/dice-alesis.c b/sound/firewire/dice/dice-alesis.c
index f5b325263b67..0916864511d5 100644
--- a/sound/firewire/dice/dice-alesis.c
+++ b/sound/firewire/dice/dice-alesis.c
@@ -50,3 +50,27 @@ int snd_dice_detect_alesis_formats(struct snd_dice *dice)
 
 	return 0;
 }
+
+int snd_dice_detect_alesis_mastercontrol_formats(struct snd_dice *dice)
+{
+	int i;
+
+	dice->tx_pcm_chs[0][SND_DICE_RATE_MODE_LOW]	= 16;
+	dice->tx_pcm_chs[1][SND_DICE_RATE_MODE_LOW]	= 12;
+	dice->tx_pcm_chs[0][SND_DICE_RATE_MODE_MIDDLE]	= 12;
+	dice->tx_pcm_chs[1][SND_DICE_RATE_MODE_MIDDLE]	= 4;
+	dice->tx_pcm_chs[0][SND_DICE_RATE_MODE_HIGH]	= 8;
+	dice->tx_pcm_chs[1][SND_DICE_RATE_MODE_HIGH]	= 0;
+
+	for (i = 0; i < SND_DICE_RATE_MODE_COUNT; ++i) {
+		dice->rx_pcm_chs[0][i] = 6;
+		dice->rx_pcm_chs[1][i] = 0;
+	}
+
+	for (i = 0; i < MAX_STREAMS; ++i) {
+		dice->tx_midi_ports[i] = 2;
+		dice->rx_midi_ports[i] = 2;
+	}
+
+	return 0;
+}
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 13eeb3f52bb6..06c94f009dfb 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -355,6 +355,14 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.model_id	= MODEL_ALESIS_IO_BOTH,
 		.driver_data = (kernel_ulong_t)snd_dice_detect_alesis_formats,
 	},
+	// Alesis MasterControl.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_ALESIS,
+		.model_id	= 0x000002,
+		.driver_data = (kernel_ulong_t)snd_dice_detect_alesis_mastercontrol_formats,
+	},
 	/* Mytek Stereo 192 DSD-DAC. */
 	{
 		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index 16366773e22e..7fbffcab94c2 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -229,6 +229,7 @@ int snd_dice_create_midi(struct snd_dice *dice);
 
 int snd_dice_detect_tcelectronic_formats(struct snd_dice *dice);
 int snd_dice_detect_alesis_formats(struct snd_dice *dice);
+int snd_dice_detect_alesis_mastercontrol_formats(struct snd_dice *dice);
 int snd_dice_detect_extension_formats(struct snd_dice *dice);
 int snd_dice_detect_mytek_formats(struct snd_dice *dice);
 int snd_dice_detect_presonus_formats(struct snd_dice *dice);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
