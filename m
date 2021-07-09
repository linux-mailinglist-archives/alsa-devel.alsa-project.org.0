Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3B3C239B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 14:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D782165E;
	Fri,  9 Jul 2021 14:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D782165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625834495;
	bh=9GYxC6vUPYJkAA1MTlDePNCYv1ISJaSOZsZokped54E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVH1Mj4gqKXbxnO8KvGXdA9F3tRMtv4ibjozGwvdcsdy/C2V1P11vcbLEUK8NvA1a
	 3AwNwsnLWG29U10WXzFvIJZuDcyxl+HMZfioT9kz6s3Y7eUgU1oyYbk7RS/wdr132G
	 s62joj1zrhLwfUk4rZQzc2eQp79Fsa0Vch0dA5Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 236DFF80107;
	Fri,  9 Jul 2021 14:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C728BF80300; Fri,  9 Jul 2021 14:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC84F80171
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 14:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC84F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fkQiV9+C"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11A3E6135B;
 Fri,  9 Jul 2021 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625834437;
 bh=9GYxC6vUPYJkAA1MTlDePNCYv1ISJaSOZsZokped54E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fkQiV9+CZvyGfZpdYhEJMSzjB8K/SMBtZYYVrIozLDAyKXPZf0mUg2ioZ+mlo6S+u
 WGw3il8gXBSh0gjpkXq65ob/H1vW9QF1e22djwKinVQnYlG0N3yMQcvohh7xcyRiP0
 kpHiBFE6DcXjww45NcaSAHX/NR2ZUiSaUk5MHtOLX7kPm9zl1KOYVWS+exVGRidVnu
 3XguHlgcB0moftdZJQCvT2QMhs3gaiK7FtFC/0j92wOYSs0DrZfrB+qsIw5hrA4XJ7
 wlY7nKU5CVfk/aCSXf8B/G5wsDEd750TNfQQMawAWyxeD29lbIXo7e0GuboL2sJkvf
 nprStr583wV4w==
Date: Fri, 9 Jul 2021 13:40:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <20210709124004.GB4112@sirena.org.uk>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
 <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
 <YOftKVAsRaxtEY8n@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <YOftKVAsRaxtEY8n@atomide.com>
X-Cookie: This fortune intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
 lgirdwood@gmail.com
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


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 09:31:05AM +0300, Tony Lindgren wrote:

> > The ASoC patches are not affected by this, it is just that we need to
> > block SIDLE mode in a different way than how I did it in the last patch.

> > I'll take a look on how to implement the needed quirk for the McASP
> > module, then I can send the dts+ti-sysc patch to linux-omap.

> OK sounds good to me.

So should I queue the ASoC patches and then let the DT patches go via
Tony's tree?

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDoQ6MACgkQJNaLcl1U
h9BpEwf/RDjneK8FOo/V4xfEzRLQw0/z4J1+SNvQEN37DefWi3rKL5Mo+BB/UvIX
Qx3J5MiMqoyryicmB7f9c/FDsxLyVqwlUAOmrQy5RZPW2MqDp/QxAl3VXgMQehVr
PqmX59jRubMzfg2PozhSNgAOL6k/+aVM20ZS3EWf7l1YwiJenmqnJnSieDdQ9NHx
3skDk3XRWXHH/wH/PFzuoKtw6SfXHO0IDYmqYGY3pcCA6C+a4HGcKgQKNLrJHw2c
BLnGoR2JAPlf7yVxSQqzqZlcaUrU2KDb0rkEFOq0Yrqu0bozl2Rb287V6rzJEHaK
25CzSrT4fpR/KwlYWGc8fsXgu4YDwQ==
=rVrk
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
