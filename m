Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF77AD331
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 10:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A047A4D;
	Mon, 25 Sep 2023 10:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A047A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695630055;
	bh=HDA9vITmxQ0756CXyfCZHVqKtQrKR4cRRV5YHLwbOZ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Er5nl/Bk1mhKymD8tU3MsNz43sExUfUo9t3FytOusFmHt9/xaRAetPfGn1jL9E7YD
	 10x7Xf1MgmVN1ry2oTguMrmxsqRxLtzuRkb7/VIOBNTl67EdwxGo/qDmwfFMvVo8bT
	 plWp5KFyuAHHgrw6u8k76h+fK1fIZgxeD3MQiEdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B22DF8047D; Mon, 25 Sep 2023 10:19:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA23F80166;
	Mon, 25 Sep 2023 10:19:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 337AAF8016A; Mon, 25 Sep 2023 10:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95443F800AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 10:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95443F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PvDIUho9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3464240005;
	Mon, 25 Sep 2023 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695629829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsV/ySsvuL4jl/ST/3xwKb6vrdgxhf9GcZb1mGcioag=;
	b=PvDIUho9NL9hEHa76AEtge+NrT0NJ8zlv3WYK5SX/puoarl+p4pDsPlODduEobYhbJGETW
	9M6Vu9n4UXYwieLWHdxK2Far77OTkn9/ZCmhkN7eMnvsJrB2BpNJ9ax1L5TQj0/qqKQuj3
	WVKKrUELOOrdbzUkvLS4T3W1LH3xNezBu6gMOnu6pxJNT+TfvTwYIpSbqig0d1yTMzpzVW
	Tll81bV8zxi9FbcWQXikKgPf1zuLWnihDhyGlYXo7hSOdFlc1JNoBI21ya7JIzQs/DhU/m
	La2QDXCNSznO5+LNPcscmvJfULG1M3AACyvA3Z066zgdx3Re0fBxgv+2ItpCtg==
Date: Mon, 25 Sep 2023 10:17:03 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230925101703.1bf083f1@bootlin.com>
In-Reply-To: <5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-9-herve.codina@bootlin.com>
	<5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: B2AV3UEBHDST32OWMYAASKWXCYSSISPQ
X-Message-ID-Hash: B2AV3UEBHDST32OWMYAASKWXCYSSISPQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2AV3UEBHDST32OWMYAASKWXCYSSISPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Sat, 23 Sep 2023 19:39:49 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 22/09/2023 09:58, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller present in some
> > PowerQUICC SoC such as MPC885.
> > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > 
> > Additionally, a framer can be connected to the QMC HDLC.
> > If present, this framer is the interface between the TDM bus used by the
> > QMC HDLC and the E1/T1 line.
> > The QMC HDLC can use this framer to get information about the E1/T1 line
> > and configure the E1/T1 line.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> > index 82d9beb48e00..61dfd5ef7407 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> > @@ -101,6 +101,27 @@ patternProperties:
> >            Channel assigned Rx time-slots within the Rx time-slots routed by the
> >            TSA to this cell.
> >  
> > +      compatible:
> > +        const: fsl,qmc-hdlc  
> 
> Why this is not a device/SoC specific compatible?

This compatible is present in a QMC channel.
The parent node (the QMC itself) contains a compatible with device/SoC:
--- 8< ---
  compatible:
    items:
      - enum:
          - fsl,mpc885-scc-qmc
          - fsl,mpc866-scc-qmc
      - const: fsl,cpm1-scc-qmc
--- 8< ---

At the child level (ie QMC channel), I am not sure that adding device/SoC
makes sense. This compatible indicates that the QMC channel is handled by
the QMC HDLC driver.
At this level, whatever the device/SoC, we have to be QMC compliant.

With these details, do you still think I need to change the child (channel)
compatible ?

> 
> > +
> > +      fsl,framer:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle to the framer node. The framer is in charge of an E1/T1 line
> > +          interface connected to the TDM bus. It can be used to get the E1/T1 line
> > +          status such as link up/down.
> > +
> > +    allOf:
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              not:
> > +                contains:
> > +                  const: fsl,qmc-hdlc
> > +        then:
> > +          properties:
> > +            fsl,framer: false
> > +
> >      required:
> >        - reg
> >        - fsl,tx-ts-mask
> > @@ -159,5 +180,8 @@ examples:
> >              fsl,operational-mode = "hdlc";
> >              fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
> >              fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
> > +
> > +            compatible = "fsl,qmc-hdlc";  
> 
> compatible is always the first property.

Will be moved to the first property in the next iteration.

Best regards,
Hervé

> 
> > +            fsl,framer = <&framer>;
> >          };
> >      };  
> 
> Best regards,
> Krzysztof
> 
