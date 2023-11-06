Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C18747E2747
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 15:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 626C2828;
	Mon,  6 Nov 2023 15:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 626C2828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699281767;
	bh=wAJJnFYyygOv32pzjkLJc3Y5zmAhASZUt3ftsOJhb0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDuMsCiXosXrKmgpkthiOnllkAFnLVfmcgt6wv0NAXhsrRiBpqGiL80av+dKon8FO
	 /iv0+rjP+Z2fehX7uedLCRSkOlakyFrQFb6XrwlQ8hg7fyraLoOJRQXjOTLS4IqoNf
	 4J96Cuqnc8MTdBqxxXB9Wda0x1AVDNoUl59lPeGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6421F801F5; Mon,  6 Nov 2023 15:41:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A4E8F80169;
	Mon,  6 Nov 2023 15:41:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49C26F8016D; Mon,  6 Nov 2023 15:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36898F800ED
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 15:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36898F800ED
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6ce2cf67be2so2869914a34.2
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Nov 2023 06:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699281703; x=1699886503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKvqk5gir/9qqqDIfkQNJgvfbuZQ5kJzgHbwZKn9mQs=;
        b=K3dhRox5Jgrbm6QJe7C80YnfIrd5ciCNLJT6v1vpgN2MyhRB2EGPsNSZLgbcDJRvqj
         Lhbqu/jx4F8BmqZLXKfxEM4Ob90DKpH0Z+WHLbldy7XlcaahlVXz6VTA3SxlWcZ97Epw
         wCWPMlqiRjto54vFzjaM/DAcX2YemfiVwZ5F7CHg644p2gyooMhie+4aZzvUt+eRlcxN
         mess33yiVOquStY3f7+svD8VWVhd++XhrkDDNMtqe43hq3chkER7tUOiVXvvWnNjDaD6
         enhvJEPsSjEJAW/cwJtlhhMX4pMxuitPG2oGs/Yp9DckvlmXklC3YNPxsAVOwfwWpeyV
         NcuQ==
X-Gm-Message-State: AOJu0YyVx5qgKyRXU8yp0Rf3zBOYJIflOVkX+WEFVdrsq1j+CEoOXhg2
	SHnhaCthGpKC9Vk6PECTDg==
X-Google-Smtp-Source: 
 AGHT+IFGLVSQjQpsvTCqqKZz/oXWb4ln1j9IpZTysYqr4mTbsYvnPvKbsLqX2dGlf/8Kr9A3o8iOgw==
X-Received: by 2002:a05:6830:2085:b0:6ce:2733:f71b with SMTP id
 y5-20020a056830208500b006ce2733f71bmr31850416otq.26.1699281702959;
        Mon, 06 Nov 2023 06:41:42 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 b24-20020a9d6b98000000b006bf0f95f702sm1268436otq.64.2023.11.06.06.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 06:41:42 -0800 (PST)
Received: (nullmailer pid 314184 invoked by uid 1000);
	Mon, 06 Nov 2023 14:41:41 -0000
Date: Mon, 6 Nov 2023 08:41:41 -0600
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate
Message-ID: <20231106144141.GA312869-robh@kernel.org>
References: <20231101063514.666754-1-wtli@nuvoton.com>
 <20231101063514.666754-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101063514.666754-2-wtli@nuvoton.com>
Message-ID-Hash: 3HQTVPEPKTKVQMRSP5VPILFWVJ5O4SEJ
X-Message-ID-Hash: 3HQTVPEPKTKVQMRSP5VPILFWVJ5O4SEJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HQTVPEPKTKVQMRSP5VPILFWVJ5O4SEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 01, 2023 at 02:35:13PM +0800, Seven Lee wrote:
> Add input with DMIC slew rate controls
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> index 3e54abd4ca74..48c389276a15 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> @@ -89,6 +89,13 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      default: 3072000
>  
> +  nuvoton,dmic-slew-rate:
> +    description: The range 0 to 7 represents the speed of DMIC slew rate.
> +        The lowest value 0 means the slowest rate and the highest value
> +        7 means the fastest rate.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0

Don't write constraints in prose:

maximum: 7

> +
>    nuvoton,left-input-single-end:
>      description: Enable left input with single-ended settings if set.
>          For the headset mic application, the single-ended control is
> @@ -127,6 +134,7 @@ examples:
>              nuvoton,jack-insert-debounce = <7>;
>              nuvoton,jack-eject-debounce = <0>;
>              nuvoton,dmic-clk-threshold = <3072000>;
> +            nuvoton,dmic-slew-rate= <0>;
>              #sound-dai-cells = <0>;
>          };
>      };
> -- 
> 2.25.1
> 
