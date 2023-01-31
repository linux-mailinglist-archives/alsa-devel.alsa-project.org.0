Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35216823A8
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 06:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05434AE9;
	Tue, 31 Jan 2023 06:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05434AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675141927;
	bh=9GbCXSqYRiDK8rPE8U+a8KlczTmgaUnbs9cwqpRBtjQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jqYRKmlcqzn5co08lEd/c0BZ1Pk+/txcBGRrhr6TPCIh91XHQGyHaPYvazqZwWz4p
	 oXg3iB1mnNwbp5+umlUPLVT+wM8tciDb9BwRxnFRXH/ff5gwB/TcyNlBM+oqawIWr3
	 0/U+I6oN0U036mL1601O0piAQ9J3asrgxz+wfd/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E0CF80155;
	Tue, 31 Jan 2023 06:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7EC6F804C2; Tue, 31 Jan 2023 06:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4EE2F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 06:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4EE2F80155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGVshe/UedCgRw13A01xYPTssQMV5Nb87YBm6vLaGv1zxpel0mXhg8xybeP94fjneN2X/zhImf09rwg6dIr/0By7aF+P3WmeumERJuW7caNnlCtEMeSluBP7Jt/EjFEDVR3Y01GPprVCp2FSAVBmdRM8apUv5kiIkiZ5vqTftvWcpsK/p56jCUtKlV9wltnIQOo4NOXsHJcmF2xlQlI7juPq+6aTci2M217sIorwaGUmhEy4VXyvSTsO6TSyh0xWQ4+BnBRum7UkQw6uxk4MPGE96vHrOq3ls1hZK+l5hYTJ3jWrEqgJl9vlakWQ3DFRcJ6oegQNNu/U4riVfk4h0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/5VWxDRGHZA6W6SxsX9/7G0JZla3SuEEesO99geB1s=;
 b=XnAm9ihh6IljRbhwxrsrSveyfxyR+uzHgcEcgF90PfwKLwiHZNt+xNJnF7Jx3ZQaucmralSNw2NgXvDji/ehfHcQ1CdoEcJ6zAoinAwr8oMQdkOhfQv4RLjbDUCzNB9UoKncD/muUJVTrWO2Ox8wNBlbqdfqCWj5jqJJdTGeOOYabwgVbKDb7HMEVqN3UvqZlT2RWtAilqP4A3WzaWxCA4bA+6Bgq3Jpaypja/tU1vtbZovr8BTxVLG1Jr6008jxdNafL3Oe2QzEI1Nr8D3ixNS/BVYTL6+Np2y6UtZORUVQnZvIJnWrn0+N2k1KoMvM/b3tVTGfcg59wx//xeAW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PSXP216MB0984.KORP216.PROD.OUTLOOK.COM (2603:1096:300:11::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Tue, 31 Jan 2023 05:10:48 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 05:10:48 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: irondevice,
 sma1303.yaml: Fix about breaking the checks
