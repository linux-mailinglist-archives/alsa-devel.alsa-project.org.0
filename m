Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B313953465B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 00:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B53816CA;
	Thu, 26 May 2022 00:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B53816CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653517278;
	bh=c7KzToDeUqtD99O2hzHK7o5kCE8vnxm1uZ6cI59st/U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fliJDSQ7DG2xcNg2MVZ7WQzpL2xi+r1AX+Z3TXPO2yxs+v5NObAORWLOD4GbJ5ZWw
	 NqLYaYsaCFTFHugx8AB3k4mXspAx3NARwOcbh638tOwaXpB59wx8wdt14TNEyBB6Dc
	 qOyvGgkJPf5eM7kNv3CkzjjfGQjwq+epGX8hxCak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F0BF801EC;
	Thu, 26 May 2022 00:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBA72F80100; Thu, 26 May 2022 00:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C52DF80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 00:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C52DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="lc5Bswn5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9A8BB81EAD;
 Wed, 25 May 2022 22:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0633C385B8;
 Wed, 25 May 2022 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1653517207;
 bh=c7KzToDeUqtD99O2hzHK7o5kCE8vnxm1uZ6cI59st/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lc5Bswn5/mLgrZUzDGaOfcSNR02Mm/oMMFmAsk3PMUUgwWwgJa8zBW3fhkYeoBrs6
 zULKKPi/KMazKRvfEOpIG5mlq58qHM3l4UzEO0HxQt9EhuXQjV37+aQrktHPNlneq8
 f2dYK6/dz9JhOi+TYCUG0YZy8hrl37z6cFtGSZlg=
Date: Wed, 25 May 2022 15:20:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-Id: <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
In-Reply-To: <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
 <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parport@lists.infradead.org
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

On Wed, 25 May 2022 23:07:35 +0100 Jessica Clarke <jrtc27@jrtc27.com> wrote:

> This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
> i.e. a u64, which makes the shift without a cast of the LHS fishy.

Ah, of course, thanks.  I remember 32 bits ;)

--- a/mm/shmem.c~mm-shmemc-suppress-shift-warning
+++ a/mm/shmem.c
@@ -1945,7 +1945,7 @@ alloc_nohuge:
 
 	spin_lock_irq(&info->lock);
 	info->alloced += folio_nr_pages(folio);
-	inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
+	inode->i_blocks += (blkcnt_t)BLOCKS_PER_PAGE << folio_order(folio);
 	shmem_recalc_inode(inode);
 	spin_unlock_irq(&info->lock);
 	alloced = true;
_

