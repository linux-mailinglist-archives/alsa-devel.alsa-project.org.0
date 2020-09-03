Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037425BDB9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 10:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD847168B;
	Thu,  3 Sep 2020 10:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD847168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599122910;
	bh=03EnqcyQFypnHdghhtGo93qPIb2kvhxNe6h166rB1KQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOPLVOHrdFH1ZnqCxbf/v4UgvyxZUV2ytnu8slnpfY0tT41Vhk9zbqgoTE3R5fYe8
	 G8820UiZO9jLNOGC8LYxhUISU6jt7mNZaEfgoMKbwILm9sRW1vx6RKPdQxQtbUzOKZ
	 fK6QAtA/7646EXg2nroC0pSMP2LpemBDe6z+29nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3444F801DA;
	Thu,  3 Sep 2020 10:46:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C501DF80217; Thu,  3 Sep 2020 10:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52D00F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 10:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D00F801DA
Received: by verein.lst.de (Postfix, from userid 2407)
 id F0C1868CEE; Thu,  3 Sep 2020 10:46:43 +0200 (CEST)
Date: Thu, 3 Sep 2020 10:46:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 22/28] sgiseeq: convert from dma_cache_sync to
 dma_sync_single_for_device
Message-ID: <20200903084643.GA25111@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-23-hch@lst.de>
 <20200901152209.GA14288@alpha.franken.de>
 <20200901171241.GA20685@alpha.franken.de> <20200901171627.GA8255@lst.de>
 <20200901173810.GA25282@alpha.franken.de> <20200903084302.GB24410@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903084302.GB24410@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
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

On Thu, Sep 03, 2020 at 10:43:02AM +0200, Christoph Hellwig wrote:
> On Tue, Sep 01, 2020 at 07:38:10PM +0200, Thomas Bogendoerfer wrote:
> > this is the problem:
> > 
> >        /* Always check for received packets. */
> >         sgiseeq_rx(dev, sp, hregs, sregs);
> > 
> > so the driver will look at the rx descriptor on every interrupt, so
> > we cache the rx descriptor on the first interrupt and if there was
> > $no rx packet, we will only see it, if cache line gets flushed for
> > some other reason.
> 
> That means a transfer back to device ownership is missing after a
> (negative) check.

E.g. something like this for the particular problem, although there
might be other hiding elsewhere:

diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
index 8507ff2420143a..a1c7be8a0d1e5d 100644
--- a/drivers/net/ethernet/seeq/sgiseeq.c
+++ b/drivers/net/ethernet/seeq/sgiseeq.c
@@ -403,6 +403,8 @@ static inline void sgiseeq_rx(struct net_device *dev, struct sgiseeq_private *sp
 		rd = &sp->rx_desc[sp->rx_new];
 		dma_sync_desc_cpu(dev, rd);
 	}
+	dma_sync_desc_dev(dev, rd);
+
 	dma_sync_desc_cpu(dev, &sp->rx_desc[orig_end]);
 	sp->rx_desc[orig_end].rdma.cntinfo &= ~(HPCDMA_EOR);
 	dma_sync_desc_dev(dev, &sp->rx_desc[orig_end]);
