Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE403226D
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 749E21692;
	Sun,  2 Jun 2019 09:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 749E21692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460187;
	bh=eQdZLDSZc0tKUlEZOxJsyWO+j7CSuHuWT1zg/NG/J2U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a77AY2iLyPdnUF8aL2KQaUmRM8OjfsNvTJlAwdUJLa7O8QYRUIg1t5f9FsZCCZc20
	 WVoIBfJEIk/3sR9bLBwbPA7GxD+94twPDwhyEgtuMEehvBU/ZElfZ8/yfgU1NZ14WJ
	 f8VhUSljGNPLn3JEVx2KhOjlsmM7X8rDytTPazQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8730F89777;
	Sun,  2 Jun 2019 09:13:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90ED4F89750; Sun,  2 Jun 2019 09:13:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37EF2F89744
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37EF2F89744
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="aDaWeZg1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ic7asrCY"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6C79820A3C;
 Sun,  2 Jun 2019 03:13:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xb36FjDMbfH5O
 HDgD3HepVsL8CYPBl8XjTGgvrd5otI=; b=aDaWeZg1xJYJtDBV+exqsdyWfMhan
 8LIrpGUv1hFMovhOk2EuOKGvPh7zf9f+fV4Wwpt9/sUO5BXnok0VCEEes1ePBCUy
 CjaBRTDH2llsfR9t5mLVeLgGIxr1T69R59om6mqUKlVpBlb170uaudSHmNB4tE2Q
 eXpoLuJVNFjpw+66ZjiPkJjLTw7ZVvgQ1T84zM7H7gDuRZev6rog5FtUJEr7utjj
 lh5AjStCvjkytHfRXg3ASOourVzRq6n6UASV4OjpyamnjgKetyGg+hBupU8OrHBA
 VUgbnim4wcjjLhM5CDeN8EFj94qzdKnYnvqNf4HrwY9A4/y/vwSzIKRYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=xb36FjDMbfH5OHDgD3HepVsL8CYPBl8XjTGgvrd5otI=; b=ic7asrCY
 DCiUXZDsivStB4E7gAxzrX3YK3i5tgP6omibBSJzgM1VWR+83Imm0e6jyVFdkUDv
 As/mlOkgpnAsTdlHu+PhBHFVI3iEh6VNlGhBtBkMA5fWef4hUSfseFz1eN/JmL8V
 UyWD1or1viCunJmlZd93CgppyHU1nQRxioqt5RtSkha5YBJEF57n3q3eGxqHEJj+
 Ei+xjIXHye/CwRkcHHBA6zu1W/i2ejvQzTu8eHYUHHHYm0U/WRs1bTBQaXyThtSr
 UvPUDuBX4Z8A95OgvdWyw4NNNL9EqsiUD935TqLRDXZhoxfHImmDzKA3Lhd+mWLh
 5YhoShSvwTV9gA==
X-ME-Sender: <xms:E3fzXGJ6XehOukKyTwiVDIeQE4u3c2xqwOmyjzfZqqwJNypxDto3bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:E3fzXCYdPlsN2RssL8rumZzKUr_W3y4A53sYoTIU4_tEIlqBrjH4Bg>
 <xmx:E3fzXBt6VTwWbor7j8fr33_Por0V9SzMcW-qYmLOOUGD1O8cqg2cAQ>
 <xmx:E3fzXPtI_IXPXCgqzIE5UOSqHiN97QZRQGwZuuB-miw3npVf5K9euw>
 <xmx:E3fzXJOc_qAKhZX2BSk3tTrJaoHry8t8G88jXhdAe3AJuQYA2HgVbw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA3C48005C;
 Sun,  2 Jun 2019 03:13:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:56 +0900
Message-Id: <20190602071259.21622-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/15] ALSA: fireface: reserve/release
	isochronous resources in pcm.hw_params/hw_free callbacks
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

Once allocated, isochronous resources are available for packet
streaming, even if the streaming is cancelled. For this reason,
current implementation handles allocation of the resources and
starting packet streaming at the same time. However, this brings
complicated procedure to start packet streaming.

This commit separates the allocation and starting. The allocation is
done in pcm.hw_params callback and available till pcm.hw_free callback.
Even if any XRUN occurs, pcm.prepare callback is done to restart
packet streaming for allocated the resources.

There are two points to stop packet streaming; in pcm.hw_params and
pcm.prepare callbacks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-pcm.c    | 18 ++++++--
 sound/firewire/fireface/ff-stream.c | 67 ++++++++++++++++++-----------
 sound/firewire/fireface/ff.h        |  2 +
 3 files changed, 57 insertions(+), 30 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 5adf04b95c04..53477404a58f 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -211,8 +211,12 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&ff->mutex);
-		ff->substreams_counter++;
+		err = snd_ff_stream_reserve_duplex(ff, rate);
+		if (err >= 0)
+			++ff->substreams_counter;
 		mutex_unlock(&ff->mutex);
 	}
 
@@ -231,8 +235,12 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		return err;
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+		unsigned int rate = params_rate(hw_params);
+
 		mutex_lock(&ff->mutex);
