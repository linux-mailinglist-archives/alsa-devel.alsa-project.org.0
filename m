Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E81813575
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 16:57:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B888D868;
	Thu, 14 Dec 2023 16:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B888D868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702569447;
	bh=Irc7j9mhIhkTjruf9MUgxUtXcKks1NoDo+o05Js0JRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n9UtGbkaedihNlwyl1YE3JyEfJ6YYWDCVfH/fqVEw8F1/Ac7DPJyNuqmlJ3a3f6KW
	 2GwOqlgZorCKQWI5K3vGhO/0NSnaCchKJTLeNKkiWiMo/L7/euQokM0UjskhlM9PXV
	 pjWW/DMx6bXTwqCAFrVfdRNtlyJ35dN5b2qlqgbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13706F80579; Thu, 14 Dec 2023 16:57:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C5A4F8020D;
	Thu, 14 Dec 2023 16:57:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E68BAF8016A; Thu, 14 Dec 2023 16:57:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25212F80124
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 16:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25212F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uUlL/8ZQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 41821B82306;
	Thu, 14 Dec 2023 15:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0A9C433C9;
	Thu, 14 Dec 2023 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702569417;
	bh=Irc7j9mhIhkTjruf9MUgxUtXcKks1NoDo+o05Js0JRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUlL/8ZQUpL92Yu4EDmQpLzUoufYW86sQ3eOU73LLU8e28ku06Q4eF+k9hlUGo/KI
	 GqrdLjWcVF10n3U1YeYk5OWaGYhLZbmu7dyjYcVByBqqORc1mGbqDwcUI4jFNQ/aCC
	 /+gcVYj9QYgUtUlXwcw2UoGsZ/EYNnHjHMJ/JB+ULpbO+C+leNpMRupyotFSP/RtnG
	 Ie3PP2656wTWQ8QMdd67GW0Hsr/o1tuMLIyFeeRQ+fN0sTBVOH0FDFwKd0URD/orrX
	 upTcn8XOKpxSU52fqQvJeUEJvWVt/r7ONfRf/hKfUDVew4KZj+7EBIxTbFUtUDTF8n
	 ayblJLEV8ja9g==
Date: Thu, 14 Dec 2023 15:56:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: Add qcom_snd_tdm_hw_params
 function
Message-ID: <bee0ab28-6bd3-4904-8afc-44fe7ddacb79@sirena.org.uk>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
 <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
 <ZXsklsO7nOqBFgzt@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3QwHa6JjLmRb9NBb"
Content-Disposition: inline
In-Reply-To: <ZXsklsO7nOqBFgzt@Gentoo>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: BDCMKUFWWMYLJCCSBAGYHUOMPPDJLXYD
X-Message-ID-Hash: BDCMKUFWWMYLJCCSBAGYHUOMPPDJLXYD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDCMKUFWWMYLJCCSBAGYHUOMPPDJLXYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3QwHa6JjLmRb9NBb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 14, 2023 at 11:51:50PM +0800, Jianhua Lu wrote:
> On Thu, Dec 14, 2023 at 11:11:06AM +0000, Mark Brown wrote:

> > The expectation is that TDM is set up by the machine driver, not from
> > hw_params - if the TDM setup can be changed from within hw_params then
> > it's hard to see how it's going to interact well with other TDM users on
> > the bus.  More usually hw_params() would be influenced by the setup done
> > in set_tdm_slot().

> Currently, qcom TDM setup need to read hw_params, if we want to move it
> to machine driver, we must hardcode some params, but it will reduce reduce
> readability.

What makes you say that TDM setup needs to read hw_params?

--3QwHa6JjLmRb9NBb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV7JcMACgkQJNaLcl1U
h9CY+gf3YsZTfcu/vz6WuiAEAFNcmWZVpApi5hN7KrHcB7qQWGfbWcivQWhFfiFc
2HsD9BS9nkFG8HWmHz2DKgZltPNOIIVLnaHLBS6IaFqXCqDkWdDDpVmYTBCcIsSV
Ls8IlGaVn9ddGf//+9sCcG1yIVnEj2NXqCHSM6EcDwNRy+kvGz9UG8pKYd2clgMv
eVraA+qIr2R0jePWFgGuYGwrmy2O6/u0LHkjCnbUABHA2g8hGRvbv/Rv6IW1zKbb
D013IGVbR1TkUWGlVU5b6AOS6DLlHMwIYwqaa5Gw1EQ/Q0S2J5N5105UGICxqVBA
p1yWhSlzFo3Tjs7PQxsTZV3DHmFx
=WcEt
-----END PGP SIGNATURE-----

--3QwHa6JjLmRb9NBb--
