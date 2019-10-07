Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F78CDFE2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5F021616;
	Mon,  7 Oct 2019 13:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5F021616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446547;
	bh=I+QQ9utPmsUwTNteX1Im4pGfoKnGzc9dvl8G23dXCxU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDZ/1XaKJMAjXvFKnSEh5Oy8YAmnE+ZNZdX6GFPakj5p3wNY0oj3PgUPAiNl5WzpL
	 ylQxcdAoM/xa/Y5JUIt0XoOlF+WyGGv7HpEXHzUaQzHi4OuZe6s8EZck+sfvwm54nj
	 U0k1gyqC1f4oTsNA15k3KjfgeH6th0XK78ojRZAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26DD0F805FF;
	Mon,  7 Oct 2019 13:05:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85D79F805FA; Mon,  7 Oct 2019 13:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3EFBF800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3EFBF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="eVnt7T+3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RqKw1YZs"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 927E92067B;
 Mon,  7 Oct 2019 07:05:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mnBEDLcTgcXz+
 8mOJe8yz/sLblacVGailhfmQRcEnFs=; b=eVnt7T+3a3e0ABW6mgYHGeL9eurVn
 5yT3ajjtF8mIHFrpoWP9TCFCkQaC0tm9JNzApxn7ID5y4rfuRb0fDZMzei5Lc2s3
 ksj9rr/lUvRFp1yvyYrCoYyoBoovRintMDgLDTg5rM662l7TuVgjHEaw/HYHn577
 3uC9GtbsPh1UrrZCXRhfFrx7vs4ALiktmDhDfYLb2elLXfyj1Os+HCVK++v3WB8P
 M79yKKOg4vk7rgEiLhrU0LesbYropQhJe1UVbEoLVYOZaXWnwWVmaE3sivyUPQI7
 o+egfFMts/lwa5Vv3LuVJ/FmQlR1bbLfCfc2Drwg13P/we8qF7f1q9rvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=mnBEDLcTgcXz+8mOJe8yz/sLblacVGailhfmQRcEnFs=; b=RqKw1YZs
 9CGRJRBMqw5wAAgocGThoCDDJEfe7BmkRGMT9Cd0nQCsWPJDjgkpIBB7N7pEVIgG
 K2nM9TDTG0R/aXRg8SRY+9DbHZSjVSPimgA8wzx6M1n03bJAwJcqz6mJKUTMIPS7
 4Xe4KiAKIn1jyaEpdroJg/9QJIISfWCqldVXa0WZRMurV6M9E9Vemp+Jy5aSLow9
 dYn9ObfBAhIgNnPJw6Kzi4kO14bAstaqy98LMHsGFS2Vinm42GoTR1RwteXuAnY/
 17PS2YoLxO06/iPl7T+e9KfcjTbOvt41Z3uxk464IOzC1i6IrCabbDUc12RgrPSj
 9kCvqJcV1z6TqA==
X-ME-Sender: <xms:AxybXVEu8eC54hJGIwTk2rJWKVCE4TgEY1Yr9hnK70GGiuwRHVoyZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:AxybXareRUk0ukIEFQy3UKQtf_b9xjZVj5lVz0AP1JRRBmbel2Ib2Q>
 <xmx:AxybXSmrUJNoEiBo7YiT4dgBd6Jy6oy4uXDVr7TIRyQCEVconBv7rQ>
 <xmx:AxybXVjgFmmsS2Ys6r91CHpqaobyJQHSHSpRQ2nRjogW54p05eGC3g>
 <xmx:AxybXUp-znTq0XI9cw9WyeZ366XzT5qWmCwhNC1zsgAdPD5dIiFlAg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CF9F8005A;
 Mon,  7 Oct 2019 07:05:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:17 +0900
Message-Id: <20191007110532.30270-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/17] bebob: register the size of PCM period
	to AMDTP domain
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
 sound/firewire/bebob/bebob.h        |  3 ++-
 sound/firewire/bebob/bebob_midi.c   |  2 +-
 sound/firewire/bebob/bebob_pcm.c    |  4 +++-
 sound/firewire/bebob/bebob_stream.c | 11 ++++++++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index 356d6ba60959..8738c1d8abf7 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -217,7 +217,8 @@ int snd_bebob_stream_get_clock_src(struct snd_bebob *bebob,
 				   enum snd_bebob_clock_type *src);
 int snd_bebob_stream_discover(struct snd_bebob *bebob);
 int snd_bebob_stream_init_duplex(struct snd_bebob *bebob);
-int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate);
+int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate,
+				    unsigned int frames_per_period);
 int snd_bebob_stream_start_duplex(struct snd_bebob *bebob);
 void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob);
 void snd_bebob_stream_destroy_duplex(struct snd_bebob *bebob);
diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index 4d8805fa8a00..e8f9edf50be5 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		return err;
 
 	mutex_lock(&bebob->mutex);
-	err = snd_bebob_stream_reserve_duplex(bebob, 0);
+	err = snd_bebob_stream_reserve_duplex(bebob, 0, 0);
 	if (err >= 0) {
 		++bebob->substreams_counter;
 		err = snd_bebob_stream_start_duplex(bebob);
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 0fb9eed46837..3b2227abf8a9 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -197,9 +197,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int frames_per_period = params_period_size(hw_params);
 
 		mutex_lock(&bebob->mutex);
-		err = snd_bebob_stream_reserve_duplex(bebob, rate);
+		err = snd_bebob_stream_reserve_duplex(bebob, rate,
+						      frames_per_period);
 		if (err >= 0)
 			++bebob->substreams_counter;
 		mutex_unlock(&bebob->mutex);
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 73fee991bd75..f1db3ddc3e00 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -554,7 +554,8 @@ static int keep_resources(struct snd_bebob *bebob, struct amdtp_stream *stream,
 	return cmp_connection_reserve(conn, amdtp_stream_get_max_payload(stream));
 }
 
-int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate)
+int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate,
+				    unsigned int frames_per_period)
 {
 	unsigned int curr_rate;
 	int err;
@@ -607,6 +608,14 @@ int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate)
 			cmp_connection_release(&bebob->out_conn);
 			return err;
 		}
+
+		err = amdtp_domain_set_events_per_period(&bebob->domain,
+							 frames_per_period);
+		if (err < 0) {
+			cmp_connection_release(&bebob->out_conn);
+			cmp_connection_release(&bebob->in_conn);
+			return err;
+		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
