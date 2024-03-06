Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D7873699
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 13:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BEF6847;
	Wed,  6 Mar 2024 13:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BEF6847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709728659;
	bh=d4E2haOnRYF7r/QzXy6LMlj95Kx1FRP+AF+bF3xJ1nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XekxXH9/InuzYQBI379sJHtGFYjrj0GVgz54vOuGrEgy+x4SWXU7NNBjC35f2yKDT
	 MgBWRhwp4hJ5nDTyH7UfG7MWULbXyCtoBoUp+cWzE8MBF0ebgBAHq0z+OXiL4Ex7Xd
	 5TabcG8y2Imu9KhqPEtuKjfBcJSINbqP6KTjsyRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A237F805A0; Wed,  6 Mar 2024 13:37:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC240F805A0;
	Wed,  6 Mar 2024 13:37:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD782F8024E; Wed,  6 Mar 2024 13:37:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C49BAF8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 13:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C49BAF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uW234R1e
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 639B6616D9;
	Wed,  6 Mar 2024 12:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E530C433F1;
	Wed,  6 Mar 2024 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709728617;
	bh=d4E2haOnRYF7r/QzXy6LMlj95Kx1FRP+AF+bF3xJ1nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uW234R1eQEX9Fq/qSxNk3zjH5KWRJjNmZPB5sqVY1FuIxU99sJShbEs7dP1jMaJR8
	 U/9uAsJA90u71XoYrVjyf9JCruf0y3hD3fCGHkjBWF15e8+EN8WtRo2dSDk49+zIgS
	 r2yOiskCANjVOu0s83Zwv+pTVhJUULI1Qi2I99fa7k8jyba2XZpWEEJDh7LnKC+dkp
	 7kCc1gjWZmCSJJNCdl5V5glS/664f3xmcrMgTbnL5RW3d4Sbat1DB56bcG8+OSa1Ql
	 FDoobp10Uh2EIvPHfydFphoutQjYk7gSliW3wM8a3dLIsvE66L3qh4TcMPlDIlSFXZ
	 T1hmTzD4LNR+w==
Date: Wed, 6 Mar 2024 12:36:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH v1 2/2] ASoC: codecs: ES8326: change support for ES8326
Message-ID: <bf4651f8-279c-429a-8337-2211ce0b89ed@sirena.org.uk>
References: <20240306013414.18708-1-zhangyi@everest-semi.com>
 <20240306013414.18708-3-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xCO48n/cNnBQKXU"
Content-Disposition: inline
In-Reply-To: <20240306013414.18708-3-zhangyi@everest-semi.com>
X-Cookie: Have at you!
Message-ID-Hash: YVCAZN453FHKSTJSSO7LSWMVO6O65LUX
X-Message-ID-Hash: YVCAZN453FHKSTJSSO7LSWMVO6O65LUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVCAZN453FHKSTJSSO7LSWMVO6O65LUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3xCO48n/cNnBQKXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2024 at 09:34:14AM +0800, Zhang Yi wrote:
> Removed mic1-src and mic2-src. and changed default value
> of interrupt-clk

We could do with a better changelog here.

> -  everest,mic1-src:
> -    $ref: /schemas/types.yaml#/definitions/uint8
> -    description:
> -      the value of reg 2A when headset plugged.
> -    minimum: 0x00
> -    maximum: 0x77
> -    default: 0x22
> -
> -  everest,mic2-src:
> -    $ref: /schemas/types.yaml#/definitions/uint8
> -    description:
> -      the value of reg 2A when headset unplugged.
> -    minimum: 0x00
> -    maximum: 0x77
> -    default: 0x44

This will make any DTs using the properties instantly buggy.  I believe
there's a way of marking properties as deprecated, you should use that
instead.  Or we could just leave the properties there and ignore them at
runtime.

--3xCO48n/cNnBQKXU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXoY2EACgkQJNaLcl1U
h9COWQf+Mw2+SsHAMAEDXcF26DBzoe8jXSTTR1Z4LQoAwN+UqjZGkSQsfAJWLKUE
09R/MApJdDDpDpDneBtkLbuzUbOrUwWG9pn6rPOQOfORhDEiIG0xTZdnOphemKip
5WbdcCpe4BtJ1Vt0+gn/ppV0JVIKYnoJFvsD3DQQHdM2kY2ME2d2Efxd0sRO7gCn
oaZmYwyyuBAZhHStI7AtnsCNw3N8PL5tD4C62Ufmmfcj7auVUlt5+1K+SWo+EVaj
dS2QlXpuzVy9vsu+IaMMZz6p+jvjU0nIFR81RbwUSeUSkqHvymOvLdVb/fu+LuPr
n9nprGxzAHZc2tBKlnt1n2qwZhbOMw==
=vqCj
-----END PGP SIGNATURE-----

--3xCO48n/cNnBQKXU--
