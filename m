Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B2768EB53
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:27:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50741850;
	Wed,  8 Feb 2023 10:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50741850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848422;
	bh=SIMC7+49ZqM6nD2rvEBlAfSchA16b56IHvuluIsDANU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I0KtvP1QkkneJEpIU7pNpl0nzS+lgQC26wAeYURsvcMSKsCGFtFT3FqRbgw3NPydL
	 uK+bxjh+vkQITmet2oWfHk0cLNJuNLpbOXc2MEweJPfEjLyiW0ZgVMXPCBP85JDXd5
	 LntORgrznTBropIjs3UOlv3/ipTw2FRobg9UCwYQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B13F8052D;
	Wed,  8 Feb 2023 10:25:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 006BFF80095; Wed,  8 Feb 2023 10:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6367F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6367F80095
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFfLwOXBHIW+rChKY3cdxwGPOuBlRrqAWabfuTgm40Yrj+gMI1mZZplWd4F7CPdqag8+GLxOWqs6Bl5Dao6F9FPlRgKJxl/96joI1IcfWzkMdtZEaWehMdfVm5WCjQKpSRcVzgmlWHaIehZpxKDzXVLr6MspDeeEqcjcJSpSA/sIl+Qp4TYlMirwnxa5FqPT4y4hyjb56klaI+J4rHZtfgtZ0Vu7mAq6X839dvbHQkQ6hzhhRYJ4k/ot+krBVELEsE1SBxTTIVmQVio4OqLbOJxwCAMi9LWTz8yUgn+loWmZ+QZVRGKqwxhOYOBBxB2p8EBgbuUQ1ZkzxEkHzjEukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohKQWVeGchzi4aIlwa6Oy4w3fRStorCYttzbuOMWDGQ=;
 b=AbgvV2n3K4ZQL3LUHnzuf3ukdVyXtgQ27JDQZMwJpi++KUv1ffKZ2ciR86eGDwERuiDk5yXrS4WrOsLoiucabTwHpFbVzL4x7T22cp0+mpTalRL7QTipVD5oLSd2X5ur86aLibBSpgiFI1tbDE5Fi15bEtpcIX4dQB1J1wfrZuAkrm7xRHWttuj77iDI0FPiEpsfJa2F7YBlqzvFTwJa5Ybbql9RBjj7NNXoThP+Ew7n/2tzLDGJJyYKv4m74xvT8Dlca0eT3hWoNBwsGLFIvbyKbVuOBfMPLP4ieIr+Oyap23SEsWNLC0gtKlvx+FE95BKCtohIToam72QAShSHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB0228.KORP216.PROD.OUTLOOK.COM (2603:1096:300:21::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Wed, 8 Feb 2023 09:25:03 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 09:25:03 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 4/4] ASoC: dt-bindings: irondevice,sma1303: Rework binding
 and add missing properties
