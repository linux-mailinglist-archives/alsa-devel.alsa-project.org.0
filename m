Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32D9C25B
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2019 08:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D1E1666;
	Sun, 25 Aug 2019 08:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D1E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566716087;
	bh=FoTBmMcFsShzNdpiuayQm1WqdPn6VBHbCXgILWXKZ2c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HoLWVlfw+1MXvKsljUdcplIrgnp22Sc4VDpZnr86sozyh6rhdkSnwVvjN1c0VF5jt
	 upSbJ6cbxWhCvT/klkIJztwDeJsY1N03TrtXEqbh0QuPSPHh5cfBXd4ZWKuuWGq4jj
	 7ocKtyhYIxQ6C6neHa7II/6E8VQeaH1hY62NUgYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A299FF80214;
	Sun, 25 Aug 2019 08:53:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64E59F80213; Sun, 25 Aug 2019 08:53:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 253C6F801ED
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 08:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253C6F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="RmJhGx8A"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PNcIfGtC"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E86221321;
 Sun, 25 Aug 2019 02:52:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 25 Aug 2019 02:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=iaw8/Ot9AUG6I5+ljh8IgI2ci5
 5aRXAkgKYmUgTok2s=; b=RmJhGx8AfUtVeZQhzSCZ3WRUkLjdycnEkLPCO3n36C
 JbrxQG21aMrPnk4CxefniLy8qzE4LJ+gJGJkYB0efEYomPwsmz5CjRjNJJcIOANL
 EUXonWKEfgYOvlKWbvPevjRKNR371A372DQlal1CWqxXn7gPatPAgxcbPMPElGAT
 zIHWpshTPtUE+fTnNGV64qNm/tb043EZcPAJ4W4ja6EUozZ8nP5LUK2UIsrufHx0
 N6SYnLl+p0vnEnr8IqpHG+XsWIlXEPAJZXVdN0T+2t/GROE9tQtn0ewVgRrHL73K
 kyCuwO9ZzOpyrckG53jzN7Gdjnb9O3v/sSV2xh8IbouQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iaw8/Ot9AUG6I5+lj
 h8IgI2ci55aRXAkgKYmUgTok2s=; b=PNcIfGtCuajO8eRCLogciyz8lOnwD/UfZ
 pzRaNdvwr2CJiZZjaNzaLXEkxulmuPMC/9sBWKBXsqZZJXxL/KAWrIpdcQl7pair
 R/xbSvTrvhn0PIMj79ipTE2gI5c3dPczEwakvmP52W8UFTLqrwf92YNgNZMEnrCp
 Yf8uhzTJ8tIuj2rJJ5PTS2aDhivAf7oi32OvW5Nuqgn0xL40AynMX6HMIUrldA1J
 0fWjYrkbLlr08DEaZO9tA1C6Vj8ufPlxvEdIYuGeAVhTTQ2TcbSoR8ach1/VJ+Pd
 nTQ7eHAmRtHED3M2JfMnLUtN2LwsBvKUK5t0+rnwJszxU4GuJkilg==
X-ME-Sender: <xms:QzBiXUp6-ruqdG6CQrSNBmPIAnRCUi-bEGVF2FA0ziYEUfDaNBYxWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehuddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinhepfedqrhgtjedrihhnne
 cukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdht
 rghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:RDBiXWb3PhbTUGnRuUIgbErnPIWLnhadJFNAphl2kwhW58zgix_hTQ>
 <xmx:RDBiXRx6S5HCfoNNh2SL3xnJbZYXQftju__Wl861X15F_Hbn48-DHQ>
 <xmx:RDBiXdBbNoPPMjHcpbignCJW6jyuJEe1_O6t-9Q3NPzb_DxSMx0ILQ>
 <xmx:RDBiXfHW6qdaoqgv_WTTW8rptLXI_w6giOA3_XjYq8N0c0kda6jtTg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B3F2080059;
 Sun, 25 Aug 2019 02:52:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 25 Aug 2019 15:52:47 +0900
Message-Id: <20190825065247.26840-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-lib: allocate additional
	entries for list of packet descriptor to avoid out-of-bounds access
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

This patch is for Linux v5.3-rc7.

In a case of delay to execute scheduled tasklet for isoc context, it's
possible to handle queued packets than 16 (=INTERRUPT_INTERVAL). In the
case, out-of-bounds access occurs because the list of packet descriptor
is allocated just for 16 packets. This causes any negative effects in
kernel memory or software IRQ context.

It's quite rare because current implementation allows user processes to
flush the queued packet in process context by executing several PCM
ioctl(2) commands. However, it's good to prevent.

This commit is a prevention against this bug. For safe, the allocation is
done for 16 plus 12 packets, equivalent to 1.5 msec plus. Furthermore,
when detecting the case, packet streaming is cancelled and kernel log is
printed to notice to users and developers.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 1a92855c7647..f03321888997 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -56,6 +56,11 @@
 #define INTERRUPT_INTERVAL	16
 #define QUEUE_LENGTH		48
 
+// For jitter of software IRQ execution, keep more entries for the list
+// of packet descriptor equivalent to 1.5 msec to avoid out-of-bounds
+// access to process queued packets.
+#define DESC_COUNT	(INTERRUPT_INTERVAL + 12)
+
 // For iso header, tstamp and 2 CIP header.
 #define IR_CTX_HEADER_SIZE_CIP		16
 // For iso header and tstamp.
@@ -779,12 +784,22 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 {
 	struct amdtp_stream *s = private_data;
 	const __be32 *ctx_header = header;
-	unsigned int packets = header_length / sizeof(*ctx_header);
+	unsigned int packets;
 	int i;
 
 	if (s->packet_index < 0)
 		return;
 
+	// The number of packets in buffer.
+	packets = header_length / sizeof(*ctx_header);
+	if (packets > DESC_COUNT) {
+		cancel_stream(s);
+		dev_info(&s->unit->device,
+			 "out-stream: Unexpected count of packet: %d\n",
+			 packets);
+		return;
+	}
+
 	generate_ideal_pkt_descs(s, s->pkt_descs, ctx_header, packets);
 
 	process_ctx_payloads(s, s->pkt_descs, packets);
@@ -830,6 +845,13 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	// The number of packets in buffer.
 	packets = header_length / s->ctx_data.tx.ctx_header_size;
+	if (packets > DESC_COUNT) {
+		cancel_stream(s);
+		dev_info(&s->unit->device,
+			 "in-stream: Unexpected count of packet: %d\n",
+			 packets);
+		return;
+	}
 
 	err = generate_device_pkt_descs(s, s->pkt_descs, ctx_header, packets);
 	if (err < 0) {
@@ -981,8 +1003,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	else
 		s->tag = TAG_CIP;
 
-	s->pkt_descs = kcalloc(INTERRUPT_INTERVAL, sizeof(*s->pkt_descs),
-			       GFP_KERNEL);
+	s->pkt_descs = kcalloc(DESC_COUNT, sizeof(*s->pkt_descs), GFP_KERNEL);
 	if (!s->pkt_descs) {
 		err = -ENOMEM;
 		goto err_context;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
