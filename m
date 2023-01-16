Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E966D815
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 09:23:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B7C6445;
	Tue, 17 Jan 2023 09:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B7C6445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673943830;
	bh=Y2C0s4uMMgHIRiZIs4G9ehzZ2q2AYSd8KKSZjL6Ws70=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q+bkB6dSzhT5HGsEv5IOe8GPvwzqeD0bqwkK/LHKaOFhfgxh1DWVP+G0yVbjcM3VM
	 wR80wVztEm+JB8apUQoqT+NRNCKFlOlpJfhTgejTkz582e818/gZfAeJIgOr1ClI99
	 9XyzbbLGSJawRxoqHCGRbZTGCKWlwCgo+fdF/S9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10ADEF804E6;
	Tue, 17 Jan 2023 09:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC7AF80558; Tue, 17 Jan 2023 09:22:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0303FF80552
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0303FF80552
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=h+uITiy/
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230117082217epoutp04dcb5d986804cfcf44a9a4a3f7cc07021~7CvW9dwKu0594905949epoutp04N
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 08:22:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230117082217epoutp04dcb5d986804cfcf44a9a4a3f7cc07021~7CvW9dwKu0594905949epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673943737;
 bh=q/tn14ZjbdXMf9MNwQsdbd5Z9hNIqD6iXxXoo6o434g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h+uITiy/66qgUfdrSATbCg3Wm0vBKKWkJrbn2cjMsV+zztaLXcj/+WVMSBWzo4cLk
 ZvB1FnomH/fFN0Jt3OokXUrXNnXFwJWFdbHPR3VSP3d+Oru4SKAtUatQVEnweYnL5n
 rYXS0MM6EOGgSRGEyDyVhn3Z2S8EaL/S+gJlI3BY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230117082216epcas5p110925e685dd41bc42980301882e1f05c~7CvWgpFlU2934729347epcas5p1I;
 Tue, 17 Jan 2023 08:22:16 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Nx21f4Rqbz4x9Pr; Tue, 17 Jan
 2023 08:22:14 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D7.89.02301.5BA56C36; Tue, 17 Jan 2023 17:22:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230116103908epcas5p49d65b8a38b8ecfeda508960a9543193d~6w9jzQ-v50449804498epcas5p43;
 Mon, 16 Jan 2023 10:39:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230116103908epsmtrp1db5d2d211fa7a780f87376ed80d70b17~6w9jyZEAd2177121771epsmtrp1a;
 Mon, 16 Jan 2023 10:39:08 +0000 (GMT)
X-AuditID: b6c32a49-473fd700000108fd-21-63c65ab56ff6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E5.FC.02211.B4925C36; Mon, 16 Jan 2023 19:39:07 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230116103905epsmtip10b5473a5e0ad2423e42781f38d13466d~6w9hlHICO1258912589epsmtip1X;
 Mon, 16 Jan 2023 10:39:05 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v4 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Date: Mon, 16 Jan 2023 16:08:22 +0530
