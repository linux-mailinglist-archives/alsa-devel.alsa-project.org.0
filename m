Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B952B0986
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:08:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB1A17F9;
	Thu, 12 Nov 2020 17:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB1A17F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605197333;
	bh=dEkLEThJ4cZ90K5DlPMC15EkiTN4p83eUdtjI6blHQ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onvIKa50ng7cMw5T/T4dakEZBXu37v+S3K4o2j0HwYjipuMLbD5BCHr+cEBM/OCc0
	 V1y3QKNhk0zl9yjqEf5SBRY7dM3B1HSOTVei++YLkZGfKZTBjMgyT7RU6oeq7V+T9x
	 q2uFGshaPpX2J9Pw6DCT1v/k5Z1mDc9JCcjPfP2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55CE3F80161;
	Thu, 12 Nov 2020 17:08:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33AAFF801EC; Thu, 12 Nov 2020 17:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2E39F8007E
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:07:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2E39F8007E
Received: by mail-oo1-f67.google.com with SMTP id t10so1428409oon.4
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 08:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+fc+jZoo4rryAb6EXgFaAApuHJmifAKwrkVc68Jfnc=;
 b=dfMNF6weziNwNgdIqkTJUf6AQZfq/jRCsKgTja3jPTYhEYYam676plTcmj1Dltz0gf
 jGWHXgsegm6rFsLV75aofMA0h41OY2eyULRVOYmo2hmOq7smyEOQg/VbcflIQHcOvWVZ
 hCJdBh1H9kpVebSZz+jY5DjTOPsVKeBu/a6KuTTLYTWBTT95vp7P39DUrr5j+o818toJ
 OAKR75/TsPfHrmMZMEHBdqq4Bg5C1NUi4rr6YQAR8GAePgCG/hOVkNBhLBco1l739jmW
 Lp6k69088oI6e3pONaIX9bSY8GKF+J/gEDDNm2SWxxBXs2V7UTG9AIyz2koOV1cvyHqc
 pKkg==
X-Gm-Message-State: AOAM533oo98MVRd1/SQhFJQD2hopTHEFj9Sfiq2aqcXHLnFso/oouuKb
 Fudi9wPA6S5P5qtdbUSC6A==
X-Google-Smtp-Source: ABdhPJwIgA6W6Kn5XcmLSnjP3jXT6JXWKJfF+QPpkH57f9faLQ3g9lYAoE12cGCNrp8Ih5IU7Kq4zA==
X-Received: by 2002:a4a:6b1a:: with SMTP id g26mr21465516ooc.13.1605197267992; 
 Thu, 12 Nov 2020 08:07:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j16sm1360618oot.24.2020.11.12.08.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 08:07:47 -0800 (PST)
Received: (nullmailer pid 3683064 invoked by uid 1000);
 Thu, 12 Nov 2020 16:07:46 -0000
Date: Thu, 12 Nov 2020 10:07:46 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 2/2] ASoC: renesas,rsnd: Update audio graph references
Message-ID: <20201112160746.GA3681609@bogus>
References: <1605097613-25301-1-git-send-email-spujar@nvidia.com>
 <1605097613-25301-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605097613-25301-3-git-send-email-spujar@nvidia.com>
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

On Wed, Nov 11, 2020 at 05:56:53PM +0530, Sameer Pujar wrote:
> Since audio graph schema is refactored now update the related
> references here.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

This should be part of the first patch. Things break in between.

> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 51f4dca..fc2ae22 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -112,12 +112,10 @@ properties:
>          - pattern: '^clk_(a|b|c|i)$'
>  
>    port:
> -    description: OF-Graph subnode
> -    $ref: "audio-graph-card.yaml#/properties/port"
> +    $ref: /schemas/sound/audio-graph.yaml#/properties/port
>  
>    ports:
> -    description: multi OF-Graph subnode
> -    $ref: "audio-graph-card.yaml#/properties/ports"
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>  # use patternProperties to avoid naming "xxx,yyy" issue
>  patternProperties:
> -- 
> 2.7.4
> 
