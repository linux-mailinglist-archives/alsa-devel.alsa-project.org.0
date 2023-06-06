Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01270724B59
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 20:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1938A74C;
	Tue,  6 Jun 2023 20:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1938A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686076000;
	bh=MiC4MxybN7xK1R36PsZKM5Zy6JeOjaqBkCPfv7Ncn0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JMwTNv27yurpaSrP2ZIplZlk/fg6emhXzCvXZRB2fbBVuPWe7M4ItSPQdefynAFLV
	 2E8dF5FIThFVkxqI7xXMDGcXOMCXC0WC11glAC+qG3b+iawFKpxINibpm+7Mu1cuF6
	 SaSKAOkTbtSpPwAly9ByL5mHFPjjrOzfx094+0Ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1081FF8016C; Tue,  6 Jun 2023 20:25:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA41BF8016C;
	Tue,  6 Jun 2023 20:25:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83A57F80199; Tue,  6 Jun 2023 20:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65113F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 20:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65113F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DfIPCZvM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0D20633A8;
	Tue,  6 Jun 2023 18:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC3BC433D2;
	Tue,  6 Jun 2023 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686075910;
	bh=MiC4MxybN7xK1R36PsZKM5Zy6JeOjaqBkCPfv7Ncn0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DfIPCZvMLrwThIq6RwTpqfyIOWEgHlxG2AEBVlA11dcAWqecYnb3fo2Xb6hsG9fpv
	 itxbTw3f7Pf7YLwnv11DeUFbsJLdt3uIJl3oZWAWa7rMUj121myceeOf+NUkH2Buhm
	 9Ws5h3GvnZHJW/jSytZQM1mv3Mm9puhXZOqWtsshKV9ytuoEdA785/JaUag5Dq/RUU
	 zuv58Hlue9x15bklQLYEKX6wg+Sd93lkuSVkJbPt8fFqBWOhDpXSy3iUdvu1MazI0a
	 8puNkXvKCatPDqUTgpAb0Ze/UEKiETQG5zzfFfUxMVXzp2YfgzBUFUlzAL0tyOUJn2
	 X+59Sf6pxpMUg==
Date: Tue, 6 Jun 2023 19:25:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: dt-bindings: audio-graph-card: Expand 'widgets'
 documentation
Message-ID: <d40f2c63-0b8a-425e-90a9-dd8f552ba782@sirena.org.uk>
References: <20230606175951.215740-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UC3JHzLeJunBTnWc"
Content-Disposition: inline
In-Reply-To: <20230606175951.215740-1-marex@denx.de>
X-Cookie: Keep out of the sunlight.
Message-ID-Hash: W7W4IZ6APQH75NN6VSMOVUSJ3IELPW7P
X-Message-ID-Hash: W7W4IZ6APQH75NN6VSMOVUSJ3IELPW7P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7W4IZ6APQH75NN6VSMOVUSJ3IELPW7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UC3JHzLeJunBTnWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 06, 2023 at 07:59:51PM +0200, Marek Vasut wrote:

> Document the encoding of 'widgets' property to avoid confusion.

>    widgets:
> -    description: User specified audio sound widgets.
> +    description: |
> +      User specified audio sound widgets.
> +      Each entry is a pair of strings, the first being the type of
> +      widget ("Microphone", "Line", "Headphone", "Speaker"), the
> +      second being the machine specific name for the widget.

This looks sensible to me, I don't know if there's a way we can get the
tooling to validate either the length or (ideally) the widget type
strings?

--UC3JHzLeJunBTnWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR/egAACgkQJNaLcl1U
h9BHwQf7B3p7OHMVFGQjrwAGXxP88n+12WctJbd/JuCiDXICv76wLFydE/BnHC6z
5D5KgJTDJ+MZ6yw1j1mNVAhuUP3BlhqvSeZtwd0R0c5bs28FPmngxG8anPllVzpT
gYc/Nhfj1u/TKFncmY5CXq4HJtKji9VsD033cbJ5T1KvJzQ5gD0ljOkkR7UjzmXh
wCU7H6CHHMBR9Vz03MDeOW4Ep6Eb79KeUdzPiZjRn4u0skdh/+p1XRQxK7Uddypn
Os+nZxdP8kXvHFr/X1qZz7fCQPNpRXCF2aKNbNS+qtsQEAbiX7G3fWiEqkdlIsrO
mxv7s3749KvviEyyauFfHf6WuE4G0w==
=MyiD
-----END PGP SIGNATURE-----

--UC3JHzLeJunBTnWc--
