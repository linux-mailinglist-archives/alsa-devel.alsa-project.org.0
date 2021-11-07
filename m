Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B644729F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Nov 2021 12:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 159191657;
	Sun,  7 Nov 2021 12:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 159191657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636283306;
	bh=Ng4immPMjnRC/CYk5dfKuiENK4IW4S/ta1wRNQdYU/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PqBKiPRvkjQmRdME8OLhNNehBiIYEdXpuTNdXVFeaYCZVFLEoVzWWVzbTqANMqbfR
	 WxXjcSuSMCUzopo8E7ffZZGLNU+9X3nCR+QT+Ck1gKcyHyxWCabtUe9FPHhTSaYy80
	 sJp67TIJlIrn5QoAPTRIb8V58y+ftgd1T/mMyXXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D09F802E3;
	Sun,  7 Nov 2021 12:07:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5478FF802D2; Sun,  7 Nov 2021 12:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1294F800F5
 for <alsa-devel@alsa-project.org>; Sun,  7 Nov 2021 12:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1294F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mtJVw1P+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GZo5brUo"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 577755C0180;
 Sun,  7 Nov 2021 06:06:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 07 Nov 2021 06:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=Cj7SNxyO9sESTeSstWrvO6a5n5
 b0DL6nRpidJvZV/4I=; b=mtJVw1P+JzYFNFG7nVNrP6zMn2Iv15o9kUZkLkr2mE
 lmGvCQjScYwfndjXPunyaVregJ9zV5hj7lj9fEvGbuwOWX2LBDCB8n3FYseIxCpn
 w4+WVedsRq1k2X0QPIcUAt/LYI+zDOFxvUgT50AIO00Bco4qT4aE4043f/t6hEHt
 vGFyVt3LjS16a04f4+hh4YL53i3YLCOwtkcWqIHfAcgn3GLRUnxh2NUz8jALlLxF
 xeBp97N4NHMERpU0V1/gCkRldSvNxGmSpvv37niCxzAx+WgEUAL2Pvv8+D/X6/Cc
 du7ZLVLvPE5l1UUeSzAZmJRNCOzTgVUFxLKdlnMjvmFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Cj7SNxyO9sESTeSst
 WrvO6a5n5b0DL6nRpidJvZV/4I=; b=GZo5brUosi8rOlFw0lNHK+sx98IvTCzXG
 Pj66TQwwvp6UBo8aB9ce5nRh/TJPBU5ObF5hm8hQ0yonDdoT9RBHhHpjoc88aMJc
 KXLyr/DSH9gCWHimAV8SV+vdhGolxYVNY4aoQMS/jvQLkVLl8wZChmhesWHqPOnf
 EXrai64V16agfpKleNCZ7Qo+JYvv6/cAzArO2IrgahPDIi2hUs86HxFQBiOAt1I4
 F9p8sD3ljaxSiHxgfPRLyKghjnNIh/n8odZy3oBAENrwgOzeZBAn26FYBCSXcOUk
 Yhv8c5Po35G0TevRHFZqhbr0uI67WtQsE1P7weMWYW786tGuGUOEA==
X-ME-Sender: <xms:SbOHYZCOC6Z2Ja7kyg4W1-utpFJxmClPw8_LV93N57AkyQR-kt5nmA>
 <xme:SbOHYXgvt6kFLtKdMNHMinXfhIIvxCkSP-NXyPnddEkaIEC-aIVBbka9_CIyu0SGg
 XDKEaHA4fzasYJWn0I>
X-ME-Received: <xmr:SbOHYUlepaGaF4e2D7pnbWoY70uwPUY-_bq3YUBoPVLKxHo4WdouworIn1YW0EpFdSUktvCcdOeXpnqDOnwrBTi906DGI4AAwT0o7TWa-ZRg_V35HejM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:SbOHYTwnTuRk3CUg2mlyIdtokk3YbzfqEWNYUSa059D9cB97V_sm2w>
 <xmx:SbOHYeRgGtxWl2Nk-msTkUUDWSHqpCoXO1-68LHnmG-hCdK36RgmMg>
 <xmx:SbOHYWa1XvV4Wu7W52Q5eewh9oMz4HItsNbREOWqALwMQEBTjzR1Jg>
 <xmx:SrOHYRJedAOMODnU03XDTYF43gBWn3Ym-eYZIRvHCs08fxzWGbux2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Nov 2021 06:06:47 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: add support for MOTU Track 16
Date: Sun,  7 Nov 2021 20:06:44 +0900
Message-Id: <20211107110644.23511-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
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

Mark of the Unicorn designed Track 16 2011 as one of models in third
generation of its FireWire series. The model is already discontinued.
It consists of below ICs:

 * Texas Instruments TSB41AB1
 * Microchip (SMSC) USB3300
 * Xilinx Spartan-3A FPGA, XC3S700A
 * Texas Instruments TMS320C6722
 * Microchip (Atmel) AT91SAM SAM7S512

