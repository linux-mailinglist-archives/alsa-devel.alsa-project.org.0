Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B33226B
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC81D1691;
	Sun,  2 Jun 2019 09:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC81D1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460094;
	bh=euqRE8Ubl405ldntcJcATgvUM3ZGTj40fxgebB6E6Mg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJ/Mf/V7F+B0IJcn33X853jmOkydl8gxkE2thWBNQ1rzHcZNasnxiLLa8+kFkT7Z0
	 0BkABcYXjOUWLoNVnfl/c4kh449PsxDja58DpM2XZ8LKnsVNSutwQeQhLe+ckVVNt8
	 /2mkoCHTQ/GKXxNz1DRxXqn3IYypWnbcet811ma8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B412F89761;
	Sun,  2 Jun 2019 09:13:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D61F2F89746; Sun,  2 Jun 2019 09:13:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26048F8973B
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26048F8973B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="RteOqOU1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KeCa33Z5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5891920E7B;
 Sun,  2 Jun 2019 03:13:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0taR1LKWK1qcz
 +bGKnTiX/+U74qHBlzNYii256CkOrs=; b=RteOqOU1GH1BV3JLCpOK87GIOffDt
 sRUli4Fh0g1VqdtJoWA7tyt3U2aUzYVIGjb7AZy7J9XBVIgRVHrXQUEBPp1TP4r0
 WZByz4dMYbNU7bKCOvyqH31ebgrux4bD9eDEa7L29vQCZMnO8UNgPddSjyNdYnD/
 lxnwNt1pSEKekxt8zB+3qDuBO2zSLr5A4LCB40Pp/UXLT6dX7/yuonJ1dwPMWGu8
 tEExLUYq8ZOKEPDmNZLAB9u8BZ9a4N1KtjJcOguPivzOKFqRvVg7E3HLpAu+O3jJ
 D+Xw9D79Wr/VJTKWS/GD1IxmrXKX8nAVKZ2SaJHMzyhl3Q4FjvDTMvnFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0taR1LKWK1qcz+bGKnTiX/+U74qHBlzNYii256CkOrs=; b=KeCa33Z5
 3awyMI6X/hqGT3LURn+pmUIOHiN0VTJlT82l5UMY/oW41KfkWRon+5efAXij09wO
 K4iqSS5G/6fHGwAQBem5O5G7f0EMOwIGZWmXD3SiBH1axi+BnWiqq6WsfF3eAbbW
 GOI3m+nl2m4hIWz6TARyKPSGyLpIiob4of0wTTYmPkN0KZSdbsCshOn74qc/xFtc
 2wL7JPt2JPkFDJoZ8crZ2aBBoLJDYFIILcN+LN59ilyxS2zA/I7gldXqeqloKKB3
 Qw/ATwSq76AdbsGnSW6xLIwZi7ezT9hXjFRnViBCiEmAVgkp2xf2PSyg05YJ93bJ
 EmTdAbczHV/9ow==
X-ME-Sender: <xms:EHfzXMH26YhHIoEED6qCryXk8gYAckXwBgXiMYqErM7a3WCf4s7Lhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:EHfzXJlrYPg4ga52en7MjrYUkeA9PgsbiEu3Jwbtqggx4g4aGxIWeA>
 <xmx:EHfzXBIzcAIIjfA3ZouT47Mbml4SDME7-Hg92mgGMDQTMDxQfHL8eA>
 <xmx:EHfzXCb0PpfPCL0jTiH2FE4gfqp0L4tDuvexjAiW9ovLTSHA1xpdhg>
 <xmx:EHfzXGYmw_Rxy2bKtZs7nFIFKjJaOj29OENXf-Sob9jj4mO0q94WfA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF8A680059;
 Sun,  2 Jun 2019 03:13:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:54 +0900
Message-Id: <20190602071259.21622-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 10/15] ALSA: fireface: support
	allocate_resources operation in ff400 protocol
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

This commit implements allocate_resources callback for ff400 protocol.
In this callback, sampling transfer frequency is configured to the
device as well.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-protocol-former.c | 36 +++++++++-----------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index 11575d17d6cc..0517eb718f54 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -429,12 +429,11 @@ const struct snd_ff_protocol snd_ff_protocol_ff800 = {
 #define FF400_TX_PACKET_FORMAT	0x00008010050cull
 #define FF400_ISOC_COMM_STOP	0x000080100510ull
 
-/*
- * Fireface 400 manages isochronous channel number in 3 bit field. Therefore,
- * we can allocate between 0 and 7 channel.
- */
-static int keep_resources(struct snd_ff *ff, unsigned int rate)
+// Fireface 400 manages isochronous channel number in 3 bit field. Therefore,
+// we can allocate between 0 and 7 channel.
+static int ff400_allocate_resources(struct snd_ff *ff, unsigned int rate)
 {
+	__le32 reg;
 	enum snd_ff_stream_mode mode;
 	int i;
 	int err;
@@ -447,11 +446,20 @@ static int keep_resources(struct snd_ff *ff, unsigned int rate)
 	if (i >= CIP_SFC_COUNT)
 		return -EINVAL;
 
+	// Set the number of data blocks transferred in a second.
+	reg = cpu_to_le32(rate);
+	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
+				 FF400_STF, &reg, sizeof(reg), 0);
+	if (err < 0)
+		return err;
+
+	msleep(100);
+
 	err = snd_ff_stream_get_multiplier_mode(i, &mode);
 	if (err < 0)
 		return err;
 
-	/* Keep resources for in-stream. */
+	// Keep resources for in-stream.
 	ff->tx_resources.channels_mask = 0x00000000000000ffuLL;
 	err = fw_iso_resources_allocate(&ff->tx_resources,
 			amdtp_stream_get_max_payload(&ff->tx_stream),
@@ -459,7 +467,7 @@ static int keep_resources(struct snd_ff *ff, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	/* Keep resources for out-stream. */
+	// Keep resources for out-stream.
 	ff->rx_resources.channels_mask = 0x00000000000000ffuLL;
 	err = fw_iso_resources_allocate(&ff->rx_resources,
 			amdtp_stream_get_max_payload(&ff->rx_stream),
@@ -475,19 +483,6 @@ static int ff400_begin_session(struct snd_ff *ff, unsigned int rate)
 	__le32 reg;
 	int err;
 
-	err = keep_resources(ff, rate);
-	if (err < 0)
-		return err;
-
-	/* Set the number of data blocks transferred in a second. */
-	reg = cpu_to_le32(rate);
-	err = snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
-				 FF400_STF, &reg, sizeof(reg), 0);
-	if (err < 0)
-		return err;
-
-	msleep(100);
-
 	/*
 	 * Set isochronous channel and the number of quadlets of received
 	 * packets.
@@ -589,6 +584,7 @@ const struct snd_ff_protocol snd_ff_protocol_ff400 = {
 	.fill_midi_msg		= former_fill_midi_msg,
 	.get_clock		= former_get_clock,
 	.switch_fetching_mode	= former_switch_fetching_mode,
+	.allocate_resources	= ff400_allocate_resources,
 	.begin_session		= ff400_begin_session,
 	.finish_session		= ff400_finish_session,
 	.dump_status		= former_dump_status,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
