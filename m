Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBE66D814
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 09:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F7B645D;
	Tue, 17 Jan 2023 09:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F7B645D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673943818;
	bh=M6QqNmQr1ttNtEQTe1x45vNeEDn6LZfNX04lhju9E+4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tWtFhNvSgEpdNLfHIiq0Jl+cdbB7rq2jfyH4fS/Wh8YfPTL768pkOrUjX3o4ExwKA
	 ajZbhDp6YVyM+Olhs45braHl1JTjWKiuMpLoP+xGpLmRAZvGJlHyixv3TrEtD0hsRz
	 bi801nxObok2LZtpKuqQMgWMJizl/0hmEmuUUEqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2F9F80557;
	Tue, 17 Jan 2023 09:22:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDDFF80506; Tue, 17 Jan 2023 09:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D860F80506
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D860F80506
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=RWdP6v5N
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230117082206epoutp01055c0d6d997784cd56851d8a33047b9a~7CvNIl0G-2414324143epoutp01j
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 08:22:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230117082206epoutp01055c0d6d997784cd56851d8a33047b9a~7CvNIl0G-2414324143epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673943726;
 bh=gBTlZ0SH47cCII3STzXofatJhpEtyMp6kArod4rPj64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RWdP6v5NVgiikX9HN9HuKOrLVlFLIXRbzJJu3bRo/yIcm4bk7LBvxNSJTu57M6atZ
 gIESCoP63IvxTUeabqy82BoGHe+2ZiMcyFBnIEcf/kMYYn+3RwYhBjLgAMKZzfUXaW
 BYFO7dV/BLMbmjTFTKerFQGs9b4/er6e+rYBbG7M=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230117082205epcas5p312e177518ee6e3414d4b985165d48397~7CvMnUgLP1340713407epcas5p35;
 Tue, 17 Jan 2023 08:22:05 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Nx21S1dH0z4x9Px; Tue, 17 Jan
 2023 08:22:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 46.FF.03362.CAA56C36; Tue, 17 Jan 2023 17:22:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230116103903epcas5p2c3e87c1df31b6a53e26fb1358a53f634~6w9fhXpLz2382723827epcas5p2m;
 Mon, 16 Jan 2023 10:39:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230116103903epsmtrp248a77e566c27fdd604f5094949acd2c2~6w9fganbF0521705217epsmtrp2R;
 Mon, 16 Jan 2023 10:39:03 +0000 (GMT)
X-AuditID: b6c32a4b-4e5fa70000010d22-89-63c65aacde29
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F8.F8.10542.74925C36; Mon, 16 Jan 2023 19:39:03 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230116103900epsmtip18033c52c734ecde4afecdffb4f27687a~6w9dIwjMw0462804628epsmtip1A;
 Mon, 16 Jan 2023 10:39:00 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v4 3/5] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Date: Mon, 16 Jan 2023 16:08:21 +0530
