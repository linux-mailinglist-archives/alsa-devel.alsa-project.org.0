Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBE7342CA
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 19:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD4782A;
	Sat, 17 Jun 2023 19:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD4782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687024010;
	bh=NvqkckyTq/+5qM6veCJTPQdMzU7jUyjKPhKFnUIEIuc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CnpV+Aj9L+/EQAsGSkD+GAH6kXHl2OfNSAeQe80D1Cx1f3dD2fthrLtlpslYvDBEO
	 E3FavEeYz8qf9Nd3jFRR7SnWzrIEYlFwQqUp9SBM3nAvCJ15SMeqEzwf8On/p2fNEP
	 MgZXWzxOf8K16Bq77OwKK8dqr69FfQ+CZ5XFTME8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22CAFF80533; Sat, 17 Jun 2023 19:46:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFD6F80132;
	Sat, 17 Jun 2023 19:45:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E80AFF80149; Sat, 17 Jun 2023 19:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F072F800ED
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 19:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F072F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i2qDGBUK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 376FB60AEA;
	Sat, 17 Jun 2023 17:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D29C433C0;
	Sat, 17 Jun 2023 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687023952;
	bh=NvqkckyTq/+5qM6veCJTPQdMzU7jUyjKPhKFnUIEIuc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i2qDGBUKf8A/EYY6YGYC5Qnu61Siu35yExeXgyX07skOaJPbYoSXL+bjLLduQ4rJC
	 fVsrnqlJSJvLmqNJiTt7Tp0pRxXGBGnFzvXV0VSyBTKPxu80jEyyxBoOgGBKAd7ytB
	 i/D1ofMUxDgrW4G8dkECUWXAeXR0qQmqHj8k6bzkn3XUswtfgvZaE2C1MLFuVNT6QD
	 PS/Glh/AYfn9z9q6qzXP5bQap049WvAOfZsdOvgDUJz03SjLEiD9I5tLrHzxHFAp/y
	 O1754VfsU5GyIk8NyGpb4hYASZBOIVYj/HhFfe+u9dtwEIepVh9jqmvV0dxxBjbccn
	 XaOj+3nmBFh1Q==
Date: Sat, 17 Jun 2023 18:45:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 08/13] iio: inkern: Use max_array() to get the
 maximum value from an array
Message-ID: <20230617184542.36865dc2@jic23-huawei>
In-Reply-To: <20230615152631.224529-9-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-9-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NZQ3LSCC3MRD6XYZ5OYXVKBC3UKNO77Q
X-Message-ID-Hash: NZQ3LSCC3MRD6XYZ5OYXVKBC3UKNO77Q
X-MailFrom: jic23@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZQ3LSCC3MRD6XYZ5OYXVKBC3UKNO77Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 17:26:26 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Use max_array() to get the maximum value from an array instead of a
> custom local loop.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/inkern.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 71d0424383b6..8bfd91f74101 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/minmax.h>
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> @@ -875,11 +876,7 @@ static int iio_channel_read_max(struct iio_channel *chan,
>  			return -EINVAL;
>  		switch (*type) {
>  		case IIO_VAL_INT:
> -			*val = vals[--length];
> -			while (length) {
> -				if (vals[--length] > *val)
> -					*val = vals[length];
> -			}
> +			*val = max_array(vals, length);
>  			break;
>  		default:
>  			/* FIXME: learn about max for other iio values */

