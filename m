Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1BD745CA4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 14:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08DC11DD;
	Mon,  3 Jul 2023 14:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08DC11DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688388899;
	bh=hewjnNwAOpFhWN8t9+3hp7dpuy2ksO2+BijfX7/pwtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i3cCe1wW2SYrikKqOs0WB3RNBmwwxv+Xmh4mcvT+uq9BmRa5k9l/JUG37TODWVllL
	 60onGqJNOh7mk6f3YNl2ljKtsLM83zwei6CidCmlg9J4NOQrC40PkWQa2I7gbmJjYT
	 uytQkkPct5HeYWByx4abku6BO37neUVKZfUmuzmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76A57F80132; Mon,  3 Jul 2023 14:54:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEEEF80124;
	Mon,  3 Jul 2023 14:54:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26C3DF80125; Mon,  3 Jul 2023 14:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15FABF80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 14:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FABF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UWP6F7tv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3539560EFB;
	Mon,  3 Jul 2023 12:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F7EC433C7;
	Mon,  3 Jul 2023 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688388838;
	bh=hewjnNwAOpFhWN8t9+3hp7dpuy2ksO2+BijfX7/pwtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWP6F7tvelb32aSFkmXp3E37CiVtJLdyV1Q/Ol+oRCeZ8nbkDPcaKwnvipmDJY7tH
	 54BJt+Oc4y83gshDU9zSBY8HSz7K/MU8Y0voUnWGhtfIy1CdScydVw8NVkMU1EoU2n
	 zQ7PTlmNXODiJcTWCcRKDWy6zczUYmSHoqRbRHJ21RUV2qlBOEw0yuexv38JuMAhSx
	 sFkOlE4rxVTL3Qbj35KkPeFAQTB7J9Jz41zlNo3gfESItN/Y9hSRVQ6Bq1nPFiw674
	 nOiuhwpXKQywk/gVZzjACg//zXsHevdnUMkGHdOaJWCePBUDyigaQH1iPwiFg4JO6l
	 DQeRuvSaX7XWg==
Date: Mon, 3 Jul 2023 13:53:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	hverkuil@xs4all.nl, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
Message-ID: <43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
 <ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
 <CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
 <87h6ql5hch.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XyTCZVqlIuin1XJf"
Content-Disposition: inline
In-Reply-To: <87h6ql5hch.wl-tiwai@suse.de>
X-Cookie: Please go away.
Message-ID-Hash: 6CJK66DUIO6T65U2YDPTXJKI56FVVUJB
X-Message-ID-Hash: 6CJK66DUIO6T65U2YDPTXJKI56FVVUJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CJK66DUIO6T65U2YDPTXJKI56FVVUJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XyTCZVqlIuin1XJf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:
> Shengjiu Wang wrote:

> > There is no such memory to memory interface defined in ALSA.=A0 Seems
> > ALSA is not designed for M2M cases.

> There is no restriction to implement memory-to-memory capture in ALSA
> framework.  It'd be a matter of the setup of PCM capture source, and
> you can create a corresponding kcontrol element to switch the mode or
> assign a dedicated PCM substream, for example.  It's just that there
> was little demand for that.

Yeah, it's not a terrible idea.  We might use it more if we ever get
better support for DSP audio, routing between the DSP and external
devices if driven from the CPU would be a memory to memory thing.

> I'm not much against adding the audio capture feature to V4L2,
> though, if it really makes sense.  But creating a crafted /dev/audio*
> doesn't look like a great idea to me, at least.

I've still not looked at the code at all.

--XyTCZVqlIuin1XJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSixNsACgkQJNaLcl1U
h9AHBgf+PmrkjDoGNN2pkJ1mNw5jmGsBAJkUX+OHPdAbWl0Su866gJ9fD6vXajFO
Y/9d2UZ5ubbmVeBZn47fj95dmPvq2povgtl2nzNz85MpDwcac03pQBVmS+ZPfYlk
Ui4s5mk+QFpXMRCxt4b9vYr8Wkp/lVH4RaD2q3fOXGeQqUvCp0Sn99z6tDZaTWBO
9hShFfh4il+VkKeBk6+m2MxWTcAEy5pAM7moCIE0VMDmZ4MEWmaXxvyJCZEOapD9
f+WpZURGpbdIi5yBHwfi/zVEHzfo2DGccC2UauYc50Z+hekml26dBQuTvfZM37Qc
BN0Unl4+vKxBW8rdx7rkbRIUueFLGA==
=SMUJ
-----END PGP SIGNATURE-----

--XyTCZVqlIuin1XJf--
