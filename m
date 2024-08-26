Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043195F489
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 17:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC4D832;
	Mon, 26 Aug 2024 17:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC4D832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724684628;
	bh=O4VWrKxp1GWleAFRVAxqHzy0zSP81EZGnrExzVJHOAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cw61AkCe1oBxUBJq9Rk412e1i/4dyACbEIK/HyJU53yoLWPzwgKt0zyMg433ZvRjS
	 koahMUKYRClwHWjjpD/WFEpe6GxoLqrcZ5tMsrg5Qz/vONfTdRAucqnFEtoZehAYN+
	 Xi7YNIFkfGUMsC8F9ILFP1XrbteT0qUp/xmWlX3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7206F805BD; Mon, 26 Aug 2024 17:03:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E505F805AF;
	Mon, 26 Aug 2024 17:03:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D053F80087; Mon, 26 Aug 2024 16:49:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 056C4F80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 16:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 056C4F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RNr8ah+d
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46182A42993;
	Mon, 26 Aug 2024 14:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85267C52FC5;
	Mon, 26 Aug 2024 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683438;
	bh=O4VWrKxp1GWleAFRVAxqHzy0zSP81EZGnrExzVJHOAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNr8ah+d2rnHKo5ptAt7ViZdR6b97bEObIGd0mmnJnD8ey1SkGzYkkOHwG+MbfLUI
	 HC5MPhHqZsodRItK8wh6rBH1gxQPBexlDFCEkpbQt6tLO4A5pmQ6IuhjfZe53GrR9W
	 y6w/HhLO9RvXa3pmYvgxBdFEBdfhddMW5dpXTNWvq5a8Zu2reges2NnUhxTtoQVc9e
	 FnXSrmy/bqjx7SrUhdPr1ORB2b9vpBQTKFWzTHOe4nWIxJHJOdvl8OnCOzg1FXBcKk
	 e9044U/8LOsl9pigtAgpvSDPKNcG5Bnkid2ppKoCXdWVORJflx+OEJAKZx8rc1Cyin
	 G87eByZIxc1KA==
Date: Mon, 26 Aug 2024 15:43:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: [PATCH 0/1] Add support for primary mi2s on SM8250
Message-ID: <ZsyUqk0JcDxXzzgf@finisterre.sirena.org.uk>
References: <20240826134920.55148-1-adrian@travitia.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2OhJqBqwzjud+qPO"
Content-Disposition: inline
In-Reply-To: <20240826134920.55148-1-adrian@travitia.xyz>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: XDLVC76TZDMEYMEWTVLYMLAVPGLT4JD6
X-Message-ID-Hash: XDLVC76TZDMEYMEWTVLYMLAVPGLT4JD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDLVC76TZDMEYMEWTVLYMLAVPGLT4JD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2OhJqBqwzjud+qPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 03:49:19PM +0200, Jens Reidel wrote:
> This patch adds support for the primary mi2s interface on devices using S=
M8250
> audio drivers. Tested on SM7150 (xiaomi-davinci). SM7150 sound is close to
> SM8250 and we intend to use it as a fallback in the future.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--2OhJqBqwzjud+qPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbMlKcACgkQJNaLcl1U
h9BauQf/dE/c4FhAbkfP0xa3ksmISKFIrlSbZmMy8d1cWAT3qmTScAjvv9eMd7Zx
Xkesa4LM25NfrDwsDY50GvPFB4h/y71WidUYl78t3av7ZSP/B90UsMuZ+0MtybWK
TTPZP/oO3GzZ85qLU+zxHxGUJPB4trmKE+zCZRJ4ri23AFpQNIw8AQOjg080NGrw
6yTuLYbvaG4VHMWJQn4yw83vCFpk0ms3Zw6JnCPb8fTJYokDUVAaeCbPYU4U7Gc/
ugYbsGdCuXK8/eOdH2l927CnMcYlwhUMVEd0C0ZfI+yh0j3RjhYp3xVNs98N0Vh7
Uyt0CEVxZph4bHWFA2HGiNI6YTpNtQ==
=lS+U
-----END PGP SIGNATURE-----

--2OhJqBqwzjud+qPO--
