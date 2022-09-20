Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A075BE768
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5AF163A;
	Tue, 20 Sep 2022 15:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5AF163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663681426;
	bh=JPZLHTYQzgwJduakLrB7QMULrToIsFjtTF81TH6oOD8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/2GG82wtkhys6HA95hAandGqZdX3DoGvqUvLiAp8vCIuiMqpn7zTFiKnJtyI/pM9
	 WGfGmp6DwyrmjaZVjO1BLYbYnctsAnRMLnH73N6RI0NBz9wSuJQQrdYG3ZVnq4FFzI
	 6Ad5Lx26oYAHnseadZy7UcyqAT6TXwCdgz9ss7ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C070F801D5;
	Tue, 20 Sep 2022 15:42:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D19D5F80171; Tue, 20 Sep 2022 15:42:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C43ABF80153
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C43ABF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch
 header.b="cKmvZfC7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=B3unqtJWhO/wUDuYGDX5kOF8pGY1t0D2oM+OXK5Xv34=; b=cK
 mvZfC79v+Dibgd83NjLLrqBzUyPM2UmO9odBl7skVTkGfOn+94fp6NOWBsDN9ubhxcUzB2/uYwfHK
 hHKMdli3+pgTZ+lxdeGBE8wotAXRmBZpBCby6BtbdcWS/zxW1FV/mYSACHmHHHlMigAlbtNGT4P3+
 6Zfjn5CUf6tu1OI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oadWN-00HH8a-4w; Tue, 20 Sep 2022 15:42:43 +0200
Date: Tue, 20 Sep 2022 15:42:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 5/5] ARM: dts: turris-omnia: Define S/PDIF audio card
Message-ID: <YynDU/MkGFLrsNdf@lunn.ch>
References: <20220920132648.2008-1-pali@kernel.org>
 <20220920132648.2008-6-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920132648.2008-6-pali@kernel.org>
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

On Tue, Sep 20, 2022 at 03:26:48PM +0200, Pali Rohár wrote:
> Turris Omnia has GPIO51 exported on pin header U16, which works in S/PDIF
> output mode. So define S/PDIF audio output card for this pin.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
