Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2C252333
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 23:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D982516DB;
	Tue, 25 Aug 2020 23:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D982516DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598392490;
	bh=EDPzsxGrzbd8yVTZyGVgWxXMOHbylkPvfIMOpW/XevE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FD5jR5Z3oZ45yfWRV3wevSlzXvSnZZ9YX0cbSU82Fe13Chb34vzKSU2YWR47G/KB+
	 dI0lKk5ICxBo3ExG6tbiV7rfdH8rdAOTIEL76GeqTpZB5PMZj3spXborC6kvWjaZkT
	 9dP/oWUlt6klcl8Fzyyoe3e9eddotqOB1QrxmUFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8EFDF80269;
	Tue, 25 Aug 2020 23:53:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2428FF8025A; Tue, 25 Aug 2020 23:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7159AF800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 23:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7159AF800EB
Received: by mail-il1-f196.google.com with SMTP id r13so100424iln.0
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 14:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z862RBqRInU1jmo+k1WEqk2fp00qEJO4pngR/l2zG04=;
 b=jMUcAxhhgNzyn0xFSzs5NBYY3YJXtXGYuO7vvI27ZfO0iMitEvGo2et+ER+BjaglvZ
 M3RdCNNqiyHrvagedSWv6TSnft6bvyx8PxLZiLTDJ/BehNGObyDM+taNmhIPd+bkF0Ig
 fEhO4URPmldQ8/VGUzxdh4vsQnjJaELf7dzo2WmdUziBzTSFShAueuC6G4KKqUBT8eFm
 CJEAJzD5/bvm+hpSfgRIYZ9qe60eiftW8TGG9yxZBX4J9/SKzXUlMhtp3xFDuqK+Cknn
 KQ3YoMF+X/HpN8YtH1WDjFOaiX2lNmGgI+lQ+1Vai9pbqwwFlowv/IBYs03aByi/YMgA
 cztQ==
X-Gm-Message-State: AOAM532ftrkuikrfVPHwOowVBSSvN23/lkQRdiYImEd450z45/oaMxMS
 X9vMCw04evWCOUOL/mdwsQ==
X-Google-Smtp-Source: ABdhPJx3VbGqokXyWzIiTWH+YZW0T23M3rLSC5vTwacOnJTPXEiL3A51zhWfOq6sV0mmYmWUyNoC2Q==
X-Received: by 2002:a92:5bd5:: with SMTP id c82mr11194112ilg.166.1598392378364; 
 Tue, 25 Aug 2020 14:52:58 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id k18sm174461ils.42.2020.08.25.14.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:52:57 -0700 (PDT)
Received: (nullmailer pid 1403055 invoked by uid 1000);
 Tue, 25 Aug 2020 21:52:53 -0000
Date: Tue, 25 Aug 2020 15:52:53 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Message-ID: <20200825215253.GA1397515@bogus>
References: <20200819091533.2334-1-stephan@gerhold.net>
 <20200819091533.2334-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819091533.2334-2-stephan@gerhold.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Wed, Aug 19, 2020 at 11:15:32AM +0200, Stephan Gerhold wrote:
> In some cases we need to probe additional audio components that do
> not appear as part of the DAI links specified in the device tree.
> Examples for this are auxiliary devices such as analog amplifiers
> or codecs.
> 
> To make them work they need to be added as part of "aux-devs"
> and connected to some other audio component using the audio routes
> configurable using "(qcom,)audio-routing".
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
>  Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
>  Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> index 84b28dbe9f15..23998262a0a7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> @@ -34,6 +34,13 @@ Required properties:
>  			  * DMIC
>  			  * Ext Spk
>  
> +Optional properties:
> +
> +- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
> +			  amplifiers) that do not appear directly within the DAI
> +			  links. Should be connected to another audio component
> +			  using "qcom,audio-routing".
> +
>  Dai-link subnode properties and subnodes:
>  
>  Required dai-link subnodes:
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> index c814e867850f..248df5056fec 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> @@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
>  	Value type: <stringlist>
>  	Definition: The user-visible name of this sound card.
>  
> +- aux-devs
> +	Usage: optional
> +	Value type: <phandles with arguments>

How do you know how many arguments? It either has to be fixed or needs a 
#.*cells in the phandles. For the latter, you'd need to come up with a 
common binding.

> +	Definition: A list of phandles for auxiliary devices (e.g. analog
> +		    amplifiers) that do not appear directly within the DAI
> +		    links. Should be connected to another audio component
> +		    using "audio-routing".
> +
>  = dailinks
>  Each subnode of sndcard represents either a dailink, and subnodes of each
>  dailinks would be cpu/codec/platform dais.
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
> index ca8c89e88bfa..3d5cbe953cf7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
> @@ -24,6 +24,14 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
>  	Value type: <stringlist>
>  	Definition: The user-visible name of this sound card.
>  
> +- aux-devs
> +	Usage: optional
> +	Value type: <phandles with arguments>
> +	Definition: A list of phandles for auxiliary devices (e.g. analog
> +		    amplifiers) that do not appear directly within the DAI
> +		    links. Should be connected to another audio component
> +		    using "audio-routing".
> +
>  = dailinks
>  Each subnode of sndcard represents either a dailink, and subnodes of each
>  dailinks would be cpu/codec/platform dais.
> -- 
> 2.28.0
> 
