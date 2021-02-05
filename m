Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F276310D2B
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 16:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E141660;
	Fri,  5 Feb 2021 16:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E141660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612539080;
	bh=aaNpHSrAbziV+lj7uVZN4PJh02SCtlzj//gifPhK7hU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pCXCIlsF/6/SLzbvsui49WKMME7NQieq2kbN8K0oBeYmCmtYV0rZ8RJZhQxXZTykd
	 TzJZz5jX5L669Mjh31CdODc+UP2FvWeF1Ms1j0xUEiiDDdYjgmu0477yF6BrC+8NIJ
	 Jf6VBEaE0lgkHA/OoYxFqDN/iEhT/kwKftOQNFAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2B9F8016E;
	Fri,  5 Feb 2021 16:29:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F05F80152; Fri,  5 Feb 2021 16:29:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7527F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 16:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7527F80139
Received: by mail-ot1-f52.google.com with SMTP id s107so7206504otb.8
 for <alsa-devel@alsa-project.org>; Fri, 05 Feb 2021 07:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pcsL3L96/P432KRfr8meKABbNCvH15jFgDBOX8Jm7VI=;
 b=HYBRbO4KJnhN+9oWLVvbrgGHiwsXQ+2RVnub88tIU9WesFHiZs2yOEk5rPyrYNt6a+
 LcR9g6hBYLlAALe7JYPsgdnbRFDXrpl+CDMCy9PlLu506ive18qXPlY4IXQkjI1pRGNF
 2xvKpZHyiXYpk9eZmtuHmN7KuQvGJn6rQZFremIQTvFD6L/lSZMiq4ojBBue7PM238Xh
 L7S/5j8B3a/Cmdf1TiRIBkG2sG3idfMLI1KpYSsAm64a9FDrA9seCht2FeHXbx0lRFck
 e/N00URFto7dWYexmJfds34uggx/x6K5bU6kKAdkhQDQjSE2E/ir6sX0NO4A/4ikv0EK
 vLEw==
X-Gm-Message-State: AOAM533oCzMwALbYMVK9NgO7VQpfnl+m4mAx/WyB7GIno2orIqtzNUNm
 NvQRYlQl+/UoHMRpR/FnJg==
X-Google-Smtp-Source: ABdhPJxLyz2+vEYLPJbIMPPyf8v4GvRxCn/U3G5BbJvdBxOFydbP+SUTyuGP9TUEoUo40pZqggc4Gw==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr1344536oth.115.1612538975799;
 Fri, 05 Feb 2021 07:29:35 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 62sm227063oii.23.2021.02.05.07.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:29:34 -0800 (PST)
Received: (nullmailer pid 3090591 invoked by uid 1000);
 Fri, 05 Feb 2021 15:29:33 -0000
Date: Fri, 5 Feb 2021 09:29:33 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 1/9] ASoC: dt-bindings: rt5659: Update binding doc
Message-ID: <20210205152933.GA3089668@robh.at.kernel.org>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611944866-29373-2-git-send-email-spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 Bard Liao <bardliao@realtek.com>
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

On Fri, Jan 29, 2021 at 11:57:38PM +0530, Sameer Pujar wrote:
> Update following in rt5659.txt binding doc
>   - Add JD source for Intel HDA header: Commit 041e74b71491
>     ("ASoC: rt5659: Add the support of Intel HDA Header")
>     added driver support. Add missing info here.
> 
>   - sound-name-prefix: Used to prefix component widgets/kcontrols
>     with given prefix.
> 
>   - ports: Helps to use the Codec with audio graph card
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> Cc: Bard Liao <bardliao@realtek.com>
> ---
>  Documentation/devicetree/bindings/sound/rt5659.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
> index 56788f5..c473df5 100644
> --- a/Documentation/devicetree/bindings/sound/rt5659.txt
> +++ b/Documentation/devicetree/bindings/sound/rt5659.txt
> @@ -37,10 +37,21 @@ Optional properties:
>  - realtek,jd-src
>    0: No JD is used
>    1: using JD3 as JD source
> +  2: JD source for Intel HDA header
>  
>  - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
>  - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
>  
> +- sound-name-prefix: Please refer to name-prefix.txt
> +
> +- ports: A Codec may have a single or multiple I2S interfaces. These
> +  interfaces on Codec side can be described under 'ports' or 'port'.
> +  When the SoC or host device is connected to multiple interfaces of
> +  the Codec, the connectivity can be described using 'ports' property.
> +  If a single interface is used, then 'port' can be used. The usage
> +  depends on the platform or board design.
> +  Please refer to Documentation/devicetree/bindings/graph.txt

Please read what that file says now.

> +
>  Pins on the device (for linking into audio routes) for RT5659/RT5658:
>  
>    * DMIC L1
> -- 
> 2.7.4
> 
