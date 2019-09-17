Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5919B4E76
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 14:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263EA166E;
	Tue, 17 Sep 2019 14:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263EA166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568724695;
	bh=of5d7HBl+GUDNrfQqblOikpSRHtFykYn+ZIQIc8H4iE=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLvBoLKzdoF+6qkOTnSl2EydLFQfXX8FE84XUtyV6wLKhBvDTz8HOv8Bsnc+8sFFb
	 fIuzqo4F2CRWEglH4CeYOWPKm094Qp1D4fJ6+7TiueBHly25ShPfa7IK7NtzaUkqDO
	 53Gj6t73XsRcdS1Szq1FWHId+0rD6gnZgSD5CCD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20614F803D6;
	Tue, 17 Sep 2019 14:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72130F80361; Tue, 17 Sep 2019 14:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C764BF801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 14:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C764BF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="EmApee/2"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190917124942euoutp027c0c8e0a2e365ea698a82e284a2e0748~FOrJEPmLT0831808318euoutp02e
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 12:49:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190917124942euoutp027c0c8e0a2e365ea698a82e284a2e0748~FOrJEPmLT0831808318euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568724582;
 bh=NfVVI3xJYBq/jjenL0ou7bm2nFkLHH0Jtu3uUHH24yg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=EmApee/2kazNf3wRukQGnJNg0NKGuzSCfqI8/z2uVuv2mId8136bdJYiiLZZVHjo1
 JDlYmGCI0QuA9tKuJanDVS8u/ewcHUBQXbCeqS5bvSzEwgt7045g+QjxFWCRxoExXL
 mgA/+Xwv/B7CJgDxz/F0EkEBn+8z7qfTHryyuUVQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190917124942eucas1p151a036391a8af376a7aaee6e92521a3c~FOrInwU002868128681eucas1p1p;
 Tue, 17 Sep 2019 12:49:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7B.4F.04374.566D08D5; Tue, 17
 Sep 2019 13:49:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190917124941eucas1p1d9aea1195afbc4e16646b72f911eda0c~FOrHxQjU_2867728677eucas1p13;
 Tue, 17 Sep 2019 12:49:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190917124940eusmtrp2a5e847be2a082419bc73dc24d0482d7b~FOrHjDa5T3002230022eusmtrp2Q;
 Tue, 17 Sep 2019 12:49:40 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-67-5d80d6650f08
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7B.5A.04166.466D08D5; Tue, 17
 Sep 2019 13:49:40 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190917124940eusmtip17ff79b4afe0c6abb7be257bb7536597e~FOrG7rxQa1459914599eusmtip1I;
 Tue, 17 Sep 2019 12:49:40 +0000 (GMT)
