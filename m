Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A77738E7A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 20:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5046C1;
	Wed, 21 Jun 2023 20:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5046C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687371650;
	bh=nTV9RiBRV0XxdfsvMmpFlcA+BferCSjEfKms+dD19HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Op3Gf1ACKSNtPQ2QdogexCxwb02F2ByLTJRS5Z6z2NL+fSN8L2VnrpN1ovNX/B2Ky
	 pAePtSjxb2dSpNH1uscXsJcbLjg3oP9wZDQ6wOXfb4eq1M+SPZxI4iMIZWITFfprB9
	 rur6rc+EC28BKRtW8MqRnL1msM7vBzVchZ+hF2UI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21113F80022; Wed, 21 Jun 2023 20:20:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD827F80132;
	Wed, 21 Jun 2023 20:19:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0940F80141; Wed, 21 Jun 2023 20:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE4CCF80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 20:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE4CCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rBD3XV3+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D85861658;
	Wed, 21 Jun 2023 18:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616F6C433C0;
	Wed, 21 Jun 2023 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687371591;
	bh=nTV9RiBRV0XxdfsvMmpFlcA+BferCSjEfKms+dD19HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBD3XV3+p1bFXkOdw8a66gAfh35qLVsuEJJ4JVmFpN07Yi/VFFfiOcilvJaLQHGxS
	 iYEIg82CEyC2zr7uIQiBJ0qyNmUGsvbbn+l9rxa+qmcwvv2EGNJ/OTJ7uMayB+8PKl
	 wJ0FEa5CXKLPuYa7vRfVsuvvll5eFzRnceUaRVfzoSQIWGw2YI0Q3FmjVTNjCtFsu4
	 0Kmrz5TeRQ3C2/DYFnY2dFPm3EISbbharOnkRiWhkszeUqHdbqLrQECKvE/GZA3WHN
	 SdaS9elvNehkI/LoPHw5UJnNqvr4nm2TaqaRJcEaKcz9C04G2iXq0CY7uCOb+qHXTo
	 57qR1Md+rLxSg==
Date: Wed, 21 Jun 2023 19:19:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: =?iso-8859-1?B?Ik7tY29sYXMgRi4gUi4gQS4i?= Prado <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <shuah@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
Message-ID: <06b8bfde-e4f1-48ea-aa3e-35d2fe5df046@sirena.org.uk>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
 <20230620220839.2215057-3-nfraprado@collabora.com>
 <33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
 <443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
 <9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
 <5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
 <87352krcz5.wl-tiwai@suse.de>
 <f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
 <87wmzwptu0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+O0SrHBBBg9Awh68"
Content-Disposition: inline
In-Reply-To: <87wmzwptu0.wl-tiwai@suse.de>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: 56WAO66L6LDGU7LQWUQK3IZKSMFKD7IE
X-Message-ID-Hash: 56WAO66L6LDGU7LQWUQK3IZKSMFKD7IE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56WAO66L6LDGU7LQWUQK3IZKSMFKD7IE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+O0SrHBBBg9Awh68
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 08:13:11PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > It feels like it might be good to let it cook for a bit longer before
> > going to Linus (eg, applying after the merge window) so we've more
> > chance to see what the impact is on other boards?

> I'm fine with that option, too.  Are most of selftests performed on
> linux-next basis, or rather on Linus tree?

For KernelCI we've got coverage on both.  I can also run stuff on the
boards I have in my lab on demand of course, but there's more coverage
in KernelCI.

--+O0SrHBBBg9Awh68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTP0EACgkQJNaLcl1U
h9Am+gf40/bpS7iIA5RSIo3+i4yZu/3bXuKMGIMrCX7dBLmfsu0mDyN/snxucJGj
vfgjS3Cyoq9qZlSZSjCPcbp+mznSagKLZLvqqXpcXusg1e4AvThZgzIgZ0q5ZfpC
ATgKm7rKG9Y8ZEUSZGzNnXoqehYPwg5HxkiB1vTagVHkPoyHg8iNrKCZM2AHKEc0
8NqOUOwweDSnZwzfa/MUzUTqJ+nhkMN0xQB/qsQznVqa2T/jROtBd5g++oyRNQXv
0C+3TBI4E18DV+mYQccPFdt08HxFmkaezacElViS65N8cuVtP/5U+nXKcIVC5rM9
xMtUNgfipI/7PJJGmJpnMUqr6Ul+
=Ckr3
-----END PGP SIGNATURE-----

--+O0SrHBBBg9Awh68--
