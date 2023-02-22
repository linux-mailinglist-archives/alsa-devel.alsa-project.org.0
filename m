Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB569F43B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 13:17:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A7DEA6;
	Wed, 22 Feb 2023 13:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A7DEA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677068234;
	bh=f4AqES9u89TU5lnKVaH/Dh6alXUUeZYcLZDLaamkE8w=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FgUkpOCOSn0ZDEG1mA+wBePNdI2dclw4zltTzRQ5/XVP3/tM+rDY1uFReFT+0qP/J
	 1uN0+9Q8p83rP1ArMqdlawdDhBN/UIw1efoCk9nBqGUSk2Y73PKYosQs48xXPo0GOK
	 RgcYk9kLh+vC2aokbyBQcDfVYOQivHRdMqYH4lOw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82036F8025A;
	Wed, 22 Feb 2023 13:16:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24300F80266; Wed, 22 Feb 2023 13:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EB90F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 13:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB90F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pXP1mDpU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 687EDB812AC;
	Wed, 22 Feb 2023 12:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E0EC433EF;
	Wed, 22 Feb 2023 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677068171;
	bh=f4AqES9u89TU5lnKVaH/Dh6alXUUeZYcLZDLaamkE8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXP1mDpUHpJnbTn/t9XShYZs4yvoJP3zXr+BUx8UDw2sdscYRajov5NnaqzrPfT/3
	 KbqbVpVtmEp8UhQLcZ18TsupFKw62WwVfHACsCN6IDacwT8VA/r/P04p4lvoIcgKX6
	 yNId43Jxp9MIXkEnzpeodyOdR8+ZDJyZOtzvqa6m4JdekpVT3WtDIDT2p9othQ78DG
	 TNHlZOntinsbvyvGS46exQQoaDkgk8mKt7v/AkLC57TM+2B1TTYodbaoluCJRnUre6
	 isIPqnNFWM2wWoStBvlgt0DS7No4/KlJWDurbpbwPRfNJ96tKWqu4Ljij58s+7pQYB
	 9Qrw3uFiKl3SA==
Date: Wed, 22 Feb 2023 12:16:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per
 gpio
Message-ID: <Y/YHgn72PI4CQ4jg@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-3-clamor95@gmail.com>
 <Y/VA3HK/jGVPbrqb@sirena.org.uk>
 <CAPVz0n2cHvKfez6=ydR8HQfAfM_bipmAzav76Gxmp6pF4wLuhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pf0Zmmq6YW6dHegE"
Content-Disposition: inline
In-Reply-To: 
 <CAPVz0n2cHvKfez6=ydR8HQfAfM_bipmAzav76Gxmp6pF4wLuhw@mail.gmail.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
Message-ID-Hash: 6DFVUYNGNTGMAW6MBBQ2WZKKANH5UMSM
X-Message-ID-Hash: 6DFVUYNGNTGMAW6MBBQ2WZKKANH5UMSM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DFVUYNGNTGMAW6MBBQ2WZKKANH5UMSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Pf0Zmmq6YW6dHegE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 09:53:28AM +0200, Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:08 Mark Brown=
 <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:

> > On Tue, Feb 21, 2023 at 08:32:03PM +0200, Svyatoslav Ryhel wrote:
> > > This feature is required for coupled hp-mic quirk used
> > > by some Nvidia Tegra 3 based devices work properly.

> > Please submit this separately, there's no meaningful dependency
> > on the rest of the series.

> RT5631 by machine driver commit contains a coupled hp-mic quirk which
> requires this commit to work properly. In v2 RT5631 machine driver bringup
> and coupled hp-mic quirk may be split into separate commits.

This is needed to get the machine driver to work at runtime but that
doesn't block getting this merged, and there's no build time dependency
in the other direction either.

--Pf0Zmmq6YW6dHegE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2B4EACgkQJNaLcl1U
h9DRsgf/RCG23nPnnVRzCrfVLyrHStlD/EEOzmGlpWMsUNpfGf+dZao8XLMsRngw
mV2nXT0E1siPYCKxTk06KWPpSF1+MGYAO7yXsPkJWSWSzWuuh3ZuIU3OcoVMAWsC
VV8DbcqSXrovVbVIDgFcwIAmrVXWrNLogCiZeZqwJO6lSyPSXtVHjaH6DRpQ+/m2
2XfxdKoG7ecQTv1U6whNGZ47bEplT9XaDFAyEjHQTNYJhwzsPzl+Wo2oDzUe4uVK
v2OUOWUXhHTWlhIDORfFiiQ0GI4JMB8AbdQ6/rDAbvJ42QkS6A2anaXsIvtdU5Ta
F6DhUvXU+I+8SkE0Lia8hkm2nIo8CQ==
=9wj7
-----END PGP SIGNATURE-----

--Pf0Zmmq6YW6dHegE--
