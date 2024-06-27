Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E798691AB9D
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 946F61925;
	Thu, 27 Jun 2024 17:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 946F61925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719502799;
	bh=DAekPm9WUSabO1N0Fanj15qiAengfqdzXPC4rFMBSJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W7c8kU3KY1xX3d3KBhMTOo2qUNAY84tdv9xqXsB6oJ1S2HTV8cruw2I0pxK3+Uav6
	 jafEoy2TBkHCVnqskSsg7NLdS2cHulvE2ZKVYG9h4k8wheuNQmajIBL0h4u9RENEMr
	 OjBd9Y6bmkkwaxsklnQ3i1QU5sdgbsePIeyf49iE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3AD8F805E4; Thu, 27 Jun 2024 17:39:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AC28F805E8;
	Thu, 27 Jun 2024 17:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4E50F805C8; Thu, 27 Jun 2024 17:39:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C81C3F8058C
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C81C3F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=i2EmkeL6
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52e764bb3fbso539637e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719502748; x=1720107548;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWNXGLL2Gm1RdbPIHxkoTg3h2G36zUXEzqhJRAemoV4=;
        b=i2EmkeL6vvAVaElK6KRaEYT4DneUn/ru8497bBtGO2zx6TQxylB63wrz10dm/1utNW
         s/XcZQLJbU9r/pXw8U6rxi7fBCtNiqOUYcWu5Q9BEPH94AzKUgbnPC/TOhf5HI199X/A
         QFoDA8ZtBsN4OPe/n4KXG0e6IG0Xe3A+8SRvaVpiQ9fKLPRGVxI2dmdGRbjGjKZUAhUX
         rmDMaMKoRAqQWv9wciKQzo0zt/y5ShXhi48Ih/mHUiOKqhMLg4qxgcgDBGnrQmt6+IsF
         ubC+mlMCjIc1tO1qTBGkPtSHlGUhpim04X8IkvbtoXQGk6h7zAfnjTzZS+Mhkz8ZY3kL
         2xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502748; x=1720107548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWNXGLL2Gm1RdbPIHxkoTg3h2G36zUXEzqhJRAemoV4=;
        b=G35oZrxboGiGP9TqJjF/uwJFfysrmIVsjjkYG1eM4HGRdwvBFTyR4uyWyfw7e11lSt
         KQqYgMwap3PQ2kkuDAzhFimw+FQP9x3IccXX7o7RNhvwg+CKsw/wcRl8t1NJdTMxqFQE
         GXShhyP/DXmff4pCCVk0PDZmxq/9geUSCXGuLS5WWL2DtRXNUH7pEgRIUZMf5igzKa04
         jRzHsS+XCdw2mo5hh0xrJPNsSvukeqiGLDjsN1YgDCeCoB947EDX4w1ZjZb1VPfff6yB
         sN1TO2oeo77hlFAD62/NUXGoX2y/edfqB0h2f7OrlfFsQVfDYK84gLqLCxW1JtYofSS+
         FCtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLXgi841GQI+yiyvI8HzAJcEROj3151vbx0vzOMkj3aP+CzqcQw1CTVJjTay6h1XmGAXCELNt1z3Tq94adczkJZCslVw91/+O5gPc=
X-Gm-Message-State: AOJu0Yxu9m9XTGzCtaJvFMbr3zribLaSKTXxGvJDC/xOQ30azTOtd+uo
	0/nxkiSca/nX78sVgr4GB3HKR9kcAC57Zlmkm9x3+tWriZuF+Nk8hSatzh5feqE=
X-Google-Smtp-Source: 
 AGHT+IFjjRiKI2kfI3Q40lKeSWkAul/C0e6nj4kqnbScxDo4sTHhLvoHXz/FY3xuW5kDV4YGXIvQvA==
X-Received: by 2002:ac2:4c86:0:b0:52c:deae:b8fa with SMTP id
 2adb3069b0e04-52ce18321afmr9465994e87.3.1719502748252;
        Thu, 27 Jun 2024 08:39:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7131357esm242219e87.212.2024.06.27.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:39:07 -0700 (PDT)
Date: Thu, 27 Jun 2024 18:39:06 +0300
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
Subject: Re: [PATCH v2 4/6] ASoC: codecs: wsa884x: parse port-mapping
 information
Message-ID: <gyg34bmhtkhnl7ggbo6fwrr2w2seuf73o6qrkh25qvi3psi4wi@awnib2ilblf7>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
 <20240626-port-map-v2-4-6cc1c5608cdd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v2-4-6cc1c5608cdd@linaro.org>
Message-ID-Hash: ZZF54QLCSN57IU2ONGJ64N6L6QNJ3PIZ
X-Message-ID-Hash: ZZF54QLCSN57IU2ONGJ64N6L6QNJ3PIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZF54QLCSN57IU2ONGJ64N6L6QNJ3PIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 03:44:41PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..a6034547b4f3 100644
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
> +		dev_dbg(dev, "Static Port mapping not specified\n");
> +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
