Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA65B806F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 07:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C141817;
	Wed, 14 Sep 2022 07:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C141817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663131650;
	bh=ZKIUjUfHQh4yqSQA1JDrq2yWOxQM+mnOxIslzKkhl70=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCTB/vBstJ69PJFUMjQjXeu8SYIxp29LDImyBrELqDyEAeIhmS+9QGRAC+IFP3C8A
	 SWTiqMtJnvBstY8Jhiz46zaqszY0R06bvkg1PZEB09Sujj0P5aEJbDSHi2EqtNuBf9
	 cKHxJOxvCeVif5M47JL1N+RBcWiMa5Rx0JWD87NI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5126F8054A;
	Wed, 14 Sep 2022 06:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03F32F80548; Wed, 14 Sep 2022 06:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2042.outbound.protection.outlook.com [40.107.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794FEF80542
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 06:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 794FEF80542
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNLBmBx+ek6hfi8X9/F5bDLQtp22+rb5AW/staiRStjsNJGUkcOAeeboWypk/iDNOa0/GQi59gPKvGXvsjbqyiZsjJ4fN5fTVg0PwSryjYM2Hhv5VeI4fA+20DBsw0y7QIkYoXyMdZ6DV/oclVKcBives2QFS1LT+ONBBWi5M0PG1UNwI+8fSpr1mrlauRFZJFwqVAzXSfoIbu1FrwocCHIBpd9RKTEFQYOZik19ez8YojVmgGFB1QldcRmJqDxJTObr5d48f2KjvkFRpaB5p8LDquZ1PouBmWEm/bTkEPmxjmoTrUTFt6vX9XqKSfsOUvj/+7Syr1ogP2wWg+HQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDbcpOm7lGaK0GdVktILbqGYRkXLIS46uT4fcyX8SaY=;
 b=UctYVaLbgwJxkH82E3KOfktPk/nIXxnEK5Ts8h5zwSjTvviC9offQfTWblfUJIpq2wAl4RoY2Yjp6Hj91d5SqFeotAS2EWm5gEa5zjM6zddxInphEzER88qWRPQgUWwa/H4SVZWv6+kAvko+zcxGTZ8NVyupKmpfgV3+5pU8kXvGWbYSNS0j8AEjhjLpZsHEpGuhKowsg+eEml3s/S7Jx5T00tqc4Am1x6IuaEgf+33HaVm/8mthliKi5nnJ7iKT5tLl2wgwl8zuJrrmNLqQSr2i99t2Nj0XBfoz+xw7f2VYijv+FAasj2A6FL6ee3IB7nBJHV1bxyDlng0azb50sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1323.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Wed, 14 Sep 2022 04:59:22 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 04:59:22 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Wed, 14 Sep 2022 13:57:13 +0900
Message-Id: <20220914045712.8775-6-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914045712.8775-4-kiseok.jo@irondevice.com>
References: <20220914045712.8775-4-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0183.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1323:EE_
X-MS-Office365-Filtering-Correlation-Id: c9525bdf-0887-4939-8071-08da960de3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bL6kogjthNkbwTSjTvlSL8pzy9WO0tw917YONJ17VYxxw/UTBuJtlkCq8lLm2jxFPiu4AP6CJbtom7njMBBmr4r/UZgET7IE2IIi+fenYQJRICsCLdumaqWe3xw3ZfvzRZUQv1Ud/hVF6L1nnOLRroBodB0iwpkWqxENJhbHXCV0E/rGn+icMvwcgontd5EZoDKBWRv8zV6T8dFpe2R85qdlCulSpj/Gn4OhI6hb766/8Gf/BHXmQdLsr6svzd7bspmLj3PGEyc+omVqVjjaBAvLmCXfcOf2zoCqtWDjfvfXVym7Lm9BxXQpT2492/7EZNQvdrdPV3tuE8hOF4VzbxiisyVmP8LbokRHmtNXaH6PDEtqyItypyj2pUGCF5YBQtVNquLLPCWW6/Yb8iy6dSw8lG2ofCkt8OrA6cBebhwzLXhj9vQCp3Tb6mG9ka5hBrXHI25xWO39I1XkTFrw32NZ7tNgMvQ2fhx6iLH0pNNq2ZOmWBW3SLyXS9FPqJREGX7sniNrwqtNVtMtR0xo1uTXxBHTRjMbjLY6QjQLBUBakr5kdw2lZgg1kXdC0lMEfh1fSTZITBq+YQpYmJUrGOdh2Ya7dk1w4gyxnIGLRptqKIIHSeI0jvbAKNniNjdln/QPWgp1i9XC5jsVG+Ndo5xGlcAsSVR30n2sGl+7nScfu5tgx9DGsR8/rxS8cWjHi5Wuvf9v/3n9rN0xWgVmQm8CAcaGQji0d1CGQBCkzkwpHAY84DLZ+gAMnm4cK82BOlJUwjXectZzei/4iw44eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39830400003)(136003)(346002)(366004)(451199015)(38100700002)(38350700002)(2616005)(86362001)(478600001)(6486002)(41300700001)(107886003)(52116002)(1076003)(186003)(316002)(6666004)(6506007)(66556008)(110136005)(8676002)(36756003)(66476007)(4326008)(2906002)(6512007)(83380400001)(26005)(66946007)(5660300002)(8936002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oqj03GH1IpizZ+CQVYmxtt4L5qyWizzfiLaN2vm2/HE/W7Ea8/835fwtQDSp?=
 =?us-ascii?Q?VzJHYS7k1cic6Jhs+zaswQqFvLk67P6wvxzDTYLQi+GW5RCZGO+uh09rdZL6?=
 =?us-ascii?Q?lAfaFJyv1SUAQox00Ffg3UnoLDK2Gr7ln5tqn4IOClMfj/hW6NQPRfsDPu+C?=
 =?us-ascii?Q?a0A5qGyWmgXWUv6lOwkomajYXHQnSJSSztMxtGGSROhPe4fBzdBW5P+IztS5?=
 =?us-ascii?Q?OiNC2jADRlMMuABIQVb0M6ezZJi/RcZMsXMYyQ6yKPrbvEm0woosvTewF9ph?=
 =?us-ascii?Q?rBqihDxUKD/iUErimBrxDAOulA+irqU4ybSwlokODVA8kEXS/ATgD3wLn8bH?=
 =?us-ascii?Q?/QncB7f6HVNle/XEzORR36f5pR9ch5y6L0f5xNES4LrfQLSmljgm1ufITkQI?=
 =?us-ascii?Q?X0qmfeuM82JO2/kktjvG64Ey2sel8ASKWfgk/Xb+sKeY9N6M4HISLGCtdbIN?=
 =?us-ascii?Q?MXIgHABFWtiHOS4i0oV0qL0oqDVHfCKFhKw3oGEeMeEcdF6E8yioTke2Lnmx?=
 =?us-ascii?Q?CQPwNNT5QqMfv7DnhzygBWo/H3uPwFf9NcDfc1m/mEsEDlyfXaU8/iL4XE8Y?=
 =?us-ascii?Q?82n1a8U0yLfet1bV3tSQJLAq83Asyub47klDIFfiTF6uahxujiWLgjPtFbZt?=
 =?us-ascii?Q?yPnnXy71vTJ9e4bS96Ob6xS7kZb8JnsHJCHpjWTxcTCx2nIAvAglrs8agbl0?=
 =?us-ascii?Q?CZBrJMKtMX+xOAkHmAdFAVA02Uu7hUkYhapg69jmnXH0IgelJ2AZEcOqB5SX?=
 =?us-ascii?Q?dQt7ksOitIkFAeKK4Fd4tmYHHFQr+6czgf8g1a6Sb90m/dyxXHHMOzhG1Zf2?=
 =?us-ascii?Q?v9Ct4mYkn4WyjHGMv5q3uv9F6Ka0kR2pUvFIfagruZexKMKoZmuHdXfAcoMq?=
 =?us-ascii?Q?0Wo+ZtrFU8MxfGX6on1sU/YAZyx7GmTZ+eF+t3vDB0lFalvl5JH69ZHw7Dx/?=
 =?us-ascii?Q?sJcJmv892Ng91DwF6a0j1tiY2OM+ZfQQiCEY6EIp8hzPqEk/nVxaly8KYqH3?=
 =?us-ascii?Q?mw+jwmuX/Tg8nouuYZ/8Fjlqpooy/v/tMqGUXXFRyTvLq68QdPQrgmAgI1kY?=
 =?us-ascii?Q?4sVZpXE03WioxoCmQHgiYfh2wIMi3q+AANgqvWT6ztHtfN1BCM8UBBAKWl0K?=
 =?us-ascii?Q?YJHgFmMU8qOmiYzemXDiJl+xTMUyKOCD9GIpMtNM7MXnyi1NLYbH1yfhTdFc?=
 =?us-ascii?Q?URJyLlBRt4y+yFYCMOnNEqLoXiYe5w5nqhXWM/tx/9CFz5KjKXKAH8pDaFH6?=
 =?us-ascii?Q?k1D4uSMKbSppURjlgJT1xPcZ+ptybmLDYh/YaEnXjbdiQ+jH9ScxCmkWI5Dn?=
 =?us-ascii?Q?uo8k75FnW+zkMFg8W6yr+BV9aKwB8L/OPUnMehNHGa4pJ27jwjw/wNfUPVvk?=
 =?us-ascii?Q?eEqgIo2iZ8smk1w9m365F8FXIGBFoq2/DGWofUoAJNKVj/2r8W06kKftJFe+?=
 =?us-ascii?Q?n7BgYBs66GsHw6iKQf8gdI7wOSYzfcsuiClp6VX3iMMTFVemQnUfd0aEFXXD?=
 =?us-ascii?Q?++v/YLD+fqKzndEGrFAZlmiDZwRY3YNL/AtDQWAAnYQ01zw+tWEfKWczC8xt?=
 =?us-ascii?Q?9PGNUJCIcHk47eakqFU8gmVWCaRh+PjmjghzDqhD?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9525bdf-0887-4939-8071-08da960de3c7
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 04:59:22.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+0GYkHqo6xE3N2+vWq+M8wjKH8t/6eUziHsDvAk10vMW7SOX5LvZZbcOENWjyGNSjn7jfjUoGZWwdU5qKm0TZxo8DMUQDVKK75ZXNN2zRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1323
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
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

Modified the schema binding and added the vendor prefixes

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml       | 16 ----------------
 .../devicetree/bindings/vendor-prefixes.yaml     |  2 ++
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yam=
l b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
index e11e74d367c0..8c3b85f962ff 100644
--- a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -23,20 +23,6 @@ properties:
     description:=0D
       I2C address of the amplifier. See the datasheet for possible values.=
=0D
 =0D
-  init-vol:=0D
-    description:=0D
-      Initial speaker volume level.=0D
-      If specified, the driver will assert speaker volume value at probe t=
ime.=0D
-      If not, default hardcoded value(0x30 / 0dB) was reflected.=0D
-    $ref: "/schemas/types.yaml#/definitions/uint32"=0D
-    minimum: 0=0D
-    maximum: 255=0D
-    default: 49=0D
-=0D
-  stereo-two-chip:=0D
-    description:=0D
-      Stereo for two chip solution=0D
-=0D
 required:=0D
   - compatible=0D
   - reg=0D
@@ -50,7 +36,5 @@ examples:
 		sma1303_amp: sma1303@1e {=0D
 			compatible =3D "irondevice,sma1303";=0D
 			reg =3D <0x1e>;=0D
-			init-vol =3D <0x31>;=0D
-			stereo-two-chip;=0D
 		};=0D
 	};
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..00ade1489f62 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -621,6 +621,8 @@ patternProperties:
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

