Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403469B8F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 21:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33241670;
	Mon, 15 Jul 2019 21:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33241670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563219634;
	bh=FEssGtf4SjNFsFYd/AXjO7jXv013VFXlODq5G6nkKOU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQCrLvvi7VVYj2QabJun/YWnHfThgDlcNXgS5T4W7CQYTZ+BA/4lND7AwViQN4/jo
	 HpRI95aMa3Dd9OvHWAaj8tNL+12ZLYX5mKvRj9dgFkvqP5X3J3Jbspc19BNYQ1OPt0
	 fhBuvlgc9brbGtxe11wIaAeJvuJd+JEPdh6nJNZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08752F80369;
	Mon, 15 Jul 2019 21:38:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12C54F80367; Mon, 15 Jul 2019 21:38:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D792CF800C6
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 21:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D792CF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xhH0p1EX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uEtSh3X6xQ1lITiuNz9x5IdXNtqfNQ17vMJkyrNs1LY=; b=xhH0p1EXjiOkPBx2ciKgSWD71
 u82dCi2hbyODuxO1uD0AIUppV8S/kASktp6GzA0pvZVBIBRjSO0Y0JF7eT/71rL66NWAZSpUCPURZ
 Fn4rq67eYTNi5AjqGx17ZndeOaQtXV3j/YS/R78oQwOof/eNXxXEHD+jPULJP+irjSSCI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hn6o6-0002Mz-PI; Mon, 15 Jul 2019 19:38:42 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3C51B2742A1F; Mon, 15 Jul 2019 20:38:42 +0100 (BST)
Date: Mon, 15 Jul 2019 20:38:42 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Message-ID: <20190715193842.GC4503@sirena.org.uk>
References: <20190527200627.8635-1-peron.clem@gmail.com>
 <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
 <CAJiuCcc3_1jZWV7G3+fFQYRZ8b6qcAbnH+K6pkRvww6_D=OMAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCcc3_1jZWV7G3+fFQYRZ8b6qcAbnH+K6pkRvww6_D=OMAw@mail.gmail.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v4 0/7] Allwinner H6 SPDIF support
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
Content-Type: multipart/mixed; boundary="===============5047379433305734319=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5047379433305734319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2019 at 09:21:01PM +0200, Cl=E9ment P=E9ron wrote:
> Hi,
>=20
> I'm missing ACK from ASoC Maintainers patch 2-3-4.
>=20
> It's really small paches, if you could have a look at it.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0s1kEACgkQJNaLcl1U
h9Cw6Af+Lg1FCdunvHuQWgM9lkfW1yDRebhjo8R5qhgUtQE295gHjgjdqQ8xh6eM
ZK1py52Bhvt7DJsJFZfrEBSzhkvLbYMENjj17tSpW3A6H7wHzkyGUOKq3FRIzG6m
WciJzBWDsDtHEO6OUcrPDjvDJWOPeF8h2O+TOgsqOAGMDUPYG3l1iBozqVsFhwGA
b79wc9pIIKvVsp71cE9ZF/m9Y9JTsIyf6Omq4m0zx7KD7nEP0oqnmtg+8AI+lkrC
VEvioUOv9swbYdTsuPP+lwPqI/Wun1n4XDmppLD81iaZn8oHhW0FlU35PjoPRgGK
oPWiRnOfQWTiKTZ5PFdwsicKK9ZQYg==
=tPgX
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--

--===============5047379433305734319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5047379433305734319==--
