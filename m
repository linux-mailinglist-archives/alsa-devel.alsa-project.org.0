Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAE138C71
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 08:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A121B15E4;
	Mon, 13 Jan 2020 08:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A121B15E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578901096;
	bh=PFRJqxxVnaG83k35LzZvOqF0rEYXzhZkMRsRi7MFfjY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LH3+UCKSCNQ4R2d9Xr6Pp1OZuftz/jhfIH1WhfyvD37lqEVHZTZVlN0IqatEH7JGh
	 /5D1YBdtZQbu+fJmrzi/Fn0wM5YOrL0n8XOzw5SabUMoVNK+T1vODDrNwW5vaIVLXZ
	 VHMERMu1N/CgKOTGQXg+t94HjjlgSE8rJ8a5WemI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B028EF8027C;
	Mon, 13 Jan 2020 08:34:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D94C4F801F8; Mon, 13 Jan 2020 08:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A773F801EB
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 08:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A773F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="r63CuEuW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="puqB9LUL"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 662BF21E95;
 Mon, 13 Jan 2020 02:34:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 02:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/cl4BTiaDBjfV
 NLf9u0q5/0FYOqIzefvqgjdiJccVkY=; b=r63CuEuWN2xRPwRvjwlKFt3SqIUil
 N9IZ+lwI1r1kBZAtJSCzjng7X/5+1YQ4mdC68YcH8SNevxsOgxLfTEdljaczl1vH
 7J1hgDi3jvMT3masmR//6oMHM8Mg4Bm+kTgEeSgKXV9Kvtd2i+8EMm2yMTRbyAPz
 W4dPDjdriy1H3vNoKGi7iLBLCl32jcji3w7XSMT62YStU0rlivgM07AcOCYOIuYQ
 OAPJqoXwoZ14Sds3ix+y6GRcNLAUTgNKqV4qLRYshq/WkCZmJQC4PoYmIuGASMPm
 4OnLrR1tE8ZULUi/IMrDo6IdzpUDaTZoUa9U4s3r73K7iNz8BqXiFE/lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/cl4BTiaDBjfVNLf9u0q5/0FYOqIzefvqgjdiJccVkY=; b=puqB9LUL
 /c11OpEARMWz2brA6CHLeiH21mzSDBc1VAa64DZY2mJv/5VBoaucqeX9DJYv9ytH
 zXasJawjmlPbPhrNw39WaAePmR9X1uDKSLXVIV6j55fXPmz1NCcVblALsgEySpuN
 cgvQ95mpQdf7X/AqsXrlx4CzHn+OvceDqWyj3ON6eYejJjGOCNje4S9sYRhEHXVZ
 le8wtKuDEMW0jqxva3CQRnW3hL8TutjFn1g0elevT9dtBpUUOyPxzw3oNHJsmVzF
 7/ZwpxF4XXJeI9sKCOq0J7n9OnAafRkxe3fPon/euCFw8CVzEWxHypRhaq/BARQM
 1ef98/gPHkBBuA==
X-ME-Sender: <xms:gR0cXrla1nwO9F6qexJNLjShnboCipjrGop2jAvwAakn3NRgF4ylhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinheprghlshgrqdhprh
 hojhgvtghtrdhorhhgnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gR0cXpGJEtqbfwgv4o_NDUCTwBL2_s_gGn-hYdAsUm2vxshlG4oUCA>
 <xmx:gR0cXnF0Ua7eKyBun4KzuiMQbkF3lwikJMSwgctnJg6WxIlSmtMvhA>
 <xmx:gR0cXp05FwjTtMO0jg31CeGRmwwfI9e6gUKJlop1J6BlekxNk6vIIQ>
 <xmx:gR0cXi3ekt-2ZurwuMpgsV_PjQMukWn5YS27CA3IG-eYNES8wrlPwg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8220C80059;
 Mon, 13 Jan 2020 02:34:24 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 16:34:18 +0900
Message-Id: <20200113073418.24622-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113073418.24622-1-o-takashi@sakamocchi.jp>
References: <20200113073418.24622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/3] ALSA: oxfw: fix for Stanton SCS.1d
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

Stanton SCS.1d uses Oxford Semiconductor FW 971 ASIC (FW971) for
communication. Although the unit is bound to ALSA oxfw driver, the instance
of sound card can not be added due to its quirk of plug information. This
bug was added when snd-scs1x is merged into snd-oxfw at commit
9e2004f9cedf ("ALSA: oxfw: obsolete scs1x module").

This commit fixes the driver for the quirk. In cases that the unit returns
NOT IMPLEMENTED for some AV/C commands, the sound card is added without any
PCM/MIDI interfaces for packet streaming. For SCS.1d, model dependent
operation adds MIDI interface and applications can use it to operate
according to HSS1394 protocol from reverse-engineering work by Sean M.
Pappalardo.

Plug Control Register (PCR) has information that the unit has a pair of
plugs for isochronous communication:

