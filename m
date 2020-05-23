Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC961DF573
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 09:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF7C1870;
	Sat, 23 May 2020 09:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF7C1870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590218373;
	bh=6DT583lGlYyTsuzZKr2dgV8Iv4M2UrO5YE9A3hfmsL4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FCsKvRIK9wzCZgWppEaYbuzdVMiXkPngILZSqlccsvo2xqls2gDu//jsVIL/zXF0i
	 w5yAkNEslokWFgnBQCWd3qW9zRCcQPY7zE5CbKathNmrwPH8Z/jzjaEzC0fMwxB1pD
	 DO3jGGDnVk0bov3jKM7yOCmA19IMBYqeOkUiDjuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60515F80140;
	Sat, 23 May 2020 09:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1717BF801D8; Sat, 23 May 2020 09:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CA93F80140
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 09:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA93F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hfaDaW+o"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2MEC9lTM"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id DCB50861;
 Sat, 23 May 2020 03:17:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 23 May 2020 03:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=8y3dO43ymg3uulT/iZz1043fkn
 yzfmfx2QQohUvNJ5k=; b=hfaDaW+ov23B4WAhWDQUqHYO3vXkQCg7Zj5PVYZrF4
 sAJo0LD1Aj/FXlipT8aoWLLkQsfwZnPTeBvBhgO7mFChr9Avd8/nJPvTG07UwdnH
 X+DJVYKpTXepYrRHYvNSG7ecSSP80ZQMxLSd3LWwFM6JEmP3aUPjDtsMjGbKvRTV
 fy1bjRbKtfmXnI1LDkqp1lTAGajh1pVWmy105nDShPoD8J6Ju2XZf/YRBxQz8g+d
 D+zbaBsdWFvXeBE91xPLI4svXFxxAC5VtU7TSSje1pvXOAgMviXswQClv9MfF5cV
 +LruhXyg+bi/8drnx/kuMjl8TBM6W17dZwwvgDMGNvjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8y3dO43ymg3uulT/i
 Zz1043fknyzfmfx2QQohUvNJ5k=; b=2MEC9lTM1vQ3acZ+dhIu1K0ZOQeuKjJoJ
 Pd6G9nmgRiNh5JBXRj3AnUjz5ppBVfLHI7MFu6lZGnd+ygYpZTf1GQpaB47wDvpE
 C+AUSX3TbuNIEVzKBbTaJHXQNFM06KfLAFuSXhS5Ro+DUhimHSCuOlII7bEGucAP
 b/vC31PKlj5Swx71yVM1uN9fln01pxLbosTSxUK2Lrw41KnQvbvjCQyfeQw4BvBC
 1RvpmBrAojyyLHdjKTM7dyYaI+tSifwXJ7+FvuE9K24QNu4NbxP+mJ7FayY8xoDa
 WMB2kTaYtCFu3Nj019ZZYljnI7kukXj/1Bl3UmCJx0lPHBxO9LLvw==
X-ME-Sender: <xms:EM7IXl_qKE4YI5oNyNuIaZbX8Ymlcn6TXjDRSYDdUp0nzUhrxuMtqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddugedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtd
 dtkefgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:EM7IXptAh8Nskvbf2yJI3kArHEBpl_dWAZ-BMUCO99UPV0vVNeexBA>
 <xmx:EM7IXjAc5rSzz4QYTy1GDsT69Tn6EZJF43Fqo7ksyIKmunH_nX-Tow>
 <xmx:EM7IXpeMcKQESSihjMvxZwfJINMGcD50EnyxWcr3m9FGzxqf-6bcgQ>
 <xmx:Ec7IXtbLukAy-_MovFqZ2ivXd0492sguMndt-5gQBY-AbeaJCof0Gw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id D59B930664E5;
 Sat, 23 May 2020 03:17:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: add support for MOTU UltraLite-mk3
 (FireWire only model)
Date: Sat, 23 May 2020 16:17:33 +0900
Message-Id: <20200523071733.170129-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

UltraLite-mk3 was shipped 2008 by MOTU. This model has two lineups;
FireWire-only and FireWire/USB2.0 Hybrid model. Additionally, the latter
has two variants in respect of the type of IEEE 1394 connector; alpha
and beta connector.

This commit adds support for the FireWire-only model, which is already
discontinued.

$ python3 crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  0410353a  bus_info_length 4, crc_length 16, crc 13626
404  31333934  bus_name "1394"
408  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
40c  0001f200  company_id 0001f2     |
410  000902c7  device_id 00000902c7  | EUI-64 0001f200000902c7

               root directory
               -----------------------------------------------------------------
414  0004ef04  directory_length 4, crc 61188
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  d1000002  --> unit directory at 428
424  8d000005  --> eui-64 leaf at 438

               unit directory at 428
               -----------------------------------------------------------------
428  00035556  directory_length 3, crc 21846
42c  120001f2  specifier id
430  13000019  version
434  17100800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002f3c5  leaf_length 2, crc 62405
43c  0001f200  company_id 0001f2     |
440  000902c7  device_id 00000902c7  | EUI-64 0001f200000902c7

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 9 +++++++++
 sound/firewire/motu/motu.c             | 1 +
 sound/firewire/motu/motu.h             | 1 +
 3 files changed, 11 insertions(+)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index fd49d1fcf473..01a47ac7bb2d 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -290,6 +290,15 @@ const struct snd_motu_spec snd_motu_spec_828mk3 = {
 	.rx_fixed_pcm_chunks = {14, 14, 10},
 };
 
+const struct snd_motu_spec snd_motu_spec_ultralite_mk3 = {
+	.name = "UltraLiteMk3",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
+	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+	.tx_fixed_pcm_chunks = {18, 14, 10},
+	.rx_fixed_pcm_chunks = {14, 14, 14},
+};
+
 const struct snd_motu_spec snd_motu_spec_audio_express = {
 	.name = "AudioExpress",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index e5b6f634aa35..a4929c1302dc 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -189,6 +189,7 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
 	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3), // FireWire only.
+	SND_MOTU_DEV_ENTRY(0x000019, &snd_motu_spec_ultralite_mk3), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
 	SND_MOTU_DEV_ENTRY(0x000045, &snd_motu_spec_4pre),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index e7948bf1f553..3d0236ee6716 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -118,6 +118,7 @@ extern const struct snd_motu_spec snd_motu_spec_ultralite;
 extern const struct snd_motu_spec snd_motu_spec_8pre;
 
 extern const struct snd_motu_spec snd_motu_spec_828mk3;
+extern const struct snd_motu_spec snd_motu_spec_ultralite_mk3;
 extern const struct snd_motu_spec snd_motu_spec_audio_express;
 extern const struct snd_motu_spec snd_motu_spec_4pre;
 
-- 
2.25.1

