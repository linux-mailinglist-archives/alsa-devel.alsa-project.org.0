Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A772C4A7181
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 14:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 772CA172D;
	Wed,  2 Feb 2022 14:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 772CA172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643808364;
	bh=jchafuS6+vgsXiYnWLpJZef5yK8Vi9yCKhPRLY9XIYU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAg3G9K0htvJ9vIaipeLyQ/2f/wYwvyVXrGQ1Z7dUt033hOtoTN6jViJUvvJ6Jt6Q
	 5Bi9/8hMhh6DbhJTHhOlqocN1Yhqhs/NPA+ke3OG2fdT9eWCQ9fpI0Rc02izqu4ZKv
	 vya+o48mq3gBB31uOgx1VaxbJXmaSrqK/gl7tex8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A71F804CA;
	Wed,  2 Feb 2022 14:25:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 989E5F804B0; Wed,  2 Feb 2022 14:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 459B3F80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 14:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 459B3F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t+wbDdbr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DB52617C5;
 Wed,  2 Feb 2022 13:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D83C340ED;
 Wed,  2 Feb 2022 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643808307;
 bh=jchafuS6+vgsXiYnWLpJZef5yK8Vi9yCKhPRLY9XIYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t+wbDdbrzp+LdeTHhq+CwqAEM19xFXWbBh+pnpwJ5F2hTXAlGxlv//iRG+s21sMvn
 zCKcoYOXoIghmr9Lsmrm19alsdMs0oqf7H5AEkwhnszjPq31nNkaHch8WaSCQe4Cwg
 9aiNNvaJ4xDZ38DFNjCAvUNsSECRSDuXrdHC9DWplPnFted5A6kLIt+k9II6Ne81is
 L7urJ4VRUQLd9XdGUIwuRPP6/4V8SxIVPJ9gSMPv1CZYhnr/faWszWRCjitZM5W90Q
 wsldzHWd/onsINGMfpmOlmanvJI0kM1n0lMV7AW90/JyoBpXj9QcWE+K0wuvoW8JWS
 LreF9gj10eSpw==
Date: Wed, 2 Feb 2022 13:25:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Subject: Re: [PATCH] ASoC: amd: acp: Set gpio_spkr_en to None for max speaker
 amplifer in machine driver
Message-ID: <YfqGLtmGBsD2WqtH@sirena.org.uk>
References: <20220131203225.1418648-1-vsujithkumar.reddy@amd.com>
 <YfmCWuD88sT8YxfG@sirena.org.uk>
 <CAOReqxiGW+8BR5VRVHDJuBXxkpB_oQ_4TTNBqm1tuK6shUKLpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OYVC+pEbH0ukOWFY"
Content-Disposition: inline
In-Reply-To: <CAOReqxiGW+8BR5VRVHDJuBXxkpB_oQ_4TTNBqm1tuK6shUKLpg@mail.gmail.com>
X-Cookie: Quack!
Cc: ALSA development <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "Pandey,
 Ajit Kumar" <ajitkumar.pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
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


--OYVC+pEbH0ukOWFY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 01, 2022 at 01:43:38PM -0800, Curtis Malainey wrote:

> Yes that is correct, this is the quick fix that will alleviate the
> gpio contention issue. But I think there is a better solution here.
> According to the sheet I have, the pin for the alc1019 is the same as
> the max98357a and its a shutdown pin for the amp.

OK, that sounds like it should be added to the driver then.

--OYVC+pEbH0ukOWFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH6hi0ACgkQJNaLcl1U
h9BM6wf/bydWhYb/gkHNtrvSQ/dJxc7Gf7XsY0PY63Xddav43XnO7jtGQHNgIusX
TGAwX/Nv1vdJO3clfk/cwBTy8mXL77lEBiEY+uauRpbD7N215EDFKBO/oYOoMmGB
8G/TGXoxF6FVirgzW2MhYh8Kg3biGxV2xQ5B+oBKW1QvCYp8cvP026GjuegtWJSa
WbvAo3nan6hAo8M3JoYl0/UiUQT22Lt+c/JBhrqKtTVsWiQ9m96W+5uU1qyt3B4E
5NNXyzFvpRh2k0AonStGPzaefdVSRAArEUNKq0wZO0OzWJJ5xUF1Ru19m8CSvygz
jebBoykr+hBTV4pb9Qlv27O7vxYiag==
=18y7
-----END PGP SIGNATURE-----

--OYVC+pEbH0ukOWFY--
