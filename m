Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C2347C2A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:23:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296BC176C;
	Mon, 17 Jun 2019 10:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296BC176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759834;
	bh=e/QEfBdDc9ccrRaligMx+VFj4RpELKUDxJrDKfuG/gU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kp1mxsrv/Ch+qlNqjriB8+tSSPyN28RwhKIVBD8bkch3PpcCG7lwXLWLgvGQezyTK
	 oiHk2IC0gDaHo83NZ2QhD/tv1pI14apccVmy+/qwwK3T8ytLTPAEmjNUilnym6guds
	 +0YZCeySwBROmau52bAvvqF1XXa5zqrhBNBVzjLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A8EDF89763;
	Mon, 17 Jun 2019 10:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 103F2F8973B; Mon, 17 Jun 2019 10:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AD6F896F9
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AD6F896F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vb7JLbHh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nFAOLjjz"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A0F44735;
 Mon, 17 Jun 2019 04:15:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TWnX/+x+L6MGp
 Ln74MxPYPkukErCID7QKB4H0QvPw+U=; b=vb7JLbHhebaCKGn3rh+K2IlPVn8r7
 FkqFdcmZbQNZI476jKOWx9QwORgsM4JBImdc8fworWfFNEw/YCM8Q5oyAABlfWcK
 IoT4aM/gFTRICQPqD3Xvb2XWXNCeYyfYKb1PuSUfymLWgWW2LmtUSlsOi02R8LXC
 8reSUppOgPp/mus6sXYtJSaAUGmWQaapxgvNTguc9lDWN5SM+tN4U/fI3hUp1wPh
 OkgHHhAzH1E8kJ2EazPC8nsNnS8WPU8DIubla94MJhIk83zONsaAFlACZPntXjuz
 sS6ew/lAMvz16MvJe6r2YAQJD6o+KBAvIOblUt+ZTx0iffnSxGhN4ctuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TWnX/+x+L6MGpLn74MxPYPkukErCID7QKB4H0QvPw+U=; b=nFAOLjjz
 UGIYlUzaxW4DU0Q1PyHp3ppZO/teSWP/L/AzSDwiw3r4vvC3vF/MW/lGQnX8N9K6
 bbpYQhjjcgNi3tPw6ywsiu/G9CnY7bm++Z7GqI4euHygCnAQXAwrKApywnWQUAUl
 wGXn3KRnk41FmyC8pRW4GNNtWZV9sGE15Nv8HaKucCHe1YxpGXf93YZtoWot1PFj
 keM7acPseuhfncoomKX4bzDSf2oY0FAfWrKOp6Ec6BkJSIHWeiP9ecHit1FadMlC
 CUA9xHMcIX/TDsm3K4NtwrYwQ4IX8bktfii/2crer7Ck1TmMIHiQeDysRLrmxf9/
 A4w6MTOE4EZetg==
X-ME-Sender: <xms:IUwHXXYLoXM6qy8ezCt0KyZXG4FJqrs28VTyJINCWR337OH47VI0JQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:IUwHXeBdXciaT8etv0KcZ38g7P2kCtroVGZpJ5FYyaa2s_n4NREhOg>
 <xmx:IUwHXaI_YRLojMuZWuTmD6svSZcMNibqjkVLBGk4YOWwJyDnOwY2fg>
 <xmx:IUwHXVqJrb7ncM9UDtaHQIQTlrphZCsXqANPjsiPY7MUlSeCS1YpAg>
 <xmx:IUwHXZnBo3CHBUTuHBXfdMGI3j69yS6-Us6Rup-6L-zANFfo2xd_TA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1F0D80062;
 Mon, 17 Jun 2019 04:15:27 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:09 +0900
Message-Id: <20190617081510.11025-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/10] ALSA: firewire-motu: update isochronous
	resources when starting packet streaming after bus-reset
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

After bus reset, isochronous resource manager releases all of allocated
isochronous resources. The nodes to transfer isochronous packet should
request reallocation of the resources.

However, between the bus-reset and invocation of 'struct fw_driver.update'
handler, ALSA PCM application can detect this situation by XRUN because
the target device cancelled to transmit packets once bus-reset occurs.

Due to the above mechanism, ALSA fireface driver just stops packet
streaming in the update handler, thus pcm.prepare handler should
request the reallocation.

This commit requests the reallocation in pcm.prepare callback when
bus generation is changed.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 5630a8f1f2f1..82891583b736 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -236,6 +236,7 @@ static int ensure_packet_formats(struct snd_motu *motu)
 
 int snd_motu_stream_start_duplex(struct snd_motu *motu)
 {
+	unsigned int generation = motu->rx_resources.generation;
 	int err = 0;
 
 	if (motu->substreams_counter == 0)
@@ -245,6 +246,16 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 	    amdtp_streaming_error(&motu->tx_stream))
 		finish_session(motu);
 
+	if (generation != fw_parent_device(motu->unit)->card->generation) {
+		err = fw_iso_resources_update(&motu->rx_resources);
+		if (err < 0)
+			return err;
+
+		err = fw_iso_resources_update(&motu->tx_resources);
+		if (err < 0)
+			return err;
+	}
+
 	if (!amdtp_stream_running(&motu->rx_stream)) {
 		err = ensure_packet_formats(motu);
 		if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
