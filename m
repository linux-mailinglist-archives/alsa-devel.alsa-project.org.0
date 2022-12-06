Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D7644412
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C85A18A5;
	Tue,  6 Dec 2022 14:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C85A18A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670332056;
	bh=KBM7Osn8wTMfZ2KqCgMemGLHvp7SlmBs8qZ26cZqpI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OhHB9MBeg/OgfZzZzsXhjSjITpdGm2Nmfljfss2BAOLVIeLUgI8VgpyTIFC8XZPmW
	 5Fg5c2r5KdHZTtdPbSyPWuXT/G25VpKCmIVNa3QBDeT0Dl9OkVIqVmO2S52dQa33LM
	 f3glak867wN/taBWm7RPbDKfzDsGOiiADU3MfBd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1667F80246;
	Tue,  6 Dec 2022 14:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB420F80246; Tue,  6 Dec 2022 14:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB074F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 14:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB074F8014C
Received: by mail-oi1-f181.google.com with SMTP id v70so8440411oie.3
 for <alsa-devel@alsa-project.org>; Tue, 06 Dec 2022 05:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VLnmw9cgzz1trBmeVfOPIC0eg3Xb4TPnCQ0Or5PgMY=;
 b=A+ynzJBfyncPPnpNfGkXYJeiPgRKXjyl6gei4XIZCbBCm51nTsm/aqM1jfEngrhP+g
 NcuViFRlYtrZEcwFlLT9Pe85V6e9b9GZyjtt1AYIxzViDw4eBnaRooP3dt04NPSBJKnZ
 NTYtBHFdAUXOoH+RV18jbTlVEkjxlQyaRejlCOmVJjh/nGBqXt7xR0EQAqoegs/NYQjR
 /OisGq8vyuZQbOmflAx6b76oNvEmbPO0Mq0m17mqgbLMY73mOnDerochcp84T8qkTxGE
 VfOzqD40jLEUbuPxPgYjinCGVg+rUSrxXyiAK9a3ZD7/goaP4AhLUi65ipQVX7NF7zou
 IZ7A==
X-Gm-Message-State: ANoB5plhMwSSe7NBZyCBL74yuPM3qNN0cR+aMxz67JxeeQdf0RYy67Sc
 8dLIzPILw9EI/8eAVjhvqw==
X-Google-Smtp-Source: AA0mqf6rA5VNHLxzZM/XwyRklpPC+5cPWHfnnE5YfB9BJ350CCsG5DmrMQoA1lDqr6+SKNMVJEuKmg==
X-Received: by 2002:a05:6808:a10:b0:35a:433f:b03a with SMTP id
 n16-20020a0568080a1000b0035a433fb03amr33763043oij.1.1670331994188; 
 Tue, 06 Dec 2022 05:06:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d8-20020a4ab208000000b004805b00b2cdsm7837159ooo.28.2022.12.06.05.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:06:33 -0800 (PST)
Received: (nullmailer pid 231668 invoked by uid 1000);
 Tue, 06 Dec 2022 13:06:32 -0000
Date: Tue, 6 Dec 2022 07:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: Drop Jee Heng Sia
Message-ID: <167033198953.231535.1943885623418266769.robh@kernel.org>
References: <20221205164254.36418-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205164254.36418-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dmaengine@vger.kernel.org, "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
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


On Mon, 05 Dec 2022 17:42:54 +0100, Krzysztof Kozlowski wrote:
> Emails to Jee Heng Sia bounce ("550 #5.1.0 Address rejected.").  Add
> Keembay platform maintainers as Keembay I2S maintainers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Correct email format in keembay-i2s.
> 2. Add Ack tag.
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml    | 1 -
>  Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml | 3 ++-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
