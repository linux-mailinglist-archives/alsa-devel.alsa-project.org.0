Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC7164B78
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 18:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E961695;
	Wed, 19 Feb 2020 18:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E961695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582131945;
	bh=9uIMmJohw3MUKabxAtb5R1xkJ9ID2zcHiWCTjm949qg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZzJ75Bls+RyFnxM5K7btdJQ4c0UIiFYyE4bXciBTFrHtNuD33ef1nPsX4J2IyImN
	 7VD6SgVMgOtsfnjwnlJ/v016JaiPsR04azbCJpfYtuH1mO6bBFqefk/IkU2RSGx0qL
	 HBKITflOTGsX2jNg6zQq4iJHxe3VRTDsXMjKBrmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D6AF80277;
	Wed, 19 Feb 2020 18:04:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFA2DF80276; Wed, 19 Feb 2020 18:04:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2052FF8025F
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2052FF8025F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42C8031B;
 Wed, 19 Feb 2020 09:03:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB9E03F703;
 Wed, 19 Feb 2020 09:03:56 -0800 (PST)
Date: Wed, 19 Feb 2020 17:03:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
Message-ID: <20200219170355.GG4488@sirena.org.uk>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
 <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
 <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
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


--c7hkjup166d4FzgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 07:01:33PM +0200, Kai Vehmanen wrote:
> On Wed, 19 Feb 2020, Pierre-Louis Bossart wrote:

> > We also see a regression Kai bisected to the same patch

> > https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014

> issue rootcaused -- this relates to the new "opened" tracking, I'll send =
a=20
> patch shortly after a few more test rounds.

Oh, excellent thanks - I was just starting to poke at this a little!

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NanoACgkQJNaLcl1U
h9DF8Qf9GsLpU85BKuVRGsLykt81rr/+87ujyl8pzIcOzVotCJtAhfKR4DsnnHJz
7u01I/fyGwYdxO2gvRjlFxe4UO0KVJh8Kbmyh4ZwPjeAEa5NLhs9D9JQo7qEhRWM
6ARwANJVcZ43UQDcvlV3ZX7lHCuRZPQi2ZuIiaI9jo4jRpfEIh25iVuxjafrKkkc
AD1EYa/nFJKUWXRMrJfFhZdXYQvnY6pCX/3PGwrxD0gnwsaPW7wVR5iwElZyToVK
i/TIjmyKHvNXYSKbpYA/FQYYuAzwIUFJD7wczFgCH4ImrJbdYZl7RxJnso81UynD
s8aFo8gkQQ5ke6JIyJF+eHlQjhevWA==
=C3SM
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
