Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E912566904
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 13:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9901D850;
	Tue,  5 Jul 2022 13:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9901D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657019964;
	bh=eIpaiQzN1dQzf3QUOgYci66EBnivRL2tBpynLfqIPaA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ba0I7ZR2Q20c/aJbFY9wQgjS1f1bGK8y2ed39VeSfaAo8Ry/ASyUkKJBNtk3nh1tA
	 /PWmBbQmOGevMSaY3yIhu61JYbKab+5zsrOvBgm3Tj1kSUzGW7hVicv+E4r8MZqHaa
	 Rf9G6dvHpPBctEBdMIsOzOoUoyGAvcbmKwQvqTDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7429DF800CB;
	Tue,  5 Jul 2022 13:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7486FF800CB; Tue,  5 Jul 2022 13:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3304BF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 13:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3304BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oRr8nRu8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEA0660AF1;
 Tue,  5 Jul 2022 11:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E4AC341CD;
 Tue,  5 Jul 2022 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657019893;
 bh=eIpaiQzN1dQzf3QUOgYci66EBnivRL2tBpynLfqIPaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oRr8nRu8ZiG9BE6VYc3ZhwPPPSY6zejoCJWcyrxSF+3X/o6qAOgga0gRcHF7zoBdz
 ZjO9qhYH2gpjcs8mIvU1qOtqEOBVsLXGd7ouy+UbxYN/kHPHG/O74Yh/kVfnLWMhhn
 a/foZp7MylCLC0bZBdwQw1TZZUIvCeIlpDsUxCa2guhASCrvI+4Y7d35ynbB7K4ANd
 VSYuyIV8rzLSMI3/ZFK0y6eJhS+w05ArwZBLMJ80fgoNa2sf0iSEqf6hiAm4mfB5GX
 whCW6icbB29f36C6RBtZUgzFo5yX3fq8yuMqLHswMvCIeRdWrvff9i4XjNhLkFEC8r
 3+QDnIOwLaOZg==
Date: Tue, 5 Jul 2022 12:18:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: equalizer cfg in max98088 driver
Message-ID: <YsQd7mub0KJdYUDw@sirena.org.uk>
References: <20220705075500.GA1987744@tom-ThinkPad-T14s-Gen-2i>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jiEe/WpmUIOBm7IC"
Content-Disposition: inline
In-Reply-To: <20220705075500.GA1987744@tom-ThinkPad-T14s-Gen-2i>
X-Cookie: Only God can make random selections.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--jiEe/WpmUIOBm7IC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 05, 2022 at 09:55:00AM +0200, Tommaso Merciai wrote:

> Just a question. Can you explain me the proper way to configure eq1 and
> eq2 of max98089 using sound/soc/codecs/max98088.c driver?
> Could be a valid solution fetching eq1, eq2 bands params from dts?

There's plenty of examples of equalisers in the code already.  I don't
know how this specific device works but generally these are either
exposed as a series of volume like sliders or as binary controls.  This
doesn't restrict people to settings from the firmware, making
development of new configuraitons much easier.

--jiEe/WpmUIOBm7IC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLEHe4ACgkQJNaLcl1U
h9Cb/gf/RzD6mvd0NCfT6nAaNnVW3DladJyYo6d361/zwj1+xMIKwWgoOUgHaZxa
XFJ1EcBz3jR8xU+cYrMPKJUHp//ZOtZCVzBi0eYN9XIKROgv+vwi7PSypHi6TmI/
MrCp4Sv1F9QGU2Fkrmt7rPR7Q/Xjmq38mGF1WHe7C8pXCoja2g0Qm0QdqLXgjUM5
KFApmU7rNrMidL5JZo99BXUXBkJXtFSlNVKQIxFQetLdzq5LCHuq7L7sFJVsZO/V
L203bLlhYpJ619w2bV43gicKxqP/tFUa3eskAj6tcMpVoj/I0Je6pS1RNlTQxqFC
1Etq67paBflGIpt9Rhf8onu23RAfdA==
=uxw9
-----END PGP SIGNATURE-----

--jiEe/WpmUIOBm7IC--
