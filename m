Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC883226C
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E5C168B;
	Sun,  2 Jun 2019 09:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E5C168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460136;
	bh=ANqMK8+SyO/CSP34TSXc6IwgyYyGveLBAmLRzeXj4Qs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUeBWlWsxvhx+gVlCTeC2QBr2At6g17kjNg7+WiNRLyJsDJYxBrWnwBgKeSPf8xH6
	 BiPpuW0lZJEgpMuk450z2I4t9WvQg/UGHEa8/zB60ctr5aSf0r3qoiG4lmU/I5vIs0
	 av4DXSi46+dO1DWUABkm8T/BJwU61zb9+vJBxsz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC3CFF89769;
	Sun,  2 Jun 2019 09:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C320F89747; Sun,  2 Jun 2019 09:13:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DAE0F89741
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DAE0F89741
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XQp7Y2aX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2M9azKIa"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CFC2A20F20;
 Sun,  2 Jun 2019 03:13:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Xbb1CG0Jn8goX
 byP+1GxDWb5KC8a0RvlIjE/hZHan+w=; b=XQp7Y2aXXd8FFcXhPwVZq6rvD6US8
 KeyshCY1BNqNBYDy/zuVBRfDyBr9/7J3v9S4s9lsJ8ca28gm1QoWZJVwYEZyHOfQ
 8fbKxtZuqCD+HLQhoUFp821z/MlNPqm21hcHtBRaJ9Lpy0c6NyjKwOeZKx68Lqv1
 s15S+ETHr3eWin8p1MQXWX4cQXt7OHW9S3cVGLu+ynNmnYCalWuneMxBumZXhhGT
 7a+tZwV3EtDgpVh0OrMvQcKMvM5+YXunF92tbYtPlH6BG0FNcvwYPhBYYAlJ6LP4
 ieTfocbObuGrJ4l34+u3wazDHHtsCsLu2ju8kWMq+eGxZO2jpmqkJZvpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Xbb1CG0Jn8goXbyP+1GxDWb5KC8a0RvlIjE/hZHan+w=; b=2M9azKIa
 EKZkm7GaoQkYRSJvSO6qPMPvsmfIfw/NDosJ7W7ytk3yzkbjTaQL3IQc6sBqWvk/
 aFA8v2eQNk4qQ7mA1haoSDwYTuRyEhTFxJf8mhs8f7G+bWNQR8uShorIM5kMz2Vs
 Jr5jj/1Hz9yJyojBfHEun8EHpM64c9jAg48zb/CuRmON3vDUVEx9LQhJeEAIo9Ch
 XBPcn4OJYc3esVmMmYGgGpYOOABqJSgz49iNWUhWgbb6CL/sF8ip++vfcvZNWS9A
 hY5wzzV25TVeVvMPnrBcvKU3WxYiZ8Ya+M5mjNoQRCTfDP5D2BKFTa4/183dEtZ7
 lZjOFOVi/BCrOQ==
X-ME-Sender: <xms:EXfzXH_bH76ITHjNFoC86nGFRZZYYdMrL11Nl-kxUcu5Ev98jgUtMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:EXfzXLURo6_OwRPIlRCPVZsNm42IHAElDVKDgvICz0cDvy-RxB3uMg>
 <xmx:EXfzXAN0z8-k-cxs1jH-nFwhcuEeA4-Uc2GpCAn_1U66GOsPBEGpMQ>
 <xmx:EXfzXNx8cw52njH_hwLLEl4LJ3HI_4kTLTmRDL8GysvQy0YVJdLxvg>
 <xmx:EXfzXNu2XnUlfx89z8mC3iHAr1RHlnSavUYOYNUefNnhdfsdiD21zw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 654DB80059;
 Sun,  2 Jun 2019 03:13:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:55 +0900
Message-Id: <20190602071259.21622-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/15] ALSA: fireface: support
	allocate_resources operation in latter protocol
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

This commit is a part of preparation to perform allocation/release
of isochronous channels in pcm.hw_params/hw_free callbacks.

This commit implements allocate_resources callback for the protocol
specific to latter models. The encoded values of constant table is
split into several condition statements to separate the operation
to configure sampling transfer frequency from the operation to
configure the number of data channels in rx packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-latter.c | 113 +++++++++----------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index c8236ff89b7f..3d12ba5b2a9b 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -97,25 +97,64 @@ static int latter_switch_fetching_mode(struct snd_ff *ff, bool enable)
 				  LATTER_FETCH_MODE, &reg, sizeof(reg), 0);
 }
 
