Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C8C7FDA7D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 15:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1DFA4E;
	Wed, 29 Nov 2023 15:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1DFA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701269674;
	bh=P/M8o86uCZmrk7rETNr++Ys9N2GNePEBtlwkq5PMaAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=beNu2VDn0tPcvyuqOYBLk9lbhhZLT5MGgc92hgOiBXq+t7/g6sjy8BYK/SRAcQn05
	 3zGNruhZgH4y1N9rr7T3h4mT5AC5g0jHY6cHoZ/V19A7BI7jOdgZOSSkJpBZtPD9+K
	 ZCRwZj8p6rx6PH2thZOCWA5HyqDqTcqsCC/Mm2/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 652A5F8055B; Wed, 29 Nov 2023 15:54:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08444F80571;
	Wed, 29 Nov 2023 15:54:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BDBBF8016E; Wed, 29 Nov 2023 15:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5BF5F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 15:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5BF5F8007E
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1fa1ec476f1so2772623fac.2
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 06:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269642; x=1701874442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea/iuRLQ3MiOQbUR87zXKlf7PgJMpl4mFKJ4sK0omKs=;
        b=XsrJb84RjmEKvlRP0Spsbuqsh8877b1G68TXxby/Od9NPg+yZya6FPerv7dlIZB9TN
         R2mZznyQAeNh2WjHpeZm9dOWpsg4seTAF+nM+DPUOePelcspbFvgDYR4a1FLdRnPkJSo
         tcox7IJM96c0YSxUheDFkj/B8JUFMF3uRPDf4mJqiJgkXXe3ofbMD9N8O8/QCrjpPNIN
         JbiaPOwqfpyhhtH1ob2ZgGAYVnkPA0JP/EgF+B9Q2TrpfnKa4yvjass8Ii0ybkJcnG/3
         4EYbaPbvMB3HK70T4hLAKhG18YthiGyJRm1ShzkHGHin89do6CJb/Bu2VSQ736FwGzkQ
         ctZw==
X-Gm-Message-State: AOJu0Yz1PghqaYTFN3AUZL+nNFDsUynF6ZZ6yQhycgys4RcdyBy8DnSA
	6oqzNcU8s6qSZlqgBA6pp/u29CW2lQ==
X-Google-Smtp-Source: 
 AGHT+IEKQZCzwe94OXoL3+AZ7eYT2112nCdj6/VnLFu1cjYWi2d5/xc1SEv31Wkuo3A4ZWK/3DhFNQ==
X-Received: by 2002:a05:6871:5811:b0:1f9:4244:4c52 with SMTP id
 oj17-20020a056871581100b001f942444c52mr22776977oac.41.1701269641968;
        Wed, 29 Nov 2023 06:54:01 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 mn13-20020a0568700c8d00b001fa3ab0a3bdsm1982754oab.31.2023.11.29.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:54:01 -0800 (PST)
Received: (nullmailer pid 2458296 invoked by uid 1000);
	Wed, 29 Nov 2023 14:54:00 -0000
Date: Wed, 29 Nov 2023 08:54:00 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: broonie@kernel.org, kuninori.morimoto.gx@renesas.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, daniel.baluta@gmail.com, alsa-devel@alsa-project.org,
 iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Subject: Re: [PATCH v4 2/2] ASoC: dt-bindings: audio-graph-port: Document new
 DAI link flags playback-only/capture-only
Message-ID: <20231129145400.GA2447249-robh@kernel.org>
References: <20231128081119.106360-1-daniel.baluta@oss.nxp.com>
 <20231128081119.106360-3-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128081119.106360-3-daniel.baluta@oss.nxp.com>
Message-ID-Hash: NJISAJOGL7UEO2S7R5XDIKDA3YXJOUZS
X-Message-ID-Hash: NJISAJOGL7UEO2S7R5XDIKDA3YXJOUZS
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJISAJOGL7UEO2S7R5XDIKDA3YXJOUZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 28, 2023 at 10:11:19AM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Document new playback-only and capture-only flags which can be used
> when dai link can only support just one direction: playback or capture
> but not both.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 60b5e3fd1115..b13c08de505e 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -19,6 +19,12 @@ definitions:
>      properties:
>        mclk-fs:
>          $ref: simple-card.yaml#/definitions/mclk-fs
> +      playback-only:
> +        description: port connection used only for playback
> +        $ref: /schemas/types.yaml#/definitions/flag
> +      capture-only:
> +        description: port connection used only for capture
> +        $ref: /schemas/types.yaml#/definitions/flag

It seems like we have a random mix of port and endpoint properties here 
and I can't tell what's the logic for deciding the right place. 
Everything in port is also in endpoint, so maybe using port is 
deprecated. In most cases for graph bindings, we put properties in 
endpoint nodes.

Rob
