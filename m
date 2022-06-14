Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F054BDB4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 00:36:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059E11902;
	Wed, 15 Jun 2022 00:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059E11902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655246181;
	bh=PR/FC6FdEwDPTUhHOJEarVS8tcYuxXQ0ps6kN0DWERo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSC24SSoZFfDOE0XNf4SxKW5pr+q0GJvlbhzXmjh2d+5j60BiMwKlMFL3HlfCoY6i
	 QwutptKcbJX8fYd0w7qSOVj7XqA2oeUXgoAB4WSBs0tmfpwNaP1FnqcsNuXoUmUpzg
	 G4XaI6QrMJ4BPOsnFESQTg4g9d0Ok0zgB6oQSphU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C72EF800E1;
	Wed, 15 Jun 2022 00:35:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A895CF80139; Wed, 15 Jun 2022 00:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558EBF8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 00:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558EBF8012B
Received: by mail-il1-f173.google.com with SMTP id v7so7637368ilo.3
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 15:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aemasrqfwaW0xVRSjSqdQ4JfxZy0TQey0iT9bogvqO4=;
 b=4U//aXqTPxKqxAXo2Qor61XB4JTybcdfX9gNAymRuiDr9L18HzjzBNYkipsm2hhRlp
 kb/n41BDaGuYvwvBsWzwbgzka5ix+j0BdQSc0zkW2CBX0u999W1ZWwZtYsaEX7re65Bm
 MKHTXt0FoBmLlTFAAR3nP6sYg9PpRBNNJjoLgLH5W21IwDfUTGAOl6H32p30S8QUDPRA
 ee47fwvbbvwuR8MLfDvq2w35n4ajwdTjL/BSjMWbpDT62HHwNZDsyPwRlMwX/LPHt1tY
 tvVQGR1GYEgOLIKC1tUahwxNYAdYc5aWFd9PvYVKp7okJ4e8pmOQdGdn58u7rSRRQcWg
 3SrQ==
X-Gm-Message-State: AJIora8P4Ii9BIyLWI44lbD3xnZDoZMHI8dJ5b6IFNQxRtMRoqTpisdr
 ifDOjetotzJASokN9kIWig==
X-Google-Smtp-Source: AGRyM1u3MB5UawW2+wt5tCmnlp/5KvqCGJhKl2Um3Et1tsrwULWDyKeKydmmaAcZFCt/295nVoKx5g==
X-Received: by 2002:a05:6e02:1448:b0:2d3:c5c2:fbbe with SMTP id
 p8-20020a056e02144800b002d3c5c2fbbemr4528164ilo.188.1655246111376; 
 Tue, 14 Jun 2022 15:35:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a92d184000000b002d3c1859791sm6040316ilz.60.2022.06.14.15.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 15:35:11 -0700 (PDT)
Received: (nullmailer pid 2855592 invoked by uid 1000);
 Tue, 14 Jun 2022 22:35:09 -0000
Date: Tue, 14 Jun 2022 16:35:09 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: sc7280: Add boolean
 param for ADSP bypass platforms
Message-ID: <20220614223509.GA2855511-robh@kernel.org>
References: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
 <1654921357-16400-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654921357-16400-2-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, swboyd@chromium.org,
 linux-gpio@vger.kernel.org, srinivas.kandagatla@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
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

On Sat, 11 Jun 2022 09:52:36 +0530, Srinivasa Rao Mandadapu wrote:
> Add boolean param qcom,adsp-bypass-mode to support adsp bypassed sc7280
> platforms. Which is required to make clock voting as optional for ADSP
> bypass platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
