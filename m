Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D344C24CCD1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 06:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62BEF1689;
	Fri, 21 Aug 2020 06:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62BEF1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597984578;
	bh=8MCltXRL+RGxf4gw22SJJk0rZoXwbuNIta681mVBukg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWTbJ21VEp0m+aAKIUPVuiFmNjq9C5R5xSmEzA/OONy0m9iyL/Q2WNRCQwKq1a8TT
	 dmXwwBEf/OyHIc9uTo+Flq/+B/Ya8CMSvnErTGbuLdEU3YslRluAM6GmanLauVYTBR
	 ci1lg4+MAyGrhedBj5DU8JqCAsDYHwTw94scMrxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69740F80253;
	Fri, 21 Aug 2020 06:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B8BF80218; Fri, 21 Aug 2020 06:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBBD6F800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 06:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBBD6F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com
 header.b="Koeki1sT"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
 t=1597984468; x=1629520468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8MCltXRL+RGxf4gw22SJJk0rZoXwbuNIta681mVBukg=;
 b=Koeki1sTRxXlXUDrf4FoZrT/Zp/r/+BIciNRofKbcUbNAWtiJTzIr7nj
 71YAm3rp950HO56XT5Im4k6qjOhuC41e52vKzXTX+KBNx4y+zwfD2Jjib
 KRYDiMtVrNTc0yHsYo3KFYTkSGpCNZMCAXOJ611D7LyuAUDBw/Rmmsmy7
 EPRunB9CzFfwz6cKeQYc9rT2VZXEPDb/a2VuFZU3USjiX0huP8NNCyycA
 C+cBzG9ucUeMY/tbh2R1Z3bV0gswFVuFw2q5Z5+wFEFp6Wms6xcUwey8f
 xippHikrZDakcViurj+QfvjZDwWy8e9Q1JRBddWlRuUx+NJn/KADmTUs5 Q==;
IronPort-SDR: HAN9vym7mM33d8fMsKj7u4xEC2g2HvwohDQjA95kU2hj4jut2jxR/PHsvKaEd7LbB7+IDRkmaB
 Zj/9cm09Gb+dP1nj9NLcIT5B+4A8/7PBANIHGP5zyyRfYxDJyi9jP0d8Y4eWOAVXQ05OH539Re
 NEwAp5488VCy830zzz14uO+BsLZJnhTVS0/xn/kmzWinSOQyaQLyXxLtVcX2jB0GvOns9WFHBC
 J8FOf9prgzvqw/1mFhBCfyrAKFizPQmu/tk7pPG4uM3HvHH3dUSuBxxPp+3XpUHxvBxqPsjzc5
 UjY=
X-IronPort-AV: E=Sophos;i="5.76,335,1592863200"; 
   d="scan'208";a="2647454"
Date: Fri, 21 Aug 2020 06:34:18 +0200
From: Richard Leitner <richard.leitner@skidata.com>
To: Robin Gong <yibin.gong@nxp.com>
Subject: Re: pcm|dmaengine|imx-sdma race condition on i.MX6
Message-ID: <20200821043418.GA65616@pcleri>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
 <6b5799a567d14cfb9ce34d278a33017d@skidata.com>
 <VE1PR04MB6638A7AC625B6771F9A69F0D895A0@VE1PR04MB6638.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6638A7AC625B6771F9A69F0D895A0@VE1PR04MB6638.eurprd04.prod.outlook.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
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

On Thu, Aug 20, 2020 at 03:01:44PM +0000, Robin Gong wrote:
> On 2020/08/19 22:26 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com> wrote: 
> > 
> > @Robin:
> > Is it possible to tag the commits for the stable-tree
> > Cc: stable@vger.kernel.org?
> Could my patch work in your side? If yes, I will add
> Cc: stable@vger.kernel.org 

I've tested the patches 3 & 4 (removing sdmac->context_loaded) of the
series you mentioned and sent Tested-by tags for them [1,2], as they
fix the EIO problems for our use case.

So from our side they are fine for stable.

[1] https://lore.kernel.org/dmaengine/20200817053813.GA551027@pcleri/T/#u
[2] https://lore.kernel.org/dmaengine/20200817053820.GB551027@pcleri/T/#u

regards;rl
