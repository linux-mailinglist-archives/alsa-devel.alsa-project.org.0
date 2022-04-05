Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A24F24AC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 09:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF0F1712;
	Tue,  5 Apr 2022 09:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF0F1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649143488;
	bh=YPeun9KYKVwziAewnhA1ERogTvgdg7eS/CsOHqlShqE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ry0z0HUaJhzAAnWHqkwUQJPrwMXoXmgouxCySf3+21/2LO+1KpVC8F7mnGVJwbZFx
	 JQvpeumYA7cSABWT1D5ogPiuskVzyJ2/Xi9JsycbYfCWV75tEzXewjUpVkvWUGgqgz
	 kosvOEdS8QfYfq8Bo5MNJeeY+O+vNwb1kg+3pDNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13BB7F80516;
	Tue,  5 Apr 2022 09:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6097F80516; Tue,  5 Apr 2022 09:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75AD1F804AA
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 09:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75AD1F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="O1th+fbv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Gir5lTU6"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E1DCC320201D;
 Tue,  5 Apr 2022 03:22:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 05 Apr 2022 03:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=/UBTfTolDFHa6K
 GgYrfyc9geZA/qQz6ueOr993YlyMA=; b=O1th+fbvWX6HpP/XYMQeZGbfdfJ/rV
 EF8BOTxnik7lK9kqFkm35tYb+MH6TG/Kg7mzDbNbyIZ4eBJH/A1tJgmJCVBiySeC
 aodgF4UPD9HlRvU5pO7AMD3uUtQjsdbxKci+flPok6SwfdHyyr3Yr8gnUTrlrxVo
 mKpfEN+7MPcKdgwGgDkZkHQW321h2QYvUIrhZ/BctLq3UAjdvp94kHmyOxR51SEx
 bu8LTzSfd0QGd3zCZeNUBz6eWC8K1y8I587ApXJQEXXPwC8B5IkBt6yyH4dwNQfF
 +cDUXlYB3+vomqLplU2PaXcudBcm1zIwqDKAE+gPqOEivk8OoMKWwtTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/UBTfT
 olDFHa6KGgYrfyc9geZA/qQz6ueOr993YlyMA=; b=Gir5lTU6aumXyuJcPiAgsu
 ofWxjfL76B3+y4DEPEM5Q3T3DK8+Cfx3nJkiwpE4o3RbBRuc6zeoLQRVFd+Mj/Hb
 phqZ3GYU+8WLZhjOkZ4EOQZDchw+AKi0pRhUw7MngihXb1KIgo9XvxEGpE/dn2+w
 /ri4zO1Lt0dZ53NhMiHP++SW9nG8tvD0bbh0b20H6HYBeGUhh5TdUqCAN1R588qP
 +7x/JtR0iE7O96JM6EwenFqOQGarauTTki5pPMZPhsezSqwQDFmLsHpFOVqmOHLk
 5o/5Mms2N7AxqrkcAsz2kFxQjc3pPuuCixqab7brcHveHy6IzlIbnlnM+LrMXJ7Q
 ==
X-ME-Sender: <xms:Pe5LYhTo3eMJhmQxqUPXFOU2R0bRFyHdrW57UKThl9dF1U_p9s3Pbw>
 <xme:Pe5LYqzkY_ZCdf3hJszbMcMDakEV3S2ragiSWZRm0S0A5R6MwPXtO1z3PivoxYNTm
 GNY3VgiXpWBwAoMors>
X-ME-Received: <xmr:Pe5LYm0965XF2KRuio-oOLlzI61-uFSMeAwAkrrKV07MCd06u45-hX53ltdAJpJnjA7EgcjcomfmXi9kyefLxEBCqBLNXGt62vB8wuzZDRxz4AcTwrY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejfedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:Pe5LYpCBuJkpO3hc1HjJfDAk93S77KoTx2rneP0rUoWj3EnDRFxdtA>
 <xmx:Pe5LYqhO-sQ7fSNHWWdDMhpHlJv-8kRhSJSbpQAKQ6sqXfJ9484djg>
 <xmx:Pe5LYtoJBXWIzPza_USVyF9oUI96GUwLDhWjZyELI1jTMkV_OtNs6g>
 <xmx:Pe5LYuYuaK5w0B-mBKo-euLBNi5gpwmnPAwx7Q3uy-PR5CNMYIeWKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 03:22:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 2/3] firewire: add kernel API to access CYCLE_TIME register
