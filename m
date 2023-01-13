Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBCD669813
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 14:09:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A80A4ED;
	Fri, 13 Jan 2023 14:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A80A4ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673615347;
	bh=ISCSZiIHsBVHpDb+sfXQNKk9uRBd/Rxzjqt+sjgEHSI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vZWdKigxrNq0fWpkwfjFFgaDLavvvu7IBdA2GrF+kBZSI4Ob8NW9OKE8APK6rQFqf
	 q6/+qOZg+eZ0V3zhLZzDSM9LPQNa2N/m+B9OalZIn2L+t0GpzWg3oS0f4vF/HEduqN
	 PkKtvU54KULzPWaXPYSzEYKq9uJ3TUmrX0DBKAlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 307D2F80568;
	Fri, 13 Jan 2023 14:07:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 877ACF80567; Fri, 13 Jan 2023 14:07:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E54E1F8055B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 14:07:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E54E1F8055B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=R5WXmTdL
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230113130655epoutp04b13abbe36074cf6b9cdb8a8faeef90f6~54CvnTCbK1468514685epoutp04G
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:06:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230113130655epoutp04b13abbe36074cf6b9cdb8a8faeef90f6~54CvnTCbK1468514685epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673615215;
 bh=0NT9nwpPCCrvcsOIz2f7TUAYBNBwRv1azLoJ0Ig3cws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R5WXmTdLJe2j9IutLysU9wQ7Kb4AqyI23OMSdbxP+Oas3vdVqjt+awvYXJa3X5Wmr
 2uod+vhDtNisXRSnSi6n9jK6usGh9XWX6UxYzTIfqUzo7VPnb9riVylbiJW0Wqiv4N
 sL6Ce+yNHg3pmZuV+LGhiFwTPVDat+MgFzC/X/JE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230113130654epcas5p16fb4f2abe73e55e20cd224bbfea39c17~54CuRnk_-1717817178epcas5p14;
 Fri, 13 Jan 2023 13:06:54 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4NthWw4y0Mz4x9Pw; Fri, 13 Jan
 2023 13:06:52 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 39.A9.02301.C6751C36; Fri, 13 Jan 2023 22:06:52 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230113121830epcas5p4cc336a48f4597ba84ab1352774242f75~53YdkcNOw1715317153epcas5p4r;
 Fri, 13 Jan 2023 12:18:30 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230113121830epsmtrp2305904da1798fbfca6885b8d063f2365~53YdjkitZ1419914199epsmtrp25;
 Fri, 13 Jan 2023 12:18:30 +0000 (GMT)
