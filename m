Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC67C870B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 15:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B725DD8;
	Fri, 13 Oct 2023 15:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B725DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697204442;
	bh=Daw0oV8avVvs3EF+zKAfgZ1+IJkL9210R2usowvEsyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IfvhiGZiiRHELY0glk9Uf0SBiAkwWH7dVcEBp4XezBkwXCo1EtD94WhZIdBDOTbWP
	 0v8soQWn85wKy6O5ffkLbJ+ghfo0gFSJfSO3bEYcsv1UZCZD2UnZ58wMjl1lDm7FF6
	 d8xEM1gGK60lLeFjjNd5EuAsFF2PPXvhTuJgLbeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26521F80536; Fri, 13 Oct 2023 15:39:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7C0F8027B;
	Fri, 13 Oct 2023 15:39:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20BFFF802BE; Fri, 13 Oct 2023 15:39:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 16A74F8015B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 15:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A74F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ecS4BIyR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4330620F4;
	Fri, 13 Oct 2023 13:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B98C433C8;
	Fri, 13 Oct 2023 13:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697204376;
	bh=Daw0oV8avVvs3EF+zKAfgZ1+IJkL9210R2usowvEsyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ecS4BIyRUjVKqpOSwmbEMFgD2mkLOzob8z36DLk5NsjL5pWRpaaju8vuB9gNGo6/7
	 INLiteok8petspSUsj39GF9S+2co8eF0YKXXl7EB7A5b5GBCxf3fTgbxMOUB3dn15Y
	 TY0i9gTt+bG41cpVQP3Dgi0zNFwa3uJBa++LH96mWvHpSn4minfwop6nMhtvOCXCc0
	 2px4dX0/TIek+xAxyTwYjsfWVBYnRdgWOR4TZ75Optn1KfAcMBBoSiNOlzQassi019
	 vuw1EJuhmlIA9YKgpXDKKCcb8orSY35b3hbRQH9hu3myUUj9qGOUuKnYK0LW5acBri
	 fn/2gS7YyC5aQ==
Date: Fri, 13 Oct 2023 14:39:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v6 05/11] ASoC: fsl_easrc: register m2m platform
 device
Message-ID: <ZSlH8BW8yr+WJFK0@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-6-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UKDVDCqpnMS86zNZ"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-6-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: Q3VQ4RWCTRMY3MMPZ7DEYESOQXEDNVQ5
X-Message-ID-Hash: Q3VQ4RWCTRMY3MMPZ7DEYESOQXEDNVQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3VQ4RWCTRMY3MMPZ7DEYESOQXEDNVQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UKDVDCqpnMS86zNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:59PM +0800, Shengjiu Wang wrote:
> Register m2m platform device,that user can
> use M2M feature.

Acked-by: Mark Brown <broonie@kernel.org>

--UKDVDCqpnMS86zNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpSI4ACgkQJNaLcl1U
h9D3Mgf+PDdKi3n9C0kflM9CvsKjX5j3rfiOo6oGsIA4yaHNFonDmjLM+iJAGM0x
QTPAK5TwHUOu2fZ9wQHo7FKNTV7OPH5h8VuU+wQjWc9Ftg4kgmqbAEfFsw/EEjaz
k4J8zpD1c+B4iF3NNAKaJu+6HIkx6bcffkDCaUqtFEjewvc7mjNZNBnsL+rilyhy
z7/tS6VfFD5Skjl5xG1x+Kh9XO0ziRJSfUNNEGzRFFzK73GngtE0Reh8qN4aNNXg
1BhBUoDRS0Qczjt/Cb9YXTaicRJBvHEMTLz/6vl/sMlUhweBrLXWuX0rwDwR6MT5
2tMlxCViUMgG/ug9JJOB6acfEQVwBw==
=3R9J
-----END PGP SIGNATURE-----

--UKDVDCqpnMS86zNZ--
