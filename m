Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F5259AEC
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 18:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A281807;
	Tue,  1 Sep 2020 18:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A281807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598979345;
	bh=SWb50Scbt242d5vw0MsG8eGPrS5FPdaS2bJXSuU6nfw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgWUe1V+T7JS980M6EvuPPyKR1cxWleBbENJXAyk8FNfKJhDBmZcetTrlphXpgo0E
	 4eu8iuwNyViPPj/0CC4Sv1oL8HUIfMfolEnlxXiMK/VGVHNIG4w9dgLKGAGxbhMNDH
	 +6xVPGInGQWUSJ+WrZieqXmX2zMaEc/6o4C4eisY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB391F801DA;
	Tue,  1 Sep 2020 18:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25E0EF80217; Tue,  1 Sep 2020 18:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 886A2F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 18:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 886A2F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Qp7cO1c6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mr+spIm0j102sxFcc3WXz2mCLWqWkBrKAQyNQoZhMH4=; b=Qp7cO1c6obl/HbURjQhpBiYPQG
 zMVpdHyURqSWTczQUMKFJAjOy/TiFuPuIO99chev9Opx0LZ/TLT95QaNoVyb4m6rgj02rzNms21bD
 l/OJj+Pn3H4e3Mzua6ZOGdf7TbV7b19zK1HK8PwPz1sPjHOWtXsWoQGxS7DBoTJGYTbRtUYGJqxI7
 8CsalzSoTglaLhiOvz2SYPVRp3wWJsHM/wtbu2DlirQcXKmjLD+1CJIvyaMBTnf2S3HPWyMsavtNt
 3tJ7WFYYYteWuJLPBqd7P2w3N7flwqDEkXxZ8pD/Jd3z/6ksKCRHFQo9SY2r/QQ5XzKyjmUUHgPI3
 osL/2N3Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kD9Wy-0001ZZ-0r; Tue, 01 Sep 2020 16:53:12 +0000
Date: Tue, 1 Sep 2020 17:53:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 07/28] 53c700: improve non-coherent DMA handling
Message-ID: <20200901165311.GS14765@casper.infradead.org>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
 <1598971960.4238.5.camel@HansenPartnership.com>
 <20200901150554.GN14765@casper.infradead.org>
 <1598973776.4238.11.camel@HansenPartnership.com>
 <3369218e-eea4-14e9-15f1-870269e4649d@gmx.de>
 <77c9b2b6-bedc-d090-8b23-6ac664df1d1f@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77c9b2b6-bedc-d090-8b23-6ac664df1d1f@gmx.de>
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Tue, Sep 01, 2020 at 06:41:12PM +0200, Helge Deller wrote:
> > I still have a zoo of machines running for such testing, including a
> > 715/64 and two 730.
> > I'm going to test this git tree on the 715/64:

The 715/64 is a 7100LC machine though.  I think you need to boot on
the 730 to test the non-coherent path.

