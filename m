Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B57EC38B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 14:15:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 391E1214D;
	Fri,  1 Nov 2019 14:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 391E1214D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572614124;
	bh=2zdGsF7So1CJQx03rdOsxt4S5PhC6jx+Fsx8wZw1aRE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FRJDS9naVA4DgOml0Etv+Ip79DOmfChNU1NQCmEuse0E2a2M/tU9+C5N0JM9WQGE+
	 1FPO+uk6G6Er3HXqayBXyosW1KWUILIET5+zLPTcIWrmKLIYoPUh/WPis2KUsUwUIf
	 DRcjQ6wVZzkq85zHESFMLKIZKn+lUHr8dpV0vXUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95AD0F805FB;
	Fri,  1 Nov 2019 14:13:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF331F8015A; Fri,  1 Nov 2019 14:13:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43C52F8015A
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 14:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C52F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="doXTU6v4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="yoE9yTp7"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F2F2C53F;
 Fri,  1 Nov 2019 09:13:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Nov 2019 09:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ym4LnTXJMcQh8
 96GFTBtagLoosqChgAga6wpKleqTYQ=; b=doXTU6v4Dglg3TzwPR3fxrEx5iP5h
 5S/uNLvcOd048BeyyCCmJKFbhW5z5+cHFDIi0p7+XSXJ7p+7qKLT+XM0mRf36FcM
 wObr4WHIfFiDuqWoagf4j5yoe7Ejl25WHOlJppe96K3nu7KMIrwsJ5i9Cue0njKn
 dKnL1pLplHIOMnrIFOAOuxLsd4CvtSnOEbq+6llguFkp8xQD7vJUikKRMAHNFHrd
 N18HZI59pQKjCiqwQ329ikMF6friauKFz/l6sk37nTDz4pq6QZTQN4pJdVXGvmJG
 kyAwOGUNI3+eSS7iDbUKAFLPsdm4TJiP9gzpBCath2LGnghuUjmtkH2RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ym4LnTXJMcQh896GFTBtagLoosqChgAga6wpKleqTYQ=; b=yoE9yTp7
 4VYwzMcLpJWpYyiTzsCJ3/3dxzw02L+ls24LrQ5f7Yah0NSJiBCq5tC8Wz9tihMa
 Y5TsRtMH1NPHLt1bMIy/AhGjAQxIIyNIpu99SYrrcYSdV534yO5jmHzPcX8nUrDx
 /NsM8W/KLZ7HbA2OeYaWNfyQQ4RO8g2N3hD6k4Dzd4dfIsTp5C7K3vumAi/wL+gJ
 hQ29Ku55NqEru3G6D2waqLD+4Mr8zhUqVPJkcaE73l+xSDZFGxNWcXnCr5fgcghZ
 FzIU/wcsFB8yxZJdDzn81pmKFXWGI8Qin5aDJQBdL7vhE5bP7tr0qGcn6AbYI3kp
 N7GEvAlIwSw3fg==
X-ME-Sender: <xms:fC-8XSp9drPBSTXr5kqM-dU7WTtU5stTEMCiPN33hIfcYmRJ4wYp2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:fC-8XeywkFCiWuqhZyBUazQqYq5urB6UnkHoQmUpSRN_amiV2SH8wQ>
 <xmx:fC-8XRy0Fsbkq7jzOk4pUjeHhJvyOP6vmmBwu3hqvl4UcPGAhH--wQ>
 <xmx:fC-8XWbu75hRaMQ8XV2kfzGEQlP0--4WSjWNL0-fb1dEO_BPcErb9A>
 <xmx:fC-8XXFZvkq4PuviiaPfzrhwkEDUfDVEhyefJlH4DPc32rHg6_o9fg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4BA5B3060057;
 Fri,  1 Nov 2019 09:13:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri,  1 Nov 2019 22:13:23 +0900
Message-Id: <20191101131323.17300-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
References: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/3] ALSA: bebob: link the order of
	establishing connections and Syt-match clock mode
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

Originally BeBeB ASICs and firmware supports clock mode to synchronizing
to syt field of received isoc packet. This mode is known as 'SYT Match'
slightly described in IEC 61883-6 (but no detail mechanisms). In this
mode, drivers can control sampling clock in device. Driver for Windows
and macOS uses this feature to perform synchronization for devices
on the same bus.

In this mode, a plug of Music subunit for synchronization is connected
to a plug of isoc unit for incoming packet streaming, then the order to
establish connections is INPUT_PLUG first, OUTPUT_PLUG second.

This commit implements the above.

Actually each device works with its own clock for sampling, therefore
the original design is hardly implemented to vendor's products.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 51 +++++++++++++----------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 895a113635af..bbae04793c50 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -398,23 +398,6 @@ check_connection_used_by_others(struct snd_bebob *bebob, struct amdtp_stream *s)
 	return err;
 }
 
-static int make_both_connections(struct snd_bebob *bebob)
-{
-	int err = 0;
-
-	err = cmp_connection_establish(&bebob->out_conn);
-	if (err < 0)
-		return err;
-
-	err = cmp_connection_establish(&bebob->in_conn);
-	if (err < 0) {
-		cmp_connection_break(&bebob->out_conn);
-		return err;
-	}
-
-	return 0;
-}
-
 static void break_both_connections(struct snd_bebob *bebob)
 {
 	cmp_connection_break(&bebob->in_conn);
@@ -427,8 +410,7 @@ static void break_both_connections(struct snd_bebob *bebob)
 		msleep(600);
 }
 
-static int
-start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
+static int start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 {
 	struct cmp_connection *conn;
 	int err = 0;
@@ -438,18 +420,19 @@ start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 	else
 		conn = &bebob->out_conn;
 
-	/* channel mapping */
+	// channel mapping.
 	if (bebob->maudio_special_quirk == NULL) {
 		err = map_data_channels(bebob, stream);
 		if (err < 0)
-			goto end;
+			return err;
 	}
 
-	// start amdtp stream.
-	err = amdtp_domain_add_stream(&bebob->domain, stream,
-				      conn->resources.channel, conn->speed);
-end:
-	return err;
+	err = cmp_connection_establish(conn);
+	if (err < 0)
+		return err;
+
+	return amdtp_domain_add_stream(&bebob->domain, stream,
+				       conn->resources.channel, conn->speed);
 }
 
 static int init_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
@@ -638,6 +621,8 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 	}
 
 	if (!amdtp_stream_running(&bebob->rx_stream)) {
+		enum snd_bebob_clock_type src;
+		struct amdtp_stream *master, *slave;
 		unsigned int curr_rate;
 		unsigned int ir_delay_cycle;
 
@@ -647,15 +632,23 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 				return err;
 		}
 
-		err = make_both_connections(bebob);
+		err = snd_bebob_stream_get_clock_src(bebob, &src);
 		if (err < 0)
 			return err;
 
-		err = start_stream(bebob, &bebob->rx_stream);
+		if (src != SND_BEBOB_CLOCK_TYPE_SYT) {
+			master = &bebob->tx_stream;
+			slave = &bebob->rx_stream;
+		} else {
+			master = &bebob->rx_stream;
+			slave = &bebob->tx_stream;
+		}
+
+		err = start_stream(bebob, master);
 		if (err < 0)
 			goto error;
 
-		err = start_stream(bebob, &bebob->tx_stream);
+		err = start_stream(bebob, slave);
 		if (err < 0)
 			goto error;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
