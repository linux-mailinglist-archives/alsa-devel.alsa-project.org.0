Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B3662DAA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 18:52:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B9DB3B9;
	Mon,  9 Jan 2023 18:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B9DB3B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673286737;
	bh=dD5zyjUpcSjxdfSOoDi4tqRdQQDOfqTckte6LWUUgDU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fuy6hcBinGzj2LaDJQB/004zE0uBkAV5ZtgHxOBB+NmVO3+F32AZHvu+BZnw/lzAL
	 4rfNvtvrNzQlnuulAINc+6wKxamSy8X77Zqs7ybW/Xeq8OMFAqplMsw5HJGr+Uzmx+
	 ZgT8I65s9RONIGiP3y6rY3ERo+Ysku+x5uPk5wLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F24F80425;
	Mon,  9 Jan 2023 18:51:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5ABF802BE; Mon,  9 Jan 2023 18:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-12.comm2000.it (smtp-out-12.comm2000.it [212.97.32.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAE49F800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 18:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE49F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=AJd02d6q
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id 1F18ABA1A04;
 Mon,  9 Jan 2023 18:51:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1673286672;
 bh=dD5zyjUpcSjxdfSOoDi4tqRdQQDOfqTckte6LWUUgDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=AJd02d6qIQWKVr+AaeOFCUH3CDag0YRBSBasK6LL2vdHSuUazn2HxP8TeZCaDQHpp
 Xy6W09wsYxZxlIgnMGMP3eGUBUskfNS3FjqxRXBcTayqMmwBJ2YCSVqM9iOKnZES6h
 ekopLOE4ABIpqbglEch72tlNQkkJfTFrMUAPKV8AN3IK5iUvjeHdxMmKsHAAKcn5rB
 zQWNQMWmJaOd7p7XLYy72EKcraPrk1fpYH/iZQwQi8keegNTd2XLx7ZTifHFxswyxl
 kPL9fLnx0VkTosvvcUyy/ynuY8m+jlfEH07cd+8pjGuF6GwALfaT3L637n6UNlEz1b
 ZcFQBAn874VOA==
Date: Mon, 9 Jan 2023 18:50:58 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/3] ASoC: nau8822: add speaker Bridge Tied Output
Message-ID: <Y7xUAgJKOlIz8QeF@francesco-nb.int.toradex.com>
References: <20230104140412.35575-1-francesco@dolcini.it>
 <167328294504.323147.3197941344180988086.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167328294504.323147.3197941344180988086.b4-ty@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Francesco Dolcini <francesco@dolcini.it>, wtli@nuvoton.com,
 Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Benjamin Marty <info@benjaminmarty.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jan 09, 2023 at 04:49:05PM +0000, Mark Brown wrote:
> On Wed, 04 Jan 2023 15:04:09 +0100, Francesco Dolcini wrote:
> > Add support for BTL (Bridge Tied Load) configuration to NAU8822 audio codec,
> > since this requires adding a new property to the binding convert it from
> > txt to yaml first.
> > 
> > v2:
> >  - added Krzysztof reviewed-by and acked-by
> >  - removed non-relevant information about SPI not being supported from binding document
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Hello Mark,
patch 2/3 was not applied, can you check? Let me know if this is because
of some mistake on my side.

$ git log --grep=nau8822 --author=toradex --oneline  kernel.org/broonie-sound/for-next
968b42069fe5 ASoC: nau8822: add speaker Bridge Tied Output configuration
76fa6279eff9 ASoC: dt-bindings: nau8822: convert to the dtschema

Francesco

> 
> Thanks!
> 
> [1/3] ASoC: dt-bindings: nau8822: convert to the dtschema
>       commit: 76fa6279eff931b43482f0bef5d65cdcf325de87
> [3/3] ASoC: nau8822: add speaker Bridge Tied Output configuration
>       commit: 968b42069fe5dab362b623c6b8a1565709a12f5b
