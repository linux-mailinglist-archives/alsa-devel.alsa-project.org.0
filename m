Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3456D5F6F
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 13:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B4D208;
	Tue,  4 Apr 2023 13:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B4D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680608850;
	bh=RHCs8FphgqOMMWc0BCoMg/a16dbHn72xyUKpV1s96HU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RwHUQ+8dfsR3igEvBjWxFliFwF+qMylavdLFCge5t+H12WvUsuaFdLJz+/F+Agklh
	 fH6jREhcy5OqtQx45UqPb+0fAvGLLaQh+QtOuckcwW65nhwcPxemKWs15yS+eBMHAN
	 3M8YZJFiml9tm9M0TL7cqaxVZysYqLpdsmo0G9Uk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7520F8028B;
	Tue,  4 Apr 2023 13:46:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D832F80529; Tue,  4 Apr 2023 13:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 138ABF80423
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 13:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 138ABF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pJBvY7VD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DC1763296;
	Tue,  4 Apr 2023 11:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F18C433D2;
	Tue,  4 Apr 2023 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680608791;
	bh=RHCs8FphgqOMMWc0BCoMg/a16dbHn72xyUKpV1s96HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJBvY7VDPPEbSY7kL6tl4DGnbEZo0yrwkM4oAcyc/8vXICAUPShFvBOICNYF3ye0M
	 247NnTkfHBhivIeoQEWVZ2YWJ5gRlWBfeUpaI8QaFyvd4/71ulYBmJoKBnj66e/1WZ
	 9MBLKcR3JRIQogsAkATJ1ZVXiXsqp6EH+SdDkPUYfL5tUnxgQxO8FiNrvL1hVEx0Xe
	 vsAJ2oym40KfGNFWWqQEYCjm60OfD4tPkJX1Ji6cF6FSQMz+2s10FsdpOmO5y2jLEt
	 kMhPx3eUpz3SjK2LB3RnZj1bdNw8ieNdpg432ZOUCSOF5rMzymE1JFLvSLucMHY1CK
	 UTRXv6zWXdSTw==
Date: Tue, 4 Apr 2023 12:46:25 +0100
From: Mark Brown <broonie@kernel.org>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] ASoC: ti: =?iso-8859-1?Q?omap-?=
 =?iso-8859-1?Q?dmic=3A_use=A0devm=5Fplatform=5Fioremap=5Fresource=5Fbynam?=
 =?iso-8859-1?B?ZSgp?=
Message-ID: <48369cd0-cac8-421e-8691-e730a619d928@sirena.org.uk>
References: <202303221410035741246@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8bHbsp7cSqyHRWkg"
Content-Disposition: inline
In-Reply-To: <202303221410035741246@zte.com.cn>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: PLIYLAHKTLDJZ5B3UDQHVXIU7RDOYGPA
X-Message-ID-Hash: PLIYLAHKTLDJZ5B3UDQHVXIU7RDOYGPA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLIYLAHKTLDJZ5B3UDQHVXIU7RDOYGPA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8bHbsp7cSqyHRWkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 02:10:03PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource_byname(), as this is exactly what
> this function does.

This doesn't apply against current code, please check and resend.

--8bHbsp7cSqyHRWkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsDhAACgkQJNaLcl1U
h9Azgwf/bZGUQm4wOkmEdAXrBeNHI6JSXBqe+aLgVAVjMpYhHvFlp952bmZ5toBW
VeTFZ8tkjLJZ4x+9xFot3Q5ohBg/WVmfC2PHAf2UdFWdemogpmype3GtCRScfUKb
pAX+GHOGZlHsHMBb5+2mtFT50LFGSW7wfK2NCw7VkNcahj/157huhZX3HR84bMJt
FZJ/xu7WWZTSL+3FX8RgeVc2Orp6TwbujXGbQOh0ETrn4Py4hSVIxJfwtPlGQb7R
UbiINWoLhuuWLiVlOboPHx0QiNJyJWFboj4eI50GkFPK4OCH36vzdgkzON85Uewy
Fg3bd6Jk1B7/h02FQKzvnqGlibBCCA==
=2nf1
-----END PGP SIGNATURE-----

--8bHbsp7cSqyHRWkg--
