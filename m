Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62F2496BD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 09:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF99A1870;
	Wed, 19 Aug 2020 09:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF99A1870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597821065;
	bh=1XpSXAtyU3b73S6aqNJyNka6/KyVIPdhkEBz2y87vPU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jto69FGXXZVAvpxOKcfVk1Uvc3UAgfCi4dEhfcjCJrpj61jj5U1XAg0QEN0kfmfGu
	 vEidVYPd/wSMtFf8IqSEAV8Kv1j6dBRwqUt4YG2e47HNVitSscOD9gGlgg+nWfJ055
	 i08pG3rqU6CdUrA4hFYOU+R2endNt8O8wqCuJVMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B924EF80114;
	Wed, 19 Aug 2020 08:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEAE1F803A6; Wed, 19 Aug 2020 08:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB71F8036A
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB71F8036A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="QGiD82cB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AqKsIDRs27kIZ3qz8X8DimzxTNWdhtouY4ELawYdd20=; b=QGiD82cBnkvzgZSiKZTzQz9zIn
 xSBHf+C7K68+XJdLDlRisPbeW7e/fs+g/zRU1QnPbRWodLy3lfP1/FLluqbSZbe/9dI/YejsrQu6O
 nrPFR9LurAMCJrtwP62XqUXFsqR6jT+FopBHoW0oLC8p4iub1fJG2lGUohv6RtUIDi4kHQtkyFWgn
 Fh+mS5lGRe0XMgmxya6J8eZvNzE4F+1U0c1toIwpqy6DIiYV/7fbtNlnAqtXdbWk1l9XJf5DFSNZQ
 4qTZJRGTE0WcYGyD5RCcOfuIlgu6DeTh7eddCBGZ6BJoWyvTq/w13wG1XH1W71TFY67uTO9ZBBUOl
 No4Eu8YQ==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1Z-0008TG-Ct; Wed, 19 Aug 2020 06:56:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 20/28] sgiwd93: convert from dma_cache_sync to
 dma_sync_single_for_device
Date: Wed, 19 Aug 2020 08:55:47 +0200
Message-Id: <20200819065555.1802761-21-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Use the proper modern API to transfer cache ownership for incoherent DMA.
This also means we can allocate the memory as DMA_TO_DEVICE instead
of bidirectional.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sgiwd93.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/sgiwd93.c b/drivers/scsi/sgiwd93.c
index 133adcf99e9340..1538f65307f22f 100644
--- a/drivers/scsi/sgiwd93.c
+++ b/drivers/scsi/sgiwd93.c
@@ -95,7 +95,7 @@ void fill_hpc_entries(struct ip22_hostdata *hd, struct scsi_cmnd *cmd, int din)
 	 */
 	hcp->desc.pbuf = 0;
 	hcp->desc.cntinfo = HPCDMA_EOX;
-	dma_cache_sync(hd->dev, hd->cpu,
+	dma_sync_single_for_device(hd->dev, hd->dma,
 		       (unsigned long)(hcp + 1) - (unsigned long)hd->cpu,
 		       DMA_TO_DEVICE);
 }
@@ -235,7 +235,7 @@ static int sgiwd93_probe(struct platform_device *pdev)
 	hdata = host_to_hostdata(host);
 	hdata->dev = &pdev->dev;
 	hdata->cpu = dma_alloc_pages(&pdev->dev, HPC_DMA_SIZE, &hdata->dma,
-				     DMA_BIDIRECTIONAL, GFP_KERNEL);
+				     DMA_TO_DEVICE, GFP_KERNEL);
 	if (!hdata->cpu) {
 		printk(KERN_WARNING "sgiwd93: Could not allocate memory for "
 		       "host %d buffer.\n", unit);
@@ -275,7 +275,7 @@ static int sgiwd93_probe(struct platform_device *pdev)
 	free_irq(irq, host);
 out_free:
 	dma_free_pages(&pdev->dev, HPC_DMA_SIZE, hdata->cpu, hdata->dma,
-			DMA_BIDIRECTIONAL);
+			DMA_TO_DEVICE);
 out_put:
 	scsi_host_put(host);
 out:
@@ -292,7 +292,7 @@ static int sgiwd93_remove(struct platform_device *pdev)
 	scsi_remove_host(host);
 	free_irq(pd->irq, host);
 	dma_free_pages(&pdev->dev, HPC_DMA_SIZE, hdata->cpu, hdata->dma,
-			DMA_BIDIRECTIONAL);
+			DMA_TO_DEVICE);
 	scsi_host_put(host);
 	return 0;
 }
-- 
2.28.0

