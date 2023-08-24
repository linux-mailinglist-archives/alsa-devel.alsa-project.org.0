Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09517787B64
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6193686F;
	Fri, 25 Aug 2023 00:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6193686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692915549;
	bh=tkWHeq6k5D3EQ6/qO1M1boc34SY9YrJif+Kaz8/2ZMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TPAHaN33o9o1aq0zTXAZtpkQ1ZevVaRSMLrQ1yjh78YhHNrWLOVW61lRapncvPtFH
	 erOynMpYaQoICdsEDI8GStbYJ06YLFCZCiJ1dHfQ59OCA3wpHut4FSZmOkNPw1BjMu
	 WSQhuWVUTyDEZaqo/9szmjzqLdynTK3MvNyt/y20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF211F805BA; Thu, 24 Aug 2023 23:53:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6514FF805BB;
	Thu, 24 Aug 2023 23:53:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD3D5F805BD; Thu, 24 Aug 2023 23:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65938F805BA
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65938F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VEHMY23W
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62BFE630E7;
	Thu, 24 Aug 2023 21:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6F7C433C7;
	Thu, 24 Aug 2023 21:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692914018;
	bh=tkWHeq6k5D3EQ6/qO1M1boc34SY9YrJif+Kaz8/2ZMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEHMY23WWmJEx7oOxgVJJjj+5yWFxJiK3V+1FXoWFDpVF+FuwzROgcqxJndJF8b98
	 w3fyYLMwzyxiCm12+DXiAnwSNusN+T5AFYM+Eoh13KpvQ424Cq6cYTYnTD5V+wXIFt
	 ztUmAmZdmMzTqjBijsBVLd7fyp922Eu2Z83DukO2cKOZjFXcvLaNtWQB5sWXkAQCU+
	 h+POOP/RSAkC+PA6fk6YTFuP8GuHPOjEl5BZPHtfjQHHtRKOwhdW6OkNZv+bj5Telz
	 YMJI5bUcyhvUUK9CTX17JDBRfS8ursoQxSVZeiicgL7mUIT4fDQB/5z7/coZwYlUub
	 fPBAK+eHpaARA==
Date: Thu, 24 Aug 2023 22:53:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: es8316: Enable support for MCLK div by 2
Message-ID: <ZOfRXjuSTxSV89SC@finisterre.sirena.org.uk>
References: <20230824210135.19303-1-posteuca@mutex.one>
 <20230824210135.19303-3-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nohjNvg5OLaKpTCH"
Content-Disposition: inline
In-Reply-To: <20230824210135.19303-3-posteuca@mutex.one>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: UTOMZXBSN7SLXJWWCXHS6JI4X5FT3T7H
X-Message-ID-Hash: UTOMZXBSN7SLXJWWCXHS6JI4X5FT3T7H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTOMZXBSN7SLXJWWCXHS6JI4X5FT3T7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nohjNvg5OLaKpTCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 12:01:33AM +0300, Marian Postevca wrote:

> +/* In at least one AMD laptop the internal timing of the codec goes off
> + * if the MCLK (48Mhz) is not divided by 2. So we will divide all MCLK
> + * frequencies above and equal to 48MHz by 2.
> + */
> +#define MAX_SUPPORTED_MCLK_FREQ 48000000

Given that the datasheet quotes a maximum MCLK of 51.2MHz I suspect that
this is far too high and that performance is degrading well before this
point, it sounds like it just so happens that you noticed issues on a
machine with this MCLK rather than that's based on the spec.  I would
instead suggest applying the MCLK divider in any case where we can do so
and still generate suitable clocking for the rest of the system, or at
least hit 256fs (the datasheet quotes 256/384fs on the front page which
suggests it's targetting 256fs, that'd be a fairly normal number, and
there's mention of 12/24MHz USB clocks being directly usable).  Doing
this should either make no odds or result in better performance.

It's probably also more power efficient to use a lower MCLK, though most
likely the difference is marginal.  The earlier in the clock tree the
divider is applied the lower more of the chip is clocked and all other
things being equal a lower clock usually means lower power.

--nohjNvg5OLaKpTCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn0V4ACgkQJNaLcl1U
h9AwVAf+NNSivaoevGjiOze1TmfH7OzLeB1PW0sdIwpa7eQxGroC1UQleHHI5+QL
wkFNWQ6to4WpwL+M2X/v7VIFN3rc5zHjF8fKJbP+22gEs8+FtReeE6dDogBFI/6u
H4A8KYh0Qjwhnmlcz7GZaC1rmbpnbHY4T1no1RPlCQmR473yfWBpf7Eo3RapR/4a
VmG+rkIrE17qAlcyj2o+eW89o9YqPR/FHhKauqbqzg7DMQusNk3VkhjhM6qmBbR6
/mbFCk36d6Jt9VKC8mVdwbCPLJdj96EHpKPHzG5sWPbxRbfcHOGRQPt7n5YlxXmr
uMu9+dBH/nte3EjXrpRi3OM9qUbVJw==
=6SaS
-----END PGP SIGNATURE-----

--nohjNvg5OLaKpTCH--
