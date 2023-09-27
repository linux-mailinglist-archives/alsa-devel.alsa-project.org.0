Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D47B0021
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 11:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B7433E;
	Wed, 27 Sep 2023 11:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B7433E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695807057;
	bh=PoynAhC42Ct+N5LxHx/oBa8Zl3onSqNPhKu1yqqfuCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oOjRtADzvHLQp0J0I6DjfcH+bguRSir7c7whZdQhrvXcIwiitaT7qcm5j/PNPrVWq
	 5IkoWu3wVUDEw9pdTxvHEAxJBJb6Uqfw80coNN1h1Hw7J9fGC84iBwKNLM1YNztG57
	 EqpKngCKWfSR6pTBHme2SX3eUi07eoKpTGaRz4og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 066AFF80130; Wed, 27 Sep 2023 11:30:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FA3FF80166;
	Wed, 27 Sep 2023 11:30:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4D52F8016A; Wed, 27 Sep 2023 11:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F7E0F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 11:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7E0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I46iMBzn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19E576163D;
	Wed, 27 Sep 2023 09:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BF5C433C7;
	Wed, 27 Sep 2023 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695806981;
	bh=PoynAhC42Ct+N5LxHx/oBa8Zl3onSqNPhKu1yqqfuCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I46iMBznA20yjD8uhY5Qh9Ki6oMk1pBVm3P7nWXi/Mt6g5XG/sSBgeI+alGlhDjyv
	 Rp+wcfJ+1yNmiLkI99DrGrHYZ57KbA+kccDiooBhQPHxymj/oL5MCv0lxJAVPnAn0c
	 y9Ds7V8pNS/a4vQqy/nJD5Jo19U6zjcNoNokZKHlMZLpNbPHtCZeCDEbJDpQ5STvGa
	 tV0DK2K8ZhNPWhyjn2iIrCcc5mUAHbMHsupiyOzBrUjFuJEznhfEXWM8puzd8oxvMX
	 Kk2fxTFBxUct64Pg2DCGj4ceXwRsSe0W1gsCVHN/P3jRUPsls15U3mfVG7+Dn1TxKa
	 A+sG9yBWlHU5Q==
Date: Wed, 27 Sep 2023 11:29:39 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
	"Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM
 endpoints ignoring system suspend
Message-ID: <ZRP2A1hvuB8ZymBK@finisterre.sirena.org.uk>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
 <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
 <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M0KDERL2YfXElnfx"
Content-Disposition: inline
In-Reply-To: 
 <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: SEPBN4NPCOZWBBFOGMHLHW6Q7HJUBN47
X-Message-ID-Hash: SEPBN4NPCOZWBBFOGMHLHW6Q7HJUBN47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEPBN4NPCOZWBBFOGMHLHW6Q7HJUBN47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--M0KDERL2YfXElnfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 27, 2023 at 03:07:49AM +0000, Chancel Liu wrote:

> > This is a fairly standard DSP playback case as far as I can see so it
> > should work with DAPM without needing this obviously use case specific
> > stuff peering into the Linux implementation.  Generally this is done by
> > tagging endpoint widgets and DAIs as ignore_suspend, DAPM will then
> > figure out the rest of the widgets in the path.

> Yes, indeed I meant to let driver get DAPM endpoints from the "fsl,lpa-widgets"
> property and then set these endpoints as ignore_suspend if the sound card is
> running in this use case. Do you think the description for the use case can be
> simplified since it's a common use case?

This is a card problem - the driver for rpmsg shouldn't need to worry
about it.  Any bindings extensions should be at the card level rather
than in a specific driver, we could probably use something in the
generic properties that they're all using.

--M0KDERL2YfXElnfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUT9gIACgkQJNaLcl1U
h9Co/gf/YdAlws18Znc1Leg2ZPsdDGFeaWbgTuNgdJBfXu7DkM5EBpJwJitNdYBH
ee4d/A5s4cPYEwNBF6APc8Kuoo6ZLSzUUVTIoEVo3hx90x3VMkYHMG4ZrmbGHM1j
Q2Nb8wflfskYqPjLus1P4DcBWKulBIM1xfQGN3G4XZefa653qnNWGAoJLrIJr0BT
z5wh8S+9QtDJosvub7my40MWeV9d4i3yNywRESPCV7oFQd6c0WwDPrW6XxUClSEt
sKPmpp8TyP7AfzZoFiHYh3/97Qhm04LSjlNAybae7/XqRS6zFJGYi1rCSaT5Oaol
AklEsC5VrCYgCthrJITSvQd79yOuyg==
=w/+0
-----END PGP SIGNATURE-----

--M0KDERL2YfXElnfx--
