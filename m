Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF67D58FD
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 18:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4E01EB;
	Tue, 24 Oct 2023 18:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4E01EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698165793;
	bh=Q/npvAdruZFYnYxPr6z3WoJcsEDEUtwjX2gvmSv/v+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rHAEPbj5/jAodss+xbT5nMD2JLtHHo+5/NN2sXfkiEOkkLZxU5BrVhCmSctdqwt4C
	 4J8Q3da1tQMINvVNrMXsjrflGc+h77jYMzZmlPgS13Gv7kpyGw030PjL+ZtUw2dKNV
	 UjDxCYxA1g7GkePR0Nid8sKLFPbQandyePPxtNG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CC6F8019B; Tue, 24 Oct 2023 18:42:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 054E5F80165;
	Tue, 24 Oct 2023 18:42:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4711F8019B; Tue, 24 Oct 2023 18:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03F96F80157
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 18:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F96F80157
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-583f571a213so2770277eaf.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165713; x=1698770513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4xcdNfgUB8A/3KrK/pkTkDn6tlFzVt2oKgvssbhENc=;
        b=jTHG83JUf2KFTDM36BnFMLVdBGlVCaPbn9VGT29VXyWDDMrUfLDdODi/1OKrQTAe7I
         dpHWVpy8ZT1hdK2U6iLwHy5oH0cU78ohZG/1RVSwm6Zw5wAKXYYgOSHLzjjta5sshhi8
         79Frd5c9WT7jxZdMKIxyGCA0WBs4akpbusOgFiO95wV7Xjqgzaa+wps9dt6rneXud6cE
         ZG44bWjwd3KWinNw5OKi2jL9Oclc+i651jW6r3t5LiGTv8afn9mQVY8SzBBffJ1KY++U
         nEGaznHH73jpl0fIpz4y/EG4lmhbJHMUVRTr7OP8/0nwT3xIkkZtkdpqkXC08BOJMUDh
         y+kg==
X-Gm-Message-State: AOJu0Yxy7MSAehRZuYQAouASD4W1i2pVwi1zly0p2FQ1ftSG0XyI39Uh
	ZkYicVxu4H+goz/+Y62zqg==
X-Google-Smtp-Source: 
 AGHT+IHYKyO3ogdUGL4R4E9sBhKDQ/3y/62tY8hPLoGpOKOm3RsZpCwkW+zvRJrXop02dDrQyVwNzw==
X-Received: by 2002:a4a:a581:0:b0:57b:469d:8af6 with SMTP id
 d1-20020a4aa581000000b0057b469d8af6mr13049788oom.4.1698165713249;
        Tue, 24 Oct 2023 09:41:53 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a4ad1aa000000b00581daa5c5fdsm1993792oor.29.2023.10.24.09.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 09:41:52 -0700 (PDT)
Received: (nullmailer pid 4065610 invoked by uid 1000);
	Tue, 24 Oct 2023 16:41:51 -0000
Date: Tue, 24 Oct 2023 11:41:51 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Simon Glass <sjg@chromium.org>,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, Julien Massot <julien.massot@iot.bzh>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory
 bindings
Message-ID: <169816568976.4065099.2725442642169549559.robh@kernel.org>
References: <20231013200851.347042-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
Message-ID-Hash: 3CTWWPHKCZSZ6AH5WCT6GGYJWQPQ2MSL
X-Message-ID-Hash: 3CTWWPHKCZSZ6AH5WCT6GGYJWQPQ2MSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CTWWPHKCZSZ6AH5WCT6GGYJWQPQ2MSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 13 Oct 2023 15:08:49 -0500, Rob Herring wrote:
> The common reserved-memory bindings have recently been copied from the
> kernel tree into dtschema. The preference is to host common, stable
> bindings in dtschema. As reserved-memory is documented in the DT Spec,
> it meets the criteria.
> 
> The v2023.09 version of dtschema is what contains the reserved-memory
> schemas we depend on, so bump the minimum version to that. Otherwise,
> references to these schemas will generate errors.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile    |   2 +-
>  .../remoteproc/renesas,rcar-rproc.yaml        |   2 +-
>  .../bindings/reserved-memory/framebuffer.yaml |  52 -----
>  .../reserved-memory/memory-region.yaml        |  40 ----
>  .../reserved-memory/reserved-memory.txt       |   2 +-
>  .../reserved-memory/reserved-memory.yaml      | 181 ------------------
>  .../reserved-memory/shared-dma-pool.yaml      |  97 ----------
>  .../bindings/sound/mediatek,mt8188-afe.yaml   |   2 +-
>  8 files changed, 4 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> 

Applied, thanks!

