Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8F5BE751
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFFE3E11;
	Tue, 20 Sep 2022 15:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFFE3E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663681285;
	bh=2ApLnDmHDBZajX1ILj2COyoYq0MeNXPKUre3XpEY7zY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i6OxXgK7uZ9e1pENuD48XUjrQ0/m7sA04SXvh2DvadwUeVRt0c7uTi1HOIeQoN1Oe
	 hJgZ+59tr4CAQmFekotKEoYPymyMPSQ569gDG5ORG+JuL1nTSyn3ti1zI4Ys1v6fSM
	 7mnU3Fy/FQMwG1YPVEzE8e7CfMnvKVKi5ySV5PpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73472F80171;
	Tue, 20 Sep 2022 15:40:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2094FF80153; Tue, 20 Sep 2022 15:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32775F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32775F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="OD2gC41o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=uHsVIKwUI5dRJ3ABvK5Yix+1T5ZMOgqYYRMZklF24hY=; b=OD
 2gC41oRuuTQmUQYEDNo11mnHE4sllCw6danUWtGcNVmtXlRT712OV48GfTj+V7GM5H4srAEVsm3XG
 9BiIHPH+789MjfFvPlx8alNy9hsIcKt6yDh9kM15D5tso9GJhh2cKtFwpvqtTjVN0NdzNduAVbQ9p
 jHU+Z+NqvZJ+oSs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oadU6-00HH6z-ON; Tue, 20 Sep 2022 15:40:22 +0200
Date: Tue, 20 Sep 2022 15:40:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 2/5] ARM: mvebu: add audio I2S controller to Armada 38x
 Device Tree
Message-ID: <YynCxr4VKGeShFGR@lunn.ch>
References: <20220920132648.2008-1-pali@kernel.org>
 <20220920132648.2008-3-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920132648.2008-3-pali@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marcin Wojtas <mw@semihalf.com>,
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

On Tue, Sep 20, 2022 at 03:26:45PM +0200, Pali Rohár wrote:
> From: Marcin Wojtas <mw@semihalf.com>
> 
> This commit adds the description of the I2S controller to the Marvell
> Armada 38x SoC's Device Tree, as well as its pin configuration.
> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> Reviewed-by: Nadav Haklai <nadavh@marvell.com>
> Tested-by: Nadav Haklai <nadavh@marvell.com>
> Tested-by: Lior Amsalem <alior@marvell.com>
> [pali: Fix i2s-pins name]
> Signed-off-by: Pali Rohár <pali@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
