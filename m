Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CC6D1FC9
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 14:12:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A301F4;
	Fri, 31 Mar 2023 14:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A301F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680264735;
	bh=luw6WRoKOCKMpjLWXT9F2/F5B8AJlhK54WDtBlSG0zM=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=liHug3iKHxPbmLDebFbpaSri5rKB8VuhzM5z1LSTlb78nrWOAVpXMk9XirmOAm7Ts
	 NbwpH50ZRzydQxCyawui5lCT0B5Mqm/1O2bOFxg/SGUg7f1I4upkw5gVKsuhwbQ+TE
	 KpvZQaBGQZVEisJlnCDCcTBblCE78gDS8uoa2obM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C66B8F800C9;
	Fri, 31 Mar 2023 14:11:24 +0200 (CEST)
Date: Fri, 31 Mar 2023 14:11:04 +0200
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
	<20230328092645.634375-3-herve.codina@bootlin.com>
	<20230330160510.GB489249@google.com>
	<20230331094208.41ab4420@bootlin.com>
	<6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGL23H6HBO4XKMOIXDPUY45PNIA6LRCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168026468438.26.13238104728611675195@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68B74F8024E; Fri, 31 Mar 2023 14:11:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 114BBF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 14:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 114BBF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G/P7ooR6
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CE5866000C;
	Fri, 31 Mar 2023 12:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680264669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlFjaEgglGp4LuEAhX3Eu2KitorIUFC8QsINMFBMePg=;
	b=G/P7ooR673wIkTHXtogfVKLqLVvxP9iSUJhbBPA0jBi46ucYB/ay6zGFAPJvLQuYGeesZu
	G2qdWoQOTRtT1BDQy+evrDZKkBsap0H2FXS1Gibw54F/NakKab9Y8rij6uS9aQZggDlDk0
	m6eq3/XUqhFZLvfC7JL0KuPSeDkPaC1FyfzrtWgwWNGPMXzIRZCC9T1TQ9Xne3tJ30JBir
	MmANr3cLZNj/XOoOMcuI0W2qjQnHhXmskYvmpfDES1thXXFm5yugnbcwFbkR8K/Fi7CDeM
	7yUkr6oY/zFhHLJpqHEjQreBpihPohVWzp4Obk0FvbeWh71jMd6wIL7LmicBFw==
Date: Fri, 31 Mar 2023 14:11:04 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230331141104.42445da9@bootlin.com>
In-Reply-To: <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
	<20230328092645.634375-3-herve.codina@bootlin.com>
	<20230330160510.GB489249@google.com>
	<20230331094208.41ab4420@bootlin.com>
	<6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PGL23H6HBO4XKMOIXDPUY45PNIA6LRCU
X-Message-ID-Hash: PGL23H6HBO4XKMOIXDPUY45PNIA6LRCU
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGL23H6HBO4XKMOIXDPUY45PNIA6LRCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof, Lee

On Fri, 31 Mar 2023 11:13:30 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 31/03/2023 09:42, Herve Codina wrote:
> > Hi Lee,
> > 
> > On Thu, 30 Mar 2023 17:05:10 +0100
> > Lee Jones <lee@kernel.org> wrote:
> >   
> >> On Tue, 28 Mar 2023, Herve Codina wrote:
> >>  
> >>> The Lantiq PEF2256 is a framer and line interface component designed to
> >>> fulfill all required interfacing between an analog E1/T1/J1 line and the
> >>> digital PCM system highway/H.100 bus.    
> >>
> >> My goodness!
> >>
> >> It's been a long time since I've seen anything quite like this.  
> > 
> > Yes, old things but working on recent kernel.
> >   
> >>
> >> My suggestion to you:
> >>
> >> * Split this up into components that fit functional subsystems  
> > 
> > It is done. The audio part is present in ASoC subsystem (path 5 in this
> > series). pinctrl function is implemented in this driver and, as I don't
> > want to share registers, I would prefer to keep this function inside this
> > driver.  
> 
> The amount of defines and huge functions like pef2256_setup_e1()
> contradict it.
> 
> Even the pef2256_setup_e1() really does not follow Linux coding style -
> you know the size requirement, right?

I know that pef2256_setup_e1() is quite big and I will look at a way
to split it in a consistent way.

> 
> pef2256_get_groups_count, struct pinmux_ops and others - this is
> pinctrl, not MFD! They cannot be in MFD driver.

Maybe the issue is that MFD was not a good choice.
The "function" provided are not independent of each other.
The "main" driver (pef2256.c) needs to do the setup and handle the interrupt.
The "function" provided are some glues in order to be used in some sub-systems
such as audio. Indeed, ASoC needs a codec DAI to be connected to a CPU DAI.
These "functions" need to be started (ie probe()) after the pef2256 setup was
done. So a start (probe()) order relationship is needed.

If a MFD driver needs independent children to handle independent functions,
the pef2256 does not fit well as a MFD driver.

I switched from misc to MFD just to handle child DT nodes instead of having
phandles. Using child DT nodes instead of phandles is really a good thing and
need to be kept.
The switch to MFD was probably not the best thing to do.

What do you think if I switched back the pef2256 "main" driver (pef2256.c) to
misc ?


> 
> > 
> > Also, I sent a RFC related to HDLC and PHY. In this RFC, the pef2256 is
> > considered as a PHY and handled in the PHY subsystem.
> >   https://lore.kernel.org/linux-kernel/20230323103154.264546-1-herve.codina@bootlin.com/
> >   
> >> * Run checkpatch.pl  
> > 
> > I did.  
> 
> There are tons of weird indentation,e.g.:
> +#define     PEF2256_2X_PC_XPC_XLT	(0x8 << 0)
>         ^^^^ there is only one space after #define

I ran checkpatch.pl, not checkpatch.pl --strict.

The spaces related the #define can be seen on many other drivers.

#define FOO_REG_BAR	0x10
#define   FOO_REG_BAR_BIT0	BIT(0)
#define   FOO_REG_BAR_BIT4	BIT(4)

The first line is the register offset and the other lines (indented) are
the bits description related to this register.

> 
> ... and other style issues:
> 
> CHECK: Please don't use multiple blank lines
> CHECK: spaces preferred around that '+' (ctx:VxV)
> CHECK: Alignment should match open parenthesis
> CHECK: Macro argument reuse '_groups' - possible side-effects?
> CHECK: usleep_range is preferred over udelay; see
> Documentation/timers/timers-howto.rst
> CHECK: spaces preferred around that '/' (ctx:VxV)

I will have a look and fix them in the next iteration.

> 
> 
> >   
> >> * Remove all of the debug prints  
> > 
> > I can do that in the next iteration if really needed.
> >   
> >> * Move all of the defines out to a header file  
> > 
> > These defines are related to registers. As I don't want to share these
> > registers, is it really necessary to use a header file for them ?
> >   
> >> * Be more verbose in your documentation / comments  
> > 
> > I can improve the API documentation present in include/mfd/pef2256.h.
> > Do you thing that is necessary ? Only a few devices will use this API.
> >   
> Krzysztof
> 

Best regards,
Hervé
