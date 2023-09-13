Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE679EC27
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 17:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B262A4C;
	Wed, 13 Sep 2023 17:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B262A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694617721;
	bh=SYzUOpvEWA+yyqFFVtA92rfi3iMtgTA3kqi44w7DWsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BOR1ZH8Tumm8/zDJgQcKsv020OmxIYP7uCV1SWpMRefn5nmco6fwndy0/ntwtmY+C
	 R9OxYtkskNXgShXR7zS8NYNkbCYXlG5zjmqf8qOkTgTpHy65WnLWHx8+KDxsSJdyvz
	 mT1EIHFg8idGxMos5z1q7Pev867cOpVd9I/f9WAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6984F80246; Wed, 13 Sep 2023 17:07:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 629A1F80246;
	Wed, 13 Sep 2023 17:07:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2A82F80425; Wed, 13 Sep 2023 17:07:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 22F52F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 17:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F52F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sK8vGcMP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BDC82CE22D1;
	Wed, 13 Sep 2023 15:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54C1C433C8;
	Wed, 13 Sep 2023 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694617655;
	bh=SYzUOpvEWA+yyqFFVtA92rfi3iMtgTA3kqi44w7DWsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sK8vGcMPpRNYhDpRYfwH/9KknVNkBCBwMjnCJ+uPuDQYPqN/G2Vu75ziBRwFhUaQ4
	 dpDON6WakckbrSsU+lv+faFmsX14Gz3ML2PXVwK+vWOHp4bWsqv2RPkjsg/ohAb4bH
	 glRlXqtvF67qTtbsubSMOq9Y79ZPgcICMMAr4nsAXhrPrrrODwmnzVOjWKt4ySzkYu
	 hCi9Ig06KgXS0ZjOMbA6Dys4acf6rYdK8xhQGOu4wjDiYjUlXVL5Pv8YgqsJgDiqAn
	 6JA1SBbPJ49x+pvBHSw6C08enJ35TR+2KFlwreS2b5HR3EVDJU6i8VG7yRXbGXgewS
	 buDvy7lYjZ8lA==
Date: Wed, 13 Sep 2023 16:07:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Myunguk Kim <mwkim@gaonchips.com>
Cc: alsa-devel@alsa-project.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, fido_max@inbox.ru, joabreu@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org, kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz,
	robh+dt@kernel.org, tiwai@suse.com, u.kleine-koenig@pengutronix.de,
	xingyu.wu@starfivetech.com
Subject: Re: [PATCH] ASoC: dwc: Add Single DMA mode support
Message-ID: <71628b39-fd59-45ee-bad9-3e6bd42cb97d@sirena.org.uk>
References: <ZP8Irf6g+sG6Ax9j@finisterre.sirena.org.uk>
 <20230913040902.1496711-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JskZn6gM/rV4+uuO"
Content-Disposition: inline
In-Reply-To: <20230913040902.1496711-1-mwkim@gaonchips.com>
X-Cookie: Use extra care when cleaning on stairs.
Message-ID-Hash: RD3EDXEJNHTFNXJHKJZDP6UMWTUEUK7R
X-Message-ID-Hash: RD3EDXEJNHTFNXJHKJZDP6UMWTUEUK7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RD3EDXEJNHTFNXJHKJZDP6UMWTUEUK7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JskZn6gM/rV4+uuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 01:09:03PM +0900, Myunguk Kim wrote:

> In this case, it is not used through the DMA API.=20
> The connection relationship is as follows.
>   i2s --- pcm_dmaengine ---  DMA IP (ie. pl330)
> So, control was possible only by directly setting the maxburst property.

pcm_dmaengine is a wrapper binding the DMA API into ASoC...

--JskZn6gM/rV4+uuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUB0C4ACgkQJNaLcl1U
h9CYPwf/eIOjdsbfVUtd+7nrcZMXcCeLgXOgT8xemnVvr78ESGnp7aH/Ke/IloW/
5cFGLOAQJfUeknUFd/X5Cp0UJpqgBwvQYheCaRU8wLr7vV6B7KBkIaOB7ZEfurT3
kupI6QMqDaey8qlwKeO0YC6nMGVlDE+1Fef86159QscpyReQJcGOa/f9zbiS+ohl
WkDgQbWBZCao8OUtgyE1uwJnPy6K2HxrJTpb4OwP1Bx40W3d4Hj1arAPpKUL+lv+
x/iUSv+fA/4JY0Rtem4HKlFIOhVxer9u1WAvBMTMM6wWhTOS5biVXGXb2kjm5/O4
+g414PVgdcpHlHA3iBf2v21S9zGLnQ==
=5GdS
-----END PGP SIGNATURE-----

--JskZn6gM/rV4+uuO--
