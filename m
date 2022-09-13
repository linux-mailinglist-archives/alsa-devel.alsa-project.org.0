Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7655B7246
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3F9117E6;
	Tue, 13 Sep 2022 16:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3F9117E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663080901;
	bh=DawFwVN2MRFNi0HtKDuJgxszSQF3d0uU/4Es/JoXnY4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTiyxWCzt5rME/o5ku4RzPLWozIMu03YsQCTxd1SbEGnlOc9Sg9LYgKgOUBkHN/y9
	 6nVQBcIYTR4FSPfyd2lUUQMpOykP46Lr+vmxR2UH69AtTDO68I3sTxXnPZKblHXkzd
	 E9yPQM6MvGH12LrGLVPq9SvhO9vCAkEDBdQ/DGV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F175F800FE;
	Tue, 13 Sep 2022 16:53:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA38F800FE; Tue, 13 Sep 2022 16:53:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B19F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B19F800FE
Received: by mail-ot1-f41.google.com with SMTP id
 d25-20020a9d72d9000000b00655d70a1aeaso5171870otk.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=TSHBRN52piGzyQ2SeaWNnzbJL+eY7oEAdsKsIXmbyJg=;
 b=oKvuCgSbgebmtW3BfSS3ZXwO1bpftG/X0RI4XFcN3uwYU1hKa3DmV0w9GPHgOtqQqb
 S38GlTgv6KZ6sQ9UptcO0j6H/KrGfAJsyagO/S2uv9Bx8wFzTcbjl+dnXU3kThMtCcKR
 11be+xiyDyE6XMaHPIgZHbzCzpaMPn0MvsBkMaMynT5eMypvhlMUxz8Of7nPUEWCLN26
 a/DEaex03GQn2dOfdM7iShdT4NATmLOgLjmJYPVRHC0CA9xWG973ZqRZzKSubXq7aDov
 hWDD3hutywKiUi/QMYfZuuKPLKNHQ7M4m0fF4Qf0+OWGbbKk/mMgrIQVP3m2qtamzqpy
 Lb1w==
X-Gm-Message-State: ACgBeo1pQbL2vlvdrO+mCB6tBHOIjjuJqruW2p7/BSLU2AoLg+/Cbj01
 Joy1SMtfRyiwoP9nOGtrAQ==
X-Google-Smtp-Source: AA6agR7b4fCRQV9hAml+0stAXwKyzxgcbUAhzdygqeuyuDl9wz2tq2vdl0oglzsbrDq7JrL4VSC1xg==
X-Received: by 2002:a05:6830:20cf:b0:655:d9fd:39f9 with SMTP id
 z15-20020a05683020cf00b00655d9fd39f9mr4700196otq.95.1663080827006; 
 Tue, 13 Sep 2022 07:53:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y16-20020a9d6350000000b0065689e13f52sm592525otk.71.2022.09.13.07.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:53:46 -0700 (PDT)
Received: (nullmailer pid 3658100 invoked by uid 1000);
 Tue, 13 Sep 2022 14:53:45 -0000
Date: Tue, 13 Sep 2022 09:53:45 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 13/15] ASoC: dt-bindings: qcom,q6dsp-lpass-clocks:
 cleanup example
Message-ID: <20220913145345.GA3658055-robh@kernel.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-14-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220910091428.50418-14-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-kernel@vger.kernel.org
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

On Sat, 10 Sep 2022 11:14:26 +0200, Krzysztof Kozlowski wrote:
> Cleanup the example DTS by adding APR and service compatibles, adding
> typical properties, using proper device node names for services and
> fixing indentation to 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Add few more properties.
> 2. Adjust indentation (better).
> ---
>  .../sound/qcom,q6dsp-lpass-clocks.yaml        | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
