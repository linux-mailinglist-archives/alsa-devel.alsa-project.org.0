Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21626F07B3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Apr 2023 16:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78322103D;
	Thu, 27 Apr 2023 16:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78322103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682606979;
	bh=mScdIuuIkXX/ghFJTJ1Lff/zqPpyudsN0VmMLKo1Q18=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=izrjCHrmkfYXFbbGLzvgJTuhj8S1f6nFQwMyVnhX5p/38//SFc9H0kKs8GkV87tpa
	 RcqkvvTmbOLEVSDjhOfCxAcEFp73emtJ14Kemg2uNsbr3AXH3rquvfIabAn55GnB40
	 rbvhggQ6Fe/+j6Q0TgJjKKMVOwzMXhPcb7MRdBP8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD48AF800F8;
	Thu, 27 Apr 2023 16:48:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96983F8025E; Thu, 27 Apr 2023 16:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBA20F800F8
	for <alsa-devel@alsa-project.org>; Thu, 27 Apr 2023 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBA20F800F8
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6a5f7341850so6709085a34.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Apr 2023 07:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682606914; x=1685198914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M31n+XREzugmZ1EKOJc53wCBLFu4hpN+NfwfiegJw4Y=;
        b=H3+Idp4o8asdGrlHeS3YcePH0BpImlTkb78tbWqJpi8dpFIgwquVeIfDr1oulZv4pS
         uDQsVAkaN+IcFdNFrhJInAy82W/AOkWgE0EvYWTQOZKWuvLD84ds+3GaVqul6x9JMRPX
         DWEdje+InH9MoJPp4gRkzSJ//DjwwDzTF5rGj7tquVRQNlSyVAwchQM0XI0mnvmaArmj
         9qLBVXdkXanFPzstcDy6EYyI7FP9AwuSEF7NHgbNYagIQMU4jABNvABle1sokZ5MZQtk
         Oaq0sQkDbm6yUy4nf2gtLvHeNyDj18qgOQCDK3GPbSoy2sWJK9j0/TT2EXC4YUClTOFv
         WP9w==
X-Gm-Message-State: AC+VfDyuwEgB4TSeeujrWQTA6l3MrarcgKExP3/S1JIAWMjxy54qNYRX
	xfjUrMHso5ZQerCALZaWZA==
X-Google-Smtp-Source: 
 ACHHUZ7Gy9jZRZPv3O8hPWV17h7xoBKxBXZHUuJlHDEj5firr1OAVrcrJ0Ju0D2jaIC1gyaw5XDBgQ==
X-Received: by 2002:a9d:6404:0:b0:6a4:2f1d:133e with SMTP id
 h4-20020a9d6404000000b006a42f1d133emr771755otl.3.1682606913964;
        Thu, 27 Apr 2023 07:48:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a9d65c5000000b006a12509bd94sm8042181oth.13.2023.04.27.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 07:48:33 -0700 (PDT)
Received: (nullmailer pid 3018266 invoked by uid 1000);
	Thu, 27 Apr 2023 14:48:32 -0000
Date: Thu, 27 Apr 2023 09:48:32 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Message-ID: <20230427144832.GA2992031-robh@kernel.org>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
 <20230426055124.16529-8-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426055124.16529-8-trevor.wu@mediatek.com>
Message-ID-Hash: JSTZ3S3Z6Z4P7MWSPLQ3CLH6YU2KASQY
X-Message-ID-Hash: JSTZ3S3Z6Z4P7MWSPLQ3CLH6YU2KASQY
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSTZ3S3Z6Z4P7MWSPLQ3CLH6YU2KASQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Apr 26, 2023 at 01:51:24PM +0800, Trevor Wu wrote:
> Add apll1_d4 to clocks for switching the parent of top_a1sys_hp
> dynamically. On the other hand, "mediatek,infracfg" is included for bus
> protection.

Bus protection? Meaning access controls for the device? If so, there's a 
proposed binding[1] for just that. If that's something Mediatek needs 
too, please participate in that discussion. It's easier to define new 
common bindings if there is more than one user.

> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml          | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 82ccb32f08f2..eb58de8c0e68 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> @@ -29,6 +29,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of the mediatek topckgen controller
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek infracfg controller
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -52,6 +56,7 @@ properties:
>        - description: mux for i2si1_mck
>        - description: mux for i2si2_mck
>        - description: audio 26m clock
> +      - description: audio pll1 divide 4
>  
>    clock-names:
>      items:
> @@ -73,6 +78,7 @@ properties:
>        - const: i2si1_m_sel
>        - const: i2si2_m_sel
>        - const: adsp_audio_26m
> +      - const: apll1_d4

A new required entry may break the ABI. If that's okay, it needs to be 
explained in the commit msg.

Rob

[1] https://lore.kernel.org/lkml/cover.1668070216.git.oleksii_moisieiev@epam.com/
