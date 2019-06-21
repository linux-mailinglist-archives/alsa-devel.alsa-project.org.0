Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14274EAD1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 16:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F5315E2;
	Fri, 21 Jun 2019 16:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F5315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561127725;
	bh=KAO4rFSnIVzLZacsfrvDC5ea4ELXFWhlweO5qUnsExs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaiPAg0rVDvC4kqYcyEQDIgScKGP8i0YBFnZAgunXSELAiKTS1SQWj7L96R+xS6YQ
	 93OatXSosuk3uB6HU0BNe+0+AfMhOwqi3vBmdFkbSlOf3dOXu61Jqz16Fb7NWGuLQs
	 ZolSzyQWoxTBDh59x+AYLe0UqENDYCnxOskJYEL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 326C2F896DA;
	Fri, 21 Jun 2019 16:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38820F8070D; Fri, 21 Jun 2019 16:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5903F8070D
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 16:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5903F8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G6A6WZOm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxG4OzKJll+CUOuLlcP/6L1BRl/sjRJOcnpnlIt2izg=; b=G6A6WZOmQTJlzMKdN63KDKI8R
 3j/1J1Y9dPK+PHFgwDlXca8WROH+SGyJriWhC2dbK4K2dylvXlrOyO7kAH4lxNDIh4r5vUTxd0yv4
 5JO/rJPyY6YClQAlrcZ7+J8OnWcW9ZOKxoQ3e2SseJiI45A1CRGKIDxLHQ/8VtHGbok7A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1heKZ4-0002ZU-0o; Fri, 21 Jun 2019 14:30:54 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 87D56440046; Fri, 21 Jun 2019 15:30:53 +0100 (BST)
Date: Fri, 21 Jun 2019 15:30:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Message-ID: <20190621143053.GH5316@sirena.org.uk>
References: <20190621113357.8264-1-broonie@kernel.org>
 <20190621113357.8264-2-broonie@kernel.org>
 <20190621132222.GB10459@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20190621132222.GB10459@kroah.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: dapm: Adapt for debugfs API
	change
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
Content-Type: multipart/mixed; boundary="===============2998356202950043939=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2998356202950043939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GyBFFrpYHGV4SYp0"
Content-Disposition: inline


--GyBFFrpYHGV4SYp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 03:22:22PM +0200, Greg KH wrote:
> On Fri, Jun 21, 2019 at 12:33:57PM +0100, Mark Brown wrote:

> >  	struct dentry *d;
> > =20
> > -	if (!parent)
> > +	if (!parent || IS_ERR(parent))
> >  		return;

> How can parent be NULL?

It was more effort than it was worth to check to see if it could
actually be NULL through default initialization or something and fix it
than just not delete the check so I just left it there.  I'll probably
go back and clean it up more thorougly at some point.

> I am trying to make it so that debugfs doesn't return anything for when
> a file is created.  Now if that will ever be possible or not, I don't
> know, but I am pretty close in one of the branches in my driver-core
> tree...

You mentioned this in a mail last week, I then replied pointing out that
this is not helpful as it reduces the robustness and quality of our
debugging tools and you then did not respond.  This is a view I still
hold and in any case debugfs as it stands (and was in the kernel
versions since this was broken) is still capable of reporting errors so
we should fix that.

--GyBFFrpYHGV4SYp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0M6hwACgkQJNaLcl1U
h9CVfgf/Zvf50vTJSnV4Ifjlc60r5s/W7eTpQGayjvn9PD0gkjA4+G5hVAEjeV5u
qRvkDMZwgld9zIa08UvfBb7J7Cr+HV5RgQGnYBjcwXJwQ2bDecBUUhXjlNgcMRos
NwA99IiRefpwluCcD4Tc7jom/y/XyuIh07rvZyvGcrObNVytaRWToAjumnIT/tM0
DINLjqjXAHQNeNs3cpNea2HvjTxk524bEMm075hc87KWaqYZqfjL+PNyJthE9Psc
tVee93MX3iLcNfxeJe0XXhKZ4fNJh1KgREynpzNfKm3j+EPGS75BR66uimNtoS6J
4LLlg1ZRASBNPaIeHXVCk1u9MCpVGQ==
=27li
-----END PGP SIGNATURE-----

--GyBFFrpYHGV4SYp0--

--===============2998356202950043939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2998356202950043939==--
