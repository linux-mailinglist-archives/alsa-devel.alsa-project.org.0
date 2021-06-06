Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE2239CCF7
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 06:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2780F16C6;
	Sun,  6 Jun 2021 06:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2780F16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622954163;
	bh=gGqqBhYtVLmGOrxFQNhOy6jAftyxBb0if1ooefQJ8VM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JFN/6YtvG4P9E1B/E7dDscz+ietpaL1nPqFNlcBfc2KDUt5GELhzmDj6gfXRkLiM0
	 gGRmtot8KRU3AEQru0GGfqvJlKLOfy9cnyrYIUJNBYpFQhvBO90KeKnE9D2gD3wtze
	 gAIxc4I1jOvuYALJK1be0TKKsPjQCf6+3BzSZuhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934E2F80227;
	Sun,  6 Jun 2021 06:34:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44005F80218; Sun,  6 Jun 2021 06:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0701DF80103
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 06:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0701DF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hK/N9OKy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="n7JyehJG"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EFAF71B48;
 Sun,  6 Jun 2021 00:34:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 06 Jun 2021 00:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=UULrZoICeIV8G7Inh89+4j5SBM
 7Q8hnu3yfWBbMIPDg=; b=hK/N9OKy4oucROL9unvB9/7q6zv76BWqEG637b8N10
 xgZxVJXRzCHY5ah86EHf7CXtnBKfM1EJ+AXJoqK1c0HeTtYGckGPPmqLd7VHhbma
 FC7cbrwMRD9Nj3lfrVVJSRY+MUOyMsIKMEyitsoEkcMwdZ190wUyZAxjIgt4aX3P
 vDfWyeuS54waKxJoBd1skIxeRtEYyIABFJv8Cl1PHOpBxjuPqGixwH5GdBEeyAFw
 bBRP0fIxun9BkIj7JrO08hSUOIFqx9QX4hwoYDKqZ4tQ9/4aB15Tuo1Kv0rWLV0A
 /blH1Hpz6/zqy/8Snr8l+djQZYVxLxArN0dcNtwp1LrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UULrZoICeIV8G7Inh
 89+4j5SBM7Q8hnu3yfWBbMIPDg=; b=n7JyehJGrioZ//qNlQLBjDFzd9+dlcbR7
 qX1+c57kQDgdcqvBKSDnzk0d2CnRNxy6rIQpm9aNY9L3HbbR49ViIcW0NzUS5msu
 pfMNppdU/kHDPcuM2WNzoWXtnkeMf9gzmU9TIlurLTi2s6RP+KBodR/S2YO9NKJS
 DS4VKMcJlsCiyXZ3E3NfAYlJpO1pKTPVTgLLEwTyobldUMvwlrzYN3GA+t/xF7TM
 vRfEgP0V+6Awbj48oCvb9faLuJvKIAZPXgDw+Br1IoVe+Qklu0yf0ARlZY85I7Bc
 +gN0FPbZjvoJHFXveeTZWOtyz8Stpvn3hbO68PeQ+EY8BKOP5eDeQ==
X-ME-Sender: <xms:RlC8YPgumLVfnbseHagpNOLprBe_CCaaX32uY6Ud5DdrF5HJ20tUjQ>
 <xme:RlC8YMDrlLCR_Cc6CiN8zb-Nl2XZXPLUCfHES1CPu_3XqrQLdv0H0vh8D6ujH74FU
 3O7NxuVQTwKP6vfd2E>
X-ME-Received: <xmr:RlC8YPE4l8e0s3blOpJ5WmvaxqWiBdouCBW9kY3LuZlOKH7Ycz_RAlOHWha_RjU2RM4mNnu-Lj7IWjjTDyxR1GQEG9OBIE23WVziHVh6CkAKPdo3SCw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:RlC8YMQwm5nIF_a5ikymbhUGTel6jFfiP13Aa69XfBS8KV2LWVgeIA>
 <xmx:RlC8YMyf1_28ITCBH5y-Rw_0v6eeY_lA-V5a_tP-KcGknhyqjDDCyg>
 <xmx:RlC8YC7uVodKBT2yb9yF0eKEG5Jft1wgUx0Nvzt0r_su2yycO2OcwA>
 <xmx:R1C8YJoQ9hPvUe0sUcKraOwUCiNFm59FT9Yo-PQuZsiTjS3RiVEOIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 00:34:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: add support for hybrid model of MOTU
 Ultralite mk3
Date: Sun,  6 Jun 2021 13:34:09 +0900
Message-Id: <20210606043409.40019-1-o-takashi@sakamocchi.jp>
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

This commit adds support for the hybrid model of MOTU Ultralite mk3 with
alpha connector, which is already discontinued. The hardware specification
of the model is the same as the one of FireWire-only model.

$ cd linux-firewire-utils
$ python3 src/crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04101573  bus_info_length 4, crc_length 16, crc 5491
404  31333934  bus_name "1394"
408  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
40c  0001f200  company_id 0001f2     |
410  000a059c  device_id 00000a059c  | EUI-64 0001f200000a059c

               root directory
               -----------------------------------------------------------------
414  0004ef04  directory_length 4, crc 61188
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  d1000002  --> unit directory at 428
424  8d000005  --> eui-64 leaf at 438

               unit directory at 428
               -----------------------------------------------------------------
428  0003f00b  directory_length 3, crc 61451
42c  120001f2  specifier id
430  13000030  version
434  17103800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002d89c  leaf_length 2, crc 55452
43c  0001f200  company_id 0001f2     |
440  000a059c  device_id 00000a059c  | EUI-64 0001f200000a059c

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig     | 2 ++
 sound/firewire/motu/motu.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index def1f3d5ecf5..fc6858131b59 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -154,6 +154,8 @@ config SND_FIREWIRE_MOTU
 	  * 8pre
 	  * 828mk3 (FireWire only)
 	  * 828mk3 (Hybrid)
+	  * Ultralite mk3 (FireWire only)
+	  * Ultralite mk3 (Hybrid)
 	  * Audio Express
 	  * 4pre
 
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index a4929c1302dc..2a8a6ea2d3f1 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -190,6 +190,7 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
 	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x000019, &snd_motu_spec_ultralite_mk3), // FireWire only.
+	SND_MOTU_DEV_ENTRY(0x000030, &snd_motu_spec_ultralite_mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
 	SND_MOTU_DEV_ENTRY(0x000045, &snd_motu_spec_4pre),
-- 
2.27.0

