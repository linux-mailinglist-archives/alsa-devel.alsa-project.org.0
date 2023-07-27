Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB95764ED1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 11:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A846782A;
	Thu, 27 Jul 2023 11:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A846782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690449061;
	bh=Sf7ctzNPmPgaHG6BXFwB5nf5lOA5SeeehVlVVCSPIaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H18T5TFmOQkqkTuYTpdSlyaX2FV39O78tnz23Mfai2SfMBAEY7EE2vRnaTC6YafbZ
	 R9tanDIOl17jL+MCBRU9VUgzE3mT8jOxXysQBBVuZbZvYZnh9DJvR6JbCpeWtZGFqV
	 XA+Vt6ZPONfXS2JsaJ8frlMZ7hV+ZMIx8j77YFIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14621F80520; Thu, 27 Jul 2023 11:10:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDEC8F80163;
	Thu, 27 Jul 2023 11:10:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C029F8019B; Thu, 27 Jul 2023 11:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 345EBF80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 345EBF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zwk9FRWm
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5973D20002;
	Thu, 27 Jul 2023 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690448995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rK0kgw5LzcKtfaISYOOP5YAwk737ZNSt9k6WE/IR5iU=;
	b=Zwk9FRWmX7HtxhycqPP+GSgdJ/lE0Jsf02fG5eRjCnrnNZdzdBeO3YgnQihx1VtKrAmoHu
	R+0fUpDKNNSvxBL0sOdsfTkUTdxLJcK2e+JZfYc0cSUDB5fpsHtZqGaxUsNmy6IFaMmuiz
	dzpVaJAU0Qm7BptVX7fr77ZTMdjJ+WBVFl1VyLwsAx0VzlYMw72vhsGb6BbtbtId7re+rG
	wdUrJrAqrkpatIxufuuSXEgZH0QIUrPoKcVDJ/w/T9BgSHStT8mQmL1ENohCMeFat8FBGp
	lN6gQStuXkUsJpILuQdCU3oeVTw6XMMCMt/6OO6NPj+uuYPoHKtcIf2ONnIQIg==
Date: Thu, 27 Jul 2023 11:09:48 +0200
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
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 05/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230727110948.7926a532@bootlin.com>
In-Reply-To: <20230727-talcum-backside-5bdbe2171fb6@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-6-herve.codina@bootlin.com>
	<20230727-talcum-backside-5bdbe2171fb6@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 2DHPJ2WYO7SPVMNMVFQRL2QY7DB2RNTG
X-Message-ID-Hash: 2DHPJ2WYO7SPVMNMVFQRL2QY7DB2RNTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DHPJ2WYO7SPVMNMVFQRL2QY7DB2RNTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Conor,

On Thu, 27 Jul 2023 09:19:59 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Wed, Jul 26, 2023 at 05:02:01PM +0200, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller present in some
> > PowerQUICC SoC such as MPC885.
> > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../devicetree/bindings/net/fsl,qmc-hdlc.yaml | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > new file mode 100644
> > index 000000000000..8bb6f34602d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/fsl,qmc-hdlc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: QMC HDLC  
> 
> "QMC HDLC" seems excessively terse.

The name was based on the fsl,qmc-audio.yaml already present upstream.
  https://elixir.bootlin.com/linux/v6.4/source/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml

If needed, I can change to:
  title: QMC (QUICC Multichannel Controller) HDLC
Let me known if it is better to you.

> 
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  The QMC HDLC uses a QMC (QUICC Multichannel Controller) channel to transfer
> > +  HDLC data.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,qmc-hdlc
> > +
> > +  fsl,qmc-chan:  
> 
> Perhaps I am just showing my lack of knowledge in this area, but what is
> fsl specific about wanting a reference to the channel of a "QMC"?
> Is this something that hardware from other manufacturers would not also
> want to do?

The QMC and the QMC channel are something specific to the SoC. This IP is only
available on some Freescale/NXP SoCs.

When I upstreamed the 'fsl,qmc-audio.yaml', I first used a generic name for this
property and Kristoff asked to change to a vendor prefixed name.
  https://lore.kernel.org/linux-kernel/1dfade07-f8c4-2e16-00dc-c7d183708259@linaro.org/

Based on this, as the property 'fsl,qmc-chan' has the exact same meaning in
fsl,qmc-audio.yaml and fsl,qmc-hdlc.yaml, I use the same name.

Best regards,
Hervé

> 
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to QMC node
> > +          - description: Channel number
> > +    description:
> > +      Should be a phandle/number pair. The phandle to QMC node and the QMC
> > +      channel to use.
> > +
> > +required:
> > +  - compatible
> > +  - fsl,qmc-chan
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    hdlc {
> > +        compatible = "fsl,qmc-hdlc";
> > +        fsl,qmc-chan = <&qmc 16>;
> > +    };
> > -- 
> > 2.41.0
> >   
