Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01242809B6
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:35:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868EF16DC;
	Sun,  4 Aug 2019 08:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868EF16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900558;
	bh=a6fN/sHB/LUJhQIoBeL3xi/sZYGg3QCDTnrhq1WUrgk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihE8OSgNssakvvFngmZOXwbp6e556KPCgftd115fw2qZVl9DBi36Ff68qXZE/10hS
	 sNBEXBeb8CC8KLrLZt/AmgtqM3JLywsG2cjkmgFmvCI3O+KQEAp1KvIe9uacELwSog
	 2jsXvg0zC8zS/9WQhUyLvTtJ+XL56bDsDWp2lbAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 938A0F80760;
	Sun,  4 Aug 2019 08:22:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA5BF805F8; Sun,  4 Aug 2019 08:22:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E69A7F805E0
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E69A7F805E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ojfuPpri"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sPXiKPsU"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 220F921A97;
 Sun,  4 Aug 2019 02:22:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ThVAkmYGAI1iY
 Hhb7oAJV2wPZxbXiyYs5VuS1Nh+gnk=; b=ojfuPpriSW+YJ/Aoa0xrzSBmc2af9
 NcHUSpUe7JCUNNgWOovpOvj9fiEnBt2306rIT1A0C8ibWJQZhdU+R1Qgt5eJ1qnu
 1rJkNlflUbA3Gwki2ZTjhKG12RWmbMAP13mC1kVTP1OXgYHfdCFMfS3u7Q7LD27y
 3HRpIBGo8FLoE49i6NUAsv2PnKj0n4J6Kjy7Qv2V5DYkoXrWZAvdTz4gBegLX/2B
 1p5shzmGLY7U1PZDl50u+Z/N3b3CsE6mNy7K5VPaVFDC0C7o31HyMVXfDN22JcsI
 ZdtdH/HnUt3Xab0WN/IYIsruXFVuXHuHL6nsN9KcB0vpgJV5EgYdmPOUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ThVAkmYGAI1iYHhb7oAJV2wPZxbXiyYs5VuS1Nh+gnk=; b=sPXiKPsU
 WmcPdoSFwSiQ5DGZasRNefh8wPeOHKzajp/ApYD9ItL+VIMsazFJr/9fJDLEU4ws
 +s6py59O3pJ2DLuQkqzWDBZ2fzVXQhi3ELfw3+xD7iSRDPW/hyGxKm1dKpTES7Ji
 0Sjrqf8CgKHEMisHaSt/Kajw+xuFLBteBbGiFCAH/Ig+R89Ufcnoqg563K0y6zl+
 K8ujCDo4gevjAi9lLtyAqcioEA2zlZ5oM7w7giHleuTJwFkYenoNYHNfq6HAYBiU
 KtOHWfCwEaJPcnQoX5csJfWYjYgTAOulcOEGZKGnAZaYQiqtfj6M8u0IGXAR8EtH
 K5ef2vU4cwdqEw==
X-ME-Sender: <xms:knlGXVHsf0gAmwQkuvf89u7FrhZ7S3kel9fFuE1ybql2wTiraQvqTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudej
X-ME-Proxy: <xmx:knlGXSUE6MaJnsvN1JP889SgpMVuehQPDJHfaf9zFkLLevLjs9MtqQ>
 <xmx:knlGXXzXWz7cphvwT3vmrZel7gozxReGXIySVXmIIhCBKOjHLW19MA>
 <xmx:knlGXapa8du6Fege23CvgzQOSh84vp5sdvKuWtGrkkfk_Pm524qCiw>
 <xmx:knlGXSjkqVqiyl4u6urCpmWQQtOa1FtuiWmbF3uGm5U2JPb6_hk_yw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF807380083;
 Sun,  4 Aug 2019 02:22:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:37 +0900
Message-Id: <20190804062138.1217-19-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 18/19] ALSA: fireface: support AMDTP domain
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

This commit adds AMDTP domain support for ALSA fireface driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-stream.c | 57 +++++++++++++++++------------
 sound/firewire/fireface/ff.h        |  2 +
 2 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index e4710204f481..e8e6f9fd6433 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -32,9 +32,6 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 
 static inline void finish_session(struct snd_ff *ff)
 {
-	amdtp_stream_stop(&ff->tx_stream);
-	amdtp_stream_stop(&ff->rx_stream);
-
 	ff->spec->protocol->finish_session(ff);
 	ff->spec->protocol->switch_fetching_mode(ff, false);
 }
@@ -83,8 +80,16 @@ int snd_ff_stream_init_duplex(struct snd_ff *ff)
 		return err;
 
 	err = init_stream(ff, &ff->tx_stream);
