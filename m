Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515F48151D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 17:35:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E931825;
	Wed, 29 Dec 2021 17:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E931825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640795730;
	bh=JhSCTHyDLgNK15/MUxg3K/O606EFEPBo+BXJaFxImMQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e96j+APObHvw0bQe+y82nGcpJBJYPTzn94Z1+MZ65gPtYA9vxUkQG9Jfq94Fi6bm2
	 zbQhuazvRRHnOa307zVz4+Kr/DoxBa7Ym0q9Ze09NF124l6R+zPTfNEFUiG5iVj8i9
	 u14rGDrnwUehtLwNP999yyC4y3rKK9zpxT/3noic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64BC3F80236;
	Wed, 29 Dec 2021 17:34:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D45F801EC; Wed, 29 Dec 2021 17:34:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8048F80224
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 17:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8048F80224
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC59C61529;
 Wed, 29 Dec 2021 16:34:24 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id A06AEC36AE7;
 Wed, 29 Dec 2021 16:34:20 +0000 (UTC)
Date: Wed, 29 Dec 2021 16:40:05 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mips: bcm63xx: add support for clk_set_parent()
Message-ID: <20211229164005.6f5a76a0@jic23-huawei>
In-Reply-To: <20211229000553.32240-1-rdunlap@infradead.org>
References: <20211229000553.32240-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Florian Fainelli <f.fainelli@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 bcm-kernel-feedback-list@broadcom.com, Russell King <linux@armlinux.org.uk>
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

On Tue, 28 Dec 2021 16:05:53 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> The MIPS BMC63XX subarch does not provide/support clk_set_parent().
> This causes build errors in a few drivers, so add a simple implementation
> of that function so that callers of it will build without errors.
> 
> Fixes these build errors:
> 
> ERROR: modpost: "clk_set_parent" [sound/soc/jz4740/snd-soc-jz4740-i2s.ko] undefined!
> ERROR: modpost: "clk_set_parent" [sound/soc/atmel/snd-soc-atmel-i2s.ko] undefined!
> 
> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs." )
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Hi Randy,

As with the other one, perhaps consider a WARN_ON()
With or without that FWIW

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/mips/bcm63xx/clk.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- linux-next-20211224.orig/arch/mips/bcm63xx/clk.c
> +++ linux-next-20211224/arch/mips/bcm63xx/clk.c
> @@ -387,6 +387,12 @@ struct clk *clk_get_parent(struct clk *c
>  }
>  EXPORT_SYMBOL(clk_get_parent);
>  
> +int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	return 0;
> +}
> +EXPORT_SYMBOL(clk_set_parent);
> +
>  unsigned long clk_get_rate(struct clk *clk)
>  {
>  	if (!clk)

