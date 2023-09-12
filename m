Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE6179D67D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651FEDF8;
	Tue, 12 Sep 2023 18:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651FEDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536711;
	bh=OJuoXIE82hjK2NBMYhWXwpJGkmlI7rC+5Tx9u3yV2tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oG2Zx8ukMjJxw5CAc30al4+812yTUJQrGhpUT9cpDlJ5cWY4Q6E8/DyZIiK+j4qGo
	 nFlhdrpurTF/NfwN0l6Au5TmD6f1Y7YFQZ9aJqxW+8eG8x135T0hkA0KtLC1sCTH1h
	 53UeXO3nDf7P5/EeRIOFwDd06fN4aDfuI/liKF48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C16CF8055A; Tue, 12 Sep 2023 18:37:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BA8F80558;
	Tue, 12 Sep 2023 18:37:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0EACF8055A; Tue, 12 Sep 2023 18:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0754F80425
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0754F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ps2S5DYS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D2844CE1DCE;
	Tue, 12 Sep 2023 16:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ED1C433C7;
	Tue, 12 Sep 2023 16:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694536632;
	bh=OJuoXIE82hjK2NBMYhWXwpJGkmlI7rC+5Tx9u3yV2tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ps2S5DYSbulUYf7oy7lT6QUeIC8SEE8uDrovxyzlP1aFanperwJfPxgxOSDoMicdj
	 QPhK/QjxkpPvjv2poRuKEjUgTqjp60TdQnRQmmahJid4JusPVASg0K1uVbLr45UAB9
	 O+q5IVvxkSBtPB4uIoSzebjqIZKeWLsg1NRa9ESumUogVOWqga9FHZ4uTwbMwFliV4
	 inf0fEeH4WTZISjvzOruneKr+bXI0QcpZaEpr0gdpaoAWUmP+DefmPc84zsLhd9NP2
	 YObhh1gBw/Dws7ynhREpR3QXWW0o3PhgfgfBYRLDlXE9yJVBmWttawahid5gfYz9Cd
	 Kjln+OFCXKa7w==
Date: Tue, 12 Sep 2023 17:37:03 +0100
From: Conor Dooley <conor@kernel.org>
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
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
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
Subject: Re: [PATCH v5 07/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add 'additionalProperties: false' in child nodes
Message-ID: <20230912-pancreas-hacked-ddcaa726fa8e@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H5/71ZKZWMUncSI5"
Content-Disposition: inline
In-Reply-To: <20230912081527.208499-8-herve.codina@bootlin.com>
Message-ID-Hash: TFDKVSP5LTEO6AVQPP2OW5HEZJAW265E
X-Message-ID-Hash: TFDKVSP5LTEO6AVQPP2OW5HEZJAW265E
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFDKVSP5LTEO6AVQPP2OW5HEZJAW265E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--H5/71ZKZWMUncSI5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 10:14:58AM +0200, Herve Codina wrote:
> Additional properties in child node should not be allowed.
>=20
> Prevent them adding 'additionalProperties: false'
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml     | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-=
qmc.yaml
> index 450a0354cb1d..82d9beb48e00 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> @@ -64,6 +64,7 @@ patternProperties:
>      description:
>        A channel managed by this controller
>      type: object
> +    additionalProperties: false
> =20
>      properties:
>        reg:
> --=20
> 2.41.0
>=20

--H5/71ZKZWMUncSI5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCTrwAKCRB4tDGHoIJi
0n+XAQCw6AgUOq0NyPZHrHWu5ogYxBjVGRRZ4L314GuJF/TwRAEA3G14ilDkYP5o
3fMneddHCQlNQIVPUgNd/ldquYguZwQ=
=eFLQ
-----END PGP SIGNATURE-----

--H5/71ZKZWMUncSI5--
