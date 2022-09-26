Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947BD5EB0F2
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 21:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 269EC826;
	Mon, 26 Sep 2022 21:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 269EC826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664219388;
	bh=t4QYZgnZxFyp+wdCzckiy3JAvO9yYcx1Bz8Lz04+XEY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTO8f4Pub0VTxe+RKn7c2b2ZMr/Gx3CtvZKwv6GwC7C6w9f0u+Jbx/91M0hzGcxC+
	 oMFUfCAqNFy6Rc6qskKDFlmRxk7wwQEqnr70YhNqJWIyHhsaWMZWpTEihoBAXGgMmo
	 7obhjzh4bIVv/CHx3i7yJuhOBh0NSsM4CwYSEoP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CC77F80115;
	Mon, 26 Sep 2022 21:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26533F8027D; Mon, 26 Sep 2022 21:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83983F80115
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 21:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83983F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="KDQSmdTD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Lagm1lgiVICpYYlD6spdCWdL8atz+TcE9arjcgZyXHI=; b=KD
 QSmdTDonZqdmlUzSf4l7Iwy6+XgxPWBUnsOZ0J58yO9TSMQxxGQlmCCJi+E5DBizSecOd0ZV4fOGU
 C4Qiq6hQ4zaXGaUq1MpLJOfHsYc6G3t3kCOPOJ6NPhstzSOxtrwApyahtLvaTNcj8JwqvywJ2nWNp
 lQOLVGqdNHRuNuU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1octSd-000KoL-Hu; Mon, 26 Sep 2022 21:08:11 +0200
Date: Mon, 26 Sep 2022 21:08:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2] ASoC: kirkwood: enable Kirkwood driver for Armada 38x
 platforms
Message-ID: <YzH4m2piUuPcYJmD@lunn.ch>
References: <20220920132648.2008-2-pali@kernel.org>
 <20220926110533.13475-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926110533.13475-1-pali@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marcin Wojtas <mw@semihalf.com>
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

On Mon, Sep 26, 2022 at 01:05:33PM +0200, Pali Rohár wrote:
> From: Marcin Wojtas <mw@semihalf.com>
> 
> The audio unit of Marvell Armada38x SoC is similar to the ones comprised by
> other Marvell SoCs (Kirkwood, Dove and Armada 370). Therefore KW audio
> driver can be used to support it and this commit adds new compatible string
> to identify Armada 38x variant.
> 
> Two new memory regions are added: first one for PLL configuration and
> the second one for choosing one of audio I/O modes (I2S or S/PDIF).
> For the latter purpose a new optional DT property is added ('spdif-mode').
> 
> kirkwood-i2s driver is extended by adding a new init function for Armada
> 38x flavor and also a routine that enables PLL output (i.e. MCLK)
> configuration.
> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> Tested-by: Star_Automation <star@marvell.com>
> Reviewed-by: Nadav Haklai <nadavh@marvell.com>
> Reviewed-by: Lior Amsalem <alior@marvell.com>
> Tested-by: Lior Amsalem <alior@marvell.com>
> Signed-off-by: Hezi Shahmoon <hezi@marvell.com>
> Reviewed-by: Neta Zur Hershkovits <neta@marvell.com>
> [pali: Fix support for pre-38x SoCs]
> Signed-off-by: Pali Rohár <pali@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