-	if (err < 0)
+	if (err < 0) {
 		destroy_stream(ff, &ff->rx_stream);
+		return err;
+	}
+
+	err = amdtp_domain_init(&ff->domain);
+	if (err < 0) {
+		destroy_stream(ff, &ff->rx_stream);
+		destroy_stream(ff, &ff->tx_stream);
+	}
 
 	return err;
 }
@@ -95,6 +100,8 @@ int snd_ff_stream_init_duplex(struct snd_ff *ff)
  */
 void snd_ff_stream_destroy_duplex(struct snd_ff *ff)
 {
+	amdtp_domain_destroy(&ff->domain);
+
 	destroy_stream(ff, &ff->rx_stream);
 	destroy_stream(ff, &ff->tx_stream);
 }
@@ -113,6 +120,7 @@ int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
 		enum snd_ff_stream_mode mode;
 		int i;
 
+		amdtp_domain_stop(&ff->domain);
 		finish_session(ff);
 
 		fw_iso_resources_free(&ff->tx_resources);
@@ -155,51 +163,52 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		return 0;
 
 	if (amdtp_streaming_error(&ff->tx_stream) ||
-	    amdtp_streaming_error(&ff->rx_stream))
+	    amdtp_streaming_error(&ff->rx_stream)) {
+		amdtp_domain_stop(&ff->domain);
 		finish_session(ff);
+	}
 
 	/*
 	 * Regardless of current source of clock signal, drivers transfer some
 	 * packets. Then, the device transfers packets.
 	 */
 	if (!amdtp_stream_running(&ff->rx_stream)) {
+		int spd = fw_parent_device(ff->unit)->max_speed;
+
 		err = ff->spec->protocol->begin_session(ff, rate);
 		if (err < 0)
 			goto error;
 
-		err = amdtp_stream_start(&ff->rx_stream,
-					 ff->rx_resources.channel,
-					 fw_parent_device(ff->unit)->max_speed);
+		err = amdtp_domain_add_stream(&ff->domain, &ff->rx_stream,
+					      ff->rx_resources.channel, spd);
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&ff->rx_stream,
-						CALLBACK_TIMEOUT_MS)) {
-			err = -ETIMEDOUT;
-			goto error;
-		}
-
-		err = ff->spec->protocol->switch_fetching_mode(ff, true);
+		err = amdtp_domain_add_stream(&ff->domain, &ff->tx_stream,
+					      ff->tx_resources.channel, spd);
 		if (err < 0)
 			goto error;
-	}
 
-	if (!amdtp_stream_running(&ff->tx_stream)) {
-		err = amdtp_stream_start(&ff->tx_stream,
-					 ff->tx_resources.channel,
-					 fw_parent_device(ff->unit)->max_speed);
+		err = amdtp_domain_start(&ff->domain);
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&ff->tx_stream,
+		if (!amdtp_stream_wait_callback(&ff->rx_stream,
+						CALLBACK_TIMEOUT_MS) ||
+		    !amdtp_stream_wait_callback(&ff->tx_stream,
 						CALLBACK_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
+
+		err = ff->spec->protocol->switch_fetching_mode(ff, true);
+		if (err < 0)
+			goto error;
 	}
 
 	return 0;
 error:
+	amdtp_domain_stop(&ff->domain);
 	finish_session(ff);
 
 	return err;
@@ -208,6 +217,7 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 void snd_ff_stream_stop_duplex(struct snd_ff *ff)
 {
 	if (ff->substreams_counter == 0) {
+		amdtp_domain_stop(&ff->domain);
 		finish_session(ff);
 
 		fw_iso_resources_free(&ff->tx_resources);
@@ -217,12 +227,11 @@ void snd_ff_stream_stop_duplex(struct snd_ff *ff)
 
 void snd_ff_stream_update_duplex(struct snd_ff *ff)
 {
+	amdtp_domain_stop(&ff->domain);
+
 	// The device discontinue to transfer packets.
 	amdtp_stream_pcm_abort(&ff->tx_stream);
-	amdtp_stream_stop(&ff->tx_stream);
-
 	amdtp_stream_pcm_abort(&ff->rx_stream);
-	amdtp_stream_stop(&ff->rx_stream);
 }
 
 void snd_ff_stream_lock_changed(struct snd_ff *ff)
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 36dd0c75b9f7..b4c22ca6079e 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -91,6 +91,8 @@ struct snd_ff {
 	int dev_lock_count;
 	bool dev_lock_changed;
 	wait_queue_head_t hwdep_wait;
+
+	struct amdtp_domain domain;
 };
 
 enum snd_ff_clock_src {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
