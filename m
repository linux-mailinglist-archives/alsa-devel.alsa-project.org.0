Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055B581A6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 13:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5BD6172A;
	Thu, 27 Jun 2019 13:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5BD6172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561635341;
	bh=bEx7BoG0qP+Sf5UjwiA1v6P/UWV9IdgDwpoTRlHsHIw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=huxGvK+Xrbb44/E/g0Xi1kcEtm+p1+CywSoJVZqk+7NuPOM9sqkOC7auxNnJwaPdd
	 /dXSlOEH12fvPqqS5JjAX2Q4SJ0i50csGc8Ghl6ba7w1aADvQe6UlF9d2u5J/N9D5E
	 pHGF7Rqjzu6xb/baawCkrwah2HcuInxu3R5QWDi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE26F896F9;
	Thu, 27 Jun 2019 13:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D87FEF896F6; Thu, 27 Jun 2019 13:33:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F24B0F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 13:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F24B0F89678
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mDNmcN//"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FUx4cclJnsJT+mvA6d60xQetDHPvBYlp5+RAfMeJLCs=; b=mDNmcN//NDZnX0jI5McaDCDR2
 RGxTMoXzlm1BMl5e3u82UbWMZs+1L/1YAxE6OyoWxn2m+TAyFYgxhyFKmFK2Jhv7XLVyBPr4LeGI7
 DH8PfwMpGb6K5262ytyzCAo2zGHc4EY50ASBW5FyE9IJUL8uBF+QU3Mnef4xdVSyCmPxc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hgSev-0003dh-MT; Thu, 27 Jun 2019 11:33:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2E638440046; Thu, 27 Jun 2019 12:33:45 +0100 (BST)
Date: Thu, 27 Jun 2019 12:33:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190627113345.GC5379@sirena.org.uk>
References: <20190626202229.16312-1-ranjani.sridharan@linux.intel.com>
 <20190626202229.16312-3-ranjani.sridharan@linux.intel.com>
 <388c2dce-a235-c592-b88e-0f6deca76220@intel.com>
MIME-Version: 1.0
In-Reply-To: <388c2dce-a235-c592-b88e-0f6deca76220@intel.com>
X-Cookie: You need not be present to win.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Rander Wang <rander.wang@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: hda: Enable jack
 detection in sof hda driver
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
Content-Type: multipart/mixed; boundary="===============4604518823077565351=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4604518823077565351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 11:03:14PM +0200, Cezary Rojewski wrote:
> On 2019-06-26 22:22, Ranjani Sridharan wrote:
> > From: Rander Wang <rander.wang@linux.intel.com>
> >=20
> > In commit 7d4f606c50ff ("ALSA: hda - WAKEEN feature enabling for
> > runtime pm"), legacy HD-A driver sets hda controller in reset mode after
> > entering runtime-suspend. And when resuming from suspend mode, it checks

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0UqZgACgkQJNaLcl1U
h9BTjgf/aPeGh/th5rmCuiBy824jAqtp8r5DXheNUbL5eIIJBZGEhzlR0z7gLRX1
UHXYQcjiNDC6m9UXJ0j9sjcnwm15weJwdMaKPaJgxZK6iiO7RmSxvLb2PVyboXYr
6kuXDaxUMWeTB0ys3ErehSjC+XsOgpIU3U1ldgM/en++pZ5cVi8A5Igz/QAy5gxL
pBoKUoG6WOe3tS5WBGvHkRonwFYZOyHly/MARdtho6sK2zM1MX7CToJpd1hjWnCK
cSXDqWoh9nYr9LW4UOsFbHz9il0ozrwFXOb23VLyp8iBZCVAJv/K9UWXMNPHcdz9
AY7X95ouoY8xj4F0SFeTe2AaMDMkRg==
=K8H4
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--

--===============4604518823077565351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4604518823077565351==--
