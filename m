Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E52687877
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 10:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03302844;
	Thu,  2 Feb 2023 10:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03302844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675329102;
	bh=7emQrOUKrMC1D+Hy5AjbRiAaJQhU7dESKEUWF9dBFCY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AqS8jHRldSeiaEms+LsTaVGKkHPn30OGFLLASsfHY4JJaAodUn0N+uiL9LVRzH19Z
	 zflDHJmqwpvmVmqwpEpVOKEkRCQerCOADc6CtbRvFgatQhJsazasMuBZMe6cmvxxqz
	 O9Q6S+srWBktGq/8mmA0zpPRPQ2b4eQh2tTjF2kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 245B2F80169;
	Thu,  2 Feb 2023 10:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54661F804C2; Thu,  2 Feb 2023 10:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91686F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 10:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91686F80169
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2/+PSfxUBnvjDnqhyISaJPIi3kfcUhp0OoMj9Nye8punEghy6SXENEYu4VjxbqFVo+Ogm34XUDjZ3RjzoG3FZHIQifPYK6ZUZnT5J3FDc9E7Q/qFTNZuwoiEo2NTEi6G/ybeTb+qVc3oTYopnpCUNKRZxRRhGkEIyelPIC7Tvfifhjmlr2ecefN/uCH+7fM1hhu63il1rUj9DhSVLnZTau/RfAmek/AoQiGAZkUqMIm4VZTr7LmHaXNXRiIDdLdgRQVi4VkprEtSk32u0smhTsTyuy1TIEUcHr1ziOpVJTySddThSVZpPi9QBl7Z6HT7L5ZtwV2Q4RMbxzhFeH7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Uhn1JHoEqpi/Ev+RHQ1pQBhcJAzQ0TQLB2eige6WVo=;
 b=HIAJsYCmcX8aAHoPLRVqtZ1J0p82rimuKG6xNLxbbPN9pRL9XVD9SuH0SbiClZ29I8vjSIS6GmYBTrIFxtMMtXdEmlqNcQbDcgFP89P+zCAEcixlAG2rXaQTwYp5OBfnocbz1J8Qk4lOWQDhQrq6tms1EQ4DS1FVpCcmVE8tQLHMmLb9SfNt+kuBx1LJJiQxaioh4cGtYgvLzWtGxYPSKDQOC014eyp5Rhepq7X1KSeVNxFb9iGDRZb/oVu/XL+L3ZqgwYAk8PviMvlpaRnhyM1ZZCRmTqsQ1HqUgwQowagkJ9U/n0wdKiMjdgs/UFIOZd+iRujENoqO0FKlqvWWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SE2P216MB1943.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22; Thu, 2 Feb 2023 09:10:25 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 09:10:25 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] Fixed the schema binding according to test