Date: Tue,  5 Apr 2022 16:22:20 +0900
Message-Id: <20220405072221.226217-3-o-takashi@sakamocchi.jp>
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

1394 OHCI specification defined Isochronous Cycle Timer Register to get
value of CYCLE_TIME register defined by IEEE 1394 for CSR architecture
defined by ISO/IEC 13213. Unit driver can calculate packet time by
compute with the value of CYCLE_TIME and timeStamp field in descriptor
of each isochronous and asynchronous context. The resolution of CYCLE_TIME
is 49.576 MHz, while the one of timeStamp is 8,000 Hz.

Current implementation of Linux FireWire subsystem allows the driver to
get the value of CYCLE_TIMER CSR register by transaction service. The
transaction service has overhead in regard of access to MMIO register.

This commit adds kernel API for unit driver to access the register
directly.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 28 ++++++++++++++++++++++++++++
 drivers/firewire/core-cdev.c |  6 ++++--
 include/linux/firewire.h     |  2 ++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index d994da6cf465..cd09de61bc4f 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -702,3 +702,31 @@ void fw_core_remove_card(struct fw_card *card)
 	WARN_ON(!list_empty(&card->transaction_list));
 }
 EXPORT_SYMBOL(fw_core_remove_card);
+
+/**
+ * fw_card_read_cycle_time: read from Isochronous Cycle Timer Register of 1394 OHCI in MMIO region
+ *			    for controller card.
+ * @card: The instance of card for 1394 OHCI controller.
+ * @cycle_time: The mutual reference to value of cycle time for the read operation.
+ *
+ * Read value from Isochronous Cycle Timer Register of 1394 OHCI in MMIO region for the given
+ * controller card. This function accesses the region without any lock primitives or IRQ mask.
+ * When returning successfully, the content of @value argument has value aligned to host endianness,
+ * formetted by CYCLE_TIME CSR Register of IEEE 1394 std.
+ *
+ * Context: Any context.
+ * Return:
+ * * 0 - Read successfully.
+ * * -ENODEV - The controller is unavailable due to being removed or unbound.
+ */
+int fw_card_read_cycle_time(struct fw_card *card, u32 *cycle_time)
+{
+	if (card->driver->read_csr == dummy_read_csr)
+		return -ENODEV;
+
+	// It's possible to switch to dummy driver between the above and the below. This is the best
+	// effort to return -ENODEV.
+	*cycle_time = card->driver->read_csr(card, CSR_CYCLE_TIME);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fw_card_read_cycle_time);
diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 9f89c17730b1..8e9670036e5c 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1216,7 +1216,9 @@ static int ioctl_get_cycle_timer2(struct client *client, union ioctl_arg *arg)
 
 	local_irq_disable();
 
-	cycle_time = card->driver->read_csr(card, CSR_CYCLE_TIME);
+	ret = fw_card_read_cycle_time(card, &cycle_time);
+	if (ret < 0)
+		goto end;
 
 	switch (a->clk_id) {
 	case CLOCK_REALTIME:      ktime_get_real_ts64(&ts);	break;
@@ -1225,7 +1227,7 @@ static int ioctl_get_cycle_timer2(struct client *client, union ioctl_arg *arg)
 	default:
 		ret = -EINVAL;
 	}
-
+end:
 	local_irq_enable();
 
 	a->tv_sec      = ts.tv_sec;
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 07967a450eaa..2f467c52bdec 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -150,6 +150,8 @@ static inline void fw_card_put(struct fw_card *card)
 	kref_put(&card->kref, fw_card_release);
 }
 
+int fw_card_read_cycle_time(struct fw_card *card, u32 *cycle_time);
+
 struct fw_attribute_group {
 	struct attribute_group *groups[2];
 	struct attribute_group group;
-- 
2.34.1

