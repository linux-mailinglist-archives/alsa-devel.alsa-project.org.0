Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49E6C233F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 21:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09272210;
	Mon, 20 Mar 2023 21:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09272210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679345870;
	bh=86wV6SHKFLRLscNqU4NqZQD1Qa7jlgqirWSo7NC2QCw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YiYdr3VvUfKzeB5ffeTFAD55fmbXk5obIA6ooRB4ORf+wflpdwgS6aKgnO1IHrTYf
	 qv5NCHMFunwIeYTxekWIb74wP2sRp9SLiCkTXxXYg0PlQsQYb+Ai2SZo5s0GNvx2d2
	 oV9FiBHHmKRmoR9bZgqlyedBD4FG96Ur4ORqnbZM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5709F80529;
	Mon, 20 Mar 2023 21:56:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28664F8052D; Mon, 20 Mar 2023 21:56:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04150F80527
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 21:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04150F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rz4iDi4s
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C4E1B810AD;
	Mon, 20 Mar 2023 20:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F05C4339B;
	Mon, 20 Mar 2023 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679345785;
	bh=86wV6SHKFLRLscNqU4NqZQD1Qa7jlgqirWSo7NC2QCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rz4iDi4swN+LggDVC4bqiQ4RdkVJluq3Yxew8iyWq6QAkd5TZVCzXy6b0HEYb44hl
	 1jIlA+AIGoMdp6Mbbw6jcwQNoya8zNKjhXbXeRGjR/zC0aPZS6YM4iy0AhEPtiKkpv
	 3ErvHNHIEdLzcLgnYHv/vUBpsfYbvg2Cm/WC1IWnzJxjEK8YPewakkuXbsBo1ol9zu
	 9Zs7lyLVV2+ma2ky2FW5MADL3VmWWqdbcixlfAHZWxo7OzvuHH4/V2483AKLrLLl5D
	 0N5Pl9tht7gP9C3kbBiyog0s1y5wwW7DPsqnnxsDOVsGAIamxLqJoU2PFSbzA9BO7u
	 9FaZvSdsZzplw==
Date: Mon, 20 Mar 2023 20:56:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 5/6] ASoC: simple-card-utils.c: remove unnecessary
 dai_link->platform
Message-ID: <93c65e14-8898-4e9a-987d-19954e62ae0f@sirena.org.uk>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
 <871qlqjz17.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z5aWVNFp0UYBmbu9"
Content-Disposition: inline
In-Reply-To: <871qlqjz17.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: knowledge, n.:
Message-ID-Hash: 74ZK4I2KVX37GBIAD4UNT7IHJDU65224
X-Message-ID-Hash: 74ZK4I2KVX37GBIAD4UNT7IHJDU65224
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74ZK4I2KVX37GBIAD4UNT7IHJDU65224/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Z5aWVNFp0UYBmbu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 06:42:44AM +0000, Kuninori Morimoto wrote:
> dai_link->platform is no longer needed if CPU and Platform are
> same Component. This patch removes unnecessary dai_link->platform.
>=20
> Simple-Card (Normal) is supporting platform, but
> Simple-Cadd (DPCM), Audio-Graph-Card/Card2 (Normal/DPCM) are not
> for now.

A bisect tells me that this patch rather than the TI one is responsible
for the issues I'm seeing on BeagleBone Black.

--Z5aWVNFp0UYBmbu9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYyHIACgkQJNaLcl1U
h9AEUwf+NWHr9RMJkxDKIGELzMI7CPiZ2ArVtr3L1EoRD9wXYq2JsiQeu+hdMDfn
GygN3NHmjPDkngqUWc/iBwQdate1Y2jmvHR6tCPXacpe6nd+cByd0uLM7ad31isz
QKoIOh6+1gRy+gRtAoItreA12Lf1WCd1kxbx5pce6pTiyQNfMLRvbrcWTXpDF6kQ
o2ZFvjlGReB1YwJ53EFYMPYmS4S+kWCiO+I/iSOniqqiJAGry8D53zXGMfwU2hz3
h09M+e3OdC2M/NWaexJ8V4O9sD1ADEYq1ZjJaU/J0Zhm6LeVndLJAg4E0jxrErlz
0YlhOfSaWM0SXIyXdgLCh9BCdS3G8g==
=Bez0
-----END PGP SIGNATURE-----

--Z5aWVNFp0UYBmbu9--
