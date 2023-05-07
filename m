Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F236F9CC0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 01:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69926F86;
	Mon,  8 May 2023 01:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69926F86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683502515;
	bh=hBFP+hNGBvmopZe/kOvqDLwcDDMIgLDeBU5wOc2OzN0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SbdcTCVxJJ63x6yoPchLahlCCIoedaP8A4SQ1iAKgxRa3Sc6/2pIYNNZ/580LAcxf
	 OLYyYlDa3zIlKg3gyTHCrfd33kEym7Bf8AoK38Z8zcEJZxzU/iBgnI9xzi0WEQPv+I
	 1C4YhQOoGMiVOHeYRXMFxCkG0EJTNRoR9OC3lOn8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A192F8014C;
	Mon,  8 May 2023 01:34:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E97EBF8032D; Mon,  8 May 2023 01:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FDF8F8014C;
	Mon,  8 May 2023 01:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FDF8F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E64Ja36y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2238060EAA;
	Sun,  7 May 2023 23:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE6BC433D2;
	Sun,  7 May 2023 23:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683502444;
	bh=hBFP+hNGBvmopZe/kOvqDLwcDDMIgLDeBU5wOc2OzN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E64Ja36yZTLhpE58IaythI36KOgaBC2CcnQHlQAROyZ8KNwetlCFpeh1rgEgtIpRe
	 aNcT7pG63Qor3TdQnUOnftEOL2ZLoubjFXT11ur6bu9q9kDx13CY3BPWu2HsIPq6TH
	 XY9Ovq6f2SW9pKB4/h8FXmc2Wwb+MieJ1WlKMHKmOvwDYuLi4XxdT3d0OWkRuIEfsL
	 /h+DyiFtqMlSHhkuHArG0Phr/2jvENczP8P9KtDb908gb3atd22RNNzgwgF+Yiy82s
	 c+Pb4Xf80961JqQukyRriGOYZMT92wbXgt+iesFgU05HyD/DwHEqIbyB1qKm6Ao//h
	 3yJOVZfT/cf7Q==
Date: Mon, 8 May 2023 08:33:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC: mediatek:
 mt8195-afe-pcm: Simplify runtime PM during probe]
Message-ID: <ZFg1Zwpg+6iK4bqk@finisterre.sirena.org.uk>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <ZFVpRKM5vxpWWaI9@geday>
 <ZFWbksDaG2EQNqSK@finisterre.sirena.org.uk>
 <ZFW3KpLU+VJBYQLc@geday>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4NwigGF4Uhl2SMkR"
Content-Disposition: inline
In-Reply-To: <ZFW3KpLU+VJBYQLc@geday>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: E35INTAGHW4PGA2C2HR2E33V5PINWULG
X-Message-ID-Hash: E35INTAGHW4PGA2C2HR2E33V5PINWULG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: postmaster@alsa-project.org, sound-open-firmware-owner@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E35INTAGHW4PGA2C2HR2E33V5PINWULG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4NwigGF4Uhl2SMkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 05, 2023 at 11:17:19PM -0300, Geraldo Nascimento wrote:
> On Sat, May 06, 2023 at 09:13:06AM +0900, Mark Brown wrote:

> > Not just the headers in the message, the author information for the mail
> > also got rewritten.  Try applying the patches with git am...

> Mark, I think Jaroslav can change the behaviour in the the added Headers in the
> body of the message (the added Headers in the body have e.g. the correct From:
> email information).

> If the message body *starts* with the "From:", "Subject:" and "Date:" fields
> I think git-am will pickup the correct information from the body instead of from
> the mangled headers.

> Hopefully...

No, it absolutely doesn't work properly - I only noticed this was
happening because b4/lore keep picking the copy from alsa-devel which is
mangled to the point of not being usable.

--4NwigGF4Uhl2SMkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRYNWQACgkQJNaLcl1U
h9D1tAf+OaJRaNVGAXMUZfHxioWSb1fIwVVI2EwQ8msginqF/97kNfNUXkEVslPp
sSUWZRTW4ti7jqhbMXRzoQUwGvpdlCnWL28z5ZAq7eKBuERS5T4oibdf0eHeX6QC
NkTZbl8wT3sTHbhzt7AyaICjX2uUuuVSOqfN1d35vDPCwtdCbAqzXCSs1iGLFG2B
PN/elJM2r0hUvaEpaGz6jrOVKtGmhf83YP/G0WzbLtuxJsWjH596lvIZ0zGDrs4W
CN4q9r0tnbvPDEBhjGwSlYlXUUGlqTJoyOLTkD46b9Sb/nVwoqsLAzVohKLneJka
GADvG2DxF/MP3OJeGUCr7P7Mzyu9vg==
=rA7y
-----END PGP SIGNATURE-----

--4NwigGF4Uhl2SMkR--
