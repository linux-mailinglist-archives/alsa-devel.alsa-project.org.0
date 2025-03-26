Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F36A71771
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Mar 2025 14:26:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85EDB601A1;
	Wed, 26 Mar 2025 14:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85EDB601A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742995560;
	bh=OhIw89YZkaS3K3MXCywHnvtvlklUf24YtHt6tXGm3sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nkXTlcf8zLtf0F3O7AJz4+3scSO031Av0Zf+Vjs/7XfAGJ17RF9JgAFNmmyq8sZsd
	 d3qYPPRwnFSxcmFjJ+Ht+w+3Q8TcQCkH0dQIC2aRIbLT5c51Oic8GjwhdM6rp1Prpr
	 uLlL7RY9tfTYxRdGS+oIXf/gxE43FT2X3bJ7GHhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2470F805B2; Wed, 26 Mar 2025 14:25:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 967F7F805B2;
	Wed, 26 Mar 2025 14:25:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E06B3F80171; Wed, 26 Mar 2025 14:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02B78F8010B
	for <alsa-devel@alsa-project.org>; Wed, 26 Mar 2025 14:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B78F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bJrjX8zt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6171440BB;
	Wed, 26 Mar 2025 13:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72030C4CEE2;
	Wed, 26 Mar 2025 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742995517;
	bh=OhIw89YZkaS3K3MXCywHnvtvlklUf24YtHt6tXGm3sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJrjX8zt+D0Nh9F+su0AXC6mefdS0Fb/VueSXUSlRhiZHOI1YTqX513PKUGwAMEfu
	 ZlCSF4krPTGW+2HcbakE9Qrc5QylZN0U0/uyR4HwAGxodxKGMIOsNPmMBbg5jzrwRm
	 3Nc2d2XI/NI3Us5cyNM7yLHMztypm5F1uaS7M6RYuEYEWFHcDWz20Cz0+xijCaDVE2
	 EliOYCOb/M6/iwpm/bw0rU+nfj9lMR4Q6KcNyMe9MybmTxgKQKNJms1DVE1hFQFwsK
	 XN33SBCK6rDsEkmOiYM7ynonfeTardP8MIP0Ja2BfEbxaX4N5JriMm24oBHFy0aZpc
	 f2VduwlH+5gGQ==
Date: Wed, 26 Mar 2025 13:25:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Brady Norander <bradynorander@gmail.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	u.kleine-koenig@baylibre.com, Wu Bo <bo.wu@vivo.com>
Subject: Re: [PATCH 3/3] ASoC: dwc: always enable/disable i2s irqs
Message-ID: <98b92d09-435b-4aa4-9b21-496b51ce7d5f@sirena.org.uk>
References: <20250325211805.2099278-1-bradynorander@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uz6+6+wQfmh8uPot"
Content-Disposition: inline
In-Reply-To: <20250325211805.2099278-1-bradynorander@gmail.com>
X-Cookie: To err is humor.
Message-ID-Hash: WDTTFPTEZ655BTYF56CFIEFYOPE3CAJP
X-Message-ID-Hash: WDTTFPTEZ655BTYF56CFIEFYOPE3CAJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDTTFPTEZ655BTYF56CFIEFYOPE3CAJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uz6+6+wQfmh8uPot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 05:18:05PM -0400, Brady Norander wrote:

> Commit a42e988 ("ASoC: dwc: add DMA handshake control") changed the
> behavior of the driver to not enable or disable i2s irqs if using DMA. Th=
is
> breaks platforms such as AMD ACP. Revert to the old behavior by always
> enabling and disabling i2s irqs while keeping DMA handshake control.
>=20
> Fixes: a42e988 ("ASoC: dwc: add DMA handshake control")
> Signed-off-by: Brady Norander <bradynorander@gmail.com>

Same issue with dependencies here - what's going on?  It also doesn't
seem like the changelog is describing what's goin on well, if all AMD
systems were broken by a change from 2023 I'd really expect to have
heard about it by now.  We've had AMD themselves doing fairly extensive
work without reporting any issues.  What specifically is the problem you
are seeing?

--uz6+6+wQfmh8uPot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfkADcACgkQJNaLcl1U
h9AK/gf9ENDYToKaTXb4Hrcx9P0XxvUvlF84RfS1/ib0Hb8qCgU/lMj8niSuv92B
Fm7tRT82kaMCWuHIJIiB0IoTBd6WTqOiuWM2Tu6xJjhy26FZIGnXFh6Sdsm918iu
qsIFKt1MVJCy21/aDuOvRE6D0ZbPuh98Cz+vG65A5mV3eMNWMCd02bBffcFw/Fvr
ewQ1/Mea4BBPy545Xmq+1EeoBRZL6jAG+lQWlR8Xnn6iPtCIZ7C1YeccUL1SUYU1
oMAr61TtcP+o3vME6qPp3XJVfM+xXR0bDZinSZdzpoBHpPiSSv51eEGz6s06d9Bm
sCvKcd0POaQ8jsWW/Yga9/GVsquIxQ==
=PlC9
-----END PGP SIGNATURE-----

--uz6+6+wQfmh8uPot--
