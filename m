Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46FA53BACF
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A8717A5;
	Thu,  2 Jun 2022 16:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A8717A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654180433;
	bh=GR6ytAulf9Bnx4T/vaky7I5J05Rd2e2aa8JDjrXPmjg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLapr8h6QHkLxuwYYGpA5YNYW92NelMssZOAyAmXtvdiIIvz3vbmOBTK615CV43gv
	 4dS0LDpXg2uV1mXVF1aX+ZzKYNx2zWo6E/ic6oR3si0nCKB2wDl6UAdY386tufRzbW
	 r/SVlsFye2rzjgDeYjWs9nyR/DNvPvZc6WNoq600=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E73F80158;
	Thu,  2 Jun 2022 16:32:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1628F80149; Thu,  2 Jun 2022 16:32:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACAE1F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 16:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACAE1F80149
Received: by mail-oi1-f172.google.com with SMTP id i66so6705595oia.11
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 07:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+XaxE4rPLjVoV9JRTROBnf5ZLA1J4kOTKBNPishDofY=;
 b=TFWWlmEt385qnuHfAyCR1TtX5qzvLC4AiTInY3acpdRiFxCrsONzUZMniNR0BHtLuX
 SQ84IE12VL6ZG74k54nSES44B+/TjvhcwUGrlvW+KNY0bJxuz+M1TMsc3hdn1fOUhC8c
 6Xk9Zl5sWMcA6w9a0b2IHIJ35w/0hlmz+nYh7/STOqoJWEiu3AG3Nu31RshKI5MtgJRa
 y4dwh8rJ6jUsHRphL8INrVnJK3gxG0awamFyP0DcT3aNEOuwGnPItEhL7ELEBNiJE5Yy
 n5b24RmRn8NJHbCdwM5yL4UlZLJXOq51gb/3+qD5BLidlI3WVUtShwUlDwzRMPjrW7yO
 ax4A==
X-Gm-Message-State: AOAM531CvPZTNtKQiEmaPSDPasFc6AD2FfS4KcRhiFpAu7h0DXn3XGqL
 4w4psnSU1qcKHWj8zfFm+A==
X-Google-Smtp-Source: ABdhPJyWiiAKe/UbWmNUNQ/FQ+S2DMuUIpmbFtfNXN9RGhS3gWjfztpwD6ap26gWXzQPR8y2FqhZwA==
X-Received: by 2002:a05:6808:17a8:b0:327:9efa:cf1a with SMTP id
 bg40-20020a05680817a800b003279efacf1amr17612095oib.81.1654180366543; 
 Thu, 02 Jun 2022 07:32:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k13-20020a54470d000000b0032603df9d24sm2232704oik.47.2022.06.02.07.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 07:32:46 -0700 (PDT)
Received: (nullmailer pid 2261171 invoked by uid 1000);
 Thu, 02 Jun 2022 14:32:45 -0000
Date: Thu, 2 Jun 2022 09:32:45 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: lpass-cpu: Update external mclck0
 name
Message-ID: <20220602143245.GA2256965-robh@kernel.org>
References: <1654169206-12255-1-git-send-email-quic_srivasam@quicinc.com>
 <1654169206-12255-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654169206-12255-2-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org,
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

On Thu, Jun 02, 2022 at 04:56:45PM +0530, Srinivasa Rao Mandadapu wrote:
> Update "audio_cc_ext_mclk0" name to "core_cc_ext_mclk0",
> as MI2S mclk is being used is from lpass core cc.

This is safe to change breaking the ABI because ...

Names are supposed to be local to the module, not based on their source. 

> 
> Fixes: 98b7630a583f ("ASoC: dt-bindings: lpass-cpu: Update clocks and power domain names for sc7280 platform")
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index e9a5330..8438ef77 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -195,7 +195,7 @@ allOf:
>            oneOf:
>              - items:   #for I2S
>                  - const: aon_cc_audio_hm_h
> -                - const: audio_cc_ext_mclk0
> +                - const: core_cc_ext_mclk0
>                  - const: core_cc_sysnoc_mport_core
>                  - const: core_cc_ext_if0_ibit
>                  - const: core_cc_ext_if1_ibit
> -- 
> 2.7.4
> 
> 
