Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505072495CF
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 08:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC2E180E;
	Wed, 19 Aug 2020 08:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC2E180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597820343;
	bh=6tg5kBsKZwy44wSu/CDnkmK3Z0+oJVmDOu6VAOkniZA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AyV1KJ2TtjGbhkKoyWTd/Qd5gDhU0PShvlWKYQn0PMzat8ueAHu/Bzaoq8qtQuGAP
	 lmegDvU1oOFZpjp55pX4FBrcIpEIAQdHASBhoE9DNcrTY/jllbNww65vMPa1Q6aNLv
	 5/vD7aFXPEQZXhOgpbZlJD/T+Z7kz7+v2k9jj010=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E72F8028F;
	Wed, 19 Aug 2020 08:56:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4090FF802A8; Wed, 19 Aug 2020 08:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACE24F80257
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE24F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="uRThKpBV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=z2KvWaZyjho7ndXMH0ORSIBGMLsoLoOlaFmWAQTQuew=; b=uRThKpBVD38wHW4O1Rw+m7ReIB
 6g8DAFjC8rOV8slo1/sXfbFmSe2ZQ/D8oXBbMOULOMMqWf/LF2YgmRNBRhy6xw/WNcPfIgir5jkfY
 jMUBZNOtuPrAml+wEbfI5OBf4FZwNLx4AJ6KLMbazwwdxWKTRuJ8t4QvNBD00a4zi7/l8eeZNVCHo
 TVip/vAV16StqtD9sSi3vWzGnecdc/pw7stv6o2Z7fnoWC5+a2JoL1fYWc4VJinapBZy26rlLUcYn
 mtr0U1RQYeE7P0ovTcYzaF9TaQqsHNEEbAFwOJIquRs9u5qnSydzfDIu7+tbwzSbcDpvLkPbTkcNu
 ySmmqGNA==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I0q-0008Kr-1o; Wed, 19 Aug 2020 06:55:57 +0000
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
Subject: a saner API for allocating DMA addressable pages
Date: Wed, 19 Aug 2020 08:55:27 +0200
Message-Id: <20200819065555.1802761-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
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

Hi all,

this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
with a separate new dma_alloc_pages API, which is available on all
platforms.  In addition to cleaning up the convoluted code path, this
ensures that other drivers that have asked for better support for
non-coherent DMA to pages with incurring bounce buffering over can finally
be properly supported.

I'm still a little unsure about the API naming, as alloc_pages sort of
implies a struct page return value, but we return a kernel virtual
address.  The other alternative would be to name the API
dma_alloc_noncoherent, but the whole non-coherent naming seems to put
people off.  As a follow up I plan to move the implementation of the
DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
that is also is a fundamentally non coherent allocation.  The replacement
for that flag would then return a struct page, as it is allowed to
actually return pages without a kernel mapping as the name suggested
(although most of the time they will actually have a kernel mapping..)

In addition to the conversions of the existing non-coherent DMA users
the last three patches also convert the DMA coherent allocations in
the NVMe driver to use this new framework through a dmapool addition.
This was both to give me a good testing vehicle, but also because it
should speed up the NVMe driver on platforms with non-coherent DMA
nicely, without a downside on platforms with cache coherent DMA.


A git tree is available here:

    git://git.infradead.org/users/hch/misc.git dma_alloc_pages

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages


