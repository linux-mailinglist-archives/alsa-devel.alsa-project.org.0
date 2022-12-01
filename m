Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDC63FB04
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 23:56:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12016175F;
	Thu,  1 Dec 2022 23:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12016175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669935406;
	bh=cvrPNkMdTayZW2+mx8ZpfTJbOGVT1F6b+IjEaJFrZ5w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvBxwHxGiynXBJYDFWaxeBqAXN9a6TXNideQ3F7FnMQg3XOWiBtqvqPL37pgUcKiK
	 iydQVQF6og5501DylogjF6fQOJDWsPdE9X0+c+b7ydfrlhgt+j32U8chR9r1G1Twmo
	 oIZjfiiz2StfWXizORJh6/lEcNaCCEYM32jt9vvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E81F804B1;
	Thu,  1 Dec 2022 23:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FE82F8028D; Thu,  1 Dec 2022 23:55:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBCACF80162
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 23:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCACF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XqQ1wp8a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABA5162169;
 Thu,  1 Dec 2022 22:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB338C433C1;
 Thu,  1 Dec 2022 22:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669935342;
 bh=cvrPNkMdTayZW2+mx8ZpfTJbOGVT1F6b+IjEaJFrZ5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqQ1wp8af1M0pv58PHVj8RZKEfAQB2y0/QV5UbbRSlycy9xKML4wRwgluNDi7oQPG
 85cbOHIm49UmuzBIWxSsk7v3UPTU27Sl54Hih4iQF+mD4c0k+H7sMibDef/qzJVIun
 FReAkAUwc6xnxINrobcAX3torKf8IYT3Vpm6UXwJr+2JK1sEW1p8KZudZ6Bm5MGzVR
 bqQCT3HhRHJw380/oRHxGZW1zrsLljompZs4HFpbxbfIey7Tvon0cI9qvhxv4W77qL
 bXgluULiG6LPFor+UATu3HP9/T8C+gXSRiXHMrG4YnyUAqyqvkTgn+tPbP3nJWA5ms
 9O0rY6GGO4dvg==
Date: Thu, 1 Dec 2022 22:55:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] kselftests/alsa: pcm - move more configuration to
 configuration files
Message-ID: <Y4kw6VErxaeDcKix@sirena.org.uk>
References: <20221201173333.2494019-1-perex@perex.cz>
 <Y4kF7fG70EySxDQn@sirena.org.uk>
 <92abef25-2cbc-eb10-bb4d-e9cae06d7383@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="flo8lt0x0gxthEpv"
Content-Disposition: inline
In-Reply-To: <92abef25-2cbc-eb10-bb4d-e9cae06d7383@perex.cz>
X-Cookie: Leveraging always beats prototyping.
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
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


--flo8lt0x0gxthEpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 01, 2022 at 09:42:52PM +0100, Jaroslav Kysela wrote:

> As for the generic tool, I would like to have an option to control all mechanisms:

> 1) only default config
> 2) only hw specific config
> 3) default + hw specific configs (merged)

> A new field in the pcm configuration may be added for this to build the
> per-device-stream configuration. If we merge those two configs, I think that
> only a field which will skip the default config is sufficient to cover all
> possibilities. The test names are a good identification, what was executed.

That's not quite what I implemented (see below...) but I think it's
not too far off.

> As Takashi already applied your set, I'll try to merge my code with yours
> and keep the added functionality.

I've just prepared a branch which I'm running through my tests now which
just does a revert, applies your patch and then does most of what I
said.  I'll send it later assuming everything looks OK enough on my test
farm (probably in ~1-2 hours).  All this working together is great but
one of us needs to move to a different timezone.  :P  I think we're
*roughly* on the same page here, just some edges to iron out.

For the config merging/selection thing I think for the merge we could
either add a section in the per-board config which overrides defaults or
just go with what I did where we add the test list, as well as adding
command line options to select only the per-board or only the
per-system.  Does any of that line up with what you were thinking?

The following changes since commit 7d721baea138696d5a6746fb5bce0a510a91bd65:

  kselftest/alsa: Add more coverage of sample rates and channel counts (2022-12-01 20:02:14 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git alsa-pcm-test-hacks

for you to fetch changes up to 9e96c58e581313bd639fd51f37c8e831d7b4a05c:

  kselftest/alsa: pcm - Add more coverage by default (2022-12-01 22:46:30 +0000)

----------------------------------------------------------------
Jaroslav Kysela (1):
      kselftest/alsa: pcm - move more configuration to configuration files

Mark Brown (6):
      kselftest/alsa: pcm - Drop recent coverage improvement changes
      kselftest/alsa: pcm - Always run the default set of tests
      kselftest/alsa: pcm - skip tests when we fail to set params
      kselftest/alsa: pcm - Support optional description for tests
      kselftest/alsa: pcm - Provide descriptions for the default tests
      kselftest/alsa: pcm - Add more coverage by default

 tools/testing/selftests/alsa/Makefile              |   2 +-
 tools/testing/selftests/alsa/alsa-local.h          |   3 +
 tools/testing/selftests/alsa/conf.c                |  26 ++-
 .../alsa/conf.d/Lenovo_ThinkPad_P1_Gen2.conf       |  43 +++--
 tools/testing/selftests/alsa/pcm-test.c            | 205 ++++++++++++++-------
 tools/testing/selftests/alsa/pcm-test.conf         |  63 +++++++
 6 files changed, 250 insertions(+), 92 deletions(-)
 create mode 100644 tools/testing/selftests/alsa/pcm-test.conf

--flo8lt0x0gxthEpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOJMOgACgkQJNaLcl1U
h9COgAf/VyxeMSIg6OpTLZwnfDlNMwYrv7uwosthMbkLJcGYb7Gmb90HXGgySACb
7GRJqv6MmCT5uurga7oWACYeeNSd61yS60h+2zEEUyuXU+uduAfGaJg9nEY76zee
riUBcfspalqD4E9lyY40GhONvq8C1sLR/75VfzKTW/0RzKfgldzZh5vLI0Mbh6TH
5TzFeTS8thOQA8i1ZkSYcksRMlDKE2oknGkmIdXZopVjCEEPKqVhVffhcrZwjsVA
XgoEBud2oLe4+umBRj/oAtcxq6qICWWyKlq7qunPuUiswXYB4yardZBvJ68O2NZ1
iyRNXM3K4FAxdDlY53QIw9TNOPpMYA==
=1Urw
-----END PGP SIGNATURE-----

--flo8lt0x0gxthEpv--
