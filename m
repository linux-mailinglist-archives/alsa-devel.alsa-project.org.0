Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A1809A8
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE441696;
	Sun,  4 Aug 2019 08:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE441696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900045;
	bh=vXLhlv2VDyuJa4KZlnOIBHHVgpwfykudX3C8RpxQr8I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lFTAgQevwOcHFkTT3+qAP938Tx8JWCbtzMMwgyFcYDdz/mBA+CLoiumXjPqp44My4
	 LTQ1nrmrRDTJVSeJnN/sfLZ8u0wGfzs0LV74yRlL0V251FOVasHYojBmxKVask6D3T
	 +ev198GyNTLzn463jcnSFgheA8cAcOgxopA+BAWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 207E2F805F8;
	Sun,  4 Aug 2019 08:22:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0254EF805A1; Sun,  4 Aug 2019 08:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DBA7F800F4
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBA7F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="O4/hl9VR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Kolz4Faz"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B06820F24;
 Sun,  4 Aug 2019 02:21:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=D6Rl17qizGNRg
 oJhhNtSaZSvwrlwZLNWQkW9yGFdDNw=; b=O4/hl9VRO4gbu+zSD8w66oN5faR8S
 eNCsL//Rq2zb+Y5HvnH6VPsfZ48s52BuwFxEDGqkKECjvHMyErR3g2uQbkeLNaMu
 eRmhlU+w6b4l37c5Fbk7r+g/LPoocyPjmkt4xx8W4fLanzgGpCxCu1muKpJih4Ww
 nXVlGR0yGbV5RnK2+ALvR3odfIeplJ2O1LMzBUp8oYmjIze31rPiSIck/9dm/RMX
 77uRRJ1YQG6nRK3PudGXoXaOKurzPGkignGR7ZgXBRDwQPxtamCDrZt5piAcVAHe
 +cT7cpqAI6Pab/x+OXQz9kU1XVPWyjXfmBbV8m/PTN5XzrHY6IC1BaOdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=D6Rl17qizGNRgoJhhNtSaZSvwrlwZLNWQkW9yGFdDNw=; b=Kolz4Faz
 DNTN6+Ycwex1g1xkBGcEdSPJKtNl6jySOwgtq+d2+3lDM/bSZ2s51gjr8Ia+9AwX
 p2PkAk9ukvrIEgtLDUREVpDw0ERoe//1o2CHXDcfmXtKoeeVqzWuhwcPKRA2fOSk
 5/CmIiSzTBzNqOfQujFm/rzJdd+p1S+BsRf3Wm/B828SMR+uM51O+bHWv0U2Z+Vz
 HQP1hHN9sbwoJ796yHX8V4qIetNXaechxuYUslwSQ5bmHsibMlZ8ZdC58CzqmtWw
 FCB8OIAiHVQHFhnK3Dw20Pak+NCesltHq/h7ptgS8sUfxXbd3KvdaNHOeSohQwEh
 xkBXdS3h4VJ6ng==
X-ME-Sender: <xms:fnlGXapK2i7tZLD2WOREvSRz9rme2LJKLxgp4weW4IZ4bvL1-CywMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:fnlGXWI2joKmQ1qz3YokfDyqmx7zz6tLuVMQjUL40MEybwTFZ78_OQ>
 <xmx:fnlGXbRJNoQiKU1QHnAzabo-NB-R2KYioOHLysYf7nv8wD6-qTvs5A>
 <xmx:fnlGXXIBtrnZ3H2hdN1w1qbGUEViIj32nQcwnq8liiB4f5L8GjZ_9Q>
 <xmx:fnlGXUCgW0hRK4N3d9RZ2eoIQKNaLdZJjijLPQelWCIUlclCteRKdg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF50D380084;
 Sun,  4 Aug 2019 02:21:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:24 +0900
Message-Id: <20190804062138.1217-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/19] ALSA: fireworks: code refactoring for
	initialization/destruction of AMDTP streams
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

This commit is a preparation to support AMDTP domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 77 ++++++++++-----------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 385fc9686365..0f62c50055e9 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -8,8 +8,7 @@
 
 #define CALLBACK_TIMEOUT	100
 
