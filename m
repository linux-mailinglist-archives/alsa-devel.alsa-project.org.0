Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC014CE037
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 23:24:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B625E1F4C;
	Fri,  4 Mar 2022 23:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B625E1F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646432646;
	bh=MS0UGMZde72fEQKf4zfujK88MIfAq1erjmoXLVPA7SY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bUWC4UF92bDrklTeDAxLu8/eavS1jnoD2aNR9hZCaeZ0PUe85Nm1Vc+P9logxmYAN
	 zyvGUye4wgCBHqIctiAG5F9IvTy1AdPmKFI0n+RWQNZEVuL3J/Mvoplt9TttFL/qDy
	 lrCdeFuQU4lAAQ2UjocpzLM4gE1y2y2KX5HtvIwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2450EF801F5;
	Fri,  4 Mar 2022 23:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58E52F801EC; Fri,  4 Mar 2022 23:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEE20F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 23:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE20F800F0
Received: by mail-oo1-f47.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so10987080oot.11
 for <alsa-devel@alsa-project.org>; Fri, 04 Mar 2022 14:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FK6O8iZYd30gBa2H7oi4DqRG0FOU8lUzNheBx5but+U=;
 b=PvTevyyr77J9bG5v9RIBZD6jFumpKjHFQi0RPgDc5f6Iw7RKAu5Dhm/9+0fvJeuFxI
 UjKo2hEBIlpZaRJggxu7U4ZWLj4UBsfjVIcNDgCrWstelfpbyxhvKDQMnttTKi/Q+vZ3
 VEBO7SH/7gRADMjJw5VSWUN4gI+o+O8hPf+v6YzVriasTAen3CLJR+YlvIFNvt1Y8tys
 ihkuAh+3dcyXyD0EotZDygYny067TNEbN49xHqS5YpSd7WVgHEQ0HJEgr95gZvn3jCZP
 T5xpP4Fb/NwHpDfGgNuL1FjEcVvsapZhRNsfZ4ardlQr68J1ROe6Ft52unt0tlcqzq7r
 Hstw==
X-Gm-Message-State: AOAM530pUwboVBvcy5jrO+J1FDSYRbSu0ypY2/GJzp16ecRwmQ8oxtyM
 5vExVHPbYnk7GxwFJTfshw==
X-Google-Smtp-Source: ABdhPJw1skblzO/l37y1Ad9RMSdf/uLpokD28+b8ny8V7h1Wyw+1qpcXIpCmOYkOFGCjdu8+ICChTw==
X-Received: by 2002:a4a:d415:0:b0:31c:3fc0:74ce with SMTP id
 n21-20020a4ad415000000b0031c3fc074cemr238974oos.47.1646432567688; 
 Fri, 04 Mar 2022 14:22:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e13-20020a9d490d000000b005b029275a9csm2945058otf.58.2022.03.04.14.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 14:22:46 -0800 (PST)
Received: (nullmailer pid 546919 invoked by uid 1000);
 Fri, 04 Mar 2022 22:22:44 -0000
Date: Fri, 4 Mar 2022 16:22:44 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: soundwire: qcom: Add bindings for
 audio clock reset control property
Message-ID: <YiKRNFONirytK+4X@robh.at.kernel.org>
References: <1646316128-21082-1-git-send-email-quic_srivasam@quicinc.com>
 <1646316128-21082-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646316128-21082-3-git-send-email-quic_srivasam@quicinc.com>
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.com,
 rohitkr@codeaurora.org, quic_plai@quicinc.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, agross@kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, robh+dt@kernel.org,
 swboyd@chromium.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 judyhsiao@chromium.org
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

On Thu, 03 Mar 2022 19:32:08 +0530, Srinivasa Rao Mandadapu wrote:
> Update description for audio clock reset control property, which is required
> for latest chipsets, to allow rx, tx and wsa bus clock enabling in software
>  control mode by configuring dynamic clock gating control registers.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
