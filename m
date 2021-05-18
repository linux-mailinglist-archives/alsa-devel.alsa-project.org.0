Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACB38700B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C941690;
	Tue, 18 May 2021 04:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C941690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621306164;
	bh=/CoxoUZsR5uLKkQvd13H8mfeGMfi5IKzHU7uDT7xLgg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfGuYyZ+U7EElzg13ydwQJoiQNdZNZ84PIuhMtuQhoBSwMcB51gSyQbgEOIYINLAD
	 1Fi07aS5PmxS9xZwhUNzYMO8QMWoDlwYPbu8M0AqLvlyQz7sFqGd2Kum2q6j1gknaM
	 /sAoltwJevBLXNp1jTDkjvs2O8NbnDJmBGMxOtKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D783F804FF;
	Tue, 18 May 2021 04:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6B8DF804DA; Tue, 18 May 2021 04:44:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F79FF8042F
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F79FF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0loEqb/2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YbzKr6Az"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6BDC55C01A3;
 Mon, 17 May 2021 22:43:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 17 May 2021 22:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Z4lmgCuUgwPzP
 8ylS6vFr2zm/KxvNQxOxXqFDPLlKow=; b=0loEqb/2jwH7Lar/m4FpwjB6lVFSm
 vkiVwSDysILvoBEuuhmRDz4Jc7sm1z7aRO47CmN05LcI9t87RjBYNGDeiSTF1sM4
 Ue7n9CXTCV81toDJY4YzbGShyT801UgbEr29NgD1jCT5F3JEGREt+A7kNdRWyDa7
 q0C5NALD2Qe6agwaGMMQPoBnyh/wRbiCkTePWtlCe5vi9cLIuWb8OD3NAmwvW+jZ
 DJ8nPYqoSOwHXtYPuVZo5jdEMZBvTKRQ7s9+CpYy0692WpmhDqzCdMin9Dc6WQDD
 N3ccq6Xlr3tzdfoMjME5ZYqCOOVw9FX6Dr6DkDWB7zDr1Wk4O9PgsqCcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z4lmgCuUgwPzP8ylS6vFr2zm/KxvNQxOxXqFDPLlKow=; b=YbzKr6Az
 I01wX0gBeT9y8Y+4KEnZGvskj17GfnNzrsC8QSxPFD4de2bjeb2eC7NrzAmfoj2Z
 vml7X8SFH53Y/5oWa5xzYw2mNFKYlICaYK8hJnVqrDM3x/+6MHvzNNpAdqhl76NZ
 oXfw1wp4L3x/S6qXiUBJkj7/462GCtTMjdF4khvqU8E51OU8eXQ8r7mPpom3oVQh
 Y08Nx8HCh2BdM4Cngro0kKEUzEwK4WbHk/l2GU89j7fm6xNaI4Iz455a9VshN+pU
 zkELfAZOrJqYiTdFqHjCB8qrlbiMs7xaPoXFFurdwr8RqqFW/eterKkBlr8c91W8
 uhwoCOi0GYnlFw==
X-ME-Sender: <xms:4SmjYLQceW-ujgkqbWmcfYQMQt9AeDdQUWFY-rbMT3iO0mbs1TzDeQ>
 <xme:4SmjYMwMQRzedQW5ndj_g28R6dz2q-IqmuFdIynduC8-fqlcUZf-LfG9pmmePGYhs
 XWatyt40SoaNK0JXo8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4SmjYA0ToiQ8fmG9_ip9O_s8aXLzPvG4ML9ZOV7frFEIGfdGRRbeVw>
 <xmx:4SmjYLA2_1DPIrma312VJjZ_9h5QI4QAXGR2L3mAqvC3mU-N9B1rMg>
 <xmx:4SmjYEgtUA7Nb5IL-XMPQNuc3SYhpuElYd2WOvGEY236aE9tewk-Lg>
 <xmx:4SmjYMKk5144yilUaEzroQpxzdcd_KggLce0qk6w-iB6UrM2ZwxBtQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 10/11] ALSA: oxfw: code refactoring for wrong_dbs quirk
Date: Tue, 18 May 2021 11:43:25 +0900
Message-Id: <20210518024326.67576-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
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

A new entry is added to the quirk enumeration for wrong_dbs quirk to
obsolete structure member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 2 +-
 sound/firewire/oxfw/oxfw.c        | 2 +-
 sound/firewire/oxfw/oxfw.h        | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 65b458da2796..de6b40c04810 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -163,7 +163,7 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 
 		if (oxfw->quirks & SND_OXFW_QUIRK_JUMBO_PAYLOAD)
 			flags |= CIP_JUMBO_PAYLOAD;
-		if (oxfw->wrong_dbs)
+		if (oxfw->quirks & SND_OXFW_QUIRK_WRONG_DBS)
 			flags |= CIP_WRONG_DBS;
 	} else {
 		conn = &oxfw->in_conn;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 90a66e1312fe..966697dace47 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -176,7 +176,7 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 	 * value in 'dbs' field of CIP header against its format information.
 	 */
 	if (vendor == VENDOR_LOUD && model == MODEL_SATELLITE)
-		oxfw->wrong_dbs = true;
+		oxfw->quirks |= SND_OXFW_QUIRK_WRONG_DBS;
 
 	return 0;
 }
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index bc6706984fbb..daac38d046db 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -36,6 +36,8 @@ enum snd_oxfw_quirk {
 	// Postpone transferring packets during handling asynchronous transaction. As a result,
 	// next isochronous packet includes more events than one packet can include.
 	SND_OXFW_QUIRK_JUMBO_PAYLOAD = 0x01,
+	// The dbs field of CIP header in tx packet is wrong.
+	SND_OXFW_QUIRK_WRONG_DBS = 0x02,
 };
 
 /* This is an arbitrary number for convinience. */
@@ -51,7 +53,6 @@ struct snd_oxfw {
 
 	// The combination of snd_oxfw_quirk enumeration-constants.
 	int quirks;
-	bool wrong_dbs;
 	bool has_output;
 	bool has_input;
 	u8 *tx_stream_formats[SND_OXFW_STREAM_FORMAT_ENTRIES];
-- 
2.27.0

