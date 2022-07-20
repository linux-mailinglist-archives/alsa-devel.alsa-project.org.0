Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31957C04D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 00:50:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CE4171E;
	Thu, 21 Jul 2022 00:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CE4171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658357457;
	bh=7Ojt3CX15UvoHff8VnbbWmHQi/8vHqneDa0bZfmBPwg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdjcT9zcuG2+vbP0DrrcS0A4Rhq6gLcfpXRQ6Ud3Xu/SHsh8wIt4zXkii1mMxiFy0
	 RL76HnTr4iE0yrTcGg7b+raWtB2YbbgGgqctcS5Wm8K4JN3noqkmfDgwTSjZHzfNzU
	 m5ChbFdpeMD5nknrVERBniezZUKdj9+nuercd2fU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB711F80125;
	Thu, 21 Jul 2022 00:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A888F8025D; Thu, 21 Jul 2022 00:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4300EF80139;
 Thu, 21 Jul 2022 00:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4300EF80139
Received: by mail-io1-f53.google.com with SMTP id h145so53091iof.9;
 Wed, 20 Jul 2022 15:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uudCfMoYFHaWIp2NdRpHUhHzsRCrz4L8cMx9XDQIpNg=;
 b=K3P1Q9eQ6y3tots/p/EHuZWPUUaG5WtX+SRDIoMHnSNMP0AwF3BQlaPsj0Kb2dSHyq
 0JOPPR8F0Zwj5yV9y7bmcC2Pe9bZ1dZwhqNFpdXV2Jha/8Atm7MMQRYzCbryKccT8AeQ
 to5/NiE15aPTRUqhHszIKhxzTCNUKaRRne8Ak2f8j/wyvKX7G7BT3bASAh6oEV1Aa8RD
 46EWIq9LhqPDEn3vPc093Wac8WpCDxsIy6Dj+/0SuQcnoRvp1QIQfwD9Q2XkZOByK30D
 wsiFOMsUWvLWjEt0CLrzuOyjMJuj57mu7g5h8HJALHP8ljaQZbCK9fXFmRVdbgbkDNjW
 tiag==
X-Gm-Message-State: AJIora8ezJgWr3bPiGomkwUFwlHNWRVE3bdyS+4lFb89BqTIatvC291U
 21I7c2EzoemAqgnfoxNdBg==
X-Google-Smtp-Source: AGRyM1ucXvmUfKZSjkYIDpngUX5sujdw4QIMe7LofXXXuxjWnLitU/7340g3Wumifxlei+fOqJ2uLg==
X-Received: by 2002:a02:84e2:0:b0:33f:7ec1:b430 with SMTP id
 f89-20020a0284e2000000b0033f7ec1b430mr21553218jai.63.1658357381015; 
 Wed, 20 Jul 2022 15:49:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a026306000000b0033ec45fb044sm79055jac.47.2022.07.20.15.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 15:49:40 -0700 (PDT)
Received: (nullmailer pid 4125435 invoked by uid 1000);
 Wed, 20 Jul 2022 22:49:38 -0000
Date: Wed, 20 Jul 2022 16:49:38 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] dt-bindings: dsp: fsl: Add SOF compatile string for
 i.MX8ULP
Message-ID: <20220720224938.GA4125402-robh@kernel.org>
References: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
 <1658208367-24376-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1658208367-24376-2-git-send-email-shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 krzysztof.kozlowski+dt@linaro.org, yung-chuan.liao@linux.intel.com,
 sound-open-firmware@alsa-project.org, shengjiu.wang@gmail.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org,
 festevam@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
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

On Tue, 19 Jul 2022 13:26:07 +0800, Shengjiu Wang wrote:
> Add SOF compatile string "fsl,imx8ulp-dsp" for supporting DSP
> device on i.MX8ULP platform.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
