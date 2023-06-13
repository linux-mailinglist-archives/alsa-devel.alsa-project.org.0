Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1B72DBE2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 10:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1926C1;
	Tue, 13 Jun 2023 10:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1926C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686643267;
	bh=JqE/TaD/GBY8spMsNUb5aTjEhA/IJZydikXXYuJHPlI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sTlNeR3R91FOE3k1W+dfceBm8f3JvvRSjEj9RecbPNJCaZ4Eu/2EfiHQXw51u4tJ0
	 vfNQh3HbkbMMvUsN2GWltd9uOR4m/7iACilN3PF8QPB16jb9XyEz310ymL6c8A9jRR
	 fSMP0mqoq6VoN7DdHDKosUq3uihl1HLNH8warJYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0AFEF80301; Tue, 13 Jun 2023 10:00:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A60F80132;
	Tue, 13 Jun 2023 10:00:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACCCEF80149; Tue, 13 Jun 2023 10:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08FABF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 10:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FABF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oGdpKjgp
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686643208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd/XsfPHYPjYWaY07hPncGtbRCyEuLUp22IAn5v29r4=;
	b=oGdpKjgpNu08N2uUAgpCGHd8N5hAGIMRJCwlpnSNDv0ljGSyOFGfEqivtG8W6LNnRYFmgB
	O2lz/a+CDqHon+Vx+iu2vZyhBOqJRp22Vo7sjM3NVqfFDCjriQW2M0D8tV1wP5ibo6fqmT
	8MxpRpBFvoJg+Nld2DCPm/mHEdYQjwymrgoKqgMUuVLLL5/7ZDyCbjJvy/mPrJWl4Voecg
	8lLV+50gZAslzG68s4CpPEnj8My0R1zOmb9IpazpXumoJbUK1pB12MDb/WZ/5tolCKiWcm
	FDZQ+TKiVBfDhhX6z6H6+vHZKuAx2+814/BZ63VuvsJHcUwAscSMeEfdhKfZFg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C961C0006;
	Tue, 13 Jun 2023 08:00:01 +0000 (UTC)
Date: Tue, 13 Jun 2023 10:00:00 +0200
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
Message-ID: <20230613100000.6bd9e690@bootlin.com>
In-Reply-To: 
 <CAHp75Vf2dmAS9VD-pgyZwVopVCFy8yFjhPWEj8sym=pfE7uxSA@mail.gmail.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
	<20230612122926.107333-7-herve.codina@bootlin.com>
	<CAHp75Vf2dmAS9VD-pgyZwVopVCFy8yFjhPWEj8sym=pfE7uxSA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XLLYFVR2DGOSOGJ5BGKILFL3GMHQBXBR
X-Message-ID-Hash: XLLYFVR2DGOSOGJ5BGKILFL3GMHQBXBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLLYFVR2DGOSOGJ5BGKILFL3GMHQBXBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Mon, 12 Jun 2023 17:10:40 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Jun 12, 2023 at 3:30 PM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Introduce min_array() (resp max_array()) in order to get the
> > minimal (resp maximum) of values present in an array.  
> 
> Some comments below, after addressing them,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  include/linux/minmax.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> > index 396df1121bff..37a211f22404 100644
> > --- a/include/linux/minmax.h
> > +++ b/include/linux/minmax.h
> > @@ -133,6 +133,32 @@
> >   */
> >  #define max_t(type, x, y)      __careful_cmp((type)(x), (type)(y), >)
> >
> > +#define __minmax_array(op, array, len) ({                      \  
> 
> Maybe it's my MUA, maybe the code contains spaces, can you switch to
> TABs if it's the case?
> 
> > +       typeof(array) __array = (array);                        \  
> 
> We have __must_be_array()

Using __must_be_array() will lead to some failure.
Indeed, we can have:
  --- 8< ---
  int *buff
  ...
  min = min_array(buff, nb_item);
  --- 8< ---

In this case, __must_be_array() will report that buff is not an array.

To avoid any confusion, what do you think if I renamed {min,max}_array()
to {min,max}_buffer() and replace __array by __buff and use *(__buff + xxx)
instead of array[xxx] in the macro.

This will lead to:
--- 8< ---
#define __minmax_buffer(op, buff, len) ({			\
	typeof(buff) __buff = (buff);			\
	typeof(len) __len = (len);				\
	typeof(*buff + 0) __element = *(__buff + --__len);	\
	while (__len--)						\
		__element = op(__element, *(__buff + __len]));	\
	__element; })

#define min_buffer(buffer, len) __minmax_array(min, buffer, len)
#define max_buffer(buffer, len) __minmax_array(max, buffer, len)
--- 8< ---

Regards,
Hervé

> 
> You will need to fix the inclusions in minmax.h at the same time, it needs
> linux/build_bug.h (which includes compiler.h needed for __UNIQUE_ID()
> and for the above mentioned one).
> 
> > +       typeof(len) __len = (len);                              \
> > +       typeof(*__array + 0) __element = __array[--__len];      \  
> 
> After above, this can be written as __array[0].
> 
> > +       while (__len--)                                         \
> > +               __element = op(__element, __array[__len]);      \
> > +       __element; })
> > +
> > +/**
> > + * min_array - return minimum of values present in an array
> > + * @array: array
> > + * @len: array length
> > + *
> > + * Note that @len must not be zero (empty array).
> > + */
> > +#define min_array(array, len) __minmax_array(min, array, len)
> > +
> > +/**
> > + * max_array - return maximum of values present in an array
> > + * @array: array
> > + * @len: array length
> > + *
> > + * Note that @len must not be zero (empty array).
> > + */
> > +#define max_array(array, len) __minmax_array(max, array, len)
> > +
> >  /**
> >   * clamp_t - return a value clamped to a given range using a given type
> >   * @type: the type of variable to use  
> 

