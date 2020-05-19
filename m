Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC41D9533
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60D271764;
	Tue, 19 May 2020 13:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60D271764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887413;
	bh=lxpMXvONf1R5IOcMojQi3YOj/E2o/4HYtOtUR9XyafM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQpOW35aOs+Tzfh/0TP+HnT2Q69puaXYNRPUR/U/QuxR8+B8ry/cjC5ZSEGBBbR6k
	 gROEf5zIrn0b/sPCg+IRKnxC12X4osREzFpFJWuuric5a6+4QbHOcNbvBvRf3N8P/+
	 a5tmYjRoSbLC7ss57BoBJ1eTv5qw3eRtn5sx6tRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A500AF802FB;
	Tue, 19 May 2020 13:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 647F3F80256; Tue, 19 May 2020 13:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 178DCF80256
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178DCF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="zDpHgYYC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NGNiaoxv"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D7F85C0131;
 Tue, 19 May 2020 07:16:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tm7Sr8q2/RsWh
 WLv1UFtPrHnYySP7ADqAGxhqDujY1Q=; b=zDpHgYYC6A0vyUp/+mepDYg/nj2j0
 yhTQfD1z5/1ZIkSNrzLDNqhwIT9murdnWMnxYpfYkm9QLg1GEArPU7KilSBtczit
 zuRDvzCyXrsAj8u0J/UYyGzDtRHyrJ6gFbZ11ElcDAS2VB3A3wPlLotNtLSg1R5o
 EF3OkjEmk6Czl24AlFr9GNDz6hm53FO2a70vz6u/dkGcR0rdZWZgVBH2misymPE9
 QDrTlGJraoixLyAuG1jUDyadQUc/+GPzjdNDjn1W/dYqS9aADJcpoqUwlbKZxibY
 mOZbaPvVwdMkKZMbl9YMsE/nwa09DAmRVXFIx12KjuaXEKE9dADwK1STA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tm7Sr8q2/RsWhWLv1UFtPrHnYySP7ADqAGxhqDujY1Q=; b=NGNiaoxv
 D2NXR9Aom6p0WPyDzUzGoAJeB2ypVjQ30pRtjYugi474oNLO5POT7a4yjNPqFQef
 DzN2a/hMg2Tq/UMYseCOPvPXU+fCoL+fHehhqdeuIn0Rl+cd34KKXJ9pahjT1YJV
 kCusuJZanBfqZyUs1hj4nnJMgDvNZgAeKGtfbu/NbCaQBi109tDdCYQ6PUKbnVy/
 wZQqyaUXmjGnCimbhx38p0vwryXY8LLyRIrZ9vTo3FXVyS2H/G9kQmYaSOSjM0H5
 ulUuvzhbb/Anhrz3BDVsE6i3AVwEjDIXps9a3czmmnl9V4q+CA4Va4PCLND+QabO
 s7EmwFT/zXXlVA==
X-ME-Sender: <xms:KsDDXlJEOHzBzb0EnS8DBt9U4Dc1pp4bYwXNYIVioK3RAJOvaSZByw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:KsDDXhLf5NCoLp5N_L4makAIKGr3DwvG5y2pUgO0MeW4kkX9KTotTg>
 <xmx:KsDDXtt-1cnnV-7thBTz7Px4eR-EO34K0k3hSuQWG5WA4y0zrg7Obw>
 <xmx:KsDDXmYxp-DRlGRzEizvtDkvPXj14fRup4boduv5fKNCvXuraEmvSw>
 <xmx:KsDDXi0ia--k4ylzOlo3QkwoM0bBl2PCLJzcd5gbeYz-WAIIvjQZfQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21D58328005E;
 Tue, 19 May 2020 07:16:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 08/14] ALSA: firewire-motu: add alternative functions to
 detect packet format for protocol v3
Date: Tue, 19 May 2020 20:16:35 +0900
Message-Id: <20200519111641.123211-9-o-takashi@sakamocchi.jp>
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

This commit adds alternative functions to detect packet format so that
each function corresponds to each model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c |  6 +++
 sound/firewire/motu/motu-protocol-v3.c | 66 ++++++++++++++++++++++++--
 2 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index cd409efe3350..2ed800ccf6a2 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -345,6 +345,12 @@ int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 	calculate_differed_part(&motu->rx_packet_formats, motu->spec->flags,
 			data, V2_OPT_OUT_IFACE_MASK, V2_OPT_OUT_IFACE_SHIFT);
 
