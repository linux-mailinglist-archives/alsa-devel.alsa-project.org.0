Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCE914866
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 13:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 726B4826;
	Mon, 24 Jun 2024 13:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 726B4826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719228030;
	bh=jwRuwDcYkx6HKhRYpj9ivnWyjbPJ2carDaco6Q3fl5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mNy/RMcHilEICI7rXVhAOAdGwR/mTz/1JQEi3kdcnbqSpg/gYN8hGthvQJsUCHC9H
	 8SE6rccpah6mcZKyTH5dMxkQ+B3baC687T+fF1Jcy7oTShBdXlVtJ6eJgGwrLjp2Sn
	 eQWp7ETmtkRD088NmJjfUIHn/duFAoAWDo5bX0/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1594F800E4; Mon, 24 Jun 2024 13:20:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A677F805A8;
	Mon, 24 Jun 2024 13:20:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDBA2F80495; Mon, 24 Jun 2024 13:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FFD6F800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 13:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFD6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GJUCynfX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6735B60BC5;
	Mon, 24 Jun 2024 11:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205A5C32781;
	Mon, 24 Jun 2024 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719227996;
	bh=jwRuwDcYkx6HKhRYpj9ivnWyjbPJ2carDaco6Q3fl5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJUCynfX/d55AUJywlTOmPPeEMHC2xfyNOTwW8d7xyIvfCEDRXl/UxyPqR5OlwycI
	 K/c5LDiWNY0tmenmxAdvzTpuzEV7eMxdERVdcVLkv0xx8WA/PEROQD7XGSPj+gp3/Z
	 20sACruQIHcT2ttGWZVpeR2DRhLaAAfXFh0OLgJB7xH+OJc3QvOZhmEQDlXH+JJ5rb
	 MZj0HHmJGycB/QDgTWXLsyzEeX/Nq3YTejZCs3rFzT472QP30bg7G3W8MgokKsi3hf
	 q1ZeojkU39GdnnAbN5FktmkRBW24CasiRZTdax0i/zqLr3+nDjoiB7S6+CURyGCurj
	 IDBnVoJ715oEQ==
Date: Mon, 24 Jun 2024 12:19:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems
 for audio-widgets
Message-ID: <2d33411e-b98c-4cd8-aca9-d65b55fe43bf@sirena.org.uk>
References: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
 <5318f6e2-7bb2-4ed5-b0aa-585a6a2d8a5d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3UDGno+ZHVOYsb7K"
Content-Disposition: inline
In-Reply-To: <5318f6e2-7bb2-4ed5-b0aa-585a6a2d8a5d@linaro.org>
X-Cookie: Allow 6 to 8 weeks for delivery.
Message-ID-Hash: EWVT6IWQ7MU6R2CXYIHAZ5LU6AYGPZKM
X-Message-ID-Hash: EWVT6IWQ7MU6R2CXYIHAZ5LU6AYGPZKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWVT6IWQ7MU6R2CXYIHAZ5LU6AYGPZKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3UDGno+ZHVOYsb7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:13:44AM +0200, Neil Armstrong wrote:

> Gentle ping !

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--3UDGno+ZHVOYsb7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5VlYACgkQJNaLcl1U
h9D4twgAhu1ezJ/DoUKfgtWfZ0GmLxAwrgt6KsXsN4s3OGsbtIG3G0DKrCzFllHb
k0rMkM4WRBfFDXwg9LbgeXw/KNfBFzx3jHpw/x1xEoaZr/+o3UNMeVeQ36NaYEtC
IEKUb6secYEfRGfy56+J53ROIZEZIIFfaOx4lnKR+eC7WQPaAmWnRk7JKYkDnQso
NnN7JzRoemLk8w0egCPLcybDDsZzaed5ONX4Cu8L3lFpUi5+8cPLVCrEaV8RLatt
5736pIa94htZOdw8H7bA1LlHPtq+ZgUOA+FccPD/bbbDVTjes9hVJ8ymrYz6sS9O
2eXFwNHNDwHts7s5tPlx4Nm8C4+Nkg==
=i/+i
-----END PGP SIGNATURE-----

--3UDGno+ZHVOYsb7K--
