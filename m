Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E12F4E6E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:24:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 040B616BD;
	Wed, 13 Jan 2021 16:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 040B616BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551451;
	bh=W+QdX5ldSEd31t12yzV1m3tR3iTcBhgYI5dXBhY80F0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxAVymX97NhLmuTzoiKoMUP+B/8ZpP975tKTs4rz1uRLpX5oeDVLyKqPEZ9HL/p2m
	 zPn6Q59aIBXQcMGA2e4uveVG7ng6SX75qnwtD0RKSmlcWTk8s19CHDgQKfKw6GmLt7
	 xtugG0edBsfxfCbOAPZA5lvRly1nVKPY6zTIkVsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FBE1F80254;
	Wed, 13 Jan 2021 16:22:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35031F801ED; Wed, 13 Jan 2021 16:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AB3F80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AB3F80085
Received: by mail-ot1-f48.google.com with SMTP id o11so2221579ote.4
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SE9am3kq8RjarWOXnd9kdCTvbTnepwR4fe9xga07N+k=;
 b=cYPdQgDSVHTSMwfjhOfgruRGe574oONZ7l/w4YfaPm9XRmZ846O9JF6VFCRdQjpQ0t
 4BtFbUCp3xDUc+eJ0ixqmu/KvZb/V6XYBAubuGV2AV4lX5dk9LjkIAJy4WNSJFbf+tGz
 E2pO8SXpX3vMXvcP/gh8hdMPX3Se4zmDl0E0gs+vTsz5y1YU8eooIDPlPmg9szh41czf
 KmvBuJbzrO8d84of0Cta/WEtcKNOc1tMvYESdt48iQkxz7HFdHe3QieoKO+NEA75QmwQ
 fvX2HyYJkQBQ5bGoOUmDsl1Yey81qZh0N9wx8rBb8CLLX5M4qxbph4vE4a8OW9bS08fk
 L8xQ==
X-Gm-Message-State: AOAM530mDTgEfIxacGdMtkPX9B2eIqh29ssB/hRL/tmEDLyskrA/sgTC
 hoy5XGGY4HY2zb4T6sdN6w==
X-Google-Smtp-Source: ABdhPJyXSD7O2u+KLy4dCmhAaS4RrzejnZJ8LhZpdTnooicBMv0HLXKioHgADiNofONZ/RIUjKsn5g==
X-Received: by 2002:a9d:470f:: with SMTP id a15mr1617646otf.62.1610551347611; 
 Wed, 13 Jan 2021 07:22:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e10sm437795otl.38.2021.01.13.07.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:22:26 -0800 (PST)
Received: (nullmailer pid 2470201 invoked by uid 1000);
 Wed, 13 Jan 2021 15:22:25 -0000
Date: Wed, 13 Jan 2021 09:22:25 -0600
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
Message-ID: <20210113152225.GA2334778@robh.at.kernel.org>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108160501.7638-3-rf@opensource.cirrus.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 kuninori.morimoto.gx@renesas.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de
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

On Fri, Jan 08, 2021 at 04:04:57PM +0000, Richard Fitzgerald wrote:
> The audio-graph-card driver has properties for configuring the clocking
> for DAIs within a component, but is missing properties for setting
> up the PLLs and sysclks of the component.
> 
> This patch adds the two new properties 'plls' and 'sysclks' so that the
> audio-graph-driver can fully configure the component clocking.

I'm not sure this makes sense to be generic, but if so, we already have 
the clock binding and should use (and possibly extend) that.

This appears to all be configuration of clocks within the codec, so 
these properties belong in the codec or cpu nodes.

> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/sound/audio-graph.yaml           | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> index 4b46794e5153..9e0819205a17 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
> @@ -39,6 +39,52 @@ properties:
>    mic-det-gpio:
>      maxItems: 1
>  
> +  plls:
> +    description: |
> +      A list of component pll settings. There are 4 cells per PLL setting:
> +        - phandle to the node of the codec or cpu component,
> +        - component PLL id,
> +        - component clock source id,
> +        - frequency (in Hz) of the PLL output clock.

assigned-clocks binding can set frequencies and parent clocks.

'pll' is too specific to the implementation. You may want to configure 
the freq and parent of something that's not a pll.

> +      The PLL id and clock source id are specific to the particular component
> +      so see the relevant component driver for the ids. Typically the
> +      clock source id indicates the pin the source clock is connected to.
> +      The same phandle can appear in multiple entries so that several plls
> +      can be set in the same component.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  plls-clocks:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of clock names giving the source clock for each setting
> +      in the plls property.
> +
> +  sysclks:
> +    description: |
> +      A list of component sysclk settings. There are 4 cells per sysclk
> +      setting:
> +        - phandle to the node of the codec or cpu component,
> +        - component sysclk id,
> +        - component clock source id,
> +        - direction of the clock: 0 if the clock is an input to the component,
> +          1 if it is an output.

A clock provider and consumer would provide the direction.

> +      The sysclk id and clock source id are specific to the particular
> +      component so see the relevant component driver for the ids. Typically
> +      the clock source id indicates the pin the source clock is connected to.
> +      The same phandle can appear in multiple entries so that several sysclks
> +      can be set in the same component.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  sysclks-clocks:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of clock names giving the source clock for each setting
> +      in the sysclks property.
> +
> +dependencies:
> +  plls: [ plls-clocks ]
> +  sysclks: [ sysclks-clocks ]
> +
>  required:
>    - dais
>  
> -- 
> 2.20.1
> 
