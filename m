Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD826593
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E7E1664;
	Wed, 22 May 2019 16:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E7E1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534747;
	bh=3HVz0WzXKU+Z2zLSRFerUwTsVMeyBuENKS0/thewKbE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ECqaiF+uJpom4YFX4imiV4QV4keaj4o8Hp8gEXaGR2+xPwYBqsaOSqOFlWT8GWL52
	 M7QszU80Ln8KocoEcYopgKwlcQECpy1oXzu45RB86/0ByJqvf7PBCvbf44Vlm3tKyk
	 s7SKcTxQ5DQpcrihhPI6s65C3lAeO0iUv1yK8sUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB3FF896E9;
	Wed, 22 May 2019 16:17:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BECF89636; Wed, 22 May 2019 16:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A662F8962C
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A662F8962C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KZLlJZlR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="yrrM1v/O"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E1AA621540;
 Wed, 22 May 2019 10:17:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4CZxLEMfp1wuI
 jNR8FO5EccsEETCfnJ7lhq7UegrGnY=; b=KZLlJZlR5a+8mgZ4fS3hsmlWrUTug
 vHi08qgHSNt2N5RtBSGd25O4rkFxwixLpNsAsu/sF0F3j8/69UAoxjFxkyL9YSi/
 oSfhF/vav58+g8/2LCjRL31GPwDUsgY6/BnOnE/NgL/2TOAO5wM0RmAD4pq7BtZO
 Aj3+8Ab6V0Nhlmxw2CtRUGW5JuueyL63+l3m79DzoQ9kabsIrprRCn0avxPkjx1h
 U3SpDmeqSGP5+NQDF/zTTd8I1JVR2vzX7psQ14eeoxjFFQ1ora//0uDYkkSSplzP
 AnftmnSdOgk6hYuS4d2V51M4cZevxXgz9ELkPzIqVi3VayUVJXU7RWbfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4CZxLEMfp1wuIjNR8FO5EccsEETCfnJ7lhq7UegrGnY=; b=yrrM1v/O
 b+tvo3nAaRkvvJp8jAoop3DTYNix0/msSCDVf+dMhiAHescTRPePAo7j/5I4XIuR
 gbpl1fSfKXUWzfvJE7ad19pzXha1kTflcwzEX0fxO5uZitJagFxxSEjCT7F5adYV
 XWScGEV4n5aG4xx5o0U81cbge1Q8uKVCGzhlQurjeLZv4iE5YuHxOczdEc/45xi9
 xTfak9IvRSz4XjgIH35z+X77fNgn5Vux6IBOT2tiOS9a+QKLvBmdvHEP3Y59GCeL
 Es4MopXIqpTrwgtcv7vZnJ9wXWJ4oWEdux/wnlUEdGip71RhCdeqJ21og1KCifi4
 oGQyTOcWU6NqAQ==
X-ME-Sender: <xms:6lnlXA7q4FlhmPNJHH878lij3kZNShdqi8z2Xzwg3kl21JWW6W_RyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6lnlXIAmKczYN4Zf08K3rrKdiA6v8KZy_zCb4TJVlTI1mLxxdTcN8A>
 <xmx:6lnlXCK1d16XPXPjbdw8ErNrDGPtVEAD_f7mq37ExkR2ittbusz5Rg>
 <xmx:6lnlXC-6Z43K4DjoGagUWH1tWxjreZNRShGz38u9Ji4xeRAumXYIQw>
 <xmx:6lnlXPcnECVUPT-EdYsFYyVR2xS8Vkm4GCSefSD08xM5R_dnzwJ--A>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 50728380084;
 Wed, 22 May 2019 10:17:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:03 +0900
Message-Id: <20190522141708.29159-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/6] ALSA: firewire-lib: use clear name for
	variable of CIP header
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

This commit is to distinguish variable of CIP header from variable of
isochronous context header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index f43943fd962d..020edf2b1726 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -286,15 +286,15 @@ EXPORT_SYMBOL(amdtp_stream_set_parameters);
 unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s)
 {
 	unsigned int multiplier = 1;
-	unsigned int header_size = 0;
+	unsigned int cip_header_size = 0;
 
 	if (s->flags & CIP_JUMBO_PAYLOAD)
 		multiplier = 5;
 	if (!(s->flags & CIP_NO_HEADER))
-		header_size = 8;
+		cip_header_size = sizeof(__be32) * 2;
 
-	return header_size +
-		s->syt_interval * s->data_block_quadlets * 4 * multiplier;
+	return cip_header_size +
+		s->syt_interval * s->data_block_quadlets * sizeof(__be32) * multiplier;
 }
 EXPORT_SYMBOL(amdtp_stream_get_max_payload);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
