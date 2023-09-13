Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3CF79E0D3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:28:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F004950;
	Wed, 13 Sep 2023 09:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F004950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694590087;
	bh=rqoADzRYg8VlRilJ24w/iUpso4gMivIVpSmkztOQK58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lvT/te+NDVNaCkXaErxQfV8h1pG6SzZYoj4/SDGaHtl9Rfozr5Yy18QQwlwWP09zm
	 fbugyNxNLuB5mZvzSa3MLm6aZnfe/g1nh4LHyvHN4oPZLeLjOpu7FbjYmc/70uAGad
	 Zq8VO1mIUJ5WWVjxcbmYXhzwKC1l6bUC2DuYgtGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7727F80551; Wed, 13 Sep 2023 09:26:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DADBF80246;
	Wed, 13 Sep 2023 09:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88470F80425; Wed, 13 Sep 2023 09:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A800FF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A800FF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=id5wBw+5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26012E000C;
	Wed, 13 Sep 2023 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694590007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+j8CLkeQqfE/jh3KUACTiWhEVCfAwwkGv+CICyZc1E=;
	b=id5wBw+5IoW5nrGIWPBxMOPgujgtR6RcLR+FMdrunmLvgVotlzLE4P7GYyysXkHSpptRua
	AUfDx7XqGPnc1pFdO+2bGGISGvLbBCzyXlMgzpVW7v7AYC53V4Eaa7Giqyjg+JY6+zA/6X
	ae1i0V0aWjGLBf6bo0hPvjiAFVEw+x3XTs3VCD8PXidN9bityZlJLHPojdkWvSYwfW1nil
	jAHS1xzlhg0SXt7dGRnbvV2Qsa4Q1uRXGy564WEw0irLFiw0glEyZRzK5O1GQJ3au0virI
	6//y6UwVKL0i+itAqUc3X0+fgIxkEkCePNW0m4OkaNXvPS+DkPuU9xPTWVApzw==
Date: Wed, 13 Sep 2023 09:26:40 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 08/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230913092640.76934b31@bootlin.com>
In-Reply-To: <20230912-capable-stash-c7a3e33078ac@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
	<20230912101018.225246-1-herve.codina@bootlin.com>
	<20230912-capable-stash-c7a3e33078ac@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: ZN64Z5ILPRN5ZWULMSZCRQNBIJMWIJNW
X-Message-ID-Hash: ZN64Z5ILPRN5ZWULMSZCRQNBIJMWIJNW
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZN64Z5ILPRN5ZWULMSZCRQNBIJMWIJNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Conor,

On Tue, 12 Sep 2023 18:21:58 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller present in some
> > PowerQUICC SoC such as MPC885.
> > The QMC HDLC uses the QMC controller to transfer HDLC data.
> >=20
> > Additionally, a framer can be connected to the QMC HDLC.
> > If present, this framer is the interface between the TDM bus used by the
> > QMC HDLC and the E1/T1 line.
> > The QMC HDLC can use this framer to get information about the E1/T1 line
> > and configure the E1/T1 line.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-=
scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml
> > index 82d9beb48e00..b5073531f3f1 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc=
.yaml
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc=
.yaml
> > @@ -101,6 +101,16 @@ patternProperties:
> >            Channel assigned Rx time-slots within the Rx time-slots rout=
ed by the
> >            TSA to this cell.
> > =20
> > +      compatible:
> > +        const: fsl,qmc-hdlc
> > +
> > +      fsl,framer:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle to the framer node. The framer is in charge of an E1=
/T1 line
> > +          interface connected to the TDM bus. It can be used to get th=
e E1/T1 line
> > +          status such as link up/down. =20
>=20
> Sounds like this fsl,framer property should depend on the compatible
> being present, no?

Well from the implementation point of view, only the QMC HDLC driver uses t=
his
property.

=46rom the hardware description point of view, this property means that the t=
ime slots
handled by this channel are connected to the framer. So I think it makes se=
nse for
any channel no matter the compatible (even if compatible is not present).

Should I change and constraint the fsl,framer property to the compatible pr=
esence ?
If so, is the following correct for this contraint ?
   --- 8< ---
   dependencies:
     - fsl,framer: [ compatible ];
   --- 8< ---

Regards,
Herv=C3=A9

>=20
> Thanks,
> Conor.
>=20
> > +
> >      required:
> >        - reg
> >        - fsl,tx-ts-mask
> > @@ -159,5 +169,8 @@ examples:
> >              fsl,operational-mode =3D "hdlc";
> >              fsl,tx-ts-mask =3D <0x00000000 0x0000ff00>;
> >              fsl,rx-ts-mask =3D <0x00000000 0x0000ff00>;
> > +
> > +            compatible =3D "fsl,qmc-hdlc";
> > +            fsl,framer =3D <&framer>;
> >          };
> >      };
> > --=20
> > 2.41.0
> >  =20
