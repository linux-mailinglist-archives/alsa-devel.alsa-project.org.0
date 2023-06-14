Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DB730939
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 22:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF2B3E8;
	Wed, 14 Jun 2023 22:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF2B3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686774925;
	bh=pPM2jwTHWU6qQT8cC+YIvJG98icZQsn9uSSzqJdW0BI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgPBsdZaAUAVY5Q/cQY2SFsmkcEKI38JJ+m5CIU9n7MfHif+mJvTD+eG3qhwVbGei
	 ZLl7uWgznwiPGfXuOkq3/8MJ2ZR8i1qAXq4ZVhAzg+U3TABoQsEz1vzqOT/witI5/V
	 c/XXR05A3jdYTH46c00WIBhfEwdXyYlukR3+5oog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1483F8025E; Wed, 14 Jun 2023 22:34:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE15F800BA;
	Wed, 14 Jun 2023 22:34:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A201F80149; Wed, 14 Jun 2023 22:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4FA5F80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 22:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FA5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nQ7IcnTL
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686774861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZm6YcC6DcFVvhOCrWE7tXXzeBzGgryfSQmR/S4llfA=;
	b=nQ7IcnTL8O0E6kwDyNu6kT3yKmiODt5kIbcs4yQzM21QJqc0CQKBJIc3UrH/URxks21i4Q
	9JDF6iwAmNyudNKKRcD0kHBCsZ3QewttgXr+j9xOz+MIl9aAXdhVsdLtpuij47spr3wHhP
	oiFNRk5+jJKlfQrXTBEqUn2ZGP6BHOFo5zPXwmIznrIvw5LV4kJRgivyTBcLIKcP2G1I4C
	g6EaUm43GYdJ7VH+I5IkZJw/S6qTZq51RC8aJ0SDC8Iwzr16gbEqI2w17H8ooobPKogxQ8
	eXkxHWcDGFL7R9vQx9kUmhtAykgtUQX3buafDqQ0A5OKsiSwUBLg0djxY9Hn3g==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A02040005;
	Wed, 14 Jun 2023 20:34:19 +0000 (UTC)
Date: Wed, 14 Jun 2023 22:34:18 +0200
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
Subject: Re: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
Message-ID: <20230614223418.0d7e355d@bootlin.com>
In-Reply-To: 
 <CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
References: <20230614074904.29085-1-herve.codina@bootlin.com>
	<20230614074904.29085-8-herve.codina@bootlin.com>
	<CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
	<20230614114214.1371485e@bootlin.com>
	<CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SXY5FZLE2LLRY4OHJ3W6ME6V654CIZKG
X-Message-ID-Hash: SXY5FZLE2LLRY4OHJ3W6ME6V654CIZKG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXY5FZLE2LLRY4OHJ3W6ME6V654CIZKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Wed, 14 Jun 2023 14:51:43 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, Jun 14, 2023 at 12:42 PM Herve Codina <herve.codina@bootlin.com> wrote:
> > On Wed, 14 Jun 2023 12:02:57 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > On Wed, Jun 14, 2023 at 10:49 AM Herve Codina <herve.codina@bootlin.com> wrote:  
> 
> ...
> 
> > > > +       typeof(__array[0] + 0) __element = __array[--__len];    \  
> > >
> > > Do we need the ' + 0' part?  
> >
> > Yes.
> >
> > __array can be an array of const items and it is legitimate to get the
> > minimum value from const items.
> >
> > typeof(__array[0]) keeps the const qualifier but we need to assign __element
> > in the loop.
> > One way to drop the const qualifier is to get the type from a rvalue computed
> > from __array[0]. This rvalue has to have the exact same type with only the const
> > dropped.
> > '__array[0] + 0' was a perfect canditate.  
> 
> Seems like this also deserves a comment. But if the series is accepted
> as is, it may be done as a follow up.
> 

Finally not so simple ...
I did some deeper tests and the macros need to be fixed.

I hope this one (with comments added) is correct:
--- 8 ---
/*
 * Do not check the array parameter using __must_be_array().
 * In the following legit use-case where the "array" passed is a simple pointer,
 * __must_be_array() will return a failure.
 * --- 8< ---
 * int *buff
 * ...
 * min = min_array(buff, nb_items);
 * --- 8< ---
 *
 * The first typeof(&(array)[0]) is needed in order to support arrays of both
 * 'int *buff' and 'int buf[N]' types.
 *
 * typeof(__array[0] + 0) used for __element is needed as the array can be an
 * array of const items.
 * In order to discard the const qualifier use an arithmetic operation (rvalue).
 * This arithmetic operation discard the const but also can lead to an integer
 * promotion. For instance, a const s8 __array[0] lead to an int __element due
 * to the promotion.
 * In this case, simple min() or max() operation fails (type mismatch).
 * Use min_t() or max_t() (op_t parameter) enforcing the type in order to avoid
 * the min() or max() failure.
 */
#define __minmax_array(op_t, array, len) ({			\
	typeof(&(array)[0]) __array = (array);			\
	typeof(len) __len = (len);				\
	typeof(__array[0] + 0) __element = __array[--__len];	\
	while (__len--)						\
		__element = op_t(typeof(__array[0]), __element, __array[__len]); \
	__element; })

/**
 * min_array - return minimum of values present in an array
 * @array: array
 * @len: array length
 *
 * Note that @len must not be zero (empty array).
 */
#define min_array(array, len) __minmax_array(min_t, array, len)

/**
 * max_array - return maximum of values present in an array
 * @array: array
 * @len: array length
 *
 * Note that @len must not be zero (empty array).
 */
#define max_array(array, len) __minmax_array(max_t, array, len)

--- 8< ---

Tested ok from user-space on my x86_64 using the following types for *buff
and buff[N]:
- signed/unsigned char
- signed/unsigned short
- signed/unsigned int
- signed/unsigned long
- signed/unsigned long long
- float, double, long double (even if not used in the kernel)

Can you give me your feedback on this last version ?

If you are ok, it will be present in the next iteration of the series.
Otherwise, as a last ressort, I will drop the {min,max}_array() and switch
back to the specific min/max computation in IIO inkern.c

Sorry for this back and forth and this last minute detected bug.

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
