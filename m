Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBBF42010
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:56:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99AF91770;
	Wed, 12 Jun 2019 10:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99AF91770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329784;
	bh=CPyt8ZWlsqTGaHW3316Iv8WM30Ib7p02BV88nAH7Fhk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcYYHFaU+PdFL8PHO+kQYqIUMa/TjfEtOhf1bmX9XYGUaZdy+91H1du3jWqZkjxSp
	 PteEoHdYPi8QTvRKZMBWOhApQRJ+1gnCIMWn4KvM4MCXvhYrOXcGzVZ/zq4NmSk5oX
	 1l7hCJ4FJaf550C9eqF4GUVivva2optimHTOXAQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 777C3F89781;
	Wed, 12 Jun 2019 10:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6AD1F89751; Wed, 12 Jun 2019 10:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 231CCF8973E
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 231CCF8973E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GUlDf4xM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="1N6f5wMH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8BDA421D;
 Wed, 12 Jun 2019 04:44:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=WyHxZZP1vSBSn
 aX6JUP4Oeis0hAsDQE8+WylllKiCnI=; b=GUlDf4xM3fXN/dvJdu7OfJb8Wa/ZG
 PUz2nZRsvJB+UhDPB5fmrS6l9wQy282/WrpH55/xgXtgr1u2oldhdMtucVXQXIZl
 Lv3NQo5k+PzJw7ahfK4iT9PzLDmDZM/XT3q/pV5pFnsByuzTj9PWSRbhnxs7ZRtk
 FwuHALMiGrK/KHpqMmo9hDij2f/3A6cnPVL9y8oABbaHvXrxkLw73VeKS0coJsGd
 oaWSyCKlpGT47iiuUisH4tZz4ch0DlO5C1/GIOq9+gWdzogwwKNUqQswU1Mz0m6o
 dy51WmxJCcqGFr6jpjHNigHQ845TnykcP5rI2G56Ly75ici4pPCkL43Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WyHxZZP1vSBSnaX6JUP4Oeis0hAsDQE8+WylllKiCnI=; b=1N6f5wMH
 ZHsJ3Qze869sQWsRb8Ot98+AQWLzka13A9Ou+dNveo+t0ooDH45o8FczU42W17no
 mJ7TkklFejlIEdfqlWBZbmUxMuLgTy6jXCqgCVHpydL9SUFIGTC5Op9+XHt/2hn5
 fUlHQ5Zs3G8NjyNc87RDMUhQb5tMZTJBcx/OdR4Xe0dOBq/DRnMWCFppu9LxTJ9u
 /Rrz+/EunuRL/CMwgjhBI4M93tNc3+1atcSJxzPAxMbQMyI4K1CGt4MTiTiPJpsk
 oRMSbHR6kchV7K717rFZCX61nJa0d6b44x9dWBBZAtaeHcZrnr1DIeEo5I3NG+ez
 f3tfaqWJf1gBpQ==
X-ME-Sender: <xms:gLsAXTlVnc2mWtMExHje2RYtcrJUGX_mcIfR4ELapLPSCwQYzomLMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddu
X-ME-Proxy: <xmx:gLsAXZErX-KMIeTSSFqbkiZIs8uBT9OIsRJprDHGXsdZ0PiN2ZutNw>
 <xmx:gLsAXZvxlOlWLJVOxvUqqPgpqQD6T3oqmjM2Z7afqZ-EonnTyqeJag>
 <xmx:gLsAXUgnEZdZ27z0soRAE0haa4XXD-fYBVIDjq_agyjKAnCzcH0E4Q>
 <xmx:gLsAXSZHltbP7iGY9IQh6UKIc2SEVAl0lrvOvrN3q6hWR9xeCX1wew>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE330380083;
 Wed, 12 Jun 2019 04:44:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:17 +0900
Message-Id: <20190612084422.5344-15-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 14/19] ALSA: oxfw: break packet streaming at
	bus-reset handler
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

In most cases, recovery from bus reset is not successful. This commit
aborts packet streaming in bus reset handler.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index bb4ba6c196ea..806a7fded99d 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -363,17 +363,10 @@ void snd_oxfw_stream_destroy_simplex(struct snd_oxfw *oxfw,
 void snd_oxfw_stream_update_simplex(struct snd_oxfw *oxfw,
 				    struct amdtp_stream *stream)
 {
-	struct cmp_connection *conn;
-
-	if (stream == &oxfw->tx_stream)
-		conn = &oxfw->out_conn;
-	else
-		conn = &oxfw->in_conn;
+	stop_stream(oxfw, &oxfw->rx_stream);
 
-	if (cmp_connection_update(conn) < 0)
-		stop_stream(oxfw, stream);
-	else
-		amdtp_stream_update(stream);
+	if (oxfw->has_output)
+		stop_stream(oxfw, &oxfw->tx_stream);
 }
 
 int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