Message-Id: <20230116103823.90757-5-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230116103823.90757-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmhu7WqGPJBs17DCwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AdKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyM0yfnMhYsYa9YuOggewPjD9YuRk4OCQETiWVHdrJ0MXJxCAnsZpR4d3o9
 I4TziVGire8xO4TzjVFiz9QpzDAtl2//ZIJI7GWUWHJmCVRLK5PEzedzwQazCZhKrJrTyAqS
 EBFoYpJoezMRbAuzwEZGidPHHjKBVAkLuEqcvDYJbC6LgKrEvi2fgRZycPAK2EgcbY6CWCcv
 sXrDAbASTgFbia97bzCDzJEQWMghcehPIxtEkYvE/rVroF4Slnh1fAs7hC0l8bK/DcrOl5j2
 sRmqvkKi7eMGJgjbXuLAlTksIHuZBTQl1u/ShwjLSkw9tQ6shFmAT6L39xOocl6JHfNgbFWJ
 9cs3MULY0hL7ru+Fsj0kWrv+sUFCZQKjRO/R2ewTGOVmIaxYwMi4ilEytaA4Nz212LTAMC+1
 HB5vyfm5mxjB6VTLcwfj3Qcf9A4xMnEwHmKU4GBWEuH123U4WYg3JbGyKrUoP76oNCe1+BCj
 KTD8JjJLiSbnAxN6Xkm8oYmlgYmZmZmJpbGZoZI4b+rW+clCAumJJanZqakFqUUwfUwcnFIN
 TIw3lNtnnJ5dqXIyzf9usE4La87Ud7E79M43+37eLXXZ5F4IU+ByeSf2dVk8OvOq4pYmfPjY
 xMOz+eSXY74TPj9dPU/ntFFb52nzwxtnCm6Q3nyCoTDxj2WQRPt8ZlHfKUcn/i0RrT3atWxf
 1w6RD/tP9KX33zkTLL34+nrp0zN2BmnHMJrN5lALyN1j7ryxQp/jWYO7NaeM3aKQWftm/5wR
 /XGmP49c+ZWJsxY3dD8Jj4j/9IBt0806M9Z1m39lHFt86PjCrCcbH2xewJeiHx1QXvj0WU/X
 h3iOuzEqzNw5B04qrOA0cNO68me5x5pe0fb3Isd/sylnKujtiH3i4FfQ1FS5YdfHr4XKNgeb
 2pVYijMSDbWYi4oTAaUouZIwBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnK635tFkg5czrS0ezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEcUl01Kak5mWWqRvl0CV8bpk3MZC5awVyxcdJC9gfEHaxcjJ4eEgInE5ds/
 mboYuTiEBHYzSnzr28wMkZCWmN6/hw3CFpZY+e85O0RRM5PE7XutjCAJNgFTiVVzGllBEiIC
 E5gkTr47xgKSYBbYyigx9bMRiC0s4Cpx8toksKksAqoS+7Z8BprEwcErYCNxtDkKYoG8xOoN
 B8BKOAVsJb7uvQFmCwGVPJlwnnECI98CRoZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5
 mxjBwa6luYNx+6oPeocYmTgYDzFKcDArifD67TqcLMSbklhZlVqUH19UmpNafIhRmoNFSZz3
 QtfJeCGB9MSS1OzU1ILUIpgsEwenVAPTeeG43fpztx8INlD+Nbsyd273XsnWP71sQVWfjK75
 vpHoWdEbJrND5k+alcPqa7K3FbL+iiwI3HL1pte1gAtC1Zu+s216JHReds6qjS3Mr4PuTr78
 5eSEiuCQJ5MPSWzcanNnz7TZT0Ud7GtXvXadePSbw/2v9xwEfjzaH8WcsmvNLEev8LVdor/W
 p3TOY9cKWn9rCts/KTvngv3P35907S3ZVNu4erHOH4uiFbPfvrsoutXd2oo16+lDocA74h1F
 T6d/POS8doekFaNAzbfIJ/9XC9jwmae9c9UpPyynlnk8/azalxpOsfjjxdbpAgy+5tujMn03
 7O28ftjEUu/YvzWrrofuMhR6dm6JQ9bkN0osxRmJhlrMRcWJAAVHpCHlAgAA
X-CMS-MailID: 20230116103908epcas5p49d65b8a38b8ecfeda508960a9543193d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230116103908epcas5p49d65b8a38b8ecfeda508960a9543193d
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103908epcas5p49d65b8a38b8ecfeda508960a9543193d@epcas5p4.samsung.com>
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

Add device tree node support for codec on Tesla FSD platform.

Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 7650c20f02b4..2cd721564a4f 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 #include "fsd.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Tesla Full Self-Driving (FSD) Evaluation board";
@@ -34,6 +35,17 @@
 	clock-frequency = <24000000>;
 };
 
+&hsi2c_5 {
+	status = "okay";
+
+	tlv320aic3x: codec@18 {
+		compatible = "ti,tlv320aic3104";
+		reg = <0x18>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&gpg1 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &i2s_0 {
 	status = "okay";
 };
-- 
2.17.1

