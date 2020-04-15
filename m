Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA61A8F7A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 02:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55FD0166F;
	Wed, 15 Apr 2020 02:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55FD0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586909324;
	bh=d6uxhSulRF8TeLnRDNgidxYMiLjnB2MJe8dPiT5FhzA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MyqaQOWJ8zesjdapnXjojVJSf7Z6Cs5EMwl+GzkF2NlhivWo+ES94sNs1T89a6TvP
	 Q8RSSW+/cdJ82Dg/npILsP7kPafdwqiCbx2qMyEE35JMcx5tU1YG7Jw6kq4RojVYP4
	 hbGzJnd/3OwXoT7SVSCECHR3Invn5FrMmKutyzeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6222CF8014E;
	Wed, 15 Apr 2020 02:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FD03F8013D; Wed, 15 Apr 2020 02:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE1E3F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 02:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE1E3F80115
Received: by mail-ot1-f65.google.com with SMTP id m2so1696233otr.1
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 17:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zzzsKz1aXq1FGxDkuAfWvlD6tFRvDkWAA3kCh2toeFc=;
 b=eZ2FBeEdpu2UqAem/WHiYUoR/rUKmfwW7vMm/y6fzWYbT0Ly9VnQ3GSfN2XBJPNpMr
 kVsevvQY3niq8T8DHoU4i0MoJiKlSf4faIZCJlE6iQlKdzC+ddLCm9MvOViFb0t/QTJ7
 oZfl5dGPHpGNKUJ59Skoe5aRWrSiH3mCp/NB0qqs/HDPT4hQh9+BMdW5B0BI1FTsfN4+
 iE4qxbNzqw22k4r4Xf5AvSCSL5n8ofhi1Y7jIJ3QQihC6vTBLU8Qy/p/Or4sQMzSxmXt
 G2fbJe3tZrWeFtFsPz33IbX4iqvx4st6pgKOllTo2n2Sx/VMmT26s/1oaIgtoNt2tk6j
 AEqg==
X-Gm-Message-State: AGi0Pub/NJ/EMvEIs24XZIRCtniAClwMx0pYoxa6OD/0FP91PA4k07/d
 XSSMYRblFseQGHa2oj5DMw==
X-Google-Smtp-Source: APiQypKXBmIANTuzqAKXJR1+GcTctxVj4356oR1rWyrdLfaNvOjR94IF3xYVI+WWd5PezEcDkgPjKw==
X-Received: by 2002:a05:6830:1bdb:: with SMTP id
 v27mr16047181ota.218.1586909211644; 
 Tue, 14 Apr 2020 17:06:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm4756205oou.27.2020.04.14.17.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 17:06:50 -0700 (PDT)
Received: (nullmailer pid 19643 invoked by uid 1000);
 Wed, 15 Apr 2020 00:06:49 -0000
Date: Tue, 14 Apr 2020 19:06:49 -0500
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Message-ID: <20200415000649.GA28504@bogus>
References: <20200406135608.126171-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406135608.126171-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Kenneth Westfield <kwestfie@codeaurora.org>
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

On Mon, Apr 06, 2020 at 03:56:07PM +0200, Stephan Gerhold wrote:
> The lpass-cpu driver now allows configuring the MI2S SD lines
> by defining subnodes for one of the DAIs.
> 
> Document this in the device tree bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../bindings/sound/qcom,lpass-cpu.txt         | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 21c648328be9..df53a10502f7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -30,6 +30,8 @@ Required properties:
>  - reg			: Must contain an address for each entry in reg-names.
>  - reg-names		: A list which must include the following entries:
>  				* "lpass-lpaif"
> +- #address-cells	: Must be 1
> +- #size-cells		: Must be 0
>  
>  
>  
> @@ -37,6 +39,18 @@ Optional properties:
>  
>  - qcom,adsp		: Phandle for the audio DSP node
>  
> +By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> +The SD lines to use can be configured by adding subnodes for each of the DAIs.
> +
> +Required properties for each DAI (represented by a subnode):
> +- reg			: Must be one of the DAI IDs
> +			  (usually part of dt-bindings header)
> +- qcom,playback-sd-lines: List of serial data lines (0-3) to use for playback

0-3 for the values or number of entries?

> +- qcom,capture-sd-lines	: List of serial data lines (0-3) to use for capture
> +
> +Note that adding a subnode changes the default to "no lines configured",
> +so both playback and capture lines should be configured when a subnode is added.
> +
>  Example:
>  
>  lpass@28100000 {
> @@ -51,4 +65,13 @@ lpass@28100000 {
>  	reg = <0x28100000 0x10000>;
>  	reg-names = "lpass-lpaif";
>  	qcom,adsp = <&adsp>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Optional to set different MI2S SD lines */
> +	mi2s-quaternary@3 {

Normally the node name reflects the class of device. IOW, all the child 
nodes should have the same name.

> +		reg = <MI2S_QUATERNARY>;
> +		qcom,playback-sd-lines = <0 1>;
> +	};
>  };
> -- 
> 2.26.0
> 