It supports sampling transfer frequency up to 192.0 kHz. The packet
format differs depending on both of current sampling transfer frequency
and the type of signal in optical interfaces. The model supports
transmission of PCM frames as well as MIDI messages.

The model supports command mechanism to configure internal DSP. Hardware
meter information is available in the first 2 chunks of each data block
of tx packet.

This commit adds support for it.

$ cd linux-firewire-tools/src
$ python crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04107d95  bus_info_length 4, crc_length 16, crc 32149
404  31333934  bus_name "1394"
408  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
40c  0001f200  company_id 0001f2     |
410  000a83c4  device_id 00000a83c4  | EUI-64 0001f200000a83c4

               root directory
               -----------------------------------------------------------------
414  0004ef04  directory_length 4, crc 61188
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  d1000002  --> unit directory at 428
424  8d000005  --> eui-64 leaf at 438

               unit directory at 428
               -----------------------------------------------------------------
428  00035b04  directory_length 3, crc 23300
42c  120001f2  specifier id
430  13000039  version
434  17102800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002b25f  leaf_length 2, crc 45663
43c  0001f200  company_id 0001f2     |
440  000a83c4  device_id 00000a83c4  | EUI-64 0001f200000a83c4

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig                 |  3 +++
 sound/firewire/motu/motu-protocol-v3.c | 17 ++++++++++++++---
 sound/firewire/motu/motu.c             |  1 +
 sound/firewire/motu/motu.h             |  1 +
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index fd109bea4c53..22b6c779682a 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -169,6 +169,7 @@ config SND_FIREWIRE_MOTU
 	  * 828
 	  * 896
 	  * 828mk2
+	  * 896hd
 	  * Traveler
 	  * Ultralite
 	  * 8pre
@@ -176,7 +177,9 @@ config SND_FIREWIRE_MOTU
 	  * 828mk3 (Hybrid)
 	  * Ultralite mk3 (FireWire only)
 	  * Ultralite mk3 (Hybrid)
+	  * Traveler mk3
 	  * Audio Express
+	  * Track 16
 	  * 4pre
 
 	 To compile this driver as a module, choose M here: the module
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 1371f38505d0..8a0426920a76 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -189,7 +189,7 @@ int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
 					  sizeof(reg));
 }
 
-static int detect_packet_formats_dual_opt_iface(struct snd_motu *motu, u32 data)
+static int detect_packet_formats_with_opt_ifaces(struct snd_motu *motu, u32 data)
 {
 	if (data & V3_ENABLE_OPT_IN_IFACE_A) {
 		if (data & V3_NO_ADAT_OPT_IN_IFACE_A) {
@@ -261,8 +261,9 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 
 	if (motu->spec == &snd_motu_spec_828mk3_fw ||
 	    motu->spec == &snd_motu_spec_828mk3_hybrid ||
-	    motu->spec == &snd_motu_spec_traveler_mk3)
-		return detect_packet_formats_dual_opt_iface(motu, data);
+	    motu->spec == &snd_motu_spec_traveler_mk3 ||
+	    motu->spec == &snd_motu_spec_track16)
+		return detect_packet_formats_with_opt_ifaces(motu, data);
 	else
 		return 0;
 }
@@ -317,6 +318,16 @@ const struct snd_motu_spec snd_motu_spec_audio_express = {
 	.rx_fixed_pcm_chunks = {10, 10, 0},
 };
 
+const struct snd_motu_spec snd_motu_spec_track16 = {
+	.name = "Track16",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
+	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_COMMAND_DSP,
+	.tx_fixed_pcm_chunks = {14, 14, 14},
+	.rx_fixed_pcm_chunks = {6, 6, 6},
+};
+
 const struct snd_motu_spec snd_motu_spec_4pre = {
 	.name = "4pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 080728dd278f..f8b7fe38751c 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -173,6 +173,7 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000030, &snd_motu_spec_ultralite_mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3_hybrid), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
+	SND_MOTU_DEV_ENTRY(0x000039, &snd_motu_spec_track16),
 	SND_MOTU_DEV_ENTRY(0x000045, &snd_motu_spec_4pre),
 	{ }
 };
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 6ad1feab478b..4189f2192284 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -141,6 +141,7 @@ extern const struct snd_motu_spec snd_motu_spec_828mk3_hybrid;
 extern const struct snd_motu_spec snd_motu_spec_traveler_mk3;
 extern const struct snd_motu_spec snd_motu_spec_ultralite_mk3;
 extern const struct snd_motu_spec snd_motu_spec_audio_express;
+extern const struct snd_motu_spec snd_motu_spec_track16;
 extern const struct snd_motu_spec snd_motu_spec_4pre;
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
-- 
2.32.0

