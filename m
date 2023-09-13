Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A494579EFB7
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD597A4C;
	Wed, 13 Sep 2023 19:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD597A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694624494;
	bh=BnteqCpF/CAUK7DK9U9Ghtfp5dt4d9MfOz2/eAS/u7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KyN02ZF7AivSMIV/+rTga9IX7PzZAIY7F9QCfjBIb5kl8HhVCcU3PrhJumqCqJKms
	 RLR6gJWeh48gJr6wLSgoq7ThqKLthoHnF2dZaQyKicI8jE1rx8Onxf1+baL0sc0pZl
	 oCEyhVl2JRaLge7+olm8qhJA7YWpocaXI6YzSciE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C45C1F80558; Wed, 13 Sep 2023 19:00:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E353F80246;
	Wed, 13 Sep 2023 19:00:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E846F80425; Wed, 13 Sep 2023 19:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44230F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44230F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cPc5I0ZL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4E8D0CE23CB;
	Wed, 13 Sep 2023 16:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ACFC433C8;
	Wed, 13 Sep 2023 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694624397;
	bh=BnteqCpF/CAUK7DK9U9Ghtfp5dt4d9MfOz2/eAS/u7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPc5I0ZLysgdFaSm9d3iPjGsHib6No1WDfTfDNmZ8EJftw2ukgPJqbdTvFwfII6h5
	 XsjFCfQwy0hAhvcNI/zC1jAxOZx+xj3WkJy3PnXdFgBaTdKUmzEXfr8r119FUpA9ws
	 uEyzFAjE2f/LP5rj9F/N4Be4pbP/BK9uPoheaZ2R88lgsiTu9NUbtgyaz2XOX1oPZT
	 eklyhY3ZUUL2hQtxVd/re7fFxkttitCrig5ohr9Pm1WOgM5lChR8UOojrbVvjicS9G
	 gipMxf05N4nYGfN5v5g6bWOTb7T8iOMYlMWHXGVTPRzp+C5LHyalJK3Qgj/yIop80d
	 GuvQxVLkJ3wdg==
Date: Wed, 13 Sep 2023 17:59:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 24/31] net: wan: Add framer framework support
Message-ID: <e3245053-1d4c-4ee3-9e03-8a6ca54e26d1@sirena.org.uk>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101436.225781-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3d4xnD0OBUXwj5Mp"
Content-Disposition: inline
In-Reply-To: <20230912101436.225781-1-herve.codina@bootlin.com>
X-Cookie: Use extra care when cleaning on stairs.
Message-ID-Hash: NWHAHA5KCHUBW7ZGZFBQZC2EQCTK77TC
X-Message-ID-Hash: NWHAHA5KCHUBW7ZGZFBQZC2EQCTK77TC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWHAHA5KCHUBW7ZGZFBQZC2EQCTK77TC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3d4xnD0OBUXwj5Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 12:14:36PM +0200, Herve Codina wrote:
> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.
>=20
> The framer framework provides a set of APIs for the framer drivers
> (framer provider) to create/destroy a framer and APIs for the framer
> users (framer consumer) to obtain a reference to the framer, and
> use the framer.

If people are fine with this could we perhaps get it applied on a branch
with a tag?  That way we could cut down the size of the series a little
and I could apply the generic ASoC bit too, neither of the two patches
have any dependency on the actual hardware.

--3d4xnD0OBUXwj5Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUB6oMACgkQJNaLcl1U
h9C6Xgf/eVzH2ZK88zsRlmvtdc+p6XZjgKPJFkUlIhE9Ma70SkaA+GvjpzFrSISC
0oFzEllaNXg3QA5Dql2eFFYQgtr5ubist5gEg7ySisIk/3GFEx1+bOqfE8Hd0wxS
EOmSRrnORoEywUsp1tI/CIh6s+FkPAwH0ZLtXwvWiKeWjQc8q9wKDnqqahC84N6Q
NESewhcaX2cQNfQXdyKGrnV9RVVSaVml3mQ4OvcjG21+FFq8IFvmn1HuLyhzj7ka
ACjNRWS9xgBsIqVyOOaYB2Ji62cf+WK4/DJig11BI34n9N7Tnbi80+kb0JX/WVno
ncpqIK4/jpD4JNn+BxeAIiICNG0cQw==
=nBcU
-----END PGP SIGNATURE-----

--3d4xnD0OBUXwj5Mp--
