Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBD1ACD22
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 18:15:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82AE8166D;
	Thu, 16 Apr 2020 18:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82AE8166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587053709;
	bh=efch8ndBKT6KPCzed3zgW9Zg2EqawmlskOaG4SmvygQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jqn1K41e1AbNhmthVAKkc5n/gJLHwBG8evwpArLjaiw5ENqFW5lcuZxlqsCbX6S/L
	 p+E1yYoZF+X9NgNE5ovjwucPMMqjhQzjxeVyAVwFc9jbF2h+N9v6twaOam4MF913IS
	 7aIAAQRwjyYOmbqhkxIVM8YgssxJafYFfkIFA+Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC2ABF80115;
	Thu, 16 Apr 2020 18:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC435F8013D; Thu, 16 Apr 2020 18:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3209AF8013D
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 18:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3209AF8013D
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7880268BEB; Thu, 16 Apr 2020 18:13:35 +0200 (CEST)
Date: Thu, 16 Apr 2020 18:13:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/7] ASoC: txx9: don't work around too small
 resource_size_t
Message-ID: <20200416161334.GA13919@lst.de>
References: <20200416150011.820984-1-hch@lst.de>
 <20200416150011.820984-2-hch@lst.de> <20200416161226.GN5354@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416161226.GN5354@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
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

On Thu, Apr 16, 2020 at 05:12:26PM +0100, Mark Brown wrote:
> On Thu, Apr 16, 2020 at 05:00:05PM +0200, Christoph Hellwig wrote:
> > The txx9 sound driver deends on HAS_TXX9_ACLC, which is only set for
> > three tx49xx SOCs, and thus always has a 64-bit phys_addr_t and
> > resource_size_t.  Instead of poking into ioremap internals to work
> > around a potentially too small resource_size_t just add a BUILD_BUG_ON
> > to catch such a case.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> or can I just apply this independently of the rest of the series?

No, once ioremap is moved out of line the driver would otherwise
fail to compile as it doesn't pull in the defintitions anymore.
