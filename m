Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD55989A7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 19:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34312166A;
	Thu, 18 Aug 2022 19:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34312166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660842744;
	bh=KOosm6/FKWJn65zFjLJpwFNGy8mO46UM/+Wolr1uyR0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVeDfo7VWlgeTm0ds0QfmW1jJGqB6kxuIzuVHK52ztMHzmyMR2Ry3aZAQ7S9G/oVw
	 Z3DrIizAcGfmWtJ50pV1R6OgsVY+shE0OEYV6541c6FJ8qy0Ea8DTjQjK1GcOVGTH9
	 RPWz2uppDuLhmaCCwbpx3s+4T3cWFC/GjBdUXKDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D047F80495;
	Thu, 18 Aug 2022 19:11:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79E1CF800E9; Thu, 18 Aug 2022 19:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C2DFF800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 19:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2DFF800E9
Received: by mail-pl1-f177.google.com with SMTP id x19so2034289plc.5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 10:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=UkBra3gVOO8ib+l1PZXu0p1ulXBzkwr8s3bUgaBZ/K8=;
 b=IzycFqHC950NUEPMk9Sw9AqLKkumaX91H7eg8dr6lTKIEsect366bpPcKlWvzyUSiR
 ofy4bKglKr32+lxHRsugI/aRp7gDxZwUAHy3NXHXgbU6tU4Tz3Et4R5W9hRE7JTnfqWC
 XaX4px58dvnzwLJBpJ6EhcytUS38A1ATRxNmECaWsolONCEGSG+lm7PfI0be/gsZd2Rg
 c1Bqj/6sAfhyXi2I5snHDQ1+jcOkkm+Kc13oTnK6CfpTxvY2EiClwfjIhwFDoK8dad+j
 +G9xkUq08eGsPwARQzTqhdNSCBOIykP4QKm2evmJXIGrMZpVOwLQDJtrlpio+4p3tvmK
 jNlg==
X-Gm-Message-State: ACgBeo07maJPms6/Fwrf7nife+yTRM6gvXj5hBTETfGo95D19Hl0Dv1g
 HswUoQ/Bd8QRlOPsfxD8IA==
X-Google-Smtp-Source: AA6agR7B6dYCsFfF4wBcu8MtvLiFnN/aVGCtQghP/Tl/gPgbvyxd+EHMIWOZik0LVYNMxuQPMADzrw==
X-Received: by 2002:a17:90b:48d0:b0:1fa:b438:1b20 with SMTP id
 li16-20020a17090b48d000b001fab4381b20mr9048996pjb.239.1660842674884; 
 Thu, 18 Aug 2022 10:11:14 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170902eb8400b0016c9e5f291bsm1592907plg.111.2022.08.18.10.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 10:11:14 -0700 (PDT)
Received: (nullmailer pid 2044597 invoked by uid 1000);
 Thu, 18 Aug 2022 17:11:11 -0000
Date: Thu, 18 Aug 2022 11:11:11 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/6] ASoC: qcom: dt-bindings: add sm8450 and sc8280xp
 compatibles
Message-ID: <20220818171111.GF1978870-robh@kernel.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818134619.3432-2-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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

On Thu, Aug 18, 2022 at 02:46:14PM +0100, Srinivas Kandagatla wrote:
> This patch adds SM8450 and SC8280XP compatible entry for LPASS TX, RX, WSA
> and VA codec macros.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml          | 2 ++
>  .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml          | 2 ++
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml          | 2 ++
>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml         | 2 ++
>  4 files changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

