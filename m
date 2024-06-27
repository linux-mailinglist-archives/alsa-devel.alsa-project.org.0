Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFF391A801
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 15:37:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABDF5218B;
	Thu, 27 Jun 2024 15:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABDF5218B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719495440;
	bh=jrJYPSTr+kFC6rNqtUiTcC2Ht6Y5ui2Su1TvOnzxGV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KF7iM77F6hGw6tXvt8EjYj89VvPpQbnsE0PltwTr4TYtTy+5eTun2ROFzcU+cY+Uz
	 AVQaumxIDmZd+Iza/9ZYz7CQhhwU+0fKzPjCZqrVKf+xPyWjG6LWNjSAJB+TVFV1xu
	 d583BvocypRov4E9SaLQesksyotBEM7KqPBodGFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F52F805B4; Thu, 27 Jun 2024 15:36:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CCCF804F2;
	Thu, 27 Jun 2024 15:36:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCFDBF80423; Thu, 27 Jun 2024 15:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81D0DF800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 15:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D0DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pGhI23e3
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so6225083e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495390; x=1720100190;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1OXb7hatY4Mkr6yC8g71Li7XpW45pDJLNXcPT5PB5o=;
        b=pGhI23e3lNNyZ7E5EXh7Bj54V2ErFn5YYU6t5wYQVsu7IBJQXohK5K+Y6bLwpGF3Ws
         2ahyX1QRheum/znLfy0leR7mHI6Z4x5ALwRJlYvHMM56JVsYambtDKz9C1Nrmwm84TNN
         +GJvh/2Cb7IQPAtpZU5mzr5LHtTnq6Xr8dB3XQBjYdRjABZGhmDtcEM+PjN4xjXNyTfr
         fPHjQ4SCA0MkaIwauptGAyABLyBs6lNy6XdZbnDn8ngJMUagK4siFzMIYdfz/RN5oBv4
         yf46ZIUePzPcLyn1twKQT3mXN5Sk4Jfh21QKr8nR9SYSM++HbcDhvsrK00wwxQzq5aww
         YD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495390; x=1720100190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1OXb7hatY4Mkr6yC8g71Li7XpW45pDJLNXcPT5PB5o=;
        b=C9d4FzbCtpEVt37IuLUgiAfwlxC/HuD1Lu/yo215Dnra2KDgJRxJX4woxFKrSq6IJl
         gZTowHvZK2euyxJRcUuBrvTbj69BFu2UN7HbNGoWwxFD2sAv8dc9Tl+vqFX64tPD2WW3
         APUe9O0RMZOpAexGQVZcGo5cpR3R9cYUXair2Im0Rujbvvg1w8bovldIorZYp3o4eP5M
         PPZF5vZrPA3sOHipbNofqsFSap2aGdsU2KE+7+2E25ne5f/TJzJjJyh6TEvjftB2BRdy
         fg7DQUmzgi6iKEgGDD+2Pgkt/+k5QRRclMX5JBvD6mroIZq+M+o7zbTZ8llhOrSioMWR
         x+PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdGNycEH+xgUcZFkvrFiPLFnUsIIK3qWt63Q1vbFhMTE4cd4bMRsJvzUbwvTNiCtC5lny1VrdMzuxEtzv1agAtq972EevieW3vTw4=
X-Gm-Message-State: AOJu0YzLSZsOq0rOgAPVVuHiM0X6lT/yO4ARaS8B7RHGGENrstBlNOqW
	p54F21mcmgqHr6EZpUqSf4tu5B8TsJWuD5G63mAvyfFBD7BacdbSsRUuvvb5Mh4=
X-Google-Smtp-Source: 
 AGHT+IEntGnW3r885rD535krGu3gOxLvLpYzJ1lI50RGmo2x6rQxE9vDmBzx8zivqRScd/qzBnU23w==
X-Received: by 2002:a05:6512:2813:b0:52c:dfe6:70e2 with SMTP id
 2adb3069b0e04-52ce185f9efmr10637532e87.47.1719495390235;
        Thu, 27 Jun 2024 06:36:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e76427d7dsm62272e87.156.2024.06.27.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:36:29 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:36:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa883x: parse port-mapping information
Message-ID: <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
Message-ID-Hash: YWADUR6MRLKGWMAKIFSWDAQSZ6H6MV6F
X-Message-ID-Hash: YWADUR6MRLKGWMAKIFSWDAQSZ6H6MV6F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWADUR6MRLKGWMAKIFSWDAQSZ6H6MV6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 12:55:18PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index a2e86ef7d18f..43156d39480f 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>  	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa883x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA883X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");

dev_info looks strange. It should be either dev_warn or dev_dbg.

> +
>  	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
