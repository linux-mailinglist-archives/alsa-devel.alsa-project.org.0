Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3D7875DE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 18:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5412839;
	Thu, 24 Aug 2023 18:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5412839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692895579;
	bh=AhRYMJGaCtGa9P4qu6ke2vcHVGofovXgmQ7wC0r6bHk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K3Qh2yC99n6UKgqgMxUOSpT5Hxy+zEtXlKRqYtw+fYfV/s8jmkuP7Z26GvyiuCXAN
	 LzKJP/wbyEG01Vf//2Eh5EHV7kKZ4qVcdBlv93HJsEtJwrKH/tthEXlKodpJsyl+8N
	 7b0eXyeXxELFK0JAFNWseNhh0ItLqH219Sopat4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62E7CF80158; Thu, 24 Aug 2023 18:45:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E32A9F800F5;
	Thu, 24 Aug 2023 18:45:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 270CEF80158; Thu, 24 Aug 2023 18:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBF42F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 18:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF42F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KTVnzD5e
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1707E0004;
	Thu, 24 Aug 2023 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692895499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgKRd8PXna9jddAQ7rYYlYUO4KIn7jskOvosbl+/UOs=;
	b=KTVnzD5eVG2mw9j6CEqcZhnTJSoCHDBkb/MYYvlHhrk7z6MfEr8ZRX0TSl957if3mHmwzS
	6frES6KAXz+WuMYXmtFLD13OjX3VJcXVNJNMy7D6DCPoRgPj1bT8AtppiE+olPLBuMGg//
	JxxP0rArWBg88Nbj10QQwE39F6YhX3z3MDZGAnJf48nbqoGxGXN8Xia5wJbKAGfZBJ+N6Q
	HZA6C5qZftnN7pcS/5UaU+tLfQg+VnUhV0Zik7VF4qhFoxdGtvxD+UIMBMYu3kVD898JBR
	BQPsXzVrFkC3MWJPlEnpAEFtwQr2EIdoqd1el7kRXYhmwqMBOoOEs+RVJBd09g==
Date: Thu, 24 Aug 2023 18:44:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Horman <horms@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
Message-ID: <20230824184454.2a96b6fc@bootlin.com>
In-Reply-To: <ZOJKH0xHpQc4HdUP@vergenet.net>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
	<5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
	<ZOJKH0xHpQc4HdUP@vergenet.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: IGYCZ3PPGHAHRPGL7KLJ5AYJFCHEQGHX
X-Message-ID-Hash: IGYCZ3PPGHAHRPGL7KLJ5AYJFCHEQGHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGYCZ3PPGHAHRPGL7KLJ5AYJFCHEQGHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Simon,

On Sun, 20 Aug 2023 19:15:11 +0200
Simon Horman <horms@kernel.org> wrote:

