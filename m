Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C9475C88
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 17:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D5A318D9;
	Wed, 15 Dec 2021 16:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D5A318D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639584014;
	bh=cU5a/IgRjOalQaNvoG/wntMiwb5rnW4fqc/uCvodQBo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YbiPv54M0kGFeqL0C/gmAshz3sSaBtvwekt/c/LCAqVvbA7RNpxwOpky21Y2RaJHp
	 fAGeFJLGp/c7Bz9bUXT3rya3V9ly9ekViuIEZ5KzuTdPNPKGqSV9DYVS9TEF6TEyBF
	 76kWH1k+x2Fy26sVtEchtMMdIjWyoEfQ+x2EuSss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 095D5F80237;
	Wed, 15 Dec 2021 16:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7680EF80236; Wed, 15 Dec 2021 16:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 324E9F80158
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 16:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324E9F80158
Received: by mail-oi1-f178.google.com with SMTP id q25so32381973oiw.0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 07:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwKo5i0Vq8YF7oR5vfyMGYoH3etlu6Rpd8MQ1BR3vBk=;
 b=UMDZz6MumLADALuYvyoImH5yJaIptfITRYoFr2ESt8mzv9EsX1gYR1aFqtwDhxxMuw
 4Ngq0L96RICFG4GfTPMSOf8FOn0JY6zVVCSdlnd9DsIE7m2YX8IVnsmig6VRf2Lq3wUV
 4INiesORSwit3hMaXonpwWuWZYVjIabr7czEG2XMjUp0vU5yA/BKx/6jumaaD1OEEMjE
 RyeM3K9PtwspOidQd7N66xg1ajF+cUm/jbiuFXo7On8Za3NvwkztyOWgsy7sFucTY1/p
 dlbMUts++DD0KVWm4LTd6EQZen8Mjps7WI50v7IdQJigYt1OUWANN1i7Pb6VvebYl3Pg
 /DIg==
X-Gm-Message-State: AOAM5308bXtW+zJK7DTEjZvgqrH4tYST1vqyZ6xmuaa/QMZc+MXv4j88
 z25H+ZLe6oNAeoNYQ+WVJA==
X-Google-Smtp-Source: ABdhPJz1lQkwPOFlTqTKhp/Jn0ioAW3AYh2h05iZh0wN9H3lh85EORZ5mp1iOpftZtQ7Yg3XRX/30w==
X-Received: by 2002:aca:2115:: with SMTP id 21mr374267oiz.25.1639583937058;
 Wed, 15 Dec 2021 07:58:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j5sm502652ots.68.2021.12.15.07.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 07:58:56 -0800 (PST)
Received: (nullmailer pid 1390102 invoked by uid 1000);
 Wed, 15 Dec 2021 15:58:55 -0000
Date: Wed, 15 Dec 2021 09:58:55 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Message-ID: <YboQv+lsHZBhrpfN@robh.at.kernel.org>
References: <20211208064852.507977-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208064852.507977-1-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

On Wed, Dec 08, 2021 at 03:48:52PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_daifmt_parse_clock_provider_raw() is handling both
> bitclock/frame-master, and is supporting both flag/phandle.
> Current DT is assuming it is flag style.
> This patch allows both case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 43e7f86e3b23..7d0248be08c5 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -42,10 +42,15 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/flag
>        frame-master:
>          description: Indicates dai-link frame master.
> -        $ref: /schemas/types.yaml#/definitions/phandle
> +        anyOf:

Does oneOf work? It can't be both at the same time, but the schemas 
could possibly need some further constraints.

> +          - $ref: /schemas/types.yaml#/definitions/flag
> +          - $ref: /schemas/types.yaml#/definitions/phandle
>        bitclock-master:
>          description: Indicates dai-link bit clock master
> -        $ref: /schemas/types.yaml#/definitions/phandle
> +        anyOf:
> +          - $ref: /schemas/types.yaml#/definitions/flag
> +          - $ref: /schemas/types.yaml#/definitions/phandle
> +
>        dai-format:
>          description: audio format.
>          items:
> -- 
> 2.25.1
> 
> 
