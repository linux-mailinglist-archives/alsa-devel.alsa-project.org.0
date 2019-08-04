Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B144809B0
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E188D16C9;
	Sun,  4 Aug 2019 08:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E188D16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900306;
	bh=+9I2+vWPD1AT54kHJtT99NtXdSyUpyFwFkC3G3yHUT4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pw2RVMWMpUhzk+V07wwXa25MMiJqwIijjou5bzliubHgXu6w0RcCv4R7Czr/KfLcz
	 tJNjoDNOAmXbXRaJr6cRI3P6l3nDQjDg4qyd6TCJ/kWhWVy3vLlC+sk5S2lNWyQ9yM
	 kq7j+3eWkYhiaaZOf84C3r+tSsg4XJXXxYv17C88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B712F806F0;
	Sun,  4 Aug 2019 08:22:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB0E8F805AF; Sun,  4 Aug 2019 08:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA5AF805AA
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA5AF805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ecpV/yxO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FRiw5FtT"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A15C20F24;
 Sun,  4 Aug 2019 02:22:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yFx/J02nvCZAV
 +PWYlRRX+FanVrT+c31x5RsGrLe9zo=; b=ecpV/yxO9aUJs5efuh0ic+cVTPsFK
 CZAmyy7G4peurGulliIIfWRqQeOa9YYiI2SF82Zne5Xg6QV8BXbYhunjqyESqSGS
 GdxExa93TCE6L8T/OkkI2hQL/MDaPeBW77ZWaMkgMTmER6SHz2VuLs+WP/aA8z2k
 enUrjdXAQhJJu1MIjI5cJOcbA0t0QMym7i6ebgP9MREGbj+qbab2lK+LX31bVIGc
 LX+c6o6ZNKkYaal7UUEn1N1NXSLlMWyoAY1GH8oYpltDWByryMc43bKCqvH5JwcY
 0r1v30pniOArtMRw/2o3VgwAR930aoE7Se5/u75IqP1q92BUxe5Uwi0XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yFx/J02nvCZAV+PWYlRRX+FanVrT+c31x5RsGrLe9zo=; b=FRiw5FtT
 qPh/oRuB6Lbvnv5rKmBU+DTIfHfWZAEBaJi/MbO0LTWnGyfWVaB3+4Sv4nssImQv
 JwqOpbEIli+5QGYj7ck42ZBXljc6vFv5vywYLUpUBXqOS/m6/YR7KykKNDSWqAuH
 6p2TZF8x0srnyp9Qaz5WnZgdNa8NyKeVMg8Q9WK8l8C98o83LIt+cbuFUD0m3lKt
 /40Odjsa7Hzu+wyZ8iZKpY/ghfeV12OW5l5NDqg2SljTNhtM6RrhNOPas8fzAsSd
 k59y+kotDywq0+QBrMihK5yaAv1o5mWGkplMLrxrFgEpGQc++5+1ATZBxMlcFIe2
 VlZMo7lLOaS9OQ==
X-ME-Sender: <xms:iHlGXT1A22ZRTzlUkGUkDPXh_Er1ImlT3pfdEvh_eyeRvKdhhUh7Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddt
X-ME-Proxy: <xmx:iHlGXSyW_HNCyCUP-ZQxjdTbZjjfFpB9xPq1KqTADOcZtpWnVEhXyA>
 <xmx:iHlGXSFNvDFFcRLhf5bqJ-hoyB9hn8cqjTABnL_ePxN_mtqTEudRHw>
 <xmx:iHlGXdbcMWVMIlxt1rEiXEb792XES808bhLZvt2JsovYeK6CHiemeg>
 <xmx:iHlGXVtMfQCiVI682OTWlW8TGQm5HoMssZI61vUYAZw_e9wXk_BRcg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 987A5380086;
 Sun,  4 Aug 2019 02:21:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:31 +0900
Message-Id: <20190804062138.1217-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/19] ALSA: fireworks: support AMDTP domain
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

This commit adds AMDTP domain support for ALSA fireworks driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.h        |  2 +
 sound/firewire/fireworks/fireworks_stream.c | 92 +++++++++++----------
 2 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 31efd4b53b4f..4cda297f8438 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -107,6 +107,8 @@ struct snd_efw {
 	u8 *resp_buf;
 	u8 *pull_ptr;
 	u8 *push_ptr;
+
+	struct amdtp_domain domain;
 };
 
 int snd_efw_transaction_cmd(struct fw_unit *unit,
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index af340491dc43..f2de304d2f26 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -61,17 +61,6 @@ static int init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 	return err;
 }
 
-static void
-stop_stream(struct snd_efw *efw, struct amdtp_stream *stream)
-{
-	amdtp_stream_stop(stream);
-
-	if (stream == &efw->tx_stream)
-		cmp_connection_break(&efw->out_conn);
-	else
-		cmp_connection_break(&efw->in_conn);
-}
-
 static int start_stream(struct snd_efw *efw, struct amdtp_stream *stream,
 			unsigned int rate)
 {
@@ -89,19 +78,13 @@ static int start_stream(struct snd_efw *efw, struct amdtp_stream *stream,
 		return err;
 
 	// Start amdtp stream.
-	err = amdtp_stream_start(stream, conn->resources.channel, conn->speed);
+	err = amdtp_domain_add_stream(&efw->domain, stream,
+				      conn->resources.channel, conn->speed);
 	if (err < 0) {
 		cmp_connection_break(conn);
 		return err;
 	}
 
-	// Wait first callback.
-	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT)) {
-		amdtp_stream_stop(stream);
-		cmp_connection_break(conn);
-		return -ETIMEDOUT;
-	}
-
 	return 0;
 }
 
