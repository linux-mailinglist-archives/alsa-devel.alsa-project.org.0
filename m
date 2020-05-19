Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0581D9530
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4079A1721;
	Tue, 19 May 2020 13:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4079A1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887373;
	bh=NAHC7y3+J9I9PTExfQCXyOvOLQ73mfBakd+eJAeYzgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZjYrzYJYy4ezwi/Lb5IokBsnTeZK5Nfos6dJy1lgkl9ZOF42Z/Bldas5/3ikGZDV
	 Jdrl24DidfR0XbqSglQBdb1Boef7IJkiTG3XMxIWLJQUxuZNABmaTKMj/6ySFeQWPu
	 ggC4HefLXXjArr4xoAq7DQS/GFgSAKdUofKAkcNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45630F802EC;
	Tue, 19 May 2020 13:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 309F9F802BD; Tue, 19 May 2020 13:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70773F8028F
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70773F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WCBdT2CO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jKAWH7YC"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9451E5C0134;
 Tue, 19 May 2020 07:16:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=y9XhXfEc1+/EV
 lGyssHXKlMNp8FLirh2iOWBwvocCRg=; b=WCBdT2COTLMsUV2HmTn7k6dY6Z7wO
 GehbTeGdNMly/TUk5lKShyF1jgtmIhUQpKQ8a6HRD4nbrj7Uu7aDwYbZl98YGnAS
 4m+oVXJYHH2QjkVIPtOChqHy3EManN8TeZJBAVY55+IKUis5JA45g6ncrA4MkPnt
 m4QGM9XRUtVGLJ+ihqyfwZukRrkDa1+yxVI+mH+CPQBYY6YJ4rlSSz1+Y/gW7YSY
 eYYmay8W5ZOYAvTKeVq8CZptCkyEBIcAmmUR7eJNRBsfMl/FnDLFHHvPk5TtYBzU
 K1v1iLnHrxlUqYLVlhD3f2S+/PFftXoOmGLd6auCR/cobI4eVEMPwTaWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=y9XhXfEc1+/EVlGyssHXKlMNp8FLirh2iOWBwvocCRg=; b=jKAWH7YC
 yvwWyEEnQg2UVEm34kCA9qdZnkKpoLoYqcck+bvG5OiphInrDG3b7CA28TAHD/ey
 iNYYPcvUEZLIl7deRElidg4Y7PUOEPFj9ajjBAei3T/Z1iWm2NXeQaBXiDZ1i2My
 fqMCU/Q4yDcVZ4BerIWPVcJB77cPnXPNAMNu7vIlSCGzFNOWH5ui6UkRAU0fHAcy
 mATt+/RAVbbeYAJ1VGyGE+DdKKi+HQIeDfT8tpdZNQcUlSZvZYzGzM/WdN1W8V8W
 FB3R5Qvui/23f7wa0doN/M774jv3HOdrn0dkhCcfnflcZwmzcQKsfCLbEje0lqSs
 tUxV4BCBMcw1KQ==
X-ME-Sender: <xms:K8DDXgFtla9OwdWMiseNVJcO3RWXw7inayfFDjjgfZp9eFi9OxC0hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:K8DDXpVrcKXFlEtD-iJOo_OD_SdeDxipYMLW8qd2T0BL5YUXIyorxA>
 <xmx:K8DDXqIEQsyIyOn93UzdF6oTMMicSli8VknIC7bcvgWQnWh1hjB9hA>
 <xmx:K8DDXiHxgE491Emv0u3pxeAg8TR5fXzyjNnbLhLR0oYWh_QShLhVJg>
 <xmx:K8DDXhCcnK0OMxtpHvvujKz6vQCo-LcNmFYBns6lPngMahC_GXCqzg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6F18C328005E;
 Tue, 19 May 2020 07:16:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 09/14] ALSA: firewire-motu: use table-based calculation of
 packet formats for proc
