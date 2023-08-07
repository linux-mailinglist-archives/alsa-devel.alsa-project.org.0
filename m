Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 994D07727F8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:37:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD835827;
	Mon,  7 Aug 2023 16:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD835827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691419056;
	bh=ke5upjysK6AX8emCowQngsKJbMWF9+VpIwLTcOxKcwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zk4ILsfPsVrgYaiplejhD0/A7P11H5B4sY/lPnyPvkg/dNcGKlr5OeZf3/YoFfGyC
	 LTZTfQHoVY6L59uVYNzeF4PF0BdBdbeZMR9gsJ6WkxMQ3ssWoe77Ypv5kYyZ62KOG7
	 Pqx7qYPnIsb/H/RVz74Gur9L12XlX93K1a32hbjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C0ADF80087; Mon,  7 Aug 2023 16:36:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C845CF8016B;
	Mon,  7 Aug 2023 16:36:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B973F8016D; Mon,  7 Aug 2023 16:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CAE6F8016A
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 16:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CAE6F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HmQ6EWLU
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7938E0008;
	Mon,  7 Aug 2023 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691418990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CoovJrYPxkDFGogd5wvVhZC1R5Dq4lKn3YHaDGn4/LM=;
	b=HmQ6EWLUrDj97BUk7IGsXLcmAJ2miJvyMgaSQlOietWT5pvqGoMYmO6yr+Bhc0Lx67tKD6
	df7Z6+KBom37uNEQWfw8FJht1ZSI3QWLiHNjcNXBmvIwSynDxYMQivLHbJtb7uzGw5pJZ2
	EAinCJbElQ6rO13JeWO3s9sPGU4+27Q8M5T52pS7PcbF+R8WyuQKAjhFeLCmKcp+6TWkuR
	IdO0UMWLzMibIMpfP4ahj/zKwHCDxTgVc0R059ZGQaSUIC06o5hsPMQ2XYgtkWYBNaUzS4
	qP1VmAe+U2gpEDS1hmzhbhx0eTbGq6h1G2uNh4GG0oC80TOYZeIgosi77P7S8A==
Date: Mon, 7 Aug 2023 16:36:26 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li Yang
 <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <20230807163626.79a5ca7b@bootlin.com>
In-Reply-To: <eb99e739-6578-4aee-a0f4-7a0c5e5e81ef@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-25-herve.codina@bootlin.com>
	<CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
	<CACRpkdZebvrdGXooLXmgXhUcgdgxBczJBpdEoEyJDR39abaAqQ@mail.gmail.com>
	<eb99e739-6578-4aee-a0f4-7a0c5e5e81ef@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: VCRUHULOJU2BWCUEXBS5IDVWYVSIAOCW
X-Message-ID-Hash: VCRUHULOJU2BWCUEXBS5IDVWYVSIAOCW
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Linus, Andrew,

On Mon, 7 Aug 2023 15:17:11 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Aug 07, 2023 at 03:06:42PM +0200, Linus Walleij wrote:
> > On Mon, Aug 7, 2023 at 3:05 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >   
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> > >
> > > So it is a bridge chip? Please use that terminology since Linux
> > > DRM often talks about bridges.  
> > 
> > Replying to self: no it's not a bridge, it's a WAN thingy.
> > 
> > So perhaps write that this is a WAN interface adapter chip.  
> 
> Hi Linus
> 
> In the E1/T1/J1 world, framer is a well understood concept. Maybe the
> text needs a bit more background information to explain what this is
> to somebody who does not have an old school telecoms background.
> 
>    Andrew

Maybe I can add in my commit log:
--- 8< ---
This kind of component can be found in old telecommunication system.
It was used to digital transmission of many simultaneous telephone calls
by time-division multiplexing. Also using HDLC protocol, WAN networks
can be reached through the framer.
--- 8< ---

Do you think it will be better ?

Regards,
Hervé Codina

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
