Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 008614EB6BE
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 01:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86021171A;
	Wed, 30 Mar 2022 01:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86021171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648596464;
	bh=h/HXxRjs3JGHscrwE3zfj/uMIj2o8H3mbKO1mrTk3l4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQbAZ+4+2satFzJgv5MulzgEap5h3y7+cky05ixojaPzyqm5n+93ZsUg5U1LdFMAJ
	 4gu2utCD0sDNq+IgNIFoggfk2FiritT395bJuH4Mw3txJooWMC0eFJeVFZQyoAoKK2
	 KtOUUdOCHbHLRQCatImWy3fIQn06uYsXrWs6VMFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE9A6F804B0;
	Wed, 30 Mar 2022 01:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0ABFF80311; Wed, 30 Mar 2022 01:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55213F800FA
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 01:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55213F800FA
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-df22f50e0cso3151138fac.3
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 16:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9dQ+bezz/6dhDDZZP1dvguzSfUxAuO4wbhe6dLzF9cw=;
 b=L5mrWsUKugnL34LYmVHIByvJ2h5207VAKq2xkgoK5syx1FeKJlY51g5sCpdd+UhnEn
 D47unzsC1nEecJip/oEIaxQkK1emCqotwG3ELXVQfPlOgHTd111aoIQWvzhnDEK6SjGf
 biV/jn65YGjfXLHJ7zKtfgg6Bf+fC0TvP8GlGlztEeqD0NuB9xRnd+9jjOgyNaie3yob
 tkBTOxFozA48hMwBhE65YFDMMcxMmU604WaUiRVIkUJD+FHaBovO4x4YTjiK4TXkiVNy
 mHTbue8MQkz67qVDKwDVYxVppPQjHkgIvQMg2ftUcls3vhM94ycBVlLrvplG1FUSC590
 2pBA==
X-Gm-Message-State: AOAM530z5xORvh/0q5M8MLGUXncDvm8KNvQeN1wcYxWXh9CD42sruTUZ
 RlkqM3LqEUHioWRFD+C7sA==
X-Google-Smtp-Source: ABdhPJweG2i2gLummAi4XhOWKR3K5fxDVcfWf9ib6emSjAUJsc9ZLfSK4XVKqDUx/MKj6Sxdr8q6uQ==
X-Received: by 2002:a05:6870:128c:b0:ce:c0c9:5ba with SMTP id
 12-20020a056870128c00b000cec0c905bamr896932oal.12.1648596387515; 
 Tue, 29 Mar 2022 16:26:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h186-20020acab7c3000000b002ef5106248asm9784338oif.45.2022.03.29.16.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:26:26 -0700 (PDT)
Received: (nullmailer pid 1552557 invoked by uid 1000);
 Tue, 29 Mar 2022 23:26:25 -0000
Date: Tue, 29 Mar 2022 18:26:25 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Message-ID: <YkOVocF+H1Up3usx@robh.at.kernel.org>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-4-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, tzungbi@google.com,
 miles.chen@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, 24 Mar 2022 13:38:48 +0800, Trevor Wu wrote:
> Because the same binding components can be shared by all codecs
> combinations, we only reserve one binding file for mt8195 machine driver
> and rename to a generic name.
> 
> We use compatible string to separate different codec combination instead
> of creating a new binding file for new codec combination.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mt8195-mt6359-rt1011-rt5682.yaml    | 51 -------------------
>  ...-rt1019-rt5682.yaml => mt8195-mt6359.yaml} |  8 +--
>  2 files changed, 5 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
>  rename Documentation/devicetree/bindings/sound/{mt8195-mt6359-rt1019-rt5682.yaml => mt8195-mt6359.yaml} (87%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
