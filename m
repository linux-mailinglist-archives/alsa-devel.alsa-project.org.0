Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5B675027
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 10:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDDB2F75;
	Fri, 20 Jan 2023 10:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDDB2F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674205527;
	bh=jCegmBqRsgW/ZyKCJcoReK/y1MIKheosZgBQcDHWDzU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NvXoRqrSscG8Bm5nmeq2COuMDi2SOpGu8PTtD+4rCd/ISSklBMZCVcmR3tCq3845o
	 bIMeJXsHIDXgcreOp8VoDa5M7FrFbyQzOwi5j8dfVuwpKng2eHLCiAtV0WnWj1UAC7
	 g7ocRHZ5DT88fci8hsM0WY2tLVHoGPsESEz0z7Ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAFEF80549;
	Fri, 20 Jan 2023 10:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3362F80495; Fri, 20 Jan 2023 10:04:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3CB5F8024D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 10:03:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3CB5F8024D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=b1BRbngq; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Rct60oA4
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B57E5C0154;
 Fri, 20 Jan 2023 04:03:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 20 Jan 2023 04:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674205433; x=
 1674291833; bh=ofXt6LA5isnrTwDUYaXALKqLJ5c6lOkyPZo5vc9Gy7g=; b=b
 1BRbngqLvU6QNPyFYJx70Ij6oJ6izykcupYX/KcOeJJpgfzlhJS+SaLtPHuvcibt
 QldRAp52Sdgq+GCfwflthHk+tzXrWyJ/H3fIUKrgT8KGjnFPgLGKDG7n7OlMTL0f
 VjQ5ARiH0IiLttBHaqbLNJCfUefX1f3fFkZORG3Tjcyov8Dcno3m14/Ly2S614lc
 Gu/C5SPshpF/VMNByDRsfqXAGoiQJ0VJdsCAs9BihuaCfuCGY5yMyefa7CwCcOcI
 Sy+Lpd9Vs8MhHknX9frwNB+bfpqCZlRznvW8H6pVSJDou7rFRfa4AqArauPiDKup
 QWT9q2RM02mY+zY+wZBfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674205433; x=1674291833; bh=ofXt6LA5isnrT
 wDUYaXALKqLJ5c6lOkyPZo5vc9Gy7g=; b=Rct60oA4KKTDoDwWjc0y3rp38AxHY
 nnXgDupAR1muiISEONGPaLHZjWYPTjDKogJOPPT7Za/Z/6aJoQaKbLyvJ4YrLyW2
 M8P/OblK2A0ceHmBdZT3PjV7hzVPlLAvKlBeAYK3SNSsAMfALHeMAcosepZSwdV9
 JsbVqN4l90EQFS7HqgdEjN0IpWid9S1rmdKWoKR9MlQv/jzMk+aahk6EpvzxpEdM
 KV/7q2phb/pv1Tn1lrPx4d0sKnH6v4RgRV+BC+0aQrPiAzQAeEfs9NCgCAeeRNSn
 Pb1N3325dv3B4q2KS71Z51iKewzSbIXIxT6sdCK2rmeWOqvRHDQnNFZxQ==
X-ME-Sender: <xms:-VjKYwlIT-ijXZoRXMZS0PS-fCMp6cjxlqwKe-tRu4ACzLxoqPBbyQ>
 <xme:-VjKY_3du6K-oRVFYh-dc4OnR1SloolpdXkTi3l0iSh9VnDFeMJLJBVpk2pjRxK-o
 nhIT0hjwXRInaUGnZk>
X-ME-Received: <xmr:-VjKY-oqCxYCtJ4OFzMIFrAgNcycHprhd9j39aAXtJfeig1CY3HvviRWdIlnFIOO5BSivKdTFzcAA0sHaG5qyDA4e1pE8XvVvuNv06rSTChbj7HGwzl3Ul0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgf
 ejuedvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhih
 esshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-VjKY8nt6iupQpMD6jj9o-JO6pXvXYMx3cFZFXOHJlRpm6ebS_Sl1Q>
 <xmx:-VjKY-2YOYS4GZ23WrBTEZLWKyvJwM6w6S1VnpChFDWLEbFQJklDsA>
 <xmx:-VjKYzunTQ2sAxJExHrTjdrVtvbT8QuWdbyYeiuoFgO2eUnUkV5EaA>
 <xmx:-VjKYzyZD6i99J3W_c4pEkd9FeerJHyH40p1EO4ej9Voj-krgKQFew>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 04:03:51 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH 2/3] firewire: cdev: obsolete NULL check to detect IEC 61883-1
 FCP region
Date: Fri, 20 Jan 2023 18:03:43 +0900
Message-Id: <20230120090344.296451-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120090344.296451-1-o-takashi@sakamocchi.jp>
References: <20230120090344.296451-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the character device, the listener to address space should distinguish
whether the request is to IEC 61883-1 FCP region or not. The user space
application needs to access to the object of request in enough later by
read(2), while the core function releases the object of request in the FCP
case after completing the callback to handler.

The handler guarantees the access safe by some way. It's done by
duplication of the object after NULL check to the request, since core
function passes NULL in the FCP case. It's inconvenient since the object
of request includes some helpful information. It's better to add another
way to check whether the request is to FCP region or not.

