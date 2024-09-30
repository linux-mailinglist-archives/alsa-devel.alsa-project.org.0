Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0E98ABCE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 20:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649AC192E;
	Mon, 30 Sep 2024 20:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649AC192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727720244;
	bh=VCrdlTntQ95qWL4t3QB3ipBkFH7QItj4R8rGZcyzAFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t/7BM9QJBWg4f22YUoJB/SQ6iq8Mbo/pY9TSNte32jc8qIRsWT/30SUKqqlgBUZ/+
	 H9Y+Zay95mVX4jJkOk9UUEBonrPPh6qzmCxswRXifWK3D81duoGm7I9Jij3hUdTXO0
	 sbYoqarZb6w77s4TmUI/Jy+svbe627lAyjr9X3u8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A421BF8057A; Mon, 30 Sep 2024 20:16:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 336C4F805A1;
	Mon, 30 Sep 2024 20:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 631FBF80517; Mon, 30 Sep 2024 20:16:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 776B1F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 20:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 776B1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FbXBYXkY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B27535C53F4;
	Mon, 30 Sep 2024 18:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20242C4CED2;
	Mon, 30 Sep 2024 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727720202;
	bh=VCrdlTntQ95qWL4t3QB3ipBkFH7QItj4R8rGZcyzAFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbXBYXkYLYvrh5wG2uXVkbjroBgW6xudVIdZKZK/qMgkhcvz4jJHNn2FSegxq7z/f
	 EqWLXm/fSNOkfer8ouNRxcy89yBB/FdN8rAjCBT9i53OmEGeZN5seCoN1iLjxhnAZ1
	 xNfCk0eQhs1WLspsws4mb1X7z9vQyAHOBh1eDULa3GeRA46pQuphSzPk4GP0gdN5vh
	 Y/EF3uh43sa97IO28DAnhm2/V3ulcPLk6qrmy8JIHGOM/5KVV5E4htlSmMlJEfniJm
	 ozhMU9XTNyZfrfPWMSClNkrfqwwC/rlkPS2FgTOVi1SqG3pOMtw4WLoMFyyKr9DHaE
	 rWugP43xSudvQ==
Date: Mon, 30 Sep 2024 19:16:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Message-ID: <75ec53cc-ffd7-484a-8c98-d02fdc6aa847@sirena.org.uk>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
 <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6M3j18/8xJpvc7f0"
Content-Disposition: inline
In-Reply-To: <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
X-Cookie: My EARS are GONE!!
Message-ID-Hash: TQ4AWQROV2GD3JMGXSCL2MUMN2VZ4TUP
X-Message-ID-Hash: TQ4AWQROV2GD3JMGXSCL2MUMN2VZ4TUP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQ4AWQROV2GD3JMGXSCL2MUMN2VZ4TUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6M3j18/8xJpvc7f0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 06:33:49PM +0200, Markus Elfring wrote:

> How do you think about a wording variant like the following?

>   The result from a call of the function =E2=80=9Cdevm_kzalloc=E2=80=9D w=
as passed to
>   a subsequent function call without checking for a null pointer before
>   (according to a memory allocation failure).
>   Thus return directly after a failed devm_kzalloc() call.

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--6M3j18/8xJpvc7f0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb66wQACgkQJNaLcl1U
h9DDGwf+NnAvu+yXZ+1Avz8syo7V5EvlIz6QlMOuUMIW5mOBY1wpiVTxRqJinUHv
MlwzXH4ja6NFSOI5xUJrrAMzIV5M37iY9gxaY0t4Ru9XVjzdDOT2pzL3ZiZp0j7O
xOg3+xKjw6sHxppNuRhji9T29qDn+qgERfqdyA4BxRDLmoMd2QODPVG8DuYBOdXu
XDKLYRLvMl4A6dhfVHyg2cegHSFf5TRe9/SwkTM1D53Ir4AI1DYALag5FZmZVXJD
3v7akWseVADudrgmGLgj7g837Bvcut6qLDNMI4IcPKSoT3OlqF0BCSKsZfjDh2A8
F66LwOaBNHCrbOgm3KaFRt0n6ldyBQ==
=r1s9
-----END PGP SIGNATURE-----

--6M3j18/8xJpvc7f0--
