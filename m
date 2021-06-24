Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F43B38D7
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 23:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810B01655;
	Thu, 24 Jun 2021 23:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810B01655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624570617;
	bh=MVluekNFmxJlLtcq6Y6nWhho2xqqpT7MQzKctw1HBYk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBspyO63HvTmdNuDe2zscWB/lSijGNbYaq95tLqB2rEqIFSKYFNp1YDWYlpexVxia
	 KKTHKLTK549DIpIYCqly7yQH/AVLmje+ViZELA8qpQSQt259eu6MOy5DbQTjra87me
	 ns+RWoAvUp+bxSa+vFHE8qKqgiBKzYga9+U3fUUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F34B3F80268;
	Thu, 24 Jun 2021 23:35:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1C23F8025F; Thu, 24 Jun 2021 23:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE9C1F80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 23:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE9C1F80137
Received: by mail-io1-f43.google.com with SMTP id k16so10042074ios.10
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 14:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ssSkZmcRFIuWVzrZF3p+ms6WDNX9rtUCDy4iiIHPjac=;
 b=Y55kL4to3xOxKj9RyiKBZhE8E3DmMXNwX3g4Plo1//eusGHjqPQsILpIK7DYZKuLDr
 Gtj0d+tssNT6r8KlQMj4ZF0CoRXVaX+/FMF1HHxibIoa0bR6CDBvN/Xu0u+N2Ty6Pvxx
 MEBYHhHQ571SAoL5a6e9+YrJ+/KMuvN6penrS6LrEywJs/WMP1uA0xzagSAiNduIqxW3
 wdfAJcCkW+T/grDL50yWzVzZsEruAJpCaY3YsHSaNvJAcfA83qZs88YKRaLE8nD3hi8e
 grzd8Sk8zI5NcPjQhJMaizLu53JLWn7ACO+cGceunc7dgJiTwWXHWLpEU90XWJdbsQAU
 KAFg==
X-Gm-Message-State: AOAM530gd7jiNvq7fY5QH97Ay31uX7mmfqm4Z9LR4R1eRtZp9cpNY/RR
 BJyR+Lc9NJcI4+AJHRq5qw==
X-Google-Smtp-Source: ABdhPJxLG5mS/R5Kp70cqPpAfemerqR8JG+XdsktURkXgw56B3TqFTUh2d7/TUWZeX6qNuzTikAyeA==
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr6388166jak.91.1624570508746; 
 Thu, 24 Jun 2021 14:35:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m13sm1985143iob.35.2021.06.24.14.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 14:35:06 -0700 (PDT)
Received: (nullmailer pid 2025804 invoked by uid 1000);
 Thu, 24 Jun 2021 21:35:03 -0000
Date: Thu, 24 Jun 2021 15:35:03 -0600
From: Rob Herring <robh@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Message-ID: <20210624213503.GA2025774@robh.at.kernel.org>
References: <20210618060644.2830-1-fengzheng923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618060644.2830-1-fengzheng923@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, wens@csie.org, broonie@kernel.org, mripard@kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Fri, 18 Jun 2021 14:06:44 +0800, Ban Tao wrote:
> DT binding documentation for this new ASoC driver.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> 
> ---
> v1->v2:
> 1.Fix some build errors.
> ---
> v2->v3:
> 1.Fix some build errors.
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
