Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341977B944
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BDB682B;
	Mon, 14 Aug 2023 15:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BDB682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692018095;
	bh=yvZaPtCDpYus2GIWv4cRALOvUE7UzxXRXwB9m9FkoM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MZHYr7ka+C2KveHFZNO0FchPYsYevSAXUDjHmzj0f4fMUL46cUse5AdF83qP6bW4X
	 abzW6nt3UGEoZxh3VemaqqHiML/N1uEtHDJJ1hqWFH8GVSJrhLHbfuxb9WJPXMAeoW
	 PJur1bkDml9ko18p/nT552+7nbuw5X/QgE1UP1wM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D505F80553; Mon, 14 Aug 2023 15:00:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D18BF80551;
	Mon, 14 Aug 2023 15:00:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556E0F80553; Mon, 14 Aug 2023 15:00:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A340CF80551
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 15:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A340CF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b+g2DWm+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2E93611FB;
	Mon, 14 Aug 2023 13:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C2FC433C8;
	Mon, 14 Aug 2023 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692018024;
	bh=yvZaPtCDpYus2GIWv4cRALOvUE7UzxXRXwB9m9FkoM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+g2DWm+K428DkmJS3lF2C/3iX8GSfNZt8wymKdPtbecClhURfd974WsSMLULCAB8
	 nRoG2TNx8VHVx5dy3bBkjMpo8HHx6zhARPEzt+Vu7EEXLMmXU5cxuSjC6VONKD3N6g
	 aADMMRYEZX9K88DPd9wp5PFzZun0LTF6qgU6JPuhjLTFPFU2GodYtcNdisrDUf2Igg
	 xkIMmpE6VFyKlIngTsCg7seV2zchGAJT+FVxEPqNKUkF9WIms/GQd+zUGoQ1oJWdax
	 njPdGUlwg4LPLtjPN2nC0+8P45AzuRW4jypFXCYwCeHSkhXne2JT7cAJWM4mJYA2o+
	 iK5TR43QepvQg==
Date: Mon, 14 Aug 2023 14:00:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/25] ASoC: mediatek: Convert to generic PCM copy ops
Message-ID: <8814d58a-c4bb-47a7-b386-4342588030a3@sirena.org.uk>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-20-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e9cXrDQtETRLT4qe"
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-20-tiwai@suse.de>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: FZCYTYAYZS4BX4TLJPYIVDR6BYRCWTRB
X-Message-ID-Hash: FZCYTYAYZS4BX4TLJPYIVDR6BYRCWTRB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZCYTYAYZS4BX4TLJPYIVDR6BYRCWTRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e9cXrDQtETRLT4qe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 01:55:17PM +0200, Takashi Iwai wrote:
> This patch converts the mediatek BT SCO driver code to use the new
> unified PCM copy callback.  It's a straightforward conversion from
> *_user() to *_iter() variants.  As copy_form/to_iter() updates the
> internal offset at each read/write, we can drop the cur_*_idx counter
> in the loop, too.

Reviewed-by: Mark Brown <broonie@kernel.org>

--e9cXrDQtETRLT4qe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTaJWIACgkQJNaLcl1U
h9B7mAgAgG0rWe6fLk6qrZbUnnFOI2s63/YYtPQihDFdkBkTl4yiXRCjbJPmomWu
s6OqCfqusARAKBBFc7h4A8IKiOXbQHOrhGlPpnwMQA4xLEGLO0kteu7DgAc/s6Q/
n1pOA9VtVX35TcCGm+T0/GYJN/GbXwppYQ6P/rcThPk25F4e/Eft6zPWeCR9xSM9
4eOwBuoUzSvGx+ozZRf1MLJxlYudMssGaEPzozgEIMQaEWs+lJRFNlao9ZAkaePd
GQk+vSJQdiiT6BUGNJdRknetz9p0m2iACLdtcJhdqnRT/Ydt0iCdKLlcyrle3+iY
btQXIJGcL4mJaiJWn0vw2baZThdIPw==
=RxGE
-----END PGP SIGNATURE-----

--e9cXrDQtETRLT4qe--
