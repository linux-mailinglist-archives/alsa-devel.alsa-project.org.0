Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444194A22B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCD616F2;
	Tue, 18 Jun 2019 15:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCD616F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864654;
	bh=bNPnh9C8r6mGcz/5JoAygOIik802/YPBIP/WCuwzJPI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iT5Kwos+URcp4th2TVk8/+fo/BlvAE6YbuRHSIijBO7dLiXXrYoZAFKzbdIZ0e2KT
	 NJ3o49WRFBPentnTmeujnpmoD73G0Zb9bwh3IWgGcOwuMe5xV1U+tbcdF9gdvSDxmr
	 4LE4DVOz8jzd35324JtPR9Jc4M6Dst4NdMnlO5Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB03F8973D;
	Tue, 18 Jun 2019 15:26:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3883F89731; Tue, 18 Jun 2019 15:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F6CF80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F6CF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="njC5afhx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="exKe5BiG"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A9F32229C;
 Tue, 18 Jun 2019 09:26:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EVcmC5qZDBJTH
 rUqv/yi3h5vwPjZ7Dxb1YBLISjfqAE=; b=njC5afhxh3X0PnXoV09374XFA6bV4
 Fk0sL0z+LGqgU/LtEH3TmL4nVgPAYRfv/OLEmOayDB+OfpmXql6ce1+Ew9nf916x
 aNYBiTuH/sqKsfh9Cg4tKIPxMcR57rBC5p3/4kI1cCmyV2fGKipkVv4ua7dgUShC
 X2whig6mzs19mGgDrBd7eBPdwIrXm8Zow1L9vcJK4rV2XyT0aXjwBKWdTfAjGGnj
 PcPzWaJQPRSQ3Zt0fszD19YjJOEMW9GBvZhfwTCKq91Tx92vlfcFbfSQC8XyfqHV
 uaw1zRqyJ+KMOYSuXLaHovLttfluNacl6aPZZ+ldH7abtm0NCH3x+TEpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=EVcmC5qZDBJTHrUqv/yi3h5vwPjZ7Dxb1YBLISjfqAE=; b=exKe5BiG
 u6TUpNNNPBSqJg5gzkfM3vLXgvNiHWnr4P1NEK0KQYN4LswxmjabVtXNF41Aeoje
 OoeDfu8dd5Xej0QMrkzop7wfzDdpD8uT1+2ugksat3vqQ5gueD6pjKAXRP8ZAY7V
 5a8FZQKJ6enoiyfoKgfZexsP2HbDVhOfhrPBFgYzSzbolSCCxfF7aJs31ADu9G7L
 +JhxLyaoZOeVszVxoGGRjKQ3OowbYAJU+MbC09U28xglUkc04+hGkmhnokXVTwbA
 1iLYkOvGIKMK3tetlVtENT+B7ydyi8NpQxjH/bhyZFszdm254HGmnqitqsrrKyoC
 Mu5E08TyV/mwnQ==
X-ME-Sender: <xms:iuYIXYdHRbPxUbk8PtMcSaNR8LsJHUe6Mp1LDCXYlvFO1oXtBhMFrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:iuYIXeezWzbGw0D2Qph0UbOF9CEAmNXsEoQsMRuAj31GXUmV1yuDuw>
 <xmx:iuYIXUgQTHWZEONRRTt9Dyc1lXgEUIfE3IWaK23SQY-f5aH7VeOo0A>
 <xmx:iuYIXSSoYsnIcAY0tsTMcaynlVen233bBn6jvJ9fmUE4A1haYXRE4w>
 <xmx:iuYIXXTqVemfndEDkqrK7eFcx_jAu_hJLgSXDHX_zUzxKa8M7WkDiA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD545380083;
 Tue, 18 Jun 2019 09:26:32 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:18 +0900
Message-Id: <20190618132622.32659-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/8] ALSA: firewire-digi00x: unify stop and
	release method for duplex streams
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

From callbacks for pcm and rawmidi interfaces, the functions to stop
and release duplex streams are called at the same time. This commit
merges the two functions.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-midi.c   |  1 -
 sound/firewire/digi00x/digi00x-pcm.c    |  1 -
 sound/firewire/digi00x/digi00x-stream.c | 14 +++++---------
 sound/firewire/digi00x/digi00x.h        |  1 -
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index cca888cce0d3..ca06ad318ed6 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -37,7 +37,6 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 	mutex_lock(&dg00x->mutex);
 	--dg00x->substreams_counter;
 	snd_dg00x_stream_stop_duplex(dg00x);
-	snd_dg00x_stream_release_duplex(dg00x);
 	mutex_unlock(&dg00x->mutex);
 
 	snd_dg00x_stream_lock_release(dg00x);
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 9ed2ebdcf23a..c38fbd6ded9f 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -189,7 +189,6 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 		--dg00x->substreams_counter;
 
 	snd_dg00x_stream_stop_duplex(dg00x);
-	snd_dg00x_stream_release_duplex(dg00x);
 
 	mutex_unlock(&dg00x->mutex);
 
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 3c5e1c5a2e11..7c8e7ad48d03 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -293,14 +293,6 @@ int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 	return 0;
 }
 
-void snd_dg00x_stream_release_duplex(struct snd_dg00x *dg00x)
-{
-	if (dg00x->substreams_counter == 0) {
-		fw_iso_resources_free(&dg00x->tx_resources);
-		fw_iso_resources_free(&dg00x->rx_resources);
-	}
-}
-
 int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 {
 	unsigned int generation = dg00x->rx_resources.generation;
@@ -372,8 +364,12 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x)
 {
-	if (dg00x->substreams_counter == 0)
+	if (dg00x->substreams_counter == 0) {
 		finish_session(dg00x);
+
+		fw_iso_resources_free(&dg00x->tx_resources);
+		fw_iso_resources_free(&dg00x->rx_resources);
+	}
 }
 
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x)
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 3fb1c49f6f9e..2d026b5b0079 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -143,7 +143,6 @@ int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x);
 int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate);
 int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x);
-void snd_dg00x_stream_release_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
