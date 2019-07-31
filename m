Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E27CED7
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 22:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43CE616BB;
	Wed, 31 Jul 2019 22:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43CE616BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564605587;
	bh=hKZQikPvKjnHPu5D+jJg3ljanxd27qn4VSOfGbxCMDE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dp0oLQYA4VykdPuXn5sBjX68Pstmcbz93x4dRyEeGWNv7EPOljB50CKck2Jsqsy2F
	 GNd8kf5LHMYpHsxnhogzaUDjcBgec+ooXY61Kf/qgu0DYir0zvwh/bdXZG22po4bfo
	 mGYsa821v1ExfFWoXRqj7EzF3eGGd+sM3wGixIrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B502F8048E;
	Wed, 31 Jul 2019 22:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7738EF8048E; Wed, 31 Jul 2019 22:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B474F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B474F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Fo4hgxN3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8zgVGeJDIycQcvkIadKAWE4jNOD7aBA1sv5eo5/l2Q=; b=Fo4hgxN3HVjwMzMGY2TUs4nJk
 cYu5gBnxRALeeciuagRuGTeUesgj1mimsQykYiW1FAdV1oM3wAnq9yRimGHqQysqyzNi1rQ3ACukp
 vYGcU2hR5CrMFdGLmmtsrnirZeyRYdOWP3DBo1fOOy+Ovre+VB8+uoagIh7GPnYlxLWEk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsvLV-0003HI-JJ; Wed, 31 Jul 2019 20:37:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C34E02742C99; Wed, 31 Jul 2019 21:37:12 +0100 (BST)
Date: Wed, 31 Jul 2019 21:37:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190731203712.GJ4369@sirena.org.uk>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <20190731141734.1fa9ce64@lwn.net>
 <20190731202007.GI4369@sirena.org.uk>
 <20190731172613.32d65ad8@coco.lan>
MIME-Version: 1.0
In-Reply-To: <20190731172613.32d65ad8@coco.lan>
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
Content-Type: multipart/mixed; boundary="===============0169857142416864649=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0169857142416864649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XigHxYirkHk2Kxsx"
Content-Disposition: inline


--XigHxYirkHk2Kxsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2019 at 05:26:13PM -0300, Mauro Carvalho Chehab wrote:
> Mark Brown <broonie@kernel.org> escreveu:

> > There were outstanding questions about where it was going to get moved
> > to but if I read the diff correctly it looks like it didn't actually get
> > moved in the end?

> Yeah, it doesn't have the move. My understanding from our discussions
> is that we didn't reach a conclusion.

Yes, that was my understanding too which was why I was surprised to see
this going in.  This is OK then, I'd have acked it.

> In any case, I can send a separate patch with the move part once
> we reach an agreement about what's the best way to proceed (or you
> can do it directly, if you prefer so).

I'm not likely to do anything without someone sending patches, I'm not
clear on the utility of the move with the current division of the
manuals.  I don't know if it makes sense to have an embedded developer's
manual as well?

--XigHxYirkHk2Kxsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1B+/cACgkQJNaLcl1U
h9Ccawf2NvrLW0ujC5HwkDxagYC2dfnUGm4OOyP/LcS7ufD9vxwdAh08IDJFyHJv
4skkK8AdqWOxNms4e9NRiQE51vul7GMBtbp3YezYEiaaB3tMTrWe2rHSEp10OQmH
5WnnpB7KKnUS3UBTwvFRzI1mGWz+klXpzy50z3hsX9UXUArVoqyDRtSY0YDF3+7k
UNhXw0y2taeDMGRzZnOTDxQkejK13T42Oo79xbzylHww8x1vVqV2s4xLTqn2zaN4
W0DIoJIGec2Ewe6JPUio9xvsURtWmWOet6jFLRZO9oiO6uJqrvQde50F6siwwFgY
JMTn2OFfPMPUZVF4ugqAE7qxQaHM
=etK7
-----END PGP SIGNATURE-----

--XigHxYirkHk2Kxsx--

--===============0169857142416864649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0169857142416864649==--
