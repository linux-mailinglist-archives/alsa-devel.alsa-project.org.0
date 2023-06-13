Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F572E9F5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 19:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A308EAD;
	Tue, 13 Jun 2023 19:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A308EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686677764;
	bh=1uL0eU85LmczqPyJ9pEMERx2x8xA0I6JUxyVdOxAiAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amrl1ob9q7Hz79H4E/fvXosKDdw0WTHFILsQZI1xVCHthZPIRGyPxyNIxZ1Kz7Qdy
	 3Le9N7V4moJijHxn4vHgeIgJEhgP3vbl1M17J3m11xlJD3nmv4pkZj9u26wsaP8OXe
	 og3BSephhIY6ASiLXdde2btMjuvyt1rzlTyhX8Oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B6F3F80246; Tue, 13 Jun 2023 19:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2167DF80132;
	Tue, 13 Jun 2023 19:34:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B16C2F80149; Tue, 13 Jun 2023 19:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92B1CF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 19:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B1CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pF/oK2cw
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686677683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86rh1f0HBKfOE+lzuTwLJdkE+7pPjEWV2pIeiL0qQXk=;
	b=pF/oK2cwuHCGuxVOM6DoseXfu83gnXuDTUpUvA9KEn0otsbNNzAA4pJPLVlJc5JrD3dGbr
	V0NpyMNa0sSRNqbb3yOvL0S10jM9O8IGKL+jAbnAuDQZB9SQpm9XrkvoIKG3brJIIhGRRM
	EcNFZEmvFvUb5QYmp9+Wd5Pnrf2Y8tv7aXv/Y/3hALFfIF356bK6jdj3nthmcCefNokuhy
	Hb+vEuC8h9JBolygcQDRKCAAo5m2LFYvNdRcu0hbzUjh9vP3fRhNAs2jKaGxdoL6X7iBMm
	pvVGec+DO94oFRPp6mXKfp+Og4FmeHRt4ldea3l3CoU9Q1/zxbN5bzyXeUX3Jg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B8E8E0003;
	Tue, 13 Jun 2023 17:34:41 +0000 (UTC)
Date: Tue, 13 Jun 2023 19:34:40 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 06/12] minmax: Introduce {min,max}_array()
Message-ID: <20230613193440.1940c3a7@bootlin.com>
In-Reply-To: 
 <CAHp75Vcr5Owjn0HK-+D0mpPJAkAxG7F8bEO=sqvhT8w=_xnF7w@mail.gmail.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
	<20230612122926.107333-7-herve.codina@bootlin.com>
	<CAHp75Vf2dmAS9VD-pgyZwVopVCFy8yFjhPWEj8sym=pfE7uxSA@mail.gmail.com>
	<20230613100000.6bd9e690@bootlin.com>
	<CAHp75Vcr5Owjn0HK-+D0mpPJAkAxG7F8bEO=sqvhT8w=_xnF7w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 72FCTQCQXY6SLKHSKW7YA55DGDQPX5O4
X-Message-ID-Hash: 72FCTQCQXY6SLKHSKW7YA55DGDQPX5O4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72FCTQCQXY6SLKHSKW7YA55DGDQPX5O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 20:08:08 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Jun 13, 2023 at 11:00 AM Herve Codina <herve.codina@bootlin.com> wrote:
> > On Mon, 12 Jun 2023 17:10:40 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > On Mon, Jun 12, 2023 at 3:30 PM Herve Codina <herve.codina@bootlin.com> wrote:  
> > > >
> > > > Introduce min_array() (resp max_array()) in order to get the
> > > > minimal (resp maximum) of values present in an array.  
> > >
> > > Some comments below, after addressing them,
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>  
> 
> ...
> 
> > > > +       typeof(array) __array = (array);                        \  
> > >
> > > We have __must_be_array()  
> >
> > Using __must_be_array() will lead to some failure.
> > Indeed, we can have:
> >   --- 8< ---
> >   int *buff
> >   ...
> >   min = min_array(buff, nb_item);
> >   --- 8< ---
> >
> > In this case, __must_be_array() will report that buff is not an array.  
> 
> Oh, I missed that.
> 
> > To avoid any confusion, what do you think if I renamed {min,max}_array()
> > to {min,max}_buffer() and replace __array by __buff and use *(__buff + xxx)
> > instead of array[xxx] in the macro.  
> 
> But functionally it's still against an array.
> 
> I would stick with "array" in the name, but add a comment why
> __must_be_array() is not used. If we need a stricter variant, we may
> add a new wrapper with that check. That said, I think we can use
> __array[0] and similar indexed accesses.
> 

Right, I will provide an updated version on the next iteration.

Thanks for your feedback.
Hervé
