Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0DD617DD9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 14:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E520F84C;
	Thu,  3 Nov 2022 14:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E520F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667481913;
	bh=L6gTgH7FGXP4LHxXJHXJyKDjkUgnH8bq7PXv7yKPwyk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbtxqHOIJnK85juKVZoi3ttK+aGXSvC8my0ltfATpvR4HV9HNjT4rrNVZ8nEmxB65
	 5OlaAscIzXhbJ0xLFywndSv38b44zWw1ejo5CGuz9cJriGXJqt+ZCdBUSH2bqPJInJ
	 KEO3wjBDk/s9FNabSj1MEjNhO2BJa77bU4minj5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 609D1F80155;
	Thu,  3 Nov 2022 14:24:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDB04F8051F; Thu,  3 Nov 2022 14:24:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB81F800BF
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB81F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dm2vslAC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19B4AB827CB;
 Thu,  3 Nov 2022 13:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E37FC433D6;
 Thu,  3 Nov 2022 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667481846;
 bh=L6gTgH7FGXP4LHxXJHXJyKDjkUgnH8bq7PXv7yKPwyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dm2vslACzU7ZlQKvCTG93D4yvkQTlP3CU+jApY6zziqQKbx3cO3TsUKd6CXbe0m8Q
 qh1Bd2C/OeiEhndcpzwEwitRSycraHf44lJyxXETNYX4+a2eL1fE0C9Eq+t6pjDFsG
 Ze36BJ5eRLR5kefnNsKi+/4BOAfOQOqIqxDKZjPVgucDUyE6EFa+AuV0AbyJ2lef5F
 f+M1LuRTM6vQGMe4ij/wkxpVFI5s73IVDXJIWH4R6jMFbua4fQUVheYtqe/dWD70Pq
 CUIdIWZQhmc+W0w9Xp12yy9W1SmmggvuHmXMYGKu/tSPdtGyuKnOF4W83K9O8hLcII
 ImMPuN5A6xk/Q==
Date: Thu, 3 Nov 2022 13:24:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Juan Alfonso Reyes Ajenjo <jareyes@gmv.com>
Subject: Re: [PATCH] Fix tas2562 volume table values
Message-ID: <Y2PA8Bo59YDKvlRG@sirena.org.uk>
References: <VI1PR07MB5839C95198DD090316E87B78BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7tQ0tr3a1Ah8NYMl"
Content-Disposition: inline
In-Reply-To: <VI1PR07MB5839C95198DD090316E87B78BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
X-Cookie: Dead?	No excuse for laying off work.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Gustavo Plaza Roma <gplaza@gmv.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>
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


--7tQ0tr3a1Ah8NYMl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 01:03:01PM +0000, Juan Alfonso Reyes Ajenjo wrote:
> This patch fixes -90dB value (0x84a3 instead of 0x695b)
> This patch adds missing -20dB value (0x06666666)
> float_vol_db_lookup must have 56 values as volume is from 0 to 55 (0-110d=
B)
>=20
> Signed-off-by: Juan Alfonso Reyes Ajenjo jareyes@gmv.com<mailto:jareyes@g=
mv.com>
> Signed-off-by: Gustavo Plaza Roma gplaza@gmv.com<mailto:gplaza@gmv.com>

It looks like this got mangled a bit by your mail client - the signoffs
are rather confused and...

> static const unsigned int float_vol_db_lookup[] =3D {
> 0x00000d43, 0x000010b2, 0x00001505, 0x00001a67, 0x00002151,
> 0x000029f1, 0x000034cd, 0x00004279, 0x000053af, 0x0000695b,
> -0x0000695b, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
> +0x000084a3, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
> 0x0001a36e, 0x00021008, 0x000298c0, 0x000344df, 0x00041d8f,

=2E..there's what looks like a lot of whitespace damage which means the
tooling won't be able to understand it.  I usually recommend git
send-email for sending patches, it will avoid most issues.

Also I'd expect Juan's signoff to be last if it's him sending the patch
(possibly Gustavo should be a Co-developed-by or something?).

--7tQ0tr3a1Ah8NYMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNjwO8ACgkQJNaLcl1U
h9A1agf9H+hPUKiN+og4yJFY5KPBrvPGozO7ZEWc+WjN4FRRY3R36U91Jy6UbsKt
pC038cYIhd8lMP7bSsfwzjHpfuD40khHVlc/1ByRfV8o36fEVhIwhyJMt1p8WBco
GVsM+nFaagTiwutrdpp8gFzT69W43FmmK8ilhdWFGMuagd1CKNIu10q5j/w8H9sl
1Vnrzo8PokACPUL5ZwvxivsDMQkwPHPYwLGAqeamK6iNa66oWL4cs6TjDbLqO2Gn
wH5s20CRfD9ilIOQRhimsh610QcgroZOmsF1pXrC/lDIpHHWsYabuW3gpxYHx8S2
ZlOFasVKGMqEkgVsBpaOzFqmovT9Sw==
=5GW6
-----END PGP SIGNATURE-----

--7tQ0tr3a1Ah8NYMl--
