Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C448298DDA
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 14:28:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E376C16DF;
	Mon, 26 Oct 2020 14:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E376C16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603718931;
	bh=pPQqd2JM9kMyBN8sFXESra3Mht1IZqu9icB5cyKdO5s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LVJxcc6EqGVUjX3F/SJ8OGL9y/yCALVqX8oWVqqHzDarY8/QF4hDMtgy/Ga0DvhXF
	 MGmyKuN28hK6SgDW2vbUPYCaxUL907tDAlqvmcJXexzVNJYCGEfj0Bshj+HH+3oqUK
	 yMlIAuZsduhgLhJ/+gxceOemD5dN4bTooxNpJs2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 703BBF801D8;
	Mon, 26 Oct 2020 14:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D207FF80212; Mon, 26 Oct 2020 14:27:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7EE0F801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 14:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7EE0F801D5
Received: by mail-oi1-f195.google.com with SMTP id f7so10466397oib.4
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 06:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I00XBAnJ7WylgkzAn5TxWF3njmn5zBWWNtxL/K5mgoc=;
 b=Kv34mHMY9EjN6EBn3d8tZDm7NBWXmK/Abv7eTOdaG7egE+lo3EAHVYyT6YoOTGidRX
 zPzMqaHO/3LM8DGPJx7f6A+Yv/p5d2SyM3RgU0KcbAf1Xrx5Gt1J9TCusashNtevTxpZ
 hppDCC1aK4S7v4T2rKZHiAfwIBgIVjsQC60+Ap90wSsRHj55dJbcwLzeOzxIkVy4PGOe
 FmaOyVoD//7a2J57lTKuXezaLxiq+GX3UM29UxlZHTIIsF1jd9OLA7IAX9k752U826RJ
 0c6DANAcgpw4ysnpZSt044THNmPXjotgnZSOPyrXWszHPp9EbjzPObHPCxjaCev5ukR5
 Nbsw==
X-Gm-Message-State: AOAM531XEHlmm25Ox/dml289P8mzFzxlOAIL3mO32H4LfbvaZn6Fe1lS
 PtzQOFFFYm3PcP3C2VUAdl73RliuBA==
X-Google-Smtp-Source: ABdhPJw/URyM2Olc0l0cnR5M+IOaA7dfiOz7xYxgvGes09V25+mkFzvABkINEQh/Wu5rg0R4pOiViw==
X-Received: by 2002:aca:6206:: with SMTP id w6mr14216985oib.121.1603718826869; 
 Mon, 26 Oct 2020 06:27:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d22sm3855955oij.53.2020.10.26.06.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:27:05 -0700 (PDT)
Received: (nullmailer pid 28455 invoked by uid 1000);
 Mon, 26 Oct 2020 13:27:04 -0000
Date: Mon, 26 Oct 2020 08:27:04 -0500
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/7] ASoC: audio-graph-card: Add plls and sysclks DT
 bindings
Message-ID: <20201026132704.GA19204@bogus>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
 <20201016173541.21180-3-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016173541.21180-3-rf@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de, linux-rpi-kernel@lists.infradead.org
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

On Fri, Oct 16, 2020 at 06:35:36PM +0100, Richard Fitzgerald wrote:
> This adds the two new properties 'plls' and 'sysclks' to the dt bindings.
> These add the ability to set values that will be
> passed to snd_soc_component_set_sysclk() and snd_soc_component_set_pll().

I worry this looks like Linux implementation details leaking into the 
binding.

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/sound/audio-graph-card.txt       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> index d5f6919a2d69..59bbd5b55b59 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> @@ -32,6 +32,19 @@ Required properties:
>  Optional properties:
>  - pa-gpios: GPIO used to control external amplifier.
>  
> +- plls: A list of component pll settings that will be applied with
> +      snd_soc_component_set_pll. Each entry is a phandle to the node of the
> +      codec or cpu component, followed by the four arguments id, source,
> +      frequency_in, frequency_out. Multiple entries can have the same phandle
> +      so that several plls can be set in the same component.

Where do the values of id and source come from?

> +
> +- sysclks: A list of component sysclk settings that will be applied with
> +      snd_soc_component_set_sysclk. Each entry is a phandle to the node of
> +      the codec or cpu component, followed by the four arguments id, source,
> +      frequency, direction. Direction is 0 if the clock is an input, 1 if it
> +      is an output. Multiple entries can have the same phandle so that several
> +      clocks can be set in the same component.

Are these really common properties? They seem kind of Cirrus specific 
and perhaps should be located in the codec node(s).

> +
>  -----------------------
>  Example: Single DAI case
>  -----------------------
> @@ -335,3 +348,34 @@ Example: Multi DAI with DPCM
>  			};
>  		};
>  	};
> +
> +-----------------------
> +Example: Set component sysclks and PLLs
> +-----------------------
> +
> +	sound {
> +		compatible = "audio-graph-card";
> +
> +		sysclks = <
> +			&cs47l15 1 4 98304000 0
> +			&cs47l15 8 4 147456000 0
> +		>;
> +		plls = <
> +			&cs47l15 1 0 24576000 98304000
> +		>;
> +
> +		dais = <&cpu_i2s_port>;
> +	};
> +
> +	cs47l15: codec@0 {
> +		...
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			cs47l15_aif1_port: port@0 {
> +				reg = <0>;
> +				cs47l15_aif1: endpoint {
> +					remote-endpoint = <&cpu_i2s_endpoint>;
> +				};
> +			};
> +	};
> -- 
> 2.20.1
> 
