Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F84CE00A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33445167E;
	Mon,  7 Oct 2019 13:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33445167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570447025;
	bh=wBhMO1vpw3lS52tHqG1VjzxjtHyEAlA1HcZ6UQZGphg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tusSnFvwvHqIjrLEvCeQkhnG7OxZYiLtDlcw0mLamnl6+QA6o03NC2vKG4iRG/FIb
	 //AVetl/MDwUJQmKIb3tlpopaa3/Yxik0miL+FBr5KNimA54EZeOf3sx4vwiFLeYG4
	 i6RImDyil6a2kazKAQ4jNsc/3iwR0g/Yz29xEVfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F34A5F8073C;
	Mon,  7 Oct 2019 13:06:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38336F806EF; Mon,  7 Oct 2019 13:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB464F80676
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB464F80676
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="E3cGO4bH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mJX6Q5+Y"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E52742134B;
 Mon,  7 Oct 2019 07:05:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=UFoMct5arTuwt
 UFyyhdBXryFak0beI4PoX34I6zB3bw=; b=E3cGO4bHbrh+Vo0dNLWQH+5Y2JAHr
 3xCdH9+KwXqMeL4jtng+ovVP5/TUz+59LiDNhFQTx2OLRcKFQ34Od9//zgLLz5xe
 Nb8kevLr0lOFbmIVrgGw69BKdOr1Mrn70GfK+s5IOuN0MYsw7YvJl4nIEtQiiQEE
 sjLOUE+7VaMJd93Efb2tr9qMYVT0Xhe9hGy4WTb8IJrWaqn7t6yMNCj+CPZFZeH2
 YiZoeoKvskw2Rz/hWqtMMFuWZYVHopxBYTlCSoF+pB6Zf20EBdkPX2Aa4m1811N/
 +cFUqgiPLKJW/hNler86M0CFTBbPYh6Rg7QzsVoCx/zObWSS/XP/aH3/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=UFoMct5arTuwtUFyyhdBXryFak0beI4PoX34I6zB3bw=; b=mJX6Q5+Y
 jluzGHneV3GVsWkwNufa8bQhCmrIF7wk7IKAiwRn9q83ErtQIrPNEznQyxTJAbZ6
 7U45U2VG5kV4ng7RkzmCSOYnzveq/f/peeo+6Vb9moeXoUxj+3bj2Sjq+jN96Yg5
 wGKv3RAacxySd21m8vabGae7UAZgHtE2tI8G9j8M53y4yhOsM2SNqxq7Y9N6WhRu
 eMPDo7RnYC5ELyK8uYO+Gt6UvOwpjiy5EZMtxql34apUL56kBM5CIh3Lly0pGzg2
 COSRB5sUpWRomqyn1kCEi824AF3TmInIW42aDivkSqtWK6jRvz7jHVNYN5tXomzs
 ufAPEy28l9MMhg==
X-ME-Sender: <xms:FRybXfDrEfJYkFHn5Yn6wZmDbsmm2fbIb0iYHtO7DrjOUkg2DEC3RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:FRybXX6Batb2lEQpKDLHAl4AN5kVmCiYCe4tzaJN358QvgZHuks7Fw>
 <xmx:FRybXcCRY2j12Z2GFGpDszDjVFEFuUlwLSBbri5LK7cTFk6MAIAj1Q>
 <xmx:FRybXTeh1b6blU2gPJAtuibqg74BN3D46pgwi0NIAgEzfjpBe7Hdag>
 <xmx:FRybXQlqq4QMAUXqJjRD_StTsSF3LlyZu5ALALuT9RuYCn8BCCh-hA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F48F80059;
 Mon,  7 Oct 2019 07:05:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:29 +0900
Message-Id: <20191007110532.30270-15-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 14/17] firewire-digi00x: use the same size of
	period for PCM substream in AMDTP streams
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

In current implementation, when opening a PCM substream, it's needed to
check whether the opposite PCM substream runs. This is to assign
effectual constraints (e.g. sampling rate) to opened PCM substream.

The number of PCM substreams and MIDI substreams on AMDTP streams in
domain is recorded in own structure. Usage of this count is an
alternative of the above check. This is better because the count is
incremented in pcm.hw_params earlier than pcm.trigger.

This idea has one issue because it's incremented for MIDI substreams as
well. In current implementation, for a case that any MIDI substream run
and a PCM substream is going to start, PCM application to start the PCM
substream can decide hardware parameters by restart packet streaming.
Just checking the substream count can brings regression.

Now AMDTP domain structure has a member for the size of PCM period in
PCM substream which starts AMDTP streams in domain. When the value has
zero and the substream count is greater than 1, it means that any MIDI
substream starts AMDTP streams in domain. Usage of the value can resolve
the above issue.

This commit replaces the check with the substream count and the value for
the size of PCM period.

I note that DOT AMDTP protocol has a quirk to use different transmission
method of IEC 61883-6 for tx/rx streams; non-blocking in tx stream and
blocking in rx stream. Although the difference of transmission method
between tx/rx streams precisely brings different timing for a certain
amount of events due to their different calculation for data blocks per
packet, it's possible to approximate enough amount of events mostly has
the same timing. Actually current ALSA IEC 61883-1/6 engine uses large
amount of data blocks for each hardware IRQ (=16 packets).

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-pcm.c | 35 ++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 9ced309d61fa..8dbfb3ff17f6 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -100,14 +100,14 @@ static int pcm_init_hw_params(struct snd_dg00x *dg00x,
 static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
+	struct amdtp_domain *d = &dg00x->domain;
 	enum snd_dg00x_clock clock;
 	bool detect;
-	unsigned int rate;
 	int err;
 
 	err = snd_dg00x_stream_lock_try(dg00x);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = pcm_init_hw_params(dg00x, substream);
 	if (err < 0)
@@ -127,19 +127,40 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		}
 	}
 
+	mutex_lock(&dg00x->mutex);
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
 	if ((clock != SND_DG00X_CLOCK_INTERNAL) ||
-	    amdtp_stream_pcm_running(&dg00x->rx_stream) ||
-	    amdtp_stream_pcm_running(&dg00x->tx_stream)) {
+	    (dg00x->substreams_counter > 0 && d->events_per_period > 0)) {
+		unsigned int frames_per_period = d->events_per_period;
+		unsigned int rate;
+
 		err = snd_dg00x_stream_get_external_rate(dg00x, &rate);
-		if (err < 0)
+		if (err < 0) {
+			mutex_unlock(&dg00x->mutex);
 			goto err_locked;
+		}
 		substream->runtime->hw.rate_min = rate;
 		substream->runtime->hw.rate_max = rate;
+
+		if (frames_per_period > 0) {
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+			if (err < 0) {
+				mutex_unlock(&dg00x->mutex);
+				goto err_locked;
+			}
+		}
 	}
 
+	mutex_unlock(&dg00x->mutex);
+
 	snd_pcm_set_sync(substream);
-end:
-	return err;
+
+	return 0;
 err_locked:
 	snd_dg00x_stream_lock_release(dg00x);
 	return err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
