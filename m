Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280C84C84D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 11:08:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFEE8832;
	Wed,  7 Feb 2024 11:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFEE8832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707300525;
	bh=EkwACTzf00Vm/obOE2SzPEMWc5wOta4JYj23H9ozjA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mQxHi4IFbkF47VmWLOgwsAbIOYBJJIRSso9xyFgjMfRNOMB1Ppl17kll0ASmGYpSS
	 PqlRx/St7Y5G29tgTLcumzv99PUNtcfRzRSH8c17n4eYBsTBaSmbIH8GHZEkXNMyDn
	 m/jO1yhziJuqLG+RNjEKxv2OAmbCWuDBW983csjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABA54F80588; Wed,  7 Feb 2024 11:08:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DCADF805A0;
	Wed,  7 Feb 2024 11:08:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5ADDF801EB; Wed,  7 Feb 2024 11:08:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3638FF800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 11:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3638FF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X5FymLmt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C201CE136A;
	Wed,  7 Feb 2024 10:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D45EC433F1;
	Wed,  7 Feb 2024 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707300469;
	bh=EkwACTzf00Vm/obOE2SzPEMWc5wOta4JYj23H9ozjA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5FymLmtm1UGv7rkSJUzFy/XqjAr+KzKn+Z4vBg0y6VPeeIs7oUzRGtyzVC1MUOm5
	 yAldIueXVQy2srgXS/Vfzr1az3K/exwAYfoHlitZlVVGtSHJFLn811wQlvjOpdSw74
	 xR2c36tsRYw1WoEC9F8wi6LGmVFIOxk0HepkyAmTP1Oi7yWm76dSrotGLw+LFRqjHQ
	 QQdz8jQG0Gr3UCirtOjW8LcsBb8SpY46QTm8EVOjJ+1FAlad+bJ7NxEcG66OMXMFUd
	 oQxOtsGkMWRT/uyG12NiSCf99MePyJwoKAD1lsjdsaAp19vYfmZi23BE5TuyU6NuN6
	 82d1BXiTgN/Zg==
Date: Wed, 7 Feb 2024 10:07:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: tas2781: remove unused acpi_subysystem_id
Message-ID: <ZcNWcqYEmUjtusfe@finisterre.sirena.org.uk>
References: 
 <df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
 <7f056a4148fec176812ff6cc490860bf565b161c.1707255917.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXz+AyCXtdSYrj6n"
Content-Disposition: inline
In-Reply-To: 
 <7f056a4148fec176812ff6cc490860bf565b161c.1707255917.git.soyer@irl.hu>
X-Cookie: You might have mail.
Message-ID-Hash: GNVF3CS6EDWKJFSIDV2CRGN4R33KFQAG
X-Message-ID-Hash: GNVF3CS6EDWKJFSIDV2CRGN4R33KFQAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNVF3CS6EDWKJFSIDV2CRGN4R33KFQAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--dXz+AyCXtdSYrj6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 06, 2024 at 10:49:29PM +0100, Gergo Koteles wrote:
> The acpi_subysystem_id is only written and freed, not read, so
> unnecessary.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--dXz+AyCXtdSYrj6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXDVnIACgkQJNaLcl1U
h9DhAggAgjqcZPJB5AA1yAgHmEW8VHnic9bdCPfZ3NDI5u1TWV2Hm76K2lDfH8/2
Y+2/GH/XZpEKdIiTSGlYvG0fTERM2Z80deweBmYSZ2TcavogndomZNdIiYGn6wqk
7QN0z7xR6O4lQJ6DZDecwcyLGD0BS5RSJDN4LNuKxK6liQfh/vRvxw7kviUoPxz1
H55nlOVs2+wuz1O/0+wvshJAwaHXNnBe0cjLkQD6iCz5mh9ldGx6T9dD28auycxw
IKKfGs5CWvJWz34oZZOgCMLEIZCvlZzlR3WVeHf3Ez6iGGdhFwIN3JVVbw3bPYOE
x5lnK1d3s4s9NNStBoAIqZzWoCnWLg==
=UT7t
-----END PGP SIGNATURE-----

--dXz+AyCXtdSYrj6n--
