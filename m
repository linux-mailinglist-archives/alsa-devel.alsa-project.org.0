Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB5809AC
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D3716CE;
	Sun,  4 Aug 2019 08:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D3716CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900180;
	bh=LnFesNaec/et4IvT5CaU6xV7mEP1eorfMXYaTccxoVM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oo+PUtyLX2tLyC/0zB7/QeKnhBD8LfO2I02AHCLxG2oE4zFp6rwdyhbjmaednxYF/
	 oDW/hCQCgWbR3NMLBtPOj+uakNoeHjsaxgyDTsCt5pS8e6x9EvqvdQKz6dbECPCBRj
	 B/U3eo1sTQG8j2ZJp6Eph68Ukxdkyt6K4fe5R5cA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2088FF8065A;
	Sun,  4 Aug 2019 08:22:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EACF5F800F4; Sun,  4 Aug 2019 08:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE15F800F4
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE15F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ldOIS79r"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="w/l4ngNB"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7754820F24;
 Sun,  4 Aug 2019 02:21:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qvVaq+mFNBrn0
 BRWt4H3HmPy+zDf7LAMvI2SzWevAnI=; b=ldOIS79r6tDb89y8NECkNXgtGFHkU
 YQQaYEMoLXhYO5O1Lz0QQwDfeE6J/TRvW5ewNgxfegW+KFGFXvyt1YYwZmExtebI
 Q/NAtHKXb8oZ8sTGFnKYCTemf6GclMuV5i3L0NMjjoOGYfRYrqxOvxktCn/rWG2I
 2js7ll84wU34PoqtpPzqF46K/vFCXbIgWDaHBcXyDESNmqdGCDd+DNLQZRbK6Mlk
 HDo1rQI4ST6spwZo+srh5Ndj4tTQez/AczVZAV+i07Xl/SXC1o1pmlfiRqMuGqDq
 So/1ycSm52YR9SknhcRKzQefC9GG2ysiO9yTF2VLPrP0kmjqHOJdvwq+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qvVaq+mFNBrn0BRWt4H3HmPy+zDf7LAMvI2SzWevAnI=; b=w/l4ngNB
 o5KbBzBGdAoHzvXBBLvYZJYuO0G0riqVfQ+74NvRv+NAjDeDtUs/B1AvZ+J3cNoI
 VNR6phmFjRneqyK6dprUeXYwwqOrzJENFASAIj1Oq50mlUItiEnesn4L74AsuJCd
 ThAyAihRXsQmxYRKqQl5kECPl3ApUi4M+2KEve5mXpjkQW2QvRo6NiZkAjtmV+ZP
 aff2WVuL1RXOjQAtolf3jDfakx+y0T9seN39QoGjEpEE52LyB049omzZyPHW4zpT
 AFsT7Xvyy8OuINsOklDaVbjoSEf5xzQj6sxiEFNQnOvCy15gBFTs48cBcW/5nwVe
 Y1LKDgCR0zVHuw==
X-ME-Sender: <xms:hHlGXeNoaE7KECgCh7_Jv9ie5xc9HDWRFi0iMx2T2IdE3LlRVD3Hmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:hHlGXX228DGKDqwazVcBWEfJKp7Nd7mulcp9C5r1YtXM5RlBJTVYFQ>
 <xmx:hHlGXfdMFPrMHpehODI8wxpD46UeecXP1CyMHTkahd2jYfZGH7WfPw>
 <xmx:hHlGXQbtfa2U47-HEyPB3G6pjOfzUEcPirgoA7ITEXtiXtk0M-ONww>
 <xmx:hHlGXZrgbrZZilQ_p9kGm_xNdkE5yW6uS9RAh3Ty62xIj1fkKEh22w>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 039D7380083;
 Sun,  4 Aug 2019 02:21:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:28 +0900
Message-Id: <20190804062138.1217-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/19] ALSA: firewire-motu: code refactoring
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
 sound/firewire/motu/motu-stream.c | 48 ++++++++++++-------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 2bbb335e8de1..cc9f34426a47 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -300,62 +300,52 @@ void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 	}
 }
 
-static int init_stream(struct snd_motu *motu, enum amdtp_stream_direction dir)
+static int init_stream(struct snd_motu *motu, struct amdtp_stream *s)
 {
-	int err;
-	struct amdtp_stream *stream;
 	struct fw_iso_resources *resources;
+	enum amdtp_stream_direction dir;
+	int err;
 
-	if (dir == AMDTP_IN_STREAM) {
-		stream = &motu->tx_stream;
+	if (s == &motu->tx_stream) {
 		resources = &motu->tx_resources;
+		dir = AMDTP_IN_STREAM;
 	} else {
-		stream = &motu->rx_stream;
 		resources = &motu->rx_resources;
+		dir = AMDTP_OUT_STREAM;
 	}
 
 	err = fw_iso_resources_init(resources, motu->unit);
 	if (err < 0)
 		return err;
 
-	err = amdtp_motu_init(stream, motu->unit, dir, motu->spec->protocol);
-	if (err < 0) {
-		amdtp_stream_destroy(stream);
+	err = amdtp_motu_init(s, motu->unit, dir, motu->spec->protocol);
+	if (err < 0)
 		fw_iso_resources_destroy(resources);
-	}
 
 	return err;
 }
 
-static void destroy_stream(struct snd_motu *motu,
-			   enum amdtp_stream_direction dir)
+static void destroy_stream(struct snd_motu *motu, struct amdtp_stream *s)
 {
-	struct amdtp_stream *stream;
-	struct fw_iso_resources *resources;
+	amdtp_stream_destroy(s);
 
-	if (dir == AMDTP_IN_STREAM) {
-		stream = &motu->tx_stream;
-		resources = &motu->tx_resources;
-	} else {
-		stream = &motu->rx_stream;
-		resources = &motu->rx_resources;
-	}
-
-	amdtp_stream_destroy(stream);
-	fw_iso_resources_destroy(resources);
+	if (s == &motu->tx_stream)
+		fw_iso_resources_destroy(&motu->tx_resources);
+	else
+		fw_iso_resources_destroy(&motu->rx_resources);
 }
 
 int snd_motu_stream_init_duplex(struct snd_motu *motu)
 {
 	int err;
 
-	err = init_stream(motu, AMDTP_IN_STREAM);
+	err = init_stream(motu, &motu->tx_stream);
 	if (err < 0)
 		return err;
 
-	err = init_stream(motu, AMDTP_OUT_STREAM);
+	err = init_stream(motu, &motu->rx_stream);
 	if (err < 0)
-		destroy_stream(motu, AMDTP_IN_STREAM);
+		destroy_stream(motu, &motu->tx_stream);
 
 	return err;
 }
@@ -366,8 +356,8 @@ int snd_motu_stream_init_duplex(struct snd_motu *motu)
  */
 void snd_motu_stream_destroy_duplex(struct snd_motu *motu)
 {
-	destroy_stream(motu, AMDTP_IN_STREAM);
-	destroy_stream(motu, AMDTP_OUT_STREAM);
+	destroy_stream(motu, &motu->rx_stream);
+	destroy_stream(motu, &motu->tx_stream);
 
 	motu->substreams_counter = 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