> On Fri, Aug 18, 2023 at 06:39:15PM +0200, Christophe Leroy wrote:
> > From: Herve Codina <herve.codina@bootlin.com>
> > 
> > A framer is a component in charge of an E1/T1 line interface.
> > Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> > frames. It also provides information related to the E1/T1 line.
> > 
> > The framer framework provides a set of APIs for the framer drivers
> > (framer provider) to create/destroy a framer and APIs for the framer
> > users (framer consumer) to obtain a reference to the framer, and
> > use the framer.
> > 
> > This basic implementation provides a framer abstraction for:
> >  - power on/off the framer
> >  - get the framer status (line state)
> >  - be notified on framer status changes
> >  - get/set the framer configuration
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>  
> 
> Hi Christophe and Herve,
> 
> some minor feedback from my side.
> 
> ...
> 
> > diff --git a/drivers/net/wan/framer/framer-core.c b/drivers/net/wan/framer/framer-core.c  
> 
> ...
> 
> > +/**
> > + * framer_create() - create a new framer
> > + * @dev: device that is creating the new framer
> > + * @node: device node of the framer. default to dev->of_node.
> > + * @ops: function pointers for performing framer operations
> > + *
> > + * Called to create a framer using framer framework.
> > + */
> > +struct framer *framer_create(struct device *dev, struct device_node *node,
> > +			     const struct framer_ops *ops)
> > +{
> > +	int ret;
> > +	int id;
> > +	struct framer *framer;  
> 
> Please arrange local variable declarations for Networking code
> using reverse xmas tree order - longest line to shortest.

Yes, will be done in the next iteration.

> 
> https://github.com/ecree-solarflare/xmastree is helpful here.
> 
> ...
> 
> > diff --git a/include/linux/framer/framer-provider.h b/include/linux/framer/framer-provider.h  
> 
> ...
> 
> > +/**
> > + * struct framer_ops - set of function pointers for performing framer operations
> > + * @init: operation to be performed for initializing the framer
> > + * @exit: operation to be performed while exiting
> > + * @power_on: powering on the framer
> > + * @power_off: powering off the framer
> > + * @flags: OR-ed flags (FRAMER_FLAG_*) to ask for core functionality
> > + *          - @FRAMER_FLAG_POLL_STATUS:
> > + *            Ask the core to perfom a polling to get the framer status and  
> 
> nit: perfom -> perform

Will be fixed in the next iteration.

> 
>      checkpatch.pl --codespell is your friend here
> 
> > + *            notify consumers on change.
> > + *            The framer should call @framer_notify_status_change() when it
> > + *            detects a status change. This is usally done using interrutps.  
> 
> nit: usally -> usually
>      interrutps -> interrupts

Will be fixed in the next iteration.

> 
> ...
> 
> > diff --git a/include/linux/framer/framer.h b/include/linux/framer/framer.h
> > new file mode 100644
> > index 000000000000..0bee7135142f
> > --- /dev/null
> > +++ b/include/linux/framer/framer.h
> > @@ -0,0 +1,199 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Generic framer header file
> > + *
> > + * Copyright 2023 CS GROUP France
> > + *
> > + * Author: Herve Codina <herve.codina@bootlin.com>
> > + */
> > +
> > +#ifndef __DRIVERS_FRAMER_H
> > +#define __DRIVERS_FRAMER_H
> > +
> > +#include <linux/err.h>
> > +#include <linux/mutex.h>
> > +#include <linux/notifier.h>
> > +#include <linux/of.h>
> > +#include <linux/device.h>
> > +#include <linux/workqueue.h>
> > +
> > +/**
> > + * enum framer_iface - Framer interface  
> 
> As this is a kernel-doc, please include documentation for
> the defined constants: FRAMER_IFACE_E1 and FRAMER_IFACE_T1.
> 
> As flagged by: ./scripts/kernel-doc -none

Will be done in the next iteration.

> 
> > + */
> > +enum framer_iface {
> > +	FRAMER_IFACE_E1,      /* E1 interface */
> > +	FRAMER_IFACE_T1,      /* T1 interface */
> > +};
> > +
> > +/**
> > + * enum framer_clock_mode - Framer clock mode  
> 
> Likewise here too.
> 
> Also, nit: framer_clock_mode -> framer_clock_type
> 

Will be updated (doc and change to framer_clock_type) in the next iteration.

> > + */
> > +enum framer_clock_type {
> > +	FRAMER_CLOCK_EXT, /* External clock */
> > +	FRAMER_CLOCK_INT, /* Internal clock */
> > +};
> > +
> > +/**
> > + * struct framer_configuration - Framer configuration  
> 
> nit: framer_configuration -> framer_config

Will be fixed in the next iteration.

> 
> > + * @line_iface: Framer line interface
> > + * @clock_mode: Framer clock type
> > + * @clock_rate: Framer clock rate
> > + */
> > +struct framer_config {
> > +	enum framer_iface iface;
> > +	enum framer_clock_type clock_type;
> > +	unsigned long line_clock_rate;
> > +};
> > +
> > +/**
> > + * struct framer_status - Framer status
> > + * @link_is_on: Framer link state. true, the link is on, false, the link is off.
> > + */
> > +struct framer_status {
> > +	bool link_is_on;
> > +};
> > +
> > +/**
> > + * framer_event - event available for notification  
> 
> nit: framer_event -> enum framer_event

Will be fixed in the next iteration.

> 
> A~d please document FRAMER_EVENT_STATUS in the kernel doc too.

Will be documented in the next iteration.

> 
> > + */
> > +enum framer_event {
> > +	FRAMER_EVENT_STATUS,	/* Event notified on framer_status changes */
> > +};  
> 
> ...

Thanks for the review,
Best regards,
Hervé
