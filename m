Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989517AD7C7
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F476DEE;
	Mon, 25 Sep 2023 14:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F476DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695644026;
	bh=SSC0BVXzfik0il2qTGiPt8hnCJY/Pji/ot7ykJoj7UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dyp07ZRFB2pjHx2i1W95BOzBk/Ju0U8VVKEsWfvo2NCwMiOBdhZqLuFwM8k7ORVAl
	 pkly2K7ZtWeLhI4WmTW6nW7y1qJNdkd5Un6L3k0iQH3s46Q2hZL29jmibl1RMSAkXO
	 0pfNJUQMo3K/0bVDAY5qQoFF84sZbvJZLBm1hdL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D44C2F80553; Mon, 25 Sep 2023 14:12:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A14F80166;
	Mon, 25 Sep 2023 14:12:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB200F8016A; Mon, 25 Sep 2023 14:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 595FDF8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 595FDF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPDp2tl9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A48561014;
	Mon, 25 Sep 2023 12:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D265C433C8;
	Mon, 25 Sep 2023 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695643960;
	bh=SSC0BVXzfik0il2qTGiPt8hnCJY/Pji/ot7ykJoj7UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPDp2tl9MXlGlIIQKjBXhBngm/WMWyyAteQ90GpyVU3QDaTm9awAYeQRqJRh81rg5
	 em2mMCx9xycoBn67TvboI3aaoSsrm0xEr/hhs/hftrjbgml088chGn//TXNWQidM9M
	 zJSHqEIb9bSRZs6Ik4flrJ5UjH7oYZTa9qS2jMTj8bIwhXyzSXzFhtjX6mEXW1oHlP
	 43mQl/ow8NU4yEBoalf8RElkhxMY7PJFio1CHYqongx8NLtd2H9yJrPeYa2p/lOnSx
	 V1I7frwjhVnXKujZHpcj2CNcwSJMKuYWavsZXvmd+3ZKpYusAL6VUlkWt7L/aCXmTz
	 AA4faK+eG8VgQ==
Date: Mon, 25 Sep 2023 13:12:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?iso-8859-1?B?Ik7DY29sYXMgRi4gUi4gQS4gUHJhZG8i?=
 <nfraprado@collabora.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ricardo Ribalda Delgado <ribalda@chromium.org>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 30/54] ASoC: mediatek: convert not to use asoc_xxx()
Message-ID: <ZRF5MUPhRdPdFt+h@finisterre.sirena.org.uk>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
 <87a5tsqngx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/f/lHyJuDnKA3hVf"
Content-Disposition: inline
In-Reply-To: <87a5tsqngx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: BELA LUGOSI is my co-pilot ...
Message-ID-Hash: TKMFFP5VWLQERSNEK7LAOJ6LXK3U3G6B
X-Message-ID-Hash: TKMFFP5VWLQERSNEK7LAOJ6LXK3U3G6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKMFFP5VWLQERSNEK7LAOJ6LXK3U3G6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/f/lHyJuDnKA3hVf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 11, 2023 at 11:50:07PM +0000, Kuninori Morimoto wrote:
> ASoC is now unified asoc_xxx() into snd_soc_xxx().
> This patch convert asoc_xxx() to snd_soc_xxx().

This doesn't apply against current code, please check and resend.

--/f/lHyJuDnKA3hVf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUReTEACgkQJNaLcl1U
h9CLMwf/Tr2SkH1AABKXHqn84zZOiYh+dB6rmwja7qUYAcv5ZNuw87FEO8CwP9vj
Tn01xDb2/4kLXbo0WwOyUSfhwnPg8Dqw7u+k061erzQS9Wwk3/KpGBC/xMGK1v78
zbmqh4TWcqB0nG0A8k1tGXr3f/qzSszd06oQnHj9UaafUFhkJQw/jJNTJS65o3pY
95M45t4QfRIwagMVs7B4fG1wD82INCe3nnzUoP5jlJtvMl521OU0TZv3YsDya07D
N64wiMLphGW67OPR4uXfiTo7Uz3AUyz9oTGUSNEeTifb0Q3Ny1GU3k6FfXB+rJxC
7ziF8785ZPNfSJ4pvGx9hCnkGtKs4Q==
=stgb
-----END PGP SIGNATURE-----

--/f/lHyJuDnKA3hVf--
