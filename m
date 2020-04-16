Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C31AC813
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:03:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE23167E;
	Thu, 16 Apr 2020 17:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE23167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587049438;
	bh=dfHMYhYqsRP95Y1TG/jP7tbx8Mw+N3w5BIGoEd8Wl78=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vq+c2qzi7/1HA7s8dWXm01Qld37Suhc7zLkuktmTTv3aw20LRTEX1+Y1gBmUMQs/T
	 g8wxW9cu3eM4qUt1+LGkypfDHYpioGE3b2dDu37tq0gLiHCFVwwEq1m71XSSaXalYo
	 T96uQRF9VmXsTn9edWYPeUJ2OcxSoxe/d8p0yTns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AA3F8028D;
	Thu, 16 Apr 2020 17:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BEBBF8028C; Thu, 16 Apr 2020 17:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D458FF8016F
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D458FF8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="EXaA9+eR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hWBzE7+Ma89SOv/SxY3UdWgMQO5IxVxE22FLaZEKh/I=; b=EXaA9+eRyWt82XO6H/fAi+TXM7
 42GfDdJphJS7tU+jTcFL2GWdylSdSzJNVlQOFBzWTri9AdHisjnCTLyGv8sPrER4Fh2PhRiTYgLf+
 jvLEaYgI2usLE7uqmRvbEfULml/efY8Tg9cEhY4Jg6RMsgOyL9fHllVp0fIlodEGVE5ZJXSVd3TI7
 sR5vVyp2ebc0U6u/RnE67gHxwyAolyXCjAIVgZeIsDjyXd6gAbE1AjalmwibKg3REJ/6hfdQ8QDzS
 X4bNHYUCqTXL5DveNGOBgP63pCwf2TY2vDZfFOj9yoz740te8DNyOcwunKhAydsu2/79wvaCEJkBC
 0sg5eYnQ==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP607-0002HD-MT; Thu, 16 Apr 2020 15:00:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 4/7] MIPS: merge __ioremap_mode into ioremap_prot
Date: Thu, 16 Apr 2020 17:00:08 +0200
Message-Id: <20200416150011.820984-5-hch@lst.de>
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

There is no reason to have two ioremap with flags interfaces.  Merge
the historic mips __ioremap_mode into ioremap_prot which is a generic
kernel interface.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/io.h | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 7be323ed2bfd..60513250f8f8 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -156,9 +156,17 @@ static inline void *isa_bus_to_virt(unsigned long address)
 extern void __iomem * __ioremap(phys_addr_t offset, phys_addr_t size, unsigned long flags);
 extern void __iounmap(const volatile void __iomem *addr);
 
-static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long size,
-	unsigned long flags)
+/*
+ * ioremap_prot     -   map bus memory into CPU space
+ * @offset:    bus address of the memory
+ * @size:      size of the resource to map
+
+ * ioremap_prot gives the caller control over cache coherency attributes (CCA)
+ */
+static inline void __iomem *ioremap_prot(phys_addr_t offset,
+		unsigned long size, unsigned long prot_val)
 {
+	unsigned long flags = prot_val & _CACHE_MASK;
 	void __iomem *addr = plat_ioremap(offset, size, flags);
 
 	if (addr)
@@ -202,18 +210,6 @@ static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long si
 #undef __IS_LOW512
 }
 
-/*
- * ioremap_prot     -   map bus memory into CPU space
- * @offset:    bus address of the memory
- * @size:      size of the resource to map
-
- * ioremap_prot gives the caller control over cache coherency attributes (CCA)
- */
-static inline void __iomem *ioremap_prot(phys_addr_t offset,
-		unsigned long size, unsigned long prot_val) {
-	return __ioremap_mode(offset, size, prot_val & _CACHE_MASK);
-}
-
 /*
  * ioremap     -   map bus memory into CPU space
  * @offset:    bus address of the memory
@@ -226,7 +222,7 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
  * address.
  */
 #define ioremap(offset, size)						\
-	__ioremap_mode((offset), (size), _CACHE_UNCACHED)
+	ioremap_prot((offset), (size), _CACHE_UNCACHED)
 #define ioremap_uc		ioremap
 
 /*
@@ -245,7 +241,7 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
  * memory-like regions on I/O busses.
  */
 #define ioremap_cache(offset, size)					\
-	__ioremap_mode((offset), (size), _page_cachable_default)
+	ioremap_prot((offset), (size), _page_cachable_default)
 
 /*
  * ioremap_wc     -   map bus memory into CPU space
@@ -266,7 +262,7 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset,
  * _CACHE_UNCACHED option (see cpu_probe() method).
  */
 #define ioremap_wc(offset, size)					\
-	__ioremap_mode((offset), (size), boot_cpu_data.writecombine)
+	ioremap_prot((offset), (size), boot_cpu_data.writecombine)
 
 static inline void iounmap(const volatile void __iomem *addr)
 {
-- 
2.25.1

