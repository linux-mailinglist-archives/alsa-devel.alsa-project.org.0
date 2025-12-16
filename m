Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B41CC146F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Dec 2025 08:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D4E60223;
	Tue, 16 Dec 2025 08:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D4E60223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765869598;
	bh=+nOCJtKm6LqEC57WeGgYv6jRNGhDOLF+UTQE1MdkbQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JR8oBp8l1WFgVrD4On5wrC7pWwf4PyAkYuGMPfng4sh9CVgleIEBdGXxLlRzV/8T0
	 6+1HsfB2B7qI70UGFrVrAnY32JqU9+fML/5TU7CygKUIWti9/GRxhMZrCYfcm83wSe
	 Xn32FUNd5rM0ffvofi5cduQtQJvov/K/MbxaESyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFBCEF805D8; Tue, 16 Dec 2025 08:19:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19AC7F805D9;
	Tue, 16 Dec 2025 08:19:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07466F80571; Tue, 16 Dec 2025 08:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EFA1F8016E
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 08:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFA1F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=g2jkpNeN
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BG7HLn243480195,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765869441; bh=fjuHIIyTDdtwtVvJNBPuw1E2RWlC5vK7HA/qU8tD4S4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=g2jkpNeNJ5Wy8hiEPkavsJ8YzxPONb7aXNOpVRWdgGaPaWoIhnTvd+G1qdcCYFGc8
	 dyPGpt5fSy+tgwjdXBV/M7WvqUD586W1N36ImpHiF7vSOVP3/ykg5xcdhRCLY/Rv3f
	 77aoNm9bkdUfwJGNXQ7Ep1xlckG2LtIvIMJR3ua+MPOJQAhPzNFf2E5qwgewBW2EId
	 gU1LAcpDROBr+cIMC5yIdmrddYrLifEs1wtkuuTE+IwgcI56P4Kwqa4J86qd/S/bvY
	 KyZvFbIG0d7g+co1bR9uCRlFWfpGlEm1l/PpcZw9bPR8zJXfYXJUtYuQaBJR7zlnti
	 ew/l0JHWK1V5g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BG7HLn243480195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:17:21 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 16 Dec 2025 15:17:22 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 16 Dec 2025 15:17:21 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 16 Dec 2025 15:17:21 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-spi@vger.kernel.org>, <perex@perex.cz>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <flove@realtek.com>,
        <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou
	<oder_chiou@realtek.com>
Subject: [PATCH v10 1/3] spi: export of_find_spi_controller_by_node()
Date: Tue, 16 Dec 2025 15:18:51 +0800
Message-ID: <20251216071853.3929135-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216071853.3929135-1-oder_chiou@realtek.com>
References: <20251216071853.3929135-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: T7YSG3TXHNV6MR4WSPOPD7HZ6SPZLH3Q
X-Message-ID-Hash: T7YSG3TXHNV6MR4WSPOPD7HZ6SPZLH3Q
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7YSG3TXHNV6MR4WSPOPD7HZ6SPZLH3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices are primarily described on another bus (e.g. I2C) but also
have an additional SPI connection that serves as a transport for
firmware loading. Export of_find_spi_controller_by_node() so drivers can
obtain the SPI controller referenced by a DT phandle.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 drivers/spi/spi.c       |  3 ++-
 include/linux/spi/spi.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index e25df9990f82..ecb5281b04a2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4771,7 +4771,7 @@ static struct spi_device *of_find_spi_device_by_node(struct device_node *node)
 }
 
 /* The spi controllers are not using spi_bus, so we find it with another way */
-static struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
+struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
 {
 	struct device *dev;
 
@@ -4784,6 +4784,7 @@ static struct spi_controller *of_find_spi_controller_by_node(struct device_node
 	/* Reference got in class_find_device */
 	return container_of(dev, struct spi_controller, dev);
 }
+EXPORT_SYMBOL_GPL(of_find_spi_controller_by_node);
 
 static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			 void *arg)
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index cb2c2df31089..1eb04a96cc1c 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -882,6 +882,17 @@ extern int devm_spi_register_controller(struct device *dev,
 					struct spi_controller *ctlr);
 extern void spi_unregister_controller(struct spi_controller *ctlr);
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+extern struct spi_controller *of_find_spi_controller_by_node(
+	struct device_node *node);
+#else
+static inline struct spi_controller *of_find_spi_controller_by_node(
+	struct device_node *node)
+{
+	return NULL;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SPI_MASTER)
 extern struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
 extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
-- 
2.52.0

