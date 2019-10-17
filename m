Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B26DB1CB
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 18:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F7E16AC;
	Thu, 17 Oct 2019 18:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F7E16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571328196;
	bh=Qmk/EY1Jk8/E3BnIyV7O7ubfxaPrrHA1KnGaHoIYZoU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMBST93e0NEPNGQ8HD5YZM6NI/bZ92OqpSX+MHzeLb8FhYpgqE1JBxW47tJfUGW9l
	 bAO2rJfXy/zYUWhZI2enVt+nBT5GkrsACxUfzfP+JqJxFa7LoOzZwrPHFlnBBIPMDA
	 9d28C5/NWB3XmZP3nlwxtCXgarg4R1qkJp0N2jIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 841FDF806F5;
	Thu, 17 Oct 2019 17:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59A11F80638; Thu, 17 Oct 2019 17:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE0B2F8060F
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE0B2F8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DvOSHET1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="seEc/D1c"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F389718A;
 Thu, 17 Oct 2019 11:54:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=odcj4VY8d/LYo
 BAaOPUAmp7104uboAs95bB4x4fwaQo=; b=DvOSHET1C9kAcoWiURCwMPMDcQgjC
 sTsev7u1CawWvT74iW9ojBNCgA328ExHUPaMZTCzkbk28YEl7aOO1kRBfoZ+GdOc
 0q/Pr0GOJCLODDc9d3LZ1SX48duyApK6FyGuNq+jSk4OEgxR71GYjKnUyw16PA1f
 6MJ9pcM6X6U2otgzWjLqVm1CSWDdRPGFZLXv9OxY5e1UvffmSUCS+D5d04EuMxoY
 4VEnNPElXbRrS0lkRZxo1RrBRRYJwIde5VOwNB8Z/Axn++a0UYIhyhs/3oKz9V3h
 JJo4fregDvNAPJzu30J2XXxTn+MCPTnOXHPcUG9nllzPxyFafGUgkZyiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=odcj4VY8d/LYoBAaOPUAmp7104uboAs95bB4x4fwaQo=; b=seEc/D1c
 +s5Y/bBytHWVEpMCNLqpaAB+igHCPM8v2YMvACLLUXPT57GKDBVBZLHEmw6Tu4Cw
 rQa8xEuS4z519bvctSuWzCcV5KWQAyLJPpGFtr28lA8LFs/5AqCil/0eaj5enPIh
 O8Jg/LVyA1GZXnc/dDXFoYFwNIfI2ILB3Kpq5hj+B5hXpo4fq2QasUoSex4B8dDc
 qvBNid9ocEccFK9rBCNAmdedsmkBHwtIEj7if6HlDMqduuL7vFMy/ScnGS+cCTps
 2buaMByFYJ4HmhbJPHDn8i4pWjEGD0B48IzrtaZMgRpJLANEUlQyUhmRP7AO1zUE
 AmzQV1yi4EwNSw==
X-ME-Sender: <xms:xo6oXZYUcrB2jVBn8Ta-5qPzlgQ1H6idNyZZIZ1VYPW5Yf2K5dxnyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:xo6oXcMnIFptJdEdjAeG7BU9waFmmYqTfwEWHsFGe45mmXeB_jD25w>
 <xmx:xo6oXSZElSA49GrRu7D5bJejsDZ9itMZIM3BjocY7vHfJUTBXxIVgQ>
 <xmx:xo6oXUUt-1VBENBfhE_oBwRpX10fnwKLLhIFXz1x-OWNdWnXxo0cmw>
 <xmx:xo6oXV_BJtUdGKoJ_j6gPQAoussZvhopgMPaLD7G2SnwhjmEfAMTgw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3399A80066;
 Thu, 17 Oct 2019 11:54:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:23 +0900
Message-Id: <20191017155424.885-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/12] ALSA: firewire-lib: tune the maximum
	available size of PCM period
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

Linux driver for 1394 OHCI controller voluntarily flushes isoc context
when total size of accumulated context header reached PAGE_SIZE. This
kicks tasklet for the isoc context. This is inconvenient to process
runtime of PCM substream.

This commit adds a restriction of the maximum size of PCM period to
avoid this behaviour.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fd7c3e4d5374..8a7818130382 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -176,6 +176,8 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 					struct snd_pcm_runtime *runtime)
 {
 	struct snd_pcm_hardware *hw = &runtime->hw;
+	unsigned int ctx_header_size;
+	unsigned int maximum_usec_per_period;
 	int err;
 
 	hw->info = SNDRV_PCM_INFO_BATCH |
@@ -196,19 +198,24 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	hw->period_bytes_max = hw->period_bytes_min * 2048;
 	hw->buffer_bytes_max = hw->period_bytes_max * hw->periods_min;
 
-	/*
-	 * Currently firewire-lib processes 16 packets in one software
-	 * interrupt callback. This equals to 2msec but actually the
-	 * interval of the interrupts has a jitter.
-	 * Additionally, even if adding a constraint to fit period size to
-	 * 2msec, actual calculated frames per period doesn't equal to 2msec,
-	 * depending on sampling rate.
-	 * Anyway, the interval to call snd_pcm_period_elapsed() cannot 2msec.
-	 * Here let us use 5msec for safe period interrupt.
-	 */
+	// Linux driver for 1394 OHCI controller voluntarily flushes isoc
+	// context when total size of accumulated context header reaches
+	// PAGE_SIZE. This kicks tasklet for the isoc context and brings
+	// callback in the middle of scheduled interrupts.
+	// Although AMDTP streams in the same domain use the same events per
+	// IRQ, use the largest size of context header between IT/IR contexts.
+	// Here, use the value of context header in IR context is for both
+	// contexts.
+	if (!(s->flags & CIP_NO_HEADER))
+		ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
+	else
+		ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
+	maximum_usec_per_period = USEC_PER_SEC * PAGE_SIZE /
+				  CYCLES_PER_SECOND / ctx_header_size;
+
 	err = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_TIME,
-					   5000, UINT_MAX);
+					   5000, maximum_usec_per_period);
 	if (err < 0)
 		goto end;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
