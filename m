Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B21BD167AFF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 11:43:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5212B16C7;
	Fri, 21 Feb 2020 11:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5212B16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582281823;
	bh=/GRIcnb9zj49gp0oJgF7t0eH/AshJJlv+8GwAgKIwBw=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NqkVYd4YzsnXWhe/hSmo8zw1Uyp9m0rRYI1wZw0PHGJlB4PeZzvNeo/sfPjseS/ig
	 VLb87XhCW5GVt15pD+h38vZPpiJScdr3CDl5oXpkleplZWGrtKWCAi1yWORtCTsUtB
	 KhWK7mJNT9guPpue4EAvCnKKxhR/ZQZfhX3ESeBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEF20F8011D;
	Fri, 21 Feb 2020 11:41:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF105F80277; Fri, 21 Feb 2020 11:41:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E635EF8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 11:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E635EF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="YfODzCNo"
Received: by mail-wr1-x444.google.com with SMTP id t3so1435532wru.7
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=vbdL14wqd+TXUD1iwQ6ZI35nUpnOaOq+sk6GuqOnbiE=;
 b=YfODzCNoQjL+RoLE6G4sgkjuvQVwbC1wGb/3uuoOAX+cZ+vm57ycU5Sc+QVisCixDa
 r/040sq+Uk40zYsNSm7wFoNnJHRoPnIhcpT1S7SEwyrPUvhwNbdZ9P+8GT4CZx42KErf
 X9XrtzP9Pg+SjqKYBE2T1DlSTsPVowfyOnrVzh6L1Fl/cRoaEg4WnnUw4g2y+CCSAR41
 fbyyJzg6sNZhmzCRl3w5DcbOLuyjgmkBmnsKjGHOznHgXteWEQfSQdGXhUMAKira8Fnq
 HP/hvYn7UA6H+yJAhTy8ytah0Mvmfm/7L0P3DOr3Msnxh+hB9A0/E8Q4pNJqPf3MLVMa
 8XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=vbdL14wqd+TXUD1iwQ6ZI35nUpnOaOq+sk6GuqOnbiE=;
 b=YXhmMgPwnmwY4axMAh8u9qh0nGXQeoKKeNFD251gR6fH1mtBhIGFveS6eohEMf0yOT
 vgQ/oCNiAzzWsCJOxU4PFA41ogsfhOQdUyLx2gOzYwjYrDBLdqK2TphwZHfdzkBdaJXF
 M2ZYr6fnUje9H3xjAIAGIFCIroIPWZoSFxvkHahemJz6yfyge8NpeSVDaUjSKG+Q7xOW
 6hjZNYrWVxqGYpW3AUmECF7QXDh/t+D8QiijGOOIf96ZoMdf49O2FT66kY07tUzRCbTY
 sSvjQC+h7n3ldRuI6Sv9nfmG6cv6kle5XyL++Qx2Qf2hB6w+f1+RMSsNmVMUOC/pV1ey
 ufHw==
X-Gm-Message-State: APjAAAXfCPlbAAwjl2tRjPToMy6N0MJtSTZfttTompQDxwfsrTCZIFZS
 TldMauwnLFxNc/nhxC4FCrnNrw==
X-Google-Smtp-Source: APXvYqyoHnkyxs6lUkgFkTdeB46dWH5MVKdPDqMKHGWBBWrmCgoMEtbFZmYRbm2shz9WS4nVuZDt2Q==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr49219802wru.398.1582281686837; 
 Fri, 21 Feb 2020 02:41:26 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b67sm3501249wmc.38.2020.02.21.02.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 02:41:26 -0800 (PST)
References: <20200220205711.77953-1-martin.blumenstingl@googlemail.com>
 <20200220205711.77953-3-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: aiu: introduce a struct for platform
 specific information
In-reply-to: <20200220205711.77953-3-martin.blumenstingl@googlemail.com>
Date: Fri, 21 Feb 2020 11:41:25 +0100
Message-ID: <1jsgj42pey.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


On Thu 20 Feb 2020 at 21:57, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Introduce a struct aiu_platform_data to make the driver aware of
> platform specific information. Convert the existing check for the
> internal stereo audio codec (only available on GXL) to this new struct.
> Support for the 32-bit SoCs will need this as well because the
> AIU_CLK_CTRL_MORE register doesn't have the I2S divider bits (and we
> need to use the I2S divider from AIU_CLK_CTRL instead).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu.c | 19 ++++++++++++++++---
>  sound/soc/meson/aiu.h |  5 +++++
>  2 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d3e2d40e9562..38209312a8c3 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -273,6 +273,11 @@ static int aiu_probe(struct platform_device *pdev)
>  	aiu = devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
>  	if (!aiu)
>  		return -ENOMEM;
> +
> +	aiu->platform = device_get_match_data(dev);
> +	if (!aiu->platform)
> +		return -ENODEV;
> +
>  	platform_set_drvdata(pdev, aiu);
>  
>  	ret = device_reset(dev);
> @@ -322,7 +327,7 @@ static int aiu_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Register the internal dac control component on gxl */
> -	if (of_device_is_compatible(dev->of_node, "amlogic,aiu-gxl")) {
> +	if (aiu->platform->has_acodec) {
>  		ret = aiu_acodec_ctrl_register_component(dev);
>  		if (ret) {
>  			dev_err(dev,
> @@ -344,9 +349,17 @@ static int aiu_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct aiu_platform_data aiu_gxbb_pdata = {
> +	.has_acodec = false,
> +};
> +
> +static const struct aiu_platform_data aiu_gxl_pdata = {
> +	.has_acodec = true,
> +};
> +
>  static const struct of_device_id aiu_of_match[] = {
> -	{ .compatible = "amlogic,aiu-gxbb", },
> -	{ .compatible = "amlogic,aiu-gxl", },
> +	{ .compatible = "amlogic,aiu-gxbb", .data = &aiu_gxbb_pdata },
> +	{ .compatible = "amlogic,aiu-gxl", .data = &aiu_gxl_pdata },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, aiu_of_match);
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 06a968c55728..ab003638d5e5 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -27,11 +27,16 @@ struct aiu_interface {
>  	int irq;
>  };
>  
> +struct aiu_platform_data {
> +	bool has_acodec;
> +};
> +
>  struct aiu {
>  	struct clk *pclk;
>  	struct clk *spdif_mclk;
>  	struct aiu_interface i2s;
>  	struct aiu_interface spdif;
> +	const struct aiu_platform_data *platform;
>  };
>  
>  #define AIU_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |	\

