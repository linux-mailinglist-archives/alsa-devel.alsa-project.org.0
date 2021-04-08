Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1B3586F0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 16:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B33D1669;
	Thu,  8 Apr 2021 16:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B33D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617891517;
	bh=uHMNOrLWDQPcdH9293oDumJL1wOYXKYJNSZES+8V2hE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsSM+nYqm1GWnX/ov2vQA+ZvKen8Wdi+lgBHrOrH9UV/RUNXGDk4wMdfSLewOd3TL
	 ZWCW0g3MTvkuYUHHIpHwhbj6Ye2NV1p3X+Du3M3rZSWmXVDr0M7hsat5Wo5e3DxywW
	 gyFv3XeqIj+STWyzHbNi6EC3oD1cmG8/c02jfnbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85EC6F80246;
	Thu,  8 Apr 2021 16:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C98CEF8020B; Thu,  8 Apr 2021 16:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CCC4F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 16:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CCC4F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XpzMXEHe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EBB96113D;
 Thu,  8 Apr 2021 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617891417;
 bh=uHMNOrLWDQPcdH9293oDumJL1wOYXKYJNSZES+8V2hE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XpzMXEHehLcSHmLdNFOqe7oqTC5MT8JpMikWA5cSovvP7oC/IvLAO15VxUWlhYmNB
 E9b4RId6X5jINoDUPrw8fQd9Wft+gGlXGc6U/uJUIPm7tQ4UMJevPv8i2utFopNLp7
 V+FxwsutU8PAfEQsv9B12O8iMbMRGtYSzQXa7NF0Leg1vFg8AoCn8PxXTlaV2mhvND
 jpBNit0PR5A3kaAFwjEomx8iLPGpVUurgqDCJpJTEmkeiQwE7WnwciYwkVOm+o1tx6
 ndCu07e5vk8L4YJ1NYZSKKpRRGkFDSALoqlp9A8rX2KRl10zzKu415h9DbG3ik/+H+
 +5ohjfLKLyQOA==
Date: Thu, 8 Apr 2021 15:16:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 03/14] ASoC: simple-card-utils: setup dai_props
 cpu_dai/codec_dai at initial timing
Message-ID: <20210408141639.GA39604@sirena.org.uk>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87sg4aod1s.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <87sg4aod1s.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: RADIO SHACK LEVEL II BASIC
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 01:15:43PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> We couldn't setup dai_props cpu_dai/codec_dai at the initial timing,
> because "counting DAIs loop" and "detecting DAIs loop" were different.
> But we can do it now, because these are using same loops.

This doesn't reply against current code, please check and resend:

Applying: ASoC: simple-card-utils: setup dai_props cpu_dai/codec_dai at ini=
tial timing
Using index info to reconstruct a base tree...
M	sound/soc/generic/audio-graph-card.c
M	sound/soc/generic/simple-card.c
Falling back to patching base and 3-way merge...
Auto-merging sound/soc/generic/simple-card.c
Auto-merging sound/soc/generic/audio-graph-card.c
CONFLICT (content): Merge conflict in sound/soc/generic/audio-graph-card.c
error: Failed to merge in the changes.
Patch failed at 0003 ASoC: simple-card-utils: setup dai_props cpu_dai/codec=
_dai at initial timing

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBvEEcACgkQJNaLcl1U
h9DWdwf9F03BEeMNoUl0BraTcO0FNhUCbtu0cpvBKwY8c5pCJ01bzrr+qPrHjm22
JPfy0OxqxLnEQ9Qmk/6M9ldYxKUoTTOGU9K0qqUbTYsgr0c9+MpMc4kdoUYZptAP
XMlrEt0JiuowN1kEjcM6L5uOLdPZiA5N6BXL14mmFwxOdiBcCji25tfDsenjnZRk
nUNhRhl/IgzP5OiOJ238mfk/IsmgBCnpvBwR7hBHVNYf9w/FAyftSu6SY3GZhb6R
+E6v8RI/6bbo4UjMf91esDpGi0hN+l+fiujPIq3yCzbcbi282esej/9LQC4c4gGp
V8Im50JrP4oc4xkqnSvAnCYxwzA3Eg==
=4Neo
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
