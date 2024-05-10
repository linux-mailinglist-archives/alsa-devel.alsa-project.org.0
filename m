Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966068C2437
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 14:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13597E65;
	Fri, 10 May 2024 14:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13597E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715342524;
	bh=9ovsFJ6ZrOBJyFll9nK6uQFP8C7/R23yKUCEhZqKl/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jhYDuhyc5tgRmz878RItc9wJjGN2J93dxOkXbRrQG5OQlyiKWqYLuYdd1U7HVCXON
	 NLFbqOuJQMct8kcxGvxQUgZoQ9BkxBGDn/xCgrSTS16qDObDDuDIdv/iHnybJ+gbv3
	 iPGgvOmHpcwMSiJT3y0p0p5Eaxt0djE5OEQ63Mqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D48C8F8024C; Fri, 10 May 2024 14:01:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E081F8024C;
	Fri, 10 May 2024 14:01:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B36F8049C; Fri, 10 May 2024 14:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 745AFF8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 14:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 745AFF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KuDDmken
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E704CE1DA8;
	Fri, 10 May 2024 12:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6557CC113CC;
	Fri, 10 May 2024 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715342478;
	bh=9ovsFJ6ZrOBJyFll9nK6uQFP8C7/R23yKUCEhZqKl/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuDDmkenF2J00ixLTCrqHQt7rt8Vs+Z409+YpkiE+cBgN6Wt0JZwalgnhsIh7Bq9b
	 /9ZzWm4yq0TbHfILgF7XNH2klB4eSGtAXADgyfsZ7OfwoV1LYeCgue2ODVSInBZSly
	 YworIzqlSiutHrLBaKCtePqDpMTMLH8NRwbqNCe1EG23876SRbTdC7gTWZe2YfMMoU
	 DfIxs8NPo3ItXZVWIyAFgwde2HiWIUmRoFqfu1sfreoGymA943b0XcicsArkhk2XbM
	 wz+TkarYCZq+0bAtzcakNJmgEutOODm6EjiVsZQo2WKImcsUft6f2kCPCqglRF6PXi
	 5dRRIMFdTZRIw==
Date: Fri, 10 May 2024 13:01:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.9-rc7
Message-ID: <Zj4Mi5u9RFCw1Cl1@finisterre.sirena.org.uk>
References: <5d7330b5bc59eaa0a0ed5d7be3c9a838.broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HpFm5718f+4G1ZiY"
Content-Disposition: inline
In-Reply-To: <5d7330b5bc59eaa0a0ed5d7be3c9a838.broonie@kernel.org>
X-Cookie: Did I SELL OUT yet??
Message-ID-Hash: E4QALR4VVL37Y4CURD46BNGCJZSOIBMD
X-Message-ID-Hash: E4QALR4VVL37Y4CURD46BNGCJZSOIBMD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4QALR4VVL37Y4CURD46BNGCJZSOIBMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HpFm5718f+4G1ZiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 12:57:58PM +0100, Mark Brown wrote:

> ASoC: Fixes for v6.9
>=20
> A few final fixes for v6.9, none of them super major but all real.

I just realised I've got a couple more fixes still in test - I'll send
an additional request for those later assuming no problems.

--HpFm5718f+4G1ZiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY+DIsACgkQJNaLcl1U
h9DPXwf+MZqx2i05LE6rKjLrGRunSCr1WoQ5RIQyyFfEXtiTT+UjTXYtSJykb2c5
7xM4erhJUd7K/z9BhGLajKPxiDN0Z/5PW8OW8vSpqC625GkwhuFd/4eX4dVB6Ypg
/lPwGAg06dUdlB10g5sk0oPZCvVUeVBY3MlmrBHPKyRn9E6LKIRtXepuAM1ugAa7
yMsppRu/zgYsEQlw0Dgdun7u/EO3qEmfZcS9wxrJXmwRkz62dusUmV3nQSjbGhs6
tk0baNjyrsMkODqJmWx5FG0MXjCyhv0iL3bnYqlGbcFJUfBhFGHyMnLtpU286BBZ
T7/NUn8XuX3x/DzlKYjvc3bC7SAl4A==
=EHn3
-----END PGP SIGNATURE-----

--HpFm5718f+4G1ZiY--
