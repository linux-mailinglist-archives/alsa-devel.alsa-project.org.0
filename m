Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2211AC836
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:05:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B05401614;
	Thu, 16 Apr 2020 17:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B05401614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587049517;
	bh=W3MDbguHxFKTucheb99O5iDtt2Kw+Bdl4RnQxlowyb4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FoG7GYGS3NTp9ieUY89cKbNhK2QVRFx3LGZeLHYVQsGguJPx3qVXqlBHduU/2oiMU
	 yf4exX8Hb1xABS40n1uznJXwrI0gzPRsNpu++OWnPQK5EOxQK9mPcFSd13G+lujBUH
	 4qsRjfrFdii1u8FPJOXF8sy+GAtp+FRDOXhFMPNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A3FF802C2;
	Thu, 16 Apr 2020 17:00:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2494EF8028C; Thu, 16 Apr 2020 17:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF593F8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF593F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="JFl0zZWw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Faditfx/FJbi4tKcW240iX0ey7G6EjY+VLjH16rVRCA=; b=JFl0zZWwSvM3g+lWExkdidXOqn
 DF5Vajh9bT/64ZrzbSg9+q8Tp1WxoeArprkoyWg8i6AaLujYY6cmb2xatC8YgIJX+AEgyh6oULWlN
 7c2wkQ9JJ5usw/+WZEhKopcclNDKuq4Y6g3VLuwCezCurduPwcZdVxBG5w+5q3oeqbK9GUMKrizgO
 dbZt35/GLOQ+dXPwS0vK2+M4A4d8fIxF/H0nuwZVczj6YjKnKDyfuwo2lrjfwMq/XvujU5nA1ANsM
 fT5u37ZGmV507XUmJhgfLSAD+dK62rVhASVwmdxeYj0nCoJI+kvkHhQJuRp4rwyteYqQgEt8hnzbS
 o2YI/TIA==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP605-00029F-6L; Thu, 16 Apr 2020 15:00:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 3/7] MIPS: cleanup fixup_bigphys_addr handling
Date: Thu, 16 Apr 2020 17:00:07 +0200
Message-Id: <20200416150011.820984-4-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416150011.820984-1-hch@lst.de>
References: <20200416150011.820984-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mips@vger.kernel.org
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

fixup_bigphys_addr is only provided by the alchemy platform.  Remove
all the stubs, and ensure we only call it if it is actually implemented.

Also don't bother implementing io_remap_pfn_range if we don't have to,
and move the remaining implementation to alchemy platform code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig                            |  4 +++
 arch/mips/alchemy/common/setup.c             | 16 ++++++---
 arch/mips/include/asm/mach-au1x00/ioremap.h  | 38 --------------------
 arch/mips/include/asm/mach-bcm63xx/ioremap.h |  5 ---
 arch/mips/include/asm/mach-bmips/ioremap.h   |  5 ---
 arch/mips/include/asm/mach-generic/ioremap.h |  9 -----
 arch/mips/include/asm/mach-tx39xx/ioremap.h  |  9 -----
 arch/mips/include/asm/mach-tx49xx/ioremap.h  |  9 -----
 arch/mips/include/asm/pgtable.h              | 23 ++++++------
 arch/mips/pci/pci-alchemy.c                  |  2 +-
 10 files changed, 27 insertions(+), 93 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-au1x00/ioremap.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b3701a..a7b580d14345 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -92,6 +92,9 @@ config MIPS
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
 
+config MIPS_FIXUP_BIGPHYS_ADDR
+	bool
+
 menu "Machine selection"
 
 choice
@@ -157,6 +160,7 @@ config MIPS_ALCHEMY
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
 	select DMA_MAYBE_COHERENT	# Au1000,1500,1100 aren't, rest is
+	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_APM_EMULATION
diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index 7faaa6d593a7..a8cbc552bd64 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -72,9 +72,9 @@ void __init plat_mem_setup(void)
 	iomem_resource.end = IOMEM_RESOURCE_END;
 }
 
-#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_PCI)
+#ifdef CONFIG_MIPS_FIXUP_BIGPHYS_ADDR
 /* This routine should be valid for all Au1x based boards */
-phys_addr_t __fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
+phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
 {
 	unsigned long start = ALCHEMY_PCI_MEMWIN_START;
 	unsigned long end = ALCHEMY_PCI_MEMWIN_END;
@@ -90,5 +90,13 @@ phys_addr_t __fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
 	/* default nop */
 	return phys_addr;
 }
