Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67D93AFEF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 12:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0556E68;
	Wed, 24 Jul 2024 12:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0556E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721817739;
	bh=o3K7HWoTMBQG/1UzREW6RaTLV2C8BxA6Ktoz8Lb/Hek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RpvkFHZbe5xdYdtC0Dc6lDyYAAk4gAnPRFMqOT9mKcfCLQXEt0ogW0Q3al3ipq/rt
	 30NTStQHQaVqw4R4UN8U3qdJ6tFAWI9prcwqBq/ej0MjBb1gchqT0+FZG3uKYMuNte
	 cg/7vEPiO4qC6WnDF/8t4/f2zR0bp25Ve3bIm0CU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86530F805A9; Wed, 24 Jul 2024 12:41:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD47F805AE;
	Wed, 24 Jul 2024 12:41:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BD0F801F5; Wed, 24 Jul 2024 12:31:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	TIME_LIMIT_EXCEEDED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94142F8013D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 12:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94142F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YxI0TbDo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A8ADCE1045;
	Wed, 24 Jul 2024 10:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8305FC32782;
	Wed, 24 Jul 2024 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721816777;
	bh=o3K7HWoTMBQG/1UzREW6RaTLV2C8BxA6Ktoz8Lb/Hek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxI0TbDoT2SqdqOqUvmdEfJJAn6rV4vo5w6kaGqEXwF6jBjei2ISvPuAIeLPsMkDq
	 m6CjC3V2VMtX558BcHoxMQCfxmKUd3ED9A2FC7HXdoWXWQwR0xfWrMjdjSLwdBudgO
	 ne3JbVbIIU7IFsMCNnBheFWiNLZ06afRXnnUHAoODg14ly8t5/R9R0hdXlluSxIsEh
	 AZeE3q8ua2ECU/tgUMe1IVEgmcdBlIcU3rcVlkYQ0xnZOWK9KgBD89iRdONzU/9/vq
	 KmfWIaqLdU3+mWMg6kUdzBG0vqPGP4EJtdf1drWlxGNRHJf7ZD1BGfM4fVXw8qSZxm
	 uFyQn4cVg9B4w==
Date: Wed, 24 Jul 2024 11:26:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 062/112] ASoC: intel: use snd_pcm_is_playback/capture()
Message-ID: <7309d7b2-6ab9-4783-b834-36f37a915186@sirena.org.uk>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
 <87jzhbft1s.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mvK4JfLNIh87nGR"
Content-Disposition: inline
In-Reply-To: <87jzhbft1s.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: HQ36GPC2GFOY3CNDU6OF2K2LA4TSW2VC
X-Message-ID-Hash: HQ36GPC2GFOY3CNDU6OF2K2LA4TSW2VC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQ36GPC2GFOY3CNDU6OF2K2LA4TSW2VC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3mvK4JfLNIh87nGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 24, 2024 at 02:00:15AM +0000, Kuninori Morimoto wrote:
> We can use snd_pcm_is_playback/capture(). Let's use it.

Acked-by: Mark Brown <broonie@kernel.org>

--3mvK4JfLNIh87nGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmag1sQACgkQJNaLcl1U
h9BhhwgAgoko/mA+pviAP+qhoKxqNrrx0bbKP8sjru5dJP9ifNeUuZpyRizHhBuW
TC+1JvgPlserOs9BwdqgQtrSpyDoTgP8t8bOjwkY20NV4fvIn+kJwxZfNz8SW2gX
94yivvY2m+xnrrd/G2DKQiDNGn3Ok/igMwrr4f20AEsGt0sJv+6JDnY116nVpo1N
c8ZVfNrUD68h83+GNDIthA9w0WErXHJkSgURu9ZoewaOJ6bNTxpLDetHcgr7f0+M
i6qzj9g1vTpLPPHoXNZO87TdQqwK36eF5N1MpdWkiJgLYy/6LnkszArmMBY/4qGc
Lf6Nbz7Q8YMUZnmkDrW98WjZikB+mA==
=7ddw
-----END PGP SIGNATURE-----

--3mvK4JfLNIh87nGR--
