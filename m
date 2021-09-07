Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E731F40313D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 00:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F6215E5;
	Wed,  8 Sep 2021 00:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F6215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631055451;
	bh=V+rz2km+G7k/eVcLPCjhKtj5FCMOq5/z2vx9/KNbqKw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nji3psXWzhI2bBYkPwHUWjZdI3Hu3cvZAFxvvRXZ9w8u/hmJF7Odauh7ngYeLepUi
	 voIA9C+EBwpfuwi3ZzDBHKm/3+3nJfVw6HhC1zDAor8iOVFUH36XDFcf3XSitsahkn
	 qzz5i8KhrP+jJ2QEyNHzuR/M7aHdojDFrQwETqcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E8BF80253;
	Wed,  8 Sep 2021 00:56:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 282F6F800C7; Wed,  8 Sep 2021 00:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE806F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 00:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE806F800C7
Received: by mail-ot1-f48.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so363054ott.10
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 15:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nj4t14lAuTMyn+FACiJr8wE2hMCAXco8zJ7uJLXSnOQ=;
 b=V9qsvBV6xVMzoRvGj5UGB/EhUH4ckk3XHm4LAhLpVo+3Hkt6ILVVyX7C+nfAkLlUUS
 7rX3pGuqvRrzp4z96+R4B2OPX5Mgst1yDzsXPDwIzE9Zrmk4qt3go15n7nJbgiS8sjzR
 t8j70t525Mic090LAMhZrA2cAx2TeJzUs0pUCZCGLYecxaRHiX6vmNXXOcnSQaKhJ+44
 kEehz+kQeSB8IHRGrw0n83zuUv4QBKiOAxevajKKBmQwhgY80edm42p0TrIC0FxxMVOz
 9L1qqtn7EXnh1QKmn+492jky6gBPULmIni5zxBCxxEN3B435MGPAWIwMbuk96uiCtviI
 KITg==
X-Gm-Message-State: AOAM532/sbW5pC+wG/xr8wlayjv3tkxjl88ptyF/p9skS8z1IQeWxA/r
 5Oo0N90N7qBXCFz20gTZXg==
X-Google-Smtp-Source: ABdhPJzj/sKxwoJecCW1XMdtUAm1bpD8qW9nc6wAweqow306DZaFlxJnYKhV77v7qvQvx9neUQxV4g==
X-Received: by 2002:a05:6830:918:: with SMTP id
 v24mr630891ott.157.1631055365920; 
 Tue, 07 Sep 2021 15:56:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 3sm54844ots.61.2021.09.07.15.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 15:56:05 -0700 (PDT)
Received: (nullmailer pid 514132 invoked by uid 1000);
 Tue, 07 Sep 2021 22:56:02 -0000
Date: Tue, 7 Sep 2021 17:56:02 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 08/21] ASoC: dt-bindings: rename q6afe.h to
 q6dsp-lpass-ports.h
Message-ID: <YTfuAqZ6/Ygb1Dyc@robh.at.kernel.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-9-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903112032.25834-9-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
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

On Fri, 03 Sep 2021 12:20:19 +0100, Srinivas Kandagatla wrote:
> move all LPASS audio ports defines from q6afe.h to q6dsp-lpass-ports.h
> as these belong to LPASS IP.
> Also this move helps in reusing this header across multiple audio
> frameworks on Qualcomm Audio DSP.
> 
> This patch is split out of the dt-bindings patch to enable easy review.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  include/dt-bindings/sound/qcom,q6afe.h        | 203 +----------------
>  .../sound/qcom,q6dsp-lpass-ports.h            | 208 ++++++++++++++++++
>  2 files changed, 210 insertions(+), 201 deletions(-)
>  create mode 100644 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> 

Acked-by: Rob Herring <robh@kernel.org>
