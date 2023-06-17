Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590717342CF
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 19:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF2283A;
	Sat, 17 Jun 2023 19:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF2283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687024142;
	bh=IHdwfHK0PIHdT6sRIBMZ+pl+E3iGvohvnGNDeerVS0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IrwSo+R0aXHMrnOvpJmdKrSffkgyYyvvThuLDFXSz//Sc/Q6MKABuDNht265QYm82
	 xJ6E2z6gVVSc4bLvux9ZHyt2997KD7qLHINWZ6JX3MumOUj78obLiHLnosRmsKPr8g
	 X/HeKa4nkVzhlHon8pubJ+aaMJUQ34f1aGJRADcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79DBFF80548; Sat, 17 Jun 2023 19:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC09F80132;
	Sat, 17 Jun 2023 19:48:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF3EAF80149; Sat, 17 Jun 2023 19:48:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0017DF800ED
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 19:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0017DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OJI4jCoj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 849EE60D57;
	Sat, 17 Jun 2023 17:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6480C433C8;
	Sat, 17 Jun 2023 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687024081;
	bh=IHdwfHK0PIHdT6sRIBMZ+pl+E3iGvohvnGNDeerVS0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OJI4jCojPHUcv9UMm0jxBAW7UhMnq4GgXUrDyEwvxZ7Wkslw4Sv5BxyNCKv+GlB0C
	 l/vnmM+wzBQ5QGIfzXOC8z+mCXRHnOzF0PzDYUxGV7+vkRFZTxg301cjCcIuxBHw73
	 vcVKOTJfoovwKri18xcyE6nZYbySwd+DURzdMAtoNPROyFFsrD45gJJ8Wyeu8+s0eO
	 NSf0hIsJruIYkTlv7IjFNLjqizFY4liGcVDkdJzD/B31JWvzWgFrc7Qpv2SfcD/FcF
	 jHUzmcoEtwhfu+5uN3cpYJ3502xCNZC3Wa4PtpyXXj8uugwX/OTtSyjkJD/5eqccg7
	 G9qoQ6KJUollA==
Date: Sat, 17 Jun 2023 18:47:56 +0100
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
Subject: Re: [PATCH v5 10/13] iio: inkern: Add a helper to query an
 available minimum raw value
Message-ID: <20230617184756.4062daa9@jic23-huawei>
In-Reply-To: <20230615152631.224529-11-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-11-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BJWDP2K2VUIT6KBRXCL7ZXGFV3PZUTHZ
X-Message-ID-Hash: BJWDP2K2VUIT6KBRXCL7ZXGFV3PZUTHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJWDP2K2VUIT6KBRXCL7ZXGFV3PZUTHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 17:26:28 +0200
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
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
LGTM
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/inkern.c         | 63 ++++++++++++++++++++++++++++++++++++
>  include/linux/iio/consumer.h | 12 +++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 19ddd77adb11..7a1f6713318a 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -909,6 +909,69 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val)
>  }
>  EXPORT_SYMBOL_GPL(iio_read_max_channel_raw);
>  
> +static int iio_channel_read_min(struct iio_channel *chan,
> +				int *val, int *val2, int *type,
> +				enum iio_chan_info_enum info)
> +{
> +	const int *vals;
> +	int length;
> +	int ret;
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
> +			if (val2)
> +				*val2 = vals[1];
> +		}
> +		return 0;
> +
> +	case IIO_AVAIL_LIST:
> +		if (length <= 0)
> +			return -EINVAL;
> +		switch (*type) {
> +		case IIO_VAL_INT:
> +			*val = min_array(vals, length);
> +			break;
> +		default:
> +			/* TODO: learn about min for other iio values */
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

