Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84031669812
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 14:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F12BA41E;
	Fri, 13 Jan 2023 14:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F12BA41E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673615330;
	bh=BU0fAoZy/Qm5cq/ZyQbMukn3EYLYqnS8Sc70W/p137U=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MQwaVsI08IsZcBlfWt/bfLf6Kvh/An8nVV7xd5IlWVr6Tm2CSJ56vOjNhGQwI676J
	 JBXeGjfuruXH2yWtbuB+bzyE6T9gCAjPEKZT3BV2PuFXpSEn34r5UzMjBLEaDWCT05
	 WN11o8JPhhzx2zuiCG7N0IU4s6B880OBT5gAMdJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A48F6F80563;
	Fri, 13 Jan 2023 14:06:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B4DBF8055B; Fri, 13 Jan 2023 14:06:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA8BF80553
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 14:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBA8BF80553
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=lcwaSdix
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230113130649epoutp03a1bb6c8d90ad92dac89eddddb38d0660~54CpsdCK83012130121epoutp03y
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:06:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230113130649epoutp03a1bb6c8d90ad92dac89eddddb38d0660~54CpsdCK83012130121epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673615209;
 bh=JnECcqQp5gKNusa22GwjJXHksC+Aak8Uea+HbdnJ/KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcwaSdixj8P1+FKbGhrk/IJAdn8zeW2P/ELRpm6sUjlgwf8mI18kOEhNXOMijqzQQ
 PHy1Lz+9k0RyEMpSaGC17wj15dntkjuSsVoujv0+kz+sLF4/5GJW4z6f7IcA7OPS5I
 unHZeLFVidEmwxh7tr9Q+B5cC6xluJZzEIW/9h3c=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230113130648epcas5p347c7f546dfb5c2484c50897f1493fdf9~54Co4ZVEM2020520205epcas5p3j;
 Fri, 13 Jan 2023 13:06:48 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4NthWp5Vlkz4x9Pv; Fri, 13 Jan
 2023 13:06:46 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BE.94.62806.66751C36; Fri, 13 Jan 2023 22:06:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed~53YZoSCsz1981719817epcas5p3n;
 Fri, 13 Jan 2023 12:18:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230113121825epsmtrp242d30dfc0eca5cd8b8cdc43dd5f36f9e~53YZl_Om21441514415epsmtrp2i;
 Fri, 13 Jan 2023 12:18:25 +0000 (GMT)
X-AuditID: b6c32a4a-ea5fa7000000f556-cb-63c1576622da
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.19.02211.11C41C36; Fri, 13 Jan 2023 21:18:25 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230113121823epsmtip2eda42c4622372827779b42f6a94e3268~53YXc8g9M0851308513epsmtip2n;
 Fri, 13 Jan 2023 12:18:23 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v3 3/5] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
Date: Fri, 13 Jan 2023 17:47:47 +0530
Message-Id: <20230113121749.4657-4-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230113121749.4657-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmlm5a+MFkg53vNCwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AdKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyMrpvr2QtOSFY8unKZuYHxtUgXIyeHhICJxJHHl1i6GLk4hAR2M0p8mbme
 FcL5xCjxvf8YVOYbo8TjzytZYVq+fV3FCGILCexllFjTyARR1Mok8e3iEjaQBJuAqcSqOY1g
 o0QEmpgk2t5MBBvFLLCRUeL0sYdMIFXCAu4Sky/0sIDYLAKqEh1/upm7GDk4eAWsJWY2S0Ns
 k5dYveEAWJhTwEZi6fFckDESAks5JDY/bGWDqHGRWLhlAxOELSzx6vgWdghbSuLzu71QNfkS
 0z42Q9kVEm0fYertJQ5cmcMCMp9ZQFNi/S59iLCsxNRT68BKmAX4JHp/P4Eq55XYMQ/GVpVY
 v3wTI4QtLbHv+l4o20Pic8ceNkig9DNKPN/1g3ECo9wshBULGBlXMUqmFhTnpqcWmxYY5aWW
 w2MtOT93EyM4lWp57WB8+OCD3iFGJg7GQ4wSHMxKIrx7ju5PFuJNSaysSi3Kjy8qzUktPsRo
 Cgy+icxSosn5wGSeVxJvaGJpYGJmZmZiaWxmqCTOm7p1frKQQHpiSWp2ampBahFMHxMHp1QD
 08SGqvJPaq4Ok648OnrQm6H/+Z7HHrqZybe79PqatlQvZqx++3TpZo+WC29M//R92O560T37
 ULVjSuWxS3laZyJjH5T8rlug6OQ61VEpcXvrsi8mnCmLlsbcZ2S7P+HmafUzX/myFrwq+PRH
 +Ge77vWqXKvm3rDKNeI5s+89WPWwOqXH+Nf8aulij/3fV7b+fDT75J8Yxzt69U3st+oa+I8n
 Vc5/bLo/6tiNyg0VT2oZMqMiI92XvA9Rje4+eKnn0fTmC2bSCycy+V9m4nE8++DnQuP/sYoZ
 aydmsUYEMc2xlJznG/va1nj7JRUv/+DH6qfkasN7HkYtlvp0ZP2b/Lc1k4NPzLjCWNAplqau
 qcRSnJFoqMVcVJwIAGai8M8uBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvK6gz8Fkgwsr9C0ezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV0bXzfXsBSckKx5duczcwPhapIuRk0NCwETi29dV
 jF2MXBxCArsZJe5/n8cOkZCWmN6/hw3CFpZY+e85O0RRM5NE99TPYAk2AVOJVXMaWUESIgIT
 mCROvjvGApJgFtjKKDH1sxGILSzgLjH5Qg9YnEVAVaLjTzdzFyMHB6+AtcTMZmmIBfISqzcc
 AAtzCthILD2eCxIWAqrY+/Ix0wRGvgWMDKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3
 MYJDXUtzB+P2VR/0DjEycTAeYpTgYFYS4d1zdH+yEG9KYmVValF+fFFpTmrxIUZpDhYlcd4L
 XSfjhQTSE0tSs1NTC1KLYLJMHJxSDUxn+xaLG685sUH+zd8vW772qdUH2W49t89vu7zu9OXa
 R4M4nr++/3jvcx3ZtBtn71/ZUb1dZtnLKxss5gVY8sUWResrTFhhJ9tbp3yxIHPB5T8GhVPe
 +q+9PGHN32/Gny7snh/xouDl83QmST7X1j8secLXj+20/xm86ONJ47nvbsxetmChpujEa/tV
 Z8z6+2Pv/t8stqtfvdyuHxh8dstL6759EyJnSb54/11fO/Ld0W0e359oWWpd2h29z/HJNQWP
 aomz7Tx60xfOWlrSnCPIO627rDip0Efc4NiM2trySz/8rgex9SqkbryVP/UO3wLhgAy1hIAi
 5g0Ge5frbcjvUHQ7Ol/lzrGppRf3vX8RcVaJpTgj0VCLuag4EQD+ywC85AIAAA==
X-CMS-MailID: 20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121825epcas5p30053dc48475ee6a8cf33bd5112d9d6ed@epcas5p3.samsung.com>
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
index 1db6ddf03f01..cf5f2ce4d2a7 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -38,6 +38,14 @@
 	status = "okay";
 };
 
+&i2s_0 {
+	status = "okay";
+};
+
+&i2s_1 {
+	status = "okay";
+};
+
 &ufs {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
index e3852c946352..6b51e31afcff 100644
--- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
@@ -339,6 +339,20 @@
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
index f35bc5a288c2..3e7265a41e37 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -738,6 +738,40 @@
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

