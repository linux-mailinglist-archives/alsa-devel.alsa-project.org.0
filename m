Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A146764F65
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 11:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D400844;
	Thu, 27 Jul 2023 11:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D400844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690449667;
	bh=gd3ayQw/dJJcn8kl2zzcAC5TgMRVoWsvg5Rh3UpT4Ew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nLwT6vsy2UBOYVHF2Y4n+Usp8ZXbTaKXLMWNvhFKLaKoFC2lfoPYrHBmSXRyOykFs
	 1dUNMH6HZHM2lKZ5De2rp9um5bcAhX+Y52/FNXh/bu6IXqqs+9cBK4MjU1e0gh8FlV
	 kbkhbjpgdJwhA1Jn9Zer5cI340Ij/53/gUW+jKW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E67F80153; Thu, 27 Jul 2023 11:20:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9B17F80163;
	Thu, 27 Jul 2023 11:20:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4236DF8019B; Thu, 27 Jul 2023 11:20:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D317F80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D317F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PWL77lXo
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FF5120009;
	Thu, 27 Jul 2023 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690449599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5uC+Ma0+GEtuYByV1fh5wNUb6P+Qvr99RmBUDDugXA=;
	b=PWL77lXoaqzqWHDfFIl9jdKdv1M4MuRzjjxUGyq7w0BvAYoX3gBbaTeU5NM2l5MhMLkRlB
	8Qc/C0E21db1XjGM/LWuV5Bj7nKFIgG6tObRGld5USHJ0Pu9/09eNFltserlLCc+0QRfod
	4UB45gpmXCPKsJsQV3ekLDhlsSgr5UHkjj3htsrfjNdmwYc+SnTrWkoHiO5mF7G0E5vz+4
	mmPH7kW2lmk4+Aa6SZuxQXNnb6Zu7inndp5s2/t1YafIK5XA0Pcx5pjnqwsmpk/zP61pn8
	RIvivFsxuBkNmUPozqTqQeCifCJZ/iII6VSnwNSdw00aHZzQ5xSykuJAwf4yqQ==
Date: Thu, 27 Jul 2023 11:19:55 +0200
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
Subject: Re: [PATCH v2 27/28] dt-bindings: net: fsl,qmc-hdlc: Add framer
 support
Message-ID: <20230727111955.43571766@bootlin.com>
In-Reply-To: <20230727-jailer-recede-a62ab2238581@spud>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-28-herve.codina@bootlin.com>
	<20230727-jailer-recede-a62ab2238581@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: ZOHGCWUOPDYSNMWJCA3TNCMI73LHMY5Q
X-Message-ID-Hash: ZOHGCWUOPDYSNMWJCA3TNCMI73LHMY5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOHGCWUOPDYSNMWJCA3TNCMI73LHMY5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Conor,

On Thu, 27 Jul 2023 09:12:01 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Wed, Jul 26, 2023 at 05:02:23PM +0200, Herve Codina wrote:
> > A framer can be connected to the QMC HDLC.
> > If present, this framer is the interface between the TDM used by the QMC
> > HDLC and the E1/T1 line.
> > The QMC HDLC can use this framer to get information about the line and
> > configure the line.
> > 
> > Add an optional framer property to reference the framer itself.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Why not fully describe the hardware in one patch in this series, rather
> than split this over two different ones?

I agree, this can be squashed with a previous commit.
My intention was to keep things separated in this first series.

The framer property makes sense only if the stuff related the generic framer
(previous patches) are accepted whereas the QMC HDLC previous binding can be
accepted without this framer property.
I though it would be easier to review the full series with separated
modifications.

That's said, I will squash this patch with the patch 5 ("dt-bindings: net:
Add support for QMC HDLC") in the next iteration.

Best regards,
Hervé

> 
> > ---
> >  Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > index 8bb6f34602d9..bf29863ab419 100644
> > --- a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> > @@ -27,6 +27,11 @@ properties:
> >        Should be a phandle/number pair. The phandle to QMC node and the QMC
> >        channel to use.
> >  
> > +  framer:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the framer node
> > +
> >  required:
> >    - compatible
> >    - fsl,qmc-chan
> > -- 
> > 2.41.0
> >   
