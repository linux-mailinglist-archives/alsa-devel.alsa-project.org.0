Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518E68A218
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 19:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734CF836;
	Fri,  3 Feb 2023 19:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734CF836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675449451;
	bh=ePl6R2Z+U5EHaRXvuobFDAMBenFfo2gdDC6EXMOostQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qK05Q1JzmQZIONxeGXXLFWd0FQYi5GK10JsiIfo8Wwh/KRbZDqm6WjdNCg25JabZ4
	 Mms7VIynfDbzT4KufaPbUYvrgRhz7moZ5B6wBcBzhHSEB7qKP4ox4el8sr2zeldPsX
	 USP8R/mONHoGUZ/K7d4DVO0NCSBNa3WZ/JpvxRKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86428F8001D;
	Fri,  3 Feb 2023 19:36:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 215FDF80169; Fri,  3 Feb 2023 19:36:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57780F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 19:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57780F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ieOio1op
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BB7161F51;
 Fri,  3 Feb 2023 18:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4562CC433EF;
 Fri,  3 Feb 2023 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675449384;
 bh=ePl6R2Z+U5EHaRXvuobFDAMBenFfo2gdDC6EXMOostQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ieOio1op3VDdUsLP8MuNow5b11ORT9/xaHY6V2pBjy6+ROxIUaws1B70echyk+Btw
 aT/D6Aa3RfvxIAyq8/Uu/5STfZc98vNfGwImVYLalD5I3/+qmfCAUAFczkl54hilVZ
 uPY/fiVu1Nl5wuU0vKXNAEahixuv1Iy5Sy4F2kAweiTeVQoLS9qwWEMrbxurmByl52
 cQ3gabMg2Q0umYDZqGAm9NmbwIXkWub8MlhTAP2TBug1ReW6tq0FXt42uKwBjA3aE1
 VKwI8DIregMT0a6OWVghtr0B6ylUDpiTGlpEIeEEQGMn9LqnbAnfwWllKg6UqEcV80
 vDG9GI8F/nxCQ==
Date: Fri, 3 Feb 2023 18:36:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Message-ID: <Y91UIilZDWpivkWL@sirena.org.uk>
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
 <Y9wmnfTi/p4FuRmd@sirena.org.uk>
 <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
 <Y90ExljX2qCsowhu@sirena.org.uk>
 <652684af-bd10-99da-1ed8-104407493428@embeddedor.com>
 <Y90P3kik6ONZg3U4@sirena.org.uk>
 <63dd3676.170a0220.1f1b2.3244@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ujqo4SKGI187lzYk"
Content-Disposition: inline
In-Reply-To: <63dd3676.170a0220.1f1b2.3244@mx.google.com>
X-Cookie: No animals were injured.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Ujqo4SKGI187lzYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 04:29:41PM +0000, Kees Cook wrote:
> On Fri, Feb 03, 2023 at 01:45:02PM +0000, Mark Brown wrote:

> > Sure, feel free to send an update...

> Is this accurate?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f86d02cb427..e21a3412a546 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19564,6 +19564,8 @@ F:	Documentation/devicetree/bindings/sound/
>  F:	Documentation/sound/soc/
>  F:	include/dt-bindings/sound/
>  F:	include/sound/soc*
> +F:	include/sound/sof/
> +F:	include/uapi/sound/asoc.h
>  F:	sound/soc/

Might be missing stuff but those are both good additions.  Looks like
the SOF directory also wants adding to the SOF section in MAINTAINERS.

--Ujqo4SKGI187lzYk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPdVCEACgkQJNaLcl1U
h9DNJAf/bOYTwqW5lCeVbfFOqegYJX6nmDSYygowWljR5/yeojsBy3C913YfFDa6
5nkc+BgEfXYvBqtbSZkFbdc3KAiPOqnJAS26hlMXEWTlBdXVemgtMTNcMQWD7Fd8
dUe55m51zv5vky5OWQlNyROBKL5a3IQbhmg33QYidg+1KPJlCyk7ETZmRUt5AI99
W9ZM9JHoZDRAoWRF0dXHez76XFHJ2qjpEZpaOHy0BbjO2ppI4+v7/H2ysESBDMLD
Q2y8ExyBAQMUl2TNvmPGMASMvfWK2cf9EZLT2q5QCDEML9mtAAY8AWuVy1xLfyad
swhz49NJ4271bdmiCnsLenkwEcwzEQ==
=cmyM
-----END PGP SIGNATURE-----

--Ujqo4SKGI187lzYk--
