Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072365FD86
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:20:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F244E14118;
	Fri,  6 Jan 2023 10:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F244E14118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996847;
	bh=ylgbdwti0tUPghUvZgOSh4d9Z0wC8YT6eQ+J23ffwwg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DK5oIJma5E0Nt3yQ40URRlU5oKWbU+fgHGQ8o1RtGz79oWxhWgMEnegT7y9ugo1vg
	 X3lYzixgGfa4gR9IsSmRUx8VARb/pQA4V1rpvkZ0ydwgjA8+GklgLIVGt2yJzy5cAZ
	 6igOr8fxX73o04BAv/vRQoBf/1MTO26mwYlDeAEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B00F805C9;
	Fri,  6 Jan 2023 10:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB4CBF8055B; Fri,  6 Jan 2023 10:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91FF0F805A8
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FF0F805A8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=onPAfW1Q
Received: by mail-wm1-x32f.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so654255wms.2
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6s9kNmp8sRI04bHFWAY1Bh0keJIotvwnZUvkJTSVmVE=;
 b=onPAfW1QvxT7BLu2PJOAIrnIf/ok1H4qJ+mMtbixAiEqX4J4stoIPuJFtpozsBZ5co
 BDxZe+h4jM5qq9JwL47AN5lkyFPXAGcp6aKDXoMrgUADIbR0UVEhXOijuG65yNeQW8n9
 4Myt6H4NMdn/cpIBp1eH5mEWFOBWOoq0ae3i/Ctiztuqsw1cFY9UB7OWFv6XyuKO9irw
 97JpJL6eF/9B+OEWzKzM+XwBCJQWlta7u1hz4UwzJXd/V+wnbr42jkR6F+CZzYYzfNw2
 WCXXCYl5l9/ieV7ydM9Di8dmRFZFvRTKJmhmtiF83LpcD0RHLhQW/PU1tXuqyHS+8194
 DDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6s9kNmp8sRI04bHFWAY1Bh0keJIotvwnZUvkJTSVmVE=;
 b=EHyWY28r5pvyHA6Ah7xixA/fanmjfY6an14XLhpNjUj0k6cuwBoXdls32bkEy5ZInV
 8832aRi6A99xxgBIj8TJiRqABiM84AlcC1WKyUTwSS2v2tKTFpkXBtQYhQ5XhXlpSH4P
 py+W1gPUOGZuzll6DA1DiU1RjHE8jUay5MSReQGc+0HEqeSowQAYusfwMimRmOlQuyy6
 7lD/oEyD6yTOMArJp2rPz2eJMZ5WKOvvttc+2NGlEF4E4Ff9SLswPcvljZixzs8sGDnR
 5Wzbe/4De2qYqBb0RyBKcJ+NQJ+PD5KlAGWANEdOlzPHZpiv9UpOy1V0MSNEXin5244e
 8Rkg==
X-Gm-Message-State: AFqh2kq5bjn5JdHBo1ae1OoiTi6UBX6e3RltqIfE9EP86bzY4W6AOwEv
 AaTP53ZTIajCOd5UTLXIzVN/cA==
X-Google-Smtp-Source: AMrXdXtZaj2XJDHpFH+Ihe787fODImEiYthWkmBXM7wbM50oMX/+mV758qcBWvtKmS27CEqV/XlWNQ==
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id
 e15-20020a05600c218f00b003d1fbf93bd4mr39246496wme.10.1672996573262; 
 Fri, 06 Jan 2023 01:16:13 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n126-20020a1ca484000000b003d21759db42sm5485870wme.5.2023.01.06.01.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 01:16:12 -0800 (PST)
Message-ID: <e90e00c4-fd9a-83d1-2f44-e443f8476d19@linaro.org>
Date: Fri, 6 Jan 2023 10:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl-sai: Simplify the VFxxx dmas
 binding
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20230105144145.165010-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105144145.165010-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Paul Elder <paul.elder@ideasonboard.com>, NXP Linux Team <linux-imx@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 05/01/2023 15:41, Marek Vasut wrote:
> Get rid of the vf610 sai special case, instead update the vfxxx.dtsi
> DT to use the same DMA channel ordering as all the other devices. The
> sai DMA channel ordering has not been aligned with other IP DMA channel
> ordering in the vfxxx.dtsi anyway.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Assuming that Linux implementation does not care about the order of
these (and takes by name):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Although other users might not be happy about change of order...

Best regards,
Krzysztof

