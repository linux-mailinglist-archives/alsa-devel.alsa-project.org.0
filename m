Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094AA78A05F
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0FB684C;
	Sun, 27 Aug 2023 19:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0FB684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155960;
	bh=kcMoPKKA0hpz1j8gRuUZPSJYu4NC4HZpSKCnxe3bntk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qTHqwzQCH91wcfRUTjqEaTiYptTgj8y4073VVjJidj3KJupbFJzk+H2e35/ZtCNuc
	 6OwJVhSTAkFvUkbDI40PWHu8fxZ3KhmenzynN468kkh5Ha+EeA8Hym0JLWnkCdbb07
	 0W+nRpRwYKNBP34j4y0seZDm/Y9JNNrsPN81FfvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B42F805F0; Sun, 27 Aug 2023 19:02:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FA8F805F0;
	Sun, 27 Aug 2023 19:02:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0623DF800F5; Fri, 25 Aug 2023 08:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-35.mta1.migadu.com (out-35.mta1.migadu.com
 [IPv6:2001:41d0:203:375::23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4058F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 08:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4058F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=gGlORSRX
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692944848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHmggkPoB6PVkfuQyqjiEi6pSxLj7NQb/O/moIUqI3Q=;
	b=gGlORSRXYl4gFoXXTmBWXlDv9M59x4zb6DH/yv9Me/t4nLyEdmV9ka2HJBT95q/hEQ5/qp
	o3h5Y41uekJhozAijzpufcmcPJKQeg9tw+djHsg1V7nZ/b88TT009/f84nAk9E2roApfBk
	Gc+swNB9ZjDJuDdVymWrbVncDrt8mN0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH 1/5] PCI: Add the pci_get_base_class() helper
Date: Fri, 25 Aug 2023 14:27:10 +0800
Message-Id: <20230825062714.6325-2-sui.jingfeng@linux.dev>
In-Reply-To: <20230825062714.6325-1-sui.jingfeng@linux.dev>
References: <20230825062714.6325-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: sui.jingfeng@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QDP7VMSBCQDPJJ2FRB7VLAYUS77LBYY5
X-Message-ID-Hash: QDP7VMSBCQDPJJ2FRB7VLAYUS77LBYY5
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:02:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDP7VMSBCQDPJJ2FRB7VLAYUS77LBYY5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

There is no function that can be used to get all PCI(e) devices in a
system by matching against its the PCI base class code only, while keep
the sub-class code and the programming interface ignored. Therefore, add
the pci_get_base_class() function to suit the need.

For example, if an application want to process all PCI(e) display devices
in a system, it can achieve such goal by writing the code as following:

pdev = NULL;
do {
    pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev);
    if (!pdev)
        break;

    do_something_for_pci_display_device(pdev);
} while (1);

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/search.c | 31 +++++++++++++++++++++++++++++++
 include/linux/pci.h  |  5 +++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index b4c138a6ec02..53840634fbfc 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -363,6 +363,37 @@ struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from)
 }
 EXPORT_SYMBOL(pci_get_class);
 
+/**
+ * pci_get_base_class - searching for a PCI device by matching against the base class code only
+ * @class: search for a PCI device with this base class code
+ * @from: Previous PCI device found in search, or %NULL for new search.
+ *
+ * Iterates through the list of known PCI devices. If a PCI device is found
+ * with a matching base class code, the reference count to the device is
+ * incremented. See pci_match_one_device() to figure out how does this works.
+ * A new search is initiated by passing %NULL as the @from argument.
+ * Otherwise if @from is not %NULL, searches continue from next device on the
+ * global list. The reference count for @from is always decremented if it is
+ * not %NULL.
+ *
+ * Returns:
+ * A pointer to a matched PCI device, %NULL Otherwise.
+ */
+struct pci_dev *pci_get_base_class(unsigned int class, struct pci_dev *from)
+{
+	struct pci_device_id id = {
+		.vendor = PCI_ANY_ID,
+		.device = PCI_ANY_ID,
+		.subvendor = PCI_ANY_ID,
+		.subdevice = PCI_ANY_ID,
+		.class_mask = 0xFF0000,
+		.class = class << 16,
+	};
+
+	return pci_get_dev_by_id(&id, from);
+}
+EXPORT_SYMBOL(pci_get_base_class);
+
 /**
  * pci_dev_present - Returns 1 if device matching the device list is present, 0 if not.
  * @ids: A pointer to a null terminated list of struct pci_device_id structures
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 71c85380676c..486ad959e1f9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1180,6 +1180,8 @@ struct pci_dev *pci_get_slot(struct pci_bus *bus, unsigned int devfn);
 struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int bus,
 					    unsigned int devfn);
 struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
+struct pci_dev *pci_get_base_class(unsigned int class, struct pci_dev *from);
+
 int pci_dev_present(const struct pci_device_id *ids);
 
 int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
@@ -1896,6 +1898,9 @@ static inline struct pci_dev *pci_get_class(unsigned int class,
 					    struct pci_dev *from)
 { return NULL; }
 
+static inline struct pci_dev *pci_get_base_class(unsigned int class,
+						 struct pci_dev *from)
+{ return NULL; }
 
 static inline int pci_dev_present(const struct pci_device_id *ids)
 { return 0; }
-- 
2.34.1

