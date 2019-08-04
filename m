Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBB809AA
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 200DA16A8;
	Sun,  4 Aug 2019 08:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 200DA16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900096;
	bh=7539BIhDJqTn5DgDiyBHccQyxetOVzXeP1f+P2yHAW8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTBGzQLpz/Put375YXs/p7O1o9vxv65Gf0U0XSNPOcU6KSbRJpOryGjWrbTaSy5EV
	 s7cmvimNx8wyI5IfFegiWZSXi01xEFGfoErMhQ6inY/82WRevo0TZ+h0m9biVyAUwG
	 A1ECNGE7i+UBCkN2kYEc70vwZJBB8XJEA807A9DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57143F80638;
	Sun,  4 Aug 2019 08:22:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B605F805A1; Sun,  4 Aug 2019 08:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 548BEF804CA
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 548BEF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="q2B2DxRT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="o4sFM58D"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E2A921947;
 Sun,  4 Aug 2019 02:21:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ixfDZ5eVyQO+p
 tSlvu1aoHfcC8+QUO3WNAfBb+sww1U=; b=q2B2DxRTkaXAeakRu7wuGASbgfTWk
 hA3/Q619DjGgtHs7K8xTbxOjFxmIkZDX2PqI98pE33uLYe4035kq1qDKYqkpdlC2
 pjQvm0C2EWHKfp0s5bhkwd2SdDOma/vEr8VI0ldQj8ve7SUS9x96c9RF3ndKZ+TW
 +gby81B1bzI8JKsKneYkthySkxaKHe4v1fcFT50Dj5WvFF+UmJGwHrhzpcdXH3it
 eW5ZMxfB/vmTH3e/xIDkihHXPLbna67BadLbjlFfUK2xslPhTpqPVu+I6HkGFvaA
 1HaqRdWHFh4Jl/ShleSHB8HKSYYm1EbVAKZQKFMW74EEEHM+aW8QpCJTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ixfDZ5eVyQO+ptSlvu1aoHfcC8+QUO3WNAfBb+sww1U=; b=o4sFM58D
 9adVndQmR9Qa9U2E8EFV7BETen1kd4kwfdzrKMT1JZKIkBg8HJjNW9adkrX0Wz3f
 tPsdmFM4Du/veEGh2pg8xLmYzTHhATU3XfkYlYE6ZsC39PfgzCOPZTQ55+ojN1aM
 l6xmBUt+LhFeO4cCa5QKdKznEt7MY1VNNKM22b2vV6m5z9gNTjrQcq8b1T8qYeHO
 KABiyYOzh4GxTGY/8lT5dScCJo3Y0B1V8bY8e1AW40aMDuDkJF/0FDHxqAcacoXp
 v4/TIC//a9qWo6Kp7i3KLeXXRLuBFRYf1Hmb4Z7d5mq++fZa+y0N7ahIrKRuzQsl
 6t51bKj6KMVPdA==
X-ME-Sender: <xms:gXlGXd8iAtJ1yHO-8-zRQpnMOwIHwLI4yv4x3-7F0hIDBrqsDlczAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:gXlGXV8o9n5uDjcVmqBTi3-QdOG7wkGg8PV7iIvpLsSVGnXCzUPk5A>
 <xmx:gXlGXWB3U5JToM4-zRiAQrCIGcZh4rO7qSt8Hl1XyTuS9o-olhaoPA>
 <xmx:gXlGXVwdSaammIFDF_ZpvzaUnaNxIBH6ta-l46g07Qx6UEdQmWe_jA>
 <xmx:gXlGXex17ZDTupPz951KiPj96FKJAmmz6PHcFYUOknF4q_lOKpJ9gg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E9E15380083;
 Sun,  4 Aug 2019 02:21:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:26 +0900
Message-Id: <20190804062138.1217-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/19] ALSA: firewire-digi00x: code refactoring
	for initialization/destruction of AMDTP stream
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
 sound/firewire/digi00x/digi00x-stream.c | 65 ++++++++++++++++---------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 3e77dbd3ee22..cff193f00a97 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -218,43 +218,62 @@ static int keep_resources(struct snd_dg00x *dg00x, struct amdtp_stream *stream,
 				fw_parent_device(dg00x->unit)->max_speed);
 }
 
-int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
+static int init_stream(struct snd_dg00x *dg00x, struct amdtp_stream *s)
 {
+	struct fw_iso_resources *resources;
+	enum amdtp_stream_direction dir;
 	int err;
 
-	/* For out-stream. */
-	err = fw_iso_resources_init(&dg00x->rx_resources, dg00x->unit);
+	if (s == &dg00x->tx_stream) {
+		resources = &dg00x->tx_resources;
+		dir = AMDTP_IN_STREAM;
+	} else {
+		resources = &dg00x->rx_resources;
+		dir = AMDTP_OUT_STREAM;
+	}
+
+	err = fw_iso_resources_init(resources, dg00x->unit);
 	if (err < 0)
-		goto error;
-	err = amdtp_dot_init(&dg00x->rx_stream, dg00x->unit, AMDTP_OUT_STREAM);
+		return err;
+
+	err = amdtp_dot_init(s, dg00x->unit, dir);
 	if (err < 0)
-		goto error;
+		fw_iso_resources_destroy(resources);
+
+	return err;
+}
 
-	/* For in-stream. */
-	err = fw_iso_resources_init(&dg00x->tx_resources, dg00x->unit);
+static void destroy_stream(struct snd_dg00x *dg00x, struct amdtp_stream *s)
+{
+	amdtp_stream_destroy(s);
+
+	if (s == &dg00x->tx_stream)
+		fw_iso_resources_destroy(&dg00x->tx_resources);
+	else
+		fw_iso_resources_destroy(&dg00x->rx_resources);
+}
+
+int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
+{
+	int err;
+
+	err = init_stream(dg00x, &dg00x->rx_stream);
 	if (err < 0)
-		goto error;
-	err = amdtp_dot_init(&dg00x->tx_stream, dg00x->unit, AMDTP_IN_STREAM);
+		return err;
+
+	err = init_stream(dg00x, &dg00x->tx_stream);
 	if (err < 0)
-		goto error;
+		destroy_stream(dg00x, &dg00x->rx_stream);
 
-	return 0;
-error:
-	snd_dg00x_stream_destroy_duplex(dg00x);
 	return err;
 }
 
-/*
- * This function should be called before starting streams or after stopping
- * streams.
- */
+// This function should be called before starting streams or after stopping
+// streams.
 void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x)
 {
-	amdtp_stream_destroy(&dg00x->rx_stream);
-	fw_iso_resources_destroy(&dg00x->rx_resources);
-
-	amdtp_stream_destroy(&dg00x->tx_stream);
-	fw_iso_resources_destroy(&dg00x->tx_resources);
+	destroy_stream(dg00x, &dg00x->rx_stream);
+	destroy_stream(dg00x, &dg00x->tx_stream);
 }
 
 int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
