Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC0107808
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 20:31:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B1D61836;
	Fri, 22 Nov 2019 20:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B1D61836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574451070;
	bh=dND7KlCO9MglxAux9wQ5BMAd1HSuom7VWshDiOXe5ZY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIVBwzvK41z1TsAArgIFdhgcAGuc2ND6GchIZUjF+4sOUsoHGmbLbQ2+Q0SHW4rjH
	 H521e+M+HnHDZgjf7mcjqQojOZXVTLrDIL5/xqaBtCElcHw5rH0chn+YaGdqYL+b5J
	 8BMg27uWTHJOjnJliGeHAZO2wf0BIBJ6RwaxEm7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACE50F80150;
	Fri, 22 Nov 2019 20:29:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD74F80140; Fri, 22 Nov 2019 20:29:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4050EF800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 20:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4050EF800EF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90960328;
 Fri, 22 Nov 2019 11:29:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DCFB3F6C4;
 Fri, 22 Nov 2019 11:29:15 -0800 (PST)
Date: Fri, 22 Nov 2019 19:29:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191122192914.GI6849@sirena.org.uk>
References: <20191122083800.9924-1-perex@perex.cz>
 <7164dd8d-699a-6c5e-ab92-0068b248b4f0@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <7164dd8d-699a-6c5e-ab92-0068b248b4f0@linux.intel.com>
X-Cookie: sillema sillema nika su
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF - topology - do not change the
 link triger order for old firmare
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
Content-Type: multipart/mixed; boundary="===============2249144395630642861=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2249144395630642861==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline


--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 22, 2019 at 08:50:15AM -0600, Pierre-Louis Bossart wrote:

> With this proposal from Jaroslav, users of the older firmware will not see
> the panic but they are still facing potential underflows.

Underflows do seem better and more recoverable than panics.

> We may also need to look at different ways to identify the firmware, in this
> case the problem is not due to the ABI proper but a change in the timing
> sequences, we may need a different sort of ID here?

Yeah.  I guess it depends how widespread the different behaviours of the
racy firmware are and what they're influenced by?

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3YNwkACgkQJNaLcl1U
h9C3nQf+K3Lc5JzrWQeSkzePpf58a8kFcu+A+8HftjsxPjxAVlTFTON9REPGXOxc
WYBtn7wwke2tXCr9E00a0hlxter2ni+B5YP9crWWl5JMcbOgVEL6iqCg52Mg/B8p
Z5Vx0bh1O2Pa/fbVQN01Y5dDtwlIl3FMUQhYejIoQrZds2FxNP5wQ9OPPFWJxrhA
M7rpWTTQyvwbIDwldNLNk9AfaeL5lWmWKk5UnH+irw1QJlf7DgbPn4cX2Lbk1iF6
VoAFplaR54fFrUvbGDzOQnGgbu3QgaQ9D/bt9EOv7Pa2a55gRx2N6LGxQbZKFDtA
mnvHfNQzdzstN9QrMF+hZwKnhci9yw==
=2EPy
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--

--===============2249144395630642861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2249144395630642861==--