X-AuditID: b6c32a49-201ff700000108fd-b9-63c1576c5047
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.65.10542.51C41C36; Fri, 13 Jan 2023 21:18:29 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
 [107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230113121827epsmtip2fb0b57dd690f0eac5b1b8bcaaeb45162~53YbNu1PJ0851308513epsmtip2o;
 Fri, 13 Jan 2023 12:18:27 +0000 (GMT)
From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com, perex@perex.cz,
 tiwai@suse.com, pankaj.dubey@samsung.com, alim.akhtar@samsung.com,
 rcsekar@samsung.com, aswani.reddy@samsung.com
Subject: [PATCH v3 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Date: Fri, 13 Jan 2023 17:47:48 +0530
Message-Id: <20230113121749.4657-5-p.rajanbabu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230113121749.4657-1-p.rajanbabu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmpm5O+MFkg2f/VCwezNvGZnHl4iEm
 i0Obt7JbTH34hM1i/pFzrBZ9Lx4yW3y70sFkcXnXHDaLGef3MVkc3RhssWjrF3aLzl39rBaz
 LuxgtWjde4Td4vCbdlaLDd/XMjoIeGz43MTmsXPWXXaPTas62TzuXNvD5rHv7TI2j74tqxg9
 1m+5yuLxeZNcAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKL
 T4CuW2YO0AdKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnAKTAr3ixNzi0rx0vbzU
 EitDAwMjU6DChOyMr/92MBUsZ6/Y8/4nUwPjb9YuRk4OCQETiXdH9zOB2EICuxklrl9X7mLk
 ArI/MUos+faMBcL5zChx8v8N9i5GDrCOH39zIOK7GCVOd+5ihnBamST2zWoGG8smYCqxak4j
 K0hCRKCJSaLtzUSwUcwCG4Fajj0EWygs4CqxbNclsA4WAVWJr5Pmgdm8AtYSEzrnsEMcKC+x
 esMBZpDVnAI2EkuP54LMkRBYyiHRdf0cM0SNi8SJK01QtrDEq+NboHqlJD6/28sGYedLTPvY
 DGVXSLR93MAEYdtLHLgyhwVkPrOApsT6XfoQYVmJqafWgZUwC/BJ9P5+AlXOK7FjHoytKrF+
 +SZGCFtaYt/1vVC2h8Skc/1skFDpZ5To+ruDaQKj3CyEFQsYGVcxSqYWFOempxabFhjmpZbD
 Yy05P3cTIziVannuYLz74IPeIUYmDsZDjBIczEoivHuO7k8W4k1JrKxKLcqPLyrNSS0+xGgK
 DL+JzFKiyfnAZJ5XEm9oYmlgYmZmZmJpbGaoJM6bunV+spBAemJJanZqakFqEUwfEwenVAOT
 7MesNJ5FfeqaOf8rPnfw2LxdNHn2T45JO3KvrgnfOO9ZhMZa2aRte247Pts+UUPIdbGy93LX
 oDclmeblvTdeln0wuzFt3ttksTt3nNL/PGp7fOnECvl29RSHvB0vFOLEP/a29gr+3u6yWlHP
 /0y49ouqr8k7w29lGrU9r1upsKs55s6PpacexETVlKldzgi1yzdfv+rfZXNJJXl34bPKp0r2
 f9mR3fVITiyM98m/UNd7/CGr8gsX5JuJJLxi/TCTPVDmaqTOzpccDyIuLnOa+oXL/YLek28T
 JMRVF26IrT+Qtba0NmrC7MthfYt3OvXOnWX9dPm170dr1KdN/XDT0Wc2s/r2z1NfGclkbFyq
 osRSnJFoqMVcVJwIANYEjR4uBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvK6oz8Fkg/6nNhYP5m1js7hy8RCT
 xaHNW9ktpj58wmYx/8g5Vou+Fw+ZLb5d6WCyuLxrDpvFjPP7mCyObgy2WLT1C7tF565+VotZ
 F3awWrTuPcJucfhNO6vFhu9rGR0EPDZ8bmLz2DnrLrvHplWdbB53ru1h89j3dhmbR9+WVYwe
 67dcZfH4vEkugCOKyyYlNSezLLVI3y6BK+Prvx1MBcvZK/a8/8nUwPibtYuRg0NCwETix9+c
 LkYuDiGBHYwStw4vBYpzAsWlJab372GDsIUlVv57zg5R1MwkcfTEE3aQBJuAqcSqOY2sIAkR
 gQlMEiffHWMBSTALbGWUmPrZCMQWFnCVWLbrEthUFgFVia+T5oHZvALWEhM657BDbJCXWL3h
 ADPIRZwCNhJLj+eChIWASva+fMw0gZFvASPDKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT8
 3E2M4FDX0trBuGfVB71DjEwcjIcYJTiYlUR49xzdnyzEm5JYWZValB9fVJqTWnyIUZqDRUmc
 90LXyXghgfTEktTs1NSC1CKYLBMHp1QDk94UlZIDW9j/O3xpDJ7oedo1Rzjk7w9nR/E9yxft
 MznycWXHWaGv2wIc1BleygtL/55/WtKk4qTTuWQ5rsaNL0R/VbUf2sx8y55FO+/g1p2NPB5d
 7gcVWvR3REXu+9cSder1Befm8H1zzBZ9Pzz72+X1FhM3bb2oPbcgceUlk4MmD66LtbqJrZSw
 qfWbvur1qctnVksf9b5nzJDAaxSpsVdo1VcpuUlVW0/t7NJofM7LPzFb529PpYr7jYnWyvx2
 fzb2/nzGesz3DavpM4Enn58cy9teeqb6Wb7fkd+bJoT/3vfBNmuh4iohxncfo6/3ZKrYZTPZ
 lWXfC8lc89VcqkP+wZY5z+qdRA2Omd5aMUmJpTgj0VCLuag4EQAAOFis5AIAAA==
X-CMS-MailID: 20230113121830epcas5p4cc336a48f4597ba84ab1352774242f75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230113121830epcas5p4cc336a48f4597ba84ab1352774242f75
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121830epcas5p4cc336a48f4597ba84ab1352774242f75@epcas5p4.samsung.com>
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
index cf5f2ce4d2a7..2f211a1ad50d 100644
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
 &serial_0 {
 	status = "okay";
 };
-- 
2.17.1