-static int
-init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
+static int init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 {
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
@@ -28,14 +27,37 @@ init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 
 	err = cmp_connection_init(conn, efw->unit, c_dir, 0);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = amdtp_am824_init(stream, efw->unit, s_dir, CIP_BLOCKING);
 	if (err < 0) {
 		amdtp_stream_destroy(stream);
 		cmp_connection_destroy(conn);
+		return err;
 	}
-end:
+
+	if (stream == &efw->tx_stream) {
+		// Fireworks transmits NODATA packets with TAG0.
+		efw->tx_stream.flags |= CIP_EMPTY_WITH_TAG0;
+		// Fireworks has its own meaning for dbc.
+		efw->tx_stream.flags |= CIP_DBC_IS_END_EVENT;
+		// Fireworks reset dbc at bus reset.
+		efw->tx_stream.flags |= CIP_SKIP_DBC_ZERO_CHECK;
+		// But Recent firmwares starts packets with non-zero dbc.
+		// Driver version 5.7.6 installs firmware version 5.7.3.
+		if (efw->is_fireworks3 &&
+		    (efw->firmware_version == 0x5070000 ||
+		     efw->firmware_version == 0x5070300 ||
+		     efw->firmware_version == 0x5080000))
+			efw->tx_stream.flags |= CIP_UNALIGHED_DBC;
+		// AudioFire9 always reports wrong dbs.
+		if (efw->is_af9)
+			efw->tx_stream.flags |= CIP_WRONG_DBS;
+		// Firmware version 5.5 reports fixed interval for dbc.
+		if (efw->firmware_version == 0x5050000)
+			efw->tx_stream.ctx_data.tx.dbc_interval = 8;
+	}
+
 	return err;
 }
 
@@ -83,22 +105,16 @@ static int start_stream(struct snd_efw *efw, struct amdtp_stream *stream,
 	return 0;
 }
 
-/*
- * This function should be called before starting the stream or after stopping
- * the streams.
- */
-static void
-destroy_stream(struct snd_efw *efw, struct amdtp_stream *stream)
+// This function should be called before starting the stream or after stopping
+// the streams.
+static void destroy_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 {
-	struct cmp_connection *conn;
+	amdtp_stream_destroy(stream);
 
 	if (stream == &efw->tx_stream)
-		conn = &efw->out_conn;
+		cmp_connection_destroy(&efw->out_conn);
 	else
-		conn = &efw->in_conn;
-
-	amdtp_stream_destroy(stream);
-	cmp_connection_destroy(conn);
+		cmp_connection_destroy(&efw->in_conn);
 }
 
 static int
@@ -131,42 +147,21 @@ int snd_efw_stream_init_duplex(struct snd_efw *efw)
 
 	err = init_stream(efw, &efw->tx_stream);
 	if (err < 0)
-		goto end;
-	/* Fireworks transmits NODATA packets with TAG0. */
-	efw->tx_stream.flags |= CIP_EMPTY_WITH_TAG0;
-	/* Fireworks has its own meaning for dbc. */
-	efw->tx_stream.flags |= CIP_DBC_IS_END_EVENT;
-	/* Fireworks reset dbc at bus reset. */
-	efw->tx_stream.flags |= CIP_SKIP_DBC_ZERO_CHECK;
-	/*
-	 * But Recent firmwares starts packets with non-zero dbc.
-	 * Driver version 5.7.6 installs firmware version 5.7.3.
-	 */
-	if (efw->is_fireworks3 &&
-	    (efw->firmware_version == 0x5070000 ||
-	     efw->firmware_version == 0x5070300 ||
-	     efw->firmware_version == 0x5080000))
-		efw->tx_stream.flags |= CIP_UNALIGHED_DBC;
-	/* AudioFire9 always reports wrong dbs. */
-	if (efw->is_af9)
-		efw->tx_stream.flags |= CIP_WRONG_DBS;
-	/* Firmware version 5.5 reports fixed interval for dbc. */
-	if (efw->firmware_version == 0x5050000)
-		efw->tx_stream.ctx_data.tx.dbc_interval = 8;
+		return err;
 
 	err = init_stream(efw, &efw->rx_stream);
 	if (err < 0) {
 		destroy_stream(efw, &efw->tx_stream);
-		goto end;
+		return err;
 	}
 
-	/* set IEC61883 compliant mode (actually not fully compliant...) */
+	// set IEC61883 compliant mode (actually not fully compliant...).
 	err = snd_efw_command_set_tx_mode(efw, SND_EFW_TRANSPORT_MODE_IEC61883);
 	if (err < 0) {
 		destroy_stream(efw, &efw->tx_stream);
 		destroy_stream(efw, &efw->rx_stream);
 	}
-end:
+
 	return err;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
