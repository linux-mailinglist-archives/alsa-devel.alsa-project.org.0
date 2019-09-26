Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B47BF0DC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 13:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733291737;
	Thu, 26 Sep 2019 13:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733291737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569496218;
	bh=fg+TeEXJFff0oHvpL4XQQ9ECCT/eKUsLc3WhSi2nL80=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wdv906no1QSGuTh76+9xZVSCJUT7RZu0D5KwoA63xYkqFOuZpsLUrYGdUgt0FlKqT
	 T3fSLSvMf8uEyh02SipZ+nAxW3DFL2r7f24Iybrr2LxiVV7dG6x68pYc7tLpM6VrZa
	 +sasXTTHrSbcy2f8lVq2cD2hpqRH0BQBQih5RVV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC017F803F4;
	Thu, 26 Sep 2019 13:08:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2652F803F4; Thu, 26 Sep 2019 13:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C60F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 13:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C60F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="s1J462yc"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190926110827euoutp0137045190b359503bac35781c8ef6cc8a~H_GT3rOi61250612506euoutp01i
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 11:08:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190926110827euoutp0137045190b359503bac35781c8ef6cc8a~H_GT3rOi61250612506euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569496107;
 bh=t547sFoMYSh3rF1TJyqouCAdi6aeTm+YjgEN5h8tXSs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=s1J462yctmdFl4NmMXfrhqWWGjOK6jX059vVDGoze3kh3TFlVuVQWbuHxI+UtLDjR
 EQTinOnfB0xs8oR4GKAaBLFtw/PY2hURWPy3129XTELV5ugnSiLByL8N6PaR7GWtBb
 bE70iSSyxxQ2gHDqjUsj0221RKd9BdDTk24pkT24=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190926110827eucas1p244095caa51f742344e53a011d2512ddc~H_GTpJ6Q61806418064eucas1p2q;
 Thu, 26 Sep 2019 11:08:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F6.FA.04469.B2C9C8D5; Thu, 26
 Sep 2019 12:08:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190926110826eucas1p2bd8e9944dee1226d7bf8546426e40692~H_GTNi9-p0436404364eucas1p2V;
 Thu, 26 Sep 2019 11:08:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190926110826eusmtrp159e3a7e876e342621a29906bc74e7a2f~H_GTIBEzc0172501725eusmtrp1E;
 Thu, 26 Sep 2019 11:08:26 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-b7-5d8c9c2bb451
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AF.E1.04117.A2C9C8D5; Thu, 26
 Sep 2019 12:08:26 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190926110826eusmtip2b40f71e4a930d833f910b7d6da772915~H_GSTlzCe2490724907eusmtip2X;
 Thu, 26 Sep 2019 11:08:25 +0000 (GMT)
To: Marek Szyprowski <m.szyprowski@samsung.com>, Maciej Falkowski
 <m.falkowski@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e95b9f26-d667-4ebe-dcfa-264a6053f4ad@samsung.com>
