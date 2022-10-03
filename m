Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 432815F2B1F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 09:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E15206B;
	Mon,  3 Oct 2022 09:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E15206B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664783293;
	bh=S4151caGMSDkwIWOV5X0+1Rf/qWbEVXmhjeit/Uf+0c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nqU6ZGEPaJr6FrmepgTcGcgBN5YammSOSnxDkd1+ltx3pVrdyXGlGOaCbW9R4L2RR
	 FwNlsTDNvYg+cDWQ2ezaQjDi05wQlaMuBy1Z+3V9/pcSO0gbA4MS66ff3o72sKZFV2
	 myTHD0NPJJbvA1reRntaPlhGYBjGWU86zg84xGTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC9CEF80431;
	Mon,  3 Oct 2022 09:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0735BF800CC; Mon,  3 Oct 2022 09:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8D93F800CC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 09:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D93F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cYsncVDi"
Received: by mail-lf1-x130.google.com with SMTP id b2so4450173lfp.6
 for <alsa-devel@alsa-project.org>; Mon, 03 Oct 2022 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KOrB/A4OW62+78D6EYGHiYgfjqUdNg5aQnOgbAwLhMM=;
 b=cYsncVDiktv2czZv2Quy9c41x7ecbvlC4RKVvJ+kFhFZ9IKl8GdvhzPnelGomKf7V5
 BhWJP+G6B7o6GGDSrR72oVBhjFFDnImyMK/pKHyeEmsyZrQKH2byNpCnZTqKtQjL0nyz
 /x9Ojj/OEmUQtpJZpjX9UxOhveAUXUMLIOiqGPufolWDFMtX9aJ2XaW4GSYJLqj19+/2
 T6MP9qODROf/xrBisTtynUXKaLJVS9dvN8x20pzoDhoJaCUypcEpHUfKPBtTShhvb0Ia
 f9KvPkYUN+IzhQD0IYZdWvZUJYBajUItOk9JmvD78OcMZrE6fiIGv//KByXYH/J1MJIm
 xBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KOrB/A4OW62+78D6EYGHiYgfjqUdNg5aQnOgbAwLhMM=;
 b=buXGSIxIz1+0IsasoDTWBymVCaifpJpdC510pjfmgK8T6s+ksvt4TxUIigIgBxf+EJ
 JbGDRXOZV0ercPJj4Fh7zbF1Dx0xGYcPydiUDc5DNXXaaeUOMSnH1y0Hg2lk+vA6WvLT
 9mscE4JIHT5ylzIZKI9LzX8VesW+0g9GFHGMsHEDPLdJ8SPddqpX6r8D7ci0NKXKp84o
 tNkIkUo60Q7eC+dF1PX1hZV7lPhdp6jEqBmdoZaQhZZqtucicBvecIujnCkoGQgRQgis
 m8HC9YEF0BgoHtl+cQNO5J0svQJH9JBWang6KFKcyCQ512SIY5bSeG/oxNGRCI55WZM0
 +aOQ==
X-Gm-Message-State: ACrzQf1S2EZjIJa5zEpPbWhFc8yOdAc6NAL5XSjhaMY2CjkJhRQDqnVd
 aS97WlXwkm8HYjfqVPLryJ01YA==
X-Google-Smtp-Source: AMsMyM5BX5rQ3GFlG8S5xtQzRBx5yzbNbBiwMgj+ODwz3+m28wwVMtyVLgwW6iNaqiXgAW1FIFlsyw==
X-Received: by 2002:a05:6512:3d28:b0:49f:4b31:909b with SMTP id
 d40-20020a0565123d2800b0049f4b31909bmr6578552lfv.669.1664783227551; 
 Mon, 03 Oct 2022 00:47:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g19-20020ac25393000000b0049944ab6895sm1353215lfh.260.2022.10.03.00.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 00:47:07 -0700 (PDT)
Message-ID: <45d73953-32f8-d9cc-bfb6-02fe610c90ec@linaro.org>
Date: Mon, 3 Oct 2022 09:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: add schema for WM8961
Content-Language: en-US
To: Doug Brown <doug@schmorgal.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20221003032414.248326-1-doug@schmorgal.com>
 <20221003032414.248326-2-doug@schmorgal.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003032414.248326-2-doug@schmorgal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 03/10/2022 05:24, Doug Brown wrote:
> Create a simple DT schema for the existing Wolfson WM8961 driver so that
> DT support can be added to the driver.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

