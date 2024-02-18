Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9CE85954E
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 08:51:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A993201;
	Sun, 18 Feb 2024 08:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A993201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708242671;
	bh=dawZnq4u46P+YqsTtC7cIz0zKc0IN7gLvzYq9j14sgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RWrbnX/YAmAEGzwk2gOenRqIBf249+uIEDDE2eI6orT/4sITbl7TNLJWTKsN5hr5V
	 wVa+CNDMJRqQ6NgBz8xbNe+1HAjogZOyV0BwA96vKwwFhEuOUYaDZ9QRLX8BPijEJu
	 43lrTeRgD6HoBaHHWskZciiwDHnYFRGXRHaVI82Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B356BF805C8; Sun, 18 Feb 2024 08:50:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 489DAF805B3;
	Sun, 18 Feb 2024 08:50:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD102F80568; Sun, 18 Feb 2024 08:44:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC6AAF804CC
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 08:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6AAF804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=Uojw0EDP;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=T9Q6fHpm
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id DDA885C0071;
	Sun, 18 Feb 2024 02:41:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 18 Feb 2024 02:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1708242100; x=
	1708328500; bh=X3uHAM0FEYgvjXcOj8xfkn7M51HAJ4N/hout0BLOOd0=; b=U
	ojw0EDPfdzaFVXansMAmUaU9qqJqktdaH6n8yn0C7RU8LpASchwiIe3NHni9nn5D
	fyAAsRBPh0vbVBv9YIWirJXnU6PMIwQY2L5pmazJIMQb5S0RPrOiCELzVeNAkW51
	y36PaQ3lK0oNNxsS52CueGbmcMDbi08c3M3V2sSVkJdN+10s//6x1YK6n32f85Pv
	P4NOOKvKB8A///bt2elGXeadN6IDgwuIyaauiymbb/1qFiu56a2GSGESiLIK7ORW
	Yh5LajajZLgDkJhdiI5eMVlGCLLOoI2kFdcKtK8DVpCCIJ/bmwpALePNhrsgwqmf
	b+B4LJcK0LPNvcQxt2v5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708242100; x=
	1708328500; bh=X3uHAM0FEYgvjXcOj8xfkn7M51HAJ4N/hout0BLOOd0=; b=T
	9Q6fHpmtDxicJpfDlMY0TjgGe0CsgLu1KoEefb+Dd8ialVHDbI/RtVrYANo5O93h
	MUH/D883uLRPbZkcu1Ap9Ksa4Kzu6I/bw2CH46tsYRF0vVlE2Zh/hDmDbLAWmJvn
	7hUdXRyJdaRMnv2ZZHPwAIoATSBxU4vK6l0pV+oPNwqBO4uZMPXCTlsuGkLFxGxP
	mel60+V0bwFGOPOVA269ymN9N9Q0/iEjZxT4tCFK/LEaDKQDkwL+i0Z8p0S1AI1j
	9sFgHzaJ1/EURk29TaYR9T/5Q2MrpOvSFa56glBcfZVviviIfxWkQqSbKnXmz1OW
	cETw99+ZlqBhrPzgOTp+A==
X-ME-Sender: <xms:tLTRZSbhtE4pj9E4WVTHwdFAEZkREF8X0V6dXVHw35Fb1VQn6Z3kAw>
    <xme:tLTRZVYdStATkoKrZSyLK2arRW9h4GlUu6h0jH0b-yxsOh6rrmpnOrgZbbQErsFZt
    5oFfDp1eXoGktNe_dg>
X-ME-Received: 
 <xmr:tLTRZc8ZktyYgs4xd0S24m1wP53OVhqGSamnddNcDmL2KPTXxzAwnlOWcSFhh6fDR9ya2yP-hykSeeVuAXTcJqLVSm8QPEBvhshr1hfa5W7H>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:tLTRZUpjHL-pEcgE4bXupC3PIWST_7ma-plIsqMlQ0hj0kIjkKJxYg>
    <xmx:tLTRZdqGxtCk3uDb2DnhjA8EP2cKUKHPdfM4ZptrdoBUGgaxCD5hng>
    <xmx:tLTRZSTjjR8TJHyYIBe6kM-hElpqgILtj72SXvmHysTq5Z8WYOuX7g>
    <xmx:tLTRZcQBFaG6l3vbQ4BUIAnMJ_4bOKyURw3EB95yeQUMf-Y-KjGeqw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Feb 2024 02:41:39 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: oxfw: add support for Miglia Harmony Audio
Date: Sun, 18 Feb 2024 16:41:28 +0900
Message-Id: <20240218074128.95210-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
References: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A2LT2RNQSUQJJVLCEGN6OKPOUHLW577Y
X-Message-ID-Hash: A2LT2RNQSUQJJVLCEGN6OKPOUHLW577Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2LT2RNQSUQJJVLCEGN6OKPOUHLW577Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Miglia Technology ships Harmony Audio 2004. It uses Oxford Semiconductor
OXFW970 for communication function in IEEE 1394 bus. This commit adds
support for the model.

In my opinion, the firmware of ASIC is really the initial stage, since
it has the following quirks.

* It skips several isochronous cycles to transmit isochronous packets
  when receiving any asynchronous transaction.
* The value of dbc field in the transmitted packet is the number of
  accumulated quadlets in CIP payload, instead of the accumulated data
  blocks. Furthermore, the value includes the quadlets of CIP payload in
  the packet.
* It neither supports AV/C Stream Format Information command nor AV/C
  Extended Stream Format Information command.
* The vendor and model information in root directory of configuration
  ROM includes some mistakes.

Additionally, when operating at 96.0 kHz, it often skips much isochronous
cycles to transmit the isochronous packets. The issue is detected as cycle
discontinuity and ALSA PCM application receives -EIO at any operation for
PCM substream. I have never found any workaround yet.

