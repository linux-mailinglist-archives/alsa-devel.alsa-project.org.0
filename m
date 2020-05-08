Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AF1CA25E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90181831;
	Fri,  8 May 2020 06:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90181831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588913003;
	bh=g2/005NuMnCSF0lCUECWRdAf0y0bfasp77dmOnOUGlM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPGr9Fwkl1vWYCofzKl4v7Tjb1oDsdt2msu00MtZnlsX+gwMTxLyVMhR2vCaxCFVo
	 qt/twc6KQKOSSEKvBdKX1TM2BxOvzyPObjJ0cMGPS567ow4wT0LLgis+20rTGqyTs4
	 nAE1moim1Zfp/bV4QUWG/dnqEFpS3mtUGQMk4Qao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A96F802F9;
	Fri,  8 May 2020 06:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 339A7F802A9; Fri,  8 May 2020 06:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B6E0F80259
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6E0F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="P8fzG6Hd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="USLyzuCb"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id E108EAE7;
 Fri,  8 May 2020 00:36:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ZaDfdM0UOnsbq
 EJyN/0oV1aGs3fa+/Rpdqc7lHET4Yo=; b=P8fzG6HdS9J7p2WGX85nY/9Hhtoz7
 s2hOBdYrDrDe34Fo5E4d07Yu2B3c9by5B20n8I0gZLYO+MaPIQs3Pb8o/JSjDHb3
 bfJ2qfMKr1opDp0W8f/JhMbZi2TkqWFjNw+QheAbX6NiGy8+kSIr99yM9Srk1kV9
 SvhCv7BU6WCS7LNipIO5tSeq+W7BD+xnMftFwEqKiL+IpCbsW/CTvF6f02dVRbOr
 ahV3dOjP4jLFq2W1sYiabspL3Sl6EMF+INAl//MthiWGhnSgOE0UzuJFSP3uRFiq
 ehvuOzYGM1t1wDtyYsjzTk9myj7FvC0Mu2Wrm7RyycOlX0YXhZMyKAXzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ZaDfdM0UOnsbqEJyN/0oV1aGs3fa+/Rpdqc7lHET4Yo=; b=USLyzuCb
 TLOp+Fbwaq+6J0ok6mxmM7YUPXezo8CVkQR8D3yZTtpcar0fAxT2LIjBbjQtRsCN
 VmYa+EzDr/qHgPPjQ5JTT4toABaNK98UvwzAOyCk0OWQd6Gx70F1QbFMynb+eJV0
 JNs1X17D8KS6SzuKhQUn//dwbDR3menTjTFYVbVRdEk+5X/Jr4/1r/s1JYVOCmD4
 9cpHPgYbCbnT+NvWBvFJygggWCGFkIRy5DfaC79o1JI4BwhVcamA0Q2Axo9oCPzK
 WWp3zrJA9ddoqb6PjJgZrmlG4j1DXCwBaMzmKK8KTouc8RRhD0Mt1vNqvyvZJcVl
 VTpmWY0vDiQjTQ==
X-ME-Sender: <xms:3-G0XvunKTmT1OtgNXkH2krwLZjujGeD6gw0gv4cLWakBqdKxTiwMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:3-G0XuDjTzRlMcbwQvm6j_iLYp4PAT45SqRjDfgKduxlUhuBef8z1w>
 <xmx:3-G0XpO07u2pchDsFVCvHdSKQ5Fd-oPZVaR78QQHpPM9z6k6O8CciA>
 <xmx:3-G0XvzIF_6NuH4iW5oJvwae7cjRycRPC7thViGbzhU294qSF6INew>
 <xmx:3-G0XmLRFRVAle3TPUw_PnoQ3ezrVMUpJEH594FvqYX2oXJXt-c5aQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 930093280069;
 Fri,  8 May 2020 00:36:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 08/10] ALSA: firewire-lib: add cache for packet sequence to
 AMDTP domain structure
Date: Fri,  8 May 2020 13:36:33 +0900
Message-Id: <20200508043635.349339-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
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

For future extension, storage is required to store packet sequence in
incoming AMDTP stream to recover media clock for outgoing AMDTP stream.

This commit adds the storage to AMDTP domain for this purpose. The
packet sequence is represented by 'struct seq_desc' which has two
members; syt_offset and the number of data blocks. The size of storage
is decided according to the size of packet queue.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 15 ++++++++++++++-
 sound/firewire/amdtp-stream.h |  9 +++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index efd1f2a40cf1..f1c8611cfc70 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1269,6 +1269,8 @@ int amdtp_domain_init(struct amdtp_domain *d)
 
 	d->events_per_period = 0;
 
+	d->seq_descs = NULL;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_init);
@@ -1370,12 +1372,18 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 	queue_size = DIV_ROUND_UP(CYCLES_PER_SECOND * events_per_buffer,
 				  amdtp_rate_table[d->irq_target->sfc]);
 
+	d->seq_descs = kcalloc(queue_size, sizeof(*d->seq_descs), GFP_KERNEL);
+	if (!d->seq_descs)
+		return -ENOMEM;
+	d->seq_size = queue_size;
+	d->seq_tail = 0;
+
 	if (ir_delay_cycle > 0) {
 		struct fw_card *fw_card = fw_parent_device(s->unit)->card;
 
 		err = get_current_cycle_time(fw_card, &cycle);
 		if (err < 0)
-			return err;
+			goto error;
 
 		// No need to care overflow in cycle field because of enough
 		// width.
@@ -1431,6 +1439,8 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int ir_delay_cycle)
 error:
 	list_for_each_entry(s, &d->streams, list)
 		amdtp_stream_stop(s);
+	kfree(d->seq_descs);
+	d->seq_descs = NULL;
 	return err;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_start);
@@ -1455,5 +1465,8 @@ void amdtp_domain_stop(struct amdtp_domain *d)
 
 	d->events_per_period = 0;
 	d->irq_target = NULL;
+
+	kfree(d->seq_descs);
+	d->seq_descs = NULL;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_stop);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 477fbfe713e5..84a01efa5a85 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -276,6 +276,11 @@ static inline bool amdtp_stream_wait_callback(struct amdtp_stream *s,
 				  msecs_to_jiffies(timeout)) > 0;
 }
 
+struct seq_desc {
+	unsigned int syt_offset;
+	unsigned int data_blocks;
+};
+
 struct amdtp_domain {
 	struct list_head streams;
 
@@ -283,6 +288,10 @@ struct amdtp_domain {
 	unsigned int events_per_buffer;
 
 	struct amdtp_stream *irq_target;
+
+	struct seq_desc *seq_descs;
+	unsigned int seq_size;
+	unsigned int seq_tail;
 };
 
 int amdtp_domain_init(struct amdtp_domain *d);
-- 
2.25.1

