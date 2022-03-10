Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1274D5480
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 23:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77D5219FE;
	Thu, 10 Mar 2022 23:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77D5219FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646950797;
	bh=JU7F45BV9tpPf4BWSeA+PrkLQlaX7J6OlFV1hWeqmJY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qd3I8HmQwbjFBKDefT+BVaf+9uOg9SqmMYuS1o16P11zxoRhumopt3HZdk2F55bLc
	 XHvXo0EOcLSmVf/iuaIdbYWthnG02uoBtyCiP69TrfFfg3AXNcPc+rumHtuWHkT87P
	 DfkVAHAFp3ycO5d3/HgOzk7ex6v8g/ko0ajmJ4RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDDDF8013C;
	Thu, 10 Mar 2022 23:18:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C598F80137; Thu, 10 Mar 2022 23:18:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B84F800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 23:18:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B84F800D2
Received: by mail-ot1-f45.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso5045497otp.4
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uVBl4IjExhMMGQyqVZdtBYxJhbtlhf7V3EID45rNLsk=;
 b=CcJiRu4ZIIADSEBPHTqRar3KlVWyr8U25uWgWR1z9LcnjoG5BTw+lJLyORh++Gj7WJ
 aKQqN5vX4qHgBHd1gEVWuVraWpWZv2Q/CImZzKf/ZriyeEA4Viysy6bCJIvDzcnud+5x
 M3p+WiMCTu4cL7hA8pzYMVJjaFGKl5nKPQNTGQgBAhRoEvkFW+MQvUY8GgDb0WRHWEwm
 dRD6snhEeNzR6pjRJbGVEeHWpQRON77s0x7elgTYh+F/RfMyKdULpppw7QPVpWv7me1n
 WqVzHVuT7ivR/41kpKRZrRAzhGXca+iMWteL2wJK1BmAplNDjGrJnxiqn2/2WQuenGzJ
 is4g==
X-Gm-Message-State: AOAM532Rc6eD1YRUPVSUbK6o2mVj1yiQfWy8H6YKU5cEkVdSDnWQUOlv
 Izlztf9fTuGuUNW9971LTNlf9etnKg==
X-Google-Smtp-Source: ABdhPJymVHkEV5XxQpBNmw5S/gpv0K8uSPo3RhUKisPITsq2PFiS19pD2qkEoukGiphCl2E24hUkYQ==
X-Received: by 2002:a9d:77d7:0:b0:5b2:29b0:70cb with SMTP id
 w23-20020a9d77d7000000b005b229b070cbmr3556144otl.276.1646950718003; 
 Thu, 10 Mar 2022 14:18:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i126-20020acab884000000b002d9f958bceesm2925916oif.41.2022.03.10.14.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 14:18:36 -0800 (PST)
Received: (nullmailer pid 2185267 invoked by uid 1000);
 Thu, 10 Mar 2022 22:18:35 -0000
Date: Thu, 10 Mar 2022 16:18:35 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-max98390-rt5682 document
Message-ID: <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-6-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308072435.22460-6-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Mar 08, 2022 at 03:24:35PM +0800, Trevor Wu wrote:
> This patch adds document for mt8195 board with mt6359, max98390 and
> rt5682.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mt8195-mt6359-max98390-rt5682.yaml  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
> new file mode 100644
> index 000000000000..7ec14d61b109
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8195-mt6359-max98390-rt5682.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8195 with MT6359, MAX98390 and RT5682 ASoC sound card driver
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8195 sound card.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195_mt6359_max98390_rt5682

You have nodes for each of these components, why do we need new 
compatible string for each combination. You can figure out the 
combination by looking at each of those nodes.

Second, why does each combination need a new schema doc?

Rob
