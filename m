Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E3722DBF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 19:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B62574C;
	Mon,  5 Jun 2023 19:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B62574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685986657;
	bh=eOM1QQpaTQIMrgVqkxLpu8cchSBKMYQp6H/dwtHfVrc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n1V2VK1ej5lrcZIeCF24Zu/tT1/AgbSBdcK4m/lWxlBfIvaq14JTezGN6QjO7VJHD
	 CdXdnRf7S+Jf9GZv+OT/iumYGbovMZaPw4qMNwMcRUgep96BwOuom+L5ftk0X8viAN
	 84jIcX5ty8Tkr1p4aPidbN0hx4Hz2Dr2pcYy6XNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84BB2F80520; Mon,  5 Jun 2023 19:36:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B63FF8016C;
	Mon,  5 Jun 2023 19:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92893F80199; Mon,  5 Jun 2023 19:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EC26F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 19:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC26F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fi5uoXdA
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685986599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yjxc+85Bq54GZEvP6akAc9UZPm7vVtcD2MajvGxNqiY=;
	b=fi5uoXdANbPmsJUCGLlp8YkQvRea5sm2llsgEt0TFFbN/DiK/ijhu1QIs5Lb2SHJSBwlTa
	xdRattLNG7l9JpgH7Z2IWlWWnCWosU1xEqePGqf0QzTm5HkuErSI72aB0EIN6+4amnT0Ga
	8P+eqvTkLDpUBP2q2wVkWdPbKHMPlb/UrWbta2UWHEFpzfSkXWd8qOJMTia0XbM4I72MNo
	htz4tOzOJNwc7ZqbKvRPvV4SamC6GjcYV5Yf3fFGzU1Qozhdsb7h7PJ7F8Vnc6JSTYkcZc
	ETtauzV/LnDHBQc6O1Sj8LPo50Bx0osDRQ1RHgVz9XCDZ+P/SY/4l7DojYpbKA==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2C4E20004;
	Mon,  5 Jun 2023 17:36:37 +0000 (UTC)
Date: Mon, 5 Jun 2023 19:36:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/9] iio: inkern: Add a helper to query an available
 minimum raw value
Message-ID: <20230605193636.5239a271@bootlin.com>
In-Reply-To: <20230605180547.0000528b@Huawei.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-6-herve.codina@bootlin.com>
	<ZHtIdTZbULl6t4RT@surfacebook>
	<20230605094637.7615b689@bootlin.com>
	<CAHp75Vec3fXT6phqvLGSn0c09USCXXF6ZoE+X1VNJGM6jyf=aQ@mail.gmail.com>
	<20230605180547.0000528b@Huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DORZVNHBU45ALHXP3QGTY2UPAQ6VJFSQ
X-Message-ID-Hash: DORZVNHBU45ALHXP3QGTY2UPAQ6VJFSQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DORZVNHBU45ALHXP3QGTY2UPAQ6VJFSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jonathan, Andy,

On Mon, 5 Jun 2023 18:05:47 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Mon, 5 Jun 2023 12:45:24 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
...
> > > > > +           default:
> > > > > +                   /* FIXME: learn about min for other iio values */    
> > > >
> > > > I believe in a final version this comment won't be here.    
> > >
> > > We have the same FIXME comment in the iio_channel_read_max() function I
> > > copied to create this iio_channel_read_min() and, to be honest, I
> > > don't really know how to handle these other cases.
> > >
> > > In this series, I would prefer to keep this FIXME.    
> > 
> > I see, Jonathan needs to be involved here then.  
> 
> It's really more of a TODO when someone needs it than a FIXME.
> I'm not particularly keen to see a bunch of code supporting cases
> that no one uses, but it's useful to call out where the code would
> go if other cases were to be supported.
> 
> Perhaps soften it to a note that doesn't have the work FIXME in it.
> 
> Jonathan
> 

Right, I will change to /* TODO: learn about max for other iio values */
in the next iteration (both iio_channel_read_max() and iio_channel_read_min())

Regards,
Hervé

> 
> >   
> > > > > +                   return -EINVAL;    
> >   
> 