To: Maciej Falkowski <m.falkowski@samsung.com>, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1c1264ac-f657-1e3d-360f-af0cbc58549a@samsung.com>
Date: Tue, 17 Sep 2019 14:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917120452.28135-1-m.falkowski@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHfe7u7r2Kq+vUPJgpjN601KygG5UkWQwy8ENBGCNven2pbcpu
 mi+EQzFsmslAzRU5P1RrODORXgyFpjnLao3svcxSK5UV6JZUlm27SX77/c/5n+d/DjyUSGoX
 h1O56uOcRs0qZUQAfqP/x+NY7rlWsWHwZzzzuu2xmBlyWDGm/sMYwTT3eaTd3k4y34eqMOZp
 1wWCOWfvwZiRijaCsfS9I5lLLxwYU9ndRzIOkwvbKZG3z5QT8taLrUh+2/COlHeYTxPy2k4z
 ks90RKYSaQHbMzllbiGniU9MD8gx1p8l8psiimZfOQgtagrVIX8K6M0w/eA87mUpbUKgrwzT
 oQAPuxAMt3zHBTGDoF/3RLww8eV3g1hoXEFgdz4kBOFE0PDHK/ypYFoBn6sv+d4NoVNgcLgH
 eU0iugaD5utWn4mgE+DMvVrkZQmdCLqv13wDOL0K3lu+kl4OpQ/C9EivWPAEwf2mMZ/Hn94B
 z6bcmJdFdBiUu66KBY6Cm84LIm8Y0BMkGB3PkbB3MjxpH8AFDoZJWycpcATM327GhIEKBDV3
 3pCCqEPw3mb8N70Nem0OTwTliYiGa13xQjkJLn+ZxbxloJfAS2eQsMQS0N9oFAllCVSdkgru
 lfDL3IgJHA7VY/N4HZIZFp1mWHSOYdE5hv+5RoSbURhXwKuyOX6TmjsRx7MqvkCdHZeRp+pA
 nm82+MfmvoV65o5YEU0hWaAEHmkVUjFbyBerrAgokSxEknqyTCGVZLLFJZwm77CmQMnxVrSc
 wmVhklK/kUNSOps9zh3juHxOs9DFKP9wLXIccMfldmURzxpXri/pj3Wt1atTEoMioWV1Wln0
 xnVp0kLiw9BHMs/063Lg6OqyNRn9Kcnj+7b2mSaidpVPFo2a3ZKSLcvwo7Fvlt3VfsqKuZLe
 PbFi76iFDfmp36P4Fsq/9bPYrKWtS3Wtu1NqzHWBxPmY/OCBiPG5/crdU0VJMpzPYRNiRBqe
 /QsjvHvHYgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xu7op1xpiDS7eMrG4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0u
 rvjC5MDrseFzE5vHmnlrGD12zrrL7rFpVSebR9+WVYwenzfJBbBF6dkU5ZeWpCpk5BeX2CpF
 G1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GUsmNrPVjBTpuL7zYtsDYwzRbsY
 OTkkBEwkXvydxgpiCwksZZRof8vWxcgBFJeSmN+iBFEiLPHnWhdQmAuo5DWjxMWrn9lAEsIC
 sRKNp/6A2SICPhKn7+1jBCliFuhhklje0gPVcZhR4uz/JWBVbAKGEr1H+xhBbF4BO4mud+tZ
 QGwWAVWJ+2vfsYPYogIREod3zIKqEZQ4OfMJWA2ngK3E1ddfmUBsZgF1iT/zLjFD2OISTV9W
 skLY8hLb385hnsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZG
 YOxuO/Zz8w7GSxuDDzEKcDAq8fAeONUQK8SaWFZcmXuIUYKDWUmEN6C2PlaINyWxsiq1KD++
 qDQntfgQoynQcxOZpUST84FpJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoR
 TB8TB6dUA2OfdGqXgsJZ0wQJY4XE2pOCnz+fYc24rn3qVaGXpvhBM8uc5f+jZx+ozp+wfknI
 lC27ChRKTrc5vXp8/ctszeabLif+PhfPjJN0ZBda6vkrt9J4/oQ9h1kn1h7dZX1QKoW5LU+r
 YS/vm964vvX/99lbr4hJtK82Mbxkvspo0fnGZ1celIv+d1diKc5INNRiLipOBADfug8+8wIA
 AA==
X-CMS-MailID: 20190917124941eucas1p1d9aea1195afbc4e16646b72f911eda0c
X-Msg-Generator: CA
X-RootMTR: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
References: <20190917111413.22711-1-m.falkowski@samsung.com>
 <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
 <20190917120452.28135-1-m.falkowski@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 a.hajda@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org,
 robh+dt@kernel.org, broonie@kernel.org, m.szyprowski@samsung.com
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

On 9/17/19 14:04, Maciej Falkowski wrote:
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -* Samsung I2S controller

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

> -Example:
> -
> -i2s0: i2s@3830000 {

> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_SCLK_I2S>;

> -};
> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> new file mode 100644
> index 000000000000..59dc76035cb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---

> +properties:

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

My impression is that there is a significant information loss in conversion
of: clocks, clock-names properties.  Can't we describe the meaning of 
CLK_I2S_CDCLK, CLK_I2S_RCLK_PSR, CLK_I2S_RCLK_SRC supplier clocks similarly 
as it was in txt version?

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

It should not be <&clock_audss 0> for each clock, each clock has different
index as indicated by the commented out macro definitions.
		
> +        clock-names = "iis", "i2s_opclk0", "i2s_opclk1";

-- 
Thanks,
Sylwester
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
