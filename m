Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D980E3425FE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 20:16:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6586A1695;
	Fri, 19 Mar 2021 20:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6586A1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616181413;
	bh=T5XKJI9aLzubXQKPulHC2+eDfMNiYZbj+qzeVAJFNuA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gh0uMuQyMrb95Is69fPSyAkoR0RmKAs0CWZV7Q64KT28khJ35f2F/uP12YhbZyLEi
	 +rPwW/9X86d+8zLo3+DKX90Ph8q5I4P7dJbuara0453ddDCpcoN6UTVV0ZYK5rmbxz
	 ZP4tdgqbOevW4HxAEWLGTnSdlPQYqUmtNtSv4soE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C642F804A9;
	Fri, 19 Mar 2021 20:14:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E8E0F802E3; Fri, 19 Mar 2021 20:14:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2098.outbound.protection.outlook.com [40.92.23.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB17F80253
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 20:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB17F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="RNezHFzB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rvx8dI9uQtmcOfu9tkN1yzs3fhkHt9oRVx4bvY3SnyuwanLmENpYMm04vPhn1Tz19LDpjZ9CrN/5SKSNjajsHd6P7rvlkFH0R2oxjf6SX89pSs2l4O60cQasdGLqho3ywEOduebYIzsXyGokNfv/xDsYOgwZ0lpLDkouyn6qPDEQD6q530gKHm9CP6QTcj8wdh2QuJUkdZw0m9iHZOq5xsMjzLBiMT1VGFIAClpJ9tFdDNILJa05x+FtV85PkTjx+nBr4Axvwh93OwhTl55Hr4iAvrJaJKZTGOTkrSfM4vV/6DOvkdbSyZd7njWCTe1YqO4ZX5cXLzatjxmHKbJYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuvtO9dQQBw8iP6fllwadI6ruugNJW4ZkBtN7eBuukE=;
 b=FKIxk5Gv0DzpPgpK5XokI5EF1JZ9dNGLKPlR7Oj4UpZ1k/e4mJ5m4iZtL7H0UYYOVaFe2rW9OeH7oV9kA+Ffx8Iw3H6yIkSJH/INbaHQITPKRBRWczQDbZehxY0fOVb0cflKHWPTEyAEzXo4cETupwWKf5wa5GYx0uWw76iqFVdSSXXqk43M5AkBjU80KDpQ5rgC5wMnzhiiNHyWlj79DINQ8u2QMrVQK+xqLt439m7atV6uy0hMDzXOdzYQKoTuzKbl62toWVyl4iVteyltNJEQG1NIjJjwWaY5Nf6HHXaRIEBl4FJutWTtb7Om0lFqg+4zHJEemiG3Xj8dad7CIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuvtO9dQQBw8iP6fllwadI6ruugNJW4ZkBtN7eBuukE=;
 b=RNezHFzBTfOPhzaJqOztQbBv80G17X0b/KlISXKfhYZzdTgPUP88GE+3N9go6Oe0Aa2PZTY9CMeOoQ52vIfhZ/9HqGtvWqEdi+SgdX1SWdHrBnEnpb2xy85mfYUQ/HqreNNMTqUWcBfKEcaVBnbqDfDdoyPW0tCCNDQg8PJgNNY+asy9i2l/vKRZ1t7KnEpoZcMA+9umTjLGL+0bmWA0UG9QuGMAHvoEAF8H410+WKUrIEFAy/beFfk3dqd+q7nDDNfzfKVVEfah1GtOVPH99L3hAyIYpS6BaaVqwUeJyMx+64S94Ltg/NJpL7LzVwP9GpA3asj4jklLZ8mnMVexsg==
Received: from BN8NAM12FT062.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::42) by
 BN8NAM12HT182.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::371)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9; Fri, 19 Mar
 2021 19:13:59 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc66::53) by BN8NAM12FT062.mail.protection.outlook.com
 (2a01:111:e400:fc66::321) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend
 Transport; Fri, 19 Mar 2021 19:13:59 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:259F668122432ED6707CF4B2EBF307CD35350E5612882B1D7742594AE51B3E2E;
 UpperCasedChecksum:522E1602EEF8D27C5E7B71F36B74A59E333593138A0CF9EBA14686D39112F3DA;
 SizeAsReceived:7538; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 19:13:59 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
 Advance
Date: Fri, 19 Mar 2021 14:13:37 -0500
Message-ID: <SN6PR06MB5342E7BA29353D6FE817317FA5689@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319191337.9414-1-macromorgan@hotmail.com>
References: <20210319191337.9414-1-macromorgan@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [lo/L+bFywOhKr0xfsaScNPWGlfr08sy+]
X-ClientProxiedBy: SN1PR12CA0044.namprd12.prod.outlook.com
 (2603:10b6:802:20::15) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210319191337.9414-4-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 19:13:58 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1ce57db3-3627-4198-337e-08d8eb0b2618
