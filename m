Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06188905930
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B1EE9F;
	Wed, 12 Jun 2024 18:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B1EE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718211203;
	bh=jRX/qmYoXzdSA82UM/SQtEUSzxcGm6kdQYYm8JfMCZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ftKnXCIZ92vN7YjfA1ReR4iCs27eKT5VShXWBR7PXHXnFmc/ff7nHRzqZu8E6TNpA
	 BGxEj/2NqjyltKTPIRTfDnkER+E84RSO8FtUVfSmd/LbJTrB1BphCscSPOkoWougyZ
	 4m3L4STKL7xgDeu0byzkO4e3DLMpOLksoBh4CH7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E9FFF805BD; Wed, 12 Jun 2024 18:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C334EF805A8;
	Wed, 12 Jun 2024 18:52:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F37F8057A; Wed, 12 Jun 2024 18:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17296F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17296F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J/yrMHAA
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52c815e8e9eso141257e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211154; x=1718815954;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8+8Gla6AFGKe6u8TRpUpXCdyZGzOpD/BKCYPlj+J4g=;
        b=J/yrMHAABlB5ZWiQ/Q7lEN3GQnN2rvr3Hds17EfWECuc37kFgLd4o402FKF9lzNyRl
         LRCB7b7NimMzMAGQvmM20z/GYuZQ5dgLu+FaYGd69JoAgUioUxy4iyB06mg5fQN1Q4+P
         IBeZet/+TTztlfbRm9h4qNWf33L8sqaIQ9K3rPwX7s3b/GChSs10eytTUPj3kYwk5LDo
         xNQ0byvbdT451/B8cgINnKx+GdKuAHezSV5JlhPDfIkk4/CVhTRQ21sIv7hDiMGEgIPB
         Pvnmp0wkMX6h0WiBdL30iXamF5qUw19UznRZI3ZIMj4UELJ80c/4Xik/lXLXXu6wQUdu
         Tn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211154; x=1718815954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8+8Gla6AFGKe6u8TRpUpXCdyZGzOpD/BKCYPlj+J4g=;
        b=W2ZGmKb3hgZyxrpJCP47FxjsWDp/QU/IvGHJBmHQRfHRzX0zvafNLUg9Q8wkMSXFgH
         F6Rm/1HRPZAIThYdeetDM1pkTkX85B3NcR2MrXK6BD8okAFRQ1/uYefSclKg56FMjEEd
         PCd6WcEYR1mhkhC3oyuiy5xeO+wTZH9GL2XgUzfAgS7ffItPub48c7bsTmd2/5tA/DB6
         iz+om6Gm7159R4tJph/P9H6hzPqJR3jJA/KN/d4StD5sEJr9UinB4ZHF20AAfH5uuU35
         DD2B8wmTuUXuhZCSo4rxzkKe2ueF+DbuVyF3u61IerqbIs0m3qH5GiS+7xRKVsoibplC
         SGsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz5M8obiAwwlxu7yfbkN2Nc6ggszQsy5vep0++dLRrefp06EprCG8hsjGmscL6AcCNeMkIlRkx1qgOb084TXxCaXduxww+hkPJFeU=
X-Gm-Message-State: AOJu0YybkUQb++Qix2Nj8dPsuTW/gz2zHrh53gO1/0yo4cdn1ZWR1/sl
	o50kogmdNjs3ojPjzAeQlbwOOSvOaphmh7w0eesNXRTk5GJSAA348L/Z6ErN0HU=
X-Google-Smtp-Source: 
 AGHT+IGcj+8quoP+rn9xJZv2GbaS/NGKXyw6z9f4EKby7freNcstjI0Qc26l47+qfOvgAnsTfTdQ9Q==
X-Received: by 2002:ac2:562a:0:b0:52c:831d:7eb3 with SMTP id
 2adb3069b0e04-52c9a3c74b7mr1518949e87.18.1718211154244;
        Wed, 12 Jun 2024 09:52:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb423db7dsm2552326e87.224.2024.06.12.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:52:33 -0700 (PDT)
Date: Wed, 12 Jun 2024 19:52:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org, neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.5
 codec version
Message-ID: <mpm4pmt5ieofmpxmq5putvytyuiepbmnv5flsfqiwbtc54sb6k@jpoeaeojzzis>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
 <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
 <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
Message-ID-Hash: XV2GE2GGF34EBDNAETH7TBVJE5G6UOYZ
X-Message-ID-Hash: XV2GE2GGF34EBDNAETH7TBVJE5G6UOYZ
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XV2GE2GGF34EBDNAETH7TBVJE5G6UOYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 12, 2024 at 03:37:56PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 07/06/2024 12:03, Dmitry Baryshkov wrote:
> > On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > LPASS Codec v2.5 has significant changes in the rx register offsets.
> > > Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
> > > after SM8450 have only Left working.
> > > 
> > > This patch adjusts the registers to accomdate 2.5 changes. With this
> > > fixed now L and R are functional on Headset playback.
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > >   sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
> > >   1 file changed, 410 insertions(+), 155 deletions(-)
> > > 
> > > diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> > > index f35187d69cac..bb8ede0e7076 100644
> > > --- a/sound/soc/codecs/lpass-rx-macro.c
> > > +++ b/sound/soc/codecs/lpass-rx-macro.c
> > >   static int rx_macro_probe(struct platform_device *pdev)
> > >   {
> > > +	struct reg_default *reg_defaults;
> > >   	struct device *dev = &pdev->dev;
> > >   	kernel_ulong_t flags;
> > >   	struct rx_macro *rx;
> > >   	void __iomem *base;
> > > -	int ret;
> > > +	int ret, def_count;
> > >   	flags = (kernel_ulong_t)device_get_match_data(dev);
> > > @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
> > >   		goto err;
> > >   	}
> > > +	rx->codec_version = lpass_macro_get_codec_version();
> > 
> > What guarantees that VA macro has been probed already? If I'm not
> > mistaken, we might easily get a default '0' here instead of a correct
> > version.
> 
> fsgen(Frame sync gen) clk is derived from VA macro, so if we are here that
> means the va macro is probed.

Is this written in stone or is it just a current way how these codecs
are connected?

> > > +	switch (rx->codec_version) {
> > > +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
> > > +		rx->rxn_reg_offset = 0xc0;
> > > +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> > > +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> > > +		if (!reg_defaults)
> > > +			return -ENOMEM;
> > > +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> > > +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> > > +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
> > > +		break;
> > > +	default:
> > > +		rx->rxn_reg_offset = 0x80;
> > > +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> > > +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> > > +		if (!reg_defaults)
> > > +			return -ENOMEM;
> > > +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> > > +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> > > +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> > > +		break;
> > > +	}
> > > +
> > > +	rx_regmap_config.reg_defaults = reg_defaults,
> > > +	rx_regmap_config.num_reg_defaults = def_count;
> > > +
> > >   	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> > >   	if (IS_ERR(rx->regmap)) {
> > >   		ret = PTR_ERR(rx->regmap);
> > > @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto err_clkout;
> > > +	kfree(reg_defaults);
> > >   	return 0;
> > >   err_clkout:
> > > @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
> > >   err_dcodec:
> > >   	clk_disable_unprepare(rx->macro);
> > >   err:
> > > +	kfree(reg_defaults);
> > >   	lpass_macro_pds_exit(rx->pds);
> > >   	return ret;
> > > -- 
> > > 2.21.0
> > > 
> > 

-- 
With best wishes
Dmitry
