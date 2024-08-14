Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F39520FC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 19:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456E5299D;
	Wed, 14 Aug 2024 19:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456E5299D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723656100;
	bh=Jb+WxpLaw3NHmaK3iw/91zgnrobRDTne7Avav3luWdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=khvLgW7+0yn01gCfnZux7hATpnfsNh/ZcFaRRLig10ddeetf5HdQKe2rhAZiFOOcr
	 TMLDoP4X0mTSKBuvPltVKhZNbtdXR3BQHs6Vfz9eEdA/Me/2K+W3HijZOntegj8Cjj
	 /V3hO/aIVgWAmSViynnZdlqxb80TAEVC6vjVX52Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29261F8059F; Wed, 14 Aug 2024 19:21:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6412F80517;
	Wed, 14 Aug 2024 19:21:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C154F80423; Wed, 14 Aug 2024 19:21:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25DF6F800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 19:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DF6F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ijtZs73G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADE2E61B24;
	Wed, 14 Aug 2024 17:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5B3C4AF09;
	Wed, 14 Aug 2024 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723656059;
	bh=Jb+WxpLaw3NHmaK3iw/91zgnrobRDTne7Avav3luWdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijtZs73GEV/kTlzhYqtxFz9Y7pZ/7z+TAmMAK0Uk95n3/Cd/NSPB0tZh4y0RWccjN
	 trpgqRgFVrUDZbYCgZJADYiPMZSPM//A7WlireYwJglaAWYWOGTzSdeAKkSjZosnqB
	 WqI4jDkif6VTBaRfag6hoVd5avaESOdWTQooka3LHkycnDAWPXB7DGIJow7vt/ihYr
	 fIzNjkKbZg0YZc1aetelhwQZVB5t1op0g0CnhETAWF0znB7jC2fNy/5O1AIrx07Tjt
	 oV2Io7RDIqU1b3z1Wt8iySdoajVVUUfEv7OlquqsIyeuwE2kYH7C6FAmbIS0zC1mK+
	 YtmJCPW3JhvBg==
Date: Wed, 14 Aug 2024 18:20:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
Message-ID: <a5475607-17a2-4159-9d33-4ad83a763378@sirena.org.uk>
References: <871q3bll5c.wl-kuninori.morimoto.gx@renesas.com>
 <87zfpzk6jq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HOB/WgwM8vMQ79hU"
Content-Disposition: inline
In-Reply-To: <87zfpzk6jq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: My mind is a potato field ...
Message-ID-Hash: IFWCJ2OYUAHN377JZBRNSZHEJJ64TOC6
X-Message-ID-Hash: IFWCJ2OYUAHN377JZBRNSZHEJJ64TOC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFWCJ2OYUAHN377JZBRNSZHEJJ64TOC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HOB/WgwM8vMQ79hU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 01:33:13AM +0000, Kuninori Morimoto wrote:
> This patch moves snd_soc_dpcm_can_be_xxx() functions to top of soc-pcm.c
> This is prepare for cleanup.

This doesn't apply against current code, please check and resend.

--HOB/WgwM8vMQ79hU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma853cACgkQJNaLcl1U
h9BV8Af/S8I5IhGosExkC/sR4K/XxTvOEJ5/GqfsPTonlvSNygS+yNEMQ5I2HVyU
mdgQcAjhI+Q+ILGur9KV4OZ9nJiHXVzyi6kEzyl648Vy2DPvD1/rNK7H+w2CxWyn
z9qkAseCAM2BSPUMeLpg/RcFLg5eeJ1yMs9w2anDCBhnTpyJvXmULhpLrLbmBfVm
6b6LSawyBcKm8O0hp6str4VkHNR9mJwWroWUer1XCrL9u/6cIXryIrKUzzeDUL/e
sHIKwD+a/mV+973tUbbmAcZMr5aXs1pOrrI8lvnVGKLQ6pSaqMeLuhuSFZiD9FWM
m03Ucl0czlAOkTt06sQqIctF25i7+A==
=o7oD
-----END PGP SIGNATURE-----

--HOB/WgwM8vMQ79hU--
