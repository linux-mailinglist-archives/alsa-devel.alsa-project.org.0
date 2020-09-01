Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650782591B7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 16:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1571017D5;
	Tue,  1 Sep 2020 16:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1571017D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598972093;
	bh=5QgiJp1XQuU8WeasWKUrByXxrzK/9M/xvKJovjxtOSE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XReXA77h5w17cegKg1CRYyv1q7AWAyo5Iy4B8HilHJ+OjpiAxUM9LcykXJ0MNoMqi
	 5mYvs8wzePjxF6KVinDmap7i1Dj86/CXdFaC+Ag/BCLCHO0469zsWZMzW1MvSCAwgd
	 XqdCIoIeQuGG1TpVGLX6SBye0vNoArlJRrLdOB/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F374EF80217;
	Tue,  1 Sep 2020 16:53:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7124F80217; Tue,  1 Sep 2020 16:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68634F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 16:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68634F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="wObSEMiI"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="aKMifmu3"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2FA1E8EE112;
 Tue,  1 Sep 2020 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1598971964;
 bh=5QgiJp1XQuU8WeasWKUrByXxrzK/9M/xvKJovjxtOSE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=wObSEMiIFiMQqpuLxaCfGj6fWwMB1SR5uR3WpqveV9O4eMPwCERYxZe+pGeu45B1s
 Hh0lHOhPmaDzTL+z1MwoTQwce39LAcI0HTI6j6IhhJYI3h5nKO0TMp801H3LPYpAS2
 cAlNurtUenHcZUudnTaoIqyV7yZakslR9e7UqKeA=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 0Zy3Ukh5UkrA; Tue,  1 Sep 2020 07:52:44 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
 [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C9BD38EE0F5;
 Tue,  1 Sep 2020 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1598971963;
 bh=5QgiJp1XQuU8WeasWKUrByXxrzK/9M/xvKJovjxtOSE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aKMifmu3auQ6FWaycnVm58I6hz9G+D25US7ZBIQmKPWtl/OO3oAlisEasTKoEqxvs
 l6ihGgc23PPx6Vjc2Wtc/36E47y53pW7IPIx5bd2ov50jG73PyojCzhwq4i11ZzTyB
 Dg3UC/gKa12A9sw0Wl45QN34rTiyU/vUbrJxeAio=
Message-ID: <1598971960.4238.5.camel@HansenPartnership.com>
Subject: Re: [PATCH 07/28] 53c700: improve non-coherent DMA handling
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Ben
 Skeggs <bskeggs@redhat.com>, Pawel Osciak <pawel@osciak.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Matt Porter
 <mporter@kernel.crashing.org>,  iommu@lists.linux-foundation.org
Date: Tue, 01 Sep 2020 07:52:40 -0700
In-Reply-To: <20200819065555.1802761-8-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2020-08-19 at 08:55 +0200, Christoph Hellwig wrote:
> Switch the 53c700 driver to only use non-coherent descriptor memory
> if it really has to because dma_alloc_coherent fails.  This doesn't
> matter for any of the platforms it runs on currently, but that will
> change soon.
> 
> To help with this two new helpers to transfer ownership to and from
> the device are added that abstract the syncing of the non-coherent
> memory. The two current bidirectional cases are mapped to transfers
> to the device, as that appears to what they are used for.  Note that
> for parisc, which is the only architecture this driver needs to use
> non-coherent memory on, the direction argument of dma_cache_sync is
> ignored, so this will not change behavior in any way.

I think this looks mostly OK, except for one misnamed parameter below. 
Unfortunately, the last non-coherent parisc was the 700 series and I no
longer own a box, so I can't test that part of it (I can fire up the
C360 to test it on a coherent arch).

[...]
> diff --git a/drivers/scsi/53c700.h b/drivers/scsi/53c700.h
> index 05fe439b66afe5..0f545b05fe611d 100644
> --- a/drivers/scsi/53c700.h
> +++ b/drivers/scsi/53c700.h
> @@ -209,6 +209,7 @@ struct NCR_700_Host_Parameters {
>  #endif
>  	__u32	chip710:1;	/* set if really a 710 not
> 700 */
>  	__u32	burst_length:4;	/* set to 0 to disable
> 710 bursting */
> +	__u32	noncoherent:1;	/* needs to use non-
> coherent DMA */
>  
>  	/* NOTHING BELOW HERE NEEDS ALTERING */
>  	__u32	fast:1;		/* if we can alter the
> SCSI bus clock
> @@ -429,7 +430,7 @@ struct NCR_700_Host_Parameters {
>  	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32));
> i++) { \
>  		__u32 val =
> bS_to_cpu((script)[A_##symbol##_used[i]]) + da; \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching %s at %d to %pad\n", \
>  		       #symbol, A_##symbol##_used[i], &da)); \
>  	} \
> @@ -441,7 +442,7 @@ struct NCR_700_Host_Parameters {
>  	dma_addr_t da = value; \
>  	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32));
> i++) { \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(da); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching %s at %d to %pad\n", \
>  		       #symbol, A_##symbol##_used[i], &da)); \
>  	} \
> @@ -456,7 +457,7 @@ struct NCR_700_Host_Parameters {
>  		val &= 0xff00ffff; \
>  		val |= ((value) & 0xff) << 16; \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching ID field %s at %d to
> 0x%x\n", \
>  		       #symbol, A_##symbol##_used[i], val)); \
>  	} \
> @@ -470,7 +471,7 @@ struct NCR_700_Host_Parameters {
>  		val &= 0xffff0000; \
>  		val |= ((value) & 0xffff); \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching short field %s at %d to
> 0x%x\n", \
>  		       #symbol, A_##symbol##_used[i], val)); \
>  	} \

These macro arguments need updating.  Since you changed the input from
hostdata->dev to hostdata, leaving the macro argument as dev is simply
misleading.  It needs to become hostdata or h.

James