+	memcpy(motu->tx_packet_formats.pcm_chunks,
+	       motu->spec->tx_fixed_pcm_chunks,
+	       sizeof(motu->tx_packet_formats.pcm_chunks));
+	memcpy(motu->rx_packet_formats.pcm_chunks,
+	       motu->spec->rx_fixed_pcm_chunks,
+	       sizeof(motu->rx_packet_formats.pcm_chunks));
 
 	if (motu->spec == &snd_motu_spec_828mk2)
 		return detect_packet_formats_828mk2(motu, data);
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 370d22da276e..903a7eb209f9 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -165,8 +165,6 @@ static void calculate_fixed_part(struct snd_motu_packet_format *formats,
 {
 	unsigned char pcm_chunks[3] = {0, 0, 0};
 
-	formats->msg_chunks = 2;
-
 	pcm_chunks[0] = analog_ports;
 	pcm_chunks[1] = analog_ports;
 	if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
@@ -278,12 +276,63 @@ static void calculate_differed_part(struct snd_motu_packet_format *formats,
 	}
 }
 
+static int detect_packet_formats_828mk3(struct snd_motu *motu, u32 data)
+{
+	if (data & V3_ENABLE_OPT_IN_IFACE_A) {
+		if (data & V3_NO_ADAT_OPT_IN_IFACE_A) {
+			motu->tx_packet_formats.pcm_chunks[0] += 4;
+			motu->tx_packet_formats.pcm_chunks[1] += 4;
+		} else {
+			motu->tx_packet_formats.pcm_chunks[0] += 8;
+			motu->tx_packet_formats.pcm_chunks[1] += 4;
+		}
+	}
+
+	if (data & V3_ENABLE_OPT_IN_IFACE_B) {
+		if (data & V3_NO_ADAT_OPT_IN_IFACE_B) {
+			motu->tx_packet_formats.pcm_chunks[0] += 4;
+			motu->tx_packet_formats.pcm_chunks[1] += 4;
+		} else {
+			motu->tx_packet_formats.pcm_chunks[0] += 8;
+			motu->tx_packet_formats.pcm_chunks[1] += 4;
+		}
+	}
+
+	if (data & V3_ENABLE_OPT_OUT_IFACE_A) {
+		if (data & V3_NO_ADAT_OPT_OUT_IFACE_A) {
+			motu->rx_packet_formats.pcm_chunks[0] += 4;
+			motu->rx_packet_formats.pcm_chunks[1] += 4;
+		} else {
+			motu->rx_packet_formats.pcm_chunks[0] += 8;
+			motu->rx_packet_formats.pcm_chunks[1] += 4;
+		}
+	}
+
+	if (data & V3_ENABLE_OPT_OUT_IFACE_B) {
+		if (data & V3_NO_ADAT_OPT_OUT_IFACE_B) {
+			motu->rx_packet_formats.pcm_chunks[0] += 4;
+			motu->rx_packet_formats.pcm_chunks[1] += 4;
+		} else {
+			motu->rx_packet_formats.pcm_chunks[0] += 8;
+			motu->rx_packet_formats.pcm_chunks[1] += 4;
+		}
+	}
+
+	return 0;
+}
+
 int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 {
 	__be32 reg;
 	u32 data;
 	int err;
 
+	motu->tx_packet_formats.pcm_byte_offset = 10;
+	motu->rx_packet_formats.pcm_byte_offset = 10;
+
+	motu->tx_packet_formats.msg_chunks = 2;
+	motu->rx_packet_formats.msg_chunks = 2;
+
 	err = snd_motu_transaction_read(motu, V3_OPT_IFACE_MODE_OFFSET, &reg,
 					sizeof(reg));
 	if (err < 0)
@@ -304,10 +353,17 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 			V3_ENABLE_OPT_OUT_IFACE_A, V3_NO_ADAT_OPT_OUT_IFACE_A,
 			V3_ENABLE_OPT_OUT_IFACE_B, V3_NO_ADAT_OPT_OUT_IFACE_B);
 
-	motu->tx_packet_formats.pcm_byte_offset = 10;
-	motu->rx_packet_formats.pcm_byte_offset = 10;
+	memcpy(motu->tx_packet_formats.pcm_chunks,
+	       motu->spec->tx_fixed_pcm_chunks,
+	       sizeof(motu->tx_packet_formats.pcm_chunks));
+	memcpy(motu->rx_packet_formats.pcm_chunks,
+	       motu->spec->rx_fixed_pcm_chunks,
+	       sizeof(motu->rx_packet_formats.pcm_chunks));
 
-	return 0;
+	if (motu->spec == &snd_motu_spec_828mk3)
+		return detect_packet_formats_828mk3(motu, data);
+	else
+		return 0;
 }
 
 
-- 
2.25.1

