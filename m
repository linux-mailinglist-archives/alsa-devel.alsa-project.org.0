Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E22C4B32A6
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 03:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9E19181F;
	Sat, 12 Feb 2022 03:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9E19181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644632638;
	bh=fvllDMo0aOuHIIzzz+ufgJ5zqmVoA6e3ydwpnZDD2Vo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTcLgqT1yGCWupo+xJMAjKh4CRwcaEn8ccCW061XeXrfD0v/UGwfUrdaJj8+JhbiK
	 USBp5pPmkGsKxMQ5lC1EYVyOFg6DALq43TMUNbEh9RZqwjsz1Sj2FB6ltR2iihFypy
	 tNXN4wMbVAXbai5KUBWU/tpVxlRW0IjPuvCkCZAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB16F80518;
	Sat, 12 Feb 2022 03:21:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F63FF804E0; Sat, 12 Feb 2022 03:21:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEB4CF80089
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 03:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEB4CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="eyyJmmKS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IMWpl2Dj"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6B5353201DBF;
 Fri, 11 Feb 2022 21:21:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 11 Feb 2022 21:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=IERouoOAZT+69o
 dSGZES8xOT3FLde6UiHl1oXWy+mRQ=; b=eyyJmmKSjgIH15wxeePanwMPcsB9JE
 UyYy6JS7gpri7o+4dwyS+E+P8itcmD7DF2lIDg3pFIT/JGm4Wi0Thagxsy+QJL9y
 2EAtCTO27wnBpHby3Wa3OAP63KKhuR3K/UcyqJ90YKx2+/9xg1itN+jUK4VGQ4Gk
 zGD5EGxhyWALNrrYYME18Hp9IgyC29JmG4ZT4qGw5Q+B4K3DIe5P8x1U8lZfBTGy
 7aVPuPuctkYusTLBRhwdS+qMN8jIVRA/RUAcNkjCK1zWpIitV7YrSvD1GHDlo/XV
 jeEmvW9HdH3ecG2+QbBTUh52rorLvCThukwb99v0wFWc3A+OuW7LciOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IERouo
 OAZT+69odSGZES8xOT3FLde6UiHl1oXWy+mRQ=; b=IMWpl2DjkcwCiIiQDfj/8J
 sq9kUaYeSy/4hHZjR/Fsu3DlrIAG+NteM3IzQRzR6QQIaGV0wyL3wDnCuTNY51za
 Y6XL8BPHPu0fBOwT0DScH3+t6kLIpI4IewtBBdinetxIO0KHRML5imQmEXJUPrR4
 H4PULL4vaCE3ptJvsw/4oNmeHvYl1PyR4EvzTn/sEFPsONtkZVaPezTneIl5rxfZ
 Hn+V9E4557T6dmM8tCmzRFYcoM1NZk8R0pnW7xFPd7TqigxX6NQnnHRo2RJ14YQg
 hPBkbDoef3CaLsHhZZ1nBFLYhAYGOJWNCk82XBIAno6ScqStFWDM6lbkTczX7BRQ
 ==
X-ME-Sender: <xms:uhkHYlYE9FpdbJgbz7cJlFCRYn7Z_F7FyoDx7uRtmnygPHs3dw9HEw>
 <xme:uhkHYsY4CdH2hhft8dFU1hLhEGopzqBCS2o2rarznnj0VRkwg6l2DWfLp-k50bHoQ
 Z5ovOdN8OCO8TjkEPo>
X-ME-Received: <xmr:uhkHYn9o10sjS-2UXXDCOrhdk4Cilsn5ZgPqu_7I3q2RskUjNShZr5UHjdQstG0CagpRLCYVgXQ3IFl1ILlM-WVTrugRo2vvyvibW9ExxYutxuFGPhGt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieeggdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:uhkHYjoEkY4C-CQ-95t-rR8yEIIHCimAIpA5Us2gh64J39KYR8MAVQ>
 <xmx:uhkHYgqtRmvuTA1gY006wcF3DhVY4ec2liSDSbU0lxw-9LG-XIzvbQ>
 <xmx:uhkHYpRFrd7t1kP_Do4rxf-ONSaGCaOyy2FjHxtzrWmR9Q--8HIA5Q>
 <xmx:uxkHYrVJmTKaAi7G0XyEWBen6dCaAXDSf9J8D1qZPCLbcy5A1oHArw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 21:21:45 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 3/3] firewire: add kernel API to access packet structure in
 request structure for AR context
Date: Sat, 12 Feb 2022 11:21:31 +0900
Message-Id: <20220212022131.199855-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220212022131.199855-1-o-takashi@sakamocchi.jp>
References: <20220212022131.199855-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org
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
2.32.0

