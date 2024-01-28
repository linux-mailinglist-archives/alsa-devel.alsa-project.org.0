Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525483F57C
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 13:26:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51535846;
	Sun, 28 Jan 2024 13:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51535846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706444781;
	bh=syDE/btObODPDfsGD+5Sv3W/x4xryTWHbzqmAXZ/2pY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BybArSzkLWlfgDXRmNerkINCFzHwATvo0aVTJ/ltnuaBvak7p6FtNri6U/HhIOeqV
	 bAMNETzqxbOFYmYGnrJFHQhHyff++++OgoaAPRcVjSMkPM5mgS/FD2dLf6lQriUNIH
	 /+M/MOHXas+Y6GXiyOQP8fMnmvENeyrkOC6yMIOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ECCCF804E7; Sun, 28 Jan 2024 13:25:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D987AF8057F;
	Sun, 28 Jan 2024 13:25:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D6CBF80310; Sun, 28 Jan 2024 13:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A0F8F8017A
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 13:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A0F8F8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=f8x0Ji/q;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=O0rC141f
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5FD9D3200AAE;
	Sun, 28 Jan 2024 07:25:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 28 Jan 2024 07:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1706444729; x=1706531129; bh=od433pQhb0
	HsBuyY24EGOpX0CJ8sO+XZHzFbRexmRso=; b=f8x0Ji/qPZHCPzrQQhzyC9FBVl
	MAguMqjT/kRXLVoWRJRNs27thL5bfW+KSQpwr8zh/gXGB9DvGOlbp7kO05uHgm0M
	vRNQf2vBCJ8vhhz/brNV+38rFNdGOp1sCjlQ6hzoT6eTkvnj4cCLxUSXmM/pQ9Jt
	cl4jir3qE6Nmeyvm0HLPfMP89i4jQaHQFJ7rDa2HC/9FFvX63rRckFMca7QAPxKR
	SfCcOVMBWDVYf1IXvTdZqEmh3b7Ls7XrH3YIKLcDaQ1xqXc9+FZh+tgIUOjYwYO6
	bvBFnluIquDKrHUWeGFIpK4TxZ1SDblrNRrKQ++UyK9KeeElZCeQ0pejVD6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706444729; x=1706531129; bh=od433pQhb0HsBuyY24EGOpX0CJ8s
	O+XZHzFbRexmRso=; b=O0rC141fkwpT/sfaJtSyDetUreemqwE/xsPJGYLm7rv3
	3h7l5SfxLUgJcJAWK1BtQtInIM7c7UWVRCnVa4SztRcFJGqfuzzPnZ4wn0NCpZrl
	T23Z9BmFz4rUHlSvD1Ch7V+NLit+ubIBva4X3rM4vbD3wknVEQfHt+OZ92f7MAQw
	pez7Z4mKkIHJhnqr2N9A1stNfH1Fx4c7vocCESzLAsdDty92ZtjeA6eoclt56/6P
	NtkwbEVP48bMqS2oo2sBSvUGYzPROD36ho2kLoBs7LB8TJWYRuip2EI0h05JxYyo
	czmqRzRqw+7jVVJFiCMTA7wMDK9JLGIry/2FhOfhLw==
X-ME-Sender: <xms:uUe2Za0af2V60O5PV8oubYwFeQOGgYd2RknMnSOZGqVxbdfG_-vsCA>
    <xme:uUe2ZdHlh07-5l9d2WzdCeojKxGWxzfkklwyyXQg0QSbpE3Aq-6WeHkt27yMpw88U
    RobKb29eShFYKIE6r0>
X-ME-Received: 
 <xmr:uUe2ZS74YpoS8Uy39FxoaFY4_xda2oZ4H9yleVl-MHYRbvzFmsWOPIRDeTAUVpgIA3nVrw5TmhG2jDNsqZZm3Y2FIgoAw9DPLQY6n6YY_LYlLw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrfedtvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
    ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:uUe2Zb1raJqS7WVvsRLVmtKkKxKxUpppNyBzw3s-nwTlHbZWmzER8g>
    <xmx:uUe2ZdFxwQPOtLutpg14yqbk7BRGyv_GCZROA6248JIPqXOp_AeDeQ>
    <xmx:uUe2ZU_YMRGLI98Hc0DlVOaqM1DoWvFJTPRWp-q-CtONxIpjAj3XKg>
    <xmx:uUe2ZbNRCNOMpXa1r-uoMP6Kk_NBagjxyaNtg_M648c65s-yiixYsQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 07:25:27 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	m.armsby@gmx.de
Subject: [PATCH] ALSA: firewire-motu: add support for MOTU 896 mk3 FireWire
 and Hybrid
Date: Sun, 28 Jan 2024 21:25:23 +0900
Message-Id: <20240128122523.247084-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZEJVNTHYDGMFGBJ7OKSMFNATACF5A7Q
X-Message-ID-Hash: KZEJVNTHYDGMFGBJ7OKSMFNATACF5A7Q
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZEJVNTHYDGMFGBJ7OKSMFNATACF5A7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mark of the Unicorn released 896 mk3 FireWire in 2008 as part of the third
generation of its FireWire series. In 2011, 896 mk3 hybrid was released to
support USB protocol.

It supports sampling transfer frequency up to 192.0 kHz. The packet
format differs depending on both of current sampling transfer frequency
and the type of signal in optical interfaces. The model supports
transmission of PCM frames as well as MIDI messages.

The 896 mk3 FireWire consists of below ICs:

 * Texas Instruments TSB41AB2
 * Microchip (SMSC) USB3300
 * Xilinx Spartan-3A FPGA, XC3S500E
 * Texas Instruments TMS320C6722
 * Microchip (Atmel) AT91SAM SAM7S256

