Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065B51C61A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 19:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00AB91801;
	Thu,  5 May 2022 19:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00AB91801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651771801;
	bh=ZDrNz7flS+kThNwE8UKLYgVplIHajZCYyp4JprB944E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aezMWeWKGn8izT4STg/koM1NEbpILIeHqXUDzhAv+O3CDKznhN+f4NRdmusk27Uot
	 icvs+XtzHxfiDxKyOQWT+G3ewhd3krXLFN3lWi7Ovof4WqV8J0d5lB5Gv7msDIXV7s
	 Q+hKuqV2D1tUuJNmrAZTbympHNsICOiVs/t43Bno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6217EF8049C;
	Thu,  5 May 2022 19:29:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE8DEF8016B; Thu,  5 May 2022 19:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF05F800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 19:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF05F800D3
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so4484203fac.9
 for <alsa-devel@alsa-project.org>; Thu, 05 May 2022 10:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NzMllqiCFMSk++1Pf8cggGcUFRMwRPHIUtf9ChBPQE4=;
 b=65zcvJrzX8smstAFLvME8PvsepINWFJATbo0X7Gh5mRX9BeRZBjg08RM9RI1d/XbON
 08dG0b0/gie6MvUBqcDDowB85G6UlOK3knRY+XcetoWGjziV29EVe9+vck3LFtCnwAmv
 I4T6aQ8V+eN/S54WRnYOjZnxPfZG1/uSKieMsW0/8w8CzD+R/8YCmdHTdCnVGob6WsIC
 YO+Sf/nAGv3Iq3FyJ/9XRZp8dRHjkyMAwYdqQsJFTdzxgVbY7N0aKrbKat7IHNDS1uZ1
 b7sqQFOqXnPZpbpWUltagqTGFvL+w+b6VrQCgQg+vP+3PajuuoVOVvrK5iKU8uzeMco0
 A4qQ==
X-Gm-Message-State: AOAM532UtZ3NE3Ivd6lFmVeOBK1viLjYMUlGaUuKzgxNaL6PF9ZkwAu0
 8NRmuuU2hvwfO8j/0dp8Bg==
X-Google-Smtp-Source: ABdhPJzbXUwqoOg2gQXT0rMHnNjixszBCvLaQ9ZH5Ha6xdImgOnprzJQzhB5X/rjzTxXqavjGonlkA==
X-Received: by 2002:a05:6870:4788:b0:ee:3a:8ab3 with SMTP id
 c8-20020a056870478800b000ee003a8ab3mr2604860oaq.231.1651771726859; 
 Thu, 05 May 2022 10:28:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 187-20020a4a15c4000000b0035eb4e5a6b0sm1034639oon.6.2022.05.05.10.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 10:28:46 -0700 (PDT)
Received: (nullmailer pid 4076881 invoked by uid 1000);
 Thu, 05 May 2022 17:28:45 -0000
Date: Thu, 5 May 2022 12:28:45 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: sc7280: Add compatible
 string for adsp based platforms
Message-ID: <YnQJTY21QnETY0z+@robh.at.kernel.org>
References: <1651672580-18952-1-git-send-email-quic_srivasam@quicinc.com>
 <1651672580-18952-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651672580-18952-2-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, bjorn.andersson@linaro.org,
 tiwai@suse.com, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, agross@kernel.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Wed, 04 May 2022 19:26:19 +0530, Srinivasa Rao Mandadapu wrote:
> Add compatible string to support adsp enabled sc7280 platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
