Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55979D777
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 19:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA64950;
	Tue, 12 Sep 2023 19:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA64950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694539391;
	bh=rRrJDnsPwd8jMYw4Teztqav9PlNugqhsqBqwAuwaVlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qRFbDMFhQoBunq2E5EgvYAyYb83vN3QVseGmFs4MufA/9xQ6wxskaCIOzCZkK21X1
	 L3X+w+rDE5jp0zdUVWpWYsZ6PZWd6qL9+w7ScBahW6ZAXG+w9CHrb8OE7Hu6NVl2KS
	 7fN6aa/KHWIRMmNFTK+8Q6rag+ANmreZGjrPp46M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD6B0F80551; Tue, 12 Sep 2023 19:22:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 683E0F8007C;
	Tue, 12 Sep 2023 19:22:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F7CF80425; Tue, 12 Sep 2023 19:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31130F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 19:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31130F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Iii5UWu1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3109AB81BBB;
	Tue, 12 Sep 2023 17:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5492C433C8;
	Tue, 12 Sep 2023 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694539326;
	bh=rRrJDnsPwd8jMYw4Teztqav9PlNugqhsqBqwAuwaVlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iii5UWu1mdHxD2eSbuXqs6kx4AHgW0/LoRft/f7lyOXJm52Rgi8Ss5jvrOQ7BrJTL
	 HGjHS80pVjavTF4tfpykYr5T/7fkgKiE9YpmlWEPyBR3aNc+/hYiE191mnmhexl3o1
	 CRosDNzzFYjKhuhcjmbbUjN7j01k4T3tOUv4i5jUygNoHPfOGH8XZQUtk5OaNdJ9eW
	 pYLBfVy1Flo6/FS3VYYYvSj35AGFS9ADHfByzFRZStVVmWm0ObNv49tZznX+1faQlU
	 TpLaRb6QGs2E99A0+EPgis0PHVuXqBCvx2SRZ1SqYeDb/y2Uldr0StaNvnp99RkhVo
	 nBx3TcaF+l1Gw==
Date: Tue, 12 Sep 2023 18:21:58 +0100
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
Subject: Re: [PATCH v5 08/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230912-capable-stash-c7a3e33078ac@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101018.225246-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bf5FPf5K5KaccQV9"
Content-Disposition: inline
In-Reply-To: <20230912101018.225246-1-herve.codina@bootlin.com>
Message-ID-Hash: PJUW4I6RMBAAWPDXKHWCVNNVDLJX6NCR
X-Message-ID-Hash: PJUW4I6RMBAAWPDXKHWCVNNVDLJX6NCR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJUW4I6RMBAAWPDXKHWCVNNVDLJX6NCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bf5FPf5K5KaccQV9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller present in some
> PowerQUICC SoC such as MPC885.
> The QMC HDLC uses the QMC controller to transfer HDLC data.
>=20
> Additionally, a framer can be connected to the QMC HDLC.
> If present, this framer is the interface between the TDM bus used by the
> QMC HDLC and the E1/T1 line.
> The QMC HDLC can use this framer to get information about the E1/T1 line
> and configure the E1/T1 line.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-=
qmc.yaml
> index 82d9beb48e00..b5073531f3f1 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.y=
aml
> @@ -101,6 +101,16 @@ patternProperties:
>            Channel assigned Rx time-slots within the Rx time-slots routed=
 by the
>            TSA to this cell.
> =20
> +      compatible:
> +        const: fsl,qmc-hdlc
> +
> +      fsl,framer:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle to the framer node. The framer is in charge of an E1/T=
1 line
> +          interface connected to the TDM bus. It can be used to get the =
E1/T1 line
> +          status such as link up/down.

Sounds like this fsl,framer property should depend on the compatible
being present, no?

Thanks,
Conor.

> +
>      required:
>        - reg
>        - fsl,tx-ts-mask
> @@ -159,5 +169,8 @@ examples:
>              fsl,operational-mode =3D "hdlc";
>              fsl,tx-ts-mask =3D <0x00000000 0x0000ff00>;
>              fsl,rx-ts-mask =3D <0x00000000 0x0000ff00>;
> +
> +            compatible =3D "fsl,qmc-hdlc";
> +            fsl,framer =3D <&framer>;
>          };
>      };
> --=20
> 2.41.0
>=20

--bf5FPf5K5KaccQV9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCeNgAKCRB4tDGHoIJi
0iOYAQDpq19XBQVxAut3ryCZTWFRliPi5kerZHMkKGzgUwIbKwEA+gnc9IR2Iao6
Qt/bYjPuz9mjrBe0gcXcC3CDZicWwAE=
=QoY/
-----END PGP SIGNATURE-----

--bf5FPf5K5KaccQV9--