(oMPR)
$ ./firewire-request /dev/fw1 read 0xfffff0000900
result: 80ff0001
(iMPR)
$ ./firewire-request /dev/fw1 read 0xfffff0000980
result: 80ff0001

AV/C PLUG INFO also returns information that the unit has a pair of
plugs for isochronous communication.

(AV/C PLUG INFO command)
$ ./firewire-request /dev/fw1 fcp 0x01ff0200ffffffff
response: 000: 0c ff 02 00 01 01 02 02

However, AV/C PLUG SIGNAL INFO command is rejected for both plugs.

(AV/C OUTPUT PLUG SIGNAL INFO command)
$ ./firewire-request /dev/fw1 fcp 0x01ff1800ffffffff
response: 000: 0a ff 18 00 ff ff ff ff
(AV/C INPUT PLUG SIGNAL INFO command)
$ ./firewire-request /dev/fw1 fcp 0x01ff1900ffffffff
response: 000: 0a ff 19 00 ff ff ff ff

Furthermore, AV/C EXTENDED STREAM FORMAT INFO is not implemented.

(AV/C EXTENDED STREAM FORMAT INFO list subfunction for input plug)
$ ./firewire-request /dev/fw1 fcp 0x01ffbfc000000000ffff00ff
response: 000: 08 ff bf c0 00 00 00 00 ff ff 00 ff
(AV/C EXTENDED STREAM FORMAT INFO list subfunction for output plug)
$ ./firewire-request /dev/fw1 fcp 0x01ffbfc001000000ffff00ff
response: 000: 08 ff bf c0 01 00 00 00 ff ff 00 ff
(AV/C EXTENDED STREAM FORMAT INFO single subfunction for input plug)
$ ./firewire-request /dev/fw1 fcp 0x01ffbfc100000000ffffffff
response: 000: 08 ff bf c1 00 00 00 00 ff ff ff ff
(AV/C EXTENDED STREAM FORMAT INFO single subfunction for output plug)
$ ./firewire-request /dev/fw1 fcp 0x01ffbfc101000000ffffffff
response: 000: 08 ff bf c1 01 00 00 00 ff ff ff ff

Reference: https://mailman.alsa-project.org/pipermail/alsa-devel/2012-May/052264.html
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 72 ++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 36c3dd84d189..80c9dc13f1b5 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -735,45 +735,57 @@ int snd_oxfw_stream_discover(struct snd_oxfw *oxfw)
 	/* use oPCR[0] if exists */
 	if (plugs[1] > 0) {
 		err = fill_stream_formats(oxfw, AVC_GENERAL_PLUG_DIR_OUT, 0);
-		if (err < 0)
-			goto end;
+		if (err < 0) {
+			if (err != -ENXIO)
+				return err;
 
-		for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
-			format = oxfw->tx_stream_formats[i];
-			if (format == NULL)
-				continue;
-			err = snd_oxfw_stream_parse_format(format, &formation);
-			if (err < 0)
-				continue;
-
-			/* Add one MIDI port. */
-			if (formation.midi > 0)
-				oxfw->midi_input_ports = 1;
-		}
+			// The oPCR is not available for isoc communication.
+			err = 0;
+		} else {
+			for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
+				format = oxfw->tx_stream_formats[i];
+				if (format == NULL)
+					continue;
+				err = snd_oxfw_stream_parse_format(format,
+								   &formation);
+				if (err < 0)
+					continue;
+
+				/* Add one MIDI port. */
+				if (formation.midi > 0)
+					oxfw->midi_input_ports = 1;
+			}
 
-		oxfw->has_output = true;
+			oxfw->has_output = true;
+		}
 	}
 
 	/* use iPCR[0] if exists */
 	if (plugs[0] > 0) {
 		err = fill_stream_formats(oxfw, AVC_GENERAL_PLUG_DIR_IN, 0);
-		if (err < 0)
-			goto end;
+		if (err < 0) {
+			if (err != -ENXIO)
+				return err;
 
-		for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
-			format = oxfw->rx_stream_formats[i];
-			if (format == NULL)
-				continue;
-			err = snd_oxfw_stream_parse_format(format, &formation);
-			if (err < 0)
-				continue;
-
-			/* Add one MIDI port. */
-			if (formation.midi > 0)
-				oxfw->midi_output_ports = 1;
-		}
+			// The iPCR is not available for isoc communication.
+			err = 0;
+		} else {
+			for (i = 0; i < SND_OXFW_STREAM_FORMAT_ENTRIES; i++) {
+				format = oxfw->rx_stream_formats[i];
+				if (format == NULL)
+					continue;
+				err = snd_oxfw_stream_parse_format(format,
+								   &formation);
+				if (err < 0)
+					continue;
+
+				/* Add one MIDI port. */
+				if (formation.midi > 0)
+					oxfw->midi_output_ports = 1;
+			}
 
-		oxfw->has_input = true;
+			oxfw->has_input = true;
+		}
 	}
 end:
 	return err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
