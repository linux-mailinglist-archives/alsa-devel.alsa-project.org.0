Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C74F24AA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 09:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E20172F;
	Tue,  5 Apr 2022 09:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E20172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649143467;
	bh=YBPAFTQhI9b6Hx9fd5hidhXc/1d8SBOK94UZaV9Fbfg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctMhgzOZaGRSKPTJL0u9XZatWT2E875X/eW3oKikckUIdKqjivyDwB1D98ahT1jIS
	 mjiowT4vTxKmvSLZkYkAZVeZ7dFjYmmi2OnMA4ooQHpOd+0Btn1u6uyEEedV3wxPJT
	 1DY24YW9If3ii3yV5jMS0+7gEDnxC2sDEZ2FG/kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35335F8051F;
	Tue,  5 Apr 2022 09:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94FFF8051E; Tue,  5 Apr 2022 09:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE56DF8014B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 09:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE56DF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="T4DQp1ug"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R8RUmI0q"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DF4D63202010;
 Tue,  5 Apr 2022 03:22:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 05 Apr 2022 03:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=fho9Nw76piWNYi
 ffx0dMKD6MiN8tLVTAX1xJFxbHL/A=; b=T4DQp1ugXaGG4e7ydGVmhDqLRWOhRL
 T/5lKtb0ClZVbQRqEVdQuonCmvzCyxJ5nN90B6MaNZCAohKrf9DpdBY2Q5wpQTxV
 UIRjhWbOJzjegomNj8fOb0O/4EbBzYatN08x/ZvuMPf6+OhLTgS/AvW3hPtPsPs9
 YvCZ+TTyO3WbfTTg0/X8NP97KS4LNmKHZelFlogpbLZKtrjJbCFlYxithS412Xr+
 5Jes0zmPgf6JGnUL5eySepdvG4X9EUtLAUX2Nr99fMr7FS5S6oWcXcLvhEC5jIoz
 W6q5N+EdyxFalTaLTCaYTfmiHFbtbQXcDRCTpPHqYJ56lC7OBze6oCvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fho9Nw
 76piWNYiffx0dMKD6MiN8tLVTAX1xJFxbHL/A=; b=R8RUmI0qHyDHBBUz4o/VSV
 E/myfByNE3lbiE1U3pQLqrYLypuyWbkD8hwD5lXPYEIU5tZZMmKBu81GNRAQ4fGv
 nzyKl942875hLkGsftbvoCa4kB2RzaUgUJeuR4f/UW4/jyjOGXG8uIiLmfTLPqBo
 1VxSF7bMXbGA8QcEf3QhNeMIFrVp5dQ7pLe8BAI9nVNHW6L+KDanvxvtdLlZdXgY
 zPXyr8qLTXpRSf2Az5oX4m7Lc3GnVnahKXQowYZDKOrPcCqGTE8WxwpCcMcDWpo0
 SmxF1NyXfa3k6x9z3nNCVYzPr6m7CcFXDMNxIcrRF/1c9gOCHslowvJNv4twK1jA
 ==
X-ME-Sender: <xms:QO5LYndCuvUrsRP87u8C7kacrcr8X6hmx2Q9RdGnb_Qyf-AeWb1uKg>
 <xme:QO5LYtNSr7fYX0sPYvKsGb5t82FrRd3TkJ-6-NwSMUlfr-nBvd1h9xtMS07Hc7qb7
 1JNoGSGzy1oDU-YTiE>
X-ME-Received: <xmr:QO5LYggu9AUKCwFldnnvW7VJFBlRGj5nFXaSG2PJGGfXyVX01tDjKPXouEcmLDNaRQ7GgN_o1gHrGgSFKKykJok4TmfqpHoKifvoW5Ysdsg1lWLe_50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:QO5LYo81lo4a_qiNX5Ur1ymawd-RTeriVgznSuovDSrDhrTe628q6g>
 <xmx:QO5LYjsMK0iXdPicaBtTgH8a0JWOXRl3eGyaeIeZ0JVLPsRKR9-8_A>
 <xmx:QO5LYnHTm1gRDqb6ZAJogYC1ba4Ugl6EyqdLVwrOWIoYgJxhq1H-8g>
 <xmx:QO5LYsXDolZhVp8LHh8JX0ha7xMXFTny6oKTODliaO61lnpsFD8PIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 03:22:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 3/3] firewire: add kernel API to access packet structure in
 request structure for AR context
Date: Tue,  5 Apr 2022 16:22:21 +0900
Message-Id: <20220405072221.226217-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
References: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

In 1394 OHCI specification, descriptor of Asynchronous Receive DMA context
has timeStamp field in its trailer quadlet. The field is written by
the host controller for the time to receive asynchronous request
subaction in isochronous cycle time.

In Linux FireWire subsystem, the value of field is stored to fw_packet
structure and copied to fw_request structure as the part. The fw_request
structure is hidden from unit driver and passed as opaque pointer when
calling registered handler. It's inconvenient to the unit driver which
needs timestamp of packet.

This commit adds kernel API to pick up timestamp from opaque pointer to
fw_request structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 18 ++++++++++++++++++
 include/linux/firewire.h            |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index ac487c96bb71..e12a0a4c33f7 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -619,6 +619,7 @@ struct fw_request {
 	struct fw_packet response;
 	u32 request_header[4];
 	int ack;
+	u32 timestamp;
 	u32 length;
 	u32 data[];
 };
@@ -788,6 +789,7 @@ static struct fw_request *allocate_request(struct fw_card *card,
 	request->response.ack = 0;
 	request->response.callback = free_response_callback;
 	request->ack = p->ack;
+	request->timestamp = p->timestamp;
 	request->length = length;
 	if (data)
 		memcpy(request->data, data, length);
@@ -832,6 +834,22 @@ int fw_get_request_speed(struct fw_request *request)
 }
 EXPORT_SYMBOL(fw_get_request_speed);
 
+/**
+ * fw_request_get_timestamp: Get timestamp of the request.
+ * @request: The opaque pointer to request structure.
+ *
+ * Get timestamp when 1394 OHCI controller receives the asynchronous request subaction. The
+ * timestamp consists of the low order 3 bits of second field and the full 13 bits of count
+ * field of isochronous cycle time register.
+ *
+ * Returns: timestamp of the request.
+ */
+u32 fw_request_get_timestamp(const struct fw_request *request)
+{
+	return request->timestamp;
+}
+EXPORT_SYMBOL_GPL(fw_request_get_timestamp);
+
 static void handle_exclusive_region_request(struct fw_card *card,
 					    struct fw_packet *p,
 					    struct fw_request *request,
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 2f467c52bdec..980019053e54 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -354,6 +354,7 @@ void fw_core_remove_address_handler(struct fw_address_handler *handler);
 void fw_send_response(struct fw_card *card,
 		      struct fw_request *request, int rcode);
 int fw_get_request_speed(struct fw_request *request);
+u32 fw_request_get_timestamp(const struct fw_request *request);
 void fw_send_request(struct fw_card *card, struct fw_transaction *t,
 		     int tcode, int destination_id, int generation, int speed,
 		     unsigned long long offset, void *payload, size_t length,
-- 
2.34.1

