Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC1B8FC4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 14:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3028C1671;
	Fri, 20 Sep 2019 14:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3028C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568982491;
	bh=iUClIqi7i5oeJYekGVJG7E9Tog6Os/jmdlDhEmvexJ8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IXDw30K7ayPDzytJA4VLf1W3WgToG/RjD+YiWyeurV5AmXUI4xB4EC8EXit9ER5KS
	 ltSfMcWqSUq26T4hJQXgTk53q9g2nEUaxBnZfTPqnZsNpK51lg3Nw4Jx6NDDG1CTcg
	 Q7/eARHfqmIfs7evm/71jFCjF7XeO6nHbpuoeNUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1FF4F80527;
	Fri, 20 Sep 2019 14:26:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64610F80506; Fri, 20 Sep 2019 14:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C22A5F80146
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 14:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C22A5F80146
Received: by mail-wr1-f65.google.com with SMTP id o18so6532831wrv.13
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 05:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oxsV3AdP/y2Htp+QsY9w7k6IERAd2e9boT0EFnz+XOQ=;
 b=Jbv5Qy3EJslLgByLYrfc7sw1Hr7wyEL8Yv4y0aOvv3LX6QKoCpp3p+oVplwRZ4kd01
 +XSF13Vn4bLCzwSBnE9SMB/+tHOJ3KipHSexmkmZLJT3VNWMT1a+IXsXBRGRS6XcNNCl
 K2z4CsQccpHHyyck1s3S/nyuVUCIUfW1j3xpXL4kR363QPZ06rgtTUsIM8xSsX2l2WaR
 HhZPdOmcUbJa/uETxopbhrDdlC81xR8CR3RTJMeLPimQpxWmsHkDDKSC2GHSsL+i/jEr
 Jy3KaX14UnSwrbosPQkaGesJz81iuQrdlL5ZKkLtrRvKr1hjRy4ZhnrDDxRhR/SUbP+O
 ppiA==
X-Gm-Message-State: APjAAAVLEZmPoYO5QVr1C6leNFNqq0Scc+VBG5c2TTWaBHgDWiBzSL2J
 fgGFo1Tgix/79uHs4yty20I=
X-Google-Smtp-Source: APXvYqwqAkPk97BzFIVayIAxVuquN/6ZNN4Dg0COLCB0d0ww4Rdgj0Q7BIBW7KyHCEfARato9A8JyA==
X-Received: by 2002:adf:e5c3:: with SMTP id a3mr11446642wrn.217.1568982380611; 
 Fri, 20 Sep 2019 05:26:20 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id g11sm2020462wmh.45.2019.09.20.05.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 05:26:19 -0700 (PDT)
Date: Fri, 20 Sep 2019 14:26:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190920122616.GA26862@pi3>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
 <20190920113540.30687-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920113540.30687-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Sep 20, 2019 at 01:35:40PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - Removed quotation marks from strings in compatible property
> - Added min/max items to dmas property
> - Removed unneeded description from dma-names property
> - Added specific dma-names
> - Added clock description
> - Added include directive to examples to use clock macros directly

Guys, please stop attaching new versions of entire patchset to existing
discussions with in-reply-to. Entire V2 was attached to V1. V3 is
attached here. On some mail clients (GMail) this does not mark entire
thread unread at it looks like someone just commented about something.
Some other clients, e.g. mbsynsc with GMail, do not sync entire thread
so new version looks like reply-to but attached to nothing (missing
context). Not mentioning that you need additional effort on your side to
copy+paste the in-reply-to ID.

> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 135 ++++++++++++++++++
>  2 files changed, 135 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> deleted file mode 100644
> index a88cb00fa096..000000000000
> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -* Samsung I2S controller
> -
> -Required SoC Specific Properties:
> -
> -- compatible : should be one of the following.
> -   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> -   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> -     secondary fifo, s/w reset control and internal mux for root clk src.
> -   - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
> -     playback, stereo channel capture, secondary fifo using internal
> -     or external dma, s/w reset control, internal mux for root clk src
> -     and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
> -     is to allow transfer of multiple channel audio data on single data line.
> -   - samsung,exynos7-i2s: with all the available features of exynos5 i2s,
> -     exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
> -     with only external dma and more no.of root clk sampling frequencies.
> -   - samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> -     stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
> -     slightly modified bit offsets.
> -
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- dmas: list of DMA controller phandle and DMA request line ordered pairs.
> -- dma-names: identifier string for each DMA request line in the dmas property.
> -  These strings correspond 1:1 with the ordered pairs in dmas.
> -- clocks: Handle to iis clock and RCLK source clk.
> -- clock-names:
> -  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
> -  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
> -  "i2s_opclk1" as shown in the example below.
> -  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
> -  be "iis" and "i2s_opclk0".
> -  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
> -  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
> -  doesn't have any such mux.

