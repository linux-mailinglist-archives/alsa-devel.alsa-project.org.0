Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD2721FFA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 233B184C;
	Mon,  5 Jun 2023 09:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 233B184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685951260;
	bh=LKQNUW+xm5RfFrRtZtLBPHLjPJp6GmvNBTwtxl3RW4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DF+vuxHQno00q4b+IJH01LsULbXZHoQrp0qr6YfF7q+3BYqYDS+OArES4mPB4SGmW
	 Fv6F7+scp3pAkjiLwxid8pc8s0epXZY2qq0nNOk6qeMUtB7WGnN3PN+CR3bTDgTxqF
	 T9c3u9QHQHxICMHUuTK4cYCoaqfX5NxyXs8S6L6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A235CF80551; Mon,  5 Jun 2023 09:46:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18AE0F8016C;
	Mon,  5 Jun 2023 09:46:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D978BF804DA; Mon,  5 Jun 2023 09:46:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6D9FF8016C
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D9FF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oKYSHjAT
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685951201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlBav5nmnLSs3742Oa+RNb+C2ZOGfMv2RNAb/qlmli0=;
	b=oKYSHjATjHe/mpW5BUc7jaaWak/2Cl2sDlR/4Ife5K5BaNWsG9z9+auIvUR1zSXAwn0Rlb
	RSfKmu9pNwmD5wO9asXH57ydw3X6eihak9sl3swCRPRJEAvx9jARuGhEZAIwIAYP+6M4JP
	HRs5zrys2q1PS+q4WZsJN02PIB3NvPC8UMQsIC6vWg5DBlkBkEGDnv8iTcaUctTKKPb52y
	egmdoFHIco10kAUYMkDMRWv9WGZRdMzw3DmPBTZ2ACB1C47iy0c7JP+ZCMFUk+rMk81ZLO
	zfcdFiV0S46qH/TM/he8icXthfqHhVEqBot6X6KuVNG/Km5DXXLmR1JB189f9A==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4982000D;
	Mon,  5 Jun 2023 07:46:38 +0000 (UTC)
Date: Mon, 5 Jun 2023 09:46:37 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: andy.shevchenko@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/9] iio: inkern: Add a helper to query an available
 minimum raw value
Message-ID: <20230605094637.7615b689@bootlin.com>
In-Reply-To: <ZHtIdTZbULl6t4RT@surfacebook>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-6-herve.codina@bootlin.com>
	<ZHtIdTZbULl6t4RT@surfacebook>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M6LPK3RAZEZUXRDRD5XXKDOQ5HZ4POIL
X-Message-ID-Hash: M6LPK3RAZEZUXRDRD5XXKDOQ5HZ4POIL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6LPK3RAZEZUXRDRD5XXKDOQ5HZ4POIL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 3 Jun 2023 17:04:37 +0300
andy.shevchenko@gmail.com wrote:

> Tue, May 23, 2023 at 05:12:19PM +0200, Herve Codina kirjoitti:
> > A helper, iio_read_max_channel_raw() exists to read the available
> > maximum raw value of a channel but nothing similar exists to read the
> > available minimum raw value.
> > 
> > This new helper, iio_read_min_channel_raw(), fills the hole and can be
> > used for reading the available minimum raw value of a channel.
> > It is fully based on the existing iio_read_max_channel_raw().  
> 
> ...
> 
> > +static int iio_channel_read_min(struct iio_channel *chan,
> > +				int *val, int *val2, int *type,
> > +				enum iio_chan_info_enum info)
> > +{
> > +	int unused;
> > +	const int *vals;
> > +	int length;
> > +	int ret;  
> 
> > +	if (!val2)
> > +		val2 = &unused;  
> 
> It's a single place, where this is used, can you move it there?

I will do that in the next iteration.
Also, I will do the same modification in iio_channel_read_max() as it has
exactly the same code.

> 
> > +	ret = iio_channel_read_avail(chan, &vals, type, &length, info);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	switch (ret) {
> > +	case IIO_AVAIL_RANGE:
> > +		switch (*type) {
> > +		case IIO_VAL_INT:
> > +			*val = vals[0];
> > +			break;
> > +		default:
> > +			*val = vals[0];
> > +			*val2 = vals[1];
> > +		}
> > +		return 0;
> > +
> > +	case IIO_AVAIL_LIST:
> > +		if (length <= 0)
> > +			return -EINVAL;
> > +		switch (*type) {
> > +		case IIO_VAL_INT:
> > +			*val = vals[--length];  
> 
> > +			while (length) {  
> 
> 			while (length--) {
> 
> will do the job and at the same time...
> 
> 
> > +				if (vals[--length] < *val)
> > +					*val = vals[length];  
> 
> ...this construction becomes less confusing (easier to parse).

Indeed, I will change in the next iteration.

> 
> > +			}
> > +			break;
> > +		default:
> > +			/* FIXME: learn about min for other iio values */  
> 
> I believe in a final version this comment won't be here.

We have the same FIXME comment in the iio_channel_read_max() function I
copied to create this iio_channel_read_min() and, to be honest, I
don't really know how to handle these other cases.

In this series, I would prefer to keep this FIXME.

> 
> > +			return -EINVAL;
> > +		}
> > +		return 0;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}  
> 

Thanks for the review,
Hervé
