Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FF258F26
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 15:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C0617B9;
	Tue,  1 Sep 2020 15:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C0617B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598967196;
	bh=FuWZo1WNgCdLfSjE9O1i1nzwTm/eu1X2U4bMj+Wa+tk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CxR3ueyX/Gui42oFqgwyRtO8xPFEVzv57KXWvw0qjyd9x2E/JHAOpSsC+IfuhCV0y
	 c4Eozg97cWAJNeeuY7tMB4CCSFN+n5sRjVGxHSHOHTkLI5KcpZaXnk/BT8Bs3O/IMD
	 L3aM3XBzx6icNoLupj7Cpfh11qru78Y2uSfTfits=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA61DF8020D;
	Tue,  1 Sep 2020 15:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B39FEF8021D; Tue,  1 Sep 2020 15:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by alsa1.perex.cz (Postfix) with ESMTP id 192D1F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 15:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192D1F801EB
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kD6NY-0001cg-00; Tue, 01 Sep 2020 15:31:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id A31F7C0E44; Tue,  1 Sep 2020 15:29:05 +0200 (CEST)
Date: Tue, 1 Sep 2020 15:29:05 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/28] lib82596: move DMA allocation into the callers of
 i82596_probe
Message-ID: <20200901132905.GA11506@alpha.franken.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819065555.1802761-7-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
 Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
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

On Wed, Aug 19, 2020 at 08:55:33AM +0200, Christoph Hellwig wrote:
> This allows us to get rid of the LIB82596_DMA_ATTR defined and prepare
> for untangling the coherent vs non-coherent DMA allocation API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/net/ethernet/i825xx/lasi_82596.c | 24 ++++++++++------
>  drivers/net/ethernet/i825xx/lib82596.c   | 36 ++++++++----------------
>  drivers/net/ethernet/i825xx/sni_82596.c  | 19 +++++++++----
>  3 files changed, 40 insertions(+), 39 deletions(-)
> 
> [...]
> diff --git a/drivers/net/ethernet/i825xx/sni_82596.c b/drivers/net/ethernet/i825xx/sni_82596.c
> index 22f5887578b2bd..e80e790ffbd4d4 100644
> --- a/drivers/net/ethernet/i825xx/sni_82596.c
> +++ b/drivers/net/ethernet/i825xx/sni_82596.c
> @@ -24,8 +24,6 @@
>  
>  static const char sni_82596_string[] = "snirm_82596";
>  
> -#define LIB82596_DMA_ATTR	0
> -
>  #define DMA_WBACK(priv, addr, len)     do { } while (0)
>  #define DMA_INV(priv, addr, len)       do { } while (0)
>  #define DMA_WBACK_INV(priv, addr, len) do { } while (0)
> @@ -134,10 +132,19 @@ static int sni_82596_probe(struct platform_device *dev)
>  	lp->ca = ca_addr;
>  	lp->mpu_port = mpu_addr;
>  
> +	lp->dma = dma_alloc_coherent(dev->dev.parent, sizeof(struct i596_dma),
> +				     &lp->dma_addr, GFP_KERNEL);

this needs to use &dev->dev as device argument otherwise I get a

WARNING: CPU: 0 PID: 1 at linux/kernel/dma/mapping.c:416 dma_alloc_attrs+0x64/0x98

(coherent_dma_mask is set correctly).

dev->dev.parent was correct when going from netdevice to underlying device,
but now allocation is done via platform_device probe. I wonder why this works
for parisc.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
