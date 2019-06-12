Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB242025
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA68178D;
	Wed, 12 Jun 2019 10:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA68178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329884;
	bh=5EwQOQp/BwMJ6LDxfvTclZT2d4fE+buqi/gq56Hsuew=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jiAJhjfhACK/1JaeR2DfSvlL4CQELJImPdfbYgu3cMCESyYiI99VMEoRkBOgZwdYU
	 9MoNrp3YTkGLzXWxUkYXhTsiHS6Ckn5T2Xb/vYAKa99Bv7KyOjTsOg9lCAG/g3Yi1U
	 E0Jwv7vTSNk88Lxi/oGdZGdyXC1oXqy1CiXihGZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11FCEF89796;
	Wed, 12 Jun 2019 10:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 334BAF89764; Wed, 12 Jun 2019 10:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D33FDF89759
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D33FDF89759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ggPWv8zH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rh0p4dpw"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4732D5B1;
 Wed, 12 Jun 2019 04:44:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fqFmvPAiCbq3u
 CuDpmR1GoW82G22IpRp25VQfrE1DqU=; b=ggPWv8zHI6j4HCxyFeyGcWqA2IjGE
 HwDX8bwbBSl8wG2UVgNVeC21pknPnDs6hmMHlqcxvGzaZX5ZGZfdgYpYpSjJyzvp
 SbpEF4cLHyeS9EcdSAyvQz5TtKuRRj591HyGEVxCOspWswY3U9sBfgpDuaKKGitF
 JBfwKyLP2dZdJo/XDk2RuzSQg0RXdUL7m90DXfNvzPYWFDWOoXDaSchNM3QT4ZRR
 3X5g/mvEmQlA7JFRnxLEUqdUY4noE1yyyx88Ho4muCZnaB98T7uVI6uO5K+VcR9W
 WpvzWJkzQF5v9eZxWFvNnje3slkuPfk4CLMMJ2bJEaH2CmJOAC710c+Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=fqFmvPAiCbq3uCuDpmR1GoW82G22IpRp25VQfrE1DqU=; b=rh0p4dpw
 iJZWcwve8KwH2FhKEWy300eyT5CWQt5KW3cL7tJFSb4ZIYSlT7wwc/8fU2rEA7lS
 gw3aG0hpo0NGejz1Y682jSVnacDSYEuuAcBq6J6487/1/2lZGTIVdaLK6FHT0ZkT
 D+IwW1gz/G6x0/wlvZt4tiTs30LubMBN0PUqywjae6M61AQpqTUCvY5NRJAV4doV
 d52suZWuHkTycOmG8hQkm90C1W2IGjajU6lU8RPxFQlKyCUL5x8hK7qVbr4s4okv
 dNF7/nUh1vDChxRjNKNPjEEZlf6je2mhx7O/7w9RLzhbsEc6HVICI19WhsG/5tmG
 za6wQI3TkuOq5w==
X-ME-Sender: <xms:hLsAXQ0KQBHxUZtlUVyZIj074h1Wrz9_HECHmIriTU228w1UYqAC3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudeh
X-ME-Proxy: <xmx:hLsAXS6xmImOKGsaa_oB3TW6rq9M-xDEmlKHTlBU8xNsi3V5KWm3AQ>
 <xmx:hLsAXURd32lvFycba8wCBa8eOvwEnzd3yQF0xzq3yxa0xkdkGZbDYA>
 <xmx:hLsAXTomWt9Mj7t9GIVGofe9-DUa_fxPGq6qYRfIHrPC52ykCXuh-g>
 <xmx:hLsAXRGFxuJ-EdQSQiv2D6lCJHxShO36ny7oS8ev2XODB6J8eeEYNw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DB8238008B;
 Wed, 12 Jun 2019 04:44:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:20 +0900
Message-Id: <20190612084422.5344-18-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 17/19] ALSA: oxfw: unify substreams counter
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

In former commits, two isochronous contexts are handles at the same
time. This commit unifies stream counters to obsolete them.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-midi.c   | 8 ++++----
 sound/firewire/oxfw/oxfw-pcm.c    | 8 ++++----
 sound/firewire/oxfw/oxfw-stream.c | 4 ++--
 sound/firewire/oxfw/oxfw.h        | 3 +--
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index 31352cebdfe9..092493497f1a 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -19,7 +19,7 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	oxfw->capture_substreams++;
+	++oxfw->substreams_count;
 	err = snd_oxfw_stream_start_duplex(oxfw, &oxfw->tx_stream, 0, 0);
 
 	mutex_unlock(&oxfw->mutex);
@@ -41,7 +41,7 @@ static int midi_playback_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	oxfw->playback_substreams++;
+	++oxfw->substreams_count;
 	err = snd_oxfw_stream_start_duplex(oxfw, &oxfw->rx_stream, 0, 0);
 
 	mutex_unlock(&oxfw->mutex);
@@ -58,7 +58,7 @@ static int midi_capture_close(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	oxfw->capture_substreams--;
+	--oxfw->substreams_count;
 	snd_oxfw_stream_stop_duplex(oxfw);
 
 	mutex_unlock(&oxfw->mutex);
@@ -73,7 +73,7 @@ static int midi_playback_close(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	oxfw->playback_substreams--;
+	--oxfw->substreams_count;
 	snd_oxfw_stream_stop_duplex(oxfw);
 
 	mutex_unlock(&oxfw->mutex);
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 253d79607bdf..79c8e514bed9 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -220,7 +220,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&oxfw->mutex);
-		oxfw->capture_substreams++;
+		++oxfw->substreams_count;
 		mutex_unlock(&oxfw->mutex);
 	}
 
@@ -239,7 +239,7 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		mutex_lock(&oxfw->mutex);
-		oxfw->playback_substreams++;
+		++oxfw->substreams_count;
 		mutex_unlock(&oxfw->mutex);
 	}
 
@@ -253,7 +253,7 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&oxfw->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		oxfw->capture_substreams--;
+		--oxfw->substreams_count;
 
 	snd_oxfw_stream_stop_duplex(oxfw);
 
@@ -268,7 +268,7 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&oxfw->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		oxfw->playback_substreams--;
+		--oxfw->substreams_count;
 
 	snd_oxfw_stream_stop_duplex(oxfw);
 
diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 52cf815c27f7..ebfe0777773b 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -244,7 +244,7 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
 	enum avc_general_plug_dir dir;
 	int err = 0;
 
-	if (oxfw->capture_substreams == 0 && oxfw->playback_substreams == 0)
+	if (oxfw->substreams_count == 0)
 		return -EIO;
 
 	// Considering JACK/FFADO streaming:
@@ -323,7 +323,7 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw,
 
 void snd_oxfw_stream_stop_duplex(struct snd_oxfw *oxfw)
 {
-	if (oxfw->capture_substreams == 0 && oxfw->playback_substreams == 0) {
+	if (oxfw->substreams_count == 0) {
 		amdtp_stream_stop(&oxfw->rx_stream);
 		cmp_connection_break(&oxfw->in_conn);
 
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 911a452f94db..e0c825288a24 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -52,8 +52,7 @@ struct snd_oxfw {
 	struct cmp_connection in_conn;
 	struct amdtp_stream tx_stream;
 	struct amdtp_stream rx_stream;
-	unsigned int capture_substreams;
-	unsigned int playback_substreams;
+	unsigned int substreams_count;
 
 	unsigned int midi_input_ports;
 	unsigned int midi_output_ports;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
