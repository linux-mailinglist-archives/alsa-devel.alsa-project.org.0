Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741476E29A7
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 19:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA1783A;
	Fri, 14 Apr 2023 19:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA1783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681494528;
	bh=H2tltmGDexc0tM0MnRw4xaZV6e/RVXjyojoxgxu9RBg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C/iyF3xsyV4nDrgOZN+ABN58FHxGLjOIuLSoKH4dUYO5nETSTKlCrO3TsQaDsV8Yl
	 P7vEFonNZwp7AQOAfTOvhX5IQdrE0MpqdszJ59QQt15DBdx13e3lOJtqx6bsIv7n5p
	 0C3JU7kOuq6pK6rnyKmbiwMLFkB5/zP0QDNQs12M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFA0F8025E;
	Fri, 14 Apr 2023 19:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E2D4F8032B; Fri, 14 Apr 2023 19:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E2F0F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 19:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E2F0F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rixmkwkc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 440C861268;
	Fri, 14 Apr 2023 17:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFD3C433EF;
	Fri, 14 Apr 2023 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681494467;
	bh=H2tltmGDexc0tM0MnRw4xaZV6e/RVXjyojoxgxu9RBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rixmkwkcwZPphZbiVeWBBHCySWojOlFZDKQsmXMJyxcztUdYXMp6PyBJAZI5H5zut
	 42/0Rm8Aja27F8wcDt4CKh7uO0mAdPfMqbq8fpYdADW1DMMs4HwkJRRhcxPAOHktvB
	 t0ERdMOnhmFY3H2JbSbIeJWLSjk/M3pYPmMCOArKKXkDdyQHzhZ6zkRjWJVgV1K5fJ
	 UaykqchjMXSR7I/qpCbz30RB3RKjJaYNF8DRhUyGXMaownpZZJtBDJ/mZrYqzdaxVh
	 W7LlKbA+VRUV9Y+1CMzel8YvVjFdctAsiYrMJmzv63ceRHLA29FNgiAaRGwz7aRSOO
	 wsri1kCQxJgmw==
Date: Fri, 14 Apr 2023 18:47:41 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Subject: Re: [PATCH 7/9] ASoC: ssm2602: Add mute gpio
Message-ID: <a1d81f71-e661-4deb-a20c-500eb114588e@sirena.org.uk>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-8-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GnJcmBP2L1vfDhQF"
Content-Disposition: inline
In-Reply-To: <20230414140203.707729-8-pan@semihalf.com>
X-Cookie: One Bell System - it works.
Message-ID-Hash: 54LNAZ45YXR6KB6EUH7WJ5W6YIR4CUHB
X-Message-ID-Hash: 54LNAZ45YXR6KB6EUH7WJ5W6YIR4CUHB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54LNAZ45YXR6KB6EUH7WJ5W6YIR4CUHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GnJcmBP2L1vfDhQF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 04:02:01PM +0200, Pawe=C5=82 Anikiel wrote:

> @@ -352,6 +355,10 @@ static int ssm2602_mute(struct snd_soc_dai *dai, int=
 mute, int direction)
>  	else
>  		regmap_update_bits(ssm2602->regmap, SSM2602_APDIGI,
>  				    APDIGI_ENABLE_DAC_MUTE, 0);
> +
> +	if (ssm2602->mute_gpiod)
> +		gpiod_set_value_cansleep(ssm2602->mute_gpiod, mute);
> +

It seems pointless to control both the mute register and the GPIO mute
here, we gain nothing but overhead from having the GPIO.  What I would
suggest is that if the GPIO is present then that is used in _mute() and
we add a control allowing the user to mute and unmute via the register.

--GnJcmBP2L1vfDhQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5kbwACgkQJNaLcl1U
h9BB2Qf/e9bVE1OecQ9c/4HvNMB9t3T0Dv3daa7u5NKNtro4noS50whQBwWcmW3D
NCt/vVNrLjGx2I+UYNrxE811ip8miMeyPmYAFOfq1/mTH2MCs5ch+7KfR3hma2qR
Rt+bbQFau5JfNdl3dDumT7F7iZSHXyIJyaDx/422OeUsBoSu2kNPxGsBJe/3767k
E/CwmpAdzhXtHwQjwlH29yJO1eqgXFJjjMv/95XkhhhW0SQouhGRxSuWxwDxXHAv
MaeNBF0/6mqMnwVrfBj+3YhtPdGklnGKsQXCLMKdag+VAguAkmzlz0nlUZc9glea
a1U1SCE9Y/OqEGNttsWm2dd7ADgxeg==
=LFjs
-----END PGP SIGNATURE-----

--GnJcmBP2L1vfDhQF--
