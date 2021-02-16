Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4E31CEE0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 18:20:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541131616;
	Tue, 16 Feb 2021 18:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541131616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613496038;
	bh=q9tqxcaM7LKN5g+2OHtTEA+k/kE8TMoYNXmUQBMqVj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1N1f/vy5F2zQlT1hC35JSE8txBq7ecB04EnB22DDJBKKQhm87xvXMyLmFyM6hFgs
	 pd4icVKGRZi547ICiQ5UaGdJtvwYFfkKHJx15ScRELxyTr/4Q/jwTfO8pPEg92ZOje
	 myv6Db0mpz0PaXcK/+hs2wOqsOEc/Aq3NxoMAyGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D44A3F8016E;
	Tue, 16 Feb 2021 18:19:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D986F8015A; Tue, 16 Feb 2021 18:19:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12452F800AE
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 18:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12452F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mkBj/+H3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CB8F64DFF;
 Tue, 16 Feb 2021 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613495933;
 bh=q9tqxcaM7LKN5g+2OHtTEA+k/kE8TMoYNXmUQBMqVj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkBj/+H37IisR/MiKu3RQt4J5dezu8hwsHCSTqWadmNT2bbKhtEFcBJycBhwMHfJe
 TRce1ljXnY6/LE1TeUOf6bBpBe8woanOKRF6so4oOW2/YvdI0aQuN/4KCxxpopVYJM
 69u9VEjgQniZJUAd0puIXEIl43miILhSjDgj0V+oideG16O067h6C1YYnz24lIZ4nP
 veg8VM2SYsjqXvdRcT6L/HvwDpc7LAcRLw7K8G7HGI2u2EcELLMVssLUaNChXhHwOA
 jPPdWjCeiQmBEyBmLcGVchDPwuTsR+MiKV0oAKjes8jCBf2Z53STj+toIrTlS6DFsF
 3UmIh8vVb9MzQ==
Date: Tue, 16 Feb 2021 17:17:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: add soc_pcm_hw_update_chan()
Message-ID: <20210216171753.GA4017@sirena.org.uk>
References: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
 <87r1lw90oo.wl-kuninori.morimoto.gx@renesas.com>
 <62f03ec8-7b9c-4550-d63d-cc50693e62fa@linux.intel.com>
 <alpine.DEB.2.22.394.2102142311050.864696@eliteleevi.tm.intel.com>
 <20210215204527.GC4378@sirena.org.uk>
 <alpine.DEB.2.22.394.2102160840420.864696@eliteleevi.tm.intel.com>
 <87zh04wkf4.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.22.394.2102161024120.864696@eliteleevi.tm.intel.com>
 <alpine.DEB.2.22.394.2102161308330.864696@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2102161308330.864696@eliteleevi.tm.intel.com>
X-Cookie: P-K4
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 01:22:46PM +0200, Kai Vehmanen wrote:
> On Tue, 16 Feb 2021, Kai Vehmanen wrote:

> > I kicked off SOF CI with this patch applied. It should be all good, but=
=20
> > testing just in case.

> tests results came back good:
> https://sof-ci.01.org/linuxpr/PR2756/build5294/devicetest/

> Let's cook up a proper patch for this.

OK, I'll wait for confirmation on this one from Morimoto-san just to be
sure.  Thanks both of you for looking into this so quickly.

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAr/kEACgkQJNaLcl1U
h9CqHgf/ZDFh+4KEbTdWKik8PKXUiH40Zi9zDtPpWuAtyIKy4vgpW0LhSU5R8keV
pVNl2zA5oyMhacqRiKjcgUxXUk/b55/Sq5jmbtOoqiVOSyJHHLtZ5xL3bzSaSJTz
ry9CJVVq+ZpSfTc8RYbRSIz1PPcnpJo3eJWo2hRDpfUIHPLfniYY+8cMbV6g7ngq
Ap/QG6gkrrkD0ZItd6pJ5vY/KgkatB0Bg+WnPi9lVsX6S3+QXT52H368ODBXo5VF
GpuCRoOds4ETCwz17McLHlc+8b5gXFAKRZ91QEz6I3JTT4wqugW+n3vODaRaPrlS
GrXa/PiiZ9zjssyhbyBlATR5TYr6gA==
=p+Ay
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
