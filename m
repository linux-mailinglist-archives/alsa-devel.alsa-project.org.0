Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7B4124C1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 20:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B254416E0;
	Mon, 20 Sep 2021 20:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B254416E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632162959;
	bh=PbntXU5iwN4FNfylYgH+wqe+tXjabaVNnlQx+2sPsSE=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZsLGlO11vJWL6uDsySf+P/SBpsx+K9LTOMG/ve5IIxVd59sz/PalUor8NOdhK+1F
	 Xw/MbfOons8gRrQ7fpk0BjuzHou4Fw2TI7OskKuRGQBoApjCm2VipPEJ9/NTLO5mUV
	 vs5dA5LzI5ZWEtL6/LNcBi9OPjkfM0Fw1sB/BOHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 651EFF80124;
	Mon, 20 Sep 2021 20:34:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 737EAF8025D; Mon, 20 Sep 2021 20:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=CTE_8BIT_MISMATCH, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D47A1F80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 20:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47A1F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VI49oqqg"
Received: by mail-lf1-x135.google.com with SMTP id m3so69011168lfu.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=yFP2NyBFpB8EmFELidUhNWV4qfTljF+akWqkbNIJ1g0=;
 b=VI49oqqg34Sr2uLRB33pr1fh9V+I1Tfw09XIiUU82ksEVndMNDTefpKKO+b70h8kK/
 shin0onnH62OP6T2d3xMrgkgvSojPnYWUTzxlqFfCbqfDIjhikMQD5CaPou0GsB56uuk
 rp4CQ3fUiadOsNKEcgoZeT25yAV2qh67ZpckoBvB0Fon/McnMINeBgMasdzLkfJ9Q5gH
 2lM2hNXTjOYhPSwF4+dg35B3dIIbDLaNmqKe7cYhcgMzc6vy5O/Nzx1KsvIE9nWdy2CB
 mlVBU5BbjGu5KT5e72SJgpaYdlFjYXC2KCaPgIJDUWWrme/o7+/dkZuACm/mDra9GSch
 l/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=yFP2NyBFpB8EmFELidUhNWV4qfTljF+akWqkbNIJ1g0=;
 b=z991WthQnz1lCx8/lMPFYqXjd4Pu5qL2ADkbTiiNQTBy3cXeRocBujqbiCuM2Gjkvz
 5sf8HfTxz2X17YWrzm9CBOJGowW7TvI/vxCNdOhqlywTc6OG2hKYtHcMPS8c1mciiSM/
 yIAseEUToWIn7y+JahZMzGRGgot68jmtJg+/IQ9vPhGpsk16RvZNQ5UkOjHnxq+a5fAB
 Dmuo5LGre/pqroU+sQ06zCQZpmaCdA9TGu3ko4SyQW1lhN/f9ZcH3aHm40vngshf9DhS
 R1EtKhHr8uIDMTZ1SdROfcCjn/6LbOvp1pNaLTLQTaAOubrTTI2zelnawaF6+UP4HtLX
 OkjQ==
X-Gm-Message-State: AOAM5319ixeBHoI3anYFMQ+wsD+YCLdRuBAwIjzz1TK+ibArS2MTt6Ul
 DCJn3tmGejJzRh6a4hLFHig=
X-Google-Smtp-Source: ABdhPJwvVaXD3XD7Mdjd+vxaDZdVpdqJ/kVIrCgilLyvNEb9rXahhARPkSUSD34Fo8aY7xrAV20a/g==
X-Received: by 2002:a2e:bf18:: with SMTP id c24mr25200081ljr.408.1632162869231; 
 Mon, 20 Sep 2021 11:34:29 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id u7sm271196lft.79.2021.09.20.11.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:34:28 -0700 (PDT)
Message-ID: <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
Date: Mon, 20 Sep 2021 21:37:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Peter Rosin <peda@axentia.se>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
In-Reply-To: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>, Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Peter,

On 9/20/21 17:49, Peter Rosin wrote:
> From 625f858894af2b7e547cc723b97361081438b123 Mon Sep 17 00:00:00 2001
> From: Peter Rosin <peda@axentia.se>
> 
> Commit 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
> breaks the TSE-850 device, which is using a pcm5142 in I2S and
> CBM_CFS mode (maybe not relevant). Without this fix, the result
> is:
> 
> pcm512x 0-004c: Failed to set data format: -16
> 
> And after that, no sound.

Is it possible that on the board the pcm5142 is in hardwired mode (MODE1
and MODE2 pin is pulled low)? If it is and FMT pin is also low then the
codec is in i2s mode.

I can imagine that the codec would ignore a write to AFMT part of I2S_1
register - it is wired for 00b.

> This fix is not 100% correct. The datasheet of at least the pcm5142
> states that four bits (0xcc) in the I2S_1 register are "RSV"
> ("Reserved. Do not access.") and no hint is given as to what the
> initial values are supposed to be. So, specifying defaults for
> these bits is wrong. But perhaps better than a broken driver?

The default of 0x02 (AFMT = 00b - I2S, ALEN = 10b - 24bits) is correct
for I2S_1 and the 0 is the default of I2S_2.

The failure happens when updating the AFMT (bit4-5) and when regmap is
doing a i2c read since the default is not specified.

It would be interesting to see what it is reading... Out of interest:
can you mar the I2S_1 and I2S_2 as volatile and read / print the value
just before the afmt and alen update?

> Fixes: 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Kirill Marinushkin <kmarinushkin@birdec.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Peter Rosin <peda@axentia.se>

The defaults for the two registers are OK, should be safe ;)

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> ---
>  sound/soc/codecs/pcm512x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
> index 4dc844f3c1fc..60dee41816dc 100644
> --- a/sound/soc/codecs/pcm512x.c
> +++ b/sound/soc/codecs/pcm512x.c
> @@ -116,6 +116,8 @@ static const struct reg_default pcm512x_reg_defaults[] = {
>  	{ PCM512x_FS_SPEED_MODE,     0x00 },
>  	{ PCM512x_IDAC_1,            0x01 },
>  	{ PCM512x_IDAC_2,            0x00 },
> +	{ PCM512x_I2S_1,             0x02 },
> +	{ PCM512x_I2S_2,             0x00 },
>  };
>  
>  static bool pcm512x_readable(struct device *dev, unsigned int reg)
> 

-- 
Péter
