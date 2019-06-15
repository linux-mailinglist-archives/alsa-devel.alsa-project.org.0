Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0D946F3E
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 553D7188F;
	Sat, 15 Jun 2019 11:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 553D7188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560590138;
	bh=dTkQnNQIuhtlzz8w7CL960OogygjWi1GUf2adQe1qrs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OuJvteRSxaS/gJoX373bQ65xLT+5oKj9wIx3+nxOdWRF25+r6usC60VdP+GiPIiYL
	 zgiSkJ3AfiSGg7/XvXVbqJ14S6uWAGeHMKBiHtBiJuYrwIwYkOew8al+Lz7F5efXoM
	 n1kzfMVji2RbPnmEouR1vbgBrYXByr9An4GsU2BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73830F8973E;
	Sat, 15 Jun 2019 11:11:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26575F89734; Sat, 15 Jun 2019 11:11:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56350F89712
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56350F89712
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="JzKvWAX+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BzcpgOOH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B9007482;
 Sat, 15 Jun 2019 05:11:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YsdVx/jCsylaj
 SsblmhSkI21QU0iPCkx9Z2oVLVP3VM=; b=JzKvWAX+8us91jEo5EKqPH9yDkqVy
 v1QBpY/5bOWLtOrejQ2PzkwNsfqrfJvNOcO481aCwABU0UWDGnAc8I2aD24UzJiG
 b0HeEoiDxY2+uo0AlGA4B6q7FyG3AsJLcAqE+ELeK5OZUklOudZH8IMsNQZJ709c
 dLRubx3kukD+IshkmsGXuT/DX5rn9R0Cv+hnkR9o9Wsh+aySOH70OwW7lVekzLxy
 JUrZ6dvPxgGmWirPHnrfd5tEQBbLnnybEU/8daZs1yll70OnDK8FyJYWXw8OSnZl
 Qr10+TyuYFjCpciaDOmkRjxK06SFsOQFygAtvjKRq86aGQPPjpSfQCmxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YsdVx/jCsylajSsblmhSkI21QU0iPCkx9Z2oVLVP3VM=; b=BzcpgOOH
 6WxqH6Tc/X63iDivDyipv2cKCQRpvmkrNYNv0wMHYQu3Kww7ag/hixKiO70GJNDr
 B06v+OgUl88CuZbVLb7q9Tx/zKvDjvwfRU3wWD2ZNrgyFbzLm1xqDZgpxdhz7p7A
 ZRODAVZGT5godQoDVGs691jkEQLBkYxQEoN/OGjYXlfONIAJZb21LYq0dCaywxIp
 +LoifaW0S08syEPutQinrY28PIYrCdDLd+tZlTp/8arNZIfO+gRnC1y1Tcw6lpp3
 GFeFVlQjHbqdYOBMnaHJb5Uq0IYfHRRBstyczs84kSc1K9eUw38bZdMhcQ1fioKj
 fIzTMrYNyEZSow==
X-ME-Sender: <xms:NLYEXTMh8OSYKIY6eZVzbmfBOH93KEsanfnV-LcvlZ-VOnfqNR2cew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:NLYEXSjWShoOunnDfO-uXpaoig8pyBYhNL0DTFlQzjG5XwYLYLXqUQ>
 <xmx:NLYEXeIPDAIrfpg8C1sB9kbGtBK7gwboLG-a4hBfdXBny5t7VZXfzA>
 <xmx:NLYEXUb_My250I42wJiaXiaJR8r3nHPoQ_3jE0sx281rAPZFO309rQ>
 <xmx:NLYEXUh0jKctSt2DOaJhLLNMfvIvev9_Tw_4xWjIKR0-7tCiBiaQcw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04C9380060;
 Sat, 15 Jun 2019 05:11:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:11:00 +0900
Message-Id: <20190615091101.7515-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
References: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/6] ALSA: fireworks: change the range of
	critical section for stream data in PCM.hw_free callback
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

The operation of duplex streams should be in critical section.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_pcm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index 287fc05d5917..8dc34249a1b0 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -247,14 +247,15 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN) {
-		mutex_lock(&efw->mutex);
+	mutex_lock(&efw->mutex);
+
+	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
 		--efw->substreams_counter;
-		mutex_unlock(&efw->mutex);
-	}
 
 	snd_efw_stream_stop_duplex(efw);
 
+	mutex_unlock(&efw->mutex);
+
 	return snd_pcm_lib_free_vmalloc_buffer(substream);
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
