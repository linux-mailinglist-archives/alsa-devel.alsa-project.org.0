Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A06489CBE8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 20:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE9523D4;
	Mon,  8 Apr 2024 20:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE9523D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712601950;
	bh=35TiYD0o4V5XmB7Kubpn4Ak35k4hMXKysdwn6S4+n8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oq9zVqzLpvCCQAGB/IFSV5VBZNcgaB4rcDTzAAS7pEySSNaEqp2I+CixKfH6rAlwS
	 wwlwpQvQeM+LG0zJVBjOPphH4FX70sIUSU8DlFpQeLYz5CJ3tt5jXozdZHUHiUhmwb
	 GP0f0Cd3XXy4GAcF/ffVTwXpRbeFL50qEIFBAnSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3945F80588; Mon,  8 Apr 2024 20:45:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0859CF805A0;
	Mon,  8 Apr 2024 20:45:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70930F8026D; Mon,  8 Apr 2024 20:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CF20F80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF20F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YruXFHCG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 617EF6137C;
	Mon,  8 Apr 2024 18:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C936FC433C7;
	Mon,  8 Apr 2024 18:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712601908;
	bh=35TiYD0o4V5XmB7Kubpn4Ak35k4hMXKysdwn6S4+n8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YruXFHCGCe2L9NFXzofTdJeeYgSkoxt+klwsjqc+56eAPpBAjWLxYY2u8YV3z/ayo
	 J4HtKbF0zpRwe100lWIEVQmyUOudQlRNn3iR1vA6JIRzaYUUUvSiGzX1zMZPJeJTYt
	 qp3obg1qWikrI+HA15p51x84U91OXz6iVTs7+kcELzN3+r18N7049kTcxhz9C0tWRP
	 tAvW2sVGBK0CwOQynH3Hug9bDmGH2w64gh72PuRyxBZC6MhWgHqx5yQbztQJ7WRSUV
	 bpJM2OYcfW0YXxs3u/di2LNbRpruZfYEpN6Dm3YeCL2oFAywgAQ9ppG/DTL72ujx6m
	 HRQJ6rP4yJPrA==
Date: Mon, 8 Apr 2024 19:45:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
	lgirdwood@gmail.com, conor+dt@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	kernel@salutedevices.com, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Message-ID: <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HMiKwoGIkQvD3cpD"
Content-Disposition: inline
In-Reply-To: <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
X-Cookie: Drive defensively.  Buy a tank.
Message-ID-Hash: FTNP72ZO7CWJK5LBCVZHHV2G7IYVTL7T
X-Message-ID-Hash: FTNP72ZO7CWJK5LBCVZHHV2G7IYVTL7T
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTNP72ZO7CWJK5LBCVZHHV2G7IYVTL7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HMiKwoGIkQvD3cpD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2024 at 09:40:41PM +0300, Dmitry Rokosov wrote:
> On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:

> > Userspace pcm, otherwise known as DPCM frontend, are merely that:
> > frontends. What they do is entirely defined by the routing defined by
> > the userspace (amixer and friends)

> > So naming the interface in DT (the FW describing the HW) after what the
> > the userspace SW could possibly set later on is wrong.

> > Bottom line: I have mixed feeling about this change. It could allow all
> > sort of bad names to be set.

> > The only way it could make sense HW wise is if the only allowed names
> > where (fr|to)ddr_[abcd], which could help maps the interface and the
> > kcontrol.

> The link-name is an optional parameter. Yes, you are right, it can be
> routed in a way that it no longer functions as a speaker in most cases.
> However, if you plan to use your board's dt for common purposes, you
> should not change the common names for DAI links. But if you know that
> you have a static setup for speakers, microphones, loopback, or other
> references (you 100% know it, because you are HW developer of this
> board), why not help the user understand the PCM device assignment in
> the easiest way?

I would expect that the place to fix names based on the userspace
configuration is in whatever userspace is using to define it's
configurations, like a UCM config.

> Ultimately, it is the responsibility of the DT board developer to define
> specific DAIs and name them based on their own knowledge about HW and
> understanding of the board's usage purposes.

DT seems like the wrong abstraction layer here.

--HMiKwoGIkQvD3cpD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYUOywACgkQJNaLcl1U
h9CJAAf+NxTZb3cXYXbGTve/uEzcktraeaWPmfFUvb/1M7/+tCcBBz0yT9v7uXI4
C9xy3I9MIztGRHi9jO6p25fZLtP+ln+t7E0M5/ZZwq9Q05hriYlM6ymQPmaXkSB7
9T7DiddU6mESy1rS2BUxYYYJTBNEmDmFmjq2XA0bn3Mg/FfRVkfDdsZ3uXl5SHIi
UYkeAdeNkOtHqg64KTPIVZcfAYm12yUtZT4z86mWQ1CH+rb/EpuPTkzKwaq/QKhH
XAwPgTdo2kjLEj136u6vQ0blmTxYjaNsh8u+FbIKIc6AYtWAFfh+UXox9D36Tdlu
71tgaf6AzlkMjR4U+gGfe99OK8NETg==
=7H+m
-----END PGP SIGNATURE-----

--HMiKwoGIkQvD3cpD--
