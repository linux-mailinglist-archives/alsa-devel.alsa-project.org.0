Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2A7D3F57
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 20:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2F9C846;
	Mon, 23 Oct 2023 20:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2F9C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698086157;
	bh=mxVaLf3SUAkIWLdEpZT8qhdQisgiaf1e9hz+ZutW38w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nd4GOCQG1O8x68yb+XcoPQAcAuqwHXvkR74taU5J+/uCUbHXTg58KR7EjhrmJ/NAm
	 E/DzPNLwWZ43ea17wSn7n79EDvaDxzzvVc1kQIWFulnvTyHz0+Rd9J+oJ+vPpTn5gY
	 x+Ez6ea/54VhNj07JdEDnvj9jp9GLI1HEIvoRTFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13D5DF80537; Mon, 23 Oct 2023 20:35:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D31A7F8032D;
	Mon, 23 Oct 2023 20:35:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F4B3F804F3; Mon, 23 Oct 2023 20:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 859C6F80027
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 20:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 859C6F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XVsLuEdg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33690B82076;
	Mon, 23 Oct 2023 18:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EDFC433C7;
	Mon, 23 Oct 2023 18:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698086094;
	bh=mxVaLf3SUAkIWLdEpZT8qhdQisgiaf1e9hz+ZutW38w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVsLuEdg5TCsQL6y3nSbofgAqsEQdCYFHBVeiYhadeZx/Sta+WbyMNW9pgW+O1ydS
	 9CdMNxy91JKwuLSVn/6VyBTmepaweHPq+AlD7kO/8Z03bWiebwgXD1vLHL/DiDXrl6
	 sfQ9CUrry4jIWGcwpWpExo8QYpJVR7PBnZxtOZB/0KziBT+gtIQa4MuOXxRz7pm9hh
	 AKJKlfCniOyiPpninrwDoZV9pGF6VL+bUJN8WZtpuPIk1F5p2knqv+P9u2FDhxjNRV
	 eNxqUaGh9faCajcLWnQNtyc44R8rLMOVStDUrTL823g6mWF09QeJ4ybQXFOq6O6V9Z
	 C2vawlTTx60BQ==
Date: Mon, 23 Oct 2023 19:34:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH for-next] ASoC: SOF: Make return of remove_late void, too
Message-ID: <990885fe-4fff-430a-af3f-6136b6c4a9c9@sirena.org.uk>
References: <20231023153605.863-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SRzaipjvYrsLhIOp"
Content-Disposition: inline
In-Reply-To: <20231023153605.863-1-tiwai@suse.de>
X-Cookie: Never reveal your best argument.
Message-ID-Hash: F7Z4NWTDZCYRHACD2NH7IBVMSYFVE5GV
X-Message-ID-Hash: F7Z4NWTDZCYRHACD2NH7IBVMSYFVE5GV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7Z4NWTDZCYRHACD2NH7IBVMSYFVE5GV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SRzaipjvYrsLhIOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 05:36:05PM +0200, Takashi Iwai wrote:
> Like the change we've done for remove callback, the newly introduced
> remove_late callback should be changed to void return, too.
>=20
> Fixes: 17baaa1f950b ("ASoC: SOF: core: Add probe_early and remove_late ca=
llbacks")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Mark Brown <broonie@kernel.org>

--SRzaipjvYrsLhIOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU2vMkACgkQJNaLcl1U
h9Bibgf/ccVE7pnkfCj7jX5zedFtfnVNNcGk6gjSYqQ6I2+S7nsFQIZBRcV+rkNw
QBD/0ljxtSNqcJ7TF1cW94hckrF9uvllIm2J2Yim1/VIWYlmiInebyqcNTU/N+tx
2zmHpDtF53zsdUR8Wzl5WSR5ea4Zz5klpsIn6zOlpGC2ZKfgXhqsAk8DL/SiEmX7
KokRSsf6lUgu5qsey3uPD1FkQoWD0MaxsuECXoHVUI2N4DG1RfuyAdBouNES350m
TBbY29DulbACaFGtnVCVqMqyYW6dllTSJytbvgeHo0qufNuXHy51x/D43kt0ERCj
gYWlIEORW+mNMGV8iY2H799HeQ77Fw==
=TjlJ
-----END PGP SIGNATURE-----

--SRzaipjvYrsLhIOp--
