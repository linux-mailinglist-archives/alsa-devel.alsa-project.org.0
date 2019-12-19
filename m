Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED1E126DDB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 20:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83DF1616;
	Thu, 19 Dec 2019 20:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83DF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576783118;
	bh=30Xlg4UFNDVDmXn0LI4PWikrsztgWnGrgk+urrmWwZ0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFmuI3rRwp4SBg6y/HMxxHi4hO/3gT+UdWllPwfcjUc8pPJk6/xxlQx5DfM3DR7Iv
	 IlMcH8lhZ5mUSa4fvuZDqD0rkGxRXK//+F3neNcSE0ygZp96zD6l3kDEWvl7vAatxT
	 kIVHqqeHDEIfFmJ8nQCaQB1q8D+K0tNjoG8vqNQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97EDFF80218;
	Thu, 19 Dec 2019 20:16:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD10FF80234; Thu, 19 Dec 2019 20:16:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C6E9F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 20:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6E9F8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393291FB;
 Thu, 19 Dec 2019 11:16:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD5843F67D;
 Thu, 19 Dec 2019 11:16:47 -0800 (PST)
Date: Thu, 19 Dec 2019 19:16:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191219191646.GH5047@sirena.org.uk>
References: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
MIME-Version: 1.0
In-Reply-To: <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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
Content-Type: multipart/mixed; boundary="===============2423463031290970947=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2423463031290970947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uJrvpPjGB3z5kYrA"
Content-Disposition: inline


--uJrvpPjGB3z5kYrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 02:41:17PM +0100, Marek Szyprowski wrote:
> On 19.12.2019 14:05, Mark Brown wrote:

> > You can't trigger this via any other mechanism, all the other controls
> > are fine?  There's *clearly* no issue with what the commit is doing,
> > it's just flagging up that the card is not set.

> I've cherrypicked the $subject commit onto vanilla v5.5-rc1 and the=20
> issue is same.

Yeah, there were a lot of refactorings in the last merge window so that
doesn't entirely surprise me.  The commit should backport futher than
that I think?

--uJrvpPjGB3z5kYrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37zJ0ACgkQJNaLcl1U
h9Cctgf/RHHQThaM3HgCq/Tt1yzFqhDhgbtzRGhB3VQUpQ4pH7xPLd9iBKMFJdfn
tnMFXfg2BFIjk/sZ63wBagRh5lhI9r0MZE+GgRiYs5NAXn8L9/IDpe1D4JTvzF2o
QptVlv20UYbmZXfS7CgACTNreMtCO5UWWEmoMj2lLmN6iF4HX6x5XKkAQ6xc4une
9XxgYbfY64gyftKW+woaaOai1GM3Ru60tKnzLy3BTa/MP5tTEhlcLvfEee8ZCy5d
UfXnubSxCYtE0iztv/SCkAIxPRvhMhP96edsub3clpVKPCUXfdeIQprp89OLk/bR
16nounqBx0diZLPVES00DYHD3dZRCg==
=nSB4
-----END PGP SIGNATURE-----

--uJrvpPjGB3z5kYrA--

--===============2423463031290970947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2423463031290970947==--
