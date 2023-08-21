Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A137B782E5C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 18:25:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A523F832;
	Mon, 21 Aug 2023 18:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A523F832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692635139;
	bh=rh+mxk2XiwA0hIRSU2uiSF0lwTaOpoX7hUeSI+GftIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pA0bgt46IU5i5DWg7gkbxKOZpLCkFBR+nVkaLu61hlOsQ3dNtKObwi83cZv8Wpd4S
	 317NCv8CJiTfsgOHIn0CcB86iZyPV6Sh6InBXjUzE+0yzb00cGLoWoFcvm96SvuXFy
	 IjBZq27PQQZBkPSnI9fi5IZSgrZOhxixsWU3xq3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E92F4F80510; Mon, 21 Aug 2023 18:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F8B2F8016C;
	Mon, 21 Aug 2023 18:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8FBF80199; Mon, 21 Aug 2023 18:24:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D15CF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 18:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D15CF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DkQ/4HMv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DA0860F73;
	Mon, 21 Aug 2023 16:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91FDC433C7;
	Mon, 21 Aug 2023 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692635076;
	bh=rh+mxk2XiwA0hIRSU2uiSF0lwTaOpoX7hUeSI+GftIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkQ/4HMvIHtmoa+Iyx2BUPnPvRz3pEt3XII2fhysU7IJ6JauOHFXqCxYk2yApb4n3
	 JTztA3RnFEMQUBj1yH/ami1p5V2/gHXDI7JYRk0wrUm+asGgVs6sLA0/aDTtY8dHWw
	 Any0hpk+zQCCkht2yqeqQ681dT2DimDJPH7fXbqfmJ3PeIO2lV8bnNrpIQ/xFiDHpY
	 Y6d7Mj74rM8c+2Sl04xn9rzQyrxnkJKKoY3gde3HKm0tBL5WCr+JBBZa3XncnW2eVM
	 5qa3l/mxradlqHMTqMz4Nt+08rWjZcMPl0ak3ZcgntmYf+TV7rN+NMz2gWTGVXqOwJ
	 WCZYWT70FEg2g==
Date: Mon, 21 Aug 2023 17:24:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: Delete UDA134x/L3 audio codec
Message-ID: <01f4cbd3-b98a-4c8c-a19e-3e3eb2d45104@sirena.org.uk>
References: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bhuvj7fzxmUqme8u"
Content-Disposition: inline
In-Reply-To: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
X-Cookie: No campfires allowed.
Message-ID-Hash: ON54GPHYOF4PEDF3MUMZQJSROST3UNML
X-Message-ID-Hash: ON54GPHYOF4PEDF3MUMZQJSROST3UNML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON54GPHYOF4PEDF3MUMZQJSROST3UNML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Bhuvj7fzxmUqme8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 21, 2023 at 04:17:57PM +0200, Linus Walleij wrote:
> This codec was used by the deleted S3C board
> sound/soc/samsung/s3c24xx_uda134x.c.

This breaks an x86 allmodconfig build:

make --silent --keep-going --jobs=15 O=/build/stage/build-work ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu-
/build/stage/linux/sound/soc/codecs/l3.c: No such file or directory
make[3]: *** [/build/stage/linux/scripts/Makefile.modpost:144: Module.symvers] Error 1
make[3]: Target '__modpost' not remade because of errors.

The Makefile removal is partial.


--Bhuvj7fzxmUqme8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTjj78ACgkQJNaLcl1U
h9BBUAf7B1ABhYC/tCVDTcRPuPXweTcD7N4mzXgonKq4panMmO/+6yrEOvP84bke
hV1k61bEYTUDu9J43e9TWSbPIuBiGCIKG4o3ueuJ2f4lSf8Jg+U/n4w8+NuqYqGK
AVWqLe5eVuGYUXpGZDjO5HNLlGlWHLOBqRw8SkNC5vogHIJtuxiDVzAileYbaBqC
4lrOKpr8x+bp0mRYsMbdQfNr+lJrum373JN3F/rk9tBH2SHra5zROt9eUpTu7eZq
g16hRPxfiJwX+kSrEDMdk5nkhsRYtmqkS4/tIQgh07CJ6ZiGlpSAdz+++NjkoTzo
Wihi9k/dgmoBwfFnOMCXOatQadVbQA==
=Rq4B
-----END PGP SIGNATURE-----

--Bhuvj7fzxmUqme8u--
