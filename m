Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C09E0134
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 13:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562A520C3;
	Mon,  2 Dec 2024 13:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562A520C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733140913;
	bh=qN7zSp52L2v1SA9YKpv1TumbOqlVeIrH+RB98EjRP+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSNFiYwlc7PyNKu26Ya+NyPIg/3+r0zyNoAJhQxLBIEdG2N3ms/DUX6B9KTaXRMV7
	 pXTlM4s9wYJfJ1t+35nGhl8tFIG8Vt2g24IUW6Vd24a0PbLXU5oOxHu3S5G+6dSbA2
	 VU0sg4k/pwrXdNo+b0oqUKKqAJE1ZF0pfHTjNmDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3F1F805AF; Mon,  2 Dec 2024 13:01:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F39ECF8047C;
	Mon,  2 Dec 2024 13:01:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1297F80272; Mon,  2 Dec 2024 13:01:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_FAIL,SPF_HELO_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1B34F800E9
	for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2024 13:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1B34F800E9
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 18A7A1C00A0; Mon,  2 Dec 2024 13:01:12 +0100 (CET)
Date: Mon, 2 Dec 2024 13:01:11 +0100
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Luo Yifan <luoyifan@cmss.chinamobile.com>,
	Mark Brown <broonie@kernel.org>, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 5.10 4/6] ASoC: stm: Prevent potential division
 by zero in stm32_sai_mclk_round_rate()
Message-ID: <Z02hh/K7okT4fvOc@duo.ucw.cz>
References: <20241112103803.1654174-1-sashal@kernel.org>
 <20241112103803.1654174-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3fawmNHJI3c1oRFq"
Content-Disposition: inline
In-Reply-To: <20241112103803.1654174-4-sashal@kernel.org>
Message-ID-Hash: HAG3GPNNEHMSPB6OHFXMK57XAGMASWXA
X-Message-ID-Hash: HAG3GPNNEHMSPB6OHFXMK57XAGMASWXA
X-MailFrom: pavel@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAG3GPNNEHMSPB6OHFXMK57XAGMASWXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3fawmNHJI3c1oRFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]
>=20
> This patch checks if div is less than or equal to zero (div <=3D 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.

Well, previous version propagated error code, now it is eaten. Is
stm32_sai_get_clk_div returning 0?

BR,
								Pavel

> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chin=
amobile.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/soc/stm/stm32_sai_sub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 3aa1cf2624020..3a7f0102b4c5c 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -380,8 +380,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *=
hw, unsigned long rate,
>  	int div;
> =20
>  	div =3D stm32_sai_get_clk_div(sai, *prate, rate);
> -	if (div < 0)
> -		return div;
> +	if (div <=3D 0)
> +		return -EINVAL;
> =20
>  	mclk->freq =3D *prate / div;
> =20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--3fawmNHJI3c1oRFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ02hhwAKCRAw5/Bqldv6
8hAkAKC0b/Oh8ldKHa90Tlm10HU7ITeWowCgxMxATUX7/rKamYpZAx5Mk1HHjC8=
=I7ba
-----END PGP SIGNATURE-----

--3fawmNHJI3c1oRFq--
