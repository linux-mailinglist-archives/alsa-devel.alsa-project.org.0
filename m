Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0AA557F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 14:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E21416B8;
	Mon,  2 Sep 2019 14:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E21416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567425883;
	bh=ZYzPSaYLj++w/HcyJ/QdJ59jk6VHs67UeFZB43q0g3Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aj+F6gnxNd7SiiGW9YWXmGHHinN1OiNs7jczojRefHHwEFrc5ubiICLAmHdLWhkJP
	 q68zbnszrQFjpYwVsakCvV8gZ/WswY1iIpX6HXqGkT4whPASLNKr9nPD6vHwYjNuDy
	 oYKaSNj7+rZrH1fNFixV1uwthUubwswjYtlbwDsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD911F80394;
	Mon,  2 Sep 2019 14:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 232B9F803D0; Mon,  2 Sep 2019 14:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 631CBF8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 631CBF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="q2WL50s0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RHTgkM0dM8xda/qXMLAftdtWVTMspSpd+zBxKdxmYLg=; b=q2WL50s09cQ8HSMxrwkyp2lQE
 KEWJsv8fwGb6HNa2DyeWECv+x39Wlm1WjFANRf2dfFkQxsSMQ+WXGSmtqywvNn49tNV+wqNX0L6DE
 +NRIZFLBN9Spw5oVoLWH4G5G4UABZdNu79sH/XvNtxpTmeb4+Mz+3iDlNReEpC6ou5FXw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i4l2o-00039e-0O; Mon, 02 Sep 2019 12:02:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1714E2742CCB; Mon,  2 Sep 2019 13:02:49 +0100 (BST)
Date: Mon, 2 Sep 2019 13:02:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <20190902120248.GA5819@sirena.co.uk>
References: <20190831162650.19822-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
In-Reply-To: <20190831162650.19822-1-katsuhiro@katsuster.net>
X-Cookie: Lost ticket pays maximum rate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v2 1/3] ASoC: es8316: judge PCM rate at
	later timing
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
Content-Type: multipart/mixed; boundary="===============4511382823099558831=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4511382823099558831==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 01, 2019 at 01:26:48AM +0900, Katsuhiro Suzuki wrote:
> This patch change the judge timing about playing/capturing PCM rate.
>=20
> Original code set constraints list of PCM rate limits at set_sysclk.
> This strategy works well if system is using fixed rate clock.
>=20
> But some boards and SoC (such as RockPro64 and RockChip I2S) has
> connected SoC MCLK out to ES8316 MCLK in. In this case, SoC side I2S
> will choose suitable frequency of MCLK such as fs * mclk-fs when
> user starts playing or capturing.

The best way to handle this is to try to support both fixed and variable
clock rates, some other drivers do this by setting constraints based on
MCLK only if the MCLK has been set to a non-zero value.  They have the
machine drivers reset the clock rate to 0 when it goes idle so that no
constraints are applied then.  This means that if the machine has a
fixed clock there will be constraints, and that constraints get applied
if one direction has started and fixed the clock, but still allows the
clock to be varied where possible.

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1tBOgACgkQJNaLcl1U
h9Cqsgf/QH87sADyO5H2sSFpF1Q+z94gj4FdObMAowT+MfdNXULU7KlUsVfMcZ1i
uqbIgpKzNezmZ0HSIckM81LJhPki96kWttW1LV4C/0XSse0qRvmlodK8eCg5P8ah
DUUrvBEd65MRMpTNKdF/QZ8QSG8CSHgDntHA1iej9N6k04LeGLVEB9N25h0Kv02R
+z+mHUCQvxmh5+ql8hg2a9XvKEyOW/fslKAV57xgEHbP8ElCdwkBqVvVn1LkyldJ
b+cwBXQ/4HbjHQMJB7effDFbSpRJ8GrHO/SBT78pt05pu2+8gVqy+TV7CrM2bw7m
Qhv3yQbq2xzikv0Vjj3WX+Gtnsjm7g==
=AnX7
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

--===============4511382823099558831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4511382823099558831==--
