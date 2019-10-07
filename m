Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E293CDFEF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D651683;
	Mon,  7 Oct 2019 13:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D651683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446653;
	bh=f5+BTRMAWP4b7lZRPcoZlafa6Q8sBky3Tri6O3Nno10=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vKF90iFGLbykiOciz+tPQCghmPPbiy1+/fgD8aRSZzSQBrhxfjGghjcXq+o3k9g7f
	 UtaEOvJuUehpiKORk13z93xlQJgJj3dlXsTxXwNfmhWEBGDKpQZSzn1+PeXuqKGx9f
	 ZBDynEkflg8Gr0wKWr4PVlE83NkEPih3IniZR8TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36308F8065A;
	Mon,  7 Oct 2019 13:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50453F805FE; Mon,  7 Oct 2019 13:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFA27F80323
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA27F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pYO/IVpQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bEPNcOBu"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 139A72067B;
 Mon,  7 Oct 2019 07:05:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=V3YdJ6yx0HnVV
 rfYPgDtRVQxD3ax/dSI9ZGAX7gGv+I=; b=pYO/IVpQAeFkmnVvHItTbmGCAF/j0
 mfSdpf95U4x5NOyfFCnPNuTX0I5BaLSZDhcLQvi4ocqz0QGIzgPFiJSIerjD6HAI
 VzDFZucIJUBMH2SxuuIB8B/dgJZJfjiUTj4ZAjAC9U6vREwzFfb/AZ6OH73y3F2d
 OK3moifiEgyhNfO+KlkZ9B+LgAY0bdGGgdD9Osan3pq1fDGcM8j4z6gKUwjWNNck
 IpnUPK1z57CNl1L8EKXgicx5a//hK1gUdn3y1JMaq0Af2+T6ePEEqSOePF+ui+Ai
 A/18K3d/py7PqyErS1q3XGnQYqpk6oYViRBplJz2GtshtDz9S/c+M4CcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=V3YdJ6yx0HnVVrfYPgDtRVQxD3ax/dSI9ZGAX7gGv+I=; b=bEPNcOBu
 NQ75eiKRuded3Zdk+BfWpgFiYPIvJiCYI05NNI597booGa0Cr7kIRkZ8UsmjxutW
 PndMpPwxRmP62ym/O0jconclepudsqX8nYTSwLqNOHKt9MXi3AcYt9fpprwrSPvS
 xRDoABMr3QtU02yDXlqq3X/ZnAncRwORHJ6APfF3JjQRVy8SGriEWD6gH+31aSZU
 cG/fbgRd54kJHYHYdF0mSmyfF5+Ksj0WM4HihWlI+iVFOc5k13MMBZa7pHotNZub
 v7MfvCGgSGr8DhfueQicNJbuz8NfTdbNDK+W1Aj4rF7OsPj5IWRRNPb+NcqnP8oB
 5kDX5cG4tNRfHA==
X-ME-Sender: <xms:BxybXXFyyG_LeIoLUQ4A4L_wozPTc2UxEsgWsF2Fh97oA8D4__94MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:BxybXbRB6SaHOWb3ciGmsWW0GSt7pvie-nTzB6-xLv2km2KGLwQrvg>
 <xmx:BxybXflcCVimXVfr6KJSm9XGnNrF6toWb6WYAKQEZFku1fFk2OwLCA>
 <xmx:BxybXTlVg8p3dApFRW335ndwJXKQDoGIv7v_PVOru9ITNI-0jtNPqQ>
 <xmx:CBybXWD6WpKD1prctuvgh_yyxfwy8goDHusY6O63xNq6ftHPhpH5ug>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC32F8005A;
 Mon,  7 Oct 2019 07:05:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:20 +0900
Message-Id: <20191007110532.30270-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/17] dice: register the size of PCM period to
	AMDTP domain
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

This commit is a preparation to share the size of PCM period between
PCM substreams on AMDTP streams in the same domain. At this time,
the size of PCM period in PCM substream which starts AMDTP streams in the
same domain is recorded.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-midi.c   | 2 +-
 sound/firewire/dice/dice-pcm.c    | 7 ++++++-
 sound/firewire/dice/dice-stream.c | 8 +++++++-
 sound/firewire/dice/dice.h        | 3 ++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index c9e19bddfc09..69c3c06bd7aa 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&dice->mutex);
 
-	err = snd_dice_stream_reserve_duplex(dice, 0);
+	err = snd_dice_stream_reserve_duplex(dice, 0, 0);
 	if (err >= 0) {
 		++dice->substreams_counter;
 		err = snd_dice_stream_start_duplex(dice);
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index 94a4dccfc381..570456a7751d 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -243,9 +243,14 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int events_per_period = params_period_size(hw_params);
 
 		mutex_lock(&dice->mutex);
-		err = snd_dice_stream_reserve_duplex(dice, rate);
+		// For double_pcm_frame quirk.
+		if (rate > 96000)
+			events_per_period /= 2;
+		err = snd_dice_stream_reserve_duplex(dice, rate,
+						     events_per_period);
 		if (err >= 0)
 			++dice->substreams_counter;
 		mutex_unlock(&dice->mutex);
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index f6a8627ae5a2..ef36bf588d11 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -278,7 +278,8 @@ static void finish_session(struct snd_dice *dice, struct reg_params *tx_params,
 	snd_dice_transaction_clear_enable(dice);
 }
 
-int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate)
+int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate,
+				   unsigned int events_per_period)
 {
 	unsigned int curr_rate;
 	int err;
@@ -324,6 +325,11 @@ int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate)
 					  &rx_params);
 		if (err < 0)
 			goto error;
+
+		err = amdtp_domain_set_events_per_period(&dice->domain,
+							 events_per_period);
+		if (err < 0)
+			goto error;
 	}
 
 	return 0;
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index fa6d74303f54..1f9e3502974e 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -210,7 +210,8 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice);
 void snd_dice_stream_stop_duplex(struct snd_dice *dice);
 int snd_dice_stream_init_duplex(struct snd_dice *dice);
 void snd_dice_stream_destroy_duplex(struct snd_dice *dice);
-int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate);
+int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate,
+				   unsigned int events_per_period);
 void snd_dice_stream_update_duplex(struct snd_dice *dice);
 int snd_dice_stream_detect_current_formats(struct snd_dice *dice);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
