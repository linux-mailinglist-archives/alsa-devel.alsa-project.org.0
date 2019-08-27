Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50999EA05
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 15:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB4415E4;
	Tue, 27 Aug 2019 15:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB4415E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566913799;
	bh=P2A03OnSlAU9bOFAUSohQD64oNdqLd/NW5voTeRfP8w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NSyXNqeaWDjWwvVisgEhs6MGk5yJDmjLPIm+9o4OdZZjUAlkfy3BR2FfXzDS1kqbC
	 xZ+B4AAhxMR6zmAoelFNRfc3GPnZo05mCF1dTpzc1lzqT70by5DLXTknp3OrJWsesm
	 3s+l2datm6xZS8DrEjxGt2YuFqvi3MPWw6+tlFV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF66F80274;
	Tue, 27 Aug 2019 15:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E20DF802A0; Tue, 27 Aug 2019 15:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD29F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 15:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD29F801ED
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i2bpJ-0005sq-Ns; Tue, 27 Aug 2019 13:48:02 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com,
	tiwai@suse.com
Date: Tue, 27 Aug 2019 21:47:55 +0800
Message-Id: <20190827134756.10807-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] PCI: Add a helper to check Power Resource
	Requirements _PR3 existence
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A driver may want to know the existence of _PR3, to choose different
runtime suspend behavior. A user will be add in next patch.

This is mostly the same as nouveau_pr3_present().

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/pci/pci.c   | 20 ++++++++++++++++++++
 include/linux/pci.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 1b27b5af3d55..776af15b92c2 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5856,6 +5856,26 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
 	return 0;
 }
 
+bool pci_pr3_present(struct pci_dev *pdev)
+{
+	struct pci_dev *parent_pdev = pci_upstream_bridge(pdev);
+	struct acpi_device *parent_adev;
+
+	if (acpi_disabled)
+		return false;
+
+	if (!parent_pdev)
+		return false;
+
+	parent_adev = ACPI_COMPANION(&parent_pdev->dev);
+	if (!parent_adev)
+		return false;
+
+	return parent_adev->power.flags.power_resources &&
+		acpi_has_method(parent_adev->handle, "_PR3");
+}
+EXPORT_SYMBOL_GPL(pci_pr3_present);
+
 /**
  * pci_add_dma_alias - Add a DMA devfn alias for a device
  * @dev: the PCI device for which alias is added
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 82e4cd1b7ac3..9b6f7b67fac9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2348,9 +2348,11 @@ struct irq_domain *pci_host_bridge_acpi_msi_domain(struct pci_bus *bus);
 
 void
 pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct device *));
+bool pci_pr3_present(struct pci_dev *pdev);
 #else
 static inline struct irq_domain *
 pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
+static bool pci_pr3_present(struct pci_dev *pdev) { return false; }
 #endif
 
 #ifdef CONFIG_EEH
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