Date: Tue, 31 Jan 2023 05:09:47 +0000
Message-Id: <20230131050946.14385-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0216.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::11) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PSXP216MB0984:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4ee2a6-fc2a-422b-8dc2-08db034983c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s5uvlAWgeVtgFoct8asT8K3SUDuyOjT1/EaaHo3taXavrl8a5X+868Ydt4ZWGwOVpkDLvRHBBNEAR5EIcAwQcp+RNhACoS5ScsQQJlgAZqtoSijPzqGnU2ZJnZc9XKn+h7L7M9A9DwCTMypaz6DfdgPUXpDXLMyzMSaHP6skZgtwDlCrYK79iAaSmZMxOM2AGRGyLv5G8zYJVOdIBn3JblTwQs4cBndl5q0GGSPpQmc0qHwO6IMesuJytsFXT2jMoiEk6FEuwiUDy2dwJ/cvsy85Hf1i7LieW9Bjd+8SUJPzMmPmXT/DZdQMu2GEK4g6qzsoZyPIdr/lHxHBZx4cDkP9/sxIdzYO+drlDydX5mJkmUdHrXOoE/cTSkLaIHLRhmeNyjSV9/0k9ByEBm67brKujtHuStX7cH44ucriidRCubmNAGWO6go1eEGduXex8hg77z7/t4QB1xoxA0CRd/Y8xlR+iHWUICM7GAzGaWvmPoCHVHevBem1z/r9G/41urdCyWo63bKnP+HKMqB3wyD7rl0ygdEkkCYLeMdelecO2UaUZh/8DrvMnoi/xRWBzh34wdaPJkdDdMdchlt0teR1+zZ+XhLnagc5lKuO8MJV0AgiO73CxU7/ZZkVH9p3eqYF31TnEXLCpqXDK87M1cXsBlnSEHAuMdOFihcnpGZ139kv3f08Xu1KGWUh4L/Xd7xuoaejpXJ15ynbN4jzvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(136003)(366004)(39830400003)(451199018)(52116002)(66556008)(8676002)(66476007)(4326008)(41300700001)(66946007)(8936002)(83380400001)(86362001)(478600001)(316002)(2906002)(38100700002)(6486002)(38350700002)(26005)(1076003)(6506007)(5660300002)(44832011)(4744005)(186003)(6512007)(36756003)(110136005)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rL1t2m4Nj7F2RuxweJ1GpZZgnhYa/aus2MLYk3PkoGDbOY098P+Nk78Y64wK?=
 =?us-ascii?Q?EztXEJcisdpmmIIQIicVGmhFszKYLI3MXzULsnHxBHXTvbdXzVmuvH7iL9gh?=
 =?us-ascii?Q?DIskTIDqmi/c2f6B9CBjcZyb9QtZ4IJ/8uHrlmJAvv6LVRLRACks+ElM/bHY?=
 =?us-ascii?Q?rU/1vVAd/cYCHPb/MRy2UlWn+vE3Wd53KeIK9RAnG7jaTzIRFf9xXVMSmyBb?=
 =?us-ascii?Q?6xTwQe9R+9iW10FuVaPPUq58PV6QOTQvhLiPdb7BFhAWaCVOJBLZgWjB6cbb?=
 =?us-ascii?Q?dJZAQyMKsvxJsmGaSU5xmWR5rQHrAfBoDlr0Lv/ZlpkqhVBiQXzw8n3DNkM3?=
 =?us-ascii?Q?MHWtQCHHubUyE+ymeDavsq4KrmJpM20ZntgQjzOP57SdZn8UxOWRLNqHv45U?=
 =?us-ascii?Q?4d20g5SKiGq6Mn60LlkGkgnKDD7Z50OeM+huheyrutXGJ6ff1IrY1VPvg6ey?=
 =?us-ascii?Q?3vsAE+B5pTgpWssLU8pNg+Ce1p/JRQP17TduqQvoahP8pP0yq1j0sFMFtIdu?=
 =?us-ascii?Q?bH1agz5xuglKWhywMABALFerrKvW67fV4/LxttpRg4DxEf5hYBFeK9jT95Sk?=
 =?us-ascii?Q?82q5o2o2/49Nurp0JpdaJDHiUawhHwe1TucSXKZuP+1u8EcvPn7NHs8TYO8w?=
 =?us-ascii?Q?eGcYZMunxyNgCjVfqX/AHVVu/OjnqhtX0YHdN0DlKZwGYJu2FQt5fe5ye/YK?=
 =?us-ascii?Q?pCSeE8T9ImxArS6Mf6LHp4BIr92TAiFEbpWKNsH//kBONu2/OgTH0pg3z3Oq?=
 =?us-ascii?Q?fLtDpgsOBFF7aHBLs4qcYv/mQruHOHCi7sPztUbDHC5hGGgu1z/BK27sZY2M?=
 =?us-ascii?Q?xptJ+69p5vWPrXWI+3F+L24clmD9BkSHUQ5jTWtQvmMjVSUz4gSmoJEM55c5?=
 =?us-ascii?Q?STH7BxkyqT7JBaHNQ/AQvqsSQGjzkcIL125PPse8GF9a0xGHWG5aZAyewmbw?=
 =?us-ascii?Q?x+MNgfmsLjEDeOkiO0dAnTNtwTPfa0uB6cZ+FWvK3XFpu746eWVW6+duXUjN?=
 =?us-ascii?Q?+3vDytN+av7Grc3+HsnQa5icBr4G+w28ZnEQyPdw8tmb905PD3r3VN6+wcA0?=
 =?us-ascii?Q?8KSbHZzM7ZFmqHioGqt5EuG2xTRVE60kbzh41RZNBeTvHyTed+AeLZeNmsG2?=
 =?us-ascii?Q?kOy/hyFbUcE1VCtuKA69lche3O5ld7X+qG2YM0utJe0lTrQwx0wq5RjFZC0B?=
 =?us-ascii?Q?3dH86URwKRBEpAimQMEmePSPxdW3Z+bKywnmkoQPHu1/hDOadRe9DlptfNiq?=
 =?us-ascii?Q?1X02R0diiKTMHYmHOL/kEaZmtTgpvKNdRREtTtbLgGQ7SaffQBJuT+t5C90Q?=
 =?us-ascii?Q?yBFKJ0FVQy6xLgQHsb+FoLJdwAFuHu7L0vDvLiY+Jj6EZtRjkb7jCDLI2y7E?=
 =?us-ascii?Q?kxyRtMOpuYuKO1utqJ2G/OQ7lKYXzCWOm82ohW1J6M4hGube0+RqnjWAoOCl?=
 =?us-ascii?Q?VjbuL4tSXjdliN06Ql14dOwu5GgqbcN86xcDX2iELLW2PGHymPxaW9GGBcvP?=
 =?us-ascii?Q?Aa8kvIWq07YyxfvtemKuNPKeaU0NwX81XuEyxe3p7WBGEVLpDob6DWyeRVKf?=
 =?us-ascii?Q?FImjzzFVJYc9rYeFOVg/k7NO9/fbZQuO5nxThl1cxYtajakbZ1XeVuzrdTBX?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4ee2a6-fc2a-422b-8dc2-08db034983c5
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 05:10:48.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdNZX813qNXvvkZr/zRUXOdmKa/dyj4nJNQ37U7S4m+8+fXg7IY4Trm5eJiByBDkIHrIrWkzhCXiyXKYF+oMvhJHYGO/8E+YJoSwL07N4yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0984
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
 Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix the bindings checks like syntax error.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/irondevice,sma1303.yaml          | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
index eb87374cc812..162c52606635 100644
--- a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -19,14 +19,13 @@ required:
   - compatible
   - reg
 
-additionalProperties: true
+additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/gpio/gpio.h>
     i2c_bus {
-		sma1303_amp: sma1303@1e {
-			compatible = "irondevice,sma1303";
-			reg = <0x1e>;
-		};
-	};
+        amplifier@1e {
+            compatible = "irondevice,sma1303";
+            reg = <0x1e>;
+        };
+    };

base-commit: eeb6b0feb597e8fb88c4e1459323060e17350752
-- 
2.20.1

