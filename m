Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243A713B0C
	for <lists+alsa-devel@lfdr.de>; Sun, 28 May 2023 19:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03211207;
	Sun, 28 May 2023 19:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03211207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685294078;
	bh=/zQ1SXUyOqCH+hELiORFYQYYg54iPtfk4cRc8oDWzVI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jwq5TlKl77SKRaJEJDwfiTrcmd03cZvghPRalQXb/J1e6Xwtu758oJLZLptzoGfsQ
	 dIivryjIIutkcCbzi4gUSh9w+zBmvO9xZmpOh84BzQWRfPtXgQMQWRVw0NR90LY3uQ
	 oGSLlyBzYUShcWnNiGmUAyUcnlKg4yPLZ9r1kThw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71FC0F8042F; Sun, 28 May 2023 19:13:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0697F8026A;
	Sun, 28 May 2023 19:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E6A8F8042F; Sun, 28 May 2023 19:13:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B8B2F800DF
	for <alsa-devel@alsa-project.org>; Sun, 28 May 2023 19:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B8B2F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WGvB5sTc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59A9D60C36;
	Sun, 28 May 2023 17:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E41BC433EF;
	Sun, 28 May 2023 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685294009;
	bh=/zQ1SXUyOqCH+hELiORFYQYYg54iPtfk4cRc8oDWzVI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WGvB5sTcnbN5aoP7Zzp22WKZS+b+CLMBribgneL+QDinJ0mqbJJP2zokEWJgk/XVe
	 8tZ9lg4Ol9fl16AmhWMtz0C1hU92tz/mdbdaoV+nqxEdXdcMTDGd/RypeFRGv3BQ4J
	 pgslLnUMgMnQzCrU/9wlU82HbCPU5vs+MgdX8OewEvJ6VGBKO2UPOvO6c/SGsxoO/5
	 DseTADbmR+Nxh+KlapbxmHYEYe+ibUpwOce1X9NGmzl1o2aIrNqFfzQzZRS/e5Wtzd
	 MUmNMDHlGKD1M/ANRJPkT8jdLMlRXwlN2lUx+08SiZyCpyUiHGCLPY28HmsR7J2UqA
	 Fd3PvKLoHjaxw==
Date: Sun, 28 May 2023 18:29:47 +0100
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
Subject: Re: [PATCH v2 4/9] iio: consumer.h: Fix raw values documentation
 notes
Message-ID: <20230528182947.500eb9aa@jic23-huawei>
In-Reply-To: <20230523151223.109551-5-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-5-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RVVOKFJRJIZNABFA7TGMNS2AQWDOVN62
X-Message-ID-Hash: RVVOKFJRJIZNABFA7TGMNS2AQWDOVN62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVVOKFJRJIZNABFA7TGMNS2AQWDOVN62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 17:12:18 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> The raw values notes mention 'ADC counts' and are not fully accurate.
> 
> Reword the notes in order to remove the 'ADC counts' and describe the
> conversion needed between a raw value and a value in the standard units.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
I'm not 100% sure what path this will take - though hopefully and immutable
branch I can pick up will be involved. On that basis I won't pick this up
now and instead give

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  include/linux/iio/consumer.h | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
> index 6802596b017c..f536820b9cf2 100644
> --- a/include/linux/iio/consumer.h
> +++ b/include/linux/iio/consumer.h
> @@ -201,8 +201,9 @@ struct iio_dev
>   * @chan:		The channel being queried.
>   * @val:		Value read back.
>   *
> - * Note raw reads from iio channels are in adc counts and hence
> - * scale will need to be applied if standard units required.
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   */
>  int iio_read_channel_raw(struct iio_channel *chan,
>  			 int *val);
> @@ -212,8 +213,9 @@ int iio_read_channel_raw(struct iio_channel *chan,
>   * @chan:		The channel being queried.
>   * @val:		Value read back.
>   *
> - * Note raw reads from iio channels are in adc counts and hence
> - * scale will need to be applied if standard units required.
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   *
>   * In opposit to the normal iio_read_channel_raw this function
>   * returns the average of multiple reads.
> @@ -281,8 +283,9 @@ int iio_read_channel_attribute(struct iio_channel *chan, int *val,
>   * @chan:		The channel being queried.
>   * @val:		Value being written.
>   *
> - * Note raw writes to iio channels are in dac counts and hence
> - * scale will need to be applied if standard units required.
> + * Note that for raw writes to iio channels, if the value provided is
> + * in standard units, the affect of the scale and offset must be removed
> + * as (value / scale) - offset.
>   */
>  int iio_write_channel_raw(struct iio_channel *chan, int val);
>  
> @@ -292,8 +295,9 @@ int iio_write_channel_raw(struct iio_channel *chan, int val);
>   * @chan:		The channel being queried.
>   * @val:		Value read back.
>   *
> - * Note raw reads from iio channels are in adc counts and hence
> - * scale will need to be applied if standard units are required.
> + * Note, if standard units are required, raw reads from iio channels
> + * need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   */
>  int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
>  
> @@ -308,8 +312,9 @@ int iio_read_max_channel_raw(struct iio_channel *chan, int *val);
>   * For ranges, three vals are always returned; min, step and max.
>   * For lists, all the possible values are enumerated.
>   *
> - * Note raw available values from iio channels are in adc counts and
> - * hence scale will need to be applied if standard units are required.
> + * Note, if standard units are required, raw available values from iio
> + * channels need the offset (default 0) and scale (default 1) to be applied
> + * as (raw + offset) * scale.
>   */
>  int iio_read_avail_channel_raw(struct iio_channel *chan,
>  			       const int **vals, int *length);

