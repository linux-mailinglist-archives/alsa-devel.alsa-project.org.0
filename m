Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D346DD23
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 21:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C212621;
	Wed,  8 Dec 2021 21:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C212621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638995714;
	bh=r1/q2rQ0/0tYGAU7ST7svoRBXsOnMiacT4GBfHWjxdY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRtq3jHC7eD5WYcS3ybOCPbWQCJK9dnmbIdRI5yp88RRXBTtzKbqC1nIHKgaKBG/H
	 Hd4h6Qn2/loAKBKZL3KMrxSPGQmfcCYE8Rsh3nOsjlG0wFZ+JiSwUq27dyFGB85hP/
	 KjFhmXY1c384N/ZwyMR2WMOWPZt15RX3yeWyCseA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7ECF804EC;
	Wed,  8 Dec 2021 21:34:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5426F804E5; Wed,  8 Dec 2021 21:33:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C092F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 21:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C092F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H/fW5CAQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C80FB82285;
 Wed,  8 Dec 2021 20:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BE0C00446;
 Wed,  8 Dec 2021 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638995630;
 bh=r1/q2rQ0/0tYGAU7ST7svoRBXsOnMiacT4GBfHWjxdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/fW5CAQfTPKV7dY2YpSc0nf28ZfU5WYILbZeoN/Br8Pb7agTZpThA1/8gfZ78yrf
 em8fCmy113CGj84ziw60ukL50wqp8sWmkkF2lJOBG7FRDebRJnkg1hEYOGrOIGWkS/
 xbwC8XwNrFZBGqUU4JfZDquY48fbbtVxJYM5dtkmphMMe57Uc5MbuwCysynOPrN0Dh
 HR2b8KJHjQ0qdkxk4293ohUM1QihRnUp9ieLX/haPK6X+39ewvnooLAyWIGBJSLloO
 xcuxFNLc8jpcxQQicYAphPca8CCtw8wsbMAdIWM1NpxFTLCveHF5XzWy33iZy4PCm6
 ZajpDbIYrzROA==
Date: Wed, 8 Dec 2021 20:33:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: max98357a: Add mixer control to mute/unmute speaker
Message-ID: <YbEWqP6/TOCJn0gk@sirena.org.uk>
References: <20211208185850.1555996-1-AjitKumar.Pandey@amd.com>
 <1571a09a-a766-a733-e23f-36cf1ab14b86@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TA1bawbBm9qo3pPG"
Content-Disposition: inline
In-Reply-To: <1571a09a-a766-a733-e23f-36cf1ab14b86@perex.cz>
X-Cookie: Alex Haley was adopted!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--TA1bawbBm9qo3pPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 09:25:04PM +0100, Jaroslav Kysela wrote:
> On 08. 12. 21 19:58, Ajit Kumar Pandey wrote:
> > Add "Playback Switch" mixer control to mute or unmute speaker
> > playback from ucm conf depend on use cases.

> The "Playback Switch" is too short. It should be more specific (Headphone,
> Speaker etc.).

The device is a speaker driver, it's likely to be getting a prefix added
as it's bound into the machine driver if there's any issues here.

--TA1bawbBm9qo3pPG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGxFqcACgkQJNaLcl1U
h9B8ZAf/UwgVSTLxxiaMAAeFArbqjreZZ+s4y1+l+ILfdze6v2axOfqMlvGgDZgT
IF1tVBmcKT16JSQOdoRnx0Ca8h+LeHj6Oxa/3KMdB3IqXOmjr8Jt08/bxI/rZ4hE
nSjONcl+0gDdbXXNJsyOXilXzQWrYENomcNbdAHjjkqTpDx+wLQjAr+5ssoJ0muO
sSGAPxe6aYUHGSHgO4kwalfOOaY4ULFqOAWS3dPmgfb4R93r0+WURcBhrg8Dm0Ad
pyEzt74ZEgKx/kTjP4ZX5oIkDuvKhg/S041WoCtdLah9k6yTeMc2x4HrTrK3fwlo
hODKZLvxg9oiRe9zvJ89lpCdQRmAOQ==
=IwSH
-----END PGP SIGNATURE-----

--TA1bawbBm9qo3pPG--
