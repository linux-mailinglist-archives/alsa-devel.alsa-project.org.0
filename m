Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C8F673366
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 09:13:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23A17F17;
	Thu, 19 Jan 2023 09:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23A17F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674116036;
	bh=+4g507l25VzLlf4pOhvySF9NlEJKa/y/YawPBkHIs74=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i8gqlgaPpiAJPpmdiYOyB2IkaSy/XXWrGMEDgWuzH0HYwQ1VXzf6qTz9E8NuPGAVt
	 Fk1F46cIMAy0RfhT/0C3zQ5Oncaz+kVf5cm87ZiVHr/fjGk5RHsDmeGWf9diZcw303
	 QT92muT1aM2eExqkJz6opDZF2MSQOKbu3koYfqAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF0CF8053C;
	Thu, 19 Jan 2023 09:12:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A3C7F804FE; Thu, 19 Jan 2023 09:12:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2050.outbound.protection.outlook.com [40.107.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F2FBF8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 09:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2FBF8024D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPomC/YsOgkNCmzjEp9HbJFE94wFi0npylewHgPWYhqq/f4nrR6IaFmYnCuUnKkzVKBEf/utMZSzUd9thCsVaL5FCgRB0YoxgkHgVATgzfL3KViHkP7k6kt1Zh1q2Mi3nHULZqRCWMtYjqMRzCpO7BTfMpQWVbh0HT/5DxWJ+3EOIf1oma8ay7FC2ScJuw1OQHZ8wsmWHCrs728Da0P1bXI/jnL2C3PtTAaq+EiOPb6a8gtGypJ1SmyQHDVwd7vxcB/p+l7vbnO/23KgWGaDr+kGgi58YF2adgn+3TTEGjiSgCU1uw7Vypqr20wHkJ6qqN6K85SODw23NOA4HOS0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8Wau7pYsociQTPuLtS2tEALmtkmjuzgbuaJ0Mls6CU=;
 b=Iom0aq+MuXMMuxjvKkY/1eANzu04+Va/1vW/usZvJ9G4Q26QFthO8fkq/b+9iKqU2ZVV2ncH1cFhFZ5Ex2DtkWNfIUVdUHC0hkhfOdOXqlGif46odOcqRMiqsQ6U7j7ljp3Xns6Ns5UYD/TOnAHGYyQ1CQDtJDCamS9Q3TiItEAU+ZJGZgP/Q1OGhU7eMXP5BNRZyIRdSUwgY38QQm+iOGE+kSPjxoGo4ye9oY4QYDw7/YWeBjVXPbuwBxifHGAjh/LtlbW5JGmNKLuxFaj3Wtaa6GwXfnInLrkEOkpkY7pzumbzBevec12lb70MrI55qZaR+glJRrs+vm5KThIG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0876.KORP216.PROD.OUTLOOK.COM (2603:1096:100:29::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.25; Thu, 19 Jan 2023 08:12:24 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 08:12:24 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 2/2] Modified the schema binding and added the vendor
 prefixes.
Date: Thu, 19 Jan 2023 08:12:02 +0000
Message-Id: <20230119081202.1456-4-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230119081202.1456-1-kiseok.jo@irondevice.com>
References: <20230119081202.1456-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0076.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::9)
 To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SL2P216MB0876:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4c7e3f-aa70-44c3-bc33-08daf9f4e573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6773wDbyyVZAHzkWC9kCCkRHxvdvYEnL7/asxu3QFrHocK8j4iUPcnhoGfzbE5y20TwK4wkdRADX/fU3sxkd4/ozahyrwL2G+AABbTLIlmq4zYZtSxOGs3tcOBJE/pt3sI2NNMK/n4Igb/vf0q+oeDbZUPdHTH8W0zlBZs+7icpsnNf7zI4UpABA1gULIJFjAluv12mnWx3nFhaUmJWA12YQKE4VIz3dVNiNZAvitMkMxPaQZXOHqr9hs6gf/ivzL8x7LB76NYjZfwIV0uvMmOMj6NIMsgz2h2KPFwIiXOUi8x+o+FtlYLyL38G0zT4BWIYPR3Rl/rjdem005rlOs9z01IV+VTSmPoGUPMdW9dbokv3qQxlhZ8E4W6ObGOOwKlfpZ6QKY1SLgQDxOYlhg+vhAGtCf+oMjThwYCT93OwQcH2RYtM/0kYaeNyXP4iARS10vkkMpaGAZL8dM5hlItDygvYHbICZ8FvBv96rE6GjJvR6CGwfv4Mh8Pajq8NAG67mBRrpHyFNKuH7VrQh7jmMK1Awi/GIz1rmRJTLoqex/SYI1gKKM697vJVwJ5c7Y0KNC/9S88AfQgqvPIIg+m6rebRU12wJGlNo8GbEjAc01f2j9faJtEGDEpLik+0yAwzyQFYkQFH/FWTON01/RsqnfMfL08C86mThQAf/zbF3/gOBKfX7CIaNSxOR5t5iNE7iRbrOtUfl4LZy7ei2o1N6ZAPAwE+hgTJiD9PUcDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(396003)(39830400003)(376002)(451199015)(86362001)(44832011)(41300700001)(5660300002)(8936002)(38350700002)(36756003)(38100700002)(6486002)(966005)(478600001)(52116002)(6506007)(26005)(186003)(6512007)(6666004)(107886003)(8676002)(6916009)(316002)(4326008)(66556008)(66946007)(66476007)(2616005)(1076003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XzxKxglXEx4MWM3sl8efoHuZi/3TqkbVEVouTod19MIjkrDeelZCelRnH8ac?=
 =?us-ascii?Q?KPlNf3CJyXl7QNZXQPbRt0vqv5yA/nCbqR4JG6M4wwBHNTKYw+/K120Za0v/?=
 =?us-ascii?Q?9kYtRhtBRYmdL5l8mv8m095qIgAFo8Tp1iqCxHz/Iam8n2fanZ5iHnm7x/Qe?=
 =?us-ascii?Q?IEiqiWJKp48Tt06pBNWvtO/iFgwKBqwyx+KNZTWUkaCGMsBm4SayHXFlhGJ3?=
 =?us-ascii?Q?brOw4TBhTtO1SD160CRrXUN/dRYlpd6GT8jvhVjKh7AnxIk7UoOead7hIFJS?=
 =?us-ascii?Q?Dvko+4Nbg6sdOCC3H0jrTsAr/Jy7z3wNVPWipee6WFtLQyYOZ5LKdtBnbcui?=
 =?us-ascii?Q?gV6DMIBmaqrqtvg7q5DwqxwGzKKkII3DcWxnkOXnKJVztHCif4X/zjkdFf3B?=
 =?us-ascii?Q?cwVkv5aoAzQj6vU6gyHmGCNBH5GQR7i/0GDmPU56FSEtDAoFxZISOhS0ZiKq?=
 =?us-ascii?Q?WM+6q3KYPU9YB6DPIA8CWnzLtH8muAPwnRbRLnlwy+dlr4dxdutAbSV2q68V?=
 =?us-ascii?Q?Jd038ygxVHkROrSf+N+bgbV4EhRQGFscSgmbWzUm5Bbobwa/6havs8cVLjCz?=
 =?us-ascii?Q?Ij98Ws+kabuSX0/nd+G3I5Uk79FkC5BTxXArKfbfPpo/tslB+GxZ5l/hv1mD?=
 =?us-ascii?Q?CrXCEPWX75+i0get3lnP91bQqAjs6HNQDzBsq0u1EVlo2lqR+uQOfsZFvcat?=
 =?us-ascii?Q?DDxYKODM1fh/17gTMhKfVSY4cSy3bSCmEc+3RrrbtjjfGnkDRXoZ70o4+v6w?=
 =?us-ascii?Q?A1+XoinPuzZ4DS8MERjgYinfRnR+CHe86MBuRJJ4DDVGkTKhvJD9dJVoSL7i?=
 =?us-ascii?Q?BrKYKoAjAo2oMAgyHw1eLOrMbjWLHem4b7A1JsYXqGIDzOHVDPN5RGED2Tk7?=
 =?us-ascii?Q?wMguCLdfyzADXNFUNDka0Qu7PTvx5yhkuwEFaz2VO4WPoXn8AltWesAZ8rBO?=
 =?us-ascii?Q?wGWquFoHymv5SnorKldQRDtXa8xxK9fx2kc85wJyj1hklOy6gx4E55kAAiOI?=
 =?us-ascii?Q?fayHFnSfMnlPFvWt+sNAKXouQoqvJHm86kdWDnrqAOfYLMVhQUJ48wR6zv7z?=
 =?us-ascii?Q?cs5q8neo2iLa7kqGi0H/JacD7yYMclGDPltbJ5GX+7e36P998HqXjQ25IlF0?=
 =?us-ascii?Q?LBfsU0pML7j7yvOdhT+EdNvKh2cDcimnMzsP8XbS77NC2ndAxxMMEUIDufuK?=
 =?us-ascii?Q?e7Qin9CWxwf/QG0Yve06yYb4+ricPLIl9kaknZUycNesS5rZ3MFVAhevYg9k?=
 =?us-ascii?Q?tWhsNxLIuGdvo6YSMwIVl7lOUMQCRq8oq7YTnzkezxzdmuQqbWEA31e8USFT?=
 =?us-ascii?Q?xVKCgI/DgLKMcdpyjXpPE1Jf/vP0IUKb4Pnzm0pHqZ3GbBf9oaAKzWrQtxF8?=
 =?us-ascii?Q?Nl3BAhNW8bq/u4+noryCvmGSPiaDJUDSUXmyjkLoYmKoc7Et2Yp8LCALIlEa?=
 =?us-ascii?Q?78AFQ+ZWJJHGAiAhpJuwWTq2DixfwbITHFxPlRGzo9QdelLdu8nP2XyyyCqq?=
 =?us-ascii?Q?0BBIYZR1bPUrh39hqMq2lZ6Kw5oQLXFTdRMcc5aW/Olc+I66j7uRYQm0iBmO?=
 =?us-ascii?Q?h8P/IzZOkG9GNX3S/MwXeIj3aU8T+OPk6F8fmylg?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4c7e3f-aa70-44c3-bc33-08daf9f4e573
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 08:12:24.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pJI8m9Vw36mr7DG2jjofBayXdzxcHh34IshuZj61cnc5BSdih1pTX00ICkSPUSaX2ie5/aaCuv10d+xxKoPbhZ3rB0kYLolQcHBL97BvwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0876
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
 KiseokJo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: KiseokJo <kiseok.jo@irondevice.com>

Signed-off-by: KiseokJo <kiseok.jo@irondevice.com>
---
 .../bindings/sound/irondevice,sma1303.yaml    | 32 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml

diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
new file mode 100644
index 000000000000..a7c1ed14accc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/irondevice,sma1303.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Iron Device SMA1303 Audio Amplifier
+
+maintainers:
+  - Kiseok Jo <kiseok.jo@irondevice.com>
+
+description:
+  SMA1303 digital class-D audio amplifier with an integrated boost converter.
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c_bus {
+		sma1303_amp: sma1303@1e {
+			compatible = "irondevice,sma1303";
+			reg = <0x1e>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
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
-- 
2.20.1