Date: Tue, 19 May 2020 20:16:36 +0900
Message-Id: <20200519111641.123211-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
References: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
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

This commit uses table-based calculation of packet formats for proc
nodes.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-pcm.c  |  9 +++------
 sound/firewire/motu/motu-proc.c | 12 ++++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index b24bb870388e..8e1437371263 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -26,8 +26,7 @@ static int motu_rate_constraint(struct snd_pcm_hw_params *params,
 		rate = snd_motu_clock_rates[i];
 		mode = i / 2;
 
-		pcm_channels = formats->fixed_part_pcm_chunks[mode] +
-			       formats->differed_part_pcm_chunks[mode];
+		pcm_channels = formats->pcm_chunks[mode];
 		if (!snd_interval_test(c, pcm_channels))
 			continue;
 
@@ -59,8 +58,7 @@ static int motu_channels_constraint(struct snd_pcm_hw_params *params,
 		if (!snd_interval_test(r, rate))
 			continue;
 
-		pcm_channels = formats->fixed_part_pcm_chunks[mode] +
-			       formats->differed_part_pcm_chunks[mode];
+		pcm_channels = formats->pcm_chunks[mode];
 		channels.min = min(channels.min, pcm_channels);
 		channels.max = max(channels.max, pcm_channels);
 	}
@@ -82,8 +80,7 @@ static void limit_channels_and_rates(struct snd_motu *motu,
 		rate = snd_motu_clock_rates[i];
 		mode = i / 2;
 
-		pcm_channels = formats->fixed_part_pcm_chunks[mode] +
-			       formats->differed_part_pcm_chunks[mode];
+		pcm_channels = formats->pcm_chunks[mode];
 		if (pcm_channels == 0)
 			continue;
 
diff --git a/sound/firewire/motu/motu-proc.c b/sound/firewire/motu/motu-proc.c
index 71d02602d84d..f009cf7aa074 100644
--- a/sound/firewire/motu/motu-proc.c
+++ b/sound/firewire/motu/motu-proc.c
@@ -51,7 +51,7 @@ static void proc_read_format(struct snd_info_entry *entry,
 	if (snd_motu_protocol_cache_packet_formats(motu) < 0)
 		return;
 
-	snd_iprintf(buffer, "tx:\tmsg\tfixed\tdiffered\n");
+	snd_iprintf(buffer, "tx:\tmsg\tfixed\ttotal\n");
 	for (i = 0; i < SND_MOTU_CLOCK_RATE_COUNT; ++i) {
 		mode = i >> 1;
 
@@ -60,11 +60,11 @@ static void proc_read_format(struct snd_info_entry *entry,
 			    "%u:\t%u\t%u\t%u\n",
 			    snd_motu_clock_rates[i],
 			    formats->msg_chunks,
-			    formats->fixed_part_pcm_chunks[mode],
-			    formats->differed_part_pcm_chunks[mode]);
+			    motu->spec->tx_fixed_pcm_chunks[mode],
+			    formats->pcm_chunks[mode]);
 	}
 
-	snd_iprintf(buffer, "rx:\tmsg\tfixed\tdiffered\n");
+	snd_iprintf(buffer, "rx:\tmsg\tfixed\ttotal\n");
 	for (i = 0; i < SND_MOTU_CLOCK_RATE_COUNT; ++i) {
 		mode = i >> 1;
 
@@ -73,8 +73,8 @@ static void proc_read_format(struct snd_info_entry *entry,
 			    "%u:\t%u\t%u\t%u\n",
 			    snd_motu_clock_rates[i],
 			    formats->msg_chunks,
-			    formats->fixed_part_pcm_chunks[mode],
-			    formats->differed_part_pcm_chunks[mode]);
+			    motu->spec->rx_fixed_pcm_chunks[mode],
+			    formats->pcm_chunks[mode]);
 	}
 }
 
-- 
2.25.1

