Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0CB143129
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 18:57:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A11166E;
	Mon, 20 Jan 2020 18:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A11166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579543019;
	bh=LCy+gNO29xPU3sqV7X58ZoEJvnnKf/DDGGxTzEGMsMg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8JBDlfTZVv6lJf8VtuLDSYf+gNrWYndMONeCdiWo5al72Onr7e8srYFYFPK8oljd
	 Fvg3Eh2g1AuIsX8457J2xakw1mF4XZH94fBQOutJQcRYJv5gZkxmBfq4f3Z88d6n6v
	 O9FqkL8OD4SSJG4A1AZBBSMtQjoUziPGlRFpPb2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C787EF8012F;
	Mon, 20 Jan 2020 18:55:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92268F8020C; Mon, 20 Jan 2020 18:55:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 887DFF8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 18:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 887DFF8012F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F124131B;
 Mon, 20 Jan 2020 09:55:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F0AD3F68E;
 Mon, 20 Jan 2020 09:55:07 -0800 (PST)
Date: Mon, 20 Jan 2020 17:55:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Message-ID: <20200120175505.GJ6852@sirena.org.uk>
References: <20200120160117.29130-1-kai.vehmanen@linux.intel.com>
 <20200120160117.29130-4-kai.vehmanen@linux.intel.com>
 <s5hpnfe2hvb.wl-tiwai@suse.de>
 <20200120171718.GG6852@sirena.org.uk>
 <alpine.DEB.2.21.2001201936540.2957@eliteleevi.tm.intel.com>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2001201936540.2957@eliteleevi.tm.intel.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, cujomalainey@chromium.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 3/3] ALSA: hda/hdmi - add retry logic to
 parse_intel_hdmi()
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
Content-Type: multipart/mixed; boundary="===============8716392056908785816=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8716392056908785816==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FCKy2vjPBX+S/5dE"
Content-Disposition: inline


--FCKy2vjPBX+S/5dE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 07:43:31PM +0200, Kai Vehmanen wrote:

> Maybe in future, better not to combine ASoC/SOF and generic HDA patches i=
n=20
> same series, but rather send in pieces via the proper subtrees...?

In general if there's no dependencies between patches it's best to just
send them separately rather than as a series (even if they're all for
the same subsystem).  It stops unrelated things getting tied up in
review needlessly.

--FCKy2vjPBX+S/5dE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l6XkACgkQJNaLcl1U
h9AOVwf+KodrmUyDmY4osGJomLlkSENgYKj6tEmxg5OCkr+3DJ3C39Zmt/1aHKor
J02701sP200R3DMjrf+l7uQRa2VKivCPC14xIgAgmelr4bWKY4gIFvG8S/tBtLho
kjO69rIC7b3IsE7ZVm53OhacVYz6CGpxJwZqNy362haRiOb7+jMFVnGbo06+q8Zo
s2dBsbU5usi3O8p+/GBWpq05EFx/BuQoD3m1dNyNrjWI0DoD+w+e4zebthL8c+Oa
BE4GMztJxyQQ2ad1XB4Vd0H5GNcYA2vjVrcWwba69U3Kt+9C5U8pnG7Y7qip4E1x
g1NT2wDhZuULvro+Ag++Ff+S5PNLzg==
=WizW
-----END PGP SIGNATURE-----

--FCKy2vjPBX+S/5dE--

--===============8716392056908785816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8716392056908785816==--
