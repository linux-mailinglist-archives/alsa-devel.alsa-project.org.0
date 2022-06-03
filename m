Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50D53D2D4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 22:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C237218F0;
	Fri,  3 Jun 2022 22:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C237218F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654288275;
	bh=WsjG+nlUuG8Mo+Txr9TVSxyzFPcwRZWXpNaVmwbjD1c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=neal9w2oNF1nquE7NKisBrDaT6qIQSkaOXq7X7/uqxirzNmEM6wQGzw14VBUkQ1uH
	 AjVwICFLOvJuD/6iiqxmvsr+pxmqmx2Om7FDgU3+xtaSh7p1fFwNPQk+QmBztFcMQ3
	 D2KDpSsUGhSjGoOgRGUbjGxDtGbqoycwpPJLfZRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2945BF804D1;
	Fri,  3 Jun 2022 22:30:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A32B9F80124; Fri,  3 Jun 2022 22:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B6BF80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 22:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B6BF80124
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-f3381207a5so12057612fac.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 13:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aWgRjcIRY9aXR5lMG74PBf5aEP4BmW1ZmceFBkmSQgE=;
 b=H5PJ3ClKVGfxS3t3uVd8T0NAdBLXLPNQK25OqH8D7eBAH1i0kCSBuM67Oy0BFtZu+u
 252Es+E7L/tIDBqU5moDkBMwdRdXDFspUKaejUNGXYwIpnEijkW2mCprS/vfgWq0jVv6
 Xwew2ZG8om98Z9q4skLKGCNPAcSsbWy263IzPr0TdDfIrgSn0GTOMabMMDtIkf0r4loY
 znh0vywvJRiPIrpwOLzi5d0+yP/m1RpYDZBi2WbHn05vCXA/1aDJbq5pci1JIcpG864H
 jDOHSCUQ/RYqbp8dhj7XlRkSfIR02K6uThfxXT/JqFOwhQSTWN5LnMrB0FzBzgVan/kB
 wb2A==
X-Gm-Message-State: AOAM530rZU4F7rZmuV0FmjmsV4OtI4QcqLvJznE+Sm3rvCEWhnPOT3ML
 ohaEzhvo7Xt5UFmda2F9JA==
X-Google-Smtp-Source: ABdhPJzDAK9Ow9YhSMIGcLFMa9uhRDPTC2tuaf29Q6ftaE+O1AaL/YlVV1f1W6fnvsQb1+wkPGINVA==
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr7127615oaa.99.1654288204596; 
 Fri, 03 Jun 2022 13:30:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k10-20020a056830168a00b006068c4af381sm4098088otr.54.2022.06.03.13.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 13:30:04 -0700 (PDT)
Received: (nullmailer pid 855181 invoked by uid 1000);
 Fri, 03 Jun 2022 20:30:03 -0000
Date: Fri, 3 Jun 2022 15:30:03 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/6] ASoC: tegra: Add binding doc for OPE module
Message-ID: <20220603203003.GA852734-robh@kernel.org>
References: <1654238172-16293-1-git-send-email-spujar@nvidia.com>
 <1654238172-16293-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654238172-16293-2-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 catalin.marinas@arm.com, tiwai@suse.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
 jonathanh@nvidia.com, will@kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 03, 2022 at 12:06:07PM +0530, Sameer Pujar wrote:
> This patch adds YAML schema for DT bindings of Output Processing
> Engine (OPE) module. It consists of Parametric Equalizer (PEQ)
> and Multi Band Dynamic Range Compressor (MBDRC) sub blocks and
> binding doc for these blocks are added as well. The OPE will be
> registered as an ASoC component and can be plugged into an audio
> path as per need via ALSA mixer controls. The DT bindings are
> applicable on Tegra210 and later SoCs where OPE module is present.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       |  4 +
>  .../bindings/sound/nvidia,tegra210-mbdrc.yaml      | 47 ++++++++++++
>  .../bindings/sound/nvidia,tegra210-ope.yaml        | 87 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-peq.yaml        | 48 ++++++++++++
>  4 files changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml

Doesn't apply for me. I guess there is some undocumented dependency 
here? Resend after the merge window if that solves it.

Rob
