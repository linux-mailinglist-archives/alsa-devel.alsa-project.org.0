Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95312A5AD5
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 17:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 076EA16E9;
	Mon,  2 Sep 2019 17:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 076EA16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567439652;
	bh=dwrp6qBFTGgrtOTmBN4BTAkmDsqI2QTH+IfIDlwVZeo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EXCp48U4yTtQd0dpy9aCpd/4vCC2G3farVakRPTvc8z/ticfwG6HeHta26sYIrEqX
	 dG2g3FjrzpAdmQHB/EoSkLuGsd4KPEWXieVJeH0KTyjCce0Kf3KqIG8dUOFJGpnAfz
	 7WjMXebOMorcVoykQ4B6msgjZRXowDyQTJZDrGTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C78EF80394;
	Mon,  2 Sep 2019 17:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C82F803D0; Mon,  2 Sep 2019 17:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1112F80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 17:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1112F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vMgNoxLs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4snlMMv36cskyMNKU3ymZ+DNhz9Szex5LZ1cJjgF/oE=; b=vMgNoxLsQ2OdwDMfQal76QX6q
 yFK8aDuSJNaBrC6c2rEAbXdWCOi4TiUGgyAy3uzXB2xrYp3gARtzG756t6DiVArWe2VVJeV0txXl8
 eSJbnWT0V/ynRwnySl2YCGJybMQrC96D26jDk0tuo0VFpysWShVi8Fj8D5DVaLjkSPabQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i4oct-0003fI-E6; Mon, 02 Sep 2019 15:52:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 852E02742CCB; Mon,  2 Sep 2019 16:52:18 +0100 (BST)
Date: Mon, 2 Sep 2019 16:52:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190902155218.GC5819@sirena.co.uk>
References: <20190830225514.5283-1-daniel.baluta@nxp.com>
 <20190902123944.GB5819@sirena.co.uk>
 <CAEnQRZDmVoSkpf47mTHeEKodX9_x4Y_9EVrkS=ta4sWU8tD3Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZDmVoSkpf47mTHeEKodX9_x4Y_9EVrkS=ta4sWU8tD3Zw@mail.gmail.com>
X-Cookie: Lost ticket pays maximum rate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Cosmin-Gabriel Samoila <gabrielcsmo@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to
	Output Mode
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
Content-Type: multipart/mixed; boundary="===============5859122881728349395=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5859122881728349395==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 02, 2019 at 04:35:56PM +0300, Daniel Baluta wrote:
> On Mon, Sep 2, 2019 at 3:42 PM Mark Brown <broonie@kernel.org> wrote:

> > This patch seems to do this unconditionally.  This is fine for
> > configurations where the SoC is the only thing driving the bus but will
> > mean that for TDM configurations where something else also drives some
> > of the slots we'll end up with both devices driving simultaneously.  The
> > safest thing would be to set this only if TDM isn't configured.

> I thought that the SAI IP is the single owner of the audio data lines,
> so even in TDM
> mode SAI IP (which is inside SoC) is the only one adding data on the bus.

> Now, you say that there could be two devices driving some of he masked
> slots right?

Doing that is the major point of TDM modes.  It could even be another
SAI on the same bus.

> I'm not sure how to really figure out that SAI is running in TDM mode.

As a first approximation you could just check if set_tdm_slots() has
been called, it might still be the only device but it's a good first
guess.

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1tOrEACgkQJNaLcl1U
h9DwBwf+JVnQJkaiQDq4QeWXVRXWkHGSybe5ZQnqojYXRZ71ee4yODWtXbxwki74
prPVLxMWCoCRvuoxUB4fQFbKN9qCkz0uZ/uthmNqsjueAVWYsAE+3YIA5cw6Kc/c
KFa1n4mptpdnmRwLg79ZKuX8GiudgJon/bR5fdveOdB2oeqmx4ooAD/TXsvmx7D6
qn9AAyYbadyk/6WAVGhmBj+N7lN1R6kdW35i8kVtrMvlOnsmFOYLVXjQnKZCQT9w
zHYp3kQWX2QxderqG4qqQNLc03R1qYBLWv784lj91hyXuaXGovxg84tzYzqgVb2c
nIPwaFdNgrNWTHCQ4ijb7pXXcuieQw==
=gUoA
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--

--===============5859122881728349395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5859122881728349395==--
