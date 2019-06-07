Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22683388E0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 13:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B06B2950;
	Fri,  7 Jun 2019 13:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B06B2950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559906449;
	bh=4QChvf6L/nuO2aREMzYBqPWI4OjQs6Vp+QkrzYx5Ze8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8qIG5384jlYP1hRQ3E+vtGjp3qKBSkUVDPuUXHHNyttXWZAKfRKfnTeeD2ty4Sfc
	 a26IPX9fV0wLzFJoOROFU72T2C1IEihlqUO4ktU8HVv67XAiHojIzzXltfXQl885Hl
	 Tli2mQOh0klB1/CYfV8aHwOS5emgZnmRk8y2nfcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58029F896DB;
	Fri,  7 Jun 2019 13:19:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A37FDF896DD; Fri,  7 Jun 2019 13:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 513AFF80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 13:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 513AFF80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FIM8ynCv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lKBUT3HYWFjGoFbm4/A9Mdr1p7Ltp+8Tx+FLv4hb0no=; b=FIM8ynCvIqKNkAXLTJxqc/t42
 DXpzIFn+O+ljS6I/Py+fo6xOkBeTXN74oqFXgqYeTDr8UHEbaSbpjgbBiY7mA8eJx9uHjr+1ls4pf
 RiiXalcDxiXdMH46wJHZnt/65+5qYjlTzO16vkxd+F05Sr+i1DPu/snYzOFvWL6mLJ35A=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hZCtb-0001ja-CE; Fri, 07 Jun 2019 11:18:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 46A99440046; Fri,  7 Jun 2019 12:18:54 +0100 (BST)
Date: Fri, 7 Jun 2019 12:18:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190607111854.GF2456@sirena.org.uk>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87lfyfe4r3.wl-kuninori.morimoto.gx@renesas.com>
 <3BD9CEE4EBD5E74B98FE2D277EB60E0B3900FE91@IRSMSX104.ger.corp.intel.com>
 <c0d5fa8a-ae0d-6d3c-b4a5-7010640683b8@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c0d5fa8a-ae0d-6d3c-b4a5-7010640683b8@linux.intel.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 146/146] ASoC: soc-core: remove legacy
 style dai_link
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
Content-Type: multipart/mixed; boundary="===============2825456607391510002=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2825456607391510002==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5PYSK0R2Sa5XBHe"
Content-Disposition: inline


--I5PYSK0R2Sa5XBHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 02:08:50PM -0500, Pierre-Louis Bossart wrote:
> Please don't top-post.
>=20
> On 6/6/19 1:25 PM, Rojewski, Cezary wrote:
> > Hmm, guess reviewing 001 proved redundant after all. Unless I got it wr=
ong, you are removing code implemented in that very patch (the 001).

> > Any chance for eliminating ping-pong effect and doing the "right" chang=
es from the get-go? Especially the renames are confusing here (s/cleanup_pl=
atform/cleanup_legacy/) if you intend to remove them soon after.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> Using a ping-pong analogy for a 146-patch series is pushing it. It's first
> make then break to avoid bisect issues. And the names match what is used =
in
> the existing code. maybe the naming isn't to your liking but it's what has
> been used for a while.

> Note that the last patch is going to break all the non-upstream machine
> drivers so you will have quite a bit of work to do on your own when you
> rebase.

Right, avoiding build breaks is important here - it helps future
bisectability if we don't have commits (and especially long serieses of
commits) that just randomly fail to build.  That's *way* more useful
than dropping the initial patch would've been.

> > If there is no other way around it and solution is accepted, a note, pe=
rhaps in 001 would be helpful for future readers.

There's no guarantee that a patch series will be applied at once, if
there's a problem part way through the series the earlier bits might get
applied to save future review.

--I5PYSK0R2Sa5XBHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz6SB0ACgkQJNaLcl1U
h9A/kAf/YElb9Yj5Sf0ThOQKW0/byzPpMRLDjxf5MCnX0ixINTG1Gji/JRzX5M9g
iBkz3cnypcIOtZNcXfxjYy+LJewpNFXRLPdl62sNaNJyC7wyh9fnBBGtuiSLep3J
zAX20LvO4nVJKTZoqMqkDZiP6TsS3FpkYLbZynrj9ahGJRIQ0s+h9jtnLv2sQQ+U
hZlNFhDGBdfWZ2ZaS/6XnrlQVCeDYXC57kI5CfLDNvfZybKYHZTOqFOVPxAmhK1Q
tdUEBZVuo0yQ0FbrhzVHm7b+pGCoec0hquRiECOgzcSobvLz/R+mQ75HmovxfUUz
bNpl61jA7HW91adAIZ1cSuJMpjLDVQ==
=3adO
-----END PGP SIGNATURE-----

--I5PYSK0R2Sa5XBHe--

--===============2825456607391510002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2825456607391510002==--
