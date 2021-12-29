Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13D48151C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 17:34:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261A217F5;
	Wed, 29 Dec 2021 17:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261A217F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640795690;
	bh=T2A0omqo4zPQ6HiynXfIxkBpm73c8IUhVCs7jU3YTNA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lzwtmk6ZHPmJ1j37EZSSHJWsVVt6t5PWcj2oer0hSnLdoSb5wvpoDwMQDBMD+oaTd
	 /zrfK/DN0QyZxc70gdu/aRsYGp6Py1p/DOLV7K+WaFBJiUd4IoAlXJozVYxw82jyLB
	 b3JBhDFYRkj5jGG8r2R2jfVPPoV8eo/tw76aw1oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF11F800D1;
	Wed, 29 Dec 2021 17:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADFE9F801EC; Wed, 29 Dec 2021 17:33:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A694F800D3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 17:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A694F800D3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42992B81849;
 Wed, 29 Dec 2021 16:33:29 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 233E2C36AE9;
 Wed, 29 Dec 2021 16:33:23 +0000 (UTC)
Date: Wed, 29 Dec 2021 16:39:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] mips: lantiq: add support for clk_set_parent()
Message-ID: <20211229163908.2eaf3656@jic23-huawei>
In-Reply-To: <20211229000345.24199-1-rdunlap@infradead.org>
References: <20211229000345.24199-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, John Crispin <john@phrozen.org>
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

On Tue, 28 Dec 2021 16:03:45 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Provide a simple implementation of clk_set_parent() in the lantiq
> subarch so that callers of it will build without errors.
> 
> Fixes these build errors:
> 
> ERROR: modpost: "clk_set_parent" [sound/soc/jz4740/snd-soc-jz4740-i2s.ko] undefined!
> ERROR: modpost: "clk_set_parent" [sound/soc/atmel/snd-soc-atmel-i2s.ko] undefined!
> 
> Fixes: 171bb2f19ed6 ("MIPS: Lantiq: Add initial support for Lantiq SoCs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> --to=linux-mips@vger.kernel.org --cc="John Crispin <john@phrozen.org>" --cc="Jonathan Cameron <jic23@kernel.org>" --cc="Russell King <linux@armlinux.org.uk>" --cc="Andy Shevchenko <andy.shevchenko@gmail.com>" --cc=alsa-devel@alsa-project.org --to="Thomas Bogendoerfer <tsbogend@alpha.franken.de>"

I guess hitting this sooner or later was inevitable given the recent fix
of adding clk_get_parent() to these two.  It might be worth adding a
WARN_ON() or similar to this function though so we know if anything
ever actually hits it at runtime.  Seems like at least some of the
other similar stubs do so (omap1 for example).

With or without a warning, LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/mips/lantiq/clk.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- linux-next-20211224.orig/arch/mips/lantiq/clk.c
> +++ linux-next-20211224/arch/mips/lantiq/clk.c
> @@ -164,6 +164,12 @@ struct clk *clk_get_parent(struct clk *c
>  }
>  EXPORT_SYMBOL(clk_get_parent);
>  
> +int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	return 0;
> +}
> +EXPORT_SYMBOL(clk_set_parent);
> +
>  static inline u32 get_counter_resolution(void)
>  {
>  	u32 res;

