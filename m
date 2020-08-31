Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845752579BD
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 14:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 043B617A7;
	Mon, 31 Aug 2020 14:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 043B617A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598878339;
	bh=WMmWVnzz/PHOwzofujH0H062B/3U4qoOPyM2RrpZowA=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQXhv7dZhcP0+p1d5JbSUCs8rzwSFfVT+NWJWKfgu6cRKkiBwOkFVCQ2jdHDFxmhB
	 BjDYZ2b5jnY4kP6xCEPa1/5BGUgMHHdPpm3b9DGU6MTPY/qO83+oxysw5vNS3prvUA
	 GPYoe9BMa6jKU7tGgTxkIfv7Q7VWdqPxFo833zaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C57F80146;
	Mon, 31 Aug 2020 14:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1735BF80212; Mon, 31 Aug 2020 14:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B61AF80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 14:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B61AF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="dSJu+R31"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200831125027euoutp01657229a064b4df4bc17d153949834035~wW0bM1_Bk1481114811euoutp01D
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 12:50:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200831125027euoutp01657229a064b4df4bc17d153949834035~wW0bM1_Bk1481114811euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598878227;
 bh=ir04O1LBgiamn4Vazqxm9bW0gx2zBzPUQkXJ9yzi9dk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=dSJu+R310gcbph1FFnNuIIQoAlaWq825Kf/lKv1z5qvRwpuaDqRhuFM3gLWsml6Fq
 PyrwJcGYwbslYqEAQ30a3EY7ojhX8/9BkF9iHgZs7ZojuXeD78QupjYNo/U3LqoBug
 5KYxGAsgREQtlQdCQe1MDELoHqXlHmx8Vcm+Ncfk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831125026eucas1p28c5c8eb5d04c54f1c0f399a07ad6ba24~wW0axwOZj1885018850eucas1p2J;
 Mon, 31 Aug 2020 12:50:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D2.54.06456.212FC4F5; Mon, 31
 Aug 2020 13:50:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200831125026eucas1p1c96e5c04f89ecbd3888b5b3701edb1a3~wW0aOoNzs1393813938eucas1p1u;
 Mon, 31 Aug 2020 12:50:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200831125026eusmtrp1da72ff1101fc009870a8ff16cce3bb1e~wW0aNrDNm1767617676eusmtrp1H;
 Mon, 31 Aug 2020 12:50:26 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-6e-5f4cf2124571
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.74.06017.212FC4F5; Mon, 31
 Aug 2020 13:50:26 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200831125025eusmtip16c96ef0a69b98a69a6fd7c9dccd44027~wW0ZIM22t0528205282eusmtip13;
 Mon, 31 Aug 2020 12:50:25 +0000 (GMT)
