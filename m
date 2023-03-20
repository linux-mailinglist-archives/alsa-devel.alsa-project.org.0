Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377286C1E82
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 18:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEAAF1E7;
	Mon, 20 Mar 2023 18:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEAAF1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679334613;
	bh=zjLHx55WQN88QLGQ5Bg8DnmZqdBFoBXYE8SLNsHlriQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ji7+CP4mBR9R7VQENQOmunVyY65q3PrtC9V5yQO99R109qFDdoWSh8Sad4lVI+zAj
	 yIU8IT9a6j6eC6S1MbzWlxKqXqUuAlnFAoqko7uvgIqF7A6GO/a9AEy4pq7CdAYVUl
	 s7iBZjaMsdIuzy4VMEN2IckCoF11HoIl6aFGDqPk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 236F1F80254;
	Mon, 20 Mar 2023 18:49:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40548F8027B; Mon, 20 Mar 2023 18:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C297F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 18:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C297F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NS88N7Wu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CAD40B8104D;
	Mon, 20 Mar 2023 17:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634A5C433D2;
	Mon, 20 Mar 2023 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679334550;
	bh=zjLHx55WQN88QLGQ5Bg8DnmZqdBFoBXYE8SLNsHlriQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NS88N7WuClRD4kj10ERIrBQhAO1l25vbvRX2n6ZFxxfGqoeMC8na18WtE4M+vjI4T
	 lJv8Lm3lxKOT+GyzgV0zw5wilF7B083anJBdfnGigwLvicqBNUXfFteduvqdHS+TA+
	 XJmkPGQajOqPY2X1Z055ItIMfpVb6SCZV6BBG2GxAGkBAhT9PxYD+1tT10f9e1mEau
	 xDd1V6FiBIVnKAhQQkQxvsUSJsYyTm0+z6th/HUm152DyRseDKfUmu49oL17VZCp+g
	 2KFDpmQ4e9twvYOJotOaVihWbDuk9hXWUol6oQoRiv6h2LaP3iqSKgDXTiQ4v6i82J
	 TP0aZ7WD/Zp7w==
Date: Mon, 20 Mar 2023 17:49:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 3/6] ASoC: ti: remove unnecessary dai_link->platform
Message-ID: <2b8ac344-820b-4481-9b96-6225e29ab0f2@sirena.org.uk>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
 <874jqmjz25.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvUB3v94kvrV1DnL"
Content-Disposition: inline
In-Reply-To: <874jqmjz25.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Stay on the trail.
Message-ID-Hash: DP456U3NHEMOYCBG5RZYG4MMJNFRQ7HG
X-Message-ID-Hash: DP456U3NHEMOYCBG5RZYG4MMJNFRQ7HG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP456U3NHEMOYCBG5RZYG4MMJNFRQ7HG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qvUB3v94kvrV1DnL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2023 at 06:42:10AM +0000, Kuninori Morimoto wrote:
> dai_link->platform is no longer needed if CPU and Platform are
> same Component. This patch removes unnecessary dai_link->platform.

I've not poked at things to try to figure out if it's this specific
patch yet but this series is breaking BeagleBone Black in my CI, none of
the sample rates covered by pcm-test are supported:

  https://lava.sirena.org.uk/scheduler/job/195516#L1430

some should be skipped due to being unsupported but we should see 48kHz
playback covered:

  https://lava.sirena.org.uk/scheduler/job/195338#L1433

--qvUB3v94kvrV1DnL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYnJEACgkQJNaLcl1U
h9C9awf+LRlv5bWW3ZLtrIcAVklPG6bPq7e2UYpowRQdTMXV+GB3rFIMe+PHHZq6
yYnIkIUE4+YwZykMHJ3E6zjmTLgO3KGm6ZKSzBvG6WnB0F4484LsquOagu+mCWoN
6yzgoS9HzlxTvSX4Ou+sHDUzudlKpcLXPx861EG3P60YKrAlAKMIesPgQEvbujmt
0nRvCfGqMhMw+glqEzADG+6jB3UO/EQLaIESkgRMo9lleS/jjdNHY0Y9ujQPtuDH
xFuAY26fspgZ4XaVq/o7lB5nVE+t5OtH6CdEcufD+uIEmKTJJmjukefrM+Kn6dlk
67JXyouP8dV6X1FE7uUG6zidWXQo1A==
=pmKZ
-----END PGP SIGNATURE-----

--qvUB3v94kvrV1DnL--
