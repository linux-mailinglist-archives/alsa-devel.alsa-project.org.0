Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692606617D8
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 19:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF4C9D4C9;
	Sun,  8 Jan 2023 19:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF4C9D4C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673201421;
	bh=3k/1DlNzqGf6yvH4EPBRl17LhS1rV2YcaZRx/UFULrw=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rlGAzhqe7HQ+KSbVU9XMG3DZ/cEbtLlysuTXpSdGd2T6h+T1GzmOhAslCzcuku7I7
	 jjLP24BGPaAH87YoLmVO3U3xGbyBj+kh8w1k+UYArzk76Plncq5NmxMo2uQ0rZgKPR
	 QYBVhFuS9HxchDKzjIRbP1L0EXDvCmm1DLMFGtR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 984C7F80236;
	Sun,  8 Jan 2023 19:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C1D7F804C1; Sun,  8 Jan 2023 19:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F598F80236
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 19:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F598F80236
Received: by mail-il1-f171.google.com with SMTP id bp26so3845692ilb.3
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 10:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXsurnTQkqDtvp9r1jTD8u+Cgja6sWV8sbpQiCK0ozc=;
 b=3ZgazfX9v600wYZjj0VaHKU2yHvDJlSWIPA2u/mIUIwj0a54X6yWwEWq81h7UZ0+Wh
 JsXeo8mXoHQrWH5m58qVhfyWfVxcD8AwG8v+y2Ay+k55nxGlo90oLfFGUtosJ5zBgTIk
 ObLI22QUCovdKTHd++bpyAsfZzR9OFgbk1ipjmNL/KEBxyEzRaInzeTkWlsj1FlGTxnU
 vva/jnVsdXpQx+4IyiDpEvRcd2pVAB0sp9ra7j9ELHaqu8SxgQXbXdTb2iJRv2lubfcB
 eMoDTN+dSF7mJ+dVShevI5Uvxus7XjoLYnBrUwk7yZmDd16efGpZ2LbyP9Yc1/eiuu/p
 EVPQ==
X-Gm-Message-State: AFqh2kqioshUs5vKcdA/kd0bX3MDZChzgFXoEL/tvW//z51v3xZkMN5V
 eXW0j1fj+cHWYRz8Ao93iA==
X-Google-Smtp-Source: AMrXdXv3wAOICdNq1RPiqJO8HCMJFqLidp5nT4nWPpEzahC2yfHFyjFRoBkR6WUu63GwD35MlGS+Cg==
X-Received: by 2002:a05:6e02:2217:b0:30d:84be:725d with SMTP id
 j23-20020a056e02221700b0030d84be725dmr9994617ilf.22.1673201355793; 
 Sun, 08 Jan 2023 10:09:15 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 c72-20020a02964e000000b00363d6918540sm2067426jai.171.2023.01.08.10.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:09:15 -0800 (PST)
Received: (nullmailer pid 152523 invoked by uid 1000);
 Sun, 08 Jan 2023 18:09:11 -0000
Date: Sun, 8 Jan 2023 12:09:11 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct
 clocks on SM8250
Message-ID: <167320134913.152434.15549162581347874733.robh@kernel.org>
References: <20221225115907.55250-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221225115907.55250-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Sun, 25 Dec 2022 12:59:06 +0100, Krzysztof Kozlowski wrote:
> SM8250 DTS uses additional "va" clock in WSA macro device node:
> 
>   sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'va', 'fsgen'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 58 +++++++++++++++----
>  1 file changed, 47 insertions(+), 11 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