Conveniently the file of transaction layer includes local implementation
for the purpose. This commit moves it to module local file and use it
instead of the NULL check, then the result of check is stored to
per-client data for the inbound transaction so that the result can be
referred by later to release the data.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c        | 16 +++++++---------
 drivers/firewire/core-transaction.c | 20 ++++++++++----------
 drivers/firewire/core.h             |  6 ++++++
 include/linux/firewire.h            |  5 ++---
 4 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 93dd80d8d4e1..7fa49e51bae8 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -111,6 +111,7 @@ struct inbound_transaction_resource {
 	struct client_resource resource;
 	struct fw_card *card;
 	struct fw_request *request;
+	bool is_fcp;
 	void *data;
 	size_t length;
 };
@@ -643,18 +644,13 @@ static int ioctl_send_request(struct client *client, union ioctl_arg *arg)
 			    client->device->max_speed);
 }
 
-static inline bool is_fcp_request(struct fw_request *request)
-{
-	return request == NULL;
-}
-
 static void release_request(struct client *client,
 			    struct client_resource *resource)
 {
 	struct inbound_transaction_resource *r = container_of(resource,
 			struct inbound_transaction_resource, resource);
 
-	if (is_fcp_request(r->request))
+	if (r->is_fcp)
 		kfree(r->data);
 	else
 		fw_send_response(r->card, r->request, RCODE_CONFLICT_ERROR);
@@ -669,6 +665,7 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 			   void *payload, size_t length, void *callback_data)
 {
 	struct address_handler_resource *handler = callback_data;
+	bool is_fcp = is_in_fcp_region(offset, length);
 	struct inbound_transaction_resource *r;
 	struct inbound_transaction_event *e;
 	size_t event_size0;
@@ -685,10 +682,11 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 
 	r->card    = card;
 	r->request = request;
+	r->is_fcp  = is_fcp;
 	r->data    = payload;
 	r->length  = length;
 
-	if (is_fcp_request(request)) {
+	if (is_fcp) {
 		/*
 		 * FIXME: Let core-transaction.c manage a
 		 * single reference-counted copy?
@@ -743,7 +741,7 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 	kfree(e);
 	kfree(fcp_frame);
 
-	if (!is_fcp_request(request))
+	if (!is_fcp)
 		fw_send_response(card, request, RCODE_CONFLICT_ERROR);
 
 	fw_card_put(card);
@@ -819,7 +817,7 @@ static int ioctl_send_response(struct client *client, union ioctl_arg *arg)
 
 	r = container_of(resource, struct inbound_transaction_resource,
 			 resource);
-	if (is_fcp_request(r->request)) {
+	if (r->is_fcp) {
 		kfree(r->data);
 		goto out;
 	}
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 83f61cf1aa8f..a9f70c96323e 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -535,12 +535,6 @@ const struct fw_address_region fw_unit_space_region =
 	{ .start = 0xfffff0000900ULL, .end = 0x1000000000000ULL, };
 #endif  /*  0  */
 
-static bool is_in_fcp_region(u64 offset, size_t length)
-{
-	return offset >= (CSR_REGISTER_BASE | CSR_FCP_COMMAND) &&
-		offset + length <= (CSR_REGISTER_BASE | CSR_FCP_END);
-}
-
 /**
  * fw_core_add_address_handler() - register for incoming requests
  * @handler:	callback
@@ -822,12 +816,18 @@ static struct fw_request *allocate_request(struct fw_card *card,
 	return request;
 }
 
+/**
+ * fw_send_response: - send response packet for asynchronous transaction.
+ * @card:	interface to send the response at.
+ * @request:	firewire request data for the transaction.
+ * @rcode:	response code to send.
+ *
+ * Submit a response packet into the asynchronous response transmission queue. The @request
+ * is going to be released when the transmission successfully finishes later.
+ */
 void fw_send_response(struct fw_card *card,
 		      struct fw_request *request, int rcode)
 {
-	if (WARN_ONCE(!request, "invalid for FCP address handlers"))
-		return;
-
 	/* unified transaction or broadcast transaction: don't respond */
 	if (request->ack != ACK_PENDING ||
 	    HEADER_DESTINATION_IS_BROADCAST(request->request_header[0])) {
@@ -935,7 +935,7 @@ static void handle_fcp_region_request(struct fw_card *card,
 	rcu_read_lock();
 	list_for_each_entry_rcu(handler, &address_handler_list, link) {
 		if (is_enclosing_handler(handler, offset, request->length))
-			handler->address_callback(card, NULL, tcode,
+			handler->address_callback(card, request, tcode,
 						  destination, source,
 						  p->generation, offset,
 						  request->data,
diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 78c99f1d27fa..eafa4eaae737 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -257,4 +257,10 @@ static inline bool is_ping_packet(u32 *data)
 	return (data[0] & 0xc0ffffff) == 0 && ~data[0] == data[1];
 }
 
+static inline bool is_in_fcp_region(u64 offset, size_t length)
+{
+	return offset >= (CSR_REGISTER_BASE | CSR_FCP_COMMAND) &&
+		offset + length <= (CSR_REGISTER_BASE | CSR_FCP_END);
+}
+
 #endif /* _FIREWIRE_CORE_H */
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 980019053e54..56505436d159 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -278,9 +278,8 @@ typedef void (*fw_transaction_callback_t)(struct fw_card *card, int rcode,
  * Otherwise there is a danger of recursion of inbound and outbound
  * transactions from and to the local node.
  *
- * The callback is responsible that either fw_send_response() or kfree()
- * is called on the @request, except for FCP registers for which the core
- * takes care of that.
+ * The callback is responsible that fw_send_response() is called on the @request, except for FCP
+ * registers for which the core takes care of that.
  */
 typedef void (*fw_address_callback_t)(struct fw_card *card,
 				      struct fw_request *request,
-- 
2.37.2

