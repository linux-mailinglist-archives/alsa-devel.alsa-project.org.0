Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4884296F2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 20:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 509C416C5;
	Mon, 11 Oct 2021 20:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 509C416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633977087;
	bh=diBqlvKGtEl8DB+wDdHMTYgQ2IHF2EbrhLa15A4CP2Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X5gruqA/2nIegWRrGuj0eEvYaxUps/7laJwwx8/qZTak3WCmLMtFr/Bv5YM/y07QI
	 RgjX67CjI3QqZ3Sy+r6cWxMLFJQH+9nO+y68ue03+3ZblxNECcUd7pCwGSSp4oYIUo
	 lWszu2taXTgMd9maG0jmXm8ucNDN031ZsYsDYIMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81BF7F8028D;
	Mon, 11 Oct 2021 20:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90E30F80269; Mon, 11 Oct 2021 20:29:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4062F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 20:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4062F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B/d+tF0D"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4149560E90;
 Mon, 11 Oct 2021 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633976965;
 bh=diBqlvKGtEl8DB+wDdHMTYgQ2IHF2EbrhLa15A4CP2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/d+tF0DJkxtwnH29uUnvvLqm5k0JYUASoFRsNCx5L9lbsdvGqW+iRpGiQWHjVR3+
 wXT9VsHVv0KdfZwZp4OIcA14WgAcjIYNsdl1hhwBohwU+IeaPd8drIjtwmIFAr5hQg
 SMrunPn+Nc7clyp8hgM5dy6vVp6/LX7ERE0kgXHS4wo0i1R/32sOgvX/CSL9XKCfJK
 IFpQU/E/TCKr7ixArsVbsljlgFWLbKJ7NWKk8lH3jeJby9oVe60rRGOkVEpM7Zjh9I
 fPFAKWeMoe22+RY8AO2pVtSNxltMnaTLPYzAGsL+mWouxUwRFB6VMZQVX2g4Bo//+z
 YZPhXp+TKi/wg==
Date: Mon, 11 Oct 2021 19:29:23 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoc: amd: create platform device for VG machine
 driver
Message-ID: <YWSCg2Nzi8lRDiIE@sirena.org.uk>
References: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
 <YWR5QH1lYqiT1cX+@sirena.org.uk>
 <57f313fe-fb8e-8b4b-8839-d9d8653880d1@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eCPTkh53x3R1J0l+"
Content-Disposition: inline
In-Reply-To: <57f313fe-fb8e-8b4b-8839-d9d8653880d1@amd.com>
X-Cookie: May contain nuts.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David.Rhodes@cirrus.com,
 Alexander.Deucher@amd.com
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


--eCPTkh53x3R1J0l+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2021 at 11:48:40AM +0530, Mukunda,Vijendar wrote:
> On 10/11/21 11:19 PM, Mark Brown wrote:

> >> +		pdevinfo[3].name = "acp5x_nu8821_cs35l41_mach";

> > This appears to unconditionally assume that any machine with this
> > hardware is going to have exactly the same CODEC/amp combination - that
> > seems like it's going to go badly at some point.  Shouldn't there be
> > some other check that we're instantiating the right machine driver?

> we will make the platform device as generic one something like "acp5x_mach".

> Currently we have only one target platform with above codec combinations
> for this APU series.

> When we get new codecs combinations to support, we will address it in
> machine driver by adding DMI checks for distinguishing codec combinations.

If that's the case then this machine driver that's being instantiated is
poorly named, and I expect you're going to get issues with assuming a
default here and trying to instantiate this machine on unsuitable
hardware.  It'd be better to at least put a bit of the framework in now
and positively indentify systems that can run this machine driver.

It really would be good if ACPI system vendors were to adopt a more
standards based approach to platform enumeration, this really isn't
good.  Something more standards based like DT has would be much more
scalable.

--eCPTkh53x3R1J0l+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFkgoIACgkQJNaLcl1U
h9COMQf9GXDFZZME1KoLuEwkKs23hk5x6Yd5pCtMgh9arW9h8qHb5Kbfn9adyQW+
GsGdxXCgHv9MTOFWBeKgprtt4WbMqkp3vJEu+sV0ma3kFKM+0HupofMliz+fJ33t
aUYZTPWGvdPYUeQHL/g4dqMj0Vg6o8pZsEEbk46NL0pOddaP3o/tt7ficxzS8Jpd
2bbcA7oIRFi7IZJPHf9QvcSU98M406lgjAzO8bapXs579BATkM9B2y8VupQuGzS2
+Yfzqzg0Yz42FUVKpBlB9Iol0FSUt+DX9TfquoWIhmWNhHm06itGiXWi79R2FfQS
yfMXsfdEh2KPPxx+0Nh3CAriZpHCAg==
=15Z3
-----END PGP SIGNATURE-----

--eCPTkh53x3R1J0l+--
