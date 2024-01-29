Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18383FC35
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 03:27:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A25850;
	Mon, 29 Jan 2024 03:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A25850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706495279;
	bh=C92Yyq3thTqup/d4/mE8eUItKq6s5fj5p4kGcFFeaJw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BgJ2aqGBIwDuqPGjgLkqlkRT26gWf/EaqgNdLdQwSOspSRhPvEL8f4x7ek4uDXquB
	 yFv01USIfGrQ6j4pIek/BkEiPFW7hoUQkOCGWdtC4GJLgGOxQ8j/n8KLeRx2KndOwa
	 y5YChsw4nVQ5x61nH4vfBCtEBwsHv/vYKlPXhNC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B664F80580; Mon, 29 Jan 2024 03:27:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04966F8055B;
	Mon, 29 Jan 2024 03:27:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE0BEF80310; Mon, 29 Jan 2024 03:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BD2EF8017A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 03:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD2EF8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=Egq8VMWf;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=J0bcM/p1
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 2D82A3200A95;
	Sun, 28 Jan 2024 21:27:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 28 Jan 2024 21:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1706495235; x=1706581635; bh=2iO94N9zoR
	Nml3gCnbE3koDgEp2GmCvlU6mmU8JojZg=; b=Egq8VMWfdCTW9LkUUvc5G93IEg
	zQFmVubsW2qSvxMUhKEoIol7T0VrAaRyyZHI+wWYF4gG4FXgcSw/h2osNYC4e1rW
	VF2xO4qszbapf5sXtUWrNR49AWJvEthJRH5yaYO2t9qLI3ZZunPb0ZmeKf5mIrzl
	3APgiK9MUyBr3+cPiPLDA4pclLHoKWVMJ4U7pPa+54tuEnMqOFqZhu+KuXl/Ma7U
	nwTK4+kLfWTV+hXkxsRj9oEJHwq3hEOGzy1c2ILKtChrY/sFzpx8oKLUQwY25jQG
	wm6HNkeB6BVJXsuCHaAnVK5ybktdnrH9b3F0nj5ZwkqS+4At6IuuxoLNqCqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706495235; x=1706581635; bh=2iO94N9zoRNml3gCnbE3koDgEp2G
	mCvlU6mmU8JojZg=; b=J0bcM/p1kfHsX+3sz9C4mHi4+LtBHbQjSBmFz8YiJJ0J
	uPhKaFK3F6/1YMsncVpIbv4kVdTDyzwQAf4nItWqaBPQTEF5sXtuCqVjZqEPYecL
	ThEGGF6XTQ/x9ytT+1+KU3R5MVjMstqnXgoVWU1dPNypHh9jQ8qhJV4xLOcl/p3V
	rh5FFFo6G5O5sT01pA+mfr9y1v77XyltlShEoPYbijsqf29v3aQDLlBHBEXRV3Iu
	pb6DdjtaVuZzrx1ltInGpO8CYdxbqHUA+FcHhcf0sSRfNRMhAfodOAC1fKa1oGf2
	G5G+ub88WyWNEqTxTefSX9RSDIZvhIrGkgtuKHd7yw==
X-ME-Sender: <xms:Aw23ZZizhDfRrfA0Gi7ZzLXRLQV3-lfqXYoFcTYNPdU0pyyTEbvl6Q>
    <xme:Aw23ZeAj8YR4GJDiOEmZaTjzY7R4S70YkUiyP_81E_Qbqal3jPzdWdwQLYDxE0hC4
    e7MOjAO0sf64Xt-bT0>
X-ME-Received: 
 <xmr:Aw23ZZHex4o3-QHrZQ_lJjbYVFnKMMXD5knCrB8F8N3WpPy6M9AHJuqNTusWsnreAOJU3phKPBmVE2s1-r0k5cpG_uv0owongY_WKmR_v2d3>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrfedtfedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
    ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Aw23ZeR1n9mF4lJVHdA7rdMC4ilewvLD8H3hvqeU_WjqfNz7RRPueQ>
    <xmx:Aw23ZWzOQ4-DsD5WrvNbtip1Esk3xrnP6GRooZaviGdVKifxYq_lZQ>
    <xmx:Aw23ZU6Iyl-qlMo7d3K1fkbMS8GatSy6jpsM7kQ-eae3eYryCcN8hA>
    <xmx:Aw23ZbrZEdnUgxQS0siurl9aqkBUCNwdExmv7GMqwgMZmHF4P4hEtA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 21:27:14 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	m.armsby@gmx.de
Subject: [PATCH v2] ALSA: firewire-motu: add support for MOTU 896 mk3 FireWire
 and Hybrid
Date: Mon, 29 Jan 2024 11:27:11 +0900
Message-Id: <20240129022711.254383-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U3FZDJZZXHDIKBTAWWQDDROIJC77FLPJ
X-Message-ID-Hash: U3FZDJZZXHDIKBTAWWQDDROIJC77FLPJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3FZDJZZXHDIKBTAWWQDDROIJC77FLPJ/>
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
 sound/firewire/Kconfig                 | 2 ++
 sound/firewire/motu/motu-protocol-v3.c | 9 +++++++++
 sound/firewire/motu/motu.c             | 2 ++
 sound/firewire/motu/motu.h             | 1 +
 4 files changed, 14 insertions(+)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index 22b6c779682a..5973c25c2add 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -175,6 +175,8 @@ config SND_FIREWIRE_MOTU
 	  * 8pre
 	  * 828mk3 (FireWire only)
 	  * 828mk3 (Hybrid)
+	  * 896mk3 (FireWire only)
+	  * 896mk3 (Hybrid)
 	  * Ultralite mk3 (FireWire only)
 	  * Ultralite mk3 (Hybrid)
 	  * Traveler mk3
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

