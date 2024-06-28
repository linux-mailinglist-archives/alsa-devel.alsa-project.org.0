Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D095F91B6E2
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 08:17:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E058219F;
	Fri, 28 Jun 2024 08:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E058219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719555465;
	bh=5bIe718VpZh3GKm0UVXuS2qivn/Z/jcFq7vPZzH1ZSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dGl3ODqfcUIclfdMmcPSPNI9oETEhV3o/PI5tEZSS99onIGG/xCNGf4xpyKnQi1kU
	 qFvR5yO9ZNzWYbcHSC4A/FAuxWtHtuNEUOMl4Dswnl527N1HeVKndZdsoT+dgMo9LF
	 q7eVRwszYktHKqmw4FuqC/Q8HKdSqOFobfam95hE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18665F805EA; Fri, 28 Jun 2024 08:16:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0685CF805D9;
	Fri, 28 Jun 2024 08:16:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A490F80423; Fri, 28 Jun 2024 08:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83136F800E4
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 08:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83136F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LkDeYrYK
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso2667171fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 23:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719555275; x=1720160075;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5bIe718VpZh3GKm0UVXuS2qivn/Z/jcFq7vPZzH1ZSc=;
        b=LkDeYrYKuloWHsS9rM3MQVIiOHEKCawCSzwKQyjUBO4dOFQFaJY6pbWB572z1ifZRB
         PZxIv0DRMzQ+nqyXMRE0qCxeA9txppR7T9WLJlqmDhEHlCcnkrRkqqCPklRFXbSdKwNh
         skUnkHBT7Wkl8DVB9KnTigxFe3QtFCkb/R6nvFCkCIbx6soVo6v+ZglRKYCwSFARr2UA
         4o2++OIVMAQJK2neyGF1UlSRFTA6rt/ZFFQ+0MqQ9hnFZ+VNYj5ovBqgxeLZuk87fxqy
         lPjKkhdY7Bkl4PeiBywOQfeDbmm2DeoEfHAkJg4Cly/yCxRbVYHZGcKFFIojkH5Spz7r
         srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719555275; x=1720160075;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bIe718VpZh3GKm0UVXuS2qivn/Z/jcFq7vPZzH1ZSc=;
        b=wbq+8czJMl6/bvUdKgOwjcdDHg5ynRKCfzoIACjCL0pDHocavwP3ByWdmHsmd4lVom
         qE8WfEwDlI0cDfW8oCtDxliR2C5X0FmyA9jgg1Za+p0WY7YBBWsx7d34nJq6a0DrNoRO
         rkEpEQ3QBiCoFXJla7tzPTRr3HinDNV6y96aYdbxBpE5GimyxsW+ZMt8Flm3dOwgyRFM
         I1Mp50XvqBlZ0CVzAMyTF4GQXOk1aeZa2TGhobRBDcrhEei7LaSRlEtFukIGQzKL326q
         /bOXuJFjcnLvw1J+CT3aGS/a4uz98thQX05018oC5tADp07oNp7gBMO0JJv6i/pB9oCe
         bR2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzMkS524BPJJ+HDKPWQqEbFVMcJn6O4CYan0CCEtSpNhGOkTcTJUvFd7bmUi89VBXlPBDwL/MFQE0/2I7I1OLgJiYrPkgqCIQ9pxU=
X-Gm-Message-State: AOJu0YwZ4czz0zpwYjdsGmjWE0b6kT9pH8QB1A3dZhjNShu0lETvHFV8
	2O9SoMQr5eLC6/pCxVBgCerm0ScTBUvVeTFPm/sZN4R4P/q5971YKQ/lM5hx2wk=
X-Google-Smtp-Source: 
 AGHT+IGDLTD9FNmjRSqFm/kuw7LfWcrMal61hzXVx0iHByfoWZ56E6uu95w/0M4gAQFsIetpmN6hAQ==
X-Received: by 2002:a05:651c:4cd:b0:2ec:6756:e3e7 with SMTP id
 38308e7fff4ca-2ec6756e51bmr109476031fa.40.1719555274658;
        Thu, 27 Jun 2024 23:14:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e12fcsm1216457f8f.48.2024.06.27.23.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 23:14:34 -0700 (PDT)
Message-ID: <dbfd4ab8-d413-4a21-b27d-c6bac0eb0ecd@linaro.org>
Date: Fri, 28 Jun 2024 08:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of lpi_i2s2
 pins
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, perex@perex.cz,
 tiwai@suse.com, linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, elder@linaro.org, dmitry.baryshkov@linaro.org,
 caleb.connolly@linaro.org, linux-kernel@vger.kernel.org
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-7-alexey.klimov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240628010715.438471-7-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FZCWTX65XSYQ2P2NXWJYXL2E7BB76VLJ
X-Message-ID-Hash: FZCWTX65XSYQ2P2NXWJYXL2E7BB76VLJ
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZCWTX65XSYQ2P2NXWJYXL2E7BB76VLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/06/2024 03:07, Alexey Klimov wrote:
> This is required to enable to HDMI audio playback on
> QRB4210 RB2 board.

This should be squashed with previous patch. You add one node of pinctrl
with all of the default pins. You also miss soundwire and dmic pins.



Best regards,
Krzysztof

