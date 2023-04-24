Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F56EC770
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 09:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EEF0F15;
	Mon, 24 Apr 2023 09:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EEF0F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682322722;
	bh=d6iS4jRduy7sGcZmvo0Bq+DlkjkmfHJSSCBJPTFEUCA=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=f5hVxGtGf6OnfCC7sz9qwpCqs1faV0jQyfz7TKzVOYnKoEy9F9ax9eG0omp5zYJg/
	 TxxOeQ+Hdw3I4C2m2eG5yoMjwvuSmHS9M+8BBmdC/zRIP9GHvtvOjilWOsIdNx2dhW
	 Yybn3gorpx5oEZzFEpvzlL0HuFSer9t19EmBXjcU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E04F80162;
	Mon, 24 Apr 2023 09:51:11 +0200 (CEST)
Date: Mon, 24 Apr 2023 09:50:41 +0200
To: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/4] iio: inkern: Add a helper to query an available
 minimum raw value
In-Reply-To: <20230422174916.74ccfe00@jic23-huawei>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
	<20230421124122.324820-3-herve.codina@bootlin.com>
	<20230422174916.74ccfe00@jic23-huawei>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ3OLPB6MZ4CSKTLLD3ZPLO2DTDQ3WW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168232267141.26.18237291498527132561@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FA6BF8018A; Mon, 24 Apr 2023 09:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47D7DF800AC
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 09:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47D7DF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pBVPS/dC
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3660100004;
	Mon, 24 Apr 2023 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682322645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VS1ZKv5KXpYj9fqjt/WtNxB035b/Oax25ToIknOLU6Y=;
	b=pBVPS/dC5L7Ou/jXMcMTmZwxD2YZyMwzdhS0YXV5SEDIObIjJLEVxsa2zfC/y67ftbuo7n
	BB6GoeiKhG/nBqfM+0VlXsjOtzBO1E3im62/2SNfYG0c7lCMmUmdIAhOo1ApoBx9Eh4gON
	9N0oyCD8jNBRdht7wyys81nGFfN7iHxrtYgf2DVVpvaAnYMC/tx5gmtHZzYSF0vm/Gf0Jf
	wQLJdscpQsNCP2ea6iybUys1U/enPO/c84Xm/FlBrU1dmfkEIvpDz2cdKthgmOiVOvOvPj
	z9rsPehZVhmXaFWpDcF5Aii2I6iA1pGnMWi6jisEQBeJUXITIiF0f7IoAODI0g==
Date: Mon, 24 Apr 2023 09:50:41 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/4] iio: inkern: Add a helper to query an available
 minimum raw value
Message-ID: <20230424095041.540be943@bootlin.com>
In-Reply-To: <20230422174916.74ccfe00@jic23-huawei>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
	<20230421124122.324820-3-herve.codina@bootlin.com>
	<20230422174916.74ccfe00@jic23-huawei>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQ3OLPB6MZ4CSKTLLD3ZPLO2DTDQ3WW6
X-Message-ID-Hash: ZQ3OLPB6MZ4CSKTLLD3ZPLO2DTDQ3WW6
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ3OLPB6MZ4CSKTLLD3ZPLO2DTDQ3WW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jonathan,

On Sat, 22 Apr 2023 17:49:16 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 21 Apr 2023 14:41:20 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > A helper, iio_read_max_channel_raw() exists to read the available
> > maximum raw value of a channel but nothing similar exists to read the
> > available minimum raw value.
> > 
> > This new helper, iio_read_min_channel_raw(), fills the hole and can be
> > used for reading the available minimum raw value of a channel.
> > It is fully based on the existing iio_read_max_channel_raw().
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Hi Herve,
> 
> All the comments on this are really comments on the existing code.
> If you don't mind fixing the first one about checking the error code whilst
> you are here that would be great.  Don't worry about the docs comment.
> There are lots of instances of that and the point is rather subtle and probably
> post dates this code being written.  In a few cases raw doesn't mean ADC counts
> but rather something slightly modified... Long story for why!

A next iteration is already planned for this series.
I will fix the 'error checking before switch()' on the iio_channel_read_min()
I introduced and add a new patch (doing the same) on the existing
iio_channel_read_max().


