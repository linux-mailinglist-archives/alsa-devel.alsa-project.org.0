Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 518EFDBDA2
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD3C1689;
	Fri, 18 Oct 2019 08:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD3C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379825;
	bh=/0+xO9A/3mt3/pBuPqZ+JlVDe0E6Jf4LUs6izxtp/PA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MY8qYf6iKil1horxNHCrr4QH5wXRmd9rkvGbx43dYIQYNs8f1bCJ0fsZfYZYWGkbt
	 wb7xh4RM4RYrHS6DMVlfjO/gGSJ2xH+kTu6z6zYRZKfZ/mp7EWE36tQfl/uJO7E6A3
	 NQ58izV0in0EtVgQnmNq10/v+9M8yUk1DpzsEQpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB00F80639;
	Fri, 18 Oct 2019 08:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B27CFF805FC; Fri, 18 Oct 2019 08:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B2CAF80362
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B2CAF80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="MGsx6ovY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rOYRzdWS"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0BA793F9;
 Fri, 18 Oct 2019 02:19:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=B6ngB0bEOyZgN
 cuOaT6QbROELi9tKeHhhNyqZIbFn48=; b=MGsx6ovYeL3ukDc4l2GcXSa/uLL47
 5/7Q7VJPnb5hnBiDxSfgvYcnozr7vfSUdIewUIE9b7d78qVNmP6JAPUJANaKX4Ww
 oUo2EifkE/1gTl0AQhf8TBZE8w9K3TirabHcCkq1Ww38PugZ47P0GOv3f7g4oDDe
 l1bOSB8Vov4d2LN5ZvPWg5PcbiBeY9q8jDs8EVHWBIt5rK25gqauoTD7y32CpOGh
 ss33LJKvMuia/K+gc+o0lZeuNcb34DOIiwkzPh3+hSyFTOuzVIUSFscmXdmV1yIh
 dbVt6QdQ4ew43OUuSVsc8uNYcRHQZS0Eiyg1dHBjKiKBcPQ+/8kpgbahQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=B6ngB0bEOyZgNcuOaT6QbROELi9tKeHhhNyqZIbFn48=; b=rOYRzdWS
 CHJFPQA7S49ZK4t85t00IQgS0nmDBqgLLGGNAk3inEP9pnF/0MO4Giu+4neI3H14
 piRVXVSKMpVSx9swnS2NzGr3mBUsyFDqK53OgwTTu9XEVNtWFqsWipJfZbjQR8nq
 6p9nBTUJZWVy6gkHHh/JW3Y9AA3CNFV/OmMjTrzydyE5T0yl9uAUed34lUgRGyQF
 yk51DBurYODX7sPHfmFkxuLu7nAJExE8cayKX+LLqLisiI0r2YcnoAcSY1Oaxrmc
 6OGPw9axL+Doqf7oCwqPolSs+VdPV4ulE/sCyNlVQDwVqIpS6t+UoURXV9P8h7tW
 I7RWbx6O//gXHA==
X-ME-Sender: <xms:almpXXG0XJ3J5hQtcec34U5G2V8wv9U7M8vOABg2boznUQkAVeRb-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:almpXTRf7TQ9lCND0POR-_S4NAtrr8o1TUaK-03sLgBCqsOQGW-g3Q>
 <xmx:almpXVO0NNxxnQgSUDK5RHYc4XbTv1UgXyNzvSdTum6lR4HX7nVg3g>
 <xmx:almpXYnJ2rObPdmVF3OCnJts2wqQbGohkmCpUOMGu6kaY7KH0LLY5w>
 <xmx:almpXWzPgGdXg6bmhcDqOLcUyRnku7uamAraVfHggkRkHIGfV_ppZg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFD3980062;
 Fri, 18 Oct 2019 02:19:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:09 +0900
Message-Id: <20191018061911.24909-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
References: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/6] ALSA: firewire-lib: cancel flushing isoc
	context in the laste step to process context callback
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

The aim of AMDTP domain is to process several isoc context in the same
time. However, current implementation is against this idea because it
flushes each isoc context in the end of processing context callback.

This commit cancels it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 3d27d4ce2b45..36c3f1f9dbff 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -842,8 +842,6 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 
 	s->event_count = event_count;
-
-	fw_iso_context_queue_flush(s->context);
 }
 
 static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
@@ -897,8 +895,6 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	}
 
 	s->event_count = event_count;
-
-	fw_iso_context_queue_flush(s->context);
 }
 
 /* this is executed one time */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
