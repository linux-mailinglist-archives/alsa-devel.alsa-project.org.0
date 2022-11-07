Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72461FF2E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 21:09:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E4C9FA;
	Mon,  7 Nov 2022 21:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E4C9FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667851745;
	bh=ZQoEq26G1k71yIBjJa0MnS4G+fhDrUnvPtd5AAM5NaA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gm8rdT8inwp4i3bncdbqCYxGMuDdx5XVbXSa5lswQISspNw69IcpE0ubJykgla/IU
	 SPsZkbw2vI4ubihiAPgXU8I7DM6wvBoJaj7qX2rMsiE+Z9kb1/RUzQLBule9+H7P7S
	 cWdN6dxNR8hMcgaoYQP4M3NkjN5NnXnQdSoszpvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1664F804BD;
	Mon,  7 Nov 2022 21:08:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC680F8025A; Mon,  7 Nov 2022 21:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABFA8F80116
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 21:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFA8F80116
Received: by mail-ot1-f49.google.com with SMTP id
 w26-20020a056830061a00b0066c320f5b49so7199035oti.5
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 12:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2e+1CQkY31rHRU0NgYRi9WpKBJmDl6YDaaKalJuxGYI=;
 b=AhrO3flW0TwomZbsf/HKbnEYx3nQnYLRHCDGwnLRpVz6c6Fx78NctvuRxSKYb2DDFW
 x/7xq3SfmFIVgw1x/3oOk8WPZnfUO98auYbQP9b27D0Z9ZjrYl4l/y/22iEboGtxhZ/O
 px6mCo2RzxtFJ6kw01D+lMBTqfbC4reonGyyBfx6ZzX+e+wAXnhXQeOLaXK/C8bttLQW
 AuH26Hev43pNBJhsBYQ0cWjhD+DA4Hjnp3cy15vKv24UgLFrJJg85HWFSSOYur3q4Ps3
 WEbY6WDvGs293uImN8IuqSYktYY+vcM61xrYWJziK1HtRjCBNMrd6j1hNHUSRoprjFhB
 cREw==
X-Gm-Message-State: ACrzQf16P9Ifu4kNHz017hH38xDlUT8ly9bSPUk2br1VfLTNjuKd3G+W
 kiQByq3uMDVwwiEVThzIfA==
X-Google-Smtp-Source: AMsMyM42ecXI4jCMeu1Vcv60kCpnrjWz5XTXNFhmZZ/yXrVn/q9+wmUt8QoVVIhjw/+1BIFiuvTv+w==
X-Received: by 2002:a05:6830:2aa3:b0:66c:9a3a:539 with SMTP id
 s35-20020a0568302aa300b0066c9a3a0539mr8688491otu.317.1667851680547; 
 Mon, 07 Nov 2022 12:08:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b0066871c3adb3sm3330746otk.28.2022.11.07.12.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 12:07:59 -0800 (PST)
Received: (nullmailer pid 1525000 invoked by uid 1000);
 Mon, 07 Nov 2022 20:08:01 -0000
Date: Mon, 7 Nov 2022 14:08:01 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass: do not hard-code
 clock-output-names
Message-ID: <166785167860.1524281.4239012568327496150.robh@kernel.org>
References: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
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


On Thu, 03 Nov 2022 15:53:39 -0400, Krzysztof Kozlowski wrote:
> The purpose of clock-output-names is to customize desired clock name,
> not use one, same name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 3 +--
>  .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 3 +--
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml         | 3 +--
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml        | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
