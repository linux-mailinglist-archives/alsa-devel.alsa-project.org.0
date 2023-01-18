Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B769672409
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D71344E7;
	Wed, 18 Jan 2023 17:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D71344E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674060609;
	bh=eyVl9mVLCzZwPHdiHntaix+p6qeOxBxpNIbfwNARgXY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s5neqvA1NekVOx1KCDaxRl2uvhgcbW/epVd+zEolPWffQI/C6T8gB/1VwGguvMe/4
	 zIh6yWRTdZ+wI0WjtqJeebMy5JkGLRGVHREq6zk19HRU/VEojQyd7PDrwge8TxDARm
	 XesbemJlhamaZOrG98n+00Cx+Qd6LSjYNcPCET7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF0F8F80482;
	Wed, 18 Jan 2023 17:49:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69D1CF8026D; Wed, 18 Jan 2023 17:49:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD03DF8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD03DF8021D
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-12c8312131fso36120554fac.4
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 08:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9W9y7b/ziaOFjGUNm7d4cmFDdM4EDargAbRPiR5bNLQ=;
 b=bRDUQBHNgRFtmWyOnSPSjuAmGOZFr4p8qzWWUNjJc1SZdxCh+fdQc6cgwtAsHz716r
 4q8ZLI/OTqlJK0/H88KL4XLwcnn4HYhPnXD51y3fgbrr7S/046nOS3T0FuB0CL062dG+
 m0mab5DN7cX+A6btCk8dAB+m6dQPwvLYwe712+bs8jlvy5rdtFlLvqdrYxnbXRpNwyNf
 2Raj58WAuzNXtZc7UIY3qnWZzgRHvsxTqv4NJNWQ8VS4Q9EDDELZLsWBDRAhFIyaLRWw
 siw9M2Z5LYEUtRLLSVV9EQzM62xsViC/1BHRYSqPAn18gsGKclHsG2Y8JsniuHRwRcFo
 WDQQ==
X-Gm-Message-State: AFqh2kqaXf8Qng2rkEJwNlNTx/P/hbH79PAeNp3kebM3MEf+nKUJgVCM
 DF1ijHc0ggDlS4BHt1rJkw==
X-Google-Smtp-Source: AMrXdXtIWuC3J1y+UwrLmINbTm9kPgk76QzDW6udmvO3aPTiNNlYIcEhJTMYOiY45UdU64RY+g328A==
X-Received: by 2002:a05:6870:c906:b0:15e:f1d6:3d8 with SMTP id
 hj6-20020a056870c90600b0015ef1d603d8mr4189671oab.14.1674060545753; 
 Wed, 18 Jan 2023 08:49:05 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a056870611200b0014c7958c55bsm18632011oae.42.2023.01.18.08.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:49:05 -0800 (PST)
Received: (nullmailer pid 148495 invoked by uid 1000);
 Wed, 18 Jan 2023 16:49:04 -0000
Date: Wed, 18 Jan 2023 10:49:04 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: use fallback for
 SDM845 sound cards
Message-ID: <167406054417.148440.18145295940494067473.robh@kernel.org>
References: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed, 18 Jan 2023 11:15:41 +0100, Krzysztof Kozlowski wrote:
> All SDM845 sound cards are compatible with each other, so use one
> generic fallback compatible for them.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 24 +++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
