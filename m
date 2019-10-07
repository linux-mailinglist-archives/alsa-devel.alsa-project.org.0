Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B0CDFF5
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B6BC1673;
	Mon,  7 Oct 2019 13:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B6BC1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446699;
	bh=pYW3S9oNVy8xSHcTWIa6WsUBeEPJ2IqnaTJhEsDF7E0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nOvTt9RG/1bmwSGOcn6kjHswk/XMuwdE4vBofTVSNW520mH4c6PEl2B4QKy49ZSq3
	 Lc3wOIl1d2pDnlLOOt334HhHNIes6XDxpp5Q5LnzZgOH6eS/bcd9r/mDLOQRGNRRan
	 btwPRHjr3JQ+upwzell1fwiwntPE7KtPeksHQv0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49DFAF8065C;
	Mon,  7 Oct 2019 13:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FDD8F8060D; Mon,  7 Oct 2019 13:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6183F802DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6183F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="YbldiFyV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="i55tmEBy"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 849F821B8B;
 Mon,  7 Oct 2019 07:05:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ppfhuFKqq348J
 Mh/ei6LBo/QqwSsKLXRNwzB97IzCvQ=; b=YbldiFyVrjtPTPv+9uipVhhSJivtl
 c5eq1usvZ+IDtNQTb5pTFqiGK4+OBfpauUyqRy6ilyFMnhvUO+UBMHwLfN4SbHVN
 cVXaRILepJVwtGWlYC378fSRFSF1IjMYDLlwrazUKOZ0fXfeKO6z2tEOEPBWZIbk
 RF67ObnBTLczY8q5SLT1uhsTT4Lcaoon+pjoOkKJf51ASsAW0J+yfubsVXn8Ovzx
 gSpjrB7va6CqVBQvWqBZMF6SnhY6/v9SeYIQvmcZ4Atd0gPq82h0OtNpi7Z5CPHK
 1qlfRVGK6T6THVUSKtQEGBMLaSrE0K9c+ib+D6/pcntDLvjso+d0+J5TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ppfhuFKqq348JMh/ei6LBo/QqwSsKLXRNwzB97IzCvQ=; b=i55tmEBy
 9FkDp1V4rvlOTqvk3ENvGTBjyG4+xwz5C4TlsYWOSB/mBWgiN44azSV73ATK9y87
 Cqd1kTgm1IQoikL4N89fJ9d/N1IUv7AlPhsH3apDNvkohma+l1j5Gl04ZLgxVw+b
 aLzhJqZRjUAk0Ha0j6aMDOYUTQPLFldDczfX4VuxfiiRbXZgusiVW9w6qj1f52W4
 rDPgURWDFJPPHEICJc2YHrtw48Apz2soZ+oXeLQuOSLSmkrLjwfo0J/u99gYxF15
 CrqrUK0Ev8QjiKv4ihmysPcDcPLHxFXQcpQEhV8TBqQmx35hajnaBB9QFjKEC3aL
 Z7lBX/S2RGLpxA==
X-ME-Sender: <xms:CRybXbvW8hhowqD7GczPnECK20Jw7oyda2ujEiptxs2bjE7bke0GRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:CRybXX2O9Agkes1ebmllYkQEgC671LdQPHSXKQouK6Xf6lh21f0y4g>
 <xmx:CRybXYL_EXYUior3seOegJyzURqW3tqZYCqXRwe1MFB86VZXl3Amhg>
 <xmx:CRybXR_eeyxxwzDdS4YsnKDTxd00I9_z4cdBMQBxYbr5ToU44-11tA>
 <xmx:CRybXa1KN7qe_uCUVKy1ZH7wPWnkGPMfIWnhSg0opC0Ln-VTMH138Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 334F08005A;
 Mon,  7 Oct 2019 07:05:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:21 +0900
Message-Id: <20191007110532.30270-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/17] firewire-digi00x: register the size of
	PCM period to AMDTP domain
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
 sound/firewire/digi00x/digi00x-midi.c   |  2 +-
 sound/firewire/digi00x/digi00x-pcm.c    |  4 +++-
 sound/firewire/digi00x/digi00x-stream.c | 11 ++++++++++-
 sound/firewire/digi00x/digi00x.h        |  3 ++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index 2b57ece89101..a407e795d8e7 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		return err;
 
 	mutex_lock(&dg00x->mutex);
-	err = snd_dg00x_stream_reserve_duplex(dg00x, 0);
+	err = snd_dg00x_stream_reserve_duplex(dg00x, 0, 0);
 	if (err >= 0) {
 		++dg00x->substreams_counter;
 		err = snd_dg00x_stream_start_duplex(dg00x);
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 18e561b26625..9ced309d61fa 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -167,9 +167,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int frames_per_period = params_period_size(hw_params);
 
 		mutex_lock(&dg00x->mutex);
-		err = snd_dg00x_stream_reserve_duplex(dg00x, rate);
+		err = snd_dg00x_stream_reserve_duplex(dg00x, rate,
+						      frames_per_period);
 		if (err >= 0)
 			++dg00x->substreams_counter;
 		mutex_unlock(&dg00x->mutex);
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index d6a92460060f..96d331e47b07 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -283,7 +283,8 @@ void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x)
 	destroy_stream(dg00x, &dg00x->tx_stream);
 }
 
-int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate)
+int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate,
+				    unsigned int frames_per_period)
 {
 	unsigned int curr_rate;
 	int err;
@@ -315,6 +316,14 @@ int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 			fw_iso_resources_free(&dg00x->rx_resources);
 			return err;
 		}
+
+		err = amdtp_domain_set_events_per_period(&dg00x->domain,
+							 frames_per_period);
+		if (err < 0) {
+			fw_iso_resources_free(&dg00x->rx_resources);
+			fw_iso_resources_free(&dg00x->tx_resources);
+			return err;
+		}
 	}
 
 	return 0;
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 8041c65f2736..d93694282568 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -141,7 +141,8 @@ int snd_dg00x_stream_get_clock(struct snd_dg00x *dg00x,
 int snd_dg00x_stream_check_external_clock(struct snd_dg00x *dg00x,
 					  bool *detect);
 int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x);
-int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate);
+int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate,
+				    unsigned int frames_per_period);
 int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x);
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
