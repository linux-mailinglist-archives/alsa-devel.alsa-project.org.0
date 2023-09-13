Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE079EB60
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 16:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3959E950;
	Wed, 13 Sep 2023 16:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3959E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694616246;
	bh=ghmd2vE6l3/YQAYcdHB/Auew4n3efVE8LafRtaXbVHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xu/jA/l7hWeasfVU9/YA+z7iBQ1sELJRvLWUO5sH90RmoEQrbLIEk01AVFI0vHzEY
	 YjDHC6HzHbvfA2CJltY8xb17OFJupKtkRzqwHna8ofbJw33qfzKnD/NeyBDX/Fbrs0
	 p8piAvOanM4iVI0gs1lCBln9jAZERejeP6uepMYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1F41F8047D; Wed, 13 Sep 2023 16:43:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA3CF80246;
	Wed, 13 Sep 2023 16:43:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECEE4F80425; Wed, 13 Sep 2023 16:43:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE70DF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 16:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE70DF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YGMCHCaS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 40757CE22B4;
	Wed, 13 Sep 2023 14:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904A6C433C8;
	Wed, 13 Sep 2023 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694616173;
	bh=ghmd2vE6l3/YQAYcdHB/Auew4n3efVE8LafRtaXbVHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGMCHCaS7LV+IgxR8JwzA2LNP/JAobSO7VFWJqFuLotcrNli1S/nHKVzF//aJ2S6V
	 oyTmUUNwYQcB2nInr2C8Ez39iVMQmhLWasrm56DXWToBj15FazV/Kl6X9Oqd98l7vq
	 xYCSySPKPtfqvA4b/JjwavRqFP6IGhDc7F3DFnWpvbrbrOP/iHL2RUh7HiB9Nfi1ae
	 OAv6grpPZpsAP5EFZJg6+L0GXuBVZ6JskfXUivQah7NoYp1WtIsK8dxArv+axEEnrs
	 p+KoYbQrGGzwtNfTaPkj8pd6Rp9GlH1mROzy40I5zjPv5zmvE+yp4nzsVVzTdwFELZ
	 0zorZ83mPn+fA==
Date: Wed, 13 Sep 2023 15:42:45 +0100
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
Message-ID: <20230913-unruly-recite-7dbbbd7e63e0@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101018.225246-1-herve.codina@bootlin.com>
 <20230912-capable-stash-c7a3e33078ac@spud>
 <20230913092640.76934b31@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D/KR2KGuouPtsCp2"
Content-Disposition: inline
In-Reply-To: <20230913092640.76934b31@bootlin.com>
Message-ID-Hash: NKBCJ63QUZCR5KJMN4WYYTZAIRDLMKE3
X-Message-ID-Hash: NKBCJ63QUZCR5KJMN4WYYTZAIRDLMKE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKBCJ63QUZCR5KJMN4WYYTZAIRDLMKE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--D/KR2KGuouPtsCp2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 09:26:40AM +0200, Herve Codina wrote:
> Hi Conor,
>=20
> On Tue, 12 Sep 2023 18:21:58 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote:
> > > The QMC (QUICC mutichannel controller) is a controller present in some
> > > PowerQUICC SoC such as MPC885.
> > > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > >=20
> > > Additionally, a framer can be connected to the QMC HDLC.
> > > If present, this framer is the interface between the TDM bus used by =
the
> > > QMC HDLC and the E1/T1 line.
> > > The QMC HDLC can use this framer to get information about the E1/T1 l=
ine
> > > and configure the E1/T1 line.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm=
1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-=
scc-qmc.yaml
> > > index 82d9beb48e00..b5073531f3f1 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-q=
mc.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-q=
mc.yaml
> > > @@ -101,6 +101,16 @@ patternProperties:
> > >            Channel assigned Rx time-slots within the Rx time-slots ro=
uted by the
> > >            TSA to this cell.
> > > =20
> > > +      compatible:
> > > +        const: fsl,qmc-hdlc
> > > +
> > > +      fsl,framer:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle
> > > +        description:
> > > +          phandle to the framer node. The framer is in charge of an =
E1/T1 line
> > > +          interface connected to the TDM bus. It can be used to get =
the E1/T1 line
> > > +          status such as link up/down. =20
> >=20
> > Sounds like this fsl,framer property should depend on the compatible
> > being present, no?
>=20
> Well from the implementation point of view, only the QMC HDLC driver uses=
 this
> property.
>=20
> From the hardware description point of view, this property means that the=
 time slots
> handled by this channel are connected to the framer. So I think it makes =
sense for
> any channel no matter the compatible (even if compatible is not present).
>=20
> Should I change and constraint the fsl,framer property to the compatible =
presence ?
> If so, is the following correct for this contraint ?
>    --- 8< ---
>    dependencies:
>      - fsl,framer: [ compatible ];
>    --- 8< ---

The regular sort of
if:
	compatible:
		contains:
			const: foo
then:
	required:
		- fsl,framer
would fit the bill, no?

--D/KR2KGuouPtsCp2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHKZQAKCRB4tDGHoIJi
0jE/AP0awmyeu05CVKleLo13y3Fjt4HP0do7dEhQGNt4rxVmsAEAtTdqxGH2EmC6
3WhT1AVUi21kX6VzpxFlrQiNmHgB/A4=
=zHjw
-----END PGP SIGNATURE-----

--D/KR2KGuouPtsCp2--
