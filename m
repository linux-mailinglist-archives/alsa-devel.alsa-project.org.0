Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20296722A42
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 17:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53452820;
	Mon,  5 Jun 2023 17:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53452820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685977684;
	bh=eidswOiIHb6J7g9gZ8YGCj4/t5ooFfmlHRG0/DCt9gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XKbabuLyduJ1j3sdvU/0DW+SKl/5KMqqppPckxFa47rC5HCQzqGOGfh+EXadzD51N
	 OaVFDZbAvlEPBGMVosBkObIikZH0vLYfsgc54CQhwNWGOp5HYyrjKWP4KRh/iPiWBZ
	 xKo05bCIt9bm12G0akgagsFW4Sv9ibA8FOeB95nE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8279AF80199; Mon,  5 Jun 2023 17:07:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2960CF8016C;
	Mon,  5 Jun 2023 17:07:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C8B2F80199; Mon,  5 Jun 2023 17:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C1DEF80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 17:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1DEF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L1WqGVNK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 702A661A55;
	Mon,  5 Jun 2023 15:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708D1C433EF;
	Mon,  5 Jun 2023 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685977619;
	bh=eidswOiIHb6J7g9gZ8YGCj4/t5ooFfmlHRG0/DCt9gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1WqGVNKM0LMprpTuSPW88ttxsQya+6RCSHywsjoqhCt9c0U8etTahbFiEC6fRl/z
	 vf5ygXd303eAmHGnO3775BYbGeLj3HGVeqeS7Bm7PLl6IMJiSYFZOB+8yeuL4XGnw+
	 GB/8G7iZrh5AzEBiWSiciPIu26R5t/QEfayVRJIM08LIGs3RPUJz9P6dYvUveXvjEJ
	 TrMyhTMzCuraxUl851ANQEAyd9bosIc9csPwZCyRMtWtpCdnQ1fI2hDRQLIWIbXwsj
	 rITVGnMABV6X4/drtvOMpvlV3beCXUl6EsatriH3gRVV+EKYJo48qvYje43d5CSfr0
	 LDeHdJQHqLJgQ==
Date: Mon, 5 Jun 2023 16:06:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: YingKun Meng <mengyingkun@loongson.cn>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Message-ID: <9fb3da48-a20b-4e2f-b84a-733f96126ebe@sirena.org.uk>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-3-mengyingkun@loongson.cn>
 <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v/cqJIry2Sg0YIf1"
Content-Disposition: inline
In-Reply-To: <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
X-Cookie: Biggest security gap -- an open mouth.
Message-ID-Hash: 2WXYRGZALSML5G2MJTXZM7URRC4ER4KF
X-Message-ID-Hash: 2WXYRGZALSML5G2MJTXZM7URRC4ER4KF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WXYRGZALSML5G2MJTXZM7URRC4ER4KF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--v/cqJIry2Sg0YIf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 04:45:38PM +0200, Krzysztof Kozlowski wrote:
> On 05/06/2023 14:09, YingKun Meng wrote:

> > +title: Loongson generic ASoC audio sound card.

> What is a "generic audio card"? Does it even match hardware? Bindings
> are supposed to describe hardware, which is usually very specific.

The concept of a generic, reusable sound card seems reasonably clear -
there's a bunch of in tree examples already and the idea that we have to
pull together multiple bits of hardware to make a useful sound subsystem
is a known thing.

> Also: Drop full stop. It's a title.

Shouldn't this be checked by the tooling?

--v/cqJIry2Sg0YIf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR9+g4ACgkQJNaLcl1U
h9BgRgf/UjZGQKyfV2oVwePqSNHH0HwTGYid7NA5rMUyPXEpnfbliL3giOXSCz2x
KzLiuvPawEC9UtkLOs1BRIjKqU8nI9E0I7WgIkr69HhWP9aWxh7ssxmZSUOL4lG7
TqJpq1YNSWQenNPZxu+p/vrJFO/WQMfNk/mhrnYZXDQdMhQV63jvZ7+e3i+lm6/q
KkpoiPKLX/7yu2KQjtGrhqSftdg7H50YGvxx5eC+PqhI/YJK+F29CiiG6X4DJtz1
z6Dzw36EbwyX6BvP8rtcHoW9FhBw/AXXuus91jJqnGxzYRZ1+omUX6jrTytGgAwR
mT9RQweeNJKwgOJIlgdF8OL/e1JD1w==
=Omhv
-----END PGP SIGNATURE-----

--v/cqJIry2Sg0YIf1--
