Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04D7429DA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D0A7F8;
	Thu, 29 Jun 2023 17:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D0A7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688053527;
	bh=oFbwbaYZ7miTeEicmpAwOWw6KnWiitf02o31s9XNxgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fTqW9qkMmmzZDVJYvfMQnWHikJr3mX3AdmVz5u3ZN5pj686uLqohIqzzi+wpoQOe0
	 uPyng+4kd2b3K6wfBPK8HAcw6u1GV/9GsSKQgWN5f5v8r+I4YCqPhsap2wz9cbrlJc
	 uLwEKh39asBQsVxNSRFieMnRlWDhEB8HsnRW9ut0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B970FF80535; Thu, 29 Jun 2023 17:44:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C0CF80212;
	Thu, 29 Jun 2023 17:44:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD997F80246; Thu, 29 Jun 2023 17:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32534F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32534F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SPrDjawA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 486CA61583;
	Thu, 29 Jun 2023 15:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF21C433C0;
	Thu, 29 Jun 2023 15:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688053443;
	bh=oFbwbaYZ7miTeEicmpAwOWw6KnWiitf02o31s9XNxgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPrDjawA7h6uOw2dna84rNP+2QX8PeYOcxYWShOQm1d+BAcRmfl5dtoKzNzPTf8/x
	 lNV1ED63afrSNMXdNDLmmfqXKb2lz1gxaeDo6PNhPBIaZYLBp0yFOHI0kVFKP7ajLj
	 EbmxD+3IBFi2FXFlwPThooy7Yxfv5AsXgJO6GvS/kfAzS5AvciBtYdrbK6Z4+CojeZ
	 01qLep/3yir0mNJaH1sM673ttVzA7NGhiPtqiGi3CePjNiDystNTaYfJHJ7Qje3z1E
	 YZt6CSJTtWqaUvVtUYLzPXvwG585NZRE4zACuvv6NXhSJvkJlQC1jObuwFmVPxj5Ri
	 lyMHYspPkd0kw==
Date: Thu, 29 Jun 2023 16:43:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8bc6I2dYpV5RLa6+"
Content-Disposition: inline
In-Reply-To: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: A32QDCELBNHVQHFCDH7DR7LQLWTKQIU5
X-Message-ID-Hash: A32QDCELBNHVQHFCDH7DR7LQLWTKQIU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A32QDCELBNHVQHFCDH7DR7LQLWTKQIU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8bc6I2dYpV5RLa6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 10:24:04AM +0100, Srinivas Kandagatla wrote:
> For some reason we ended up with a setup without this flag.
> This resulted in inconsistent sound card devices numbers which
>  are also not starting as expected at dai_link->id.
>  (Ex: MultiMedia1 pcm ended up with device number 4 instead of 0)

Why is this a problem?

> With this patch patch now the MultiMedia1 PCM ends up with device number 0
> as expected.
>=20
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Cc: <Stable@vger.kernel.org>

Won't this be an ABI change?  That seems like it'd disrupt things in
stable.

--8bc6I2dYpV5RLa6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdprwACgkQJNaLcl1U
h9Bxhwf/dRqOJwBGONvDNGWdiQqXTCARa1cZb/fPFJNqdwS5EFz8B5791vslE7oN
uoUsLEC8VgPFaQ0cLq2s9NEDlMfgQmMbCoKmS1mlxGMQKLwcGeC9ahtf2H8YSgyp
D8Gq3/bVdYBvhXM7EbsEo2+LVlyZgKfMioGnc1p3p24GK7sq6DqYUhSEZwwRgY0R
aU7Wk5ys8U9QMlwQ4DyznHd9tEVXKu7HhCce1+qxsbFXHFg/OEI17X1MxQEMRKB5
3zcs9LHnaOcIdQi12y79ubmhQ1nrfupBHdz8CA5RxZfWCFkAKxVc/u4pQ5hCfRt3
wv0YoiXXnyclAf7gpeuiHLVueG/XEQ==
=yiRQ
-----END PGP SIGNATURE-----

--8bc6I2dYpV5RLa6+--
