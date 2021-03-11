Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89445336BA1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:28:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D660172F;
	Thu, 11 Mar 2021 06:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D660172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440520;
	bh=GLynAJaUaXAfolXN9QKbeHbuLCnOnc3zkoN629sT44g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebagO5jr9bsP5dPaqc2GifW37ACtB62PCpRRK0E5XYxKFXCHDhv8kAH2vp9NN53Ot
	 woE29384Ph+9NlfOSY56LHi4mIePOlwHuA3bEi3Fg9jksrZ/i04dsYd4EDbm1nhoFI
	 Uj4+26tpTob6ehYzUQ+GN1BsBW0fYUdh7VPHcDys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4AFBF8051A;
	Thu, 11 Mar 2021 06:23:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 782D6F804EC; Thu, 11 Mar 2021 06:22:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF0CF8042F
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF0CF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="orbNNy8c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TgkWK1ow"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2A2962FC0;
 Thu, 11 Mar 2021 00:22:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=U11yhTKQWqBhz
 9+q+6VueJTkl04Nfbp8BuShJuJTJOE=; b=orbNNy8ct7bJpkM9lTDpkQapjTpkr
 Pxwuyrorxzck7Fj2XYYqdGqiTrlBYV/KwCeMgm8KXXdQW68LULVax7ouH4UcUq/1
 zXgrgBL1I3QXwI2/K/Uw88aEyKXdhIeg3qedbcegKhmuQtii3n69OJQB+OGgFkuR
 CjaCTbgr4TONelvjicssjzFRaWSTbCqPGAnvFkIo/gXA0nYQhvr6IWIulEdY67RX
 nipKs6YViqPET2fft0319BIrLtzLvIH5C2pUsQWzIT8aKk3ugWWXWtpwHWDFCEOK
 sMmpe+mODBXxyq5g2qdXAFoKsu/s+gFZ9X+uGcCJGQHfFe1dM7qyNm+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=U11yhTKQWqBhz9+q+6VueJTkl04Nfbp8BuShJuJTJOE=; b=TgkWK1ow
 ZOWurxQAG609148eQRfxVH78o9mqMuC7CpuvS9igRTTaUWC74sdQwCy8UVZrMZ2O
 8eOjjGN32mxiYD5ImHNIShA2AQ52xjuPS/tZNFTXpJIi+gQiEn5MK7pvETjx1yWZ
 /MReVVz2N8I8guUc9h8YN8/lq3ci1LOKWKOH99qWNc+CjLwZD6p6BXJlyOylXclZ
 1l+X80z+Z70rudeHU/IIVz0AFb+y0o1b87iyv1CNzTlFTVa1jFodevzPAjA9SjoM
 AEoTajZrX0gTJ2Fz6nncLSeBBNhGG+tj9bwCmO4rbNBooIXPkoE8LNh4r45tJVMk
 5LFLYFnPZSF/FA==
X-ME-Sender: <xms:AqlJYDy3rn4loJt9oIgCSOOWL3sVXlgvXayL_0dhv2lNMbRgjezN8Q>
 <xme:AqlJYLQISiRTRmZDqkY0pRZMpg4c1CZivXvWvgDP6IRYPayZ8PZVtyRyuLLTtoraZ
 5o17fUhIfO7nGX-SMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:AqlJYNXEpwzpvmslWL_gPDpVa5dvbDMQbaZ5YGYYHFL7Cwt6Zh4EOQ>
 <xmx:AqlJYNiYhY2Mfvzd1WIQHG3vmKFb7EPe0C3mN9eWE6kT2EYB_If_9A>
 <xmx:AqlJYFDol7xvZgJ_quVJuOVjSqtC2YqFYNbHx7I9gnh5IWzCfg67Rw>
 <xmx:AqlJYIrH9roVnKxFMogv-IhcPSRKp2c-J2kRemi9_q4xMQFiKVwnzg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id B32AE24005D;
 Thu, 11 Mar 2021 00:22:09 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 13/14] axfer: test: reduce test case for maximum
 number of samples per frame
Date: Thu, 11 Mar 2021 14:21:45 +0900
Message-Id: <20210311052146.404003-15-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit reduces test case for maximum number of samples per frame so
that overall time is shortened. The count of total iteration is also
reduced by one quarter.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/container-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
index 788507b..2a3dcff 100644
--- a/axfer/test/container-test.c
+++ b/axfer/test/container-test.c
@@ -300,7 +300,7 @@ int main(int argc, const char *argv[])
 	for (i = begin; i < end; ++i) {
 		err = generator_context_init(&gen, access_mask,
 					     sample_format_masks[i],
-					     1, 128, 23, 3000, 512,
+					     1, 32, 23, 3000, 512,
 					     sizeof(struct container_trial));
 		if (err >= 0) {
 			trial = gen.private_data;
-- 
2.27.0

