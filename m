Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C4509FD1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 14:41:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECE9E1902;
	Thu, 21 Apr 2022 14:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECE9E1902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650544860;
	bh=o11R5hwjSfUkooG6aTnJOb4+mrujki8srLF/y/Ayj5w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z11UU+ahmI89RMB0Glib9Q/2Ss9hGqMLxjJXCta0qKK/i4XyVR46ZgVVFsY4J43pE
	 5K6MrM0D7k/1OP0tEjYux0S0aKAqmb3Z2RoOJ9bFC0Of1ikBtdJGj0/jhBbDGTFI5o
	 y2SFSyHKUk93/ay3SzbrOwzXRJP3zyf990JffS5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8235BF804F1;
	Thu, 21 Apr 2022 14:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D55F804DA; Thu, 21 Apr 2022 14:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D8C7F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D8C7F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JYJkQkKw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EF934CE21D8;
 Thu, 21 Apr 2022 12:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0BAC385A5;
 Thu, 21 Apr 2022 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544800;
 bh=o11R5hwjSfUkooG6aTnJOb4+mrujki8srLF/y/Ayj5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYJkQkKwoTyGa0ulPg1rE265+urp7kMJQvj9//k4VdiHqGOUDT83PQM/6vihrqhZf
 SehnMN18VT2D2JqWpMaenqmwkYqNdJV7DpUFN7RXsgqoNbXi/GL86GN9aQ5DlCBaVu
 vLW8OKLXmMi8gbbJu1rrtSCiIlRMknpmBSkq5c0qV4SAdHuGeQxmu19REDBUw86l3m
 Upntzd4ub0sAYiKDn2lKkSReoqY8s0WrG4b71Ptl78lghUphpXFgVJ+5fd7iUOMDLM
 2zIpVe9u9izJyNDTAIQ7Zy3/1l6fch60A9Yl1ipwTPgZxBgI9bVrTc3jgqyCf3WesD
 wSz1RQ0xicC2w==
Date: Thu, 21 Apr 2022 13:39:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] selftests: alsa: Start validating control names
Message-ID: <YmFQm8xtgjMurBB0@sirena.org.uk>
References: <20220420203320.3035329-1-broonie@kernel.org>
 <s5h8rryx4c6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x95ZG5vdA0TpYUkG"
Content-Disposition: inline
In-Reply-To: <s5h8rryx4c6.wl-tiwai@suse.de>
X-Cookie: Two percent of zero is almost nothing.
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org
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


--x95ZG5vdA0TpYUkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 09:50:33AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > +		if (!strend(ctl->name, "Switch")) {
> > +			ksft_print_msg("%d.%d %s is a writeable boolean but not a Switch\n",
> > +				       ctl->card->card, ctl->elem, ctl->name);
> > +			name_ok = false;

> I'm afraid that this would hit too many when applying to the existing
> code; although the control name should be indeed with Switch suffix,
> we tend to allow without suffix for casual non-standard elements.

It wasn't looking too bad in my survey of cards I had to hand - the
writable check is there because of jacks, which does make sense since
you can't actually switch them.  Some of that is due to ASoC handling
this in the core though.

> But having the check would help for avoiding such a mistake for the
> future code, so it's fine to add this strict check, IMO.

Yeah, that's more the target here.

--x95ZG5vdA0TpYUkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhUJoACgkQJNaLcl1U
h9DhIQf+N389H3wgNXpD0bo1p+p0J6C/m3tiBfLE8K/+AMDSkJPsDEwmPzHlMHeN
gjCBVTb4m0bm1zikekh4e/zDNApl2zNCxKQGHM4kdRqKLBIkWqcwcnBVTV9Z33H3
1QDpFA//vZ9F8dQUCaoL/zVnnc+YijWS8bzvYHo4H1uVkBxHGzDPedVDf2NXklsN
Ga6WA7TxumkWMavyT0o2364P/XBNDq40XQhEn+Wo0UFN4JRpwNjKvPnn3FyqVyNe
aJ0EKmIL1SE1xesFyaurKJrNRPxl6e4V7ozcPMN//RAl3wMSp498ISf05D6oLk4S
2iEEiJv8kSpUHdHlOZ2z/3C8LENdlw==
=/U6j
-----END PGP SIGNATURE-----

--x95ZG5vdA0TpYUkG--
