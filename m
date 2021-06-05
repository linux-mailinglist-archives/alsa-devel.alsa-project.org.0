Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3439C6FA
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Jun 2021 11:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95C7416F5;
	Sat,  5 Jun 2021 11:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95C7416F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622884365;
	bh=zbT+Zj3awWBBvHiILqWJZicTOuPEfXoRQOusueKEFHs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vskWLNOSy/sG5M7jzHP8ftqctsSdw+UuWXm8Kx9kstyOIANtQ42mbszus69fU3PNt
	 e2YUKYBKYGBmnEfkQvi5uSLf7/4+iErmrcRjYoAk5dPe9PkqNX0+k8aCfQezuoBa6D
	 CiFUb50V59aUO5IyFqWhBntOhlRkQPoUsDLni28k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B1BF800FF;
	Sat,  5 Jun 2021 11:11:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07507F80253; Sat,  5 Jun 2021 11:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95A3FF80103
 for <alsa-devel@alsa-project.org>; Sat,  5 Jun 2021 11:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95A3FF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rQwjE36Q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="U0xCjimJ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4C3231637;
 Sat,  5 Jun 2021 05:11:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 05 Jun 2021 05:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=+FG/mfjNYGqXJsfYEvOqtoj5X2
 IszAKf/IZh5lLmLGo=; b=rQwjE36QY+7onJt+vSIPsx1Gjg3tbHbWDa4uM7ZvNb
 rhSiR8Nj2OWq0Rcu+Jqb1hwjESwfRt4fiBzXMUYfkjPQXcGJHybMj6dYopmw+AD3
 S8EbRkrofUfy7F8srjaKwATXdr5gFdBuJmInGoY0HRLuC6bkUj5ce2n/ud0eJsEW
 c4OEXqqgeKbjNUsdbDuF5OlIft6ARCO/0BX89wzeTFxM5SULxro8yMSmzMRtLoFi
 wuFp2gqq+/oJ8YeAsj8RrYlUZahmumlByO1pHXnf+T3BJENCrYJ/YxTur4upnkV2
 T3XjJcmd/tvcCR/Nbo8V+m38LN7EV6wzaRSa6XFWf4vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+FG/mfjNYGqXJsfYE
 vOqtoj5X2IszAKf/IZh5lLmLGo=; b=U0xCjimJ5/V8MHq78dUdDTproPSXEOLKs
 nXEb0oKzBtPewR79Pey0zB/r+TbA/oCs01Bcv9vbcGAtWPiPZk1KFs7ZOpbm1ew2
 tedsCdZhs3nJ84YTHF2mT2wtZNzEb9Cyt6GC+f9/V0Xybz+4r7ULB+Aj6SExud4C
 qcKWpaaU2mc0Z6tJUQeZZsFJZ/us0uxfjNcyHmwAQiGnIWu1Bj/FZHQEVhfvlwWQ
 vaw09UemWhAFrCjUv0xSB/p51aOn0LCt5UVhFp2cwBAtGVtKhL16U3GDPBL/wjN9
 XOMqhccvI5+sxh0XzXIVfxZDRaf+mL4KMjrXkmCApPR5gcekpPPyw==
X-ME-Sender: <xms:oz-7YPH9KKIp18xVZvgEfoYKgq2zPeMd3OMhAz-sVJRavOKiAXIXEQ>
 <xme:oz-7YMXBvD_EVATh_DHqJp3lx4MFPhl0ScIj5Gfqgpr_Wc1DL5Zf_ypXcJuGTiON_
 XLbgHzr4Avq9ye8Fpg>
X-ME-Received: <xmr:oz-7YBLXcSj49XpwztsFucSKwD6gqw7eNSL00eJFhFd1RlG62boPHwr6frLJCzsK_BAFgGUz2migOgk1ZJV8fHfi2Gg7l7mYOkOysx_Kz_tWfWxu7jxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:oz-7YNEqLqU-p5JrtFHg6Kcz8455dqNgh5A2cdtLtXakL2VfoqpCig>
 <xmx:oz-7YFXFD8KgrwEKkl2-UFeyZ0BwUAVNZKusamoDW7Atflz2HzMKSw>
 <xmx:oz-7YIP_Q-2Kv-MnYU3jS2CoBtfyQD2AJQgOmWWy2ZnMf5HknIq0Sw>
 <xmx:pD-7YChIrNztOubValKN-G4kvcWl_HrSKS3uQoTITdXyI-0xchJnGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jun 2021 05:10:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-lib: fix the context to call
 snd_pcm_stop_xrun()
Date: Sat,  5 Jun 2021 18:10:54 +0900
Message-Id: <20210605091054.68866-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

In the workqueue to queue wake-up event, isochronous context is not
processed, thus it's useless to check context for the workqueue to switch
status of runtime for PCM substream to XRUN. On the other hand, in
software IRQ context of 1394 OHCI, it's needed.

This commit fixes the bug introduced when tasklet was replaced with
workqueue.

Cc: <stable@vger.kernel.org>
Fixes: 2b3d2987d800 ("ALSA: firewire: Replace tasklet with work")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 945597ffacc2..19c343c53585 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1032,7 +1032,7 @@ static void generate_pkt_descs(struct amdtp_stream *s, const __be32 *ctx_header,
 static inline void cancel_stream(struct amdtp_stream *s)
 {
 	s->packet_index = -1;
-	if (current_work() == &s->period_work)
+	if (in_interrupt())
 		amdtp_stream_pcm_abort(s);
 	WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
 }
-- 
2.27.0

