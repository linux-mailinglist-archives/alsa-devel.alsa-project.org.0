Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27130470B9A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 21:11:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDA22008;
	Fri, 10 Dec 2021 21:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDA22008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639167104;
	bh=TsO7FiKkcOXBWq+1aUzyogu9xI4+2SRxD8Phn6GnTR8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dx6oJHOXkOwp/6dpH5lcPq0TiwBcXeyKjcnnkqAY38l6Tl1sfpZm0oZaE6fN+lodw
	 n+4adtDwpqhx954d9vibwaQhlons0suyAIC/yLyLOvjvxWI3eBnpE0vw77jDVEXxWA
	 2cpTPkm8hud0mnZyI2JzPu5/fMvMoUSseQrXUNWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1889F8028D;
	Fri, 10 Dec 2021 21:10:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B91F4F804EC; Fri, 10 Dec 2021 21:10:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 352ECF8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 21:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 352ECF8028D
Received: by mail-oi1-f182.google.com with SMTP id t19so14766921oij.1
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 12:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PaqEpE42JwT8DXwsVY8kEv7gNunVXJQXAeFfbCH81XM=;
 b=Bkumkzei5IJEPeohLCKgr4Fiv89HTOmBu5AtSZXr39mwQUt3nr4Kwqj1a8lHx4wqFF
 yiOmTtCVMaPHMmeSStIhmzUe4lxtnT6JsadzyDBX+eUiesjKoHMmdkf98fGEKEfYY2Qw
 sgbaFlua/cCwTls7lIb2Yjz4UAmqroKxIkwmVrATGmRGqt12y5hszeCbKUobhxgE5Hnh
 dmE4SiOPKgo/CcVca/LA5jA8eeO5x0hB4KMtdpSVQP+X4KtXOMuFJa3GL7DcBNgD4gWE
 UdHQQeIAkMpcj/NfgAlcH/xhZdCZaWQMyksqOSNRSC6IftkcCcQCBr8LbLLUUXlEtlal
 KDnQ==
X-Gm-Message-State: AOAM532nf7ed5FB9nTEsX3vp8P4QmnigaYD6AkmYwzUhVvVzPjwsQ7s1
 FPRMLykI30AqV56JUqdkvA==
X-Google-Smtp-Source: ABdhPJxQHE8T/q7gJ37kD0SDsARybgtPjuYbEctbSQdiMZTsg/lr1mlPRTFIcqwOt2DpMwICm7YI0Q==
X-Received: by 2002:a05:6808:60e:: with SMTP id
 y14mr13980733oih.162.1639167026601; 
 Fri, 10 Dec 2021 12:10:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u6sm1020552oiu.34.2021.12.10.12.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 12:10:25 -0800 (PST)
Received: (nullmailer pid 1813329 invoked by uid 1000);
 Fri, 10 Dec 2021 20:10:24 -0000
Date: Fri, 10 Dec 2021 14:10:24 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Subject: Re: [PATCH v6] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Message-ID: <YbO0MKXKYN48+kzN@robh.at.kernel.org>
References: <20211202144818.31626-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202144818.31626-1-yc.hung@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, tiwai@suse.com, peter.ujfalusi@intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
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

On Thu, Dec 02, 2021 at 10:48:18PM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This describes the mt8195 DSP device tree node.

This doesn't match the change.

> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v5:
>     Remove sub node "sound" and "mediatek,platform", "mediatek,dptx-codec",
>     "mediatek,hdmi-codec" properties. Let dsp node as an individual node and
>     sound card has phandle of this dsp node per discussion in 
>     https://github.com/thesofproject/linux/pull/3239
> 
> Changes since v4:
>   - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
>     https://github.com/thesofproject/linux/pull/3237
>   - refine DT file binding files with Rob's comments.
> ---  
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> index f8bacd50b018..33db11ee2336 100644
> --- a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -70,22 +70,6 @@ properties:
>        - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
>        - description: A phandle to a reserved memory region is used for DSP system memory.
>  
> -  model:
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description: User specified audio sound card name
> -
> -  mediatek,platform:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -    description: The phandle of MT8195 ASoC platform.
> -
> -  mediatek,dptx-codec:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -    description: The phandle of MT8195 Display Port Tx codec node.
> -
> -  mediatek,hdmi-codec:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> -    description: The phandle of MT8195 HDMI codec node.
> -
>  required:
>    - compatible
>    - reg
> @@ -98,7 +82,6 @@ required:
>    - power-domains
>    - mbox-names
>    - mboxes
> -  - mediatek,platform
>  
>  additionalProperties: false
>  
> @@ -130,6 +113,4 @@ examples:
>         power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
>         mbox-names = "mbox0", "mbox1";
>         mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
> -       mediatek,dptx-codec = <&dp_tx>;
> -       mediatek,platform = <&afe>;
>         };
> -- 
> 2.18.0
> 
> 
