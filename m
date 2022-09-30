Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4A5F0DC2
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 16:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465371699;
	Fri, 30 Sep 2022 16:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465371699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664548925;
	bh=bLGCfna+DOE3okYzkWk2lbaakLDVx45hejXM0aWtaFI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M83MJ5oQqupOBtwPm6MiZDCpz7xmpLs6i+W2i7qF/GLWPXjOwaTSQu2kgQblEFtI4
	 RHod1Pd+czUhr2i3rzk3F1dmE8ZelAguWDlrpVQUTtZoO9Rg9eInxYW8kN4okm6lKT
	 wXJNgfJo1hZXoSh7NZc7S4G97RLf/AZWmW8z0I68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C943F801D5;
	Fri, 30 Sep 2022 16:41:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1B1F80155; Fri, 30 Sep 2022 16:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DC79F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 16:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC79F800AA
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-13189cd5789so5658409fac.11
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 07:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=ir2aT77ZPyD7mDnBEzgEmLEdJ5PGhUhxtKK2++Vwl1U=;
 b=IcQTEhJntSblM90lSAMw9rV6MssvMZBXK583mcRZUsaouuIRkjsHYc3lkweCR+J6bD
 joMhSpV5e2/7gdabq1Pu/EIeZoIYNfqZmwa+cBOmrnsxYNe5GOjt5//Jib3zbfqI1jAP
 nQH8nawX4leB8wJUcHJyRhoqPo9xBR6oZ5xaYS01SxlU6j/UuUVgY6kQMuX1bo++7E2I
 h9+vFRRjNimTwQE+p8uKHelGoekvcXMQk86LKfpz+zjTV9dS97rH2rwhLlri8JEGs0X3
 vmAcx9SWOlAJqz6SJpalv2lKct4Hoxpa8eud41pJZupGXzcUdrzFhhk6XSvC0yMoQ2Eb
 Y9Xw==
X-Gm-Message-State: ACrzQf1wf02TDapFd+rLNHEDx/kI9r3EWLOkZ3AuLLdHW0MI0alTh9yT
 MUlamE4NPTwvDG3PabNb3w==
X-Google-Smtp-Source: AMsMyM7p+b6sQFL2iDAYXq2CJZjkuA0LM4ihkglncq1gUKfE41WcIiRdC8tCJwlKHq12i4JjX+0v7w==
X-Received: by 2002:a05:6870:4248:b0:131:f4fd:6a1 with SMTP id
 v8-20020a056870424800b00131f4fd06a1mr1970068oac.47.1664548858104; 
 Fri, 30 Sep 2022 07:40:58 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x9-20020a4a4109000000b004769f57061asm493844ooa.18.2022.09.30.07.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 07:40:57 -0700 (PDT)
Received: (nullmailer pid 285320 invoked by uid 1000);
 Fri, 30 Sep 2022 14:40:57 -0000
Date: Fri, 30 Sep 2022 09:40:57 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] ASoC: dt-bindings: Document audio OF graph
 dai-tdm-slot-num dai-tdm-slot-width props
Message-ID: <166454885650.285264.3330595407372144597.robh@kernel.org>
References: <20220927185359.294322-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927185359.294322-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, 27 Sep 2022 20:53:59 +0200, Marek Vasut wrote:
> Document dai-tdm-slot-num and dai-tdm-slot-width props as those are
> parsed by simple graph card and may therefore appear in audio OF graph
> node.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Drop the definition refs and just fill in type and description
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