Subject: Re: [RFT 09/10] arm64: dts: exynos: Correct port of USB-C connector
 node on Exynos5433 TM2
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4eb7d0d9-29e2-9162-4521-10e4422f9c71@samsung.com>
Date: Mon, 31 Aug 2020 14:50:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200829142501.31478-9-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+c5da3Wcxd7sBoOKgjQp4SMjKiIOFdIfQTfSZh40nBqbs+yf
 pOs6XWaZqUtsSaANcmualVnS1IZOpzmxKM28RGiZ4aZdrZzHyv+e5/1+D8/7wseRygImjDuU
 mi7qUjVaNRNMVT775lmpHNket+pmWwR+Veah8UVPA4HbnzsJfDffRuPcnn4Gv/C/p3GRbyH+
 XXmZxDfqJrD20WEGX+nOprCp7wOJW1rsLO4erUd4rN1IYEdfB429VYUMzm95QuDTj+tYXPvx
 LI2fl/oJfPbdAInLHbnkBpVg951ghMdjFkp4aO5iBYf1HCN0dlQzwiePhxXuj72lhe7zLkIo
 v3VcuFRhRYLPsWjHjL3B6xJE7aEMURex/kBw0nWXnTl8b/bRUfvaLNQ8Q0JBHPBroNzrQxIK
 5pR8KYLB+vesbPwIfhZ3kLLxIfCcriD+Rkq8WVNUCYISZ82UGUaQV3OTDVChvAil0u3J+Bze
 SMPVaisdMCTvRSDVZNMBiuEjQRqSmIBW8OvhtVEiA5ril0DWuWoqoOfysfCssZeSmRBoKOif
 1EF8FOQN9E7yJL8Y7g8VTmkVvOq/QQTKgG/loMuSw8qLbwZr4yAj61AYdFVMzReAO+cCJQdO
 Iujx3GFlcwGB90Q+kqlo6PR8n0hzExXLwVYVIY83wrj/BxsYAz8LXg6FyEvMgiuVeaQ8VoDx
 jFKml4LZVfav9mlrG5mN1OZpp5mnnWOedo75f68FUVakEg36lERRH5kqHgnXa1L0htTE8INp
 KQ408WHdv1wjD9BoW7wT8RxSz1R8rd8Wp6Q1GfrMFCcCjlTPUWxqdscqFQmazGOiLi1OZ9CK
 eieaz1FqlWJ18cB+JZ+oSReTRfGwqPv7SnBBYVnIGB237vOqg8mKnobB+L42/wK7ocvYZEuz
 RheJZNDxKGSyjJtCdmmGc+1hYaXFlx7datxSkVxUGGqTvlyL2fcGLdd2bmTWhNe2qtK2LrMu
 Vpm8MR8WXZfm7TZcHDHV2RJ31ifoZjfu1e04tSkns6nYa3Zzlu7xMW1Eb/rOTPceNaVP0kSu
 IHV6zR8dJKe4rAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe+7brtPVbVo+SKWN/JDZbL4+ms3o00UrAulLaWvlxUVuk93N
 soxGEeqamdGLrWX2Ir6F2WZaUZFLW2bORF2RhaVGrdKgqRRE5ZyB3/7n/P+/czhwaFzcSIbR
 +zR6TqdR5kkoIdH9x/lurfjHZsW6E9cZ9KbJRaIyVxeGBvocGLpdeYtE5z6MUejV5CcSVXmX
 o7+tFTi60jETG5j6TqEzw6cJVD76FUe9vc0CNDzVCdD0QAmGbKNuEvXft1KosvcRhk487BCg
 J9+KSdRXN4mh4o8eHNlt5/CNoWyz9xjFPpyuJth7lncC1tZQSrFv3Q8odsLlErBt0+9Jdvik
 E2PtN46yp1oaAOu1rdgWuEOaqtMa9FyESsvrN0h2ylCsVJaMpLHxyVJZXFJ2SmyCJEaemsPl
 7SvgdDHy3VLVJWczlX9n0cGp5hQj6Ak0gQAaMvGwtt8oMAEhLWZqADS9dBF+YxnsOm8k/ToY
 /nabKH9oHMDaimvAZwQzHKwz1eM+I4Qxk/B4jXm2wJlBAIfumAk/YgdwoKsU8yEUI4Omcd+s
 AFrEyOFQiQn3aYKJhMbSB7O7lzC74Avz57nMYth1cWy2H8AkwAuekdk8ziTCKvuHOR0O28at
 czoUvhm7gp0GYss83DIPscxDLPOQakA0gBDOwKtz1XyslFeqeYMmV7pXq7aBmUdpffqr5S4w
 TWQ6AEMDSZDoZ2eGQkwqC/hCtQNAGpeEiDb1dO8Si3KUhYc4nVahM+RxvAMkzBxXgYct2aud
 eTuNXiFLkCWhZFlSXFJcIpKEikqY9iwxk6vUc/s5Lp/T/ecwOiDMCAbTtpZdGxHony9c1RYR
 +jg6vKV8vajeuUWcfkCksnv2FB0xEkJvZOPZ7HhnRaXwiyq6J7da83cyw1Ik51+vDOq8OVm5
 oIakq5x2Y7tmqdSemeZuym63Fuzx0KsnrELHmue9xIgyKutZVth2B/IQhzPH09MOYgeGGiyX
 r0ZyEoJXKWVRuI5X/gO0LJ3zPgMAAA==
X-CMS-MailID: 20200831125026eucas1p1c96e5c04f89ecbd3888b5b3701edb1a3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3@eucas1p1.samsung.com>
 <20200829142501.31478-9-krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Inki Dae <inki.dae@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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

Hi Krzysztof,

On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
> The USB-C connector bindings require port@0.  Such port was already
> described in DTS but outside of the connector itself.  Put it into
> proper place to fix dtbs_check warnings like:
>
>    arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: musb_connector: ports: 'port@0' is a required property
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I'm not sure if topic should be about USB-C, I will call it simply USB 
connector node. TM2(e) uses Samsung's 11-pin micro USB 2.0 connector, 
which has nothing in common with USB Type-C.

Anyway, this patch breaks DWC3 (tested in Device mode) driver operation, 
so something has to be somehow adjusted or fixed. Added CC Andrzej 
Hajda, who actually worked on this.

> ---
>
> Not tested on HQ. Please kindly review and test.
>
> Best regards,
> Krzysztof
> ---
>   .../boot/dts/exynos/exynos5433-tm2-common.dtsi    | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 6246cce2a15e..bab6c1addd5f 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -871,6 +871,13 @@
>   					#address-cells = <1>;
>   					#size-cells = <0>;
>   
> +					port@0 {
> +						reg = <0>;
> +						muic_to_usb: endpoint {
> +							remote-endpoint = <&usb_to_muic>;
> +						};
> +					};
> +
>   					port@3 {
>   						reg = <3>;
>   						musb_con_to_mhl: endpoint {
> @@ -879,14 +886,6 @@
>   					};
>   				};
>   			};
> -
> -			ports {
> -				port {
> -					muic_to_usb: endpoint {
> -						remote-endpoint = <&usb_to_muic>;
> -					};
> -				};
> -			};
>   		};
>   
>   		regulators {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

