Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 857F939C83
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 12:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECEE3166D;
	Sat,  8 Jun 2019 12:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECEE3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559991211;
	bh=Bh0rh8tKvQ282Gq8IpmZP8V0ow2thrykG3i1FeZ1DRA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=leWK+2Gv2qeSQw50mPLOC785eN7LDG/Heyoo54my9xDb4UrSYWH4EUmjrESq6OfGG
	 1RWCCgcBw2XiVj5pMtfft6j19L+arvpt3lKFeZfAIaRxCz+qmzz2a65xGYc/2Ptd6S
	 X8R9WWiijUv0e300jtsT66MFdDM1heyuRRlJbUXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE26F896F8;
	Sat,  8 Jun 2019 12:51:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6421FF896F7; Sat,  8 Jun 2019 12:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF082F80709
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 12:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF082F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="GyrjwBj0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgeScMz6rj/dz5CujtnU7v335CfKeHECqxwDNtzgkgY=; b=GyrjwBj00gZE9eaLRKHfky58Co
 YsT7v1zKxGTRvz3OUQxC2wRK3KGwYNzVaJd373H4vT21rbQ+uXfQf4Fbu1PcDWukxtxDdy4EW14F/
 jFrRYnMRazPXuy3XfTL0BR39hlBuk5CA1M0gb8F4nCw4LMsdqfsVJAibH+ocVsdtyBqxlznRDB68R
 7dqTfCETv2iBfVGkcAVSH85f5+Dd1+4flbQ+VBoWD6GJSXFYBHPZ7rnCcXLlObMLw84xH332yK0G9
 vxf9/2dI2KqhBMn8sWr67PA1PKVI2eFqEOQy0vU6C0DXIcf+ptS4nvZ6myRKE0bfWnXL9BkXQT2FN
 I5k5Swcg==;
Received: from [179.181.119.115] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hZYwS-0002D7-9q; Sat, 08 Jun 2019 10:51:20 +0000
Date: Sat, 8 Jun 2019 07:51:13 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190608075113.32f2c7bb@coco.lan>
In-Reply-To: <20190607185728.GJ2456@sirena.org.uk>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <effeafed3023d8dc5f2440c8d5637ea31c02a533.1559933665.git.mchehab+samsung@kernel.org>
 <20190607185728.GJ2456@sirena.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 17/20] dt: bindings: fix some broken
 links from txt->yaml conversion
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

Em Fri, 7 Jun 2019 19:57:28 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Fri, Jun 07, 2019 at 03:54:33PM -0300, Mauro Carvalho Chehab wrote:
> > Some new files got converted to yaml, but references weren't
> > updated accordingly.  
> 
> These should probably just be sent as normal patches rather than tied in
> with the rest of this series...

Thanks for applying it!

Yeah, but the problem with documentation patches is that sometimes
the patches are merged via docs tree, and sometimes via maintainer's
tree, depending on the subsystem.

Anyway, Jon merged this week a patch that should produce warnings
on COMPILE_TEST builds when a file has a broken link.

Hopefully, this will help a lot to warn people against regressions
related to it.


Thanks,
Mauro
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
