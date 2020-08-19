Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78E24CFFF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918701676;
	Fri, 21 Aug 2020 09:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918701676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996427;
	bh=GazL5RuGzNsltJmK5TVSYc5vxyNguEsJt8YXpsvAPSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9zkEB16Zd86ZZOu0s5/Vl4kjmszG7ywbK1pMKq9ErkvYfJ49QyVFoHM5JCnbADsE
	 9FDFlA7ciRL3EoxISRleNFXj6LwNeMWvWqn1uniO10D+OM2XWDjNcr+RBy1BmW2hP3
	 J2dd+aX4i49tnlMzPx2wRbcQYfMMG1tyx7fjjork=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C01F8041D;
	Fri, 21 Aug 2020 09:36:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BDEBF80218; Wed, 19 Aug 2020 17:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D7AF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 17:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D7AF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CmFRV9MF"
Received: by mail-ej1-x644.google.com with SMTP id kq25so26684548ejb.3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gblnYCzc62i56nCc5LRWss+Qf5wc+kIzyZ60hUww65Y=;
 b=CmFRV9MF78Io9lyU3ZTHQoxCUWL8rgrVpgpqOj4nEXWpRTCd1+KGSochi2kuoVhtFt
 PQJJembCFDIORAph3WzrpDoRd2cIGJpwf9VAtP5a9ydpphhRkHDHcmKRPuhZGWASaGfl
 y6rPrnsIqK2MPfXnYUVbYzJtuDwuiigpqdGRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gblnYCzc62i56nCc5LRWss+Qf5wc+kIzyZ60hUww65Y=;
 b=CSGJGCubQpyo4Q4GD3zJIqqKDjh/euH4WMhe2V6FFDZsphLA3+hKJm8HNh+vTVyiIz
 aE4cCvh9pJbZI74u9Gt20APobyRZyB5HtTWG8mwSVqCTHDZXjgYYQt3Y8fwXPfbHM2mm
 E2t8qbkee/Jiac9ID10aVa9KNyW6C43nP6XbEJpOKDV2YbuL5tlRyBlQHYkSnK0rbFJF
 v6GPU+AwCa1v/0+86Am36zhs+srkqA8kep9Ru6ugbgwKvQx5yA+alhztPJwIflAbz9fg
 kPO80eMW8bNdGjE7AXSc9DNWL1MvzRy7QAUgFeSxz8TTOuoEDJHH/ruwGhLq9PdvFfRX
 ORyg==
X-Gm-Message-State: AOAM532nCEk2H3BlXacbK5BozQhaahs254WSFda/rpflW2v8n7+ANKSk
 hFN5uTOtRvLE7fBmKzZdQ67Pj9BKEa0mCg==
X-Google-Smtp-Source: ABdhPJx7STbHcpALOvv+6s3flDWW7G/giqrBYwSt0SGKwdw2CLVCWBfhgM6F9jXe0OkC6ExaOpy6CQ==
X-Received: by 2002:a17:906:b6d5:: with SMTP id
 ec21mr24662234ejb.396.1597849450876; 
 Wed, 19 Aug 2020 08:04:10 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53])
 by smtp.gmail.com with ESMTPSA id gh25sm18583495ejb.109.2020.08.19.08.04.09
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 08:04:10 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id c80so2416555wme.0
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:04:09 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr5316483wmh.55.1597849448826; 
 Wed, 19 Aug 2020 08:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-20-hch@lst.de>
In-Reply-To: <20200819065555.1802761-20-hch@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Aug 2020 17:03:52 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
Message-ID: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
Subject: Re: [PATCH 19/28] dma-mapping: replace DMA_ATTR_NON_CONSISTENT with
 dma_{alloc, free}_pages
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Aug 2020 09:36:14 +0200
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
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

Hi Christoph,

