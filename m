Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC3E97B4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2724A22DB;
	Wed, 30 Oct 2019 09:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2724A22DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572423171;
	bh=akHk8tK4sfiAFfmIjIXvLtm0/NjH8R3hcvfgNjIoQ0w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4J3uFKijLoMzISpTomxvzT+ZVXFT+JQp8pdyXriKtB5+14NgmRhPtgtUsV0FRVnc
	 X4OGp5qWWSKOEDcRksuqQrdTvQzNyM2tNxtDlUF7CBl3lMew+HEMrUXoahhAHaJcfR
	 lWVSXA1C4ZnlMermqlkIFTNQB9QNyxSyi5Z/LL38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F064F8065C;
	Wed, 30 Oct 2019 09:07:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 765F4F805FD; Wed, 30 Oct 2019 09:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B36AF805FC
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B36AF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hBtxU07d"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e91Va252"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F4BD21ED6;
 Wed, 30 Oct 2019 04:06:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 04:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qJnMDdNv4bY2B
 Vkz9I15A4xcPhhF6I3MF66TJk7A6Oc=; b=hBtxU07dkFNG66EG2N3s/bbdpBTlr
 QhMNxyvshCVolP4NZj61a/dAHnnlNFSoK5pfAtpNLI2VEqKYVYYUoIB7kZ8e7EXi
 FrnGuPFNsJvl4Ap28W/uEDKs/6oc/LVfzaj5eLBgM2hu6zdaezIKOBihVH2KxCCY
 VkIZr1bBFh+qxBa570J2tNMWnCHghpec5DxFqqdAPxDiHqvO6jYRqEy8fe54ZpSm
 c1RAKDIjLMxGBzorjN6Ac352ilJkURqeNygqDulc+2sk0exSssEqOq0QFTia73BX
 SNrbcYgcqKENfaKf/MvCGIC/XNmMP/s8E80WaJ1sCVIAQ2luGFxhwIUEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qJnMDdNv4bY2BVkz9I15A4xcPhhF6I3MF66TJk7A6Oc=; b=e91Va252
 6XqzygsmA7hhm/s7kFURBps7YiHcOCkXX48Nt29W1zA2qeQcqJVamDKv4dIVPiMN
 ZJaKAai/4mOg7mhb5ypTREMgxekKnP0HWjIlGCs2bUiuvhmeJPpUCqmGCmP2CN5t
 +ocKe6Bei62t1ssJjdBxKpb4GPVZhsXixPmpLYZm+qx2GMVYKLVWHZFw5A5iEy3L
 4F7pkhX7blZxKYUmgeUsXZpabACnEK3cIyfk2GtM7bj5O2TmoVQSmwCVhq7dBFIZ
 OuiRKbcLvix0UJYh4pNVOKcSDXJ21vB+0LGMdSsvQDTMX1RZvzxx6q4qbcH4SLRb
 KX5bCfLntyobeQ==
X-ME-Sender: <xms:oUS5Xcke8hsq7aIe5rr15o5-QfmNRyynqfHYP-Utic7pD_TD7E9itg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:oUS5XcR4eDj3GUFyS6_AnIuEJN85WARIMfm_KFVVBdnVjzYI0BnRxw>
 <xmx:oUS5XQHHOWkirPA5EqHi0lN_GOah-CDB2myjX3cIUrtBh06nSKGL7w>
 <xmx:oUS5XWj4iB9Ec-f6EQSRBQkO7w_6IlFnPBBvFPi9HGoL8kd4MJAthQ>
 <xmx:oUS5Xb8ryfxop1vhYJhIuzcuUZxLtwUpdTB6hinPFiSkvDuSvlq9hg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F6473060057;
 Wed, 30 Oct 2019 04:06:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 30 Oct 2019 17:06:44 +0900
Message-Id: <20191030080644.1704-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
References: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/6] ALSA: firewire-motu: add support for MOTU
	UltraLite
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

UltraLite was shipped in 2005 by MOTU, and already discontinued. This
model consists of below ICs:

- Texus Instruments TSB41AB2 for physical layer of IEEE 1394 bus
- Xilinx Spartan XC35S200 for link layer of IEEE 1394 bus, protocol layer
  and signal processing

This commit adds support for this model. Like the other MOTU models,
ALSA firewire MOTU driver fails to drive the device for stable sampling
clock and generate noisy sound.

$ python2 crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04107574  bus_info_length 4, crc_length 16, crc 30068
404  31333934  bus_name "1394"
408  20001000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 0, max_rec 1 (4)
40c  0001f200  company_id 0001f2     |
410  0007b82d  device_id 000007b82d  | EUI-64 0001f2000007b82d

               root directory
               -----------------------------------------------------------------
414  0004c65c  directory_length 4, crc 50780
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  8d000006  --> eui-64 leaf at 438
424  d1000001  --> unit directory at 428

               unit directory at 428
               -----------------------------------------------------------------
428  0003d80a  directory_length 3, crc 55306
42c  120001f2  specifier id
430  1300000d  version
434  17100800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  00024566  leaf_length 2, crc 17766
43c  0001f200  company_id 0001f2     |
440  0007b82d  device_id 000007b82d  | EUI-64 0001f2000007b82d

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index f249ad39d8a8..f2080d720aa9 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -202,6 +202,19 @@ static const struct snd_motu_spec motu_traveler = {
 	.analog_out_ports = 8,
 };
 
+static const struct snd_motu_spec motu_ultralite = {
+	.name = "UltraLite",
+	.protocol = &snd_motu_protocol_v2,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK | // padding.
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
+	.analog_in_ports = 8,
+	.analog_out_ports = 8,
+};
+
 static const struct snd_motu_spec motu_8pre = {
 	.name = "8pre",
 	.protocol = &snd_motu_protocol_v2,
@@ -272,6 +285,7 @@ static const struct snd_motu_spec motu_4pre = {
 static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000003, &snd_motu_spec_828mk2),
 	SND_MOTU_DEV_ENTRY(0x000009, &motu_traveler),
+	SND_MOTU_DEV_ENTRY(0x00000d, &motu_ultralite),
 	SND_MOTU_DEV_ENTRY(0x00000f, &motu_8pre),
 	SND_MOTU_DEV_ENTRY(0x000015, &motu_828mk3),	/* FireWire only. */
 	SND_MOTU_DEV_ENTRY(0x000035, &motu_828mk3),	/* Hybrid. */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
