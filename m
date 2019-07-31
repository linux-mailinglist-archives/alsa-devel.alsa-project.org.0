Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D3C7D071
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 00:07:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C6C1696;
	Thu,  1 Aug 2019 00:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C6C1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564610826;
	bh=fM5hjqXUG2/o8x3WKUjcBRF5k/hRkcinLZHDSI3IqY4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BipjIod27miKOkH7B5V+c8dFA/TZdJ5cMk9leeQIv0posAClp+pJ17gS1TC/ox/jy
	 H9YCnInSMdJuU0XyrgkMyXWi2NPJVgBxIObP8prFDju8Gs4/ng4Xlw89xrnlxKBw0V
	 uOyp6zkzZpGFIyxrhpvZ+nrWPKWqq5twlUp/vhtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7049F80483;
	Thu,  1 Aug 2019 00:05:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734BCF80483; Thu,  1 Aug 2019 00:01:48 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A81FDF800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 23:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A81FDF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dAQCdVcq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/tOdg0rARIHNKt8myQdNk7juboEm6U9R00/FeIUiBE=; b=dAQCdVcqawi/p92YlttDZTR93
 BKyG7tTLWgF7ROCBKJ78mPeMReOpPz03DvX3MgsE3fL4jZKpXbSgEfnsqgHzMIJoSh2RNJNUt/7Vs
 W4pmxcdPzOCef23B1cmjFfttX03YC386eRlZje3tRqBKZnkd81Qs+16ww3Bey4vn/dVho=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hswZ4-0003OG-Ci; Wed, 31 Jul 2019 21:55:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1A3322742C6C; Wed, 31 Jul 2019 22:55:17 +0100 (BST)
Date: Wed, 31 Jul 2019 22:55:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190731215516.GM4369@sirena.org.uk>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <20190731141734.1fa9ce64@lwn.net>
 <20190731202007.GI4369@sirena.org.uk>
 <20190731172613.32d65ad8@coco.lan>
 <20190731203712.GJ4369@sirena.org.uk>
 <20190731182729.01c98cd3@coco.lan>
MIME-Version: 1.0
In-Reply-To: <20190731182729.01c98cd3@coco.lan>
X-Cookie: FEELINGS are cascading over me!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 alsa-devel@alsa-project.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-cifs@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, samba-technical@lists.samba.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, Steve French <sfrench@samba.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/6] ReST conversion patches not applied yet
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
Content-Type: multipart/mixed; boundary="===============7870761250783783578=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7870761250783783578==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iKKZt69u2Wx/rspf"
Content-Disposition: inline


--iKKZt69u2Wx/rspf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 06:27:29PM -0300, Mauro Carvalho Chehab wrote:

> Meanwhile, if someone needs something that it is at the wrong book, he
> can just use some search tool to seek what he needs, no matter on
> what book the relevant information is stored.

OTOH it might be weird for the intended audience of the book.

> Mark Brown <broonie@kernel.org> escreveu:

> > I don't know if it makes sense to have an embedded developer's
> > manual as well?

> Yeah, that's a good question.=20

> Jon is planning todo a documentation track at LPC. One of the things
> that should be discussed, IMO, is how we'll organize the books.

I'll be at Plumbers, not sure what the schedule's looking like yet
though.

--iKKZt69u2Wx/rspf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1CDkQACgkQJNaLcl1U
h9DmyQf8CbO6RT3vDVCTbWB0f/yKJ/A87r+D9XnXG94SH0Vqj3KAl/HFsPpl4gyU
1t9Uo9ZtFC8lSFh29z5fxpIzNkfsanBjnTrJS1lxOvU+DgmoTfXV5+2xa3rel1E0
oOzMumEUJLWQmAQIaSzObUMvLTHaHZXE9UwveI9WkjfE0k7lsrK4vKzotxGDUk1a
6B/LdVb+NH3ME369z6GL2hpH6SkNc0jCRYj4PcGud8PTKBqHim7kBI3AeE51lFUV
Dsr7zD6gH+cbj/GXdXApIDJvlR8bH6LLM/dakss84cM6CvJoD/pd4z9fn2kmUkVY
5tMO7f2i3x9slM6yQ78bDwGSrn8XIg==
=1tp/
-----END PGP SIGNATURE-----

--iKKZt69u2Wx/rspf--

--===============7870761250783783578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7870761250783783578==--
