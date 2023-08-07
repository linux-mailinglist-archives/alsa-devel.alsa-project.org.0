Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9CE772522
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32B52826;
	Mon,  7 Aug 2023 15:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32B52826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691413870;
	bh=+ylZyoYYRfcm6fV2c5Chg3oeks3UOFVe6ienNx0Fhmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AkhXsW6Dj5AeEjvc4OsnjY6s3ziCj8iSVKfU+XB9KRgFVOuftKoIlkxymAiPR0ZgA
	 dLs/NrebLYwg+GiFJtqtcgo4DMIsaLHrOQtuYYGGdt0M60POc4EFNBh2g0TOeCqpFL
	 UR20Fd6eg/DvV2ISGi/8YySoy1HlAoMbTawT/zwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03472F80534; Mon,  7 Aug 2023 15:10:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2475F8016B;
	Mon,  7 Aug 2023 15:10:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7102AF8016D; Mon,  7 Aug 2023 15:10:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 76076F8016A
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76076F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ptPcngcy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03F3161A5E;
	Mon,  7 Aug 2023 13:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44A0C433C8;
	Mon,  7 Aug 2023 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691413808;
	bh=+ylZyoYYRfcm6fV2c5Chg3oeks3UOFVe6ienNx0Fhmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ptPcngcyFrXPhfW+uAcklMgxyhnPVyuRFGiByyYxP0vv5fqTTBf1C+4ZecNjaXNCU
	 x5dexojsK7ip6GaiKDXtsaoPTYSzIcInPyoG7TA1F5LhXIZeJNLz4vhFA354hQ91bs
	 jlsfMHj4h4bMB1a/aQ3hV8/OzE/8wWOiZVToK/QLyt9vfOvmf665T9kjIbKegLgNdG
	 EZ4JdpqVL7wvyWODD+mDyu8mLQ22wCFOdQmTWgvbGeolnFdDe+TK/BROYHkQNEskI5
	 tUJXXtpYQAPIshCzIIkr5tAXQJJ/v2mXmUc9Kz2LqqQ5og6ku6/LbuVEVnS+gnoIru
	 0Ov9IDZ3B4O+w==
Date: Mon, 7 Aug 2023 14:09:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <8f80edf2-c93d-416f-bcab-f7be3badf64a@sirena.org.uk>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-25-herve.codina@bootlin.com>
 <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jTPmHke3dW8il9IP"
Content-Disposition: inline
In-Reply-To: 
 <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
X-Cookie: idleness, n.:
Message-ID-Hash: G5LDCUKECTETOJXJE7ZWKW7C2JOPHHDD
X-Message-ID-Hash: G5LDCUKECTETOJXJE7ZWKW7C2JOPHHDD
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jTPmHke3dW8il9IP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 03:05:15PM +0200, Linus Walleij wrote:
> On Wed, Jul 26, 2023 at 5:04=E2=80=AFPM Herve Codina <herve.codina@bootli=
n.com> wrote:

> > +#include "linux/bitfield.h"

> Really? I don't think there is such a file there.

> Do you mean <linux/bitfield.h> and does this even compile?

#include "" means "try the local directory first then fall back to
system includes" so it'll work, it picks up extra stuff on top of what
<> does.  There's a stylistic issue though.

--jTPmHke3dW8il9IP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTQ7SUACgkQJNaLcl1U
h9Cgmwf/SLPNpdzBUj796oCGdE0sLv3Wx6OOJqUx6r7OcXxbdmI57ntyLtd42nrN
Bto5bvnu1D1GkKvkmyy+3qu8xEk9s7C2T9S8wddibRU4Ltzcda/eNPj7PwZuLuj1
0z8caed2ZZTmxKQJzHev6bV798Prre1UC1Wu8xTev1OLJpck8z68ITezl6gh97ma
TFmBFQx8ZozN8KVhSTI49Oc5lUUWGJC/CYjNSASRYYC5Wm/bSfAfdDHclNhQLaW9
7VQNOvJvO5CmbCu7s0dq39QvEWgoC2sm0Cx8ZWUpHxjKZVyWbnfMr0sMyPwgLtWb
vb6uLwRLtAlanfRgULyEgNLTnZ+BIw==
=+n7M
-----END PGP SIGNATURE-----

--jTPmHke3dW8il9IP--
