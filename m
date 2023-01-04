Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E101E65CD4F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 07:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5197F925E;
	Wed,  4 Jan 2023 07:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5197F925E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672814757;
	bh=JKyDSbQBfSiUwuu6+Mx2e/yuhq/s00rBB0rd3mNC5WE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W8fHLBhXT8fcjBa+nvVR/nhwsHbGpOYW/sAocB7ZZwtAYGnqPzJ8m89QbzSEXZcDH
	 xKbTH6gzob0vi0OHZT8vjM6PFJ2UWjJc0dozN0mOA2JGLfW1fHXxF/EYM0AGfxE18R
	 7LP6lDNyphHOxalG1rt/Esh4nKz0j8xCDwBYJxY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F03ADF8053D;
	Wed,  4 Jan 2023 07:44:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B88F0F8051A; Wed,  4 Jan 2023 07:44:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2087.outbound.protection.outlook.com [40.107.128.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04960F80240
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 07:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04960F80240
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVsr76O58+jqDALus8fq823hP1jscBMb8FMG2IHG3EU2yy6X/Kdp7bNJ4YP4CU4mk+kHf9HV9NlX73tI8XMAIbRVJhR4c8imdLAYIDkbRiWMWPiit/ECSDwfsvJFu9u3qgdZQZQSxhkh+PtSBqQH8VdZAAWatrVHhbqQhoNwR2vdZwni81n+mi4E32wVSKxa40xRG1i9K516dtWmTwVIVNYis69lqQ1vvV5+wHiuJotY1APKS4yGLVoXJ4QEUBASdSsM5vh+65zdnnRPzlzph1gBRYjer5YzLWzfsN4GQKkHA5fXlQWXZrBDNmOkyPGpfONOVTJhhRTt/yQuje8xRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z7/BUmD7tY+ce6HqYqL5HC4RFwVoYFCaIiexEZgLgg=;
 b=RgnhRV4I23uqqN8bwj2vg/qT3AZkOEkbGgNz3B1WycCI8zeXHalMfabQD0qTHJrIh2q4gOFuPZQQ0USCZuoFXC/RheSBhwe4uBGpkR92ZO0u7hfCFulOt/DBIO+5tV5dcAHMtZF1qLPCrJWKubYsGHp43UT6DcqEHZhVaHz7ObEzdJ2O8zkV0hXI/NtPBbbXscblo3MzUGS26Xl8q+3bKL4751dwFte1JWNea1r4Fg3l4MtmGgKYzVWKoGsc648DCuLThG1ZH1ruFTv2aiKr1xt+OeLTXaPlNxHGgN5FGnUBjF0CiQMLVx3VRHGgo0KRu/0tOOzNNBaYiX0aMAQDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1820.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 06:44:06 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 06:44:06 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Wed,  4 Jan 2023 15:43:41 +0900
Message-Id: <20230104064342.2094-3-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104064342.2094-1-kiseok.jo@irondevice.com>
References: <20230104064342.2094-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0141.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::20) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b006240-8adb-419a-2268-08daee1f137b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6JBSFrxBLSeP1aczMi+5V/2L5ASLIvnHDzCLyJMFa8ejUjdK2TMRu6uUCkrxV+UG2htBfqrhQcj/+p57sPLWPXYKSbexxz01cQ5xxwsu/DUnJPEsP6UpDnlIzZgQ/kykzWAMY16Vwcv9bzzltOWA2rFmpkv5qeu1sKP1y8FzKcF9Yu53lWJ3IvAYy8uNRkyhjTm9vCjUOws+5FaRWL85Rya2rtRAQsvYn/UKEeplS+XBrg6Tiz2rVg/MTILpeFpLneXe4yTEyvAYbbk0IRPCFFLFbHioThN3mskwlxbVDnYZS1Yce8iZOhBeussGPFZypDkVGxKLZAkOGn6qkqcVSIcoODR2sMfWQ6VmlF2nJaiF2Hpw18PZZuwDIpqrokDsV2SGcBvUNtDoXEptyGq7ORHaghcFf0HRhWw01nijtcm8AnyHjOJQda4NaXPlRyl/g7o4ZWnnR0oqLbmBcBZzootvVr++dBSroAvjHopBTN1RifCak5QlbwnCQ2fJSkNJt/KuPmIO6ohrpIt7QMDb/tHU6spNnHTSJhTVG/Tm0e3EXI7YTKEQgpuFaUe+rV4mGk1/K/PfRZni7QANrn1j6gpdwyUAd5tXXRfwY2KFlhDRt+v7hdAH640dsSYf9wOT3TojkMBuatVMXPgaMXDoN9V+hK6EFz1Z74pHw1cuRJlFfRPVuFxLKPOgioFK+G/uDKqRgVmEMsoIwHybJ2Lk4+mCCnFlkKzbwol8YbOpOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39830400003)(376002)(346002)(396003)(136003)(451199015)(5660300002)(2906002)(44832011)(8936002)(41300700001)(4326008)(478600001)(8676002)(966005)(316002)(66476007)(66946007)(6916009)(66556008)(52116002)(6486002)(6666004)(6512007)(26005)(6506007)(107886003)(1076003)(186003)(38100700002)(2616005)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OOkzy3zXNwO/w2H5HfEzRqxg8GsHHIsPaxFo/Yav4Co0gw2BZhX+n7bCmKaU?=
 =?us-ascii?Q?qSTuJAvN3UAmOqt9jOmYP0qMlb66zS7+KRowPtDuNGKDbKhPVMSBTAABQWFB?=
 =?us-ascii?Q?/xjf8Y2eYSiVV6NYNXn5EkxAKNPWCSCayfHMujjdHUAgu+XcEbPrTPtrqnKu?=
 =?us-ascii?Q?D1UtmhtBfIvRjNn0KXLyMvxHlw3Rkju5Qq7cLPZTgMCbJWAAXu+vge6rtaqj?=
 =?us-ascii?Q?EYYhC040nTam3fC05JB1r3L+kAt3qejeGe5OXHgVhq99SQEf6kh7xTXSUTkM?=
 =?us-ascii?Q?n1ewDLoIyMDgXaDfUBOrix5eJ77JI7wCTi9zTainpJZ9aTePzFxziJch84Bd?=
 =?us-ascii?Q?2eKcEqAzR6D+yLbZ8WFAZjltZ9dvXBZdOjavBdM4T+KnRQ193YJFXGnBm8sx?=
 =?us-ascii?Q?g0c7Kt5n8vAhapuu+xkcn2642sCyyZbscmeanW8S/qcDCmW3cr0ko6NIozBh?=
 =?us-ascii?Q?1Fh3Sp8aCWjn+6SOQ0seuymfOhNUbuRVsOZFKLouvZICyGWtvuo7JwYVK8T1?=
 =?us-ascii?Q?9nrrHQXNuArNVvC7T2Grz8jWplviUTFj68f6C4Iz53eLCk2Ufrbx+LF60A3p?=
 =?us-ascii?Q?+a2Y1B7tpec2vFQ7jtbCfnIAeG9TmBcqJxfyqiQt8IjQ/VGXCrG/D15QWXzH?=
 =?us-ascii?Q?B++Qin01A0ty8fJ3P6WnbOpOXibcR+1ECbNT44tMLGV7bFy+UperT8GvFtDU?=
 =?us-ascii?Q?CbG4xf3HpyN5iAAmn5YfDdG+dXtaftivG0RhWTmzs/kxxdpjrrVQ54ZewUaW?=
 =?us-ascii?Q?y29jat/XdrjscPjxLsGEihGKO/tXeK/SDUDmcMJZsbczzP1IMcW41JmAlnfz?=
 =?us-ascii?Q?qUYhvfc2T9+PAPmzcK5KLHY7qi3ZRWv5rHf5h3eB7Dc+lLh36sADznFOoiGK?=
 =?us-ascii?Q?H5YosX9rGL6LAfKdlTfjAY5CCsqnvT+A8C8DIKI7lyuPFiRtdEc+SUYW5d4y?=
 =?us-ascii?Q?vLzOx7Yyt7pS6NzXT90w/WJyFnoFImAs5wLjU4zO8Y2d8r+uHOzlXgxCVgbz?=
 =?us-ascii?Q?RjQe9i8+U1zu7XwuGTaBuBfknJ1V6/VSUwaxsSAY12mTIFd9OGCDreqp/njO?=
 =?us-ascii?Q?y0Hy7sFKswXKa/B8jzWvb4JTkCMQlvPQkQ3Ej+XF8fcorZSmQO4cfuXYjPtE?=
 =?us-ascii?Q?kO5ASojn4XXxJMSKYVi+fdQnGXdyGLXoprT5JOdMidmZKX5QyKYeVlCwSvcH?=
 =?us-ascii?Q?QxNpP6yrW4X2gKQt6hDsiMutut88IK8F0juEDAJEp9Zt2e9jN19nlWnVWMXz?=
 =?us-ascii?Q?uyQdxtKa86Oz0uaVwsCcvS6258YFkIljU13P3fFZ5ohfVGAV/35FPdpjNyid?=
 =?us-ascii?Q?/mpc1jwV51NDaFui1slazzua9DKBckM9YP7bpO8AI5En7UBZt2yxQKLu94qj?=
 =?us-ascii?Q?EPz11QLrGKFOdX8GZ4uqsb/CKOPuSrVQQ5CX0vWPIi9ny+i1PxA+pLqD0K0h?=
 =?us-ascii?Q?lzUIo/l9Iv9S+HUlxTChBgh3zZVnnzSoqY/eSlqBd4b4hH04MpVeaB+VDpRx?=
 =?us-ascii?Q?ho2A+X9MGn6DXh+ynXmnbBpaWPb893eddNCSiu26POPoJmgRjxBKZOgzW4A1?=
 =?us-ascii?Q?HI5ReWlDba8bLYLWyE68nuUeqrPKU29V9jaRpBoW?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b006240-8adb-419a-2268-08daee1f137b
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 06:44:06.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXlErXTt5cy8mpuJROk6pPBMPn4RZfYIR6Ek9hFGQlsGNe5pMRflDa66tgy3+MCm9SndZXWHMN4HBbp9Psw/b4XH1iiwl6zZTjo7jete40A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1820
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This adds the schema binding for the Iron Device SMA1303 amplifier.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 40 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1=
303.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yam=
l b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
new file mode 100644
index 000000000000..8c3b85f962ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0D
+%YAML 1.2=0D
+---=0D
+$id: http://devicetree.org/schemas/sound/irondevice,sma1303.yaml#=0D
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0D
+=0D
+title: Iron Device SMA1303 Audio Amplifier=0D
+=0D
+maintainers:=0D
+  - Kiseok Jo <kiseok.jo@irondevice.com>=0D
+=0D
+description:=0D
+  SMA1303 digital class-D audio amplifier with an integrated boost convert=
er.=0D
+=0D
+allOf:=0D
+  - $ref: name-prefix.yaml#=0D
+=0D
+properties:=0D
+  compatible:=0D
+    const: irondevice,sma1303=0D
+=0D
+  reg:=0D
+    description:=0D
+      I2C address of the amplifier. See the datasheet for possible values.=
=0D
+=0D
+required:=0D
+  - compatible=0D
+  - reg=0D
+=0D
+additionalProperties: true=0D
+=0D
+examples:=0D
+  - |=0D
+    #include <dt-bindings/gpio/gpio.h>=0D
+    i2c_bus {=0D
+		sma1303_amp: sma1303@1e {=0D
+			compatible =3D "irondevice,sma1303";=0D
+			reg =3D <0x1e>;=0D
+		};=0D
+	};
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..271ff119764a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -635,6 +635,8 @@ patternProperties:
     description: Inverse Path
   "^iom,.*":
     description: Iomega Corporation
+  "^irondevice,.*":
+    description: Iron Device Corporation
   "^isee,.*":
     description: ISEE 2007 S.L.
   "^isil,.*":
--=20
2.30.2

