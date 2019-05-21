Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAADA253A6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 17:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B39168F;
	Tue, 21 May 2019 17:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B39168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558451944;
	bh=M2tb45moKD7JUwqP/R3D/ZCMwVfuMT8X9/Xkzwmowyk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d//9XTuQtEE+2Sv0nJqEFhQdvlT6GQzBf6MF5Eq4fXWidqkf81hEg6gAmWRI+7zQb
	 jVGxPYLdVtZ6LWmqFfAVDKwdjDXMsPXsecP2SsleYr6ECJcGNH/zN1krs215G24dWd
	 zIWHLIvkRHXx5sOWrDK5tsGycDk+NYQPU0CS414I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C7C7F8972D;
	Tue, 21 May 2019 17:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11BFF89707; Tue, 21 May 2019 17:11:56 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DFD8F89709
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DFD8F89709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CQtWZ2KQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ha/miPEM"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6965224574;
 Tue, 21 May 2019 10:57:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 21 May 2019 10:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=z4RxK54y6L4eL
 DohwNgPnoOm26Ke7vDJwiFt7qPqPvI=; b=CQtWZ2KQzp9KhWKphWWoIoxorFmIJ
 nBVVxYo0Cn1yGvooTTmAckkTFkOv3knA/ohPTg05YdAC0mHP2WBdIRm0AGoSLNps
 iqxcFsIsn0OH9/UW9E88PfEJIj0X+VfBXR/bzsKFvlRWJ/agj2P7FZR9CWE+P6HP
 +xhaYuUL0471kUw7RRQG33VX8K2CVVFe0EQ6ILvmVwWXSJ0vU7LWqFExP2LcTGMv
 /7RKTqB8xOx5Ym1KxPrG5X6jCz+b/BwKvwrZlnaezUeHpWHbVloCbl1umWLQRu1u
 pqhIa+egIPtA8XnFxjthuCbHH+qKuNf9bb3B0LQDZKn9ISG2Da+0k8vZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=z4RxK54y6L4eLDohwNgPnoOm26Ke7vDJwiFt7qPqPvI=; b=ha/miPEM
 JIx39TfBn4gTJ6g+rhJBqDIZCd6Ei8nFHaMQwM08ATyhyaEchPOVEZznfcFmdC+w
 ovv8HjI22jDAT9NdeL8av6HnO30Es3TQaHbJKEZEKiX0qyHkKuATasYkINzGW5qJ
 5J/ITrg8K1jwqht8Hgb+ABujOk1BZ2D5KwuwYj2Z9oBohDs3PrxVOdQMmZbvigyX
 GpX2TIgV5+QVL+QXQM9atemKatERSaGDB8i35f+jrPdItaHcjOCvrXFTQ6PZu7Y/
 UnugigRT/3f4QTpEiehJf/akMog7GP2gmcBRFbqo2auGIubmT6jdg8+tcgDnIo0n
 /hkLHcACBxmm5g==
X-ME-Sender: <xms:6hHkXGh5_sDUIb0tI3OGMQfQ9j9ZiXVX9hf3bsUAyClzaOZL9VWJlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6hHkXMI38XI9dQlZ6SpPfQZDj60skwpKKzUr_TMEb7XXjogD-02_Bw>
 <xmx:6hHkXFUTVpulsiyS7OOPZr1CuBiMfYrHuqBcRk2xE8YZVz48kqtJTA>
 <xmx:6hHkXG16Dv_6nPxrndVPpRQmkeWTfW15XhH3ml8pUdviOOa_A4145w>
 <xmx:6hHkXEs-RrXEFzVmFO0J3TfwT7GgnAs91xfgM9Pj7r6AimPO1Oa0SA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D64DD103CF;
 Tue, 21 May 2019 10:57:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 21 May 2019 23:57:35 +0900
Message-Id: <20190521145737.11809-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
References: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/4] ALSA: firewire-lib: add helper function to
	cancel context inner callback handler
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

In callback handler of isochronous context for both direction, there're
common codes to cancel context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 6977fbbef755..ce39cb92a11e 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -707,6 +707,14 @@ static inline u32 increment_cycle_count(u32 cycle, unsigned int addend)
 	return cycle;
 }
 
+static inline void cancel_stream(struct amdtp_stream *s)
+{
+	s->packet_index = -1;
+	if (in_interrupt())
+		amdtp_stream_pcm_abort(s);
+	WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
+}
+
 static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 				size_t header_length, void *header,
 				void *private_data)
@@ -726,10 +734,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	for (i = 0; i < packets; ++i) {
 		cycle = increment_cycle_count(cycle, 1);
 		if (s->handle_packet(s, 0, cycle, i) < 0) {
-			s->packet_index = -1;
-			if (in_interrupt())
-				amdtp_stream_pcm_abort(s);
-			WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
+			cancel_stream(s);
 			return;
 		}
 	}
@@ -779,10 +784,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	/* Queueing error or detecting invalid payload. */
 	if (i < packets) {
-		s->packet_index = -1;
-		if (in_interrupt())
-			amdtp_stream_pcm_abort(s);
-		WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
+		cancel_stream(s);
 		return;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
