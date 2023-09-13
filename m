Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B363F79F0AB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1DC886;
	Wed, 13 Sep 2023 19:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1DC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694627630;
	bh=b1AmbBkOQZtNPVrxWEpMwdwlbIc78MbgdnHQVD4Kw7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NaBIVHspJ8IlLA7gXQD0pZHNEAcRKLeqJOUXa89xIFy9pijsj7mqj+wKMSBdVbiAe
	 RzklLzDQth/CZdjfrrzqaO8XkDuJVlD0HcP8kn9oAS3eymEN8t9AHfC9lPj0BnbjgR
	 +R0rxmkbiXCpdAt63hIaXsO3P1naAD/U0W2+sFpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3467FF80551; Wed, 13 Sep 2023 19:53:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0503F80246;
	Wed, 13 Sep 2023 19:52:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BDEF80425; Wed, 13 Sep 2023 19:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 112DAF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 112DAF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ojF0T9gC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 50B63B824E5;
	Wed, 13 Sep 2023 17:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB27BC433C7;
	Wed, 13 Sep 2023 17:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694627573;
	bh=b1AmbBkOQZtNPVrxWEpMwdwlbIc78MbgdnHQVD4Kw7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojF0T9gCzQUwiaKR4KQaFy5qfyvO71Rl0aZskv0uRZ8IiNMbOhwsASfpEMpP77NCW
	 kBiguZx0JsWT030J93HyCFMLlVBJiKyT4aF+AEypRGUkg060f5xjcQbwt8E01XTLjh
	 tA6NuSfxROwFLPe8rmEtqyci+GqhIMy/v7M+Xu1dasKG/XaWV7oBlKnQf7iz6MgAV8
	 K6ZoGzHFXi3vWk7GqVxPRJQmsl19VDAlsOYsClPD9dDP8ZXKDwU838wL2E6KG9lT3c
	 4dnJBmve4pawL5sLNGyCsXmfyFv9zje72eilVQCv6/lGviwBXD69L5jebFPjZi5QN4
	 mmbUnxlm4l32g==
Date: Wed, 13 Sep 2023 18:52:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Myunguk Kim <mwkim@gaonchips.com>
Cc: alsa-devel@alsa-project.org, fido_max@inbox.ru,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
	u.kleine-koenig@pengutronix.de, xingyu.wu@starfivetech.com
Subject: Re: [PATCH] [v2] ASoC: dwc: fix typo in comment
Message-ID: <64683b6c-1e31-4037-a47d-b8a19ea77c72@sirena.org.uk>
References: <20230913024103.1454354-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9eUilMpxS1kv3IO2"
Content-Disposition: inline
In-Reply-To: <20230913024103.1454354-1-mwkim@gaonchips.com>
X-Cookie: Use extra care when cleaning on stairs.
Message-ID-Hash: V3A3OJW5QE7IBZ2Y2PBIVFL2BFIWWB5M
X-Message-ID-Hash: V3A3OJW5QE7IBZ2Y2PBIVFL2BFIWWB5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3A3OJW5QE7IBZ2Y2PBIVFL2BFIWWB5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9eUilMpxS1kv3IO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:41:04AM +0900, Myunguk Kim wrote:
> ISR_RXFO means "Status of Data Overrun interrupt for the RX channel"
> according to the datasheet.
>=20
> So, the comment should be RX, not TX

This patch still doesn't apply:

> =20
> -		/* Error Handling: TX */
> +		/* Error Handling: RX */
>  		if (isr[i] & ISR_RXFO)=20
> { 			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=3D%d)\n", i);

The patch is obviously corrupted, the { there should be on the prior
line and even fixing that by hand there appear to be some other issues.

--9eUilMpxS1kv3IO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUB9u8ACgkQJNaLcl1U
h9AXFwf+IJcl0QeR/u0zwMxJdNm7pnY84e90fqyx2T1cPDWa5jz/umlEoBcsdOkU
HC4VUl36XEYT++cfL4mCcpjurJMs23rVWXu9You1YK799zpQhXXxDyqhYV4pOC7f
+jngsR1ucOc6SlLyUN9tzz35xsOi0o63p63S4h7smA3s1qtMkPJkrsc/+wD8iRcq
YnYYZYoy5IBi3l8kfBcsuaEeuV8nDZG6KAXAlRcOSb7CPrq533psIJiVaz/mGy/I
5SudVorJAiW0q1Uu0i9wyji1dRZ8qc7Vp2rqfGw2oUCt3PT7SHTwiCV6Mot8a3op
44Kbp0uZ8AKBOpoJDgFBgAYkJ6vlnQ==
=zaKM
-----END PGP SIGNATURE-----

--9eUilMpxS1kv3IO2--
