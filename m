Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92298138C6C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 08:37:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98EB15F9;
	Mon, 13 Jan 2020 08:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98EB15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578901024;
	bh=g/3hwdarh07IE24m5+By2Y62Sn1v2DL4g0uqlf63ECQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Clgq1Bto8sTFVPDUwra1e5+tAU65AvqpiqGqWD9tQjYahdeTnFnVHjBLV8ns9AD+s
	 ysjzp44S4/TpNkVk3Undfz3OVe3sYN2v1XleTQ2IazMO8M1R6Ug2HKgzXGTqmc2aBH
	 67YeGHeRCZS+kcrdgqIXjpanWRNH9VrQYMk4Cnu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3897F8026A;
	Mon, 13 Jan 2020 08:34:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D851CF801F8; Mon, 13 Jan 2020 08:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C20F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 08:34:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C20F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="oUVazhM0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DkijYsVt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 65C8121C1B;
 Mon, 13 Jan 2020 02:34:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 02:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8XDTIEIYZrwCV
 oRrztFG1cjsBG5dxTldL2QcWaLfLcU=; b=oUVazhM0C0mKs1t+deNSneRJtYpgk
 S8hWk2KtisyDwhqsP/jooQomEzAOBWSaiNEXqnmZja+xTWUgDQUILcrdwKKQelhG
 W5IKPCbxt5xB3FObk8bu97UbQRw6GdgoIFvo20uUwyywpP6fgshccrQdgBPiud6v
 AmHnKcrDdC+NDHsh0NO6tn89fRe6zmwdggfOrMoSKL4armq9u21Z6/cG1qNzU0i9
 49gf4ExeK9nWcMHkWtl0lrjR1x4dPS8h13lXHDO/GqElLYgMTMWZ0RVNS3k/YjG6
 St/eM6kEVl0odrRDrOHIxc2l6Xyt68oYgOezvmxPVCTN18zuSGSegHgIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8XDTIEIYZrwCVoRrztFG1cjsBG5dxTldL2QcWaLfLcU=; b=DkijYsVt
 WibwoS9Jm9BRY4EqtcnzhndIAndq8u+UrJSGhlPM8d6IEdw5K7ZZR3JjJtSUmFHz
 GkMzzF3I1pIXSBCKBAL3x3KC46j8SL38vE0XrX+OnqfzKrLal/Xz+0xNZ6nE0LBR
 KToCzCt3s5JZaX4W9psgUKkn3/g8GNJakqAMFaRMeoWx7eItPnLGqihSv1M3Ebkm
 uKhCI0YR9RND85oo3+cGPwhTuGde8t1iDZqSoZmjYvXO2SFJkjUe+VDYlJbk3BKg
 z1BQlRw5xJB3rBEuPlpUYwe1p6G8x7gff+yHDIj20xkvHYh5V+mwGJDopCXji12h
 cfLE1NNYD+Kxvg==
X-ME-Sender: <xms:gB0cXqlCUGn3F8TcSvSNfsr2BsjnmfqL4_Jhdd2msdeetV1kxmr0og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:gB0cXlFAWil6Sa3NFoUqGmxYam83RaGQiKdPG6D0N1ZZ2hJHUJymAQ>
 <xmx:gB0cXiGsrCKBxmPNTWgsb2Yc3K7jvTVgJS5iqfWahPaJAmRxAr1Zug>
 <xmx:gB0cXqNr-JyO51Es9VoRrLcGheuQMKtKBm03bE4YRvBAzitKJjQ6Ww>
 <xmx:gB0cXkmA8WYWQStSGyb8WXU9OMCiO4ubqcoV8q_-vFegzE1gsOuRoQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A67B80065;
 Mon, 13 Jan 2020 02:34:23 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 16:34:17 +0900
Message-Id: <20200113073418.24622-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113073418.24622-1-o-takashi@sakamocchi.jp>
References: <20200113073418.24622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/3] ALSA: oxfw: don't add MIDI/PCM interface
	when packet streaming is unavailable
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

Stanton SCS.1d doesn't support packet streaming even if it has plugs for
isochronous communication.

This commit is a preparation for this case. The 'has_input' member is
added to specific structure, and MIDI/PCM interfaces are not added when
the member is false.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c |  2 ++
 sound/firewire/oxfw/oxfw.c        | 39 +++++++++++++++++--------------
 sound/firewire/oxfw/oxfw.h        |  1 +
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 692324670c78..36c3dd84d189 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -772,6 +772,8 @@ int snd_oxfw_stream_discover(struct snd_oxfw *oxfw)
 			if (formation.midi > 0)
 				oxfw->midi_output_ports = 1;
 		}
+
+		oxfw->has_input = true;
 	}
 end:
 	return err;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index fb6df3fc018e..1f1e3236efb8 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -118,7 +118,8 @@ static void oxfw_card_free(struct snd_card *card)
 {
 	struct snd_oxfw *oxfw = card->private_data;
 
-	snd_oxfw_stream_destroy_duplex(oxfw);
+	if (oxfw->has_output || oxfw->has_input)
+		snd_oxfw_stream_destroy_duplex(oxfw);
 }
 
 static int detect_quirks(struct snd_oxfw *oxfw)
@@ -206,23 +207,25 @@ static void do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = snd_oxfw_stream_init_duplex(oxfw);
-	if (err < 0)
-		goto error;
+	if (oxfw->has_output || oxfw->has_input) {
+		err = snd_oxfw_stream_init_duplex(oxfw);
+		if (err < 0)
+			goto error;
 
-	err = snd_oxfw_create_pcm(oxfw);
-	if (err < 0)
-		goto error;
+		err = snd_oxfw_create_pcm(oxfw);
+		if (err < 0)
+			goto error;
 
-	snd_oxfw_proc_init(oxfw);
+		snd_oxfw_proc_init(oxfw);
 
-	err = snd_oxfw_create_midi(oxfw);
-	if (err < 0)
-		goto error;
+		err = snd_oxfw_create_midi(oxfw);
+		if (err < 0)
+			goto error;
 
-	err = snd_oxfw_create_hwdep(oxfw);
-	if (err < 0)
-		goto error;
+		err = snd_oxfw_create_hwdep(oxfw);
+		if (err < 0)
+			goto error;
+	}
 
 	err = snd_card_register(oxfw->card);
 	if (err < 0)
@@ -274,9 +277,11 @@ static void oxfw_bus_reset(struct fw_unit *unit)
 	fcp_bus_reset(oxfw->unit);
 
 	if (oxfw->registered) {
-		mutex_lock(&oxfw->mutex);
-		snd_oxfw_stream_update_duplex(oxfw);
-		mutex_unlock(&oxfw->mutex);
+		if (oxfw->has_output || oxfw->has_input) {
+			mutex_lock(&oxfw->mutex);
+			snd_oxfw_stream_update_duplex(oxfw);
+			mutex_unlock(&oxfw->mutex);
+		}
 
 		if (oxfw->entry->vendor_id == OUI_STANTON)
 			snd_oxfw_scs1x_update(oxfw);
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index c30e537087b0..fa2d7f9e2dc3 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -45,6 +45,7 @@ struct snd_oxfw {
 
 	bool wrong_dbs;
 	bool has_output;
+	bool has_input;
 	u8 *tx_stream_formats[SND_OXFW_STREAM_FORMAT_ENTRIES];
 	u8 *rx_stream_formats[SND_OXFW_STREAM_FORMAT_ENTRIES];
 	bool assumed;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
