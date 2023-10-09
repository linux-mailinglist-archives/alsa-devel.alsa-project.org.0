Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969037BE6A4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A656CEBD;
	Mon,  9 Oct 2023 18:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A656CEBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696869477;
	bh=jUtlqwEMn2KZFHhL84vsbzy62E/jQ9IHVeiIR+dgdME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=saxVCoHu6qQJ/r+nz5YKkjzNOAlZzPLdZs5/HQ3AidcmcQhSf/LAZN7fZWcS8kjnV
	 x7ksPpOC73mExVmB8f5FoZI4lxhXveoEc4zr+iOGq895HNHbXLixd6s9YBI2LYlYEp
	 qgnF/E4grmTKzTDgN2Md0EdQfIHcxK4O4laKjRWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D8EDF80553; Mon,  9 Oct 2023 18:36:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3969F8027B;
	Mon,  9 Oct 2023 18:36:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 319B9F802BE; Mon,  9 Oct 2023 18:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34D38F8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 18:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D38F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ukqTw6yA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46E81CE181B;
	Mon,  9 Oct 2023 16:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2AFC433CC;
	Mon,  9 Oct 2023 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696869401;
	bh=jUtlqwEMn2KZFHhL84vsbzy62E/jQ9IHVeiIR+dgdME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukqTw6yAx9xZXzZu/8PsJbg/qq6AWNoyLzpX1TYC5EftTWC6ToteJaTiXhf6PzU0A
	 5wBCFj8oWtwhs9tVStKAZr5mZup5lvq9UU+J5l/qQsK2Dji9GMKDD1iDfHUP/Uwi98
	 vFd2kqCFIDYnbZrH0Xd3OicQR0UKp48FW3OnDlWpAwCujwIZXWRyiB5Wj8rtpAjlwc
	 4hDYebItl9tJtJ2PVIOfJ+bsFq6JmBAJrt0ungX/IrpO3fOlCe0nufcGBkNDiupZ2H
	 W67NEICrBvwMrkpjALwW0wf1QrN3tLRLHAFMz3Wh2TYHwUG4R4ngZBlYHgFjostCPW
	 wEQrpOfY+Ln0w==
Date: Mon, 9 Oct 2023 17:36:34 +0100
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
Subject: Re: [EXT] Re: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List
 DAPM endpoints ignoring system suspend
Message-ID: <50ad5eed-325c-457b-976e-4ffcf7696938@sirena.org.uk>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
 <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
 <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <ZRP2A1hvuB8ZymBK@finisterre.sirena.org.uk>
 <DB9PR04MB9498352BC1763048B8358D97E3C8A@DB9PR04MB9498.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YpmdxlIGHB5pmEP7"
Content-Disposition: inline
In-Reply-To: 
 <DB9PR04MB9498352BC1763048B8358D97E3C8A@DB9PR04MB9498.eurprd04.prod.outlook.com>
X-Cookie: What is the sound of one hand clapping?
Message-ID-Hash: OLARWL6K2RAR3BBO3SDEDSCNQ22SHRXP
X-Message-ID-Hash: OLARWL6K2RAR3BBO3SDEDSCNQ22SHRXP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLARWL6K2RAR3BBO3SDEDSCNQ22SHRXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YpmdxlIGHB5pmEP7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 11:13:49AM +0000, Chancel Liu wrote:

> Instead of "fsl,lpa-widgets", I would like to add a common property=20
> "ignore-suspend-widgets" in sound-card-common.yaml file. So not only rpmsg
> sound cards but also other sound cards which have such feature can use th=
is
> property to define wanted widgets ignoring suspend.
> What do you think about that?

We can perhaps bikeshed the name a bit to be more focused on the use
case but yes, that sounds reasonable.

--YpmdxlIGHB5pmEP7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUkLBEACgkQJNaLcl1U
h9BE7gf/e2k4KxlF2CXa8VUkiAAnGisQr0YxQGZ4hg6Qf2VNcqgvRgb12u3r5CqZ
MlMItmfRzSiUOhCXYtyl9Iq58MtkaxNK4iWbNCVrZ0+fvUvEI8B9C2izjeYR2Lwj
8RirJfNnircg4thI9oRxPgQEEIoK/SI5iAlI9RliJrADXD/EETYQ/iaJ778Rh1AN
RTNseFJXS+BHwZ7rP09Va1GsROiMb2P9xtRVxAw02wiE5dUge0h43O+3fRyY1yLo
9BmxluF+wyXuHiuaBR4hCvAyM8lvp5JWsRdgT+2z0MAWTXVwP6R2bTfs3Xnm4ej9
UnKuK53QIGytXgaFriLzbO2ZU4gIsw==
=r9Lx
-----END PGP SIGNATURE-----

--YpmdxlIGHB5pmEP7--
