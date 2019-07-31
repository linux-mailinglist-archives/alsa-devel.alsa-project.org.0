Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A77CE53
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 22:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3B216B8;
	Wed, 31 Jul 2019 22:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3B216B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564604910;
	bh=4R+pxrYRXHe9fXYMxz/dTaEE/R3glRTF+lBZExL25Mw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PyOUxxaOWO3KQ9FS5Y7lHzaFkTzeILxriz/8h8c+MgFJHwFLTSK3lAMQqxxXLp5Nm
	 9iA5Je4PWS7yDgxfZfPzLiaBDbTt02hqHBcE7yhzk76sdWFWXYus6Ze+FvddHdYHs0
	 /HaRWK1BRjGXlH2oUAuRq8tgHNp+R8LsG7vQy5EM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD812F8048E;
	Wed, 31 Jul 2019 22:26:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE15F80483; Wed, 31 Jul 2019 22:26:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A9C6F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A9C6F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="cd0EZcQk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+a5BC2SMQTZyNnosj2+NVoaE/cuHtdCJLsTbfMI7CM8=; b=cd0EZcQkx68qz1mV7MZC2uM8w
 P5cYOfzRqT4jAj1XeIa5cZwCKRpuEARrsXGCDxCq8sgpCmoEJ8VyMoB1ZGWIv3KkGkC8AIFMmG3zu
 rlsmWUq3FLoiDUPohjPULvC4w5BLIzEmbwgXzpFT+L80k80QNHwktIQFstvBvlBiAagdTYKLP7kd6
 mgvL4iD+sHmcbJxX4pbsqTYJFd9WsDq0iZww0LtIbpC3Rwlt6XCZ+VcKY2odTaplLXORSAqBC7jw+
 ktYQ73C/T59Q53D5UHvn8GEbIRSj5leo+helE+/aJGkkXgpqWFvenf2ZTIwIz7KLtjIJb7x/x8Xk3
 8x9hawtXg==;
Received: from [191.33.152.89] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsvB0-0001Q8-KC; Wed, 31 Jul 2019 20:26:22 +0000
Date: Wed, 31 Jul 2019 17:26:13 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190731172613.32d65ad8@coco.lan>
In-Reply-To: <20190731202007.GI4369@sirena.org.uk>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <20190731141734.1fa9ce64@lwn.net>
 <20190731202007.GI4369@sirena.org.uk>
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

Em Wed, 31 Jul 2019 21:20:07 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Wed, Jul 31, 2019 at 02:17:34PM -0600, Jonathan Corbet wrote:
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:  
> 
> > > As promised, this is the rebased version of the patches that were not applied
> > > from the /26 patch series because you had merge conflicts.
> > > 
> > > They're all based on your docs-next branch, so should apply fine.
> > > 
> > > The first one fixes all but one error with a broken reference.
> > > 
> > > The only broken reference right now is due to a DT patch with was not
> > > accepted (no idea why), but whose driver is upstream.  
> 
> > All but 5/6 applied, thanks.  
> 
> Oh, I still hadn't reviewed this version of the SPI stuff :(

It is basically the one sent on that /26 patch series, just rebased
on the top of docs-next.

> There were outstanding questions about where it was going to get moved
> to but if I read the diff correctly it looks like it didn't actually get
> moved in the end?

Yeah, it doesn't have the move. My understanding from our discussions
is that we didn't reach a conclusion.

In any case, I can send a separate patch with the move part once
we reach an agreement about what's the best way to proceed (or you
can do it directly, if you prefer so).

Thanks,
Mauro
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
