Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B263C1A1
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 15:01:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D819816B1;
	Tue, 29 Nov 2022 15:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D819816B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669730503;
	bh=7Dp5fGDdIZzDbj5Lb0FM/xsq2jQ7hW5HxlbbGcRIG2I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LeW94L/zI9eMvDEyIiTvCYmnr4R+QYkReGj/b8RNnf1XKxJ2zuM66XgePKgcZhfAA
	 MCODx7XvTwP5PTzi87pfSsr3L92Jy84cvvqvJKnUTuoCjjt0v2x1SseoQkhUx+3gxK
	 +p2ccqeTgBMUehXEMNaPwNIcbtKlJ7skwCViG9I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D55FF80212;
	Tue, 29 Nov 2022 15:00:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30637F801F7; Tue, 29 Nov 2022 15:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D271CF800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 15:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D271CF800B6
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5BDAA6732D; Tue, 29 Nov 2022 15:00:35 +0100 (CET)
Date: Tue, 29 Nov 2022 15:00:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/7] media: videobuf-dma-contig: use dma_mmap_coherent
Message-ID: <20221129140034.GA15560@lst.de>
References: <20221113163535.884299-1-hch@lst.de>
 <20221113163535.884299-2-hch@lst.de>
 <95cf026d-b37c-0b89-881a-325756645dae@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95cf026d-b37c-0b89-881a-325756645dae@xs4all.nl>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, Alexandra Winter <wintera@linux.ibm.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 iommu@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Thu, Nov 24, 2022 at 03:10:43PM +0100, Hans Verkuil wrote:
> Very, very old code :-) Hopefully in the not-too-distant future we can kill off
> the old videobuf framework.

That would be great for various reasons.

> But for now:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> I assume you take this? If not, then let me know and I will pick it up for the media
> subsystem.

I've actually picked it up a while ago.  So without a reabse I can't
add your formal ACK, but I hope Linus is fine with that.