It supports sampling transfer frequency up to 192.0 kHz. The packet
format differs depending on both of current sampling transfer frequency
and the type of signal in two pairs of optical interfaces. The model
supports transmission of PCM frames, while has no port for MIDi messages.

The model supports command mechanism to configure internal DSP. Hardware
meter information is available in the first 2 chunks of each data block
of tx packet.

This commit adds support for it. The 896 mk3 FireWire is just tested, but
the 896 mk3 Hybrid is not yet.

$ config-rom-pretty-printer < motu-896mk3fw.img
               ROM header and bus information block
               -----------------------------------------------------------------
1024  04100ce1  bus_info_length 4, crc_length 16, crc 3297
1028  31333934  bus_name "1394"
1032  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
1036  0001f200  company_id 0001f2     |
1040  00093add  device_id 0000604893  | EUI-64 0547556791237341

               root directory
               -----------------------------------------------------------------
1044  0004ef04  directory_length 4, crc 61188
1048  030001f2  vendor
1052  0c0083c0  node capabilities: per IEEE 1394
1056  d1000002  --> unit directory at 1064
1060  8d000005  --> eui-64 leaf at 1080

               unit directory at 1064
               -----------------------------------------------------------------
1064  0003998d  directory_length 3, crc 39309
1068  120001f2  specifier id
1072  13000017  version
1076  17101800  model

               eui-64 leaf at 1080
               -----------------------------------------------------------------
1080  0002cc82  leaf_length 2, crc 52354
1084  0001f200  company_id 0001f2     |
1088  00093add  device_id 0000604893  | EUI-64 0547556791237341

$ config-rom-pretty-printer < motu-896mk3hybrid.img
               ROM header and bus information block
               -----------------------------------------------------------------
1024  04103cbe  bus_info_length 4, crc_length 16, crc 15550
1028  31333934  bus_name "1394"
1032  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
1036  0001f200  company_id 0001f2     |
1040  000ae601  device_id 0000714241  | EUI-64 0547556791346689

               root directory
               -----------------------------------------------------------------
1044  0004ef04  directory_length 4, crc 61188
1048  030001f2  vendor
1052  0c0083c0  node capabilities: per IEEE 1394
1056  d1000002  --> unit directory at 1064
1060  8d000005  --> eui-64 leaf at 1080

               unit directory at 1064
               -----------------------------------------------------------------
1064  000394ac  directory_length 3, crc 38060
1068  120001f2  specifier id
1072  13000037  version
1076  17102800  model

               eui-64 leaf at 1080
               -----------------------------------------------------------------
1080  0002cf69  leaf_length 2, crc 53097
1084  0001f200  company_id 0001f2     |
1088  000ae601  device_id 0000714241  | EUI-64 0547556791346689

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 9 +++++++++
 sound/firewire/motu/motu.c             | 2 ++
 sound/firewire/motu/motu.h             | 1 +
 3 files changed, 12 insertions(+)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 8a0426920a76..7254fdfe046a 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -261,6 +261,7 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 
 	if (motu->spec == &snd_motu_spec_828mk3_fw ||
 	    motu->spec == &snd_motu_spec_828mk3_hybrid ||
+	    motu->spec == &snd_motu_spec_896mk3 ||
 	    motu->spec == &snd_motu_spec_traveler_mk3 ||
 	    motu->spec == &snd_motu_spec_track16)
 		return detect_packet_formats_with_opt_ifaces(motu, data);
@@ -288,6 +289,14 @@ const struct snd_motu_spec snd_motu_spec_828mk3_hybrid = {
 	.rx_fixed_pcm_chunks = {14, 14, 14},	// Additional 4 dummy chunks at higher rate.
 };
 
+const struct snd_motu_spec snd_motu_spec_896mk3 = {
+	.name = "896mk3",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
+	.flags = SND_MOTU_SPEC_COMMAND_DSP,
+	.tx_fixed_pcm_chunks = {18, 14, 10},
+	.rx_fixed_pcm_chunks = {18, 14, 10},
+};
+
 const struct snd_motu_spec snd_motu_spec_traveler_mk3 = {
 	.name = "TravelerMk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index d73599eb7d5a..d14ab5dd5bea 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -168,10 +168,12 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
 	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3_fw), // FireWire only.
+	SND_MOTU_DEV_ENTRY(0x000017, &snd_motu_spec_896mk3), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x000019, &snd_motu_spec_ultralite_mk3), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x00001b, &snd_motu_spec_traveler_mk3),
 	SND_MOTU_DEV_ENTRY(0x000030, &snd_motu_spec_ultralite_mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3_hybrid), // Hybrid.
+	SND_MOTU_DEV_ENTRY(0x000037, &snd_motu_spec_896mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
 	SND_MOTU_DEV_ENTRY(0x000039, &snd_motu_spec_track16),
 	SND_MOTU_DEV_ENTRY(0x000045, &snd_motu_spec_4pre),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 3b1dc98a7be0..c66be0a89ccf 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -138,6 +138,7 @@ extern const struct snd_motu_spec snd_motu_spec_8pre;
 
 extern const struct snd_motu_spec snd_motu_spec_828mk3_fw;
 extern const struct snd_motu_spec snd_motu_spec_828mk3_hybrid;
+extern const struct snd_motu_spec snd_motu_spec_896mk3;
 extern const struct snd_motu_spec snd_motu_spec_traveler_mk3;
 extern const struct snd_motu_spec snd_motu_spec_ultralite_mk3;
 extern const struct snd_motu_spec snd_motu_spec_audio_express;
-- 
2.40.1