Date: Wed,  8 Feb 2023 09:24:20 +0000
Message-Id: <20230208092420.5037-8-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208092420.5037-5-kiseok.jo@irondevice.com>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:100:55::32) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB0228:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf9974a-6b8f-4530-449e-08db09b65bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OxurOsTboVZBaeLCK1I8fbAYMdwmMqeTXSDjsVMJGHoe1u70MY2PCulzraq5XK7G7DXtF3+/n8eRYDgK1yH/SvCpfic9k+qIzxmqeXAAZNHnEZTdBBHdEYk1ShqsN1NR0f9JTsfXEAtwbjgVmJ7qUFZFRdPQqFwRoBc/DyKsYskovvUa5T5cUE4Z3vA4ue3PuOo3dQgNIlrBoId1/mW7fhopeQueCe54JBXH9VfxrdXHHyxeSXdmuOpLyD7P86yBm17gLDmwynsVOG5LqGCbneS8dTTFf0pmVYJEBD+oERFxQXo4OlLZaDVXoPdSBVxzLWwSMxagAJU9QI65aXqU0uxaBjfShdt+mRdIWdcBCfucHeDbng4H4GZaWas05MCNVuKoe5ZwHkbsb0w5sU/G7I2DjGicpJ1G22HNomGhe6I/yBgmU2YY2XGGyLnPERylOg87AiOzy6C7XzZO6Xt7w70hjOdHdGjzb10YLbjg9u6M6nqKIpiC3fCF/U5gz9PPjaF1j2UOFoled1GGoJ6s+gtkzaSDMBqDqTVSofgvvSObMfPVBUUEUmboxlG+OlOSpZMBe3E/FnKd+91UgV0J9x8i5XzRkNjewaBx+z5b+UHIDyUqOEagQSraW/9fJueJaf5GdjJC/PgMLpL3xqKML52r/xa6vUA4IdR4HiUcD+uye3G/bu32ccO0FQ8sQRAZ9W2BmMNmtr34URS7c6JADA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(366004)(136003)(39840400004)(451199018)(2906002)(52116002)(8936002)(36756003)(44832011)(110136005)(5660300002)(6486002)(478600001)(316002)(2616005)(38100700002)(38350700002)(6506007)(4326008)(8676002)(66556008)(66476007)(66946007)(1076003)(107886003)(186003)(26005)(86362001)(6512007)(83380400001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4voQQ4TSRfQ+C47FTrocsJGo5B9TJu4tU27MY/VCNe9EF98BVaksKr3UJxf1?=
 =?us-ascii?Q?PzldMtrfOsrZfic6HUQucdTBr3HCDEbxqXbO0FWNz1/XiP/oSxUyA1K24qCx?=
 =?us-ascii?Q?GUjzcHrzy/d0cy5Kuc02lzGnpCmXACiWe7lu4zZstvaGsdKZ6mHQ1ljeK+2q?=
 =?us-ascii?Q?hf29yCFJpzfq3FLkmQduJAA23wJ90yqidgmbMIvaH/QupWVDBwASpUsNlGDx?=
 =?us-ascii?Q?uy7zhNynsiuE4/6aZJTA2c5EC50/uiJk4k987Xx2YD5AGC37hOOlrys7nSV9?=
 =?us-ascii?Q?8ZL4vROrDCNwGZkWt4YY3dX/JuTUz40UcK/sijJ/F64Ii3FZQyySE2BUs1D3?=
 =?us-ascii?Q?fV1s8Gqxb4LciyeF4uYsVdBSMjZ3/uKNjRJPoN4KPHJI4Dew1SwEfoFdnGeM?=
 =?us-ascii?Q?kqA6iJB+hweHzpKJqaFbPvqpf8LDRMkxotc/2ks52r712cpgBQPZiS3nCS4d?=
 =?us-ascii?Q?PbLQ5optj4gyKXstVke/22iWBb0nAdH1riVssQ7mYGT2MmityPE8cANNugEL?=
 =?us-ascii?Q?UF0iziY9DdEjOAfxSBFuSfcUppgDoWFZ9D+uC2zTc6+OVbNkuhndbFsaIkil?=
 =?us-ascii?Q?KQ88TWcR8XRTBFH1FJ+TjiWXNp1+pqG640AAwroDDBWArlozAkQIIpCg7OwB?=
 =?us-ascii?Q?r0VXP15PXsBHJ8EbhcLDbO9l1rmtEZAK96gauuOmQ25d6zfRH1USxBRGGgF8?=
 =?us-ascii?Q?w4M9Eu0cCm4D0qLndk4nR0ZAs3UOix6hZfRHY8OzX3m0TOboZ1iYud7bBsD6?=
 =?us-ascii?Q?35PZEiOaioqDfUD4Fh9sEWkUPBbAQxRWdKfvNYXj67muYfN3Uf3a8hAiVmaJ?=
 =?us-ascii?Q?R7T3gAio4LWGcXomSnrMKWvfRbnSlHyQCxrq/IjtDpLOyhWnMPiHzHkiUqOL?=
 =?us-ascii?Q?YtN7HNoUWkET3dw1iZcSAdi5LBepwa0Z877pZFsWGtu3ltWOXFDwja/BmswD?=
 =?us-ascii?Q?ME36/D3kTbppsRAoh2cWijd8oaLuJ6OrhAdX93GOlcjIvsGz105sfU8xNImm?=
 =?us-ascii?Q?54c86FIk3lejsFajZ+eB2ZrcQLcECFoC9W4Q4bPtgUdyZRJ/5SadoQm57tb4?=
 =?us-ascii?Q?33HWq7nNga8o2dXv/dKmxre7YQtSUxX0I13XmYRqahspvz9FXvk7VjLJLl3T?=
 =?us-ascii?Q?XKRJI9225CZWyr51K2+4lwxZEIMdOwOYcpQhNoPiVYWoisnTny4jasFoxUsw?=
 =?us-ascii?Q?TIoBPFpqLEE7JrPUE2ryFmmcGTUG23QHtIawkioB2X71+xvg08MWBythNjvU?=
 =?us-ascii?Q?KGrDzQ6zqFOBsZaMfdUeH72NfnYfYqZnVd5TlyVenN91LBn7HerJfrQELsZi?=
 =?us-ascii?Q?prfDHiTYAr/PK6H7rHPnbD3Ho3KzhRNJ+EB4Q9gGG+ogViH8iWeVjZyHzLt7?=
 =?us-ascii?Q?47ejNqnp5DNu+MWJsV4gasSEHBfsJ4Gc8N+WWOIPZ4JxyChSFO+J6acES32h?=
 =?us-ascii?Q?4u8euWCpRG3yPuOEKac/E4EoM9gGsH8MBSpofGkPwvdm1CdZYn8w7MFptiOD?=
 =?us-ascii?Q?Hq74eyR4IBhXgFIsQ7UDVrk/wvYYUcLc3sU5gqJUgJYCh/sGrgpeZxmmKN7X?=
 =?us-ascii?Q?QgwwhCknfO1RCAqdZPg54j2DBoogewVJXLCfLfggLiKMRAMLzx4Kw9u9vIMO?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8bf9974a-6b8f-4530-449e-08db09b65bbb
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:25:03.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lYS7tMSdrNc9joiiFKMn+eUZLSEuMoYMRzT6an64CmEOhLYvg8NQlFd4T3vY1tQCmJMvnHUkJxPza6V5V9OcTQiE0DjZBvz02O6OyHopSTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0228
Message-ID-Hash: IKVN4DQ2CYCNVZCKEQHWNBQICKDP47ZE
X-Message-ID-Hash: IKVN4DQ2CYCNVZCKEQHWNBQICKDP47ZE
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Kiseok Jo <kiseok.jo@irondevice.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKVN4DQ2CYCNVZCKEQHWNBQICKDP47ZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the missing properties as compatible, reg, sound-dai-cells.
And then check this file using 'make dt_binding_check'.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
index 162c52606635..b36c35e5da1a 100644
--- a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -10,22 +10,39 @@ maintainers:
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
         };
     };
-- 
2.20.1

