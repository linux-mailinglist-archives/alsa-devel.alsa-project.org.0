Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932B171BE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:37:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 846081823;
	Wed,  8 May 2019 08:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 846081823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557297432;
	bh=+4XhCLiBasft/KCeHeP2xF0hZPDS+a2xHLi+u/FNXNs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVA+9f4B/k80ALbSz+J15SyBBprl+Mw1DiBFWNg6Wd1fqzemQjYIbODZXmAHwX1dc
	 IczsPhM2Kc9S8By9mhbWJcFW4skj5gtkg+B9umFi9shixG5gQUwnKyIVMeRMoSR2tc
	 ibgpWy3NUkEzstcncpAUm70VYxkRiaFEUi7I5suY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82533F8970E;
	Wed,  8 May 2019 08:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 977E5F896FD; Wed,  8 May 2019 08:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25147F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25147F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eo4CINxu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYCNy7tkPY7Q7/D7L/X6WuduwJJrhyZwHhYAzjXd5sM=; b=eo4CINxuY5v3bG3LULC/w5Qmc
 Grs313C71BNmpRVgbFTGnz9pHbSO7fSixPkCbShlt5jrgNGt5yKUqwjpdUUchAc+ys5E/o23sR1us
 6I/spAkXxWgwHoIqx4uDOPzqk2C7X97BybbJM1IyYokgbgL85qpGfFhtxMzFyN9kFza5w=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOGBU-000795-Pm; Wed, 08 May 2019 06:36:09 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E0C2A44000C; Wed,  8 May 2019 07:35:58 +0100 (BST)
Date: Wed, 8 May 2019 15:35:58 +0900
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
Message-ID: <20190508063558.GM14916@sirena.org.uk>
References: <20190503230751.168403-1-fletcherw@chromium.org>
 <20190503230751.168403-2-fletcherw@chromium.org>
 <CAJ77E19K7ukNzvhOx1Jh_E6A69fqc6OMJ1aEgR6QjFmM0d=ePw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ77E19K7ukNzvhOx1Jh_E6A69fqc6OMJ1aEgR6QjFmM0d=ePw@mail.gmail.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Ben Zhang <benzh@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>
Subject: Re: [alsa-devel] [PATCH v4 1/3] ASoC: rt5677: allow multiple
 interrupt sources
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
Content-Type: multipart/mixed; boundary="===============6511382493090689180=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6511382493090689180==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yf+QnTYkcH7pT0Mu"
Content-Disposition: inline


--yf+QnTYkcH7pT0Mu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 02:10:26PM -0700, Curtis Malainey wrote:
> On Fri, May 3, 2019 at 4:10 PM Fletcher Woodruff <fletcherw@chromium.org>
> wrote:
>=20
> > From: Ben Zhang <benzh@chromium.org>
> >
> > This patch allows headphone plug detect and mic present
> > detect to be enabled at the same time. This patch implements
> > an irq_chip with irq_domain directly instead of using
> > regmap-irq, so that interrupt source line polarities can
> > be flipped to support irq sharing.
> >

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--yf+QnTYkcH7pT0Mu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSeM4ACgkQJNaLcl1U
h9BylAf+Nv/ilS/5+jTsgqLELyIU1qpJcPHRC012pUfUyxBH8YSDpyPfqOOCGXoI
O9V67lf67LEVCYsUXgSfpcALi084m38vQfXGJppyPniYWEczD90yZOkm2faA46o4
QKeDeVGTwtbZ5phTrqOx9YsBE8k8XfBmzcy3u1b0ZmHMUqAM1b33QO4rCFJs5iZD
at95vkcj9Adm092gyGgmcY32xIAMR2Y0CGlKAAGd9Gk77mtPL7gVhrPXGQu266Cb
XKrDI44ZX79Ob00wMMoJUaVKAAbGwcl71VOXQFpI5tnDgnV5jCq+1k+00b6xlwiC
sE+rE+1f4uGwLBJt04QQa8kW8dA0xA==
=mlaw
-----END PGP SIGNATURE-----

--yf+QnTYkcH7pT0Mu--

--===============6511382493090689180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6511382493090689180==--
