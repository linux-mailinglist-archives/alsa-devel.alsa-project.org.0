Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7421AC825
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24843166D;
	Thu, 16 Apr 2020 17:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24843166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587049481;
	bh=ZGMxb+LZpr2yTvukq4QfF0wtSGPQ4N6S/mKVVucnxZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cfKp50ULwiivB+1d+d6xH1fkHq6Ew/d+hX61j3orU6gP531jAIJca1HgVoi14ML1O
	 1z88qKosUMnmOY8qAGbsiCXuvmiOGTZfiw1spRCWtkL+QK+U6BbafFm5xE1myQcsBw
	 QzdduqE/GcdOXp39SR+dPi5QOSWVtDpkwcfxl2Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A5D0F8029B;
	Thu, 16 Apr 2020 17:00:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A10DF8021E; Thu, 16 Apr 2020 17:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 299E3F8021E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 299E3F8021E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Si6uZPZU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=S0lIA/D9gWt+6MqKJrlRkinxSTiEVCtRIMKBgvJLedI=; b=Si6uZPZUbDHGlBY5mkbWjCVGBd
 jglpePYA50qRA1C1wIQF7wBC6rfGW9kABZExjbw05bHrjG8E2uBa7NDTkNvN2h1Vm4KbVYIMBHc7X
 cRED0+2gKFimxeLSvZdsZke6bECcTrw9DyFTn3SjbGX4QSmzDpPy1wv8EpwFoZYEuz3NC1K/qUdyG
 7R69JT0XFJ3VHvkLvnAT0RB41/r9CX18b6SoQHxNug6rZQGp45Ng37dT4Qes3BD0AcfdG+54Bhyfk
 3ZOBpunhAmTl7q9t31HGl3s6R+rf5ZfAi49sGr9/g9qSanaAto8j4JGMP4v8FOystoeEd/oJbpu+s
 i5eQ1zGg==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP60A-0002Nn-Bc; Thu, 16 Apr 2020 15:00:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 5/7] MIPS: split out the 64-bit ioremap implementation
Date: Thu, 16 Apr 2020 17:00:09 +0200
Message-Id: <20200416150011.820984-6-hch@lst.de>
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

Split out the mips64 ioremap implementation entirely, as it will never use
page table based remapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/io.h | 65 ++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 60513250f8f8..f007571e036d 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -153,6 +153,25 @@ static inline void *isa_bus_to_virt(unsigned long address)
  */
 #define page_to_phys(page)	((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
 
+#ifdef CONFIG_64BIT
+static inline void __iomem *ioremap_prot(phys_addr_t offset,
+		unsigned long size, unsigned long prot_val)
+{
+	unsigned long flags = prot_val & _CACHE_MASK;
+	u64 base = (flags == _CACHE_UNCACHED ? IO_BASE : UNCAC_BASE);
+	void __iomem *addr;
+
+	addr = plat_ioremap(offset, size, flags);
+	if (!addr)
+		addr = (void __iomem *)(unsigned long)(base + offset);
+	return addr;
+}
+
+static inline void iounmap(const volatile void __iomem *addr)
+{
+	plat_iounmap(addr);
+}
+#else /* CONFIG_64BIT */
 extern void __iomem * __ioremap(phys_addr_t offset, phys_addr_t size, unsigned long flags);
 extern void __iounmap(const volatile void __iomem *addr);
 
@@ -174,18 +193,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
 
 #define __IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
 
-	if (IS_ENABLED(CONFIG_64BIT)) {
-		u64 base = UNCAC_BASE;
-
-		/*
-		 * R10000 supports a 2 bit uncached attribute therefore
-		 * UNCAC_BASE may not equal IO_BASE.
-		 */
-		if (flags == _CACHE_UNCACHED)
-			base = (u64) IO_BASE;
-		return (void __iomem *) (unsigned long) (base + offset);
-	} else if (__builtin_constant_p(offset) &&
-		   __builtin_constant_p(size) && __builtin_constant_p(flags)) {
+	if (__builtin_constant_p(offset) &&
+	    __builtin_constant_p(size) && __builtin_constant_p(flags)) {
 		phys_addr_t phys_addr, last_addr;
 
 		phys_addr = fixup_bigphys_addr(offset, size);
@@ -210,6 +219,22 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
 #undef __IS_LOW512
 }
 
+static inline void iounmap(const volatile void __iomem *addr)
+{
+	if (plat_iounmap(addr))
+		return;
+
+#define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
+
+	if (__builtin_constant_p(addr) && __IS_KSEG1(addr))
+		return;
+
+	__iounmap(addr);
+
+#undef __IS_KSEG1
+}
+#endif /* !CONFIG_64BIT */
+
 /*
  * ioremap     -   map bus memory into CPU space
  * @offset:    bus address of the memory
@@ -264,22 +289,6 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
 #define ioremap_wc(offset, size)					\
 	ioremap_prot((offset), (size), boot_cpu_data.writecombine)
 
-static inline void iounmap(const volatile void __iomem *addr)
-{
-	if (plat_iounmap(addr))
-		return;
-
-#define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
-
-	if (IS_ENABLED(CONFIG_64BIT) ||
-	    (__builtin_constant_p(addr) && __IS_KSEG1(addr)))
-		return;
-
-	__iounmap(addr);
-
-#undef __IS_KSEG1
-}
-
 #if defined(CONFIG_CPU_CAVIUM_OCTEON) || defined(CONFIG_CPU_LOONGSON64)
 #define war_io_reorder_wmb()		wmb()
 #else
-- 
2.25.1