On Wed, Aug 19, 2020 at 8:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a new API to allocate and free pages that are guaranteed to be
> addressable by a device, but otherwise behave like pages allocated by
> alloc_pages.  The intended APIs to sync them for use with the device
> and cpu are dma_sync_single_for_{device,cpu} that are also used for
> streaming mappings.
>
> Switch all drivers over to this new API, but keep the usage of the
> crufty dma_cache_sync API for now, which will be cleaned up on a driver
> by driver basis.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/core-api/dma-api.rst        | 68 +++++++++++------------
>  Documentation/core-api/dma-attributes.rst |  8 ---
>  arch/alpha/kernel/pci_iommu.c             |  2 +
>  arch/arm/mm/dma-mapping-nommu.c           |  2 +
>  arch/arm/mm/dma-mapping.c                 |  4 ++
>  arch/ia64/hp/common/sba_iommu.c           |  2 +
>  arch/mips/jazz/jazzdma.c                  |  7 +--
>  arch/powerpc/kernel/dma-iommu.c           |  2 +
>  arch/powerpc/platforms/ps3/system-bus.c   |  4 ++
>  arch/powerpc/platforms/pseries/vio.c      |  2 +
>  arch/s390/pci/pci_dma.c                   |  2 +
>  arch/x86/kernel/amd_gart_64.c             |  2 +
>  drivers/iommu/dma-iommu.c                 |  2 +
>  drivers/iommu/intel/iommu.c               |  4 ++
>  drivers/net/ethernet/i825xx/lasi_82596.c  | 13 ++---
>  drivers/net/ethernet/seeq/sgiseeq.c       | 12 ++--
>  drivers/parisc/ccio-dma.c                 |  2 +
>  drivers/parisc/sba_iommu.c                |  2 +
>  drivers/scsi/53c700.c                     |  8 +--
>  drivers/scsi/sgiwd93.c                    | 12 ++--
>  drivers/xen/swiotlb-xen.c                 |  2 +
>  include/linux/dma-direct.h                |  5 ++
>  include/linux/dma-mapping.h               | 29 ++++++++--
>  include/linux/dma-noncoherent.h           |  3 -
>  kernel/dma/direct.c                       | 51 ++++++++++++++++-
>  kernel/dma/mapping.c                      | 43 +++++++++++++-
>  kernel/dma/ops_helpers.c                  | 35 ++++++++++++
>  kernel/dma/virt.c                         |  2 +
>  sound/mips/hal2.c                         | 20 +++----
>  29 files changed, 254 insertions(+), 96 deletions(-)
>

Thanks for the patch. The general design looks quite nice, but please
see my comments inline.


> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 90239348b30f6f..047fcfffa0e5cf 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -516,48 +516,53 @@ routines, e.g.:::
>         }
>
>
> -Part II - Advanced dma usage
> -----------------------------
> +Part II - Non-coherent DMA allocations
> +--------------------------------------
>
> -Warning: These pieces of the DMA API should not be used in the
> -majority of cases, since they cater for unlikely corner cases that
> -don't belong in usual drivers.
> +These APIs allow to allocate pages that can be used like normal pages
> +in the kernel direct mapping, but are guaranteed to be DMA addressable.

Could we elaborate a bit more on what "like normal pages in kernel
direct mapping" mean from the driver perspective?

>
>  If you don't understand how cache line coherency works between a
>  processor and an I/O device, you should not be using this part of the
> -API at all.
> +API.
>
>  ::
>
>         void *
> -       dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
> -                       gfp_t flag, unsigned long attrs)
> +       dma_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
> +                       enum dma_data_direction dir, gfp_t gfp)
> +
> +This routine allocates a region of <size> bytes of consistent memory.  It
> +returns a pointer to the allocated region (in the processor's virtual address
> +space) or NULL if the allocation failed. The returned memory is guanteed to
> +behave like memory allocated using alloc_pages.

There is one aspect that the existing dma_alloc_attrs() handles, but
this new function doesn't: IOMMU support. The function will always
allocate a physically-contiguous block memory, which is a costly
operation and not even guaranteed to succeed, even if enough free
memory is available.

Modern SoCs employ IOMMUs to avoid the need to allocate
physically-contiguous memory and those happen to be also the devices
that could benefit from non-coherent allocations a lot. One of the
tasks of the DMA API was making it possible to allocate suitable
memory for a given device, without having the driver know about the
SoC integration details, such as the presence of an IOMMU.

Today, dma_alloc_attrs() uses the .alloc callback of the dma_ops
struct and the IOMMU-aware implementations, like the dma-iommu helpers
[1], would allocate discontiguous pages. Therefore, while I see the
DMA-aware page allocation functionality as a useful functionality on
its own for scatter-gather-capable hardware, I believe it is not a
complete replacement for dma_alloc_attrs() with the
DMA_ATTR_NON_CONSISTENT attribute.

[1] https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/iommu/dma-iommu.c#L510

Best regards,
Tomasz
