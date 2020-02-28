Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CD173C31
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 16:52:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE6316E4;
	Fri, 28 Feb 2020 16:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE6316E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582905134;
	bh=J8YaD3XysmkNtxkj5J5klSCDqrtpxqc61S9xpF9emqE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfrGGNxLIBuV8AbhOphbYLz5rUXma4TcEcX0Ce0SJO1ERTIzGtA99UwNMEsmbRTXA
	 iXUrd7o1kGmt1Ss2ZztJotvTKPI3HP5udTT2iIQewmeCpe6xDftXtJPossXSecHV8j
	 14C/F6iBYoZZw3TkzEMD/icNk2WOG5Bo7kLKRcuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 833BBF80089;
	Fri, 28 Feb 2020 16:50:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1A8AF8014E; Fri, 28 Feb 2020 16:50:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A881F80089
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 16:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A881F80089
Received: by mail-ot1-f67.google.com with SMTP id j16so3018867otl.1
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 07:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wojIa6rVa31vXzIE/lHtQ3suG/pesMoWRIYn0QkiXJQ=;
 b=Db/hGPQDt4c0iRjFa4VJevgBL0AyOAkPQ6+VFNwg7jwDREcXsewGpFqVwZG6doV5Lw
 VG5eM6QDw9/0pM8F4zWoCz90g0Xlu+v8A1Jlu5GXoxU+NZlKq6gQm2y6Dk6sC9sgh2Ag
 0Ii0Mo3OoAdF3V2UATN9BNadNi3QjSM0g/S6o4rEo6knl/YPAcSzuVob3xA85PdClak9
 dcdGevWVbJBCqvwg3YoYFMUa4g8OdKTh6okToH31NrgsaOsM9fx5ZwCi+MtuGTMSO99v
 WNvHKGh7Z10Vm9/loOOTLjBjW3Ix94f5rCoDkp70fOK41vbhrYS192sjHA92PuGTqFFA
 ejvw==
X-Gm-Message-State: APjAAAXiKon40Bl4Sul7AU4ZoHpBDVz5EobEyrb1T/Ic14OTSotDc4Bu
 ImhDDrgMZ9FbJeKNhFVcXQ==
X-Google-Smtp-Source: APXvYqwt/R/pC1bGU/7oJf7NOrLG0KKZF7zg8vbj/26gV3Nsi5k0hBqYVdC8MOsZ04YH1PU4R0ebjw==
X-Received: by 2002:a9d:d06:: with SMTP id 6mr3954158oti.176.1582905019525;
 Fri, 28 Feb 2020 07:50:19 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm3271814ote.32.2020.02.28.07.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:50:18 -0800 (PST)
Received: (nullmailer pid 27282 invoked by uid 1000);
 Fri, 28 Feb 2020 15:50:17 -0000
Date: Fri, 28 Feb 2020 09:50:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/9] ASoC: meson: convert axg tdm interface to schema
Message-ID: <20200228155017.GA24730@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-3-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

On Mon, Feb 24, 2020 at 03:58:14PM +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm interface to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
> deleted file mode 100644
> index cabfb26a5f22..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Amlogic Audio TDM Interfaces
> -
> -Required properties:
> -- compatible: 'amlogic,axg-tdm-iface'
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "sclk" : bit clock.
> -  * "lrclk": sample clock
> -  * "mclk" : master clock
> -	     -> optional if the interface is in clock slave mode.
> -- #sound-dai-cells: must be 0.
> -
> -Example of TDM_A on the A113 SoC:
> -
> -tdmif_a: audio-controller@0 {
> -	compatible = "amlogic,axg-tdm-iface";
> -	#sound-dai-cells = <0>;
> -	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
> -		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> -		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
> -	clock-names = "mclk", "sclk", "lrclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> new file mode 100644
> index 000000000000..5f04f9cf30a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio TDM Interfaces
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller-.*"
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    items:
> +      - const: 'amlogic,axg-tdm-iface'
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - description: Bit clock
> +      - description: Sample clock
> +      - description: Master clock #optional
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - const: sclk
> +      - const: lrclk
> +      - const: mclk
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - clocks
> +  - clock-names

Add an:

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