-EXPORT_SYMBOL(__fixup_bigphys_addr);
-#endif
+
+int io_remap_pfn_range(struct vm_area_struct *vma, unsigned long vaddr,
+		unsigned long pfn, unsigned long size, pgprot_t prot)
+{
+	phys_addr_t phys_addr = fixup_bigphys_addr(pfn << PAGE_SHIFT, size);
+
+	return remap_pfn_range(vma, vaddr, phys_addr >> PAGE_SHIFT, size, prot);
+}
+EXPORT_SYMBOL(io_remap_pfn_range);
+#endif /* CONFIG_MIPS_FIXUP_BIGPHYS_ADDR */
diff --git a/arch/mips/include/asm/mach-au1x00/ioremap.h b/arch/mips/include/asm/mach-au1x00/ioremap.h
deleted file mode 100644
index f6877ed8b8d0..000000000000
--- a/arch/mips/include/asm/mach-au1x00/ioremap.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *	include/asm-mips/mach-au1x00/ioremap.h
- */
-#ifndef __ASM_MACH_AU1X00_IOREMAP_H
-#define __ASM_MACH_AU1X00_IOREMAP_H
-
-#include <linux/types.h>
-
-#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_PCI)
-extern phys_addr_t __fixup_bigphys_addr(phys_addr_t, phys_addr_t);
-#else
-static inline phys_addr_t __fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-#endif
-
-/*
- * Allow physical addresses to be fixed up to help 36-bit peripherals.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return __fixup_bigphys_addr(phys_addr, size);
-}
-
-static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
-	unsigned long flags)
-{
-	return NULL;
-}
-
-static inline int plat_iounmap(const volatile void __iomem *addr)
-{
-	return 0;
-}
-
-#endif /* __ASM_MACH_AU1X00_IOREMAP_H */
diff --git a/arch/mips/include/asm/mach-bcm63xx/ioremap.h b/arch/mips/include/asm/mach-bcm63xx/ioremap.h
index 8cd261ec0a75..73f31825bbf3 100644
--- a/arch/mips/include/asm/mach-bcm63xx/ioremap.h
+++ b/arch/mips/include/asm/mach-bcm63xx/ioremap.h
@@ -4,11 +4,6 @@
 
 #include <bcm63xx_cpu.h>
 
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline int is_bcm63xx_internal_registers(phys_addr_t offset)
 {
 	switch (bcm63xx_get_cpu_id()) {
diff --git a/arch/mips/include/asm/mach-bmips/ioremap.h b/arch/mips/include/asm/mach-bmips/ioremap.h
index 52632ebc705f..63b4af9916b6 100644
--- a/arch/mips/include/asm/mach-bmips/ioremap.h
+++ b/arch/mips/include/asm/mach-bmips/ioremap.h
@@ -4,11 +4,6 @@
 
 #include <linux/types.h>
 
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline int is_bmips_internal_registers(phys_addr_t offset)
 {
 	if (offset >= 0xfff80000)
diff --git a/arch/mips/include/asm/mach-generic/ioremap.h b/arch/mips/include/asm/mach-generic/ioremap.h
index 4e36ea25ed33..f2442b84545c 100644
--- a/arch/mips/include/asm/mach-generic/ioremap.h
+++ b/arch/mips/include/asm/mach-generic/ioremap.h
@@ -7,15 +7,6 @@
 
 #include <linux/types.h>
 
-/*
- * Allow physical addresses to be fixed up to help peripherals located
- * outside the low 32-bit range -- generic pass-through version.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
 	unsigned long flags)
 {
diff --git a/arch/mips/include/asm/mach-tx39xx/ioremap.h b/arch/mips/include/asm/mach-tx39xx/ioremap.h
index 077b3c9971f7..157a7292397e 100644
--- a/arch/mips/include/asm/mach-tx39xx/ioremap.h
+++ b/arch/mips/include/asm/mach-tx39xx/ioremap.h
@@ -7,15 +7,6 @@
 
 #include <linux/types.h>
 
-/*
- * Allow physical addresses to be fixed up to help peripherals located
- * outside the low 32-bit range -- generic pass-through version.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
 	unsigned long flags)
 {
diff --git a/arch/mips/include/asm/mach-tx49xx/ioremap.h b/arch/mips/include/asm/mach-tx49xx/ioremap.h
index c6b9e05f44c4..b1f3710acf8e 100644
--- a/arch/mips/include/asm/mach-tx49xx/ioremap.h
+++ b/arch/mips/include/asm/mach-tx49xx/ioremap.h
@@ -7,15 +7,6 @@
 
 #include <linux/types.h>
 
-/*
- * Allow physical addresses to be fixed up to help peripherals located
- * outside the low 32-bit range -- generic pass-through version.
- */
-static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
-{
-	return phys_addr;
-}
-
 static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
 	unsigned long flags)
 {
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index f1801e7a4b15..aab0ec174f68 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -507,20 +507,17 @@ static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 
 #define kern_addr_valid(addr)	(1)
 
-#ifdef CONFIG_PHYS_ADDR_T_64BIT
-extern int remap_pfn_range(struct vm_area_struct *vma, unsigned long from, unsigned long pfn, unsigned long size, pgprot_t prot);
-
-static inline int io_remap_pfn_range(struct vm_area_struct *vma,
-		unsigned long vaddr,
-		unsigned long pfn,
-		unsigned long size,
-		pgprot_t prot)
-{
-	phys_addr_t phys_addr_high = fixup_bigphys_addr(pfn << PAGE_SHIFT, size);
-	return remap_pfn_range(vma, vaddr, phys_addr_high >> PAGE_SHIFT, size, prot);
-}
+/*
+ * Allow physical addresses to be fixed up to help 36-bit peripherals.
+ */
+#ifdef CONFIG_MIPS_FIXUP_BIGPHYS_ADDR
+phys_addr_t fixup_bigphys_addr(phys_addr_t addr, phys_addr_t size);
+int io_remap_pfn_range(struct vm_area_struct *vma, unsigned long vaddr,
+		unsigned long pfn, unsigned long size, pgprot_t prot);
 #define io_remap_pfn_range io_remap_pfn_range
-#endif
+#else
+#define fixup_bigphys_addr(addr, size)	(addr)
+#endif /* CONFIG_MIPS_FIXUP_BIGPHYS_ADDR */
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 01a2af8215c8..7285b5667568 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -52,7 +52,7 @@ struct alchemy_pci_context {
 static struct alchemy_pci_context *__alchemy_pci_ctx;
 
 
-/* IO/MEM resources for PCI. Keep the memres in sync with __fixup_bigphys_addr
+/* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
 static struct resource alchemy_pci_def_memres = {
-- 
2.25.1

