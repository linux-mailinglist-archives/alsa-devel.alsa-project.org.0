Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B972C7FB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45347825;
	Mon, 12 Jun 2023 16:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45347825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686579489;
	bh=NARaiVA4T41+JjfcOKKNXSTeOqnRZmOe8+H6un1ZDMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Myf6n2H5gUS0mZTEL/Of3OY4+NG66FJtAbVG7ZxMYvSBO7/kzLMqO2Gy5I5zwi8Uv
	 nAqPAeL/ic2YOBfGwZJD+gzgkR68VJtZIXX1Teb6mZCVw73hmACa6hUcMzuJyNzrGv
	 Bp4bEdvI1sXl+Snu/uppHtOBG7P3N8ohDNziaThM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A104F8052E; Mon, 12 Jun 2023 16:16:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7336FF80548;
	Mon, 12 Jun 2023 16:16:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E31BF80549; Mon, 12 Jun 2023 16:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61DD1F8052E
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DD1F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Uj9AfVA1
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-39ce64700cbso388936b6e.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579399; x=1689171399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VEkBjys1JNVdNZfskXkYECCvShc9qH26Dgn/H0N3vs=;
        b=Uj9AfVA1qOfYt+IYgv7JyhRQiztGfZJq/b77C1vLjxcxpV0ZZb0xXPpyCcgmr3rP01
         308vlkGg4D+NDewv2y4EbHjYvU2TPDsQHtGhNzLMM2k0/wbVgzZJdb/P+qfqoXH1Yu8b
         crYeZ8nDXFAMvvcp2JFAGZPcdWbCfxRMQpGyp/rvALoAOGoUXr10Y3j+f3g652/25fS+
         eXuJmjtJLO6mWjoKaDcoJKdcY1vmActXWMOWxryw1W5P4Taym0deMICrFkmW8qurlzMB
         YL9MwaR/Mms7RPhzBxUSDQb3vVjNG4t3ffr+eiRn8qh/lY2Ndhm9aMRGdjQUtSAUZkYV
         UtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579399; x=1689171399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VEkBjys1JNVdNZfskXkYECCvShc9qH26Dgn/H0N3vs=;
        b=KIW1/XOf2JIV/PkI8CYuW4fq/3houRZxVTrRnmC9kg1dFPLk/x63p4MbkWTul9Yrmq
         fQ7V1Wvfg1tVWW1Xb4M+qgOs1cUl3nn+at+0TOYk+SH1MRlRCsfhU1oWKJJm1FHUXcTQ
         cSRlcZtIscE8jv+G7o8Sa7LvA/x8uGL9MF3VfM9cD+UybI7DeCrQFCasH2tA90S3TXQQ
         M2QgjZISn8U3U4rgPbRAB/KtI1C2P9cOsXjxqhVNpn1eO/HZFxecfal2T5zCFLQj8ObZ
         oTn/pM8rOeCwFw83XWa/aZpDttB43rS0Um3Ko6ARlsgF8fU9y3458OIXVnUrE7lYimoO
         54mw==
X-Gm-Message-State: AC+VfDxwPUIeSXaL/qcwxOUlQRto4kEQd8Ih38Sgti60ZbcyVbfIwa5B
	g03tRR4D3M8uDtye9RGBqQW2ObbJv0mIWlIrA0U=
X-Google-Smtp-Source: 
 ACHHUZ7tnRv1PT2hgZe9Ed4LlXXelujAAz16F3OmF4PLIVGBz2ZDarjhCzlaeEmxKrQhkfRrnE2Fyj2E03bmcW8JeNE=
X-Received: by 2002:a05:6808:b32:b0:396:3b9d:7ee0 with SMTP id
 t18-20020a0568080b3200b003963b9d7ee0mr4445651oij.41.1686579398638; Mon, 12
 Jun 2023 07:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-5-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-5-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:16:02 +0300
Message-ID: 
 <CAHp75Vcwaouw0VZp1-5YTso6wPBqn0AQk7UcK1XcHMR7PYCVng@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] iio: consumer.h: Fix raw values documentation
 notes
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BB2M6LF6SE5PMZL3KB3R5VCJGYYRMS3Z
X-Message-ID-Hash: BB2M6LF6SE5PMZL3KB3R5VCJGYYRMS3Z
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BB2M6LF6SE5PMZL3KB3R5VCJGYYRMS3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 3:30=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> The raw values notes mention 'ADC counts' and are not fully accurate.
>
> Reword the notes in order to remove the 'ADC counts' and describe the
> conversion needed between a raw value and a value in the standard units.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  include/linux/iio/consumer.h | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> index 6802596b017c..f536820b9cf2 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -201,8 +201,9 @@ struct iio_dev
>   * @chan:              The channel being queried.
>   * @val:               Value read back.
>   *
> - * Note raw reads from iio channels are in adc counts and hence
> - * scale will need to be applied if standard units required.
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   */
>  int iio_read_channel_raw(struct iio_channel *chan,
>                          int *val);
> @@ -212,8 +213,9 @@ int iio_read_channel_raw(struct iio_channel *chan,
>   * @chan:              The channel being queried.
>   * @val:               Value read back.
>   *
> - * Note raw reads from iio channels are in adc counts and hence
> - * scale will need to be applied if standard units required.
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   *
>   * In opposit to the normal iio_read_channel_raw this function
>   * returns the average of multiple reads.
> @@ -281,8 +283,9 @@ int iio_read_channel_attribute(struct iio_channel *ch=
an, int *val,
>   * @chan:              The channel being queried.
>   * @val:               Value being written.
>   *
> - * Note raw writes to iio channels are in dac counts and hence
> - * scale will need to be applied if standard units required.
> + * Note that for raw writes to iio channels, if the value provided is
> + * in standard units, the affect of the scale and offset must be removed
> + * as (value / scale) - offset.
>   */
>  int iio_write_channel_raw(struct iio_channel *chan, int val);
>
> @@ -292,8 +295,9 @@ int iio_write_channel_raw(struct iio_channel *chan, i=
nt val);
>   * @chan:              The channel being queried.
>   * @val:               Value read back.
>   *
> - * Note raw reads from iio channels are in adc counts and hence
> - * scale will need to be applied if standard units are required.
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   */
>  int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
>
> @@ -308,8 +312,9 @@ int iio_read_max_channel_raw(struct iio_channel *chan=
, int *val);
>   * For ranges, three vals are always returned; min, step and max.
>   * For lists, all the possible values are enumerated.
>   *
> - * Note raw available values from iio channels are in adc counts and
> - * hence scale will need to be applied if standard units are required.
> + * Note, if standard units are required, raw available values from iio
> + * channels need the offset (default 0) and scale (default 1) to be appl=
ied
> + * as (raw + offset) * scale.
>   */
>  int iio_read_avail_channel_raw(struct iio_channel *chan,
>                                const int **vals, int *length);
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
