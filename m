Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE8310D28
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 16:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9681676;
	Fri,  5 Feb 2021 16:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9681676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612538915;
	bh=CSoC+5GROc/EUERzzPwqxgzXBlJBwflvP5g64ldun2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObiMd8/ZIbpC+4pJMSOCM04qmc5aVTrk9HWVfbMY7SraaI8XbML3qEwZFga4Fk2ft
	 Wr/JJ0PQIm/rsqsOLpexB+6CaE9lIIHzqpiFWRqwU83dANjmWzWkMxe3RrQljJ/lFr
	 iPAUpMaRPGWg/1LdRmD2Z+eEvxdgHAmJbnAdosSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D09E4F80152;
	Fri,  5 Feb 2021 16:27:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F068F8015A; Fri,  5 Feb 2021 16:26:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A057F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 16:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A057F80139
Received: by mail-oi1-f178.google.com with SMTP id j25so7836566oii.0
 for <alsa-devel@alsa-project.org>; Fri, 05 Feb 2021 07:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LBB/K1kyVMf45FQm6DNIMXTfZ1zpjCDhDz7ZekVCnj4=;
 b=gKluWuxm0O4o7t9u6wXowlzZYIYkslKrfFD2Ln+1wwC3JweHgDO/c7TlamP1Xf9J21
 2EV5WbGiRFOFBTHb8lwP0CE2sivxWMOsjhub48veKAaWVdyMrGE3G5DQQo2h/dRk6Z0Q
 0+3h2X2bUTGNV3hE9pf+cKY+51bH5eJMTslHL0OvD5CFnA1mw0C8PIFgroP1IEUBn7oK
 laTRcZiiuy47oPncfqd4kCH1Cbwdvhcx79kjk2kU1sEqDZqvrmFJfxgIQ8hjhlwX24KW
 DaYxcrIYF+rJNzIEe8JgXj81A02sheHJNNrJAgFGlrm09VCB9/ydD47UgjgdsuQIIMgN
 U4+Q==
X-Gm-Message-State: AOAM530AZ44KCB1TdiAryDOJ/X/QCi9FH56LvujIV8RjOL4AGe9rSMH8
 XGG/YhOZNToNtOLD6pioQ3Gd1cPkKA==
X-Google-Smtp-Source: ABdhPJzmDaqjU2DN6vgXDMRwi7rTligOWZzbFMVmO+rk5dPiHs+i4Wq2U3GFjcEtRSoQHzyN8juvuw==
X-Received: by 2002:aca:abd5:: with SMTP id u204mr369245oie.119.1612538806468; 
 Fri, 05 Feb 2021 07:26:46 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q3sm1787983oih.35.2021.02.05.07.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:26:45 -0800 (PST)
Received: (nullmailer pid 3084982 invoked by uid 1000);
 Fri, 05 Feb 2021 15:26:44 -0000
Date: Fri, 5 Feb 2021 09:26:44 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph-card: Add clocks property to
 endpoint node
Message-ID: <20210205152644.GA3083322@robh.at.kernel.org>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-4-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611944866-29373-4-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, jonathanh@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

On Fri, Jan 29, 2021 at 11:57:40PM +0530, Sameer Pujar wrote:
> Add optional 'clocks' property to audio port 'endpoint' node. One
> such example is where SoC supplies a clock to external audio codec
> component.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 766e910..08ed8f5 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -33,6 +33,9 @@ properties:
>          properties:
>            remote-endpoint:
>              maxItems: 1
> +          clocks:
> +            maxItems: 1
> +            description: Describes the clock used by audio component.

NAK

An endpoint is not a device. Clocks go with a device.

>            mclk-fs:
>              description: |
>                Multiplication factor between stream rate and codec mclk.
> -- 
> 2.7.4
> 
