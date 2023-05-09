Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90116FC348
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 11:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 590F31116;
	Tue,  9 May 2023 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 590F31116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683626181;
	bh=4Y4KsoymL3vI3NxJE16nycgvLgRutCPHdLycUR0m9BQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KBCak3ldWEAP06NOt85sSd2Ai4N2z3h6UfAWLXhiPfwhWH6nQr6J/Go8rTG0F5clO
	 mt/3VItwdKhDBoZkkAxBe7RYOWfFNRMIunZwsy5S6X+yGeO3ajS2sE7jfj0rH7MQ0M
	 mGVh5I4Ku2t2RRohm7oa7dG80HxL6AQMGnqcIups=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9271AF80552;
	Tue,  9 May 2023 11:55:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36389F80551; Tue,  9 May 2023 11:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D983F80551
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D983F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NACYYs3k
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61735612B1;
	Tue,  9 May 2023 09:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB87C433D2;
	Tue,  9 May 2023 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683626093;
	bh=4Y4KsoymL3vI3NxJE16nycgvLgRutCPHdLycUR0m9BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NACYYs3kELixi/jGJfhdrnnjftwxVRr+iliOnAWmUUTUwYDSSSmT3wiplNL1rzr00
	 gYWW1AJtWqc0EUwXYdQwjP4tK34rwpSW/n06ZzcKGznw7rsnW4Qz8bWAezNudc+O4Y
	 hjRd2clddUaatDCnLaoxDEFRKUDZVv2Cgnj6S6G0SRijx99wIpC+JNsc29WHRHazAS
	 JU7I1hO/4xJrTFpRW/YX+Am8gPma3uRP4dNt1iGG0bh5oZlfMqaQKZuCeKuLrLoOOD
	 0N/4LvVdWmtqKYmoCmCJ6CjeOu/zb7uCcifSZhx54LHZKGdLav0Loku5dC8NX4WMlb
	 MeFSWDtTfEZ6Q==
Date: Tue, 9 May 2023 18:54:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/7] ASoC: dt-bindings: Add Google Chameleon v3 audio
 codec
Message-ID: <ZFoYai1Zawd4GGtU@finisterre.sirena.org.uk>
References: <20230508113037.137627-1-pan@semihalf.com>
 <20230508113037.137627-5-pan@semihalf.com>
 <b8306c55-8551-4c86-f85d-3aebe1ad0ca1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z8CDGSKZUTT4IQxF"
Content-Disposition: inline
In-Reply-To: <b8306c55-8551-4c86-f85d-3aebe1ad0ca1@linaro.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: HTSCEPYBOUPA6BGUJVYGOIX23JYPGN22
X-Message-ID-Hash: HTSCEPYBOUPA6BGUJVYGOIX23JYPGN22
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com,
 amstan@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTSCEPYBOUPA6BGUJVYGOIX23JYPGN22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Z8CDGSKZUTT4IQxF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 08:18:15AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2023 13:30, Pawe=C5=82 Anikiel wrote:

> > +  "#sound-dai-cells":
> > +    const: 0

> No supplies? How do you get power?

My understanding is that this is deployed to a FPGA so the power would
be going into the FPGA.  In general a memory mapped I2S controller like
this will be part of a larger SoC of some kind.

--Z8CDGSKZUTT4IQxF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRaGGcACgkQJNaLcl1U
h9DOwwf/QdeieGMjndj9dDM7ZflkZAvEnssvAwTu2oHFp6U1dlOC7TsriRVIxIUS
8kTV0ysluuBngw21aMAXUcTZK/gS8p7Milkz+4t1tXooSFcWN6fzqTksuYUlN0PT
knXqWolQifE8+zx39nIA77EcMMbKfGldat7bdv9GTeSOUpiyKqIyJncmW8EYn6TB
8g4TMIGJ6CoXBvCPrdRz1f+dg7A1E9iC7IquMvG5UpOyJOSzV1RuzxxDGEM+bVGy
5j9+4GOFAD+UN1QkPaQbSruoIj37wZ7f4JtZYHHyNt9NyULcw6S0WJ6VDB5JRGGx
zwE9SRZE/4yIihtXK6OHLRmQeUvCTg==
=dLTt
-----END PGP SIGNATURE-----

--Z8CDGSKZUTT4IQxF--
