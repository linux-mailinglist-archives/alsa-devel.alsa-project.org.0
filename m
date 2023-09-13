Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E5779EBE0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 17:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2568084C;
	Wed, 13 Sep 2023 16:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2568084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694617249;
	bh=0AbGKrvHkbfmwX2tPrwgjwFrlaY/UK4+5XEpUO6Hmk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J1NW9LXGru6PN9bB3JwsBunSUEDGLPB4gY+jYrr/tFFTPtYxfDLiVme3tF5VH4QP8
	 jeKB8jitlr3qxBEhUrjTg7ewzY3LcAS+Dwde+zQIrbzQ2peLyjfIaktcNAJ9ZzJ2MR
	 H/4Lg1+Ex/C4CQkeBsY3qR2avezygYmvDfr+Ulj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA4BF80246; Wed, 13 Sep 2023 16:59:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 301A4F80246;
	Wed, 13 Sep 2023 16:59:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B9AF80425; Wed, 13 Sep 2023 16:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45A81F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 16:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A81F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kTHkg6U2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D8CEB8249D;
	Wed, 13 Sep 2023 14:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EDBC433C8;
	Wed, 13 Sep 2023 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694617189;
	bh=0AbGKrvHkbfmwX2tPrwgjwFrlaY/UK4+5XEpUO6Hmk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTHkg6U2OrOp9s11X766GHIMjWESKKOX2vVpe8mIR0Uj+fuatFjupPtR2QKTXjtvr
	 yyq629oLWrJZv+fhaxlXXihlD2CL9SRcmFJxZ8ymQ7v8nI9z6dQ/jBBE+k4T0d3kMe
	 5tQht4mgII3Zt3IH/dXx1sf9mZwYIGqQ4X4/Dln/R5QcTVQP15KQBtU2vb1CRKj3Tm
	 IU+/n1n/1z40lgmI+EInQ2RPMp8hCqzl+luIqDX7rKrHaQGADi9yhBRcOlIxyoZCoG
	 cx1xy8qPJKijtLTyaYqY7uoFqT9m+fIg+j0pngkk0UI2/lR0L9uwBTuK8kFzbFhRsL
	 Ok847V3L9PMGQ==
Date: Wed, 13 Sep 2023 15:59:41 +0100
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
Message-ID: <20230913-unburned-overturn-41b83e1eed25@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101018.225246-1-herve.codina@bootlin.com>
 <20230912-capable-stash-c7a3e33078ac@spud>
 <20230913092640.76934b31@bootlin.com>
 <20230913-unruly-recite-7dbbbd7e63e0@spud>
 <20230913165250.02bab2ad@bootlin.com>
 <20230913-oversold-delay-05368e5de9fe@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k94xrof+2xueRHia"
Content-Disposition: inline
In-Reply-To: <20230913-oversold-delay-05368e5de9fe@spud>
Message-ID-Hash: 7EB5JH7VXAGTPY45Z463WIFCC2325EFA
X-Message-ID-Hash: 7EB5JH7VXAGTPY45Z463WIFCC2325EFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EB5JH7VXAGTPY45Z463WIFCC2325EFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--k94xrof+2xueRHia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 03:56:16PM +0100, Conor Dooley wrote:
> On Wed, Sep 13, 2023 at 04:52:50PM +0200, Herve Codina wrote:
> > On Wed, 13 Sep 2023 15:42:45 +0100
> > Conor Dooley <conor@kernel.org> wrote:
> >=20
> > > On Wed, Sep 13, 2023 at 09:26:40AM +0200, Herve Codina wrote:
> > > > Hi Conor,
> > > >=20
> > > > On Tue, 12 Sep 2023 18:21:58 +0100
> > > > Conor Dooley <conor@kernel.org> wrote:
> > > >  =20
> > > > > On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote: =20
> > > > > > The QMC (QUICC mutichannel controller) is a controller present =
in some
> > > > > > PowerQUICC SoC such as MPC885.
> > > > > > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > > > > >=20
> > > > > > Additionally, a framer can be connected to the QMC HDLC.
> > > > > > If present, this framer is the interface between the TDM bus us=
ed by the
> > > > > > QMC HDLC and the E1/T1 line.
> > > > > > The QMC HDLC can use this framer to get information about the E=
1/T1 line
> > > > > > and configure the E1/T1 line.
> > > > > >=20
> > > > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > > > ---
> > > > > >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++=
++++++++
> > > > > >  1 file changed, 13 insertions(+)
> > > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/f=
sl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl=
,cpm1-scc-qmc.yaml
> > > > > > index 82d9beb48e00..b5073531f3f1 100644
> > > > > > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1=
-scc-qmc.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1=
-scc-qmc.yaml
> > > > > > @@ -101,6 +101,16 @@ patternProperties:
> > > > > >            Channel assigned Rx time-slots within the Rx time-sl=
ots routed by the
> > > > > >            TSA to this cell.
> > > > > > =20
> > > > > > +      compatible:
> > > > > > +        const: fsl,qmc-hdlc
> > > > > > +
> > > > > > +      fsl,framer:
> > > > > > +        $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > +        description:
> > > > > > +          phandle to the framer node. The framer is in charge =
of an E1/T1 line
> > > > > > +          interface connected to the TDM bus. It can be used t=
o get the E1/T1 line
> > > > > > +          status such as link up/down.   =20
> > > > >=20
> > > > > Sounds like this fsl,framer property should depend on the compati=
ble
> > > > > being present, no? =20
> > > >=20
> > > > Well from the implementation point of view, only the QMC HDLC drive=
r uses this
> > > > property.
> > > >=20
> > > > From the hardware description point of view, this property means th=
at the time slots
> > > > handled by this channel are connected to the framer. So I think it =
makes sense for
> > > > any channel no matter the compatible (even if compatible is not pre=
sent).
> > > >=20
> > > > Should I change and constraint the fsl,framer property to the compa=
tible presence ?
> > > > If so, is the following correct for this contraint ?
> > > >    --- 8< ---
> > > >    dependencies:
> > > >      - fsl,framer: [ compatible ];
> > > >    --- 8< --- =20
> > >=20
> > > The regular sort of
> > > if:
> > > 	compatible:
> > > 		contains:
> > > 			const: foo
> > > then:
> > > 	required:
> > > 		- fsl,framer
> > > would fit the bill, no?
> >=20
> > Not sure.
> > "fsl,framer" is an optional property (depending on the hardware we can =
have
> > a framer or not).
>=20
> Ah apologies, I had it backwards! Your suggestion seems fair in that
> case.

Or actually,
if:
	compatible:
		not:
	 		contains:
	 			const: foo
 then:
 	properties:
 		fsl,framer: false
? That should do the trick in a more conventional way.

--k94xrof+2xueRHia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHOXQAKCRB4tDGHoIJi
0poQAQDqNLWYV0v7EFgrkPDKkkHvvsg4hXdY0+WRr/xipZ7pfQEAux/D0zjPvPjQ
t36Kzm5ducMZfS17zQJL3mrN2qrf3gA=
=C+xz
-----END PGP SIGNATURE-----

--k94xrof+2xueRHia--
