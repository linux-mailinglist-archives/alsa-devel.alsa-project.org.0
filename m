Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530616F8D17
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 02:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0752B9D;
	Sat,  6 May 2023 02:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0752B9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683332054;
	bh=c59o55RScANtDIkAG346rbdiy1gnbjGFB7ZozucUAqM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sbt22c9vnwLahXK6hwevfmxaPwrmFh3jIhzWmOKgo0i85MjV2UcC1Y4at+htOfyd6
	 mdaYqyMRMQZSesbD+Aq5i6LhcBYLQ+Xlkfl5vdJ6w15CPPKnIkcph0jyI37Q9YJwCp
	 jQQBQOOccM2eERuqo5dV9+fuCjXqpRhcKJka7Y2s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59EE9F80114;
	Sat,  6 May 2023 02:13:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CD23F8052D; Sat,  6 May 2023 02:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD7ABF80087;
	Sat,  6 May 2023 02:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD7ABF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RFHQOoET
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2165C60BB5;
	Sat,  6 May 2023 00:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32468C433EF;
	Sat,  6 May 2023 00:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683331989;
	bh=c59o55RScANtDIkAG346rbdiy1gnbjGFB7ZozucUAqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFHQOoETTvZYTTYfLpaRkucjMuJCuHWfDH/VKVD6GM0pa7DCUJfLXT+9JIA1b1J8A
	 KnLRIROHd9ydhNGndd0FZq4oe9Gb1s8h8jpq1VhVAjYpKYPGbKLsrJQ+xI/UYhYV3k
	 exvnmpcFtwh0nmjhZvnZk7ouTzVMjmm9/gB4iW9OK5g/mGbDBRLvkul9aMdOyAtmlv
	 ErWQTzcBMl40Y4QLz0GbTV8nTCj/hoVYvJpb+LXG7BWIJOaGF5mwTfN/XkGw8VpDi2
	 HzBO/xMB8L0RLABO+2mUfRgJ97SPy1QQMb0hDJZS6wyPmAOd0/KvKhSyYm7a3NLETb
	 KMQ/A1gXzXIdg==
Date: Sat, 6 May 2023 09:13:06 +0900
From: Mark Brown <broonie@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC: mediatek:
 mt8195-afe-pcm: Simplify runtime PM during probe]
Message-ID: <ZFWbksDaG2EQNqSK@finisterre.sirena.org.uk>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <ZFVpRKM5vxpWWaI9@geday>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zi9no0OZIKt2gZf8"
Content-Disposition: inline
In-Reply-To: <ZFVpRKM5vxpWWaI9@geday>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: T4XPECEWGTAHTWAZA4GSBFR4WUDI5EWY
X-Message-ID-Hash: T4XPECEWGTAHTWAZA4GSBFR4WUDI5EWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4XPECEWGTAHTWAZA4GSBFR4WUDI5EWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Zi9no0OZIKt2gZf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 05, 2023 at 05:38:28PM -0300, Geraldo Nascimento wrote:
> On Thu, May 04, 2023 at 10:09:45AM +0900, Mark Brown wrote:

> > Here's another mail (one of several in this series) that got completely
> > mangled by the alsa-project.org mailman to the point of unusability.  I
> > didn't see any response to my last mail about this, is there any news on
> > fixing mailman to not do this?  It's extremely disruptive to working
> > with lore.

> Are you complaining about the added headers in the message? Because the
> patch itself didn't look mangled from my side. From my understanding,
> Jaroslav had to start mangling mail addresses due to strict DMARC rules
> which make some servers reject the message from alsa-devel.

Not just the headers in the message, the author information for the mail
also got rewritten.  Try applying the patches with git am...

--Zi9no0OZIKt2gZf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRVm48ACgkQJNaLcl1U
h9Dx5Af/WtvdUMy46vfKn8sxPhPREp9JO91v/7qTSqfmdi4O5VawHaVqQOY4sCKa
9nB0lidDtUWXljyOStZbwsCa6NNQIM0fGczMRzAqTQpOsX3C9d33GyHx4N3smYFJ
XVPzZ5h8trFxDUZavmyNljnvV3BjNGhRDNN03E9HBrSqpkXIHjkZAQrJZFnSenrB
xTVN1UNVQKkXIoqsVTxM4uc2OzMBBRZN1IxnzhkmjuBrsalyl8psn3kL/vjxF1f3
JDRz72zqZCzyTuY7LBqYJOYcjh8g++OynvLIe3NJr2lA2jNj+ihnOZWeV5mZxlCe
BYQs7aJSqyUKvpMrNGbgcFPtHgOwxw==
=VNf8
-----END PGP SIGNATURE-----

--Zi9no0OZIKt2gZf8--
