Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A741268EA6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 16:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C699416B5;
	Mon, 14 Sep 2020 16:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C699416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600095521;
	bh=KWJqdkCZgyPNohCJGNbpJs+BDsJjwqiEDY4HQiidrKA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdjmUOdqCs9RyTf7Id6a9fAcFsZR6qqXowh/gbBE3umP96ao2dio4+kCtgtAElwi2
	 W7elpGrZFoDEcfEN/DCEKtvPf3nUbAR7y2oWlg+skVB2LdGQZxffMPrlSwnwffrQV1
	 fAu64T3f7o1S4An8desRV9JFU06E5v+Xnszhwm9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17F50F801F7;
	Mon, 14 Sep 2020 16:56:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 874CAF801F7; Mon, 14 Sep 2020 16:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF1CF80150
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 16:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF1CF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nMgC1upo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4152206BE;
 Mon, 14 Sep 2020 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600095355;
 bh=KWJqdkCZgyPNohCJGNbpJs+BDsJjwqiEDY4HQiidrKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nMgC1upoTFCiy5eHK/tlQaqhKy3LYIebNGb4AsZoIG0TZg+BAQvAmGQSGZG+lYuJj
 R1W9ZAwpOQPRg47m0w8k0XP4gtIL96YXA57/PFPOVgY9yPKoaZryyww5EY6CqzBE6a
 nWbqPjP5tT8Lapr348vslBaMpk9/fJh09rj592pg=
Date: Mon, 14 Sep 2020 15:55:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCH] ASoC: tas6424: disable regulators when probe error
Message-ID: <20200914145506.GF4821@sirena.org.uk>
References: <20200912023151.213930-1-chanho61.park@samsung.com>
 <20200914112709.GA4821@sirena.org.uk>
 <CAPTzV144n2z--Us6OpK-FKb64Bsz+x+CQu1HiBDr2XHETQmTvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <CAPTzV144n2z--Us6OpK-FKb64Bsz+x+CQu1HiBDr2XHETQmTvw@mail.gmail.com>
X-Cookie: Disc space -- the final frontier!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Chanho Park <chanho61.park@samsung.com>,
 dannenberg@ti.com
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


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2020 at 11:52:15PM +0900, Chanho Park wrote:
> On Mon, Sep 14, 2020 at 8:27 PM Mark Brown <broonie@kernel.org> wrote:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information
> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative (it often is
> > for search engines if nothing else) then it's usually better to pull out
> > the relevant sections.

> Thanks for your suggestion.
> I'll respin this patch without the call stack messages.

It's fine, I've already applied it - just please bear this in mind for
future things.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9fhEkACgkQJNaLcl1U
h9AtNQf9HgxmzZxTVQlfjBNeFM5yBqURDHqgtUJbisZOOpjn+VX48uJl8byD0z4I
6IEUlXwCEAg4WXDF7PgnKXmG3hkmLCDfYkJtkcU2qjgNgDxDsa59javXplzGs+oV
a8chwo357spK9SogK4HAHe2nizTi3w5g9S29X70i4bIStGAbZOAcAlAT1JgCA09W
Mv7H2gmhxr8cffv+OQ31/Jy/PbeIc0zEgXDEZsrGi/zE5mcKdVelPUf7PnO20zra
zJU0mDXZogBMQCrTXPSr+qCjhUGPVAHsk/Pxa9PoymvJ/6e2EYUehu/VcHXdD6UR
R6HSvX6mo5dJtvQptcF2oqjNnaKXJg==
=s88B
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
