Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D90D758049
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 17:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EC55203;
	Tue, 18 Jul 2023 16:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EC55203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689692445;
	bh=C5cKvV81Lfcw2+yW9WCvEOH/KD9II/TyYm8H/pLIbDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CnwWQNQg2IR52B/fmjCnKam9db6NfJry2qNVMroanygosCmTHFrL6CSjHFSv8U0u8
	 y+Jx6lvilOopd9/y7QdbxBZQoh7CCC+kc1TJ6g1JO9qwJ1t9nbVYt4JJoI2XxiFBk5
	 bt3fS8XTMVlgYR6bkiPxHLnohI9cLAsiLC16LX/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D2E5F80557; Tue, 18 Jul 2023 16:59:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6581F80535;
	Tue, 18 Jul 2023 16:59:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FFC4F80544; Tue, 18 Jul 2023 16:59:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80856F8032D
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80856F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MxKYuqFk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 416C461615;
	Tue, 18 Jul 2023 14:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB911C433C8;
	Tue, 18 Jul 2023 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689692353;
	bh=C5cKvV81Lfcw2+yW9WCvEOH/KD9II/TyYm8H/pLIbDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxKYuqFkmfqbI2DjbJ8EX/wbxZbqNNj/kxzGjuSZilc/0yykH+lrPODUdjmA9/xMS
	 YeaKblZx5BPPJQBMn3bOpNtpf2cZmiwBWGBuW14+LGXcwPaR8QbiDY03SUZdNDWQ2C
	 LlL+apdjjHj2lhWbuHjhgD8XUCEpTTLxl37rcv21JMmj87Fq2FFDzdltvsSYbVfnSd
	 ln77ePIYwNybxvAG/ktSpiGhHvohSXzfdMnHQ4oMAwoSK51DSjkuUl3KZ2oKp0RYSt
	 c27BuR7alk831bzY+iAV1esUPFtnwgAUPqSf8LHijDJ67NvcucIDNfpxBiZ+6+hz8P
	 A/JfVzLPrb9pA==
Date: Tue, 18 Jul 2023 15:59:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 03/11] ASoC: atmel: mchp-pdmc: Use snd_ctl_remove_id()
Message-ID: <d150e599-c2b8-4e88-8383-237379ece986@sirena.org.uk>
References: <20230718141304.1032-1-tiwai@suse.de>
 <20230718141304.1032-4-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAra5cUStsCCzaCW"
Content-Disposition: inline
In-Reply-To: <20230718141304.1032-4-tiwai@suse.de>
X-Cookie: Nothing happens.
Message-ID-Hash: 2KQ34CMF2JFZXP44MW7XONMDDB6ESNYA
X-Message-ID-Hash: 2KQ34CMF2JFZXP44MW7XONMDDB6ESNYA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KQ34CMF2JFZXP44MW7XONMDDB6ESNYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RAra5cUStsCCzaCW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 04:12:56PM +0200, Takashi Iwai wrote:
> Use the standard snd_ctl_remove_id() helper instead of open code for
> removing a kctl.  This helps for avoiding possible races.

Acked-by: Mark Brown <broonie@kernel.org>

--RAra5cUStsCCzaCW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2qL0ACgkQJNaLcl1U
h9Am5Af9FqnsF1+G0O1hL/JfYTiuaqqr/cj7MKPekWuxteq2f14xCme0h4IOqDRa
ekj+bRKAYH54ofEaWz6eihZ3iiCOerURrOXtRa0IuQ5fYZuojiOHrGY8B5bisQXo
cpa8c4TLGtemZkD7Szzgl9u0WFrcYVk/zAml+UEsX6DgCXb2KseYfpYwYLBcdG43
0qeKeRgDxIAoPLsewtTvsm3xgAfe5e7laZ/FsUCcMRpIwqO02A9FnbKv14UGAo/q
GussDu9gScWCkwEpuWzQ6Y33Euy+KqOZuDyGZFDoyy07nTq2+oyxJBD/0iSGSU9Q
khJd6BIRglBbu61i6qnZ5XFU512BmQ==
=I8tu
-----END PGP SIGNATURE-----

--RAra5cUStsCCzaCW--
