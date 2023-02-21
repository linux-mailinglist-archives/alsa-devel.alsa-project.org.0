Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D769E9E6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 23:09:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85667E86;
	Tue, 21 Feb 2023 23:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85667E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677017372;
	bh=0bDCc37RZMk8RynOgZTjNXQJhNd6CT6r7FfzrYYttJw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sC95s0eXdo3DM/HTrg8kuZc878on9Q2xTN6Kwy2/OC7HdJ6C20oockmjxtMNkrYDI
	 KCZ22xFsilNPReZETc7nQmX7K/gGVIKrGAqo4PaqEwOqyd7QzdALIWwWq/XuBeMI1Z
	 01vAbhhi7PsBVeFgdZWg8v3W+Fe9s93CVqjZAYQo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF695F8025A;
	Tue, 21 Feb 2023 23:08:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 574BDF80266; Tue, 21 Feb 2023 23:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D23C0F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 23:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D23C0F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T5XPxWPb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB619B810A6;
	Tue, 21 Feb 2023 22:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18985C433EF;
	Tue, 21 Feb 2023 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677017311;
	bh=0bDCc37RZMk8RynOgZTjNXQJhNd6CT6r7FfzrYYttJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5XPxWPbMbW/tAdU7Hqb28QdxCL1IVodMYfmI8ay7BzUDUAJZ6Axl4ZcbD6afo4pg
	 ys4yY4zghy3oURzE9fmYdKTmYPJUYThI+PkJ7a1932jWj/HS01EAlmzTDFuoDi+UVz
	 kqZE1DMUmbi0dKNATsCKtfSEJhp8iopo+aYOwHfTpEYPeu7wcKt3IfdamagVxVSelv
	 Vl4OJiznG2PO5eeC5oYMnsahSix0a/Gb85PPMVH/wREH4AHlvBqLb/O5DhmP8QGIJb
	 Sj9Ve0z4sc0UnRSET29GL025luO8c6Ee45ITWbXJNUoKMK2f2osP83/qXgQtYdhpGf
	 OCxh6nhmp7ecw==
Date: Tue, 21 Feb 2023 22:08:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per
 gpio
Message-ID: <Y/VA3HK/jGVPbrqb@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qmxly6Gn0iLCwqrs"
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-3-clamor95@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: 55XSEBSLH5ZDHDZ6PMAA2ARTYFSQ6OX2
X-Message-ID-Hash: 55XSEBSLH5ZDHDZ6PMAA2ARTYFSQ6OX2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55XSEBSLH5ZDHDZ6PMAA2ARTYFSQ6OX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qmxly6Gn0iLCwqrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 08:32:03PM +0200, Svyatoslav Ryhel wrote:
> This feature is required for coupled hp-mic quirk used
> by some Nvidia Tegra 3 based devices work properly.

Please submit this separately, there's no meaningful dependency
on the rest of the series.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qmxly6Gn0iLCwqrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1QNsACgkQJNaLcl1U
h9DWeQf/VRGoxVKrQTgsSjSQxv1jc70l5vn+sMEJB2VkseJw0TvSyTVBDvQlAvrP
y+gKeYz10KvANtdVfgXhWqeUnZv6criGYBX/aoT35qkboa0fk+eMz8Pmj2C+G3LB
YWRa+Q+Qy7MI3vF3vAYVBl8ElSzym4MKc5jAccVeFZGDIKC14nEKaPNDWC/odv7g
NXapa17rA/uezOIATkgqOmWfDZq3pj6WJM/IgIyJB7s/1EOF3RXUasX/BLbMer2u
rYr5sV7RWK47W9zqyXkFcTnLbwRfLBocJnuS39GSipXbRBHTuJLKfN0p17JYhEzY
2I/4OHcaaNxAMATbKQAt7rmK7MOmjw==
=BGs8
-----END PGP SIGNATURE-----

--qmxly6Gn0iLCwqrs--
