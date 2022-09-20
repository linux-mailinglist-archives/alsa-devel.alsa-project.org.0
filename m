Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33E5BE762
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC62AE9;
	Tue, 20 Sep 2022 15:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC62AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663681360;
	bh=DHaf9FpceiDLulpNZF6bIGbxfiQ4dDY19O2wzq9Rg8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHATAb81wUoLbuJAsbr9LmMZQBrCOGrlwdIc5yk8xjwqDgGarJLdqfRVWUGkptGW/
	 0MNcPsyPWCZWoodfnY+dydJldisN2ZUk1UUpcL6Nhbqlewxy1ftyrxN/hYlWuEOkHF
	 2406IMf4q57o0mCTIYtlgdNVLEkSPaHZDmFcA3Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01E0BF8012B;
	Tue, 20 Sep 2022 15:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748FEF80155; Tue, 20 Sep 2022 15:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76A9F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76A9F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="hc8LRCQw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Jh8iwPVSdo9zSHEgLJ83LwqnnxxcNEZPN4V8Cx7jJ6Y=; b=hc
 8LRCQwSgf0dJqaZ984Brtlu5wE0B35U8DK/RAr6QnuW/H0y29JwbffuxkgMOAeoPxGva/YQnAVGx1
 XLK3Lm7Q6lRs6Frgqq2aX8Vs+qW1Cldq4n90p8bu7FXeSJZ8AXa1OqIomGJ4svjBWyCHWKpntvIfg
 /RWFf/CiMSy5EAA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oadV7-00HH7d-3C; Tue, 20 Sep 2022 15:41:25 +0200
Date: Tue, 20 Sep 2022 15:41:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 3/5] ARM: mvebu: add audio support to Armada 385 DB
Message-ID: <YynDBU/onOM8vzLr@lunn.ch>
References: <20220920132648.2008-1-pali@kernel.org>
 <20220920132648.2008-4-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920132648.2008-4-pali@kernel.org>
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

On Tue, Sep 20, 2022 at 03:26:46PM +0200, Pali Rohár wrote:
> From: Marcin Wojtas <mw@semihalf.com>
> 
> This commit adds the necessary Device Tree information to enable
> audio support on the Armada 385 DB platform. In details it:
> 
>  * Instantiates the CS42L51 audio codec on the I2C0 bus
> 
>  * Adds simple-card DT binding for audio on Armada 385 DB
> 
>  * Adds description for both analog I2S and S/PDIF I/O
> 
>  * Disabled by default
> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> Signed-off-by: Nadav Haklai <nadavh@marvell.com>
> Tested-by: Star_Automation <star@marvell.com>
> Tested-by: Lior Amsalem <alior@marvell.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