Message-Id: <20230116103823.90757-4-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230116103823.90757-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmuu6aqGPJBo++cFk8mLeNzeLKxUNM
 Foc2b2W3mPrwCZvF/CPnWC36Xjxktvh2pYPJ4vKuOWwWM87vY7I4ujHYYtHWL+wWnbv6WS1m
 XdjBatG69wi7xeE37awWG76vZXQQ8NjwuYnNY+esu+wem1Z1snncubaHzWPf22VsHn1bVjF6
 rN9ylcXj8ya5AI6obJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUX
 nwBdt8wcoA+UFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnFpXnpenmp
 JVaGBgZGpkCFCdkZM5buZS64IVmx//dM9gbG3yJdjJwcEgImEv9mzWTtYuTiEBLYzShx4N1d
 KOcTo8TNxRfYIJzPjBLXzt1ngmk5dnYdI0RiF6NE+9pTUE4rk8TmyZ/ZQKrYBEwlVs1pBJsl
 ItDEJNH2ZiILiMMssJFR4vSxh2CzhAXcJc6cawWzWQRUJdYuvcUOYvMK2Eg8mruMBWKfvMTq
 DQeYQWxOAVuJr3tvMIMMkhBYyCHxsqkTqshF4nDfPWYIW1ji1fEt7BC2lMTnd3vZIOx8iWkf
 m6HsCom2jxugHrKXOHBlDtAcDqDrNCXW79KHCMtKTD21DqyEWYBPovf3E6hyXokd82BsVYn1
 yzcxQtjSEvuu74WyPSTe3FoODZYJjBK3T69im8AoNwthxQJGxlWMkqkFxbnpqcWmBcZ5qeXw
 iEvOz93ECE6oWt47GB89+KB3iJGJg/EQowQHs5IIr9+uw8lCvCmJlVWpRfnxRaU5qcWHGE2B
 ATiRWUo0OR+Y0vNK4g1NLA1MzMzMTCyNzQyVxHlTt85PFhJITyxJzU5NLUgtgulj4uCUamAy
 NHr8+9+/cJ/4wIuPkv8q3aq0sZsmseaDf9yRvRLNnhNKZ7p63CuYJBsvP8lq3/4zxjsZHtiJ
 bjzLIpUXpcq25/sXc+OQSq2fGm//TslM62G++lS/7pbnyjxGL0erutDv2/lXhW4peb5bUvK5
 WnNlN0d5yd3Lwodu7O77eORjY3OX89nwu1Kx2e2bbk24KiK1pkbwwAS5m7HyqToex38Vt0s8
 P/6f8+EcmV1ME3u5uU1N/q+85Zk34f8RV/3So/NmbGlXqJL8MPPYjeZzycb++6ez7WcTnMfx
 Q9SqVvLJ/E1aH3Z8ZJ5/YnNN2FYNfblubW/jFxwsKxIqn3csebs98dukoucPHF+5rkqzCjFS
 YinOSDTUYi4qTgQAgwRbrTEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSnK675tFkg60LxSwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8aMpXuZC25IVuz/PZO9gfG3SBcjJ4eEgInEsbPr
 GLsYuTiEBHYwSqy+c4gZIiEtMb1/DxuELSyx8t9zdoiiZiaJg8tvM4Ek2ARMJVbNaWQFSYgI
 TGCSOPnuGAtIgllgK6PE1M9GILawgLvEmXOtYA0sAqoSa5feYgexeQVsJB7NXcYCsUFeYvWG
 A2CbOQVsJb7uvQFmCwHVPJlwnnECI98CRoZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5
 mxjB4a6ltYNxz6oPeocYmTgYDzFKcDArifD67TqcLMSbklhZlVqUH19UmpNafIhRmoNFSZz3
 QtfJeCGB9MSS1OzU1ILUIpgsEwenVANT1/K1SpFGl8uTw05KdflEW6jP5e74+yhl270pD7/v
 z/uf3lVu1dPe9lf0Tw2rwz519XMn5Sssd0ekqu0r3Z9/+3if+Ae9TT8sHfanTJ0tFfD89yOG
 8OP75/dPqfj40OHf54pcicn7mr807+2cuPt207Tg3RtCbE+u2flJJPGmo11rNKudgF7cpqwt
 flHOTWv28m0IzX2Sser29LV39zxKTrr/x/XiVP8G9chFbL5moRfk6vecSzHcOVVi+8eos2X8
 qbwf1JWuNkq1z39QVbHkZ8zbuNMMYnvWdzyr91J1/VdsvnBalfF9znOzF66QfvpGgE1T8LP9
 9ahvnyo/V567WBQyWd7H9VTKnrwoHYeVSizFGYmGWsxFxYkANM5qkuYCAAA=
X-CMS-MailID: 20230116103903epcas5p2c3e87c1df31b6a53e26fb1358a53f634
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230116103903epcas5p2c3e87c1df31b6a53e26fb1358a53f634
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103903epcas5p2c3e87c1df31b6a53e26fb1358a53f634@epcas5p2.samsung.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla
FSD platform.

FSD SoC has 2 I2S instances driving stereo channel I2S audio playback
and capture with external DMA support.

Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts      |  8 +++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 14 +++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 34 ++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index af3862e9fe3b..7650c20f02b4 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -34,6 +34,14 @@
 	clock-frequency = <24000000>;
 };
 
+&i2s_0 {
+	status = "okay";
+};
+
+&i2s_1 {
+	status = "okay";
+};
+
 &m_can0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
index 73cb388d6ac1..3cc15b48cb15 100644
--- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
@@ -367,6 +367,20 @@
 		samsung,pin-pud = <FSD_PIN_PULL_UP>;
 		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
 	};
+
+	i2s0_bus: i2s0-bus-pins {
+		samsung,pins = "gpd1-0", "gpd1-1", "gpd1-2", "gpd1-3", "gpd1-4";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	i2s1_bus: i2s1-bus-pins {
+		samsung,pins = "gpd2-0", "gpd2-1", "gpd2-2", "gpd2-3", "gpd2-4";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_DOWN>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
 };
 
 &pinctrl_pmu {
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 0b68d244f2fb..1c53c68efd53 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -760,6 +760,40 @@
 			status = "disabled";
 		};
 
+		i2s_0: i2s@140e0000 {
+			compatible = "tesla,fsd-i2s";
+			reg = <0x0 0x140e0000 0x0 0x100>;
+			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 14>, <&pdma1 13>, <&pdma1 12>;
+			dma-names = "tx", "rx", "tx-sec";
+			#clock-cells = <1>;
+			clocks = <&clock_peric PERIC_PCLK_TDM0>,
+				 <&clock_peric PERIC_HCLK_TDM0>,
+				 <&clock_peric PERIC_HCLK_TDM0>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s0_bus>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		i2s_1: i2s@140f0000 {
+			compatible = "tesla,fsd-i2s";
+			reg = <0x0 0x140f0000 0x0 0x100>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&pdma1 17>, <&pdma1 16>, <&pdma1 15>;
+			dma-names = "tx", "rx", "tx-sec";
+			#clock-cells = <1>;
+			clocks = <&clock_peric PERIC_PCLK_TDM1>,
+				 <&clock_peric PERIC_HCLK_TDM1>,
+				 <&clock_peric PERIC_HCLK_TDM1>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2s1_bus>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pinctrl_pmu: pinctrl@114f0000 {
 			compatible = "tesla,fsd-pinctrl";
 			reg = <0x0 0x114f0000 0x0 0x1000>;
-- 
2.17.1

