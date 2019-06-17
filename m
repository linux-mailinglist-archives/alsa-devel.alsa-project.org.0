Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A047BFA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD3417A0;
	Mon, 17 Jun 2019 10:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD3417A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759522;
	bh=D5G7eQBEn7oLuESCFPo5wNkBPrIppDBpeUKM3nUYr4w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoDK/C2CBg6Mv8gKTkGytiWokOs4JZQJ5Cjy4PbJiAGVhYbVlmbeaiXrKu5Gbuprh
	 922ujAO2INsj2visdrxToU9C3fk9vaKHDgjlSgAL9k615JTEAbTvfWFiTx+POR5nAf
	 6tE4kpY8wiNC0Eb08GGnFnVUiEiBzqhQUkbZf82Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92B17F896F9;
	Mon, 17 Jun 2019 10:15:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A483F896DF; Mon, 17 Jun 2019 10:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41E6BF896C7
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41E6BF896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="d9XMYLO/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OrQNFWPo"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 50A79733;
 Mon, 17 Jun 2019 04:15:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=cdn31kMuapOah
 X8du0ABkm3PVe74ZvYkTvBlUtLQrEg=; b=d9XMYLO/XLtFGfSKp+scHsJaGfgD8
 YpG4Nx456lSmUo4cfx5m2hdmPe2w9kG6JqqHdW0vyPbLG+oVWoVSxEA0owf0Jn31
 LUPYbdvIDLzHjUULt2zZONgbFhge+ZBPq/1yaKrSsbY2gJfVJkCt4kRV5sBR5PdY
 7cC2YsqI1UoprshLrKvZuQcWjho0kRT14bC1S2v05uPYOoBp+E4kBdBY7L3Zkbs3
 fpXlafM+VazE0sPQgFFKDKpvyNc8IIV3o4WPBaWaWOrqW7KsxkkdANLXd26c54aK
 kN3QQNKVhm4EEWOybKwcbwyhj4584boadUEZV/VOT/6185ie1NDTC7ITQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=cdn31kMuapOahX8du0ABkm3PVe74ZvYkTvBlUtLQrEg=; b=OrQNFWPo
 ByYd4rjtbO5wuSIsp9E41TcUXAE6LRlwYs7rozywquLOJSIU4lNcHH7CyhAZx0Xy
 EsaDAGr2EIftG9Vr7wFv3BsIUbt4pdftRBmYVuIqVLbxIFmtZ3nuTWwF6z3Kkh/U
 wBa7ufT3xxFWONiVhVe6lIsJODY9+Ns7eKQZmWFybsyvAokiHPZypHLAewcfJ3Ud
 7MaBtVFzsiotipf1x0XptZvfFKNfBOIB0WyHH1wJk83b7BYzk0xI+R0yUu//N8Lv
 yp2D3sNHIby8n1Xk3yMD7zW373Fy+0YYlYFOfocOL4nOI/o+cS6mJeQiIKTGyV1N
 HzbdcZ2WsnyAIg==
X-ME-Sender: <xms:FkwHXZoYOs95XozHO9hWhE0m02l9XEOLImcy3EF2t7bOKt5FvbdJnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehrrgifmhhiughird
 hophgvnhenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:FkwHXVPNnAR-M7qToGZ3E_3CyDTj83WIdm5x5iiZs3QweKIqmgeS-w>
 <xmx:FkwHXRrhTPf1hFdWxpQiRYQbEmyppmXs9IeW2od9adHXHlCmJMknbA>
 <xmx:FkwHXTl1Um3rvDxL31XyC64_uF24hO5713R6wMwptHce01JuaucZew>
 <xmx:FkwHXRvu4p65sNdRX93T_UTZfVrd2JEcHrx8pPOkMxONcf9nw7zsvQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D56E80065;
 Mon, 17 Jun 2019 04:15:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:02 +0900
Message-Id: <20190617081510.11025-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/10] ALSA: firewire-motu: unify midi callback
	function
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

Two sets of callbacks for rawmidi.open/close but they have the same
codes. This commit unifies each of the callbacks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-midi.c | 49 ++++-----------------------------
 1 file changed, 6 insertions(+), 43 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index b2d339a8ef3f..3b205386ed24 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -7,7 +7,7 @@
  */
 #include "motu.h"
 
-static int midi_capture_open(struct snd_rawmidi_substream *substream)
+static int midi_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_motu *motu = substream->rmidi->private_data;
 	int err;
@@ -29,44 +29,7 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 	return err;
 }
 
-static int midi_playback_open(struct snd_rawmidi_substream *substream)
-{
-	struct snd_motu *motu = substream->rmidi->private_data;
-	int err;
-
-	err = snd_motu_stream_lock_try(motu);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&motu->mutex);
-
-	motu->substreams_counter++;
-	err = snd_motu_stream_start_duplex(motu, 0);
-
-	mutex_unlock(&motu->mutex);
-
-	if (err < 0)
-		snd_motu_stream_lock_release(motu);
-
-	return err;
-}
-
-static int midi_capture_close(struct snd_rawmidi_substream *substream)
-{
-	struct snd_motu *motu = substream->rmidi->private_data;
-
-	mutex_lock(&motu->mutex);
-
-	motu->substreams_counter--;
-	snd_motu_stream_stop_duplex(motu);
-
-	mutex_unlock(&motu->mutex);
-
-	snd_motu_stream_lock_release(motu);
-	return 0;
-}
-
-static int midi_playback_close(struct snd_rawmidi_substream *substream)
+static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_motu *motu = substream->rmidi->private_data;
 
@@ -129,13 +92,13 @@ static void set_midi_substream_names(struct snd_motu *motu,
 int snd_motu_create_midi_devices(struct snd_motu *motu)
 {
 	static const struct snd_rawmidi_ops capture_ops = {
-		.open		= midi_capture_open,
-		.close		= midi_capture_close,
+		.open		= midi_open,
+		.close		= midi_close,
 		.trigger	= midi_capture_trigger,
 	};
 	static const struct snd_rawmidi_ops playback_ops = {
-		.open		= midi_playback_open,
-		.close		= midi_playback_close,
+		.open		= midi_open,
+		.close		= midi_close,
 		.trigger	= midi_playback_trigger,
 	};
 	struct snd_rawmidi *rmidi;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