X-MS-Exchange-SLBlob-MailProps: zswcL9HXbeXsGxgxUGH+YTsWg2A96AcwnIOx/dBnQsrOkgZYjFa85BBezSd0UhgZG02bWlkI1R58fU8+XVLDIKCUifeUJmIMDZWdN7z2iMBvAf5S5e3YBMiGdgMG7aFFPVwc9R1hGX0E2irvKLPzqG6j8bu5BwRUk7Bp4ExN/usMGBi5JRholH3vWyzZHqGuuNYcgoMtGL0foUGXYKfJ8KtayIgWqHjp6a5ECYCKCqbr9xTZvCBgfnjNmMDOp7M4EaDny+ataGLafSOYbwBDdDw2eHN2GrE019GJu4zGKWCvXAJKMmbFqVFoBXg/WrtUq/pkHRSyqiyycrTOPYcdwj2KgAGMVEICd3A2aNaRQFhHa6zIHpYDDfk+cuCgiJYtiKXNR5iVpiGM1Bw5EMMS0X2FK8ofQQvkyYi5lxSqhgH2fPi7JeR5rVdorP+l5I3tmvdKhDAqyFrsdVahScpazo+trIcAocLUzgiiRcoB7jbNTCtE8h6stdGJPyesud52q42n2VG/Kh+JJt8+FYlQAosc0oXe5AZTJC21cD6Ao784+KCvhK3z4RSqUmDg3yVfcARxoTsuLJ3DbgGvFnXsKe7JuOsfxFSUC567sIqLf/gsYQAS8ow1i4bnUF6keIayOuA3Jru6yKPOMIJ6kBVt05uQNCcmEm6dDyxUAVAV+oWEtrkTKciLgFu5HfygP6xOdU9F9bZF6eElL4F8zLjI6oe3xg8X3T8gMss6OfiVRt8IiNVfjO4KMQP0t39QcVug
X-MS-TrafficTypeDiagnostic: BN8NAM12HT182:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yP9uAN7Enhxj8LoxMRyiJ6MjIwpPTIp2whdu25uuk4ih/PxkMN6AATIZ/HneoRb0qPSvPsomhemYiPdstsLO5anlZ3zeb9DJMBSXwrsKE2+SFOZ+uZp4xQeDYO2KI0hK5b93UTVFqKvMerwWjElLKtuoexZTZ9BypGC42Zjvpk+xfwnNiTSGEe4ACh10sLxcXlXA1QGedx81rX2ceitDzjmsuNXDMYE9s14FYWKFG5PKcQ/v0jBJ4B61ua0IJ5UyDCAXinhOiWLZljSy0A8aweetUab7eWwp7d4STnyRLLKmmNsaeHQxzEFdzCfNeIIDnyhObWNoEbOEvVg623YvZ6kdUwI0q6eXvgyom9yF/TJp2PUgMeGsE/loJ05uWf43hXmH7PJngCTdLeLVKW81gQ==
X-MS-Exchange-AntiSpam-MessageData: WWI1LytkMmG7JPBYK6n+f96fPwnlZwUt9ugmWis51UerULCnpghYNRNmsQd8rmJ5W4iQnZm8Kp6xfl76jhtpOswz7zGrnF5vICoM0huucXOh1hJz3tklpnnH+tvjzAINvB5DFCSu/E3awDN0rK8ujg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce57db3-3627-4198-337e-08d8eb0b2618
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 19:13:59.3450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT062.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT182
Cc: broonie@kernel.org, heiko@sntech.de, pierre-louis.bossart@linux.intel.com,
 Chris Morgan <macromorgan@hotmail.com>, tiwai@suse.com
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

Add the new rk817 codec driver to the Odroid Go Advance.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index 97fb93e1cc00..e48dcf430efc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -161,6 +161,29 @@ blue_led: led-0 {
 		};
 	};
 
+	rk817-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "rockchip,rk817-codec";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphones",
+			"Speaker", "Speaker";
+		simple-audio-card,routing =
+			"MICL", "Mic Jack",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Speaker", "SPKO";
+		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_2ch>;
+		};
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+	};
+
 	vccsys: vccsys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v8_sys";
@@ -266,10 +289,13 @@ rk817: pmic@20 {
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_int>;
+		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
 		wakeup-source;
 		#clock-cells = <1>;
 		clock-output-names = "rk808-clkout1", "xin32k";
+		clocks = <&cru SCLK_I2S1_OUT>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 
 		vcc1-supply = <&vccsys>;
 		vcc2-supply = <&vccsys>;
@@ -428,6 +454,11 @@ regulator-state-mem {
 				};
 			};
 		};
+
+		rk817_codec: codec {
+			mic-in-differential;
+			status = "okay";
+		};
 	};
 };
 
@@ -439,6 +470,8 @@ &i2c1 {
 
 /* I2S 1 Channel Used */
 &i2s1_2ch {
+	resets = <&cru SRST_I2S1>, <&cru SRST_I2S1_H>;
+	reset-names = "reset-m", "reset-h";
 	status = "okay";
 };
 
-- 
2.25.1

