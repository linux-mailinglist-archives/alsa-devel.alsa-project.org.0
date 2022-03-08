Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E264D1B71
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 16:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A1117E5;
	Tue,  8 Mar 2022 16:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A1117E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646752485;
	bh=aRBbv/G8nZRd8D4FkwujRtqko71wE9cI4ws1lIdipjI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LoWft4Uq1zHB58NLtbEPMJgMlxl6mEmDE9yvOWujymgGZCIbq4GIhscVBon5bOsB2
	 lR49vnRaIi99zKuZuevqDkmik4E99PfUqPb4u0XMug9V8zoXhbFZ/BCkuVKZBkAN10
	 sQdFGWuhHAPzWcFTYBkgwXvED3S+sKwPoVaN5U64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81EB5F8051A;
	Tue,  8 Mar 2022 16:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6155F80124; Mon,  7 Mar 2022 15:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD65F80132
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 15:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD65F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com
 header.b="glNpAKJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW51pPoLH1W5WjCyKpeY5bVwgY5hbh2xBqDXlliDWhrji/ZcVghF9MZn7qQ40vJ55skrN9oqZ5aJcerop/13dLQh/tVKMUJ18LLFONqzhhdTd1qb896aCg64E/6vlq2eljHBcJ+IXbYX1Ig+RfHmHuahQijpvb681ypmanwdrU+onn8OlKRmpChskpLKc8aOhNhHt2ADmMFBoIZ5YxMerA8vHVl3mvVNTkq/3zL2JyR8VhIsMzL3qmdYbxhoGsua1KNigTrEd0CuXRQqrCruYTG+MY49jwJ14y8OAxqR5l3L1a2pk/dpoVVjmMk7PxbtASJPVNHcGrG4G4U09QFaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTo9JM99VEZ7Y+VSS08hQnApCibgyB6YlAEYwOWjf5s=;
 b=nqSTGqla1+B6wES5Hq6uyDGFJXCzI34+GiDinh9WHDYu13w4fRaIj0rAn3iBuIbzLkw2lvXOqpuX4fGDInuAEDRH0nEx6iu1RDyXKX38Irv7BM0LyQW3wdbfyYwMBL90we1T9Sgbn/URm1+pF7u8DCs554sM39SfC3VJSqEm/PsPUfhEuLI5WlfBBf38NvMBiVQYmwoBAmNVzrkxB2Vqc5dI33PcxV898wZrXXx6ZjyVMqZz34norcjyi40cVgysBsZ2NfUqlRC+vDaSHwFCSGXq++JrZWtaKt/rYY6b8u9DW8IzOPXNeP8Q262WhNIm25AqWQtjLOb3WDfe1TRvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTo9JM99VEZ7Y+VSS08hQnApCibgyB6YlAEYwOWjf5s=;
 b=glNpAKJKOOgzkJf8W7ZXfCjT8kVycSy5T907laXp1uxipbf6eyI2mKnr2zlaSEtskCYwzzFUl8oOTzMQfEoMPJ5UkdAFKSJkKqNsazkOdgLtMjUTz0oAVgE6xIWQq+Z1Z+SgCKCwtPzQvHF/aH8TsAPXbgvqiYZT1XI9AQOe2Hu904YjBk5MJl1A2GIXuJxThRko7+TtKV3cyjyPQAMFrz9nR+9GFXl4+gDpL800aYRJXIFMRT/kuc5kdFSNgnP7j2bKcU4B79FLuiWFK6mCEAeTUVvbZ5VqeGp21s7WBnoDfFwYnZXwHUIOZqwO489OetDJFsz4Zf6sftoNQPxaiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com (2603:10a6:20b:41a::7)
 by AM6PR08MB5219.eurprd08.prod.outlook.com (2603:10a6:20b:ce::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:11:50 +0000
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63]) by AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:11:50 +0000
From: Alifer Moraes <alifer.m@variscite.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: bindings: fsl-asoc-card: Add compatible string for
 wm8904
