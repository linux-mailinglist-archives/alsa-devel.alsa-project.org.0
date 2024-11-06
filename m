Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D393A9BDAC9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 01:59:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8AEF54;
	Wed,  6 Nov 2024 01:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8AEF54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730854768;
	bh=sZPujshf6OOKp/2EfMp+4KCbFvOanXdHwGHkhz/ug44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H5u5O0QsG2JP+88l6D/RzcXry7J6R3AKs17FuHQJxzf6waeYSkYUR9KSTlQf0Y7gO
	 7y9JR2jUynTxv0tyeyTBZtcCA6zodPkZ8ftU1SEZfCfhZ4q+v2vsGm1ew7bHle9XGV
	 2nFYUOX1lcSZrjdAjEXyZzuk5hWVb54NYimaJiK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6495F805D7; Wed,  6 Nov 2024 01:58:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE44F805E1;
	Wed,  6 Nov 2024 01:58:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A8CF800C8; Wed,  6 Nov 2024 01:58:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87F0EF800C8
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 01:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87F0EF800C8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL+Rrp1eUb7VbyFE/85qkAVV6dR1UrN0uQ1mzg1j2G8wyohbpcgXUQSoX3jmlh7RUsbl+MMwC3+2pTB0Dv61FH5XSmEOR881Vsbw8sF3fb4587xb6sRNw5ggXVzaBlE8dC4oG43qjCTPFc6zjbd/JrygIpGBfEVGmweTttIHkd1TpKQNJi7dYcdjv1H20xyobepunQdvEuzI5rzLFzo0ZCPVLH6xhYzr/gxrjz83EiS9qAWGladrRCMhq2EGcySlZUQNaUez5NLuh76mifP16JD6QBN6a18EjJoSTDp0aWKDdKEOuxQs8l4ILRhLOZ5E0e4fj2TkxPjCXsCK29eeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya/KN9LtJA+zqNLwsdZkIpFd+Xl0O9WRcaegL7vNjeY=;
 b=r6pEjoAbWUY3Z3ul2yKZSULLOxWYRO0xmd67h3mFmn4bu3khAHhGIjeFAvP2fcy11x1GVBrq0XWkaoI0EGfBX4PDecjspJBnQJFp3weS6sGAzV/4fnakJYLkmSccj4R4iZ7YNPxkBm8YM3Wa5Wf8xHVaB4JZ0xNZvLG8pn82CQtUPWTcEbdsg44bj7or1gMIbfhHgzCrbCuqqBbBjneAAK+XYauguk0AjlnbWh/TxrHzND2ytu6dnDURMjIHkJmSUPxM+PjehsaRmZKS8E611OYOjtPIpbpXdp5xfPt1s8GOUUmUsd++nF9ttjLmMX82si33LQd7zhgv5rSkkjbJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SL2P216MB2112.KORP216.PROD.OUTLOOK.COM (2603:1096:101:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 00:58:18 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 00:58:18 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH RESEND v4 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT
Date: Wed,  6 Nov 2024 09:57:59 +0900
Message-Id: <20241106005800.7520-2-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106005800.7520-1-kiseok.jo@irondevice.com>
References: <20241106005800.7520-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::19) To SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:14c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2337:EE_|SL2P216MB2112:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a79153-e706-4a37-9a82-08dcfdfe1a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JDyGNafRt0xOSIWoOZoY/ehe7iwdMBZJMucLHb0qFXEyp2QhFlcldCUgfSmW?=
 =?us-ascii?Q?icT2kFYDxqUhj7vJHUgagPqOfCsOBmQgS999Gf+/aGl/IBFH/1ocqDBG3qQx?=
 =?us-ascii?Q?aCNH16nbZ07CK8fDlNvpShBe80Vgr1NAsQHwDMfQ5+EvHQBsX7WgKbOIbfRQ?=
 =?us-ascii?Q?FbQHxLV2ZcxOsW5QuihrYJjnLLcgsj9NM7w87iRz2W2A3CHsuvad3HCjwjp+?=
 =?us-ascii?Q?fHMpb+5BJBXakVTWpDDIa/I5/efFq46m3CzSDb3XhVZCppMpUlUBUb8tpbsM?=
 =?us-ascii?Q?/IMuXHHlA8oqHdpIeVk8Daj5Y89KkH/dCPFMjErZBHIkMr7ThdfHRSBD5fWg?=
 =?us-ascii?Q?HpMqdGAZKgwdRnaKaKFIG/mfwODIVrNw3OXceVZRPUOJzspVrJrcOh9CsA+T?=
 =?us-ascii?Q?NKOBaLPIOOHbEOGByC7a1kP+KyPq0M/Xxp08FZU8UC5lPCc612a1wEcSS4el?=
 =?us-ascii?Q?wbxDZmyVOdsot01U83W0gTFf08QOMA9QxcDtI+IpmKXd8Pfp8itY4iCU6DNa?=
 =?us-ascii?Q?33IXLANwjETn41Oq2ogdT49O7c1xVMYsm2sF8z1JkWpxLBClvl0wVf0BQQ62?=
 =?us-ascii?Q?4SfmVr8wDfv4A8LK6Fr895VRCm859MDTOM8nhZ4CIoafJy5tYvZTedF/qHJ4?=
 =?us-ascii?Q?2T5G3E0zP9aDP1LZNK2Kj5rcNcBfO2c8wwJpHww1Xj9oj7H6jd/qgSUwsiqO?=
 =?us-ascii?Q?gVBvanLiP9Xbr7Q1hHW3vX9Cv9+WkTIimIcKs/ckRC0pFc/mjV/qojunIYrv?=
 =?us-ascii?Q?5kGkK9xJWEqQ/+shiHfWbyTaMjDwSiKUPhNwfeK8rSudbqISMoEWaSlYRZ53?=
 =?us-ascii?Q?y/eVwYmdAeBP4P7qhiN0ZZmlV/riWqCv3qcN+0luQXgOBTo4TFPLaM+Vxl9D?=
 =?us-ascii?Q?AAdzOoGW9yzotNZmnyQgOQF43P2d0cGAbYW+Zw9opFjVRAnzWz/biG1tMMAR?=
 =?us-ascii?Q?D+BPc2FMD4HCkxs8FTO6HKq8gC9pk8wXNbsJxVABkXCoF5MJKdWcLK0LhB03?=
 =?us-ascii?Q?XijcIyYQTSZQ5apwqQHZXEasI+bNx/AbgqcfIcIo+TwIgKMOE3OubwPuMv/k?=
 =?us-ascii?Q?wFcIPXupLl7nb/nHAioTvOAOKlUZUDPUOxe9IWNEJ2YbN6adr6kxO4YE72SL?=
 =?us-ascii?Q?R/mq2ZIhMN8GUKcxVB/kEvhum/IWroMo0hWip6NUnXjusrtGKgjb2PBHB7uy?=
 =?us-ascii?Q?3ryeBf0XyV/PgOQXj+j36SUiubJqOdGBtlwhrZ/WrH8a1xTiID3kqyyJ61Jd?=
 =?us-ascii?Q?RRSSFA8wSZtT0zI8peyBecAKHBpo0QO4jR8YGq1s6do4kNfo0BJeULsUEGgq?=
 =?us-ascii?Q?Z0XEecBqQJboQGw7NWv3UjnD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dLGaHqVWlfStGd5Fm5aYD81a7Ez0Stf9xp7XB3fCfjZon5N/MORlZUFe1xvw?=
 =?us-ascii?Q?DrMl7Pwe7Ry6AW7DDWCnetK7lBdge/eoiGLXK8yVkvbt/je2YfxC36EbaTsL?=
 =?us-ascii?Q?DbhCOq3rWZbjxdnW0q+flBvqn1tCGjM3BxVdagB1FqURYDRvA89gk5Qcxp4d?=
 =?us-ascii?Q?a8QW3HUe4rz967p9GY4iSa8zD9HLrNDocMufzQmg7yO8xlPqe9L0NNVA4fGR?=
 =?us-ascii?Q?RAixPGorZeXhZ9CzaD8IKkv6UQ2mWFnC0Iz1k1GQAD6EAswegaHbI08r+lk/?=
 =?us-ascii?Q?dM+2d31JWf+gUc+J1uolCtAgWu45tS/Vm+oVAu5XfxxUsmq7mbjFN1jLkNtS?=
 =?us-ascii?Q?eQAknPCV2iFodL/zzMYMzaVrwII/7IceIUt1bmiKiWGomQ7fskWeX8tQ6EzU?=
 =?us-ascii?Q?tVFThFsESMKu9ah3yOsmGiu2WGZdxz4pKnAROWC1iFCN3zy1oVm4p/IuBLLi?=
 =?us-ascii?Q?lR9TmKJ/CJOI9kpiHbQY6s8ZNN38vHE080vFUpXKMtdUOZLkFjHlTkxWt9bX?=
 =?us-ascii?Q?97ZfS/3Tn9kPHPPSNF13soz4zl7yiN8McF6jhNjyMK4y5t07+vcBjQmPLSl/?=
 =?us-ascii?Q?lc+GR9B7/EFs5ekNUFDbTcrmXPVQbbKJs+TnfbDJACGjIhRWsRs/WwdGvU7t?=
 =?us-ascii?Q?uHQ4TjmfAFX8JSlhfCM2FD3GK5Lk9Q8YdFivAWB8AZ5vEqPzrFUt6YGu6qJ9?=
 =?us-ascii?Q?f+COqo5x9NyUXG91srph999CaQ/tAOsZyZCi5gqTcDu9cYizxag0oDW9rwDH?=
 =?us-ascii?Q?E21Msq7LadQ/upkFl90J7dlCXvPgBQXr9Vhi/ufVH+4x2NwaJfjARFPqEGr+?=
 =?us-ascii?Q?x3zeMGH2XFw1H0oBlE0v/zLMSZc+wx+JY2Y9uInudg61wRwKD1+hF3E+EwSm?=
 =?us-ascii?Q?zLeS+nqvpkvWLLStPKVQsXPEXOTOrsCxmPUhZii9kx7W8HOibFgKJUfcRf/Z?=
 =?us-ascii?Q?7m326EbaaubRWVGtxD+QFVEOSTZTfDSn6gGS2MmSM924a6cQnffcpIty92Ew?=
 =?us-ascii?Q?UIeZB0SXSD8r0J8pYHTqtCUesylEYVkNrhedb5wkttQPwqLCzmR+XCJsQhqs?=
 =?us-ascii?Q?aDFN6kNfJrMGFUexKOWHousD0ptBx3Y+C6youA55VqqaeK2kAFmvTbEkOUmd?=
 =?us-ascii?Q?q+nv26syiDmGFkYnzjAtxqSf2xr8OK8TrUwW5ze7AyRb0R/35nwwtk72Ggol?=
 =?us-ascii?Q?VV13Y/XqcdRROvHnkhmk/iL6hyovhgOtI+kMdoqizlEiC2YDsgkuMmIADaCi?=
 =?us-ascii?Q?ENpqAlX7sHfALKd6ENqolHib8O4YiQzSLlPTXSWFlQVfzWRlYNcy9yDyc89r?=
 =?us-ascii?Q?gwZ6zN02S/acxtD8j7GHSTLEeFLgPn5FoWxTM+RXTZIO9qtIiFWHRzXxOO3K?=
 =?us-ascii?Q?QUM0RZZLEI723I18HJSORzj+oDKt49iWWA8fbt0+UfW1m1cHC9b8Nd880sG1?=
 =?us-ascii?Q?42jTIXHYqJk9GU6P8o/Ec2/nTVxgY6vGS0eg0ka7c/MaN8V4PLci9yLZ/QCq?=
 =?us-ascii?Q?Am7hI5HyZJB1OiMvzIUFzGtD0iYJWhPWp5j+zFuNW8PIz1nAidvx+tW1fAWI?=
 =?us-ascii?Q?0FJ/0szx63JWzbziumw8BwQ8cbxiXSr5EwaDKY4e?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7a79153-e706-4a37-9a82-08dcfdfe1a57
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 00:58:18.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8NBqgXimsXlVKjusocrNYvaK9rdLYOHAxm3BgdfHekfAVxRXCyLGr6wr62jqbPB6p0bjt07o8J9Z0zuoFb6TtxfeZ+1Z0HFwlJazGnLwGwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2112
Message-ID-Hash: NYSW47LKKZM3FG2SA33U3HEUN2CPTI7W
X-Message-ID-Hash: NYSW47LKKZM3FG2SA33U3HEUN2CPTI7W
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYSW47LKKZM3FG2SA33U3HEUN2CPTI7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds the schema binding for the Iron Device SMA1307 Amp

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1307.yaml    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
new file mode 100644
index 000000000..1e2a038d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,sma1307.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device SMA1307 Audio Amplifier
+
+maintainers:
+  - Kiseok Jo <kiseok.jo@irondevice.com>
+
+description:
+  SMA1307 boosted digital speaker amplifier with feedback-loop.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - irondevice,sma1307a
+      - irondevice,sma1307aq
+    description:
+      If a 'q' is added, it indicated the product is AEC-Q100
+      qualified for automotive applications. SMA1307A supports
+      both WLCSP and QFN packages. However, SMA1307AQ only
+      supports the QFN package.
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@1e {
+            compatible = "irondevice,sma1307a";
+            reg = <0x1e>;
+            #sound-dai-cells = <1>;
+        };
+    };
-- 
2.39.2

