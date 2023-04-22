Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C96EBA5C
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3690F02;
	Sat, 22 Apr 2023 18:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3690F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682181288;
	bh=wKfdeMGrhxc157gH7YIVMHP6ex5KAzQsJv+egMR2oxU=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WnPJhbGMRF6aUUy/lMGJoEDLrLjurxen2srAi1v7EKWSZSujO/dq+tb4SzmnVAZhd
	 XTr8v8obPvFeHCIbz55Cc0QuwdHqLXTya4ZjuTs7WDWdjGiLknY4ESEjN/dUQlpdL+
	 Y596ftQemKwSzWGTlpWX3YmhuL3vWK/rW8H+8gjs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE687F80149;
	Sat, 22 Apr 2023 18:33:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 028AAF80155; Sat, 22 Apr 2023 18:33:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E94ACF80053
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E94ACF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=npEcdtbh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D231619C5;
	Sat, 22 Apr 2023 16:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19CAC433EF;
	Sat, 22 Apr 2023 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682181221;
	bh=wKfdeMGrhxc157gH7YIVMHP6ex5KAzQsJv+egMR2oxU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=npEcdtbhzzWYIK9wEklVlgxZMps2zlwq0VFXUskQkDLbfsUqkryKnc/PvpcpMKOqC
	 /c7046iSNe7BW/gkEidj41OUI6RIkwawzjgiwQ9NIh/D/g6guhhnRF7EC2kKBiuyLi
	 5CtuCPsqBgTJyBGILka9q7BgNKITkZ6HoQPGrSMBxR4QVw8LjYSjvNwn07xl2R90Qq
	 v9fsCF9uU2AnqLIYJL+eV/MgpnLpNX++43Lafg+zxWCXSoU6Ja00ay2vJ8VgUFEjL0
	 bUlFl+c9yPxEtv20mZeM8ZeAj7Rw3ydbJm6vM/4WqP0FR6mNGXZX4X2hwpn1lV9Fj2
	 J66N+OCbLWJ4g==
Date: Sat, 22 Apr 2023 17:49:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 2/4] iio: inkern: Add a helper to query an available
 minimum raw value
Message-ID: <20230422174916.74ccfe00@jic23-huawei>
In-Reply-To: <20230421124122.324820-3-herve.codina@bootlin.com>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
	<20230421124122.324820-3-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3XNLG7NWZSLY3G3HC7X4LYYVQY4EUIIX
X-Message-ID-Hash: 3XNLG7NWZSLY3G3HC7X4LYYVQY4EUIIX
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XNLG7NWZSLY3G3HC7X4LYYVQY4EUIIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Apr 2023 14:41:20 +0200
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

Hi Herve,

All the comments on this are really comments on the existing code.
If you don't mind fixing the first one about checking the error code whilst
you are here that would be great.  Don't worry about the docs comment.
There are lots of instances of that and the point is rather subtle and probably
post dates this code being written.  In a few cases raw doesn't mean ADC counts
but rather something slightly modified... Long story for why!

Jonathan

> ---
>  drivers/iio/inkern.c         | 67 ++++++++++++++++++++++++++++++++++++
>  include/linux/iio/consumer.h | 11 ++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index 872fd5c24147..914fc69c718a 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -912,6 +912,73 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val)
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
Obviously this is copied from *_read_max() but look at it here...

We should check for an error first with
if (ret < 0)
	return ret;
then the switch.

Currently a different positive ret would result in that value
being returned which would be odd. Not a problem today, but if we add other
iio_avail_type enum entries in future and don't keep up with all the
utility functions then a mess may result.

If you agree with change and wouldn't mind adding another patch to this series
tidying that up for the _max case that would be great! Otherwise I'll get to
fixing that at some point but not anytime soon.

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
> +		return ret;
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
> index 6802596b017c..956120d8b5a3 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -297,6 +297,17 @@ int iio_write_channel_raw(struct iio_channel *chan, int val);
>   */
>  int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
>  
> +/**
> + * iio_read_min_channel_raw() - read minimum available raw value from a given
> + *				channel, i.e. the minimum possible value.
> + * @chan:		The channel being queried.
> + * @val:		Value read back.
> + *
> + * Note raw reads from iio channels are in adc counts and hence
> + * scale will need to be applied if standard units are required.

Hmm. That comment is almost always true, but not quite.  Not related to
your patch but some cleanup of this documentation and pushing it down next
to implementations should be done at some point.  If anyone is really
bored and wants to take this on that's fine. If not, another one for the
todo list ;)

> + */
> +int iio_read_min_channel_raw(struct iio_channel *chan, int *val);
> +
>  /**
>   * iio_read_avail_channel_raw() - read available raw values from a given channel
>   * @chan:		The channel being queried.

