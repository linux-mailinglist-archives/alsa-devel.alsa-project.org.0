Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECD2662136
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 10:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE2781D8;
	Mon,  9 Jan 2023 10:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE2781D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673255776;
	bh=1Qa3+2GkBbW9EfG6aEy7ULobdXNWd+HsJlqr3jL2HcY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iMTNEmrHfNjF0HUHcrHpvKzq6B0+FtFT9F3RfvSgGNQPnSfo3Fu7Z/Tqs30m2HBoZ
	 6426boU/61tijW0b0rLGk7TXsCMFoQh9x8m6y/GduTL90i8PBxEYdH9hsup1G2LVSj
	 TP0QZTtpAl6QKtLELkUX3mAspoRxqCACPi1ZV27I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7668F80524;
	Mon,  9 Jan 2023 10:14:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14EF8F8030F; Mon,  9 Jan 2023 10:14:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2070.outbound.protection.outlook.com [40.107.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4F3F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 10:14:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4F3F80245
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X68OPrt4rHBAD2d+rX35qzH4X8Pl30kRJzvPUygSoigrw9nIESxova6Hv/FxX8OG26SBkt2AQUx/y3xDXP9uqZIRJiL1PqChZ7OBG90x0Ff0bOwlfVdBFYYra+u18z1x9Stxk4ZMms+BBYmh1NGyO9VjN3OMeZjtAqNHQNbdr86P4CzA1iGqFGSapePQJ5Gy66wFbcI0Rf6flm42LBdiXZqEHOUq6vJDHdKvp6R4ZxL42+ct3KMlpvmcAw/a4uJkLc6WliYzecMO20gWG6/sE2dVCnZlnkKW/omMyK3idQAC4oQGm8QJbJKaTCb7NkNLI87kOHHe3VimufFABPX4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYbvXoJ2XmLdIJqD74b7ZIzghKUJ3PhvxbyYUmdgF2g=;
 b=hIVwdsV7gEKm57kmtN6ywxHkDmUS5gkexXaVCdJco/jwZmj4QIEM+e9na7nhSNilw+LB0jCtOhoIHCruuf6zABrK2g6+3NRUvrVWsGj3N/Iu7PTgvNYf4TDPRzgsxRIAdUEONjS4Bqu0A2kxtv2/iZiDkZQNaLJIXjEx96cxzPfqgCIsMLiTISea+m/P6Ohic/4JtSOcf0PS6X16lWBkmq8IXVZuy3OhYYwEyUN1lKQCNa9Js3hTZn/SZoO6lH56q55fg77NBRKV0+hHj22EctYQMvk7Nz0TMDPqYwd2cWlBElxBZO2cVuFO2lWwU1aVweUA4th8Mdcq3EmGbuLUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB0800.KORP216.PROD.OUTLOOK.COM (2603:1096:100:12::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Mon, 9 Jan 2023 09:14:35 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:14:35 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Date: Mon,  9 Jan 2023 18:14:02 +0900
Message-Id: <20230109091402.11790-4-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109091402.11790-3-kiseok.jo@irondevice.com>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0115.KORP216.PROD.OUTLOOK.COM (2603:1096:101::12)
 To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SLXP216MB0800:EE_
X-MS-Office365-Filtering-Correlation-Id: 965a4975-2539-4e5c-0e38-08daf221ecdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJjlwO8MwWMfpHWwciW+Kt13zQOwi5CO3/7ZOmE9cE/q36ev97Vhne7XSFmSRTNIP9SlkbdlJ2QA288cEVZvPEMiqhAW8utT4bzPwfO0DcnhbAWKQREmqZBKoyFp8QUrpr9nVd9MtnyueKVTjNFUjq9DgnqPKaFweT7wCH+dmJ+hFpRGzS33hdi0f5tsxAje2q8pkil0X0IbBhq1xMiYBtkD13xUyyB4gkbRO8yNwnRipkHtEou343738MCbvWtcNM4cdRUbkdDsYgVC/iYidoMN/Im2lg9DE6woSmjyULOamjJ1JR0RnG1yls8r0mtotCXLA5f2M/1P1tmT+f3b636ad2LTEwwcU7AwnpodwcOMTU2MfckW+ddJi7oAo21bb5MujJjOHpl1EmR5i6XYx02dCQMQMEyBjpsV2Wl8HFTbKzv99mKEq/nlHS6Lf3yJ4DiTIjEnGvFmGwH8nkJ8n28SlIa8+HVvIz9LDHqU4jSR7q6c0UFkJPtn7330v7+GPvGu2sxQZ0uzZJYW5+3SIs2pi54HAMUzAbrpBQ7T6MY3N6PS3nl318sSVsEsOG2CDIAAmLcX+5Q/3X0Hm7+ugYt6FSC7h2jEsfni5qRe1ybBMNKZlza5zJSjkNVTck6fV6Y7eA9wuN6CPvTMO8o8AVuzqPcPZDDsX3SSL7xLJXR4QNXG/ulwvViMw88Qj+R1RLC1f1QRnrwYVd46XVKUZka/HU1x7IANXFhKcj6C6Wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39830400003)(346002)(396003)(366004)(451199015)(1076003)(6512007)(26005)(6666004)(107886003)(6506007)(86362001)(36756003)(38100700002)(186003)(2616005)(38350700002)(41300700001)(478600001)(316002)(8676002)(4326008)(2906002)(5660300002)(8936002)(44832011)(52116002)(6486002)(966005)(66476007)(6916009)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?55vokVoTApIodOXxejQleMaeuZupaWOy0n4nOKvy6rRM/mqgxCZoDJFWKSoa?=
 =?us-ascii?Q?lbNRV1+Lt4hpUjgY4O0C76I+Z5W9AfHD1gpi6UaERN02ck5Dj81go+MVl6ri?=
 =?us-ascii?Q?y62vlRO74jePRk/EnAqhXs+X3kfB7QhEBIp40lQ7atfyvM89C7uy+3D0xAtT?=
 =?us-ascii?Q?MNms5fv5oUEvWZTuF0RkhA52/9Z1SuNEHeCSLAD0FrWqx65oN4vRqbX9diG4?=
 =?us-ascii?Q?jgkI1ijU35axWCCzRjUtaqMY/tvo/rZCOQqHZtZelfDhJDYDCvwQRP0T+Tr3?=
 =?us-ascii?Q?s2zEUbQKpc4UNRBdVD9jQ/lyL3nDEf1H4K6G0VINoazzXJy6sZiGpEmh8DPb?=
 =?us-ascii?Q?LoQhOp+E1OT/tK279TnsyyyF9gaauOpThvnEJK2CULvFvUxybj/9sG23c6nU?=
 =?us-ascii?Q?qdkB6/3Z1ZDP3iePiBEH1sshvlciDmB8mekDKlbz3h3EH/KIMxg3HAv5B74g?=
 =?us-ascii?Q?aEqUjmlXA0Ej+bqvmQbovhDaPkHX0V+YWF6o6KhBzihxpEjljBQhTBThBjAV?=
 =?us-ascii?Q?ufHFpMO+lIu+W2ECKAWGKVJ0ktxNIsgGYvHK5woXzgJsf14UhzNLOhf1qh4g?=
 =?us-ascii?Q?nXK8a4f0KO90BQYK4sKegIg0T9BFtAkeAF3PkTNmYZiuWsMneN5n+KSTVQ7D?=
 =?us-ascii?Q?C/GB3E7WISF7DU5Vt92tLQvzp5DAnQX8qHD/yCo/NYiDKHNay6k1mRGF1/Ew?=
 =?us-ascii?Q?h7R2GccUKZp4S0+Pb515wjYZMlKpQ12ZGFVWseum209crRxmvO6VeR1RG7uQ?=
 =?us-ascii?Q?KojHMF5+V3GpcNREBvCZh8eBo9kGDmtlEIZTE28/XMs56d8bXM1r26kw2lqA?=
 =?us-ascii?Q?tkPYBZXg7b7csY82Er5uJNz9QCGZmDZBjCRc9BMmM8i9rlX3Vr1skYSVDT6G?=
 =?us-ascii?Q?iQF98IvHrgbJQuZ4LugULl0DEvc+Pq/WM8LC+4iFjrPsSxT6A9/r9mqX/GEl?=
 =?us-ascii?Q?xEw6uKjWpgMCCdVwTjuP6uc/jX81/cbxWwM6TAiDoW4fvaA6IgCZ8dKJS2FL?=
 =?us-ascii?Q?zdD83gt12I+eeLVp4H6XSpMXn83CVm9ZWVnIgId0JVUq8JRxVso3E0pp9rhg?=
 =?us-ascii?Q?0iELm0OlBZw2qt7Q7XvALtnKv1OOoh8DOz3L6XEHhObzuOrVvXuH1Lv9FTvh?=
 =?us-ascii?Q?q/Wd2LOnoTCrGxCN4xcaZdYl/1ywbH378FyKlhaAZa+fdtQ+9QoAYtqnDBAk?=
 =?us-ascii?Q?dGLMRpmTIdPaS2l5uFBvgvdXrWKOFmd7rYD/Qaq6cthybFILkLLpSHDGV2rD?=
 =?us-ascii?Q?QRVUDdSmBUHu0sgkqoWDIVyXUAYXmoy8PT74QIL1BW5fmZkWhCHCvDSvb4sc?=
 =?us-ascii?Q?/85SjN6gOOqnEQo/8hImtvG8YIYxQun2Xpkpptwa9j5RYTmO3H6Bv2HbJ8m2?=
 =?us-ascii?Q?4vnSIhmqcYZWC11C2eINV4jNrI5nyVNBBpDd8/XiZf36bbKa4RKg1kloNosX?=
 =?us-ascii?Q?JUpsMqubNVNmSQu+24rjlleLK5bTsvEPViiapgrZ4lv88hONnL9ydQ2pSzpg?=
 =?us-ascii?Q?rqoBX7gGYhXDtpOXHylvma7kGdrhCYy5+1pN2bZA1cHwnaX5SwOVB/i43/4R?=
 =?us-ascii?Q?cveRZ10vp1qUapWJAocd6P8d0rG5HmYFad0HeriF?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965a4975-2539-4e5c-0e38-08daf221ecdc
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 09:14:35.1783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIy2XgnvihBHaeU64Q+o2JnhkLaOLVBOs22EEqAnm8HyKQufIws6fbdNEiOkH2vT4lCr/glc+pDS215aC9QOU7IIz5tDqcLJD8hYvspv1xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0800
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

Modified the schema binding and added the vendor prefixes.

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

