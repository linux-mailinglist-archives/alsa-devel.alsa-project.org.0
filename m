Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF10588B74
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 13:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51B81614;
	Wed,  3 Aug 2022 13:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51B81614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659527117;
	bh=5/9YQO52Bee/EaBc9lr7oejsA5JxeJQbFXb22/02YnU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2mhetcUuoQJ4pCtvDlP7+2dNB7Nq+17ip/kA67GgN5lGb6pvP7ATpbYDFJXkRjib
	 tJ2/yER/ceqBCkA8zhXIaAtUi455EF7ebKd4c4Y8jEMIaeLjlP8YZp+Bi5IxyaQ/J9
	 Ikn0xvG0ngCNqmEG73pPm7LdSbKU5TnIfuF/gsW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 245B4F8025E;
	Wed,  3 Aug 2022 13:44:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09735F80134; Wed,  3 Aug 2022 13:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E415F80134;
 Wed,  3 Aug 2022 13:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E415F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rsJmMmlF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13DEF60B87;
 Wed,  3 Aug 2022 11:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA56CC433C1;
 Wed,  3 Aug 2022 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659527051;
 bh=5/9YQO52Bee/EaBc9lr7oejsA5JxeJQbFXb22/02YnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsJmMmlF6oaE4300tR9I6TP3bpCtgtJUCvfsJxqBCcm5ECKRkN3oEQT7TV4Bc6Y5d
 8i5VJPKdOD5QerZF5RuwmI7bbhFmosud8w2v96sVyELNN7s5KIGRF3dH4uwL3CybUM
 JkTWYvusnwPq/Btj2ZKH8nucr3ohrwJS0mZXANwKH1zyIMnLDNtba4JUYirPvlLP4j
 bqTfDvAFi+pqnSU6rr7B8WOZBxR2SWBcNBlXj3HtHb0xhoujvQVZArfpSyoTuiJJK8
 oC0wVpTyTYRBYHCt97W6uBBGj4A9z14L/YYojpHfvurk9n8xqT4QYyNfwn0eyhzwv4
 nt80N/JTN74Iw==
Date: Wed, 3 Aug 2022 12:44:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] soc: sof: fix clang -Wformat warnings
Message-ID: <YupfhNXObIt6yNqI@sirena.org.uk>
References: <20220721211218.4039288-1-justinstitt@google.com>
 <YumINAZ4WaM4rG7Q@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dMPAc8CxvXVPL9lp"
Content-Disposition: inline
In-Reply-To: <YumINAZ4WaM4rG7Q@dev-arch.thelio-3990X>
X-Cookie: Give him an evasive answer.
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Tom Rix <trix@redhat.com>, Justin Stitt <justinstitt@google.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, ardb@kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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


--dMPAc8CxvXVPL9lp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 02, 2022 at 01:25:24PM -0700, Nathan Chancellor wrote:

> Is it too late for this patch to make 6.0? We are trying to enable
> -Wformat for clang in 6.0 and this instance of that warning was
> introduced this development cycle by commit 323aa1f093e6 ("ASoC: SOF:
> Add a new IPC op for parsing topology manifest"). If I am tracking all
> my patches correctly, this is the only instance of -Wformat that does
> not have a patch applied to a maintainer's tree so it would be really
> unfortunate if we could not sure it on for -rc1.

> We could probably route this via the Kbuild tree with an Ack along with
> the patch that enables -Wformat if it cannot go via Mark's or Takashi's
> ree.

We have a couple of months to get fixes into the next release so it's
not an emergency at this point.  If you want people to see things
promptly you really need to do things like send them with subject lines
that look like something that might be relevant for them to review
(generally, at least visually resemble how other commits in the area
look).  I don't know if I even opened this mail first time around
because based on the subject it looks like something for drivers/soc not
a subsystem I maintain.  Given that none of the SOF people responded
it's likely something similar applied there.

In any case, if you think something's been lost the content free pings
either here or on IRC aren't that helpful - they're not directly
actionable.  It is generally more helpful to resend, that way people
have the patch to hand and don't need to go looking for it.

--dMPAc8CxvXVPL9lp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLqX4MACgkQJNaLcl1U
h9CFOwf+JSow+bMD3gDkBQomWzJw8cGlWyTUcsXLdlE/CzXwQs5srMa5Or+NqyRW
/iU7VN7jq7imtSN6PHsdwgu9V5v6B3bK7aIO8aTICXnQhLrgjuRSeA0OMcIjCf7n
mpjg920Om3+BWhYMU9JK4sNilrA6cEeEK8FaZKPQu+bEpAzrtKGKRugbBc/C8Jbm
GULKrkZ01e5UUovr2h6va6ownqScAVgj58T25DyWcJMT3hiLouiHd/vdIFzSsLBS
uoxFUkJXQH3Gk+GnwtvmXmagvSlzvcIfQn4XzKWQP0wS12AV1VuZ8kF9YfOcBqF/
Xjm48O6XfeasYtW3gZV9hz8wX3rFNA==
=BSuP
-----END PGP SIGNATURE-----

--dMPAc8CxvXVPL9lp--
