Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C26E9983
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 18:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0087EA7;
	Thu, 20 Apr 2023 18:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0087EA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682008184;
	bh=LmwKwa5x3j1fsAg5wet8TyPTz8ZTtZ8YsYPimeMNywM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DKCTN2P8zVp3LgA97j0XCY2bHHEPephQBcA7tA30svBarvI6hgXs1Gr3PDhJZfynF
	 CQOdMYJUijTqYU5Rl/R0Se0Tqwbsf134sI8Ltdwjfd1cEDGP0n5B0ecAs6xrFM9H5U
	 vuNMUMuuAqLLz/G/edZjA2bcuwUnd84xw132i+jM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B5FF80149;
	Thu, 20 Apr 2023 18:28:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F72F80155; Thu, 20 Apr 2023 18:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FC34F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 18:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FC34F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l+iDwcCk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABF566069B;
	Thu, 20 Apr 2023 16:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1934C433D2;
	Thu, 20 Apr 2023 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682008116;
	bh=LmwKwa5x3j1fsAg5wet8TyPTz8ZTtZ8YsYPimeMNywM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+iDwcCk+BWmI7O6X2A3m8ISKsoa4ajtFQVPix1cqfnvx2Dd0CHPhHQBGu5kDYV7e
	 tFqTxRzV2+7lc5au5i27h77ZDLutyREV5it0cf0V0Nlm646fdIk22xOEeoOpsz8U/S
	 jZBkYM6hFnYuG0ecqmzptnKSJMY5ZKCsKLRJJY3/o9M6zGQIQbblNx6tXDEV3CIvqu
	 W8JqwiKECP8e02W3qWxtTpJ3MJrsibdshYceTwdhKSDWVtaGObAQ9X54MKHcugADFd
	 e58awnadbfZsWdkB6jDdAbfLX2rPys45gnMo9cOG6TtXYjzcqQ0B6Fq9ir04V+rG/h
	 txLNTyLUDcybA==
Date: Thu, 20 Apr 2023 17:28:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Message-ID: <9942c3a9-51d1-4161-8871-f6ec696cb4db@sirena.org.uk>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
 <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
 <d746ee5f-283d-44ce-b72c-18c8955d38b1@sirena.org.uk>
 <3eb0cbb4-f6d9-db8a-031e-92627e70f41e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gITbTckyPcLwKRdn"
Content-Disposition: inline
In-Reply-To: <3eb0cbb4-f6d9-db8a-031e-92627e70f41e@linaro.org>
X-Cookie: Above all else -- sky.
Message-ID-Hash: 6INLMBIOQOTSHDS6U7NYHVIGLH7HQZVF
X-Message-ID-Hash: 6INLMBIOQOTSHDS6U7NYHVIGLH7HQZVF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6INLMBIOQOTSHDS6U7NYHVIGLH7HQZVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gITbTckyPcLwKRdn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2023 at 04:16:59PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2023 15:00, Mark Brown wrote:

> > That's just upstream, what about any downstream users?

> Life of downstream. We all know the drill: merge your DTS or suffer. The

No, the DT is supposed to be an ABI.  The point in having a domain
specific language with a compiler is to allow device trees to be
distributed independently of the kernel.

> I could rework this patch to provide backwards compatible solution like
> I did for WSA:
> https://lore.kernel.org/all/20230102114152.297305-4-krzysztof.kozlowski@linaro.org/

There we go...

> > We could handle inversions through an explicit property if that were
> > needed, that would be a less problematic transition and clearer in the
> > consumer code.

> I am not sure if it is worth. The DTS is supposed to describe hardware,
> so even if reset pin flag was not effective, it is a mistake to describe
> it as ACTIVE_HIGH. Do we care about keeping broken code happy? If yes,
> then property is the way to go. If partially, then I can add
> backwards-compatible approach like I mentioned above.

It's not just this individual transition, it's the whole thing with
encoding the polarity of the signal at all - it's a layer of abstraction
that feels like it introduces at least as many problems as it solves,
and requiring configuration on every single system integration doesn't
feel like the right choice in general.

--gITbTckyPcLwKRdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRBaCwACgkQJNaLcl1U
h9An4wgAg4BjTPfGmE0oLuvE3Vnm9Cp90JDIgemZSx7SRbTmreZz2bWtJKZLiTwE
slZczeTfUoyJQQWSYiLMo8yUusyLKDIwwBiqFZpfIRkqsraunsNvZ6oOza8xYMLx
Iw1wnmuc8zZIhP/D50uNZf2Buu2kNJlRoOlnaJYjdtLQGLZ9m4IVvuLLir17db48
xeU7l0PDGu+8QCzauKejtsB3Wx88tzH5RGBDMaKLfSlQYjw0Wl7NomJLHwM0qHaL
rlJpbIX36PWlfaqFFkvk6vMvKywcomquZjdDTWUPYYZn2VD44xQuQZKmnphMKDvH
pTFKQZn95I+od+weN7Z49TVSFfD9MQ==
=d3uX
-----END PGP SIGNATURE-----

--gITbTckyPcLwKRdn--