$ config-rom-pretty-printer < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
1024  04249e04  bus_info_length 4, crc_length 36, crc 40452
1028  31333934  bus_name "1394"
1032  20ff5003  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 5 (64)
1036  0030e002  company_id 0030e0     |
1040  00454647  device_id 8594474567  | EUI-64 13757098081207879

               root directory
               -----------------------------------------------------------------
1044  00062d69  directory_length 6, crc 11625
1048  030030e0  vendor
1052  8100000a  --> descriptor leaf at 1092
1056  1700f970  model
1060  81000011  --> descriptor leaf at 1128
1064  0c0083c0  node capabilities: per IEEE 1394
1068  d1000001  --> unit directory at 1072

               unit directory at 1072
               -----------------------------------------------------------------
1072  00046ff9  directory_length 4, crc 28665 (should be 43676)
1076  1200a02d  specifier id
1080  13010001  version
1084  1700f970  model
1088  8100000f  --> descriptor leaf at 1148

               descriptor leaf at 1092
               -----------------------------------------------------------------
1092  00085f8a  leaf_length 8, crc 24458
1096  00000000  textual descriptor
1100  00000000  minimal ASCII
1104  4d69676c  "Migl"
1108  69612054  "ia T"
1112  6563686e  "echn"
1116  6f6c6f67  "olog"
1120  79204c74  "y Lt"
1124  642e0000  "d."

               descriptor leaf at 1128
               -----------------------------------------------------------------
1128  00040514  leaf_length 4, crc 1300
1132  00000000  textual descriptor
1136  00000000  minimal ASCII
1140  4f584657  "OXFW"
1144  20393730  " 970"

               descriptor leaf at 1148
               -----------------------------------------------------------------
1148  0005a1dc  leaf_length 5, crc 41436
1152  00000000  textual descriptor
1156  00000000  minimal ASCII
1160  4861726d  "Harm"
1164  6f6e7941  "onyA"
1168  7564696f  "udio"

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c |  2 ++
 sound/firewire/oxfw/oxfw.c        | 10 +++++++++-
 sound/firewire/oxfw/oxfw.h        |  3 +++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 40716bb989c7..00f7feb91f92 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -177,6 +177,8 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 			flags |= CIP_JUMBO_PAYLOAD;
 		if (oxfw->quirks & SND_OXFW_QUIRK_WRONG_DBS)
 			flags |= CIP_WRONG_DBS;
+		if (oxfw->quirks & SND_OXFW_QUIRK_DBC_IS_TOTAL_PAYLOAD_QUADLETS)
+			flags |= CIP_DBC_IS_END_EVENT | CIP_DBC_IS_PAYLOAD_QUADLETS;
 	} else {
 		conn = &oxfw->in_conn;
 		c_dir = CMP_INPUT;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 241a697ce26b..98ae0e8cba87 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -21,6 +21,7 @@
 #define VENDOR_TASCAM		0x00022e
 #define OUI_STANTON		0x001260
 #define OUI_APOGEE		0x0003db
+#define OUI_OXFORD		0x0030e0
 
 #define MODEL_SATELLITE		0x00200f
 #define MODEL_SCS1M		0x001000
@@ -232,6 +233,11 @@ static int oxfw_probe(struct fw_unit *unit, const struct ieee1394_device_id *ent
 	if (err < 0)
 		goto error;
 
+	if (entry->vendor_id == OUI_OXFORD && entry->model_id == 0x00f970) {
+		oxfw->quirks |= SND_OXFW_QUIRK_STREAM_FORMAT_INFO_UNSUPPORTED |
+				SND_OXFW_QUIRK_DBC_IS_TOTAL_PAYLOAD_QUADLETS;
+	}
+
 	err = snd_oxfw_stream_discover(oxfw);
 	if (err < 0)
 		goto error;
@@ -330,6 +336,9 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	//
 	OXFW_DEV_ENTRY(VENDOR_GRIFFIN, 0x00f970, &griffin_firewave),
 	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
+	// Miglia HarmonyAudio (HA02). The numeric vendor ID is ASIC vendor and the model ID is the
+	// default value of ASIC.
+	OXFW_DEV_ENTRY(OUI_OXFORD, 0x00f970, NULL),
 	// Behringer,F-Control Audio 202. The value of SYT field is not reliable at all.
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
 	// Loud Technologies, Tapco Link.FireWire 4x6. The value of SYT field is always 0xffff.
@@ -337,7 +346,6 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	// Loud Technologies, Mackie Onyx Satellite. Although revised version of firmware is
 	// installed to avoid the postpone, the value of SYT field is always 0xffff.
 	OXFW_DEV_ENTRY(VENDOR_LOUD, MODEL_SATELLITE, NULL),
-	// Miglia HarmonyAudio. Not yet identified.
 
 	//
 	// OXFW971 devices:
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 3bf8d7bec636..39ea9a6dde33 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -54,6 +54,9 @@ enum snd_oxfw_quirk {
 	SND_OXFW_QUIRK_VOLUNTARY_RECOVERY = 0x20,
 	// Miglia Harmony Audio does not support AV/C Stream Format Information command.
 	SND_OXFW_QUIRK_STREAM_FORMAT_INFO_UNSUPPORTED = 0x40,
+	// Miglia Harmony Audio transmits CIP in which the value of dbc field expresses the number
+	// of accumulated payload quadlets including the packet.
+	SND_OXFW_QUIRK_DBC_IS_TOTAL_PAYLOAD_QUADLETS = 0x80,
 };
 
 /* This is an arbitrary number for convinience. */
-- 
2.40.1

