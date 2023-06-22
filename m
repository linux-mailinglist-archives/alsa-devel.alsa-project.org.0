Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D573A0FA
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 14:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4451182B;
	Thu, 22 Jun 2023 14:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4451182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687437225;
	bh=ffa4P4G154cDogd2OqZTPEL3TdU8jL6AjS4s46VTxfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HYV13Rpwr0jKpmeO6dmIc9lYw5+iFRKoYwcaiAY5R4E7Y1fr70TqweNII9JeSMvbi
	 oni7X3klAeXcevG0VHXMB7hOsWiDd4QkHOxK2jSF+EfxcHQfyC773nC2sBnqKhNmFH
	 AXJNBimCUFrTVCC8jq3TBxXp/mOv64uI/MmQP5k0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79D90F80130; Thu, 22 Jun 2023 14:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A403F80130;
	Thu, 22 Jun 2023 14:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C207F80141; Thu, 22 Jun 2023 14:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB0CEF8003A
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 14:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0CEF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ipp3WrZX
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687437156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mMm1b7kxk016SextcassDxegbQZRgmEVemL7uAX+0Y=;
	b=ipp3WrZXrj9HYwIAvfArw2G+hdUR0coeEKL4tVIgdSZ75sIlcMWOvkLQIW2tebHSriqNqT
	MeN90wAwBxTi4nEEGCW5c7+tjn+ddQJz9N5mjO2eTXwRE0c1iKazsyTrPzokSYa7YXej+I
	NHjBh1AZ9d9TRh8mXtuMmnnH5Y/5Oj/iDceVBGw2XC5tCctD4QpQ5M05RokmRf35Vi77Ec
	+vAa+wAOPIEhewjf6jLb8Y3CVIc27kodxUPjErqgkfTIcoqf+zWSmC9o/qagbEdvrSffLz
	hCGlz5rVK0I/mjQkynD+nSV1FlRlfh2Acm0XJ6cm+DwyamcyOjgqMC6W+Q8uVw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id E69971BF206;
	Thu, 22 Jun 2023 12:32:33 +0000 (UTC)
Date: Thu, 22 Jun 2023 14:32:33 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 07/13] minmax: Introduce {min,max}_array()
Message-ID: <20230622143233.7300a813@bootlin.com>
In-Reply-To: <70697b976107473b8779eea7d6c8a189@AcuMS.aculab.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-8-herve.codina@bootlin.com>
	<70697b976107473b8779eea7d6c8a189@AcuMS.aculab.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QYTRLZTF74HLBBBTMQ36272XECGAAQCD
X-Message-ID-Hash: QYTRLZTF74HLBBBTMQ36272XECGAAQCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYTRLZTF74HLBBBTMQ36272XECGAAQCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi David, Andy

On Tue, 20 Jun 2023 11:45:01 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> From: Herve Codina
> > Sent: 15 June 2023 16:26
> > 
> > Introduce min_array() (resp max_array()) in order to get the
> > minimal (resp maximum) of values present in an array.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > ---
> >  include/linux/minmax.h | 64 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> > 
> > diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> > index 396df1121bff..1672985b02a3 100644
> > --- a/include/linux/minmax.h
> > +++ b/include/linux/minmax.h
> > @@ -133,6 +133,70 @@
> >   */
> >  #define max_t(type, x, y)	__careful_cmp((type)(x), (type)(y), >)
> > 
> > +/*
> > + * Remove a const qualifier from integer types
> > + * _Generic(foo, type-name: association, ..., default: association) performs a
> > + * comparison against the foo type (not the qualified type).
> > + * Do not use the const keyword in the type-name as it will not match the
> > + * unqualified type of foo.
> > + */
> > +#define __unconst_integer_type_cases(type)	\
> > +	unsigned type:  (unsigned type)0,	\
> > +	signed type:    (signed type)0
> > +
> > +#define __unconst_integer_typeof(x) typeof(			\
> > +	_Generic((x),						\
> > +		char: (char)0,					\
> > +		__unconst_integer_type_cases(char),		\
> > +		__unconst_integer_type_cases(short),		\
> > +		__unconst_integer_type_cases(int),		\
> > +		__unconst_integer_type_cases(long),		\
> > +		__unconst_integer_type_cases(long long),	\
> > +		default: (x)))  
> 
> Those are probably more generally useful and belong elsewhere.

Yes but it is only used here.
It can be move somewhere, in a common place, when necessary.

> 
> > +
> > +/*
> > + * Do not check the array parameter using __must_be_array().
> > + * In the following legit use-case where the "array" passed is a simple pointer,
> > + * __must_be_array() will return a failure.
> > + * --- 8< ---
> > + * int *buff
> > + * ...
> > + * min = min_array(buff, nb_items);
> > + * --- 8< ---  
> 
> Is that needed in the .h file?
> 
> > + *
> > + * The first typeof(&(array)[0]) is needed in order to support arrays of both
> > + * 'int *buff' and 'int buf[N]' types.
> > + *
> > + * The array can be an array of const items.
> > + * typeof() keeps the const qualifier. Use __unconst_typeof() in order to
> > + * discard the const qualifier for the __element variable.
> > + */
> > +#define __minmax_array(op, array, len) ({				\
> > +	typeof(&(array)[0]) __array = (array);				\
> > +	typeof(len) __len = (len);					\
> > +	__unconst_integer_typeof(__array[0]) __element = __array[--__len]; \  
> 
> s/__element/__bound/
> 
> > +	while (__len--)							\
> > +		__element = op(__element, __array[__len]);		\
> > +	__element; })  
> 
> I'm not all sure that all the shenanigans required to use min()
> is really needed here.
> 
> It would also be generally better to process the array forwards.
> So something like:
> 	typeof (&array[0]) __ptr = array, __limit = array + len;
> 	typeof (array[0] + 0) __element, __bound = *__ptr++;
> 	while (ptr < __limit) {
> 		__element = *__ptr++;
> 		if (__element > __bound)
> 			__bound = __element;
> 	}
> 	(typeof (array[0]))__bound; })
> seems fine to me.
> The final cast is there to convert 'int' back to un/signed char|short.
> Not really needed and might generate worse code.
> 
> But if you insist on using min/max ignore this bit.

I didn't plan to change the {min,max}_array() macros in this series as you
suggest.

Maybe min()/max() is too strict but it's a way to be sure about the type
used. Also the current version doesn't need any extra cast to get rid of
the integer promotion as the integer promotion doesn't occur.

Is it ok for you if we keep as it ?

Thanks for your feedback,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
