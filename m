Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A6545F37
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7404184E;
	Fri, 10 Jun 2022 10:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7404184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850062;
	bh=EBKC+ZRMXx9oy2lZ4RT5+HL/YdtQZKY0F8s0a5FbJQo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWUgaRi5IpJQ9hy8loWxPDeIv71GJmyoXKtzf5uGbze610aSkW8tyh0NjjGeffxbc
	 pZfV+j86ytUHDz75lt6vkoyypvtpV62REb+WChI8S/My0+JYBph698svrlnb27Hm5B
	 8K7vGFp7Wp9eJDuST6k8oyOLG/tjQcCh7HhAuOlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52407F800C7;
	Fri, 10 Jun 2022 10:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE845F804D2; Fri, 10 Jun 2022 10:11:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3045EF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3045EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="GB5aPyYF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=w8J2KWjgjx9J/jKYFe8GjW3jNW9wYeGtv0q5FHV/ys4=; b=GB5aPyYFM6PkAx1k8v49cM2BwJ
 WcHcAb9jUq2QalpM0aIhDr3+BATD+8EYM+eWrdcimaNJm2xzuBjssr8WpUOHCt60n94XAWc3FLON0
 Ea9J0QBamM6uWTM+4HzYRBxWYDjskhw+JmLncWTsnFKFqxOWIxsmL4IFLm4L1tdnFjZSI0pPplO8o
 9sJxX0TlKZO3aKYVSMxNIiHKcE1/kS+w9R9M0LWGRUAImkmbZyNxVDSII1uFSuj5x0bXfi1yfXOOK
 c3DmI+O3f6cqKS1/lbJzaDxCojVk8Q1W7xF3ZeNStt9QC+dLwogmOOIHoLpghg/0Ij+XccRx5toAG
 ilnXeRzQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzZin-006gfR-MQ; Fri, 10 Jun 2022 08:10:21 +0000
Date: Fri, 10 Jun 2022 01:10:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH 04/12] blk-cgroup: use correct format characters
Message-ID: <YqL8bTQxrkQjlSBT@infradead.org>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-5-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609221702.347522-5-morbo@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Fri, 10 Jun 2022 10:33:22 +0200
Cc: alsa-devel@alsa-project.org, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, isanbard@gmail.com,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, llvm@lists.linux.dev,
 coreteam@netfilter.org, Arnd Bergmann <arnd@arndb.de>,
 Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Jun 09, 2022 at 10:16:23PM +0000, Bill Wendling wrote:
>  	vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
> -	dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
> +	dev = device_create(bdi_class, NULL, MKDEV(0, 0), bdi, "%s", bdi->dev_name);

Please avoid the overly long line.  But given that bdi names aren't user
input this warning seems to shoot from the hip a bit.

