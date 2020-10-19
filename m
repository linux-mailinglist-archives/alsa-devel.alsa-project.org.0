Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3D2930FC
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 00:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB1F51704;
	Tue, 20 Oct 2020 00:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB1F51704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603145577;
	bh=4xdTj5Y4VJ/3BEN7HRpzd+X3zOWHsYAtusdSthtK/fI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRA53mJbc1ZUVWg6vcYAMPm8S7Jni/13/BIwbMN5UTwyiswD6dgXdnUs6AhcDCozr
	 znOxu8naJFm/9AFGFoqEjXVyK4D0EUvnDn+eWdJ20drNyyDLLvD1nyN8DfpGtjS0AK
	 HzqEklhDjiviosf68Clj5jKzhdKVvoSlwCbfRFGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7132CF801A3;
	Tue, 20 Oct 2020 00:11:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C33E3F80247; Tue, 20 Oct 2020 00:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C192FF80121
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 00:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C192FF80121
Received: by mail-oo1-f67.google.com with SMTP id w25so342816oos.10
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YAcxqz4gzIZRTswKLMgM+/6nLU+BPO60IaB6aMIKPFs=;
 b=jlvKnLrG/EMVBzubuZ69E9EaAafBja4Y0byN2hSghhUyQsbpV1d4ACyfAWWIhb9xqq
 HXZDPZzQsptoV2qaMjPEXnNNmdJElT/Y7XrdDp2Y1Y08uQVZ6YVvUNTEcDRWhj/F9Rrm
 x+7eIkzFm/EFTHtB9fOOtru/y8X3db5O2/osTACQClWxID1FWa5Saf6OmUVy6SSZ9uFi
 V2BIb2ppmuURWezKcip2jp4CFVKkz2sbwPDa/e5FtM0KlSf0kYiNu0/RROnW0W4vGVG2
 bCVaODZcDvVpFK8T2iGDH2WgxSiBvXeYevNaOchwhg142g//BNG6Ezl39MLP9srJzm5s
 ZxWg==
X-Gm-Message-State: AOAM532Sl9vS16EsRoMMaPpVfuYXjTX8K1jd5NKvDCNX9TJgCzrEDf7y
 t3INsRgw0Vf8EeU1HSVRXw==
X-Google-Smtp-Source: ABdhPJwRFkQroby+u4ICY2NJLUAU/9hZmS0o+Tf0mlbmQ+dO75MkbVoF+8Wwz8jdOtiUcjy2KT6FqA==
X-Received: by 2002:a4a:c68d:: with SMTP id m13mr1485011ooq.64.1603145467832; 
 Mon, 19 Oct 2020 15:11:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 38sm269664ota.42.2020.10.19.15.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 15:11:06 -0700 (PDT)
Received: (nullmailer pid 3688686 invoked by uid 1000);
 Mon, 19 Oct 2020 22:11:05 -0000
Date: Mon, 19 Oct 2020 17:11:05 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 10/15] ASoC: dt-bindings: tegra: Add graph bindings
Message-ID: <20201019221105.GA3679866@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-11-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602859382-19505-11-git-send-email-spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Fri, Oct 16, 2020 at 08:12:57PM +0530, Sameer Pujar wrote:
> Add device tree binding properties of generic graph to ASoC component
> devices. This allows to define audio ports out of these components or
> DAIs and audio graph based sound card can be realised with this.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml  | 7 +++++++
>  .../devicetree/bindings/sound/nvidia,tegra210-admaif.yaml          | 7 +++++++
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml  | 7 +++++++
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml  | 7 +++++++
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml   | 7 +++++++
>  5 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> index ed2fb32..23875b1 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -55,6 +55,13 @@ properties:
>        The name can be "DSPK1" or "DSPKx", where x depends on the maximum
>        available instances on a Tegra SoC.
>  
> +  ports:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/ports
> +
> +patternProperties:
> +  "^port(@[0-9a-f]+)?$":
> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port

You should have either 'ports' or a single 'port' (yes, the graph 
binding allowed multiple port nodes without 'ports', but that should be 
deprecated IMO)
