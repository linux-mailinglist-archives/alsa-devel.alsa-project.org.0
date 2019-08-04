Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC523809A5
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C28916A8;
	Sun,  4 Aug 2019 08:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C28916A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564899919;
	bh=C509rROpumKxVXjOKTKOo/t2eFphfrcoblQ/DrNjZ48=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VARv2MJZri2XfPpg2WSy1bCuKZLJbEAF84cy6u6/azN0dvZS2fAogW1WtnschAYwv
	 eCstnf7E+nTs3XfhQNgkYiE8+jft5X9paIV0+HhYCsV0fpW3yZmxpcXjmgJxlkuDdJ
	 iP8q/gNHtWh2WQWnIp0UXXNUTJhOtNMRP5AvgFjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE14CF805FC;
	Sun,  4 Aug 2019 08:22:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 305FBF805A1; Sun,  4 Aug 2019 08:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8257FF804CB
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8257FF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PxZAQcMQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oLdxJ8wd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B7DDE20F24;
 Sun,  4 Aug 2019 02:21:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=gvlwgqQtkr+oD
 9/MqRWGC5fUKE4QvzEJ7yC/M/PL8b4=; b=PxZAQcMQyq/r4QPe8G73OavsfwHac
 ZxxVB1XC6HPYJ1BEPDqVbTqyVTFZf8QCeAEcNJ/Tk5CP+7NqpIhVt5Fxc/mtdsR0
 usdITzhmlU9ixABEjxzcxOmpCxtxXXNUoFYLFxVW84FaScnMTkHAEee5kzkUNlyq
 eoR7fbJduvPbu81Hq/aPlfTXxwZa3kC+1OfXNzd+sxSwsyCWjm/hRlUxluzOrPGx
 J+A9ra56dhDVGNLb2bh/s5LIyOXO5QmvtsRAEl52t45Xs7wvetq9KQVFa1lIx2Bb
 zpDcXe44WyCgPsgUU9a0nJPasE7sPEPkE8XCq8r5t3uzISFa7XYeC0Itg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gvlwgqQtkr+oD9/MqRWGC5fUKE4QvzEJ7yC/M/PL8b4=; b=oLdxJ8wd
 em3nokGZe0lBBfdogpQp50ywbCoIw/zt0zsOH+xErYLqcrY9ltqUunvupQbkyW0o
 RUBw9EqNRLcwl8rqCQLxZCnAUnfFI4oUi7I+UBLj103IFvBnqGDPQ6UVyHNMeyKi
 Q2NnOtb9APw6PKn1qLTfJz8336rqL/SrxowzxhA/HV0CaenM3743IG3tqgrfskaT
 NUc4LuKzVdcAHGnrVy90hQrPHj7zpQKmJ1pprPdpQG+xOuDGJMZm/FQgcq2nBGPf
 fDdFPZ7wm0qkV/ubNXSt6ZiXFYDkts7N+kXlXMIgZhHZqzsIoXkvEvSHazKws89c
 BIqZD9QkX1jE3g==
X-ME-Sender: <xms:eXlGXfx5leF9M1doA0fmd_dZ9AYA9JVKVPKvWCFGkUaTBwJ1n-DRVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eXlGXcIvX9Fk0b8mqGpPDQWvqs7fhm6D1lo9au--GOM5lSEX77eP6Q>
 <xmx:eXlGXR7qkyC7UU8q6NIQu2J1UNf9VT5L_reocI9-dTR2Ee-DJwmDfg>
 <xmx:eXlGXazx_HaGJ7QoEf3En-q1t2EXvj7ldJSLw6qg0N44MDjX5oExpw>
 <xmx:eXlGXeKeZHoZmo9HqOi9QY826Z-nNbERmGcmOjtkC0O2OsQUKZexgw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 57CAB38008A;
 Sun,  4 Aug 2019 02:21:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:21 +0900
Message-Id: <20190804062138.1217-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/19] ALSA: firewire-lib: add a kernel API to
	stop a couple of AMDTP streams in AMDTP domain
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

This commit adds a kernel API to stop a couple of isochronous contexts
for AMDTP streams. The API is not protected with any lock primitive.
Callers should use this with enough lock against concurrent access.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 16 ++++++++++++++++
 sound/firewire/amdtp-stream.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 02077696fa77..31fc90f76443 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1158,3 +1158,19 @@ void amdtp_domain_destroy(struct amdtp_domain *d)
 	WARN_ON(!list_empty(&d->streams));
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_destroy);
+
+/**
+ * amdtp_domain_stop - stop sending packets for isoc context in the same domain.
+ * @d: the AMDTP domain to which the isoc contexts belong.
+ */
+void amdtp_domain_stop(struct amdtp_domain *d)
+{
+	struct amdtp_stream *s, *next;
+
+	list_for_each_entry_safe(s, next, &d->streams, list) {
+		list_del(&s->list);
+
+		amdtp_stream_stop(s);
+	}
+}
+EXPORT_SYMBOL_GPL(amdtp_domain_stop);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 2378db4b4195..ab2a69180240 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -170,6 +170,9 @@ struct amdtp_stream {
 	/* For backends to process data blocks. */
 	void *protocol;
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
+
+	// For domain.
+	struct list_head list;
 };
 
 int amdtp_stream_init(struct amdtp_stream *s, struct fw_unit *unit,
@@ -274,4 +277,6 @@ struct amdtp_domain {
 int amdtp_domain_init(struct amdtp_domain *d);
 void amdtp_domain_destroy(struct amdtp_domain *d);
 
+void amdtp_domain_stop(struct amdtp_domain *d);
+
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
