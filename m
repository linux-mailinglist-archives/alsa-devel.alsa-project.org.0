Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0684C3114
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 17:14:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD0218E9;
	Thu, 24 Feb 2022 17:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD0218E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645719248;
	bh=QVGIYCuiZn6XQXJrJ2gFPMZGb/PNokAZN0ymU8ZzE7E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0tGqMSRqeXetl1qGph42FpY9fba8BXlDw2+md/XlULWyaK8NLMw3l0FkjvawigC6
	 B4Rs/5jaeT9SJiZjEdbWxuW4wn9L+d7iOvrAg1cNHEtqT/ZRhNJ/RMlZJajV0L9yEo
	 au7LQ456vLk1jtutl/frkAoQuBS8hvUhq45HvevU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9CBF80310;
	Thu, 24 Feb 2022 17:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F54FF8030F; Thu, 24 Feb 2022 17:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD9F6F80118;
 Thu, 24 Feb 2022 17:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD9F6F80118
Received: by mail-oi1-f182.google.com with SMTP id k2so3154252oia.2;
 Thu, 24 Feb 2022 08:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbkQNmRMiKw/pcrFZH62eSxRpSbb/s9oDkkz3K5wBJ4=;
 b=pjqa/Semc0RVNCfxr+jXQqrNpKpBhQyY3jvy9TGrGPLsNWrs5w/TMl6mzycpc9XRB/
 BQLnGTXhSWqrr/zzHz8aGvzG61p9lbQE+suCI0p1fGzWWntUoM3kaxfcv2xUro7tjTfB
 EmzEHH9U8C0hIlqZgDkbbRh7I2Yvvx9AizAiAOiiP8Q/DKKUYhLaOnHmQ+/XRWBT7mI7
 8skP+2T023hNQokw35OLnVFBOFinZ4kwWLLjV5ze/0BfgoFaDbZDOGfGa3rAfsEiEkVm
 CD9QUlP5Nsq3msxaI5LrCb3jJr0j9RgGHYz4Z9chNCL9YJz/1Qh92Adl4WI3rRszKDkI
 PhxQ==
X-Gm-Message-State: AOAM532YemRVuAtA31oQm2ucvFcmRjUtqz6hc5BhuyvZlZZowjY2ofEW
 FZFPrYPLrCZA93PQryqyTw==
X-Google-Smtp-Source: ABdhPJxUdvQQ74bDVPACbU46SgRLAo662OysqMgqfjKUa3F3TgTNZydiCsoVlSxthTdtiIVIFdbrsg==
X-Received: by 2002:aca:5c89:0:b0:2d5:18eb:9e6 with SMTP id
 q131-20020aca5c89000000b002d518eb09e6mr1735362oib.58.1645719172925; 
 Thu, 24 Feb 2022 08:12:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bc16sm1650906oib.26.2022.02.24.08.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:12:52 -0800 (PST)
Received: (nullmailer pid 3173677 invoked by uid 1000);
 Thu, 24 Feb 2022 16:12:50 -0000
Date: Thu, 24 Feb 2022 10:12:50 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v17 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mtk
 adsp-mbox document
Message-ID: <YheugpFub9ArHDyT@robh.at.kernel.org>
References: <20220224133045.23903-1-allen-kh.cheng@mediatek.com>
 <20220224133045.23903-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224133045.23903-2-allen-kh.cheng@mediatek.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

On Thu, Feb 24, 2022 at 09:30:44PM +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> new file mode 100644
> index 000000000000..25756837797f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek ADSP mailbox
> +
> +maintainers:
> +  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> +
> +description: |
> +  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables the SoC
> +  to ommunicate with ADSP by passing messages through two mailbox channels.
> +  The MTK ADSP mailbox IPC also provides the ability for one processor to
> +  signal the other processor using interrupts.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-adsp-mbox
> +
> +  "#mbox-cells":
> +    const: 0
> +
> +  reg:
> +    description:
> +      Physical address base for dsp mbox registers.

That's fairly obvious. Drop.

You need to define how many: 'maxItems: 1'

> +
> +  interrupts:
> +    description:
> +      adsp mbox interrupt

Same here.

> +
> +required:
> +  - compatible
> +  - "#mbox-cells"
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    adsp_mailbox0:mailbox@10816000 {
> +        compatible = "mediatek,mt8195-adsp-mbox";
> +        #mbox-cells = <0>;
> +        reg = <0x10816000 0x1000>;
> +        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
> +    };
> -- 
> 2.18.0
> 
> 
