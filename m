Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0D2D50BA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 03:17:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12EE169C;
	Thu, 10 Dec 2020 03:16:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12EE169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607566657;
	bh=faahizKVXPdqW2s9jiBNRh+xn7BOJyfuQ+a1UCq+t70=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkszVogvc26uY/IQheyA6Ui8yrh6t2VT5+4PBJjlVlHn0oz9u8GWcik4YVRloGSuV
	 6fgsJbaCcx4KP1O5fLFs+lObS68olC2eNNQS00REeOF5ehEjGtqc1ykpr6jxVAkEfN
	 DIAiGC6WrU0ydo2/dLES74tF96+Z9uaV1k9CLMag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D591F8012C;
	Thu, 10 Dec 2020 03:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88AD7F8012C; Thu, 10 Dec 2020 03:16:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E69F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 03:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E69F8012C
Received: by mail-oo1-f66.google.com with SMTP id w9so917505ooh.13
 for <alsa-devel@alsa-project.org>; Wed, 09 Dec 2020 18:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kig++s2HW24HAPkqPX1OgjRI23AmXcrz8TrgPWK8wUA=;
 b=KM0qGQskKwoVO5MwcKySaEbT0vAanRhYr3vQTWML8NXbpYU8rPjcSjbhgK21yBRjww
 Jfr5W5O2b6u+68H5r5/CIflPTRCjwIcpmHYaWv6qxClH92yk/OcSNe8gbNMhcgltkAGm
 6PK0+ZWCqQUh97Io3W8S13WxYDehaq+bisgxa0PLGRbYxZwmKmnPVUMVvTpvHW0WhXtq
 CgHjvrsZgcVfUxTh6Dv6t2JkdWTXvayBc58DIVp63j4qVAtfQOCJ3Cd09DrvfuQ95gps
 BHJ657D5kTrUgMoDZESg1K5tvgumsbch5+3ESDQ13mDaFho5thBx1G3KWiKLFyAMfk1y
 uoxg==
X-Gm-Message-State: AOAM530UFYLI9bESE2d6YtGHmO4/HToO0SRK1Ui/RzPN1hkQXPcfBAki
 rcL1IGxW7TLZdD7cRwGTaw==
X-Google-Smtp-Source: ABdhPJwT1EYRtwvWlEwB64Z4MD4vnsrU10z1MOaFcXuH8IyRQ02iULJwh8Qn9dR2ZrcyXDio8612Zw==
X-Received: by 2002:a4a:aac4:: with SMTP id e4mr4420261oon.2.1607566552359;
 Wed, 09 Dec 2020 18:15:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm836582otl.72.2020.12.09.18.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 18:15:51 -0800 (PST)
Received: (nullmailer pid 1498781 invoked by uid 1000);
 Thu, 10 Dec 2020 02:15:50 -0000
Date: Wed, 9 Dec 2020 20:15:50 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: audio-graph-card: Drop remote-endpoint as required
 property
Message-ID: <20201210021550.GA1498001@robh.at.kernel.org>
References: <1607498532-19518-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607498532-19518-1-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
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

On Wed, Dec 09, 2020 at 12:52:12PM +0530, Sameer Pujar wrote:
> The remote-endpoint may not be available if it is part of some
> pluggable module. One such example would be an audio card, the
> Codec endpoint will not be available until it is plugged in.
> Hence drop 'remote-endpoint' as a required property.

Please hold off on this. I have more changes coming.

> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 2005014..766e910 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -71,9 +71,6 @@ properties:
>              description: CPU to Codec rate channels.
>              $ref: /schemas/types.yaml#/definitions/uint32
>  
> -        required:
> -          - remote-endpoint
> -
>    ports:
>      description: multi OF-Graph subnode
>      type: object
> -- 
> 2.7.4
> 
