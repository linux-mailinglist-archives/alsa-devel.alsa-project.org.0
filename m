Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E677F81C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 986837F1;
	Thu, 17 Aug 2023 15:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 986837F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692280526;
	bh=jiLZu3feVopBbHwTn3M6yEwELhDb/pqchb/mgvuOouw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JpEVOgyGQYQKUopamRTZFyNxLxJBWERRKTOo94S7CVbJxBHxhBoRKvyc0/2285sjp
	 rYAF6E2i7oYs3y16THPUT+LodaHgX0LrxGT43H0dqI3O1Qfu8w1zNbSQ4CV7A1pxmD
	 mI7TmC1cmJuDLj8Foq4E2HppFVkxE+sda2vpax2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AC93F80272; Thu, 17 Aug 2023 15:54:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97342F8016A;
	Thu, 17 Aug 2023 15:54:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57758F8016D; Thu, 17 Aug 2023 15:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D10FF80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D10FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F91766ka
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A93436562C;
	Thu, 17 Aug 2023 13:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111D7C433C7;
	Thu, 17 Aug 2023 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692280446;
	bh=jiLZu3feVopBbHwTn3M6yEwELhDb/pqchb/mgvuOouw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F91766kaLlQMcDguhHpnnnYD3ZRpREuRJ8SWY6aZLz+3c1dqoiuwtJ/bBcYpb+5f4
	 22dqtIuqw3PK+/XDt1gDyK7Zq1Hq1a/oVqa1K4fbPKgGFTWqJlBP5fiVVlqpk0z4QI
	 GmQ2zPeN3YBK2JpS1YydEqHo0yycYaydhlkFDA0iXzykhpko5b9fIDVnf1z+nG1JPR
	 YYg72bV+wd5v1sIKlGhSGxoLqZiBv2Vvs/o0WF10bKa8btkrxDEiXVSCpKzJBre5m0
	 n45b6oGNsI0DjXdp7RXGSXe36OsO3qflwaWSSVshUkmmKz0bhnoIyHd2YJRRzAk+dd
	 lEigZTnJs4V6A==
Date: Thu, 17 Aug 2023 14:54:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ASoC: rt5682: Convert to use GPIO descriptors
Message-ID: <ca058b1f-4214-4011-83ac-5fdacce5fb7c@sirena.org.uk>
References: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
 <20230817-descriptors-asoc-rt-v1-4-434f5f177cee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h1sN1xmkFad5xBdi"
Content-Disposition: inline
In-Reply-To: <20230817-descriptors-asoc-rt-v1-4-434f5f177cee@linaro.org>
X-Cookie: Walk softly and carry a BFG-9000.
Message-ID-Hash: 4P37BPKFMV5OIZEQZYSMLXNG2GDAGGDX
X-Message-ID-Hash: 4P37BPKFMV5OIZEQZYSMLXNG2GDAGGDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4P37BPKFMV5OIZEQZYSMLXNG2GDAGGDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--h1sN1xmkFad5xBdi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 03:30:18PM +0200, Linus Walleij wrote:
> Convert the RT5682 to use GPIO descriptors and drop the
> legacy GPIO headers.
>=20
> We remove the global GPIO number from the platform data,
> but it is still possible to create board files using GPIO
> descriptor tables, if desired.
>=20
> Make sure to make sure SDW devices can associate with
> an LDO1 EN descriptor too, if they so desire by putting
> the lookup into the common code.

This doesn't apply against current code, please check and resend.

--h1sN1xmkFad5xBdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTeJngACgkQJNaLcl1U
h9DMRAf9FpwmrzAd7ICNL8ubOoNSiAM+Ntxp7XqOjMD7ha9HiHgnSsqPm2FEUSCX
iIAX32PCu9Jd4MCqIgxEbC38giRVz0/K42AKLIFJARNE7iDGBZCeeful9TsIA6pS
GFnGmqPQVxBiJVuvuQ76mjGG0pLq8hm7n9IqZvzgqG4NO3I1ZEEkQ5ocfJ4b2dPy
ICRKm5d8QTY5tD+0AUrBbYuq/wxTHxSUoLmh+ew9dYnYZFfaztOmXezdU4l0EsDz
xjhhw13P6WCUiBTkgjKl36FfR674ZGoY7HWy/OLwJ9QyFI2d/6ATl+lZHHbb7ZOg
Vmu1wBqx1Cb2aip8X3JBh2u2YMGP/g==
=qzyf
-----END PGP SIGNATURE-----

--h1sN1xmkFad5xBdi--
