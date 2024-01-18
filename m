Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C039831EFD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 19:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90107825;
	Thu, 18 Jan 2024 19:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90107825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705601521;
	bh=7HxfecGY7uZgdsol1Qo2cUjoPAbeDfayvo1koO5ULvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bgcr0zjIrVfsFg8lZ7RRRbNmRLk9gi0Gb/JerxfCBUEr6ySYTIZJm6TYjS90de9Gd
	 cNtLi3PegBRMRipKm8g+ox8VEZgq84cgT8aHWcM3e7QQuU6oP49q00yHTge7gE+bar
	 jWbkC6NWxjWk7IhyJXUQ17aLnqGPAnI4lXo7hd7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04101F80579; Thu, 18 Jan 2024 19:11:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C6CBF8057D;
	Thu, 18 Jan 2024 19:11:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3EA2F801F5; Thu, 18 Jan 2024 19:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 315CCF8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 19:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 315CCF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I1DTRCtl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC6B660AE7;
	Thu, 18 Jan 2024 18:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAFCC433C7;
	Thu, 18 Jan 2024 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705601476;
	bh=7HxfecGY7uZgdsol1Qo2cUjoPAbeDfayvo1koO5ULvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1DTRCtlzWHnBBSXCYXrElu6RGkLsiCfEInH0glYNuO6U5ns1lW8CHrO2gB0d49xi
	 43DYWUjn70KACnl9rExL4JOXQk1sRGqyWWHl5j6eHUa3fsBDicqSgKmSx2ME4WmzFi
	 MikB+qb43aBUK30QyHTevkn278Bo0WVDljQ87MDvBcm18cIzKorUuhGppsqm4OBqhe
	 hlmmFKj07PQIVWLdD0FmuOScqc2P0/JRY/H/9/U4dNHFRDvgVyI9qsiBhUfxMcXe8Q
	 G/m1LwKEp7Q5KYFiWdH8HF4Y5PoNyw+M8/NNFLg2Vqz5vs+kqYT6mWLyY4zCu/EB62
	 lyESpAH4u0aYg==
Date: Thu, 18 Jan 2024 18:11:09 +0000
From: Mark Brown <broonie@kernel.org>
To: andy.shevchenko@gmail.com
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] ASoC: cs42l43: Add support for the cs42l43
Message-ID: <aec96f5a-b759-48c7-a5ec-bafe3bfa5357@sirena.org.uk>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
 <Zali4qxdegY7H6eY@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="97E1gLHhLegY+sZD"
Content-Disposition: inline
In-Reply-To: <Zali4qxdegY7H6eY@surfacebook.localdomain>
X-Cookie: FEELINGS are cascading over me!!!
Message-ID-Hash: YM3YEGR6XRO5QOAJ2CZMOXV6YHRA2EZY
X-Message-ID-Hash: YM3YEGR6XRO5QOAJ2CZMOXV6YHRA2EZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YM3YEGR6XRO5QOAJ2CZMOXV6YHRA2EZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--97E1gLHhLegY+sZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 18, 2024 at 07:41:54PM +0200, andy.shevchenko@gmail.com wrote:
> Fri, Aug 04, 2023 at 11:46:02AM +0100, Charles Keepax kirjoitti:

> > +	unsigned int hs2 = 0x2 << CS42L43_HSDET_MODE_SHIFT;

> BIT(1) ?

Given that this is writing a value into a register field called "MODE"
it seems very likely that it's an enumeration value rather than a
bitmask (and similarly for all the other places where you're making
similar comments).  Please think a bit more about the code being
commented on when making these minor stylistic comments.

> > +static const char * const cs42l43_jack_text[] = {
> > +	"None", "CTIA", "OMTP", "Headphone", "Line-Out",
> > +	"Line-In", "Microphone", "Optical",

> Better to have this by power of 2 blocks (seems it's related to the possible
> values ranges in the HW).
> If it's just a coincidence that there are 8 of them, perhaps other (logical)
> grouping is better?

This is probably well within the realm of driver author taste...

> > +	// Don't use devm as we need to get against the MFD device

> This is weird...

This is normal, the splitting into subdevices is often a purely Linux
internal thing and not represented in the firmware description so
external resources are linked to the top level.

--97E1gLHhLegY+sZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpab0ACgkQJNaLcl1U
h9C5DAf+O6KGhhljQY7I80+eSBdyZV5AJMoCpfMru36z4haLJoHDqhn+67FC1yql
1n/AnyJAp3Nl19jHZ4inj+wTpH5+NR0blMMfw0R9FL7jpzbq7b6LgSC+hqfi8vDS
nY2R6zSnnnOm3HxpKrbxFx82jDnVtZumBuJbfW1kL8tJC52DBVDLOpiY+mPpd4jh
OUNcrgsFpw3GMcX6GapLflbfqYRvP8BIZtfhYlHkjRiO/aj9THItdd31GnAOzFpK
R9hyiVdneKaNBHpvRv+XVI355y3eDqACVK6L3ERBXMHDAhXZnBP/n8J/sRJxARn4
MTeH+5L7hG1IzL3kXWLBUbTnfJl+Hg==
=mldP
-----END PGP SIGNATURE-----

--97E1gLHhLegY+sZD--