I think you still miss this description of clocks and Sylwester asked for it.

> -- #clock-cells: should be 1, this property must be present if the I2S device
> -  is a clock provider in terms of the common clock bindings, described in
> -  ../clock/clock-bindings.txt.
> -- clock-output-names (deprecated): from the common clock bindings, names of
> -  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
> -  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.

You missed this. If you decide to remove deprecated properties, then
make it in separate patach. You described this patch as pure conversion
so I expect no logical/functional changes.

> -
> -There are following clocks available at the I2S device nodes:
> - CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
> - CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
> -		    IISPSR register),
> - CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
> -		    IISMOD register).
> -
> -Refer to the SoC datasheet for availability of the above clocks.
> -The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
> -in the IIS Multi Audio Interface.
> -
> -Note: Old DTs may not have the #clock-cells property and then not use the I2S
> -node as a clock supplier.
> -
> -Optional SoC Specific Properties:
> -
> -- samsung,idma-addr: Internal DMA register base address of the audio
> -  sub system(used in secondary sound source).
> -- pinctrl-0: Should specify pin control groups used for this controller.
> -- pinctrl-names: Should contain only one value - "default".
> -- #sound-dai-cells: should be 1.
> -
> -
> -Example:
> -
> -i2s0: i2s@3830000 {
> -	compatible = "samsung,s5pv210-i2s";
> -	reg = <0x03830000 0x100>;
> -	dmas = <&pdma0 10
> -		&pdma0 9
> -		&pdma0 8>;
> -	dma-names = "tx", "rx", "tx-sec";
> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_SCLK_I2S>;
> -	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> -	#clock-cells = <1>;
> -	samsung,idma-addr = <0x03000000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2s0_bus>;
> -	#sound-dai-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> new file mode 100644
> index 000000000000..20ae5da7f798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC I2S controller
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    description: |
> +      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> +
> +      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> +      secondary fifo, s/w reset control and internal mux for root clk src.
> +
> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
> +      playback, stereo channel capture, secondary fifo using internal
> +      or external dma, s/w reset control, internal mux for root clk src
> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
> +      is to allow transfer of multiple channel audio data on single data line.
> +
> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
> +      with only external dma and more no.of root clk sampling frequencies.
> +
> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
> +      slightly modified bit offsets.
> +    enum:
> +      - samsung,s3c6410-i2s
> +      - samsung,s5pv210-i2s
> +      - samsung,exynos5420-i2s
> +      - samsung,exynos7-i2s
> +      - samsung,exynos7-i2s1
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 2
> +    maxItems: 3
> +
> +  dma-names:
> +    oneOf:
> +      - items:
> +          - const: tx
> +          - const: rx
> +      - items:
> +          - const: tx
> +          - const: rx
> +          - const: tx-sec
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +    description: |
> +      There are following clocks available at the I2S device nodes:
> +      CLK_I2S_CDCLK:
> +      the CDCLK (CODECLKO) gate clock.
> +
> +      CLK_I2S_RCLK_PSR:
> +      RCLK prescaler divider clock corresponding to the IISPSR register.
> +
> +      CLK_I2S_RCLK_SRC:
> +      RCLKSRC mux clock corresponding to RCLKSRC bit in IISMOD register.
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: iis
> +      - items:
> +          - const: iis
> +          - const: i2s_opclk0
> +      - items:
> +          - const: iis
> +          - const: i2s_opclk0
> +          - const: i2s_opclk1
> +    description: |
> +      "iis" is the i2s bus clock.
> +      For i2s1 and i2s2 - "iis", "i2s_opclk0"
> +      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  samsung,idma-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Internal DMA register base address of the audio
> +      sub system(used in secondary sound source).
> +
> +  pinctrl-0:
> +    description: Should specify pin control groups used for this controller.
> +
> +  pinctrl-names:
> +    const: default
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/exynos-audss-clk.h>

Does it really work? When I tried, it was failing... If you look up at
resulting DTS example it is wrong.

Best regards,
Krzysztof

> +
> +    i2s0: i2s@3830000 {
> +        compatible = "samsung,s5pv210-i2s";
> +        reg = <0x03830000 0x100>;
> +        dmas = <&pdma0 10>,
> +                <&pdma0 9>,
> +                <&pdma0 8>;
> +        dma-names = "tx", "rx", "tx-sec";
> +        clocks = <&clock_audss EXYNOS_I2S_BUS>,
> +                <&clock_audss EXYNOS_I2S_BUS>,
> +                <&clock_audss EXYNOS_SCLK_I2S>;
> +        clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> +        #clock-cells = <1>;
> +        samsung,idma-addr = <0x03000000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&i2s0_bus>;
> +        #sound-dai-cells = <1>;
> +    };
> +
> -- 
> 2.17.1
> 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
