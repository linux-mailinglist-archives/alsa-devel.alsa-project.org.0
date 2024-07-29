Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A593F8BC
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 16:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9942FE7F;
	Mon, 29 Jul 2024 16:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9942FE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722264721;
	bh=KxWBR2WQwkmRfSCkEK5fdabdTfFVBLXY+ljiSnLfdNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vx9XAJpL8YEV6TBKGBCj6Si2dzmIj89Crqse203sZD39uKtwgn74RHHn9QS/zKVE7
	 +7hTwGol2WuaRjrud5mglKnN5FmQlKh0wbUro2m2xAqsVdKWaDz/yzh+xR2P3SYvNp
	 T6bs/uIB5TDy20TAg114MEoAQVAJpNowEps04u/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 590D1F805C5; Mon, 29 Jul 2024 16:51:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A076EF805B0;
	Mon, 29 Jul 2024 16:51:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C2ADF8026A; Mon, 29 Jul 2024 16:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F342AF8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 16:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F342AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FMtdyXcr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C82CE61A40;
	Mon, 29 Jul 2024 14:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF204C32786;
	Mon, 29 Jul 2024 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722264285;
	bh=KxWBR2WQwkmRfSCkEK5fdabdTfFVBLXY+ljiSnLfdNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMtdyXcrDjT+14PVlW/6r4syixCSaKqIUXnSi5kCjwQiJj5LOu4ZUqzenz79NmnX7
	 Tg6sEsWl6CUJ/EYNhNBQiwTdMokOfYuEaVXI/JPCH+j84wR8FjKieJ7j5R7DxeTBmU
	 wKREQYsVBwyh3ib3rqriS1HDCQNdeNX22vlq/BNKu4FtT93/GoELWvgBTscEnDCNdG
	 VvMdH+M2ndsoFkjOEwL/XsgnDzb0jiTIfydbxBj6IK4FPJ0zArJKuoWVUQqZYL6Sdb
	 b+s5UF5eYt1RriuBvNDjeRVzkbdV2UDIjHqby0cFZRf+I1GaEu7Rc2/N0DYe+68VWL
	 4yPPeWBVHl/Fw==
Date: Mon, 29 Jul 2024 15:44:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2XEkMrvS0Bz782eU"
Content-Disposition: inline
In-Reply-To: <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
X-Cookie: List was current at time of printing.
Message-ID-Hash: AKETKUEPUZ3HIUXNCJILMLDXAKNQACFV
X-Message-ID-Hash: AKETKUEPUZ3HIUXNCJILMLDXAKNQACFV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKETKUEPUZ3HIUXNCJILMLDXAKNQACFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2XEkMrvS0Bz782eU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2024 at 04:15:31PM +0200, Jerome Brunet wrote:

> Maybe mmio regmap should '.use_raw_spinlock = true' by default when
> '.fast_io' is set ?

> Mark, what is your opinion on this ? I guess it is not the first time
> this occurs ?

I don't recall this coming up much TBH.  It may be that people just set
raw spinlocks when they need it, or that there's not many people using
relevant devices with RT kernels.

--2XEkMrvS0Bz782eU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmanqtUACgkQJNaLcl1U
h9CHbAf/QzKprEIGtlybUxTku0YVZcAyep64Z+8aqLmUDAfk4G0fPQ8c/sghHsJ+
NlkYK9n5h4eVGX0XEcU0Gh1ScYM6rBG0Xn2iHzN+6RynQTy2jUwCGeNP5HqkZ0H9
GpQgDqYAoslZ86VjMS04UrpgvrzTUz8B0iS3xgAf2E65lLR44GkZXIDtcjSm2/XV
Y3wjjPjiD6km5Y2Z+C0b0Gk2/5jka1JWGk7f4vDnLJKANam8hC7F5500PVV/TY57
xFSlsxbh3qBpCqDPHx/Fpcp3tXpNjVyTRP3LRWGQ1AP9PBXe6/932SYV83k+0r60
lqoZkKKHkfVlHKnHfhfWuswMCX6bAQ==
=187k
-----END PGP SIGNATURE-----

--2XEkMrvS0Bz782eU--
