Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B57A02E3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 13:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDA6384C;
	Thu, 14 Sep 2023 13:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDA6384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694691804;
	bh=2uxrJxwYAB7KQpEcYwTSxbHEbSchGWMf1R2ISLP87Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/WuYBwqvOnaWKXU0f6Zb7NkW3ONQkN2NK7h8WX3iiAimeGwKQN+wErWrVNdgoHP1
	 6kbTdMBARXGbVy2J2CTXRszUHAzRtZdVDag026y0tTBfzX4bTDxKjlpoNbSzLQv+jr
	 b7kx6UVmFJGTWDT7OSsWrewabesPqTmX12hXLHQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 798E9F80431; Thu, 14 Sep 2023 13:42:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E702AF80246;
	Thu, 14 Sep 2023 13:42:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7063DF80425; Thu, 14 Sep 2023 13:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCEC5F80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 13:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCEC5F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BInpl9z9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36B9B61D4C;
	Thu, 14 Sep 2023 11:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102EBC433C8;
	Thu, 14 Sep 2023 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694691736;
	bh=2uxrJxwYAB7KQpEcYwTSxbHEbSchGWMf1R2ISLP87Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BInpl9z9qTMufVz3uWoJichhjcN21keXh0QUv8oEyIcAAuY1iaRre/Cw/+fw4EggI
	 JlugdkcCjOfTfmBx2m1JL8zyn0DI7iRJkplFpOhI7ekzpjsoZuiPzo7DuJtT6pwXup
	 Y126sC25PEiW1+0BEasFAwi++PQKL/0QW50TMBKYtTTd4ar9paL02K8OYjSn7SjoxA
	 Esaae7EjbfotcBGZPg2RzB9rxeSZvmHr4ZSOpkY04x4/xS5F2fFpiK3iYnCt85EcF+
	 DBy50YYtquXGubPBRzGOEeRYTbgAgcK+D2g7DFq1w+bzDxCytB/gS1ySxPQWeK1Y4o
	 orb6XFO5r8gLg==
Date: Thu, 14 Sep 2023 12:42:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Myunguk Kim <mwkim@gaonchips.com>, alsa-devel@alsa-project.org,
	fido_max@inbox.ru, kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz,
	tiwai@suse.com, xingyu.wu@starfivetech.com
Subject: Re: [PATCH] [v2] ASoC: dwc: fix typo in comment
Message-ID: <5a74a371-c447-4fc6-abf1-08514de8fc00@sirena.org.uk>
References: <64683b6c-1e31-4037-a47d-b8a19ea77c72@sirena.org.uk>
 <20230914005633.2423696-1-mwkim@gaonchips.com>
 <20230914063248.rquitqthmddgm5oa@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJAlP+HmLks31y3M"
Content-Disposition: inline
In-Reply-To: <20230914063248.rquitqthmddgm5oa@pengutronix.de>
X-Cookie: Do clones have navels?
Message-ID-Hash: 7TNJKJTUHURV3CL7OMJMGLRLMKDBMFZZ
X-Message-ID-Hash: 7TNJKJTUHURV3CL7OMJMGLRLMKDBMFZZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TNJKJTUHURV3CL7OMJMGLRLMKDBMFZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sJAlP+HmLks31y3M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 08:32:48AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Sep 14, 2023 at 09:56:34AM +0900, Myunguk Kim wrote:
> > > The patch is obviously corrupted, the { there should be on the prior
> > > line and even fixing that by hand there appear to be some other issue=
s.

> > The patch file should have been attached as shown below.=20
> > Is there a problem with my git send-email?

> > +		/* Error Handling: RX */
> >  		if (isr[i] & ISR_RXFO)=20
> > { 			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=3D%d)\n", i);

> FTR: I get this mail directly (so no mailing list server involved), and
> the patch is mangled in the same way as broonie pointed out in his mail
> earlier in this thread.

Right, same here.  I don't know where the problem might be, it's not a
pattern I've seen before.

--sJAlP+HmLks31y3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUC8ZEACgkQJNaLcl1U
h9CjCQf/R7AX12nMWEuy7dcBdyq8lqjAH+lOvlwKwaNdkyTBfTTHfSot/QOLxRJn
SBHOAt/ojIWZU+voPcU6gunCJJAzaF7lKaSvm+s8of3RrcEdi3elvNjQfnKVYqNp
TK5d9rTfWIy9uwAh1qOTeq3wal5KzDFcUeqeshrh/RRG8Kgx8w9asECAcP9fblR1
qYgX3ZA86rjQdcDyyD+k8zhDgSDqh/mfO+62RnkWK43p/+ng1i1XcR2pQz00XGGW
3WhVWqmU3KrtDAW1jZHpecX8cbCgA+3btmYFqhSqOXtQXBgX5jLOHMVKv7c55x/S
gYikAxrevsOsfn/+ZlnEz4cNoKn2GQ==
=r6i2
-----END PGP SIGNATURE-----

--sJAlP+HmLks31y3M--
