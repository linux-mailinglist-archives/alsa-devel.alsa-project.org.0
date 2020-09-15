Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235AC269E99
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 08:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D8F1685;
	Tue, 15 Sep 2020 08:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D8F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600151659;
	bh=46fhVoryx0Fgx+lfQ60MTdXz65b88EQ3ZDoHznu3BWc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UFMbOTTEd+hktqEmAw+e43+CUUkXOHEMQD1e945AUN4PkPZhm9JA+8Msn2k9N0QHF
	 T0IjrIxz9FhB/38FvavaoenLeI+NNWEoZc3OYWs/izGgA2y91UrvfZO3BAXsIomAQZ
	 Mg6Sj6s5u4HwYAix8/bAY+wfYo7bHnehY3rt0/GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD581F8025E;
	Tue, 15 Sep 2020 08:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39652F80212; Tue, 15 Sep 2020 08:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FAKE_REPLY_C,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF116F80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 08:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF116F80146
Received: by verein.lst.de (Postfix, from userid 2407)
 id 10D806736F; Tue, 15 Sep 2020 08:32:25 +0200 (CEST)
Date: Tue, 15 Sep 2020 08:32:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 11/17] sgiseeq: convert to dma_alloc_noncoherent
Message-ID: <20200915063224.GB19113@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914151358.GQ6583@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
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

On Mon, Sep 14, 2020 at 04:13:58PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 04:44:27PM +0200, Christoph Hellwig wrote:
> >  drivers/net/ethernet/i825xx/lasi_82596.c |  25 ++---
> >  drivers/net/ethernet/i825xx/lib82596.c   | 114 ++++++++++++++---------
> >  drivers/net/ethernet/i825xx/sni_82596.c  |   4 -
> >  drivers/net/ethernet/seeq/sgiseeq.c      |  28 ++++--
> >  drivers/scsi/53c700.c                    |   9 +-
> >  5 files changed, 103 insertions(+), 77 deletions(-)
> 
> I think your patch slicing-and-dicing went wrong here ;-(

Pretty much..  Fixed up for the next version.
