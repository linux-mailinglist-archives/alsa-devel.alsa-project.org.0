Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C21F7428FE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 16:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A9567F4;
	Thu, 29 Jun 2023 16:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A9567F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688050778;
	bh=4yU2gIPO76GfrKWAF+8jGT6VeJZTdY48+GmV10sFdvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ihnuu/MYcGwjh/SfErjK/HgqWew58NWwea+5IuTf+kdCl2fkpyy+kaN/DusfQ7MPi
	 7VZbQp5HawuFnqpFHOm/viqLWiy/Ddcm+9We/gxLHcIFyfhV7Ozsv+ynwRgLqUMWEi
	 yeMHAkix/DnmRY07pO7/jjP+8rMvqo6YSAoMDE2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B16F80535; Thu, 29 Jun 2023 16:58:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B51D1F80212;
	Thu, 29 Jun 2023 16:58:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7F41F80246; Thu, 29 Jun 2023 16:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C62CF80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 16:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C62CF80093
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-78363cc070aso31992439f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 07:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688050718; x=1690642718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljRf0hyGo8Gpwci5RsjZ1gzHX+tCb5+i5VvfOpLuGAs=;
        b=U5jEY5fPv1GldvYaqnJzWwTaFFETHBOR7OgOO1PdB/4j8v/Z268tv+yHDlwh9yT3Bh
         xTcqx2IUOHrmUGXtByfgDZ9OOOzBObpYU1+3N/HKF2odU0nclbXJhCrzoVp8XMSuaYzt
         +0fbMcXKKUT3jR1hF4bN/p44c6LsZba61JwxaPSC5AkgVoODRznodnfJ9v0IZz3MWn2h
         UbMSXML1gCD+f1yhGirTZ7yxQMt0yE/Xk01D1IQHCsYYvXX4/wEhX9Mg/WapNbbV/YVz
         YGXC/3yOrN2rIgOZ9wGKvVds1iADm+/Pv4epa6VxsnNsIWyORl5tMuB39jqtdUCfCou+
         HyWw==
X-Gm-Message-State: AC+VfDw3A0cSiGxmMk/kf91nXJ+ALlVnTbtuFX40tL1Lh2rJN/aKs/gL
	ECWLd6PIdvp8kSI9k77DLQ==
X-Google-Smtp-Source: 
 ACHHUZ4fvxRFhvMqpuckwCnsXWFPC/rwz9erlSudSvlNJ+tRVLwMuByK8y5rQaap4kBc7/3o7vVugA==
X-Received: by 2002:a5d:8c86:0:b0:783:4bd2:3fd2 with SMTP id
 g6-20020a5d8c86000000b007834bd23fd2mr15394851ion.17.1688050718366;
        Thu, 29 Jun 2023 07:58:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 m5-20020a02cdc5000000b0042036f06b24sm2857172jap.163.2023.06.29.07.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:58:37 -0700 (PDT)
Received: (nullmailer pid 2961403 invoked by uid 1000);
	Thu, 29 Jun 2023 14:58:35 -0000
Date: Thu, 29 Jun 2023 08:58:35 -0600
From: Rob Herring <robh@kernel.org>
To: Maso Huang <maso.huang@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Ren Zhijie <renzhijie2@huawei.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Message-ID: <20230629145835.GA2954895-robh@kernel.org>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-7-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626023501.11120-7-maso.huang@mediatek.com>
Message-ID-Hash: M2ZZ555GVKUDBSOHBKTES6NCOIDGMDD7
X-Message-ID-Hash: M2ZZ555GVKUDBSOHBKTES6NCOIDGMDD7
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2ZZ555GVKUDBSOHBKTES6NCOIDGMDD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 26, 2023 at 10:35:00AM +0800, Maso Huang wrote:
> Add document for mt7986 board with wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../sound/mediatek,mt7986-wm8960.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> new file mode 100644
> index 000000000000..76394f7e5502
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt7986-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7986 sound card with WM8960 codec
> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7986-wm8960-machine
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT7986 platform.
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of wm8960 codec.

Please define these properties in a common schema and reference them 
where already used and here. A given property shouldn't have multiple 
type definitions.

Rob