@@ -155,6 +138,13 @@ int snd_efw_stream_init_duplex(struct snd_efw *efw)
 		return err;
 	}
 
+	err = amdtp_domain_init(&efw->domain);
+	if (err < 0) {
+		destroy_stream(efw, &efw->tx_stream);
+		destroy_stream(efw, &efw->rx_stream);
+		return err;
+	}
+
 	// set IEC61883 compliant mode (actually not fully compliant...).
 	err = snd_efw_command_set_tx_mode(efw, SND_EFW_TRANSPORT_MODE_IEC61883);
 	if (err < 0) {
@@ -209,8 +199,10 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 	if (rate == 0)
 		rate = curr_rate;
 	if (rate != curr_rate) {
-		stop_stream(efw, &efw->tx_stream);
-		stop_stream(efw, &efw->rx_stream);
+		amdtp_domain_stop(&efw->domain);
+
+		cmp_connection_break(&efw->out_conn);
+		cmp_connection_break(&efw->in_conn);
 
 		cmp_connection_release(&efw->out_conn);
 		cmp_connection_release(&efw->in_conn);
@@ -250,47 +242,57 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 	if (efw->substreams_counter == 0)
 		return -EIO;
 
-	err = snd_efw_command_get_sampling_rate(efw, &rate);
-	if (err < 0)
-		return err;
-
 	if (amdtp_streaming_error(&efw->rx_stream) ||
 	    amdtp_streaming_error(&efw->tx_stream)) {
-		stop_stream(efw, &efw->rx_stream);
-		stop_stream(efw, &efw->tx_stream);
+		amdtp_domain_stop(&efw->domain);
+		cmp_connection_break(&efw->out_conn);
+		cmp_connection_break(&efw->in_conn);
 	}
 
-	/* master should be always running */
+	err = snd_efw_command_get_sampling_rate(efw, &rate);
+	if (err < 0)
+		return err;
+
 	if (!amdtp_stream_running(&efw->rx_stream)) {
 		err = start_stream(efw, &efw->rx_stream, rate);
-		if (err < 0) {
-			dev_err(&efw->unit->device,
-				"fail to start AMDTP master stream:%d\n", err);
+		if (err < 0)
 			goto error;
-		}
-	}
 
-	if (!amdtp_stream_running(&efw->tx_stream)) {
 		err = start_stream(efw, &efw->tx_stream, rate);
-		if (err < 0) {
-			dev_err(&efw->unit->device,
-				"fail to start AMDTP slave stream:%d\n", err);
+		if (err < 0)
+			goto error;
+
+		err = amdtp_domain_start(&efw->domain);
+		if (err < 0)
+			goto error;
+
+		// Wait first callback.
+		if (!amdtp_stream_wait_callback(&efw->rx_stream,
+						CALLBACK_TIMEOUT) ||
+		    !amdtp_stream_wait_callback(&efw->tx_stream,
+						CALLBACK_TIMEOUT)) {
+			err = -ETIMEDOUT;
 			goto error;
 		}
 	}
 
 	return 0;
 error:
-	stop_stream(efw, &efw->rx_stream);
-	stop_stream(efw, &efw->tx_stream);
+	amdtp_domain_stop(&efw->domain);
+
+	cmp_connection_break(&efw->out_conn);
+	cmp_connection_break(&efw->in_conn);
+
 	return err;
 }
 
 void snd_efw_stream_stop_duplex(struct snd_efw *efw)
 {
 	if (efw->substreams_counter == 0) {
-		stop_stream(efw, &efw->tx_stream);
-		stop_stream(efw, &efw->rx_stream);
+		amdtp_domain_stop(&efw->domain);
+
+		cmp_connection_break(&efw->out_conn);
+		cmp_connection_break(&efw->in_conn);
 
 		cmp_connection_release(&efw->out_conn);
 		cmp_connection_release(&efw->in_conn);
@@ -299,8 +301,10 @@ void snd_efw_stream_stop_duplex(struct snd_efw *efw)
 
 void snd_efw_stream_update_duplex(struct snd_efw *efw)
 {
-	stop_stream(efw, &efw->rx_stream);
-	stop_stream(efw, &efw->tx_stream);
+	amdtp_domain_stop(&efw->domain);
+
+	cmp_connection_break(&efw->out_conn);
+	cmp_connection_break(&efw->in_conn);
 
 	amdtp_stream_pcm_abort(&efw->rx_stream);
 	amdtp_stream_pcm_abort(&efw->tx_stream);
@@ -308,6 +312,8 @@ void snd_efw_stream_update_duplex(struct snd_efw *efw)
 
 void snd_efw_stream_destroy_duplex(struct snd_efw *efw)
 {
+	amdtp_domain_destroy(&efw->domain);
+
 	destroy_stream(efw, &efw->rx_stream);
 	destroy_stream(efw, &efw->tx_stream);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
