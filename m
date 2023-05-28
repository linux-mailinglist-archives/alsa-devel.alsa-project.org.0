Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33110713B16
	for <lists+alsa-devel@lfdr.de>; Sun, 28 May 2023 19:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FBD204;
	Sun, 28 May 2023 19:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FBD204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685294273;
	bh=YjPMJglYziMf65WnCe3v/F6xmPWGu2CM6tFPiWOwMdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuMQalfdwmC/dnl8q9I9QzMXpRM6AGY38ENQvxerbdbHbCZPlUMIZjR+RfyrQaYZT
	 cjzmyHWLuzTSxjlx0smMnCjTNgUsXS9aysNI09ooRtPMhIUtK5UhAydEg9Y5M6ARzA
	 oyjGn5PXWdJduCubO/xmeRAptpIajZpXhfqelNt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FCACF8053D; Sun, 28 May 2023 19:17:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3F9F8026A;
	Sun, 28 May 2023 19:17:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF02CF80542; Sun, 28 May 2023 19:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 476A8F8042F
	for <alsa-devel@alsa-project.org>; Sun, 28 May 2023 19:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476A8F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EKRLHW3q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4C6760DE8;
	Sun, 28 May 2023 17:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB12C433EF;
	Sun, 28 May 2023 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685294215;
	bh=YjPMJglYziMf65WnCe3v/F6xmPWGu2CM6tFPiWOwMdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EKRLHW3q/j9L49ezWa6jrqYs14FpKHUBwPyZR/0vr9g0xC2PS+r663M0BjwzdIiUG
	 mtB0+6N3uHaTPuLVX0KLveNcBkkIxQn9GGqamqu34zGFbl8tTue8iGbVWZEwLbz1Lz
	 NSyF4joAxDpoWYmPEe9s95NKrZMwMFteLm3uMMGnL30+fa1zV4eRgkUWRv95HCMqFb
	 CE7A/OMeHuOW2wxGUpSjcaIF+DMwL/i29Q7y/2fkozA2yYSV99JO5BbY6a1FrYiBK6
	 3BqIUtTKlI5lczrfW6ghM+m1E8U1t37E7tJUFCOGB4ithC4bW8XAwz4TixEfTd+zVR
	 2er2nkabmHjQw==
Date: Sun, 28 May 2023 18:33:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/9] iio: inkern: Add a helper to query an available
 minimum raw value
Message-ID: <20230528183313.44d7cbf5@jic23-huawei>
In-Reply-To: <20230523151223.109551-6-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-6-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 56IWF7KE4UMFKXW4YQCIJ57PPFVY6SHV
X-Message-ID-Hash: 56IWF7KE4UMFKXW4YQCIJ57PPFVY6SHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56IWF7KE4UMFKXW4YQCIJ57PPFVY6SHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 17:12:19 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> A helper, iio_read_max_channel_raw() exists to read the available
> maximum raw value of a channel but nothing similar exists to read the
> available minimum raw value.
> 
> This new helper, iio_read_min_channel_raw(), fills the hole and can be
> used for reading the available minimum raw value of a channel.
> It is fully based on the existing iio_read_max_channel_raw().
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/inkern.c         | 70 ++++++++++++++++++++++++++++++++++++
>  include/linux/iio/consumer.h | 12 +++++++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index f738db9a0c04..07b26ff8a334 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -915,6 +915,76 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val)
>  }
>  EXPORT_SYMBOL_GPL(iio_read_max_channel_raw);
>  
> +static int iio_channel_read_min(struct iio_channel *chan,
> +				int *val, int *val2, int *type,
> +				enum iio_chan_info_enum info)
> +{
> +	int unused;
> +	const int *vals;
> +	int length;
> +	int ret;
> +
> +	if (!val2)
> +		val2 = &unused;
> +
> +	ret = iio_channel_read_avail(chan, &vals, type, &length, info);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (ret) {
> +	case IIO_AVAIL_RANGE:
> +		switch (*type) {
> +		case IIO_VAL_INT:
> +			*val = vals[0];
> +			break;
> +		default:
> +			*val = vals[0];
> +			*val2 = vals[1];
> +		}
> +		return 0;
> +
> +	case IIO_AVAIL_LIST:
> +		if (length <= 0)
> +			return -EINVAL;
> +		switch (*type) {
> +		case IIO_VAL_INT:
> +			*val = vals[--length];
> +			while (length) {
> +				if (vals[--length] < *val)
> +					*val = vals[length];
> +			}
> +			break;
> +		default:
> +			/* FIXME: learn about min for other iio values */
> +			return -EINVAL;
> +		}
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +int iio_read_min_channel_raw(struct iio_channel *chan, int *val)
> +{
> +	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
> +	int ret;
> +	int type;
> +
> +	mutex_lock(&iio_dev_opaque->info_exist_lock);
> +	if (!chan->indio_dev->info) {
> +		ret = -ENODEV;
> +		goto err_unlock;
> +	}
> +
> +	ret = iio_channel_read_min(chan, val, NULL, &type, IIO_CHAN_INFO_RAW);
> +err_unlock:
> +	mutex_unlock(&iio_dev_opaque->info_exist_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(iio_read_min_channel_raw);
> +
>  int iio_get_channel_type(struct iio_channel *chan, enum iio_chan_type *type)
>  {
>  	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
> diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> index f536820b9cf2..e9910b41d48e 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -301,6 +301,18 @@ int iio_write_channel_raw(struct iio_channel *chan, int val);
>   */
>  int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
>  
> +/**
> + * iio_read_min_channel_raw() - read minimum available raw value from a given
> + *				channel, i.e. the minimum possible value.
> + * @chan:		The channel being queried.
> + * @val:		Value read back.
> + *
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
> + */
> +int iio_read_min_channel_raw(struct iio_channel *chan, int *val);
> +
>  /**
>   * iio_read_avail_channel_raw() - read available raw values from a given channel
>   * @chan:		The channel being queried.