> 
> Jonathan
> 
> > ---
> >  drivers/iio/inkern.c         | 67 ++++++++++++++++++++++++++++++++++++
> >  include/linux/iio/consumer.h | 11 ++++++
> >  2 files changed, 78 insertions(+)
> > 
> > diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> > index 872fd5c24147..914fc69c718a 100644
> > --- a/drivers/iio/inkern.c
> > +++ b/drivers/iio/inkern.c
> > @@ -912,6 +912,73 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val)
> >  }
> >  EXPORT_SYMBOL_GPL(iio_read_max_channel_raw);
> >  
> > +static int iio_channel_read_min(struct iio_channel *chan,
> > +				int *val, int *val2, int *type,
> > +				enum iio_chan_info_enum info)
> > +{
> > +	int unused;
> > +	const int *vals;
> > +	int length;
> > +	int ret;
> > +
> > +	if (!val2)
> > +		val2 = &unused;
> > +
> > +	ret = iio_channel_read_avail(chan, &vals, type, &length, info);  
> Obviously this is copied from *_read_max() but look at it here...
> 
> We should check for an error first with
> if (ret < 0)
> 	return ret;
> then the switch.
> 
> Currently a different positive ret would result in that value
> being returned which would be odd. Not a problem today, but if we add other
> iio_avail_type enum entries in future and don't keep up with all the
> utility functions then a mess may result.
> 
> If you agree with change and wouldn't mind adding another patch to this series
> tidying that up for the _max case that would be great! Otherwise I'll get to
> fixing that at some point but not anytime soon.

I will do in the next iteration.

> 
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
> > +			while (length) {
> > +				if (vals[--length] < *val)
> > +					*val = vals[length];
> > +			}
> > +			break;
> > +		default:
> > +			/* FIXME: learn about min for other iio values */
> > +			return -EINVAL;
> > +		}
> > +		return 0;
> > +
> > +	default:
> > +		return ret;
> > +	}
> > +}
> > +
> > +int iio_read_min_channel_raw(struct iio_channel *chan, int *val)
> > +{
> > +	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
> > +	int ret;
> > +	int type;
> > +
> > +	mutex_lock(&iio_dev_opaque->info_exist_lock);
> > +	if (!chan->indio_dev->info) {
> > +		ret = -ENODEV;
> > +		goto err_unlock;
> > +	}
> > +
> > +	ret = iio_channel_read_min(chan, val, NULL, &type, IIO_CHAN_INFO_RAW);
> > +err_unlock:
> > +	mutex_unlock(&iio_dev_opaque->info_exist_lock);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(iio_read_min_channel_raw);
> > +
> >  int iio_get_channel_type(struct iio_channel *chan, enum iio_chan_type *type)
> >  {
> >  	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(chan->indio_dev);
> > diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> > index 6802596b017c..956120d8b5a3 100644
> > --- a/include/linux/iio/consumer.h
> > +++ b/include/linux/iio/consumer.h
> > @@ -297,6 +297,17 @@ int iio_write_channel_raw(struct iio_channel *chan, int val);
> >   */
> >  int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
> >  
> > +/**
> > + * iio_read_min_channel_raw() - read minimum available raw value from a given
> > + *				channel, i.e. the minimum possible value.
> > + * @chan:		The channel being queried.
> > + * @val:		Value read back.
> > + *
> > + * Note raw reads from iio channels are in adc counts and hence
> > + * scale will need to be applied if standard units are required.  
> 
> Hmm. That comment is almost always true, but not quite.  Not related to
> your patch but some cleanup of this documentation and pushing it down next
> to implementations should be done at some point.  If anyone is really
> bored and wants to take this on that's fine. If not, another one for the
> todo list ;)

If you are ok, I can change every where in consumer.h the following:
  * Note raw reads from iio channels are in adc counts and hence
  * scale will need to be applied if standard units required.
by
  * Note raw reads from iio channels are not in standards units and
  * hence scale will need to be applied if standard units required.

Also the same for raw writes:
  * Note raw writes to iio channels are in dac counts and hence
  * scale will need to be applied if standard units required.
by
  * Note raw writes to iio channels are not in standards units and
  * hence scale will need to be applied if standard units required.

> 
> > + */
> > +int iio_read_min_channel_raw(struct iio_channel *chan, int *val);
> > +
> >  /**
> >   * iio_read_avail_channel_raw() - read available raw values from a given channel
> >   * @chan:		The channel being queried.  
> 

Thanks for the review,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
