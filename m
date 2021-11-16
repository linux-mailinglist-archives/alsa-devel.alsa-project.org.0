Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F24452E1A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 10:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 254311697;
	Tue, 16 Nov 2021 10:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 254311697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637055333;
	bh=QPLd/hj29+PVqi2UV4m46fdYojrevOREV5OAfaUcqHw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gwvZcpnZf6J3N4nWHtzi0DXTVbXuo48kVWxnWynR2hlw2yXkfew7kKXFpCEr2Q3At
	 dshWCmHfFDQDzUQ8AHVWC2sgCO26KNCsxo/o/I+mNj/XTlNCVLNhFTzmNfPu12ogbw
	 pUrLlAVaLs0U9VMv7DxwqHy/Pj+gEJ7pFKajjHkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D604F802C4;
	Tue, 16 Nov 2021 10:34:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95A8AF80272; Tue, 16 Nov 2021 10:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CF4F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 10:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CF4F800FA
X-UUID: 04329e55bd3541b3b2a8b663cb736d41-20211116
X-UUID: 04329e55bd3541b3b2a8b663cb736d41-20211116
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1937280426; Tue, 16 Nov 2021 17:33:49 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Nov 2021 17:33:48 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Nov 2021 17:33:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Nov 2021 17:33:48 +0800
Message-ID: <f915d1090abf2b6d188ce27068919a181828e463.camel@mediatek.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: YC Hung <yc.hung@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 16 Nov 2021 17:33:48 +0800
In-Reply-To: <4e876c89ee58cd1408511a34573005e3df359cd0.camel@mediatek.com>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
 <YYVQC7KLZx8oxdXT@sirena.org.uk>
 <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
 <YYVez/V9ocCXhYmg@sirena.org.uk>
 <4e876c89ee58cd1408511a34573005e3df359cd0.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org
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

On Mon, 2021-11-08 at 17:40 +0800, YC Hung wrote:
> Hi Mark,
> 
> I am YC Hung from Mediatek. Let me show our block diagram as the link
> below for the sound card which support SOF.
> 
> 
https://user-images.githubusercontent.com/62316/132476344-923dfe3a-5305-43e5-9fc8-c63d9ab2c58f.png
> In this sound card, there are two components , one is SOF based
> component and another is non-SOF based component(called Normal in the
> block).
> We want to reuse some BEs of Normal which can control Mediatek Audio
> Front End hardware power, clock , and DAI module and still keep some
> FEs(e.g. DPTX) then we can use it on the same sound card.
> Therefore, we use late_probe callback function
> "mt8195_mt6359_rt1019_rt5682_card_late_probe" to add route path from
> SOF widget to non-SOF BEs.
> For two patches https://github.com/thesofproject/linux/pull/3217 and 
> https://github.com/thesofproject/linux/pull/3236, we want to keep FEs
> of non-SOF components and can reuse them. Please let me know if I am
> not clear enough.Thanks.
> 
> On Fri, 2021-11-05 at 16:41 +0000, Mark Brown wrote:
> > On Fri, Nov 05, 2021 at 11:16:05AM -0500, Pierre-Louis Bossart
> > wrote:
> > > On 11/5/21 10:38 AM, Mark Brown wrote:
> > > > We shouldn't be requiring people to load completely different
> > > > drivers
> > > > based on software configuration, what if a system wants to
> > > > bypass
> > > > the
> > > > DSP in some but not all configurations?  Can we not just have
> > > > controls
> > > > allowing users to route round the DSP where appropriate?
> > > 
> > > It was my understanding the card relies on separate components
> > > - a SOF-based component to provide support for DSP-managed
> > > interfaces
> > > - a 'non-SOF' component for 'regular' interfaces not handled by
> > > the
> > > DSP.
> > > this was the basis for the changes discussed in
> > > https://github.com/thesofproject/linux/pull/3217 and
> > > https://github.com/thesofproject/linux/pull/3236
> > 
> > So it's actually supposed to end up as two different cards which
> > can't
> > possibly be interlinked?  That doesn't seem to add up entirely
> > given
> > that there's stuff being moved out of the current card, and I
> > thought
> > these systems had a fairly comprehensive audio muxing capability.
> > Trevor, could you be a bit more specific about what's actually
> > going
> > on
> > here physically please?+++++++++
> > 

Hi Mark,

Is the reply from YC clear? Any suggestion would be appreciated. If you
need more information, please let us know. 

Additionally, it was my understanding you suggested that DSP routes
should be configurable in some ways, and we should not just add a new
driver for SOF in case we need to support some other interface
combinations in the future. If I'm wrong, please kindly correct me.

Thanks,
Trevor


