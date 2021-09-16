Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E788A40EB5B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 22:07:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029BD171D;
	Thu, 16 Sep 2021 22:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029BD171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631822849;
	bh=D5QWilFcllRfFHfNxHrPHWxp2fg187TmCTdbRYxsXN0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qVFlTNFrtYR9m71UjajJHSHkX47Qld2uEc9AEPxjrkR+jPc20hDNo0mzM9+I9qczp
	 Y5mon8xmWVcuUmiVm784/bByKNzCu1qoujUAj53Zc0V7Hpg4koFB87gHNIyge1WbU0
	 uRNDrIUIoxU7URYksNK7lbTLlss6B7Uli60IBIn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5947FF80271;
	Thu, 16 Sep 2021 22:06:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF46F8025E; Thu, 16 Sep 2021 22:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 187D5F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 22:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 187D5F800D3
Received: by mail-ot1-f41.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso9798768otv.12
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5lWEoobnSX2Sexj5hgiNgOeTqX4T0+Y1JT62ALjxDZE=;
 b=mF8O/YGBk1ddOUwOTXX/kbw+K3EqrnBNfm5IIrh9vev4yE2EoxDAlUopsBTmGVkd5d
 qAiy6692Yvfdas/iZGDIIwuU8YSPOc7ym7AaZNR9KEw/HqjBHf2jwKGGr+AIzBuUSxeW
 eanH2k5gd9bJ5DsS3/yGGbLZb6BWTaFbVC3Ib2ukNRu/N651EXVVnKSI0Kax3zJn+psH
 UZvY45naqMU2ptGXXDb/qUGBHdth1Y+9rSArvtW1oUjK2QSYEZmX7s5uUCdDwAH9FBGv
 ziyulefw39G4j8W2xgs1u+LAKR4XSOKUf9ROpoXgFD1eeG8Zafg30teMdLD79/2Ug8BG
 atZg==
X-Gm-Message-State: AOAM533cL9IwX7bfjPOPqbjmEkbefcHDXwbQsoLwncGfoa83i0WcITz3
 bLiCGcxarxFVBB/1EFXt5Q==
X-Google-Smtp-Source: ABdhPJzt7s1DZUK4KXAYYEX4XQhq3SY6wPqa8zSGfTEQE9dKzUeaiwe7+MrNsKvWTDdy08qzNsEtsQ==
X-Received: by 2002:a9d:7299:: with SMTP id t25mr6338307otj.232.1631822761230; 
 Thu, 16 Sep 2021 13:06:01 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id u19sm919455oof.30.2021.09.16.13.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 13:06:00 -0700 (PDT)
Received: (nullmailer pid 1406472 invoked by uid 1000);
 Thu, 16 Sep 2021 20:05:58 -0000
Date: Thu, 16 Sep 2021 15:05:58 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v6 13/22] ASoC: dt-bindings: add q6apm digital audio
 stream bindings
Message-ID: <YUOjpvKfHdDdQlmT@robh.at.kernel.org>
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-14-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915131333.19047-14-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 bjorn.andersson@linaro.org
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

On Wed, 15 Sep 2021 14:13:24 +0100, Srinivas Kandagatla wrote:
> On AudioReach audio Framework, Audio Streams (PCM/Compressed) are managed by
> Q6APM(Audio Process Manager) service. This patch adds bindings for this DAIs
> exposed by the DSP.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,q6apm-dai.yaml        | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
