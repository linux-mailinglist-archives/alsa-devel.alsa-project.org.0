Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82490733064
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 13:50:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A582082C;
	Fri, 16 Jun 2023 13:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A582082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686916215;
	bh=CTb3Fon1TBCj1XGnwT1ce/Yr9T8kd/MNACBvXtUAe6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X0NucDrosp/Wxu5Un6yxqglBntKa8kXI4IrG/M55wiTNNLCg6TOaUeyUuds7xCx4E
	 P4/8V7dMJRX3KeWbD+k1wPV/lpr8vG/w0ZwlqAJ2jhZsFQxPFguW0sN53Ow0PiJdVf
	 DSkm+P9WlkTwycmUpPRIVP03AtX59rieNu8HNaWM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7BEEF80132; Fri, 16 Jun 2023 13:49:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 094D8F80132;
	Fri, 16 Jun 2023 13:49:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8341FF80149; Fri, 16 Jun 2023 13:48:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A6ECF80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 13:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A6ECF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LL2WMmiQ
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686916128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLKhvPrptWFoCmJpHArFvlKc/yEEcCk45NeiCg0/3Yg=;
	b=LL2WMmiQsuIm4g/hjHsD81IzOy08yCDudlals5vYRPZBYhTAwXCnSUWZD8hxJ1ixAlMj+V
	JYx7e7oVG7MoU4swUjUs2j3hAl6PBV8k7c7E5Z7FNSQjf1MGesJQQ9L4BsP3a4lkHTruFS
	BK1MVffkb7DWP+kNcYd4mIHG8qYIeHpOKVlSFUfAFgzubUkRbgV9EtXs2U2uTjAypYYwH9
	X0BbwTXxmZ4PXGtrmlSI8s15MuoaOxM/rZ9NXiLu2AhOzPTH1rrRD1xPYHWoxQr4VO4lCA
	Z+JVCActDH1jkX1Xa+2xdSqlAOUVJwvSZ1BHYnfBUFMZlRIxDPGj4GXVSs0pQg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2CD0C0002;
	Fri, 16 Jun 2023 11:48:45 +0000 (UTC)
Date: Fri, 16 Jun 2023 13:48:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob Herring"
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
Message-ID: <20230616134844.09e7fda3@bootlin.com>
In-Reply-To: <6c7fe34f7b65421ab618d33ba907ae09@AcuMS.aculab.com>
References: <20230614074904.29085-1-herve.codina@bootlin.com>
	<20230614074904.29085-8-herve.codina@bootlin.com>
	<CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
	<20230614114214.1371485e@bootlin.com>
	<CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
	<20230614223418.0d7e355d@bootlin.com>
	<CAHp75VfFyDzr4qHNssXZ8RLy0gxMWdjBgac4JLd7grRLEG-vyw@mail.gmail.com>
	<20230615113512.07967677@bootlin.com>
	<6c7fe34f7b65421ab618d33ba907ae09@AcuMS.aculab.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L56TYGP5P2UPFDYD4L3F3ONLUZYPMTYN
X-Message-ID-Hash: L56TYGP5P2UPFDYD4L3F3ONLUZYPMTYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L56TYGP5P2UPFDYD4L3F3ONLUZYPMTYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi David,

On Fri, 16 Jun 2023 09:08:22 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

...

> 
> Just define two variables typeof(__array[0] + 0) one for an element
> and one for the limit.
> The just test (eg):
> 	if (limit > item) limit = item;
> finally cast the limit back to the original type.
> The promotions of char/short to signed int won't matter.
> There is no need for all the type-checking in min/max.
> 
> Indeed, if min_t(type, a, b) is in anyway sane it should
> expand to:
> 	type _a = a, _b = b;
> 	_a < _b ? _a : _b
> without any of the checks that min() does.

I finally move to use _Generic() in order to "unconstify" and avoid the
integer promotion. With this done, no extra cast is needed and min()/max()
are usable.

The patch is available in the v5 series.
  https://lore.kernel.org/linux-kernel/20230615152631.224529-8-herve.codina@bootlin.com/

Do you think the code present in the v5 series should be changed ?
If so, can you give me your feedback on the v5 series ?

Thanks for your review,
Hervé
