Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EB7D5C5C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 22:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6AC81F4;
	Tue, 24 Oct 2023 22:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6AC81F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698179122;
	bh=USvHAOH9+n2WfKXB/olOeTuTGIxQQgwsaR7+mN8sv9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iYZeqXA+nFzSFZE7IsAIHxaaRieL8XbRsi6wACvtrV3xzr4OGrfSzuIMBeAF+TXOo
	 VqEP87xCn07TAfBGZLT2FQ2j/+IpJKWq1yCgK9cU/XGRYD4WuyIb/S4FYU9WL0vZwD
	 +0jSMlZunb1LCTeQOcMEutuKDmHe/Plg9H8KlAEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EBCCF80157; Tue, 24 Oct 2023 22:24:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88075F80157;
	Tue, 24 Oct 2023 22:24:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B888F80165; Tue, 24 Oct 2023 22:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E05BF80152
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 22:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E05BF80152
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-57f0f81b2aeso2776745eaf.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 13:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698179061; x=1698783861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clx/hiarGH6c0k6qEGq/cyL0jlTBHcjgQ76y2SZ3IeA=;
        b=DDM1n83LWKg06B+hEso5+7e1gMay3OahOcQx/VFvavyMFTRM1n3LyQ9OnsHWp5+EaX
         QAzI857xN29gHINlyy2qdLwq2ULzgf/3JAaHZsO2B0ShDB7Mx36WWPHTwMLlE39FOXhV
         rqR4xnJHTOsxoMZ7SCnuHGCscNM5/8iZINly6fJTSC6mCsBrl++AaHQjVq8VK++gQZym
         tcPcYOdd1vv7fQIzCgqpMboKzXG78YfNFDmC1GIoiVvqcyEwFUbv/cmba98ogGxTTroB
         4izcyTqF7fZ0kfFmcqxyPPymvrbAn8fyhYF2MaIfUM40hNZD8HsBRyiN+xrpvKZ2Ivi+
         M/3g==
X-Gm-Message-State: AOJu0YxpJ5a2AICFUjsJfdNwmFtlVpONE2b7Fg63Y0e7Gzr/B1lFbgSL
	TUyoGW9Zfp1HWbbJ2BWfJg==
X-Google-Smtp-Source: 
 AGHT+IHWQ29agmrDDWcPjFZ9HColPUX943ceIEm1E0NRBa6Vtktp+eoOBkQz8AuDLIIJjLiqkRyhzg==
X-Received: by 2002:a4a:e042:0:b0:571:aceb:26c8 with SMTP id
 v2-20020a4ae042000000b00571aceb26c8mr13539229oos.3.1698179061005;
        Tue, 24 Oct 2023 13:24:21 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 v12-20020a05683018cc00b006ce2cb3b959sm1995045ote.52.2023.10.24.13.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 13:24:20 -0700 (PDT)
Received: (nullmailer pid 511841 invoked by uid 1000);
	Tue, 24 Oct 2023 20:24:18 -0000
Date: Tue, 24 Oct 2023 15:24:18 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] dt-bindings: audio-graph-port: add ch-map-idx
 property
Message-ID: <20231024202418.GA507328-robh@kernel.org>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
 <87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 4TK2ZYVWKO7XNTUAFBDBMRB2YYXOIRNG
X-Message-ID-Hash: 4TK2ZYVWKO7XNTUAFBDBMRB2YYXOIRNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TK2ZYVWKO7XNTUAFBDBMRB2YYXOIRNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 23, 2023 at 05:36:09AM +0000, Kuninori Morimoto wrote:
> This patch adds ch-maps property to enable handling CPU:Codec = N:M
> connection.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml        | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 60b5e3fd1115..47f04cdd6670 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -19,7 +19,12 @@ definitions:
>      properties:
>        mclk-fs:
>          $ref: simple-card.yaml#/definitions/mclk-fs
> -
> +      ch-map-idx:
> +        description: It indicates index of ch_maps array for CPU / Codec if number of
> +          CPU(N) / Codec(M) DAIs were not same in one dai-link. ch-map-idx is not needed if the
> +          numbers were 1:M or N:1 or N=M. see soc.h::[dai_link->ch_maps Image sample] and
> +          ${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dtsi. It is good sample.

Why do we have a dtsi file hidden away here?

We have examples and actual users. Do we really need a 3rd way?

Rob
