Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5C466276
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 12:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9466525FB;
	Thu,  2 Dec 2021 12:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9466525FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638445071;
	bh=jTDH0PZLxupRRoH6by9YXZljKPXrp24j0DPy3IfwXFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrT39y7OcEvPZ+4TKyXAW/cjGSH2299Ulj9DZM/thV1xe3sEH20FPhLVXGPhnXJ9m
	 zswfheHIFapFE546BWDGaAZ+ytGwB6DArhiH1eev4FqbBCkyW6EGEwz6ks/ZQ2s6aA
	 zVPIyga6g/IS5IQWR7Cd4aiOPbhSEs9EfCskZZbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B59E2F80506;
	Thu,  2 Dec 2021 12:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0826F804FA; Thu,  2 Dec 2021 12:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 723B9F80290
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 12:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 723B9F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LB0DMAE8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="M/xSxlx7"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 47DE23201EF4;
 Thu,  2 Dec 2021 06:35:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 02 Dec 2021 06:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HYA2baR9g9uxh
 0vIU8ekgamWzAVAwChaw229O58ZZJg=; b=LB0DMAE8Y2qCVUl1aYoFZx0OO1Oy6
 BE6b6+iQgdTXh9sN7tsC+6tEhB7SDtMI3gIb3xgHms+qYrwzihtbKen6PtQjE1tc
 zSSUi5vgh34vpY521sxfh0FL0SdUCs4/82sJUZNLWEiGfeGhzHe7plE/YkNhrzB6
 NCWFXG7lT2c1LEf3unCoD7+tq/z03/kzUymvje1x0SyF43raJZ8gRlpWbPM9n2ta
 lIFgl3PdsA5OmvYpxr0R0FGea/bGOruWHuHuLD37/OUybBlD6gfJUVh7PIJFGEU/
 yXV9wubzM/XgzVxvsrg12awKy5Wom/RmciGMh+HmYpZtBTyXdg/XA55Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HYA2baR9g9uxh0vIU8ekgamWzAVAwChaw229O58ZZJg=; b=M/xSxlx7
 63mVkOuO6JR7TLx7WnHEXdy+Tddn0t8rCibgySMiEQR5Mn5B+dqBMpY43XW9CT8F
 OKMzUoHXdiZe4b1UtiJGolyyuTPw634wEg6a5ZO981eI9RSVMPCrYr53SyNHh0hu
 43p4GawKvXM0NUcmOg2F/6bmmRK+Vg1JTkAKIo5DiAr542N/D68LSFwUSVVpxWox
 Rzjz4cZuKKGq7YrUEJtoss0YZ7xUKJKSuD8mcorRWOB8GvJi/tjYY4ETAoPTENnr
 Ka5dKUgg3zfsL3xB5dba9q8XPlNP1W4iKds7a7WG20J0kesxXaJg5efJMWJN3a/R
 PHK5HkPNSleWig==
X-ME-Sender: <xms:ca-oYaQoH-M39LTDHE3qjbnNTLOP5Ux-54AFK72KmIEyELPtVjfnFg>
 <xme:ca-oYfzB7amdRsIFp6yBdg5QKlwn7Ramnu2TtFieDWKZ2j8rDO33gifsaZ6WLcZyr
 MP7j1dGHjNhM7Q7Gvw>
X-ME-Received: <xmr:ca-oYX1YNEqced0s9pHETmyw7T2-wo4uPmA_Il_mKPRCk3Tvec7m-u35uy6S8Nber4kQ89i21lWBKpUChFd5WHS6P0M0TUoypzje2Cm3RC2eDVbryCJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ca-oYWBn6d2KdwS7HCxY4y4hyWOoxc3MIS5Jl2-0YUJfe7NGl-Qw-g>
 <xmx:ca-oYTgIBfgRgdwSD2X3kQTc9CH07HTCW6mIpZJz-D2HJvkGEdv2bQ>
 <xmx:ca-oYSpsDcT_YJNQSDuPatJmgw8avuzaH89Ylp7pqa4JtVJw3kSioQ>
 <xmx:ca-oYTfvREdZGq9ULktFoqBIqNg5cGFSUHDZRdKAFk3123vzYsr6qw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Dec 2021 06:35:12 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de
Subject: [PATCH 3/3] firewire: add kernel API to access packet structure in
 request structure for AR context
Date: Thu,  2 Dec 2021 20:34:57 +0900
Message-Id: <20211202113457.24011-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
References: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org, marcan@marcan.st
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
2.32.0