-static int keep_resources(struct snd_ff *ff, unsigned int rate)
+static int latter_allocate_resources(struct snd_ff *ff, unsigned int rate)
 {
 	enum snd_ff_stream_mode mode;
+	unsigned int code;
+	__le32 reg;
+	unsigned int count;
 	int i;
 	int err;
 
-	// Check whether the given value is supported or not.
-	for (i = 0; i < CIP_SFC_COUNT; i++) {
-		if (amdtp_rate_table[i] == rate)
+	// Set the number of data blocks transferred in a second.
+	if (rate % 32000 == 0)
+		code = 0x00;
+	else if (rate % 44100 == 0)
+		code = 0x02;
+	else if (rate % 48000 == 0)
+		code = 0x04;
+	else
+		return -EINVAL;
+
+	if (rate >= 64000 && rate < 128000)
+		code |= 0x08;
+	else if (rate >= 128000 && rate < 192000)
+		code |= 0x10;
+
+	reg = cpu_to_le32(code);
+	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 LATTER_STF, &reg, sizeof(reg), 0);
+	if (err < 0)
+		return err;
+
+	// Confirm to shift transmission clock.
+	count = 0;
+	while (count++ < 10) {
+		unsigned int curr_rate;
+		enum snd_ff_clock_src src;
+
+		err = latter_get_clock(ff, &curr_rate, &src);
+		if (err < 0)
+			return err;
+
+		if (curr_rate == rate)
 			break;
 	}
-	if (i >= CIP_SFC_COUNT)
+	if (count == 10)
+		return -ETIMEDOUT;
+
+	for (i = 0; i < ARRAY_SIZE(amdtp_rate_table); ++i) {
+		if (rate == amdtp_rate_table[i])
+			break;
+	}
+	if (i == ARRAY_SIZE(amdtp_rate_table))
 		return -EINVAL;
 
 	err = snd_ff_stream_get_multiplier_mode(i, &mode);
 	if (err < 0)
 		return err;
 
-	/* Keep resources for in-stream. */
+	// Keep resources for in-stream.
 	ff->tx_resources.channels_mask = 0x00000000000000ffuLL;
 	err = fw_iso_resources_allocate(&ff->tx_resources,
 			amdtp_stream_get_max_payload(&ff->tx_stream),
@@ -123,7 +162,7 @@ static int keep_resources(struct snd_ff *ff, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	/* Keep resources for out-stream. */
+	// Keep resources for out-stream.
 	ff->rx_resources.channels_mask = 0x00000000000000ffuLL;
 	err = fw_iso_resources_allocate(&ff->rx_resources,
 			amdtp_stream_get_max_payload(&ff->rx_stream),
@@ -136,61 +175,20 @@ static int keep_resources(struct snd_ff *ff, unsigned int rate)
 
 static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 {
-	static const struct {
-		unsigned int stf;
-		unsigned int code;
-		unsigned int flag;
-	} *entry, rate_table[] = {
-		{ 32000,  0x00, 0x92, },
-		{ 44100,  0x02, 0x92, },
-		{ 48000,  0x04, 0x92, },
-		{ 64000,  0x08, 0x8e, },
-		{ 88200,  0x0a, 0x8e, },
-		{ 96000,  0x0c, 0x8e, },
-		{ 128000, 0x10, 0x8c, },
-		{ 176400, 0x12, 0x8c, },
-		{ 192000, 0x14, 0x8c, },
-	};
+	unsigned int flag;
 	u32 data;
 	__le32 reg;
-	unsigned int count;
-	int i;
 	int err;
 
-	for (i = 0; i < ARRAY_SIZE(rate_table); ++i) {
-		entry = rate_table + i;
-		if (entry->stf == rate)
-			break;
-	}
-	if (i == ARRAY_SIZE(rate_table))
+	if (rate >= 32000 && rate <= 48000)
+		flag = 0x92;
+	else if (rate >= 64000 && rate <= 96000)
+		flag = 0x8e;
+	else if (rate >= 128000 && rate <= 192000)
+		flag = 0x8c;
+	else
 		return -EINVAL;
 
-	reg = cpu_to_le32(entry->code);
-	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
-				 LATTER_STF, &reg, sizeof(reg), 0);
-	if (err < 0)
-		return err;
-
-	// Confirm to shift transmission clock.
-	count = 0;
-	while (count++ < 10) {
-		unsigned int curr_rate;
-		enum snd_ff_clock_src src;
-
-		err = latter_get_clock(ff, &curr_rate, &src);
-		if (err < 0)
-			return err;
-
-		if (curr_rate == rate)
-			break;
-	}
-	if (count == 10)
-		return -ETIMEDOUT;
-
-	err = keep_resources(ff, rate);
-	if (err < 0)
-		return err;
-
 	data = (ff->tx_resources.channel << 8) | ff->rx_resources.channel;
 	reg = cpu_to_le32(data);
 	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
@@ -200,7 +198,7 @@ static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 
 	// Always use the maximum number of data channels in data block of
 	// packet.
-	reg = cpu_to_le32(entry->flag);
+	reg = cpu_to_le32(flag);
 	return snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
 				  LATTER_ISOC_START, &reg, sizeof(reg), 0);
 }
@@ -424,6 +422,7 @@ const struct snd_ff_protocol snd_ff_protocol_latter = {
 	.fill_midi_msg		= latter_fill_midi_msg,
 	.get_clock		= latter_get_clock,
 	.switch_fetching_mode	= latter_switch_fetching_mode,
+	.allocate_resources	= latter_allocate_resources,
 	.begin_session		= latter_begin_session,
 	.finish_session		= latter_finish_session,
 	.dump_status		= latter_dump_status,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
