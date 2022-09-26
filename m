Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5B5EB1CB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 22:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA363825;
	Mon, 26 Sep 2022 22:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA363825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664222738;
	bh=kzU5DU1AtULYdbeKDY+niAIvqzZGg8SW5S0JcxxY8Bc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+8qaNDGNfGPKZF8d+ewt8IudAPJwwl1YqNeBICEfZarpnw/Ogw9wU32T/otjH7LG
	 zWXwSe09cEzo250GK10iMy5ahSaZc2qmoqfiF+mH9AdcjKUwQzuepMcprDsJhcSo24
	 zS7NROkjVfN9mK/ddWetEJ2g5QRph8LHqsZCcohs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 128E5F802BE;
	Mon, 26 Sep 2022 22:04:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9A93F8027D; Mon, 26 Sep 2022 22:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59868F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 22:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59868F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="P88uiuSD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=BO41jb632AO2Bc9BLgoCYD5efImi2YwyYT9pGgQE7og=; b=P8
 8uiuSD2+ubN4vwqv6s1SPc9Rxq53k4mdI4L3mMk6z78YdQVeiwmkVixTzfuDkJsbnNfd5DQudJiF6
 TF5XCRN/T1P63gzgMhkJAnCjshmQEvssaPnVBRe3I7e6Rt0N/nyyuSAUXlrd0CkA4Aj40A0XZmzkP
 4+eGFSHxDsICwtc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ocuKz-000L1E-80; Mon, 26 Sep 2022 22:04:21 +0200
Date: Mon, 26 Sep 2022 22:04:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: kirkwood: enable Kirkwood driver for Armada
 38x platforms
Message-ID: <YzIFxWq7Kt0SudLz@lunn.ch>
References: <20220920132648.2008-1-pali@kernel.org>
 <20220920132648.2008-2-pali@kernel.org>
 <20220926194832.GA2668987-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926194832.GA2668987-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

On Mon, Sep 26, 2022 at 02:48:32PM -0500, Rob Herring wrote:
> On Tue, Sep 20, 2022 at 03:26:44PM +0200, Pali Rohár wrote:
> > From: Marcin Wojtas <mw@semihalf.com>
> > 
> > The audio unit of Marvell Armada38x SoC is similar to the ones comprised by
> > other Marvell SoCs (Kirkwood, Dove and Armada 370). Therefore KW audio
> > driver can be used to support it and this commit adds new compatible string
> > to identify Armada 38x variant.
> > 
> > Two new memory regions are added: first one for PLL configuration and
> > the second one for choosing one of audio I/O modes (I2S or S/PDIF).
> > For the latter purpose a new optional DT property is added ('spdif-mode').
> > 
> > kirkwood-i2s driver is extended by adding a new init function for Armada
> > 38x flavor and also a routine that enables PLL output (i.e. MCLK)
> > configuration.
> > 
> > Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> > Tested-by: Star_Automation <star@marvell.com>
> > Reviewed-by: Nadav Haklai <nadavh@marvell.com>
> > Reviewed-by: Lior Amsalem <alior@marvell.com>
> > Tested-by: Lior Amsalem <alior@marvell.com>
> > Signed-off-by: Hezi Shahmoon <hezi@marvell.com>
> > Reviewed-by: Neta Zur Hershkovits <neta@marvell.com>
> > [pali: Fix support for pre-38x SoCs]
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  .../devicetree/bindings/sound/mvebu-audio.txt |  14 +-
> >  sound/soc/kirkwood/kirkwood-i2s.c             | 136 +++++++++++++++++-
> >  sound/soc/kirkwood/kirkwood.h                 |   2 +
> >  3 files changed, 149 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mvebu-audio.txt b/Documentation/devicetree/bindings/sound/mvebu-audio.txt
> > index cb8c07c81ce4..4f5dec5cb3c2 100644
> > --- a/Documentation/devicetree/bindings/sound/mvebu-audio.txt
> > +++ b/Documentation/devicetree/bindings/sound/mvebu-audio.txt
> > @@ -6,9 +6,14 @@ Required properties:
> >    "marvell,kirkwood-audio" for Kirkwood platforms
> >    "marvell,dove-audio" for Dove platforms
> >    "marvell,armada370-audio" for Armada 370 platforms
> > +  "marvell,armada-380-audio" for Armada 38x platforms
> 
> Perhaps be consistent with the 370 string above it.

Hi Rob

That was something i also considered. But actually, all 380
compatibles use armada-380-FOOBAR. So this is inconsistent with
armada370-audio, but consistent with armada-380 in general.

	 Andrew