Date: Mon,  7 Mar 2022 11:10:39 -0300
Message-Id: <20220307141041.27538-2-alifer.m@variscite.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307141041.27538-1-alifer.m@variscite.com>
References: <20220307141041.27538-1-alifer.m@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP2PR80CA0081.lamprd80.prod.outlook.com
 (2603:10d6:102:14::19) To AM9PR08MB6999.eurprd08.prod.outlook.com
 (2603:10a6:20b:41a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 202a84cc-0a15-4e96-a6f0-08da00446c26
X-MS-TrafficTypeDiagnostic: AM6PR08MB5219:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB5219FC9A2B13342E2FE9BAFB87089@AM6PR08MB5219.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPfEPDU8e/6+2n2XAMBoP444D0woy8+/C1au4AwflG56D18lSV4V2KOFLKkbps5I4ksLZ1HRIsdk2/s9i1Mz7Kxe3FaJyZoGrxQ93mUnzViTkRH1eTBK6h2Qk7YK+8a5+quaAY50eVpFx9DbztdaPhbGiP143B4TnJLmXd6S/SpPt0FcOE3wsfDk5sk4rGC/DSS6RKpPTsbkYI//j4hJCiUYcBhryTz3C1RHcNUrgq4O6yvcUrsJ0FQS9ehO76NBKHV2JSTfktkzeIENXHSIiSh1k6BxMXj0+NbR7MHbzspFWYkjXGGxvM0KoEqDdqG6Gbafh+qrTCJfaAA5Qsg/FoP2/S2C9dNLnWXbHyJ6n7Yrua0y7epqvThahAsdHWDib6uXrUPgw/G3ZCo7Qq2Ve7gLm+H2DnG14/wQ5Buwpsfe5H/q2YFkWMcAhBHvbId2Up7WNzdvCfB+8eiqZKb0z0CfRamB1mVViWnuS1sgYFAjPJ+vgyu2Eg2V/V0uABU6nfgCCt0I0nS3JitSyjw32IP/0X6BVGeRPMDvOuJCR7xsGLOB76t6tOoOQ3UBBfKekrRgLidmxup3z4vN9jADXUnU7S3m3wfahhmDBZcYTb3T+W/0nk72lQX4YDyJm3AwBtWZbOB0W14sun1sBieQ/rzE+A8RsgQUhwMCSFxxJYRMln5Fstz2hnD+FdpUCC+M4KJppEh/BuZcAfCxHGq6Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6999.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(346002)(6916009)(107886003)(186003)(26005)(2616005)(1076003)(508600001)(6486002)(52116002)(6666004)(6512007)(6506007)(86362001)(38100700002)(38350700002)(36756003)(2906002)(66946007)(66476007)(8936002)(8676002)(66556008)(7416002)(4326008)(5660300002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YbAfw8tmCfULnHUzlCJ8FtWYxsJJN6Hy0EHFZwmxh2OuI1//SM5Wv+I548xI?=
 =?us-ascii?Q?d8g6k5B1Rh4CyuTQkA2VLItxG96pbBhK3nVnFgi03p/QHlS3+rw3vIk1AAG7?=
 =?us-ascii?Q?HR4LgjrSwj1uAfemIlaadR1zZz0XyDvVP9fSFADVGttGm8xCYrlcx+wXl2CQ?=
 =?us-ascii?Q?dcQUspSCdrkh3GhIDDIQnZYbDKGGzYNcY8BRXu4UARsv/5cbaldGRnEX3QWQ?=
 =?us-ascii?Q?+L7KgIYUkZcnoVrdc8v9LZN9R/B4u3QjAH4Tga8AtUZIdUGKPHTYU+sxgrIE?=
 =?us-ascii?Q?883AqTi5UWp+hUZUvA76q4LpHngLIs1vg0eGDd7SbvuyoZHxG2f3hNhxMeJq?=
 =?us-ascii?Q?ThDR4ghaHoUv86EOaW0cmoNp3eDo20pmq5HEUP5Ngq50gE9aSfpnwAeQ2/6y?=
 =?us-ascii?Q?yRGrx2AOKvYfw21MRV0kXXqsCyzk0331YHFnhC+uSS+1uH41mq58zY23YsQQ?=
 =?us-ascii?Q?T7jaG4tJWD+DD6LiBxB5Yh7xUvBzxk4+vTnN6zrVcAk80CQ6C3N0YGIUotkh?=
 =?us-ascii?Q?LHW9WYELlKBh6qimSgCbHWSvquUhcoFH98Mlki3/XX7ec32XzaBYpCkpmauo?=
 =?us-ascii?Q?Jzdf43tlsOZFQ1zMtSBXVD5kJx60/9Emtdyz6lzS6B4p8xz0Qf9HdJ4+aPPy?=
 =?us-ascii?Q?OJuccwD3xLkCwdSOHUHZudfBEs0HzVYDFW5IISOpP93E5eet86SudL1UA5dj?=
 =?us-ascii?Q?wclc2tsNnvm9UQg1TeK3iZ6f1/lDxyelKp/Do8PgLK61ak9K0XTZwb31um5g?=
 =?us-ascii?Q?q80O5Mp7HNlMOroopsztTCcqzo6WXezlk3BiPkQM0wKnFMifzujCJ11OgQJS?=
 =?us-ascii?Q?p7FXODqp3sS4iSwWe4VVdhZB2VT3usZsXIdckIJlKqjn3XoFj419tJPaC2RR?=
 =?us-ascii?Q?wHtwKGmHBEBm7jqglXy3Y/B1t7z+ebqKmzTHBUsh7v2B9sntBXFq3zZrWPL4?=
 =?us-ascii?Q?TslqoolQDML3n7vv6FnVZKwF+A+ofJtpBFlXt/T63AQDhY/0inK2T7qR412j?=
 =?us-ascii?Q?Zxnua4TSNDquePkSeGjsao5IFLMj3Y5m9d4WkFnJArfTA8/+wuwZyvJUG7cS?=
 =?us-ascii?Q?Mx0dd0OktYyCweGcb2Y/MwiHxHwp9/L1zXxGj27X7Szh8OyhBEwCdyW5AjYs?=
 =?us-ascii?Q?QzvN6p0fNT1HIQsiO0HxhsCpSQ4qITJzdYocE/gY+a6A4OD2PdtJsVVqf0XM?=
 =?us-ascii?Q?Rrlh43fl7TPvC2IABXBewP1CH3mLQmUxemyXpzR2RqhJSn9J0s0vycEu5/x0?=
 =?us-ascii?Q?eiUu5waAf9ppMpbo5UgHcn6K/flZAZJZj3YGwOTrMqfwvZflupfiemBptrRs?=
 =?us-ascii?Q?ED0OB8N1Xz9iT55LgQaBHZ3ch9aocgcHmDLFCFh4eRspFV44VzL5qWfPYmBK?=
 =?us-ascii?Q?A400Fv1ROSdzYRPON+khlAINSNcIjkcnseqtauM3/JIq6FZTn5q91sXRzpVn?=
 =?us-ascii?Q?b0OG42hG0uRodnWAkl9Aeuy1zCFYHkg8r9B3rPbjLGyl70t4OznFf6Ylg0zq?=
 =?us-ascii?Q?OtfyDcG5MYKaQHr5BV36JUyuCQGFzEhY/lNUBmEEAC4DATK28KEOQ/u6l1ek?=
 =?us-ascii?Q?foXmZEvtATDblx3CZY3cDDn5xgllKEB9K1UqSkAuqom14sOq7seG9rLwJlPN?=
 =?us-ascii?Q?YAupFjTgj6tx5K4u0J/CbHk=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202a84cc-0a15-4e96-a6f0-08da00446c26
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6999.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:11:50.6107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRomg7zD64yyHhBvQJHpBuZLFdTR9yTscIuHbn8TC1xt6JlC+1I7513QdW3HxeqOBFB5OZ7UnweHPRtTt2FEIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5219
X-Mailman-Approved-At: Tue, 08 Mar 2022 16:12:38 +0100
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, eran.m@variscite.com,
 broonie@kernel.org, Alifer Moraes <alifer.m@variscite.com>,
 patches@opensource.cirrus.com, festevam@gmail.com
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

Add compatible string for the wm8904 codec.

Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 23d83fa7609f..edb7837e4963 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -44,6 +44,8 @@ The compatible list for this generic sound card currently:
 
  "fsl,imx-audio-wm8958"
 
+ "fsl,imx-audio-wm8904"
+
 Required properties:
 
   - compatible		: Contains one of entries in the compatible list.
-- 
2.25.1

