Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E47D8A34
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 23:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0369868;
	Thu, 26 Oct 2023 23:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0369868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698355435;
	bh=fGHcJ5hunsJbLlRf3KgeF/FKhgvAN6JanLqHYJ+agVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JyRpzfDUNNJ4ZPsPkqlhFaBYQtG6tA6vabmVMpg+rUp7EZsVJwXl/2KFT6V8XXcYx
	 4+2sJVW9zRHB3b8ubImiayxmjAJ7M8cwkzEB8Q0zDOIienmQ66/wuE5DNtX3DpqCVL
	 uMBQcco8sGdIdX4mPEppsOfgOwTU74wHIuU9/Pdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFB5F8014B; Thu, 26 Oct 2023 23:23:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A9BF80165;
	Thu, 26 Oct 2023 23:23:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71751F8019B; Thu, 26 Oct 2023 23:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 607EDF80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 23:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607EDF80152
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6cd33d51852so895348a34.2
        for <alsa-devel@alsa-project.org>;
 Thu, 26 Oct 2023 14:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698355370; x=1698960170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4152jFLYLD/MBewGGEPSHG844zUZQa9UTyIgToDxCiM=;
        b=HXIh968bvmm5zYJqVKgRqKf3UJyCbWVN/s/w1tbIf7yTPpmjxUP9A1AhAxgjFpMxZf
         1VMuLGKu9QhccIIYgGzRjytrOhU5dXJaQg8rd3rP3qrcd7DLePcNuefgpP0+pOBHS4bI
         sHGlAmIXeQwMGPvbrg3PI1py/ZFOr5ciFwA6TWo0aqWS29okCnvcPtrd9HE6aKrHRHbL
         EHRL8ObTl2YpLvBFRqHiGpOTIPLG4PWNSur6SdSDsHYK5Pk07GiE3ba+6T0M+cy2fzvt
         hpMj/f09K4KIiIgR2+a4Rqjw2RdvKL8uAAycSZPw3QeW9QKc/sXXrM4SvMhS5YYxteC0
         f43Q==
X-Gm-Message-State: AOJu0Yx4PLIZIsVSt5X1DUN2OClaBsr/t2jic6LAqGQVEUrWgdyOqQmP
	hxhNp4aNawWnNxq5aS7r8Q==
X-Google-Smtp-Source: 
 AGHT+IHabh59A6Iy4VEaSpR8/PFa9Dq+e6X0DG9ObnlWccTugNJclAbi3zd3YfIeAaa0IB54AvVS2A==
X-Received: by 2002:a05:6830:14:b0:6cc:fff0:8ebd with SMTP id
 c20-20020a056830001400b006ccfff08ebdmr612994otp.24.1698355370314;
        Thu, 26 Oct 2023 14:22:50 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 b8-20020a4a98c8000000b0057377b1c1c8sm36892ooj.24.2023.10.26.14.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 14:22:49 -0700 (PDT)
Received: (nullmailer pid 420013 invoked by uid 1000);
	Thu, 26 Oct 2023 21:22:48 -0000
Date: Thu, 26 Oct 2023 16:22:48 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/5] dt-bindings: audio-graph-port: add
 channel-map-index property
Message-ID: <20231026212248.GA383937-robh@kernel.org>
References: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
 <878r7rbg0v.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r7rbg0v.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: B5YKLWDDFLFFYSD2GVCQDYIIWCDTRWWW
X-Message-ID-Hash: B5YKLWDDFLFFYSD2GVCQDYIIWCDTRWWW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5YKLWDDFLFFYSD2GVCQDYIIWCDTRWWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 25, 2023 at 02:19:13AM +0000, Kuninori Morimoto wrote:
> This patch adds channel-map-index property to enable handling

Don't write commit messages with 'This patch' or 'This commit'. See the 
documentation on writing patches.

> CPU:Codec = N:M connection.

This is not answering Why?

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 60b5e3fd1115..2a7e0784d591 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -93,6 +93,19 @@ definitions:
>                minimum: 1
>                maximum: 64
>  
> +      channel-map-index:
> +        description: It indicates CPU/Codec DAIs channel mapping index if number of
> +          CPU(N) / Codec(M) were not same in one dai-link. channel-map-index is not
> +          needed if the numbers were 1:M or N:1 or N==M. Same indexed CPU <-> Codec
> +          will be paired. This is CPUx2 <-> Codecx3 sample.
> +                                   CPUA   { ... .channel-map-index = <0>;   }
> +          [0] CPUA <---> CodecA    CPUB   { ... .channel-map-index = <1 2>; }
> +          [1] CPUB <-+-> CodecB
> +          [2]        \-> CodecC    CodecA { ... .channel-map-index = <0>; }
> +                                   CodecB { ... .channel-map-index = <1>; }
> +                                   CodecC { ... .channel-map-index = <2>; }

We have 2 different meanings for channel-map-index here. We have the 
codecs defining "I am index N" and then the CPUs defining "I'm connected 
to codec N". That's confusing to start with. Made-up indices are 
something we try to avoid in DT. Are the numbers here (0, 1, 2) 
significant? The normal way we link from one node to another is 
phandles. Why not use phandles here:

CPUA   { ... .channel-map-index = <&CodecA>;   }
CPUB   { ... .channel-map-index = <&CodecB &CodecC>; }


However, we also have OF graph to define complex topologies/connections 
AND we're already using it for this binding. So why not here? You can 
always have more than 1 port and/or endpoint. Generally, multiple ports 
are independent/simultaneous data connections and multiple endpoints are 
either 1:N fanout or N:1 muxed connections.

Rob
