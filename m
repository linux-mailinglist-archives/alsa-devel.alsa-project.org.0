Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E591AB99
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E66B20C6;
	Thu, 27 Jun 2024 17:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E66B20C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719502773;
	bh=X+89KQ9khlo9ksL828oIZjSyJeeMnEedqGr/xgPUG9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IgJy2yrxlAn3N9qD4u0CXg/49TYHDIsHzwJ8nRYPkFnIW/ZQbN+4DjRDf1TcwyHnd
	 bkr+RqGvBCnjVHfpxkiJ2BlGImNvevUVTS/TXxKyl7bXRRUgFkMZ4ADTxlAHKhkXIO
	 yp+LaKwzl2dNUPIQLJifuezTgAcGPFBa3q6Q7Cp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CBE4F805B3; Thu, 27 Jun 2024 17:39:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84388F800E4;
	Thu, 27 Jun 2024 17:39:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ABC0F80423; Thu, 27 Jun 2024 17:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1FDDF800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1FDDF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u1D4VF3b
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so7162281fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719502735; x=1720107535;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOY+M7D7TFw/QBtM2TODmhCDgoUDeHoix9fanh2mF/g=;
        b=u1D4VF3brsLNU9LlkeDpsOYJyIu4YSkhGxggetmY5McKaZtoTPBupCj8MKpMcBn47x
         mzhUmKkEEbj0NZn3Irf7wltzH8mbJ9AnWfeXnO8kARvnrbewvtSiXfbu8QDUjtwTS8f7
         AAIh/czoecbD+yZrZYLQjugHV2DsAsRq8Hxxc+UhA//c7h94xsWxnRBVuvf2jKE8LFp0
         JHtsyTZQKT08TX5xEWHlMmpx4KsCTqJUdnvMQh6KH0nq8+0mt1lPE3q9B61gSvu4LO6f
         BbOTawW9n6ktRmydFDGrLcUw42jzjYTb3gSMhkNxZ2xf+/jQB7zM3sfV0MznKNyWwXuB
         omPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502735; x=1720107535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOY+M7D7TFw/QBtM2TODmhCDgoUDeHoix9fanh2mF/g=;
        b=aAO5U44Mn6cq0bkiPiafBmQDVZgQh4rpR5Lh8cpjBbLzykyhYf+nmug2zxZgjImAIp
         vIXYDvJImzARYmwyGX/MqiXdshoFfi8YzCeot60vyQkzywXT5GbXn06caCO0sbUIX5nf
         aeW87f4dX5QAv+xTsZJ5wU/nTpgBWTcKSTE/y89Uc7m2iamOxTR2JrAfY1Fldjh/65DF
         U1jSD/m+yzqY8b8ExO9Rps11SIzrl2FsCDWD2NTAjwXl/VX2ADis3J7JcEmL+RicoWvH
         V+7MQ+AJ+sVj8y238IqoOE4TGDupPu8Uo5rQNNioN6Uu0i1OvzAiqEfR1DM4dEKQux/I
         7nFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdk00M4OR0gCbagYS2iUZSi0hYjJfur6JD5OvylncuwxP8kgAhc3heu4XqfXd2pf917FClIgRpopR8+11irKsWbm/24O/ziK7TQIY=
X-Gm-Message-State: AOJu0YxHwXaEwGQeL+7HAw9z3NngSwhFVyt6o5G9g1L0M/x52DlLtBVN
	HEBrmpv7UxgOQShUNPt7KsEG+8dvf4r8Auhh5FB7HscWxJoqTdf0WW6vtPtQ0NeEb15J0I9n/IY
	glTc=
X-Google-Smtp-Source: 
 AGHT+IGh9tIqwf+68EbyFwi8dvXoQz1bfiDDI0e0sR4vsZ9a1n5GcilbLLPWizzzclE/jI0PC8DApw==
X-Received: by 2002:a2e:9302:0:b0:2ee:4dc6:fe21 with SMTP id
 38308e7fff4ca-2ee4dc70073mr10088211fa.3.1719502735341;
        Thu, 27 Jun 2024 08:38:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a344081sm2886641fa.26.2024.06.27.08.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:38:54 -0700 (PDT)
Date: Thu, 27 Jun 2024 18:38:53 +0300
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
Subject: Re: [PATCH v2 2/6] ASoC: codecs: wsa883x: parse port-mapping
 information
Message-ID: <grtvmbccqbwwaxftfjg2bh3naumjrsmkd22vjqxwev6vmmgr6y@op5z3i4o2non>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
 <20240626-port-map-v2-2-6cc1c5608cdd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v2-2-6cc1c5608cdd@linaro.org>
Message-ID-Hash: NZRWA6Q4TZXLSINI3T7UGH3PAA4FZKNW
X-Message-ID-Hash: NZRWA6Q4TZXLSINI3T7UGH3PAA4FZKNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZRWA6Q4TZXLSINI3T7UGH3PAA4FZKNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 03:44:39PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index a2e86ef7d18f..5443a5c4100c 100644
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
> +		dev_dbg(dev, "Static Port mapping not specified\n");
> +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


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
