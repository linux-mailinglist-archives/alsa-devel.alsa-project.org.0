Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445D7D038
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 23:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE9B16AC;
	Wed, 31 Jul 2019 23:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE9B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564609414;
	bh=Ow0x9ZnBCHf+h8xMhU+aaAnDmhniAfY6VqC7jnfEgeU=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jw+myENEqNeEF4uwhK0hyrVfovrSCbdP2+nvDjZLzmsElAV4wwBeYkoYKTYUlPRKf
	 B97ed2y0b+QNW/B0s37UcbUyRrH8MFZmRm+dJc4s9Ew0fIUz/ZWIRNwg7Z7ZimcCxy
	 UfiyWvewaUnApiE1u1/eRvNfgxtLXmLdtNFipAmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48192F8048E;
	Wed, 31 Jul 2019 23:41:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA804F80483; Wed, 31 Jul 2019 23:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7A8EF800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 23:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7A8EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="g83i6fG6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ojbkQD1a7MQMcAHB0nbk0TNEefbMHs3972JP2NcjJME=; b=g83i6fG6pLz5k+ubFSnN8EkA5
 UONDm7X0pnk+aEXdmFccZHoiA/MwLcT3bciBvO1P/EPjm9w8DWxTy97HZrc+BdRKb+EgxEQ2sotEY
 MsEte0kaui9SJBYnpz2cVbQjTQfjElvMKIWI6V5wqmkV+8dU6kjbQ/91+vlvuSzIz08B81Pm1tR53
 Hvm/XYnYMcHDHQYcvFC6f8pqy/unIZORk47M8Lmo1dFfIdsORd+7CHhf8lrV4waeQjIwLfl27lujE
 JiRPbITNDfNg+OgMhYM3B51EPP6j7Bw+mnUM0iyfG5dpLSulcXgKe3UHGtWtHkzcxSQw4+I3NKq51
 irVg2nqrA==;
Received: from [191.33.152.89] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsw8I-0001T3-HP; Wed, 31 Jul 2019 21:27:38 +0000
Date: Wed, 31 Jul 2019 18:27:29 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190731182729.01c98cd3@coco.lan>
In-Reply-To: <20190731203712.GJ4369@sirena.org.uk>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <20190731141734.1fa9ce64@lwn.net>
 <20190731202007.GI4369@sirena.org.uk>
 <20190731172613.32d65ad8@coco.lan>
 <20190731203712.GJ4369@sirena.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 alsa-devel@alsa-project.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-cifs@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, samba-technical@lists.samba.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, Steve French <sfrench@samba.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/6] ReST conversion patches not applied yet
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Em Wed, 31 Jul 2019 21:37:12 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Wed, Jul 31, 2019 at 05:26:13PM -0300, Mauro Carvalho Chehab wrote:
> > Mark Brown <broonie@kernel.org> escreveu:  
> 
> > > There were outstanding questions about where it was going to get moved
> > > to but if I read the diff correctly it looks like it didn't actually get
> > > moved in the end?  
> 
> > Yeah, it doesn't have the move. My understanding from our discussions
> > is that we didn't reach a conclusion.  
> 
> Yes, that was my understanding too which was why I was surprised to see
> this going in.  This is OK then, I'd have acked it.
> 
> > In any case, I can send a separate patch with the move part once
> > we reach an agreement about what's the best way to proceed (or you
> > can do it directly, if you prefer so).  
> 
> I'm not likely to do anything without someone sending patches, I'm not
> clear on the utility of the move with the current division of the
> manuals.

Same here: I do see value on having docs focused on their audience.

Yet, I'm not so sure how worth is to break some subsystem documentation 
into books, as, on some cases, this would mean huge efforts.

I'd prefer to see the big picture first, finishing the conversion and
then looking at the resulting docs.

Meanwhile, if someone needs something that it is at the wrong book, he
can just use some search tool to seek what he needs, no matter on
what book the relevant information is stored.

> I don't know if it makes sense to have an embedded developer's
> manual as well?

Yeah, that's a good question. 

Jon is planning todo a documentation track at LPC. One of the things
that should be discussed, IMO, is how we'll organize the books.

I suspect that, once we finish the conversion of the remaining ~300
files to ReST, the next logical step is to check what are the gaps
and have a list of pending tasks.

Thanks,
Mauro
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
