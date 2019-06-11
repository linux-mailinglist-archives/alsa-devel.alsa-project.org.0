Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5034C3CCD7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBAD6172C;
	Tue, 11 Jun 2019 15:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBAD6172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259485;
	bh=gG1NLXJbldLcmPIAirry9QMqoyjW3DFC508MTmGjEi4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxN8v0YI0D7STllgjxvcPsrZsUXUut4YwmsksmDXnbwmrlEHILzGiPQr/8LVzk7ka
	 Xx4jIEZDVcPqFz1UnmKGVRrNyaa2PmisRoMgYcGZIhiR7APXHUdH5uqtWXkdx+l0MX
	 BFDYS+WjyG76YGr6ARygqa0RTZkgLplb/c0PQzkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F19EF89734;
	Tue, 11 Jun 2019 15:21:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5A07F89711; Tue, 11 Jun 2019 15:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52E7FF8970F
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E7FF8970F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Gxm2QdoN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EW2RFDDf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F1C5C22256;
 Tue, 11 Jun 2019 09:21:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rg35FcbTk0R96
 OnTOj3dmE7xiAT+JSxYJI3H115XBB8=; b=Gxm2QdoNyD+LKUVcfwZPLzH7NERWL
 V4zbSoGVXBbtndD+OkrMbxdc/OMbFDW9tAs+ee6qQ+3dVoqi55EC5viKU72ZPSDU
 5hTrmKyg4H56oTsPsuxvB+0wPM3Eb6Esr8QWvKIp8rPmMNjfJ4AJqWrQkMeRRmJD
 2MQkHWPoIH3fRXXZu01PAzuZmWs9uDMHl1VsMafXqC+FjYyaUCGBspHyx3Co9H3k
 vx7K5ibSPZPJT0jksKwsnvnKMrmiAe5FYRNgoudN12GS6uq2S1Cu6rdwcMs59fpm
 3Utt5EVdaV+vferpWcoLRwPUTnRs4tOWTSbidl67A57kMvIgh2I6dIfpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rg35FcbTk0R96OnTOj3dmE7xiAT+JSxYJI3H115XBB8=; b=EW2RFDDf
 PTTlkB8ZvbqbQAF82ettkfVNjFHao4sH221q/oNT9C1LFbwrwc8EAwcw7gjTQzm/
 zaxn75Bn9ewpGih0Kd4Xo2svUcGtfd8KAuGuNk9aZgSQ6ATojl0Iw3fFlH+Zg1se
 Zy7ECIOijQykdglzb11bX0FXdYzuwmdA5tXzQS+J1IIHYgJbRsYemul2kFr64hDG
 EdNFFJm2YZxVtngArvnqjqqOKr/ZamjDFkEgK6WMCanbFnIF2Ph+a1eny6QSSiep
 6QMKKMD/mUhybhEKBsb1vmXGGBUw5BHeyZT3m4iLjCV6IzabTrhv4IFEbJqH7Q7m
 qzAP/T+j+KlaBg==
X-ME-Sender: <xms:1qr_XBzC0JQWPF7PoB1HRKbjkWcK1czPverCGRXB1s9JqnSJHaEqFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:1qr_XH3XvTrqKtN8KVoPej2HCmzEf-KgJ9cDfup3LK-OpcFcdR4Ekg>
 <xmx:1qr_XNBrjrQbsCIAv8kO9DZIjH_Op4CzEQH7-974YYQu4VpMv3J7mg>
 <xmx:1qr_XM8ZMEt6VfRokd3AdL3LCKKfDwwA2-swF47fNwQ2fjYhrt2WeQ>
 <xmx:1qr_XKC7V_R7qO6Q23hsjd8w430_veSn9bxMIYdf9XhLp5DOzX-hpA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A0B6380087;
 Tue, 11 Jun 2019 09:21:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:08 +0900
Message-Id: <20190611132118.8378-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/12] ALSA: firewire-digi00x: code refactoring
	to finish streaming session
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

This commit is a part of preparation to perform allocation/release
of isochronous resources in pcm.hw_params/hw_free callbacks.

The operation to finish packet streaming corresponds to stopping
isochronous contexts. This commit applies code refactoring to
move codes to stop into a helper function to finish the session.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-stream.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 455c43e81850..90e31b63ac2f 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -125,8 +125,12 @@ int snd_dg00x_stream_get_external_rate(struct snd_dg00x *dg00x,
 
 static void finish_session(struct snd_dg00x *dg00x)
 {
-	__be32 data = cpu_to_be32(0x00000003);
+	__be32 data;
+
+	amdtp_stream_stop(&dg00x->tx_stream);
+	amdtp_stream_stop(&dg00x->rx_stream);
 
+	data = cpu_to_be32(0x00000003);
 	snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
 			   DG00X_ADDR_BASE + DG00X_OFFSET_STREAMING_SET,
 			   &data, sizeof(data), 0);
@@ -136,6 +140,10 @@ static void finish_session(struct snd_dg00x *dg00x)
 	snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
 			   DG00X_ADDR_BASE + DG00X_OFFSET_ISOC_CHANNELS,
 			   &data, sizeof(data), 0);
+
+	// Just after finishing the session, the device may lost transmitting
+	// functionality for a short time.
+	msleep(50);
 }
 
 static int begin_session(struct snd_dg00x *dg00x)
@@ -289,8 +297,6 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 	    amdtp_streaming_error(&dg00x->rx_stream)) {
 		finish_session(dg00x);
 
-		amdtp_stream_stop(&dg00x->tx_stream);
-		amdtp_stream_stop(&dg00x->rx_stream);
 		release_resources(dg00x);
 	}
 
@@ -346,8 +352,6 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 error:
 	finish_session(dg00x);
 
-	amdtp_stream_stop(&dg00x->tx_stream);
-	amdtp_stream_stop(&dg00x->rx_stream);
 	release_resources(dg00x);
 
 	return err;
@@ -358,16 +362,8 @@ void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x)
 	if (dg00x->substreams_counter > 0)
 		return;
 
-	amdtp_stream_stop(&dg00x->tx_stream);
-	amdtp_stream_stop(&dg00x->rx_stream);
 	finish_session(dg00x);
 	release_resources(dg00x);
-
-	/*
-	 * Just after finishing the session, the device may lost transmitting
-	 * functionality for a short time.
-	 */
-	msleep(50);
 }
 
 void snd_dg00x_stream_update_duplex(struct snd_dg00x *dg00x)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
