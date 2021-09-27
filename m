Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8432419243
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 12:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63D981684;
	Mon, 27 Sep 2021 12:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63D981684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632738909;
	bh=DpgfTU/8N0gTE7R+MVArhChyyOvY/6IJCvxMokBuDGc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xvam7ZuhNQkUGoD05cznylvzMoIjY1FoEGwYMBfp08p3Y7XbR+dK6SFPowJXqpQBw
	 HByScRdHLmBrzI/cZYAJay9vJAtGmPU4JjSyc4vx1noSO5A4zf21QkH0BJJmsKHMUK
	 xBlMKZmMZ5fJp6OLssCV+ZA9W+EHfND+DGtqrvXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C326BF801F7;
	Mon, 27 Sep 2021 12:33:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E284DF80227; Mon, 27 Sep 2021 12:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F1EAF801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 12:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F1EAF801EC
X-UUID: 98fe2ad69e914c89ae096200ea39a7dc-20210927
X-UUID: 98fe2ad69e914c89ae096200ea39a7dc-20210927
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1472071810; Mon, 27 Sep 2021 18:33:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 18:33:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 18:33:16 +0800
Message-ID: <03494ad08689e43358d554bbc48936118a63fd45.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
From: Trevor Wu <trevor.wu@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Date: Mon, 27 Sep 2021 18:33:16 +0800
In-Reply-To: <c34d03ff-f349-724e-0dcf-7893f3622cd9@linux.intel.com>
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
 <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
 <4d703c5f7cf27ddc8b9886b111ffeeba0c4aa08b.camel@mediatek.com>
 <1d7fe7455a054819daf05d41ab3658afdc1caced.camel@mediatek.com>
 <c34d03ff-f349-724e-0dcf-7893f3622cd9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 2021-09-24 at 09:46 -0500, Pierre-Louis Bossart wrote:
> > > > > +/* Module information */
> > > > > +MODULE_DESCRIPTION("MT8195-MT6359-RT1011-RT5682 ALSA SoC
> > > > > machine
> > > > > driver");
> > > > > +MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
> > > > > +MODULE_LICENSE("GPL v2");
> > > > 
> > > > "GPL" is enough
> > > > 
> > > 
> > > I see many projects use GPL v2 here, and all mediatek projects
> > > use
> > > GPL
> > > v2, too.
> > > I'm not sure which one is better.
> > > Do I need to modify this?
> 
> See
> 
https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/license-rules.html?highlight=module_license*id1__;Iw!!CTRNKA9wMg0ARbw!0xwqsodizM7jFI4lwpT7_h2bk6xHtdNb32YDo2lneZ9u-cs5hAqqdqTci89qK8FwLg$
>  
> 
> Loadable kernel modules also require a MODULE_LICENSE() tag. This tag
> is
> neither a replacement for proper source code license information
> (SPDX-License-Identifier) nor in any way relevant for expressing or
> determining the exact license under which the source code of the
> module
> is provided.
> 
> “GPL”
> 
> Module is licensed under GPL version 2. This does not express any
> distinction between GPL-2.0-only or GPL-2.0-or-later. The exact
> license
> information can only be determined via the license information in the
> corresponding source files.
> 
> “GPL v2”
> 
> Same as “GPL”. It exists for historic reasons.
> 
> So "GPL v2" is not incorrect but for new contributions you might as
> well
> use the recommended tag.


Got it.
Thanks for your detailed explanation.
I will correct it in V2.

Trevor