-		ff->substreams_counter++;
+		err = snd_ff_stream_reserve_duplex(ff, rate);
+		if (err >= 0)
+			++ff->substreams_counter;
 		mutex_unlock(&ff->mutex);
 	}
 
@@ -246,9 +254,10 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&ff->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		ff->substreams_counter--;
+		--ff->substreams_counter;
 
 	snd_ff_stream_stop_duplex(ff);
+	snd_ff_stream_release_duplex(ff);
 
 	mutex_unlock(&ff->mutex);
 
@@ -262,9 +271,10 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&ff->mutex);
 
 	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		ff->substreams_counter--;
+		--ff->substreams_counter;
 
 	snd_ff_stream_stop_duplex(ff);
+	snd_ff_stream_release_duplex(ff);
 
 	mutex_unlock(&ff->mutex);
 
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 740963e4e1c9..d9d1b469a8e9 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -31,12 +31,6 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 	return 0;
 }
 
-static void release_resources(struct snd_ff *ff)
-{
-	fw_iso_resources_free(&ff->tx_resources);
-	fw_iso_resources_free(&ff->rx_resources);
-}
-
 static inline void finish_session(struct snd_ff *ff)
 {
 	ff->spec->protocol->finish_session(ff);
@@ -104,36 +98,27 @@ void snd_ff_stream_destroy_duplex(struct snd_ff *ff)
 	destroy_stream(ff, AMDTP_OUT_STREAM);
 }
 
-int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
+int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
 {
 	unsigned int curr_rate;
 	enum snd_ff_clock_src src;
 	int err;
 
-	if (ff->substreams_counter == 0)
-		return 0;
-
 	err = ff->spec->protocol->get_clock(ff, &curr_rate, &src);
 	if (err < 0)
 		return err;
-	if (curr_rate != rate ||
-	    amdtp_streaming_error(&ff->tx_stream) ||
-	    amdtp_streaming_error(&ff->rx_stream)) {
-		finish_session(ff);
+
+	if (ff->substreams_counter == 0 || curr_rate != rate) {
+		enum snd_ff_stream_mode mode;
+		int i;
 
 		amdtp_stream_stop(&ff->tx_stream);
 		amdtp_stream_stop(&ff->rx_stream);
 
-		release_resources(ff);
-	}
+		finish_session(ff);
 
-	/*
-	 * Regardless of current source of clock signal, drivers transfer some
-	 * packets. Then, the device transfers packets.
-	 */
-	if (!amdtp_stream_running(&ff->rx_stream)) {
-		enum snd_ff_stream_mode mode;
-		int i;
+		fw_iso_resources_free(&ff->tx_resources);
+		fw_iso_resources_free(&ff->rx_resources);
 
 		for (i = 0; i < CIP_SFC_COUNT; ++i) {
 			if (amdtp_rate_table[i] == rate)
@@ -158,8 +143,40 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 
 		err = ff->spec->protocol->allocate_resources(ff, rate);
 		if (err < 0)
-			goto error;
+			return err;
+	}
+
+	return 0;
+}
+
+void snd_ff_stream_release_duplex(struct snd_ff *ff)
+{
+	if (ff->substreams_counter == 0) {
+		fw_iso_resources_free(&ff->tx_resources);
+		fw_iso_resources_free(&ff->rx_resources);
+	}
+}
+
+int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
+{
+	int err;
+
+	if (ff->substreams_counter == 0)
+		return 0;
 
+	if (amdtp_streaming_error(&ff->tx_stream) ||
+	    amdtp_streaming_error(&ff->rx_stream)) {
+		amdtp_stream_stop(&ff->tx_stream);
+		amdtp_stream_stop(&ff->rx_stream);
+
+		finish_session(ff);
+	}
+
+	/*
+	 * Regardless of current source of clock signal, drivers transfer some
+	 * packets. Then, the device transfers packets.
+	 */
+	if (!amdtp_stream_running(&ff->rx_stream)) {
 		err = ff->spec->protocol->begin_session(ff, rate);
 		if (err < 0)
 			goto error;
@@ -201,7 +218,6 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 	amdtp_stream_stop(&ff->rx_stream);
 
 	finish_session(ff);
-	release_resources(ff);
 
 	return err;
 }
@@ -214,7 +230,6 @@ void snd_ff_stream_stop_duplex(struct snd_ff *ff)
 	amdtp_stream_stop(&ff->tx_stream);
 	amdtp_stream_stop(&ff->rx_stream);
 	finish_session(ff);
-	release_resources(ff);
 }
 
 void snd_ff_stream_update_duplex(struct snd_ff *ff)
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index c478103388a2..fe5739ee1c88 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -138,6 +138,8 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 				      enum snd_ff_stream_mode *mode);
 int snd_ff_stream_init_duplex(struct snd_ff *ff);
 void snd_ff_stream_destroy_duplex(struct snd_ff *ff);
+int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate);
+void snd_ff_stream_release_duplex(struct snd_ff *ff);
 int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate);
 void snd_ff_stream_stop_duplex(struct snd_ff *ff);
 void snd_ff_stream_update_duplex(struct snd_ff *ff);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
