Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828D68F5C2
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 18:40:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B94582A;
	Wed,  8 Feb 2023 18:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B94582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675878026;
	bh=x5D1v44TfkTZciEELrTCn8yNDssP2aPN4STf6+woJyA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T29+SExJU4MXkUWq17/vMMJDqYRYivXkeqKBTcgkuYYqd7edOMOC+Z/8oluUvuxvI
	 jJ7Iepom1mW9pzD6x/9A5cGwsgWFeaKO2WiQ2XxycJ4KKs9ZeiVp3t4mVa5zvi8rMC
	 1YDV+OrvC5JcvCQoBRp2B58cn5HzyDH7A3abg3P8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A510F8010B;
	Wed,  8 Feb 2023 18:39:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EADBF8012B; Wed,  8 Feb 2023 18:39:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D161F800E4
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 18:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D161F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pv8mKkIN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A037B81F19;
	Wed,  8 Feb 2023 17:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA14C433D2;
	Wed,  8 Feb 2023 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675877964;
	bh=x5D1v44TfkTZciEELrTCn8yNDssP2aPN4STf6+woJyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pv8mKkINDyj/chcSgHIZlUO4ObbGI4WTK246iYw9iK26fsgDNjM8h1maTrcJ9x5Yg
	 Lu55Uq5KROrkqnwn8ajpGyFnd3R2svQZ7XQ3bWP0p3CCnV5UHR5RZ8nbr3XP0Sc0ow
	 HO5bIdkJwNv+Jn0g8xtMztQ+vwciElnBklLJhESI29/5uO4akyVkJNUPkEDdUdyNcQ
	 1izDB6nqrZDiKgbX1bAIKFEvkK+6/2t7UpI65+GoRPyMFBH2mW42Dc/nN/Ajwu+N0J
	 0f5/4TmDaQcSOPCnbOKoXpWhvfYqvEdtlixy4IbjEXbTMysDimgu2nmjbJ7b7MxAD1
	 AHeEoPdbqn/DA==
Date: Wed, 8 Feb 2023 17:39:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Message-ID: <Y+PeR4EFfcVDbUfV@sirena.org.uk>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LbXOcrSJthApyg7e"
Content-Disposition: inline
In-Reply-To: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Walk softly and carry a megawatt laser.
Message-ID-Hash: LKFILOEVLBBLQXBVKR5KJPCZR4I4GCJK
X-Message-ID-Hash: LKFILOEVLBBLQXBVKR5KJPCZR4I4GCJK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKFILOEVLBBLQXBVKR5KJPCZR4I4GCJK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LbXOcrSJthApyg7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2023 at 06:25:52PM +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
> schema.

> Changes against original binding:
> 1. Add missing LDO1VDD-supply for WM1811.

Both LDOs are present on all variants.

> 2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
>    gpiolib already looks for both variants).
> 3. Do not require AVDD1-supply and DCVDD-supply, because at least on
>    Arndale board with Exynos5250 these are grounded.

Are you *sure* they are grounded and not supplied from the LDOs?

--LbXOcrSJthApyg7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPj3kYACgkQJNaLcl1U
h9DxOwf+KNudxKFl1rIurGb3jgncHVqN9TlkDoZh7sfauE0He0PsMCtH07bpt28N
Okf/Wf+7r/oY0OvigxxprrYGaVO4QlVZqTFocS5VSFse97Vl3vXIlFv7ZZ563qmB
FK15zIm/k/I5XjzZMfQnkB4p/2qAVYTld+CA9/KW5zymhuw12sF3uv/N33YlejRD
v10mWtG9k2oRTxCXmb+q3qZPcxNK5v19Tli9cykxjm4H9Da/QoJsSW2C2KFJjies
3MJm9uu0mAheXuHBmftvsaEL0NRuWnvDE53PjNDPfxs1KrdBE0l8sJZYIPoNq+An
5CfKLqo34KKLXEz7IRELHR7nX0OO2A==
=gqSy
-----END PGP SIGNATURE-----

--LbXOcrSJthApyg7e--
