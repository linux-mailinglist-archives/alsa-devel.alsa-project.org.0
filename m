Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB54B4EC3
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 15:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA76166E;
	Tue, 17 Sep 2019 15:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA76166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568725673;
	bh=UvNHKzaG4/34gb1/yFguMVDzciLWv1JNubwmD2+PnfI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EonzDL/1l9shl5kNWc6NZwxXNSWbTuf89X7Iv6O6+ESohLa7pnDyuQ7zaKuO6Nlj0
	 II/aAeczx9Msw0qxIF6UGQgPCg1LA0dhvbsjFVrwVp6ArsZeY/Tac6yA7Z5FP6AZ6J
	 ejmtWQENpdtwFCFHJe+6JwCpKIMCimpqhGsJRMPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7C6F80361;
	Tue, 17 Sep 2019 15:06:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 801E0F80361; Tue, 17 Sep 2019 15:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4AE5F801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 15:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4AE5F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y0AjA5Ai"
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B43C2218AE
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568725551;
 bh=6dx+pGYbMKZYGufowQPf+5IJvdiHtWxdf/mNfFBW+XI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y0AjA5Ai77LxzbSqLfZnFwbvFq6nGMeUSrnIqextmcWyJY8IFhnKTk4DKegpGcAPF
 51sMV/v90zXf9r53PWp/Vk/jglOBRJq8FJ6r9zkFw22al9veV1fET0kW6MLWU4jjHN
 FDBB7NtqwpDA0Pikh9YORVSDrIiqi1HFHDB5FgXw=
Received: by mail-qk1-f176.google.com with SMTP id f16so3850870qkl.9
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 06:05:51 -0700 (PDT)
X-Gm-Message-State: APjAAAUbnpJeNlMo0G/SjSU4RxprH/a+1lgEkpIpE24EtIuUC853288Y
 E5Vz93lv1APiqbtDZ7EsMI2F1iDwciUZFE11XQ==
X-Google-Smtp-Source: APXvYqz2HPAde8iLviBNps8veZshe4FIhl9v/4PCg3wURvc7VWi1W+/WDS08X9I33YRoPGdWrfn+3FvonmV20YnIfeo=
X-Received: by 2002:a37:be87:: with SMTP id o129mr3695035qkf.254.1568725550865; 
 Tue, 17 Sep 2019 06:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com>
 <20190917120452.28135-1-m.falkowski@samsung.com>
In-Reply-To: <20190917120452.28135-1-m.falkowski@samsung.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 17 Sep 2019 08:05:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmjUR63i_hKUuZwDu42rebwABHu62bQoxTRRJu5yObEA@mail.gmail.com>
Message-ID: <CAL_JsqJmjUR63i_hKUuZwDu42rebwABHu62bQoxTRRJu5yObEA@mail.gmail.com>
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] dt-bindings: sound: Convert Samsung
 I2S controller to dt-schema
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

On Tue, Sep 17, 2019 at 7:05 AM Maciej Falkowski
<m.falkowski@samsung.com> wrote:
>
> Convert Samsung I2S controller to newer dt-schema format.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added missing Signed-off-by certificate
> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -------------
>  .../bindings/sound/samsung-i2s.yaml           | 119 ++++++++++++++++++
>  2 files changed, 119 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> new file mode 100644
> index 000000000000..59dc76035cb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> @@ -0,0 +1,119 @@
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
> +  - Sangbeom Kim <sbkim73@samsung.com>
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
> +
> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
> +      with only external dma and more no.of root clk sampling frequencies.
> +
> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
> +      slightly modified bit offsets.
> +    enum:
> +      - "samsung,s3c6410-i2s"
> +      - "samsung,s5pv210-i2s"
> +      - "samsung,exynos5420-i2s"
> +      - "samsung,exynos7-i2s"
> +      - "samsung,exynos7-i2s1"

No need for quotes here.

> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    description: list of DMA controller phandle and DMA request line ordered pairs.

How many?

> +
> +  dma-names:
> +    description: |
> +      identifier string for each DMA request line in the dmas property.
> +      These strings correspond 1:1 with the ordered pairs in dmas.
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
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
> +    i2s0: i2s@3830000 {
> +        compatible = "samsung,s5pv210-i2s";
> +        reg = <0x03830000 0x100>;
> +        dmas = <&pdma0 10
> +                &pdma0 9
> +                &pdma0 8>;
> +        dma-names = "tx", "rx", "tx-sec";
> +        clocks = <&clock_audss 0>, // EXYNOS_I2S_BUS
> +                <&clock_audss 0>, // EXYNOS_I2S_BUS
> +                <&clock_audss 0>; // EXYNOS_SCLK_I2S
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
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