Diffstat:
 Documentation/core-api/dma-api.rst                       |   92 ++----
 Documentation/core-api/dma-attributes.rst                |    8 
 Documentation/userspace-api/media/v4l/buffer.rst         |   17 -
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst |    1 
 arch/alpha/kernel/pci_iommu.c                            |    2 
 arch/arm/include/asm/dma-direct.h                        |    4 
 arch/arm/mm/dma-mapping-nommu.c                          |    2 
 arch/arm/mm/dma-mapping.c                                |    4 
 arch/ia64/Kconfig                                        |    3 
 arch/ia64/hp/common/sba_iommu.c                          |    2 
 arch/ia64/kernel/dma-mapping.c                           |   14 
 arch/ia64/mm/init.c                                      |    3 
 arch/mips/Kconfig                                        |    1 
 arch/mips/bmips/dma.c                                    |    4 
 arch/mips/cavium-octeon/dma-octeon.c                     |    4 
 arch/mips/include/asm/dma-direct.h                       |    4 
 arch/mips/include/asm/jazzdma.h                          |    2 
 arch/mips/jazz/jazzdma.c                                 |  102 +------
 arch/mips/loongson2ef/fuloong-2e/dma.c                   |    4 
 arch/mips/loongson2ef/lemote-2f/dma.c                    |    4 
 arch/mips/loongson64/dma.c                               |    4 
 arch/mips/mm/dma-noncoherent.c                           |   48 +--
 arch/mips/pci/pci-ar2315.c                               |    4 
 arch/mips/pci/pci-xtalk-bridge.c                         |    4 
 arch/mips/sgi-ip32/ip32-dma.c                            |    4 
 arch/parisc/Kconfig                                      |    1 
 arch/parisc/kernel/pci-dma.c                             |    6 
 arch/powerpc/include/asm/dma-direct.h                    |    4 
 arch/powerpc/kernel/dma-iommu.c                          |    2 
 arch/powerpc/platforms/ps3/system-bus.c                  |    4 
 arch/powerpc/platforms/pseries/vio.c                     |    2 
 arch/s390/pci/pci_dma.c                                  |    2 
 arch/x86/kernel/amd_gart_64.c                            |    8 
 drivers/gpu/drm/exynos/exynos_drm_gem.c                  |    2 
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c      |    3 
 drivers/iommu/dma-iommu.c                                |    2 
 drivers/iommu/intel/iommu.c                              |    6 
 drivers/media/common/videobuf2/videobuf2-core.c          |   36 --
 drivers/media/common/videobuf2/videobuf2-dma-contig.c    |   19 -
 drivers/media/common/videobuf2/videobuf2-dma-sg.c        |    3 
 drivers/media/common/videobuf2/videobuf2-v4l2.c          |   12 
 drivers/net/ethernet/amd/au1000_eth.c                    |   15 -
 drivers/net/ethernet/i825xx/lasi_82596.c                 |   36 +-
 drivers/net/ethernet/i825xx/lib82596.c                   |  148 +++++-----
 drivers/net/ethernet/i825xx/sni_82596.c                  |   23 -
 drivers/net/ethernet/seeq/sgiseeq.c                      |   24 -
 drivers/nvme/host/pci.c                                  |   79 ++---
 drivers/parisc/ccio-dma.c                                |    2 
 drivers/parisc/sba_iommu.c                               |    2 
 drivers/scsi/53c700.c                                    |  120 ++++----
 drivers/scsi/53c700.h                                    |    9 
 drivers/scsi/sgiwd93.c                                   |   14 
 drivers/xen/swiotlb-xen.c                                |    2 
 include/linux/dma-direct.h                               |   55 ++-
 include/linux/dma-mapping.h                              |   32 +-
 include/linux/dma-noncoherent.h                          |   21 -
 include/linux/dmapool.h                                  |   23 +
 include/linux/gfp.h                                      |    6 
 include/media/videobuf2-core.h                           |    3 
 include/uapi/linux/videodev2.h                           |    2 
 kernel/dma/Kconfig                                       |    9 
 kernel/dma/Makefile                                      |    1 
 kernel/dma/coherent.c                                    |   17 +
 kernel/dma/direct.c                                      |  112 +++++--
 kernel/dma/mapping.c                                     |  104 ++-----
 kernel/dma/ops_helpers.c                                 |   86 ++++++
 kernel/dma/pool.c                                        |    2 
 kernel/dma/swiotlb.c                                     |    4 
 kernel/dma/virt.c                                        |    2 
 mm/dmapool.c                                             |  211 +++++++++------
 sound/mips/hal2.c                                        |   58 +---
 71 files changed, 872 insertions(+), 803 deletions(-)