Date: Thu, 26 Sep 2019 13:08:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925132628.31858-1-m.szyprowski@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbyyUcRz3e57nnntcnT2O8h3KujKL8qd68Ww1I724F9VaM6W65coTFsfu
 OYpehCPiMkXJ7VasmtIRl0kUduiqwyFFNWExamFDYlZyHi3vPt/Pn30/3+1L4ZI2gSsVo1Sz
 KqUiVkqKiNpXC507ffRaub/GAkxvtwljbg6PkMzd1k4BY7VWCZm53myMeVevJ5nb1kaMGdJU
 kkxF64CQedDXjTGZL1uFQetkVTPppMxwx4Bkz3UDQpmx/Copy6spR7IZ4+Yj5AnRvkg2NiaJ
 VfkFRoiis+YNeEK7x8Xm3+NEKsqDHGRPAb0HKtqeYjlIREnohwhMDV8JfphFUFowhfhhBkFR
 Yb/wX8SaacJ5oQxBz1whsgkSegJBn/moDTvR5+B1hgmzYWdaDsW3UoW2AE7XYZC1NLUikHQA
 XGvLWwmL6UBYGOsQ2DBBe0LZ/eukDW+gj8P0UIuA9zjCm+IRwobtl/1pi40rjXDaBdJnHwl4
 7AHPJvQr7YD+JIThqqXV2gegoPIbyWMn+G6uWeXdwVKgJfiABoG24bOQH/IRDJpLEO/aCy3m
 7uUV1PKK7fCk3o+ng6G/+B5uo4F2gP4JR76EA9yoLVqlxZB9RcK7t8FieRHGY1fIHVki8pFU
 t+Y03ZpzdGvO0f3fW4KIcuTCJnJxUSwXoGQv+HKKOC5RGeV7Nj7OiJafy/LHPF2HfvacMSGa
 QtL14uawXLlEoEjikuNMCChc6iw+FK6VS8SRiuQUVhV/WpUYy3Im5EYRUhfxJbuhkxI6SqFm
 z7NsAqv6p2KUvWsqwtvGWIO6bwvKT5P4C3pp+X55pldTfVD7R02x1dOn8Zg5OtvbDtuljAlL
 qM5x1wcYw6LQW7uI0F/t6q4d+tKFL9bgjY+HuKXJlN3qrTUvvMYrJstc/LWjw+JwMjTkwynj
 qNJy+H3aJreSprkRZuxHyHxNofxyR1dTdcZgbepBKcFFKwK8cRWn+AsRrwOUWAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7pac3piDX60m1pcuXiIyWLqwyds
 FvOPnGO1OH9+A7vFtysdTBaXd81hs5hxfh+TxYPmdWwWa4/cZbdYev0ik0Xr3iPsDtweGz43
 sXmsmbeG0WPnrLvsHptWdbJ59G1ZxejxeZNcAFuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
 iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkb7jzXMBWfkKw78fcHSwNgn0cXIySEhYCJxvvUQ
 cxcjF4eQwFJGicVzdgM5HEAJKYn5LUoQNcISf651sYHYQgKvGSXOPi0DsYUF0iROtBxiArFF
 BGIlXuyezQIyh1lgB5PEjt3X2CGGTmSUaNt2GKyKTcBQovdoHyOIzStgJ/Hz+VlWEJtFQFVi
 +ZKJYBtEBSIkDu+YBVUjKHFy5hMWEJsTqL7x9z52EJtZQF3iz7xLzBC2uETTl5WsELa8xPa3
 c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYp9uO/dyy
 g7HrXfAhRgEORiUeXonI7lgh1sSy4srcQ4wSHMxKIry+kT2xQrwpiZVVqUX58UWlOanFhxhN
 gZ6byCwlmpwPTCF5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoY
 q8JkZm6LXZCx8vuuRyfn5u068jiqfNM+9oo7d3+am+kesbR89PF7o7wdv7Oy5K67Dve2dbR8
 KvG4dSS1J/Lav8tfjsmdP8JYINPpt7DFe7p+4hZ1C1GTzvjwXU1as5UfSjS+sSvZw1l9JKL+
 9RefVUbzr6/qU62wLF7PGH1L+9phBkMpL9EWJZbijERDLeai4kQAePYsO+kCAAA=
X-CMS-MailID: 20190926110826eucas1p2bd8e9944dee1226d7bf8546426e40692
X-Msg-Generator: CA
X-RootMTR: 20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633
References: <CGME20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633@eucas1p2.samsung.com>
 <20190925132628.31858-1-m.szyprowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH v5] dt-bindings: sound: Convert Samsung I2S
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

On 9/25/19 15:26, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Thanks Maciej, it looks good to me, I just think it might make sense 
to improve the comments a little while we are doing such a conversion.
Please see my comments below.

With those corrections made:
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: https://protect2.fireeye.com/url?k=9b0307ba8b0d1f39.9b028cf5-9870da798974f201&u=http://devicetree.org/schemas/sound/samsung-i2s.yaml#
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

space before "(5.1)" ?

> +      secondary fifo, s/w reset control and internal mux for root clk src.

s/fifo/FIFO ?
s/clk src/clock source ?

> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for

space before "(5.1)" ?

> +      playback, stereo channel capture, secondary fifo using internal

s/fifo/FIFO

> +      or external dma, s/w reset control, internal mux for root clk src

s/dma/DMA ?
s/clk src/clock source ?

> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
> +      is to allow transfer of multiple channel audio data on single data line.
> +
> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.

s/exynos5 i2s/ exynos5 I2S ?

> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo

s/fifo/FIFO ?

> +      with only external dma and more no.of root clk sampling frequencies.

s/dma/DMA ?
s/no.of/number of ?

> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with

s/i2s1/I2S1 ? It would be good to convert all i2s0, i2s1, i2s2 occurrences 
in comments/descriptions into either upper or lower case for consistency.

> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: iis
> +      - items: # for i2s0
> +          - const: iis
> +          - const: i2s_opclk0
> +          - const: i2s_opclk1
> +      - items: # for i2s1 and i2s2
> +          - const: iis
> +          - const: i2s_opclk0
> +    description: |
> +      "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources
> +      of the root clk. i2s0 has internal mux to select the source
> +      of root clk and i2s1 and i2s2 doesn't have any such mux.

> +  clock-output-names:
> +    deprecated: true
> +    oneOf:
> +      - items: # for i2s0
> +          - const: i2s_cdclk0
> +      - items: # for i2s1> +          - const: i2s_cdclk1
> +      - items: # for i2s2
> +          - const: i2s_cdclk2
> +    description: Names of the CDCLK I2S output clocks.

> +  samsung,idma-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Internal DMA register base address of the audio
> +      sub system(used in secondary sound source).

s/sub system(used/subsystem (used ?

-- 
Thanks,
Sylwester
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
