Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613F158303
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 19:53:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D411671;
	Mon, 10 Feb 2020 19:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D411671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581360790;
	bh=nbRzt1NH4v3a+j/0fxeWGJr5e0kM3ULRLzoh0gfFufQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mi1ANzPu30GX9zlgrxuDTPRzzhOdGRwJ+MP3W2I3NSuh+r3Ac2ccUh5NeNVAYqwAT
	 LEFwKI2ldfW/eAhrDP1/hr2iDwkceOy5kIHQjzA4N6yVDa2EucS4lap47tB81Gh3S/
	 bZU/eiqbhcf8tSp2ps4AUtrCBjsRXBrGFt/c5KpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 718ADF800E7;
	Mon, 10 Feb 2020 19:51:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B15F800E7; Mon, 10 Feb 2020 19:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E7C07F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 19:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C07F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175711FB;
 Mon, 10 Feb 2020 10:51:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 913B43F68F;
 Mon, 10 Feb 2020 10:51:22 -0800 (PST)
Date: Mon, 10 Feb 2020 18:51:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20200210185121.GC14166@sirena.org.uk>
References: <1580787697-3041-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1580787697-3041-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: MT6660 update to 1.0.8_G
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
Content-Type: multipart/mixed; boundary="===============2409103315932207337=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2409103315932207337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 11:41:37AM +0800, Jeff Chang wrote:
> From: Jeff Chang <jeff_chang@richtek.com>
>=20
> 1. add parsing register initial table via device tree.
> 2. add applying initial register value function at component driver.

OK, so there's still a problem with the whole concept of putting
"initial register settings" in the device tree - this is clearly not
idiomatic for an ASoC driver.  If there are machine specific settings
that need to be done unconditionally (eg, values controlled by external
passive components) there should be specific properties for them.  If
there are runtime options these should be normal ALSA controls with the
default values being whatever the hardware defaults are.  If there are
things that should just always be set no matter what then they should
just be hard coded into the driver.

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BpigACgkQJNaLcl1U
h9BiyAf/QaAXZr0p0rJqLpG7vmgoly1T9FBkezqmJEiv3P33z9JTA42AEA+m+4/+
P4rXU6XE8hpiODCHfl8xxLY3VzihTReH7vIZf3BsGdsKNxOGTv/srMC0GxLynuXt
aVgdqh/a1iVFpHlExbNepcncR7OD96NAQT90Qg25TkDEGQAKcX6KxFtD7xshp/jd
dx6o0pSY4sypcaPDro+KSOzXDNdRv9tF0/mDKCY+nMpkX6mtFHVhJyp/W3J6bMDS
hdaaLnWJ5qLwJa9d2wmuu0Mhgf8dcftSBHOHa1jPVYhloldoFGZTPtAa0BQdFH/z
kGDUjJRGtISjBD+mJLho5/CiPPhPFg==
=WFJc
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--

--===============2409103315932207337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2409103315932207337==--
