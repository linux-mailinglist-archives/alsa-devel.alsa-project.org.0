Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180091A809
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 15:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C141E93;
	Thu, 27 Jun 2024 15:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C141E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719495532;
	bh=zlWbv23yLnjGiL+Hwn58YyoDm6gTItwlsW44BzEfxBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cdBpon1H8APxR0Te5rybp9u9QK7i3DI8BodjTV+24VoGfdpSBAsvhTyBqzhOvdbGT
	 VJOwg3flDAMYvyakoilH4k+CmUnLAZkAdp74+WOQTLsMYe2Dfjc8KoM9vbLA+iL3PX
	 rUK3TzRuy+8lZYGozgjnQ2BFy3nGUg36Fd5ac2lQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A13CF805BB; Thu, 27 Jun 2024 15:38:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 829ADF805B1;
	Thu, 27 Jun 2024 15:38:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6FBDF80495; Thu, 27 Jun 2024 15:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B040F80154
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 15:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B040F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ger1T1KM
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52ccc40e72eso5891912e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495484; x=1720100284;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1nVtFcR4qXFe32k9YlzAMOipXNA9mfmYhrI52Tfj7Q=;
        b=ger1T1KM7bxp4hAkINld5Fgy2xEXnY1l5qeLGjdx6M/dnphHyOD1vkNYzqv46cVkwc
         6oNHzP9os+QZd/GJWLoDVHSqDsyGCYVVfjJTFRJGh++Fxl4MNk9NwbysTrgN6YgW9jc0
         YZnHrS8OzEc2lDiuxyslLRcR6xSJUdf5YjmlIQ5MpsPEtaO2ZGRvwQX3SgIzlr073BLj
         Vk2o4aaZCrUvHRuyFWUjh7/ZeTxZPWd4ohm6CzSMcOi7e7iFBzTTfa3vsIj5GEr+HJzE
         Q2Ow9HRShJjU63X3GojqLBPrs0aOtucRSJ7pHsXk3lWk4fYIanG6yk23KSVr8MA3jH8h
         wZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495484; x=1720100284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1nVtFcR4qXFe32k9YlzAMOipXNA9mfmYhrI52Tfj7Q=;
        b=Smz+VGKDQSm+n/d7fd08OOgMJLyKb+s1qKgpHacPKt0t4+C+6DF+vOvCOTlSqZCSi3
         /TQq3JKpOafo2ltkvWDcK/sVtH8cwGk2QN+mErw1ZJhag7U9rVI3AoUGQOHlO6NHc3YP
         KdCxoYDBdKLlEOW110d7Wvo7UvmyZmfeWBPgLwsxekKs+OSDufQAxl1Sfswoky/Do8l9
         rzp5cyXh4ekzrsivQziTNOrAjK+TcV8NKE8yUChnaemytdrO6b8P6/XdCc3w/YsuVIph
         Dz2qRMXUI5wgiZfhzfc0SLeJnJnPl1yHpMD4YE5ZRuYZBx2zQ+bzrxm2GEoufnj7j+Tn
         iiYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu5gPOL1Z8ux94maU5iJS8tWEUmetPxBaWqK//gL5F4S202przX3DFWzpmnQVaF7sj3wCktdy6PnttTjSiLU5Vk8xF0tLTc5e8Muc=
X-Gm-Message-State: AOJu0YwfkW79drA1gOPDf7RUKcdv9lx44yHVyDzWWMiBiEOB3e5KEt35
	jLPNp0mWYrS6k9Whqn5MDYTMGvI/9lzPcun0Q5svlWXkJnlOHYM2+kaIukKEtQc=
X-Google-Smtp-Source: 
 AGHT+IGt/T6ryAQ5fIZrriDIODzgzCJHjaJBSRs8dHehQYvz1xIxu8NpVbr7FP8bm81xWv9Zq+eRdw==
X-Received: by 2002:ac2:5607:0:b0:52c:e0e1:9ae3 with SMTP id
 2adb3069b0e04-52ce18614d1mr10442288e87.57.1719495483953;
        Thu, 27 Jun 2024 06:38:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7130543bsm207833e87.136.2024.06.27.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:38:03 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:38:02 +0300
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
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
Message-ID: <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
Message-ID-Hash: 2VSJX7HT66Q4LK3JDMHIBOHH6K4W3G2D
X-Message-ID-Hash: 2VSJX7HT66Q4LK3JDMHIBOHH6K4W3G2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VSJX7HT66Q4LK3JDMHIBOHH6K4W3G2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..72ff71bfb827 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>  	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa884x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA884X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");

Same comment. Either dev_warn (if it's something to warn about) or
dev_info.

Or, as your commit message mentions that it is required, it should be an
error if the port mapping is not specified.

> +
>  	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