Date: Thu,  2 Feb 2023 09:07:14 +0000
Message-Id: <20230202090715.18384-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0094.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::9)
 To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SE2P216MB1943:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e40c9a-a298-46ee-e4b2-08db04fd5231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4ajiNjP/zO0VEOPYnYF0Tb/b5muJKRMEerydPNZx1Ongir8Bb5muBR5/l0hrNP6wFl+OWJO1pSHvbrrFV3qG8k0ciEEC76bkoGvEmfWxiditbScgPrvaOXYzyyrX/FKdEloZLPZ8X47CIw6fPoaBQl9aBu6mmxaA6Ucs+sqGG+9WmM8mN6CYYiQ05wTLzKsc5LUX/9V/vcWSSGSCYDv1BDbGTU9MiUdBotsnXDzzvD5XEyzK22FmDzK7PVMdq+NH2QwKDI06XP88zAf1ZlGXbfmW9QpVwIU/YJSHQ63AqJ991ccffbVGOGuVyrK/X0NBenp2EWjteKWY8aJqcCBzdJqAVY4dt0HTxRb1zuShK3EVZGBPE4y1kkmWd5CLiP8aZ/Mn+X8Y5Yez5jZUbWsthE9Ppw7MLq1zsBMlZd91sFf63G7EYbuNXgvuroqrnlZEZzf3UbXlhO9eYrVhq5kyVhDzdpKyj/raLYLum3/yDo5ZHoSy2p7GC4nWPtgqRsL8inxdXaPN9gPR0TwNPcM1ySk4HSKDcfRF10woUVfHLNr/zzL1R7H7OjRCSfEqltLeu1UtTVt1OC0iX/+Rt8B82tRqpKqGs/CHOzE1PEpgFg4GKJgd3DO3sGClfIr8s8NpvToG4M2L8G2DEgJcInkX0iC4zh6qlMuxV6tWhUfhvgBxsp5yG7aka+daY8Djs8d5UTulYRlhe/wUbiFXdu+5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(136003)(39840400004)(366004)(451199018)(83380400001)(2906002)(478600001)(38350700002)(44832011)(6486002)(38100700002)(41300700001)(36756003)(52116002)(2616005)(66556008)(6512007)(66476007)(86362001)(6506007)(6666004)(26005)(186003)(8936002)(66946007)(5660300002)(110136005)(8676002)(316002)(1076003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96xSYwvmr3S3l/c+oelSQBarciBe/51hznoqP0e2pWVV4w8U3iN8UQIg9/Vh?=
 =?us-ascii?Q?ik7GhkGOUUc5C2Mbah9TmJq3k/RRJ56BRffsT67hBewi6vIfSbb4fz4OOosO?=
 =?us-ascii?Q?YfQpEnL+Gw6zXgdwaSpr3L4AzsiBPvWgDw6CizviRxOWItLlpoJuW70HmFJF?=
 =?us-ascii?Q?swEsLnr4MiQQ9j3ukcqQ5Cm7dNTq3WfUTX+d9A9ZlFNosgTLKPXhHGF6FeiN?=
 =?us-ascii?Q?If0oqOVscG0zgNQyJWU04cjbPAyz6/vf3yiGo/arj013Qtr5UkGn8S/QV3Of?=
 =?us-ascii?Q?CQ+9zpiPCvipRFtZ8etzsvMXwIaPVIoQ/kzSqxrmzGckoH/oeow59zKym8bI?=
 =?us-ascii?Q?G44+lkoLXasahcJacn9fRUhxZIPhKMAZLclCD4hKbWUZXjmPzxUs0Icco4WL?=
 =?us-ascii?Q?c0C7Npp2TlGp2Ghh4+BtvGF0Gnu4jfnAOY84t5/W4uKCvu3MHQ5ibaOwV2nS?=
 =?us-ascii?Q?GoNfSNARNCMlhRzty6c5Dloa/56t0GWOX3CpE11nV7KIUlKNWFayfLb/8w3g?=
 =?us-ascii?Q?2nHokHZ80xWOX72rJNSoEC1S0lWXF8ddp15zicAOsfoRWKF6VCRHAbXhbFlW?=
 =?us-ascii?Q?WeU09EDNr+554fL30Nng1Apv/4nGJPzR2ma9ijxgY6/zGZLNuyBhoZxfnlEN?=
 =?us-ascii?Q?biTIklAI8qES6JUPJ9ndTOoyzRthO+Uh+MiYF/f2faGePXShlF52xx+lK+SK?=
 =?us-ascii?Q?+Mm0EDGMdqo4vS+1NM++8IxdfgGoazZvMPDEy8h72DPAWKEJttue9qb2MPFM?=
 =?us-ascii?Q?Vcpd4WzB38oiKpTjVDY2LpNyOIrLSIJ6ZoNCpzz3u+1REbs99jN70u3sjpln?=
 =?us-ascii?Q?CvNgHKyUxe2DPwpqnZUUyqiMAS0unnEyXlWdmvqqZMJfBWJCQ8P0X+UfLkGo?=
 =?us-ascii?Q?XLDe/26aotOg7smpehLkhk4mcmo0S6x1HvxMTf9mOcSsMDW8+FkjCnAzdqLe?=
 =?us-ascii?Q?bI/ztoi7lYbg5x1EQYF2j+KC8A01r4EqcC9LpLztTKz63aofImUuaY/YcC9i?=
 =?us-ascii?Q?SKRaEshjEIaoHooi+9JC3yUk+8kBeVZ9AJh9CuY1XrpOUx/wg5QcvkGDtXYt?=
 =?us-ascii?Q?lNgIUSHTr98754S/E5BOmiYWlQOgdbTi/UMILCDUYtqDYXmGYdqkPuwKlJs3?=
 =?us-ascii?Q?XOVAOfadSa4T/FzYFXQAeiDZG0zgkrRC4ZFJoV53oyF46+lmHXc/VQOTjJZX?=
 =?us-ascii?Q?Ql5whz7GgAS0fI/DIChtgILnBBDsOt30AQQCnNxYsTi++gVpcHK7NE/WKdwK?=
 =?us-ascii?Q?9Y37tvYKoIXixbSiGoCF0OMOJBtiyXMLOROgpuyL0ksveinOocoUf+crEhgu?=
 =?us-ascii?Q?ps/nMeHAgFG9kg8i4HPY7QuwdAej8s47h7GvJwOXo1wsA7UjYzpXAOlMkTVw?=
 =?us-ascii?Q?uLkTT0v+VToCuXVtfgoyO2jYvNKw8edrN4huYtrgO5vTI0x8C+wIfhvXCS3I?=
 =?us-ascii?Q?BDvpYjJFAAnMHZQtcvp1eaC1gxvKFI0VgetLoDNrqCyinyjj+6EVDqhBQJNG?=
 =?us-ascii?Q?x5/dUTpludni7gNSB33IzdWOSaLjuYB8rzgoQ+QaVU0rhNcgMAS4WteUwUSn?=
 =?us-ascii?Q?JJYcFqzEj3sR+Os268OXE/2h9Hs/RMWq9XGlG2bTPGzoFlf/1l9AGfziS5JA?=
 =?us-ascii?Q?1w=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e40c9a-a298-46ee-e4b2-08db04fd5231
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:10:25.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCSUO6cCb8wL9eoiFkng29ByfdY0I+8M3ylCxAZ6MEhTq/s8fMJH6E8bYDC5GomlI9qNlZVqJ/zsJO2qxDFqNBrg8/hMxQyBaBZcgR6RQQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1943
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Modified according to the writing-schema.rst file and tested.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 46 +++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
index 162c52606635..35d9a046ef75 100644
--- a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -10,22 +10,62 @@ maintainers:
   - Kiseok Jo <kiseok.jo@irondevice.com>
 
 description:
-  SMA1303 digital class-D audio amplifier with an integrated boost converter.
+  SMA1303 digital class-D audio amplifier
+  with an integrated boost converter.
 
 allOf:
-  - $ref: name-prefix.yaml#
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,sma1303
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  i2c-retry:
+    description: number of retries for I2C regmap.
+    maximum: 49
+    default: 3
+
+  tdm-slot-rx:
+    description: set the tdm rx start slot.
+    maximum: 7
+    default: 0
+
+  tdm-slot-tx:
+    description: set the tdm tx start slot.
+    maximum: 7
+    default: 0
+
+  sys-clk-id:
+    description: select the using system clock.
+    default: 3
 
 required:
   - compatible
   - reg
+  - '#sound-dai-cells'
 
 additionalProperties: false
 
 examples:
   - |
-    i2c_bus {
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
         amplifier@1e {
             compatible = "irondevice,sma1303";
             reg = <0x1e>;
+            #sound-dai-cells = <1>;
+            i2c-retry = <5>;
+            tdm-slot-rx = <0>;
+            tdm-slot-tx = <2>;
+            sys-clk-id = <3>;
         };
     };

base-commit: e33d4c4f1e2de74cfea556d75eef0886d5b7d472
-- 
2.20.1

