Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB759C173
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 16:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C00616C9;
	Mon, 22 Aug 2022 16:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C00616C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661177727;
	bh=h5D5MGru0bC6J3lbeFcJ+EOPQrQaBsux+qovtliTJO8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KnxYHB7JQKzURNSimWihStzKB3b/BiD8EuPCpU5BjVCXMSb3bB7oOeKyQWNcEb8ym
	 m0RaHs0aE5ln20LEy+dYa1y2wJwOdP8NIXMdIUwvWH4O41bG7K5xWUNwTkCz0OFogo
	 eaYQtUSPhqAxdWbsoDIEFy1vxByVAE51JjrwkVLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1059DF80525;
	Mon, 22 Aug 2022 16:13:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EF0EF8026D; Mon, 22 Aug 2022 12:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10CA2F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 12:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10CA2F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="R3bcrpDE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0PxNbJFoEWrXKuHKxw4X3A6QvAGq29rSX9kwqj/Ju9Qwb6iqVvbMOrwVKldnVr+KEyuotkiyQdkYSG+h9xqUbv+AnYUcHkq9SU7m9nQ4+quBH9RwltzOQHX1e0db8IVS/I5XCj6S1Dn55fsa45QpcDec6qACpVPaRUq1E9gNUlIBGqAqlzI1KilI2+n9/ujXqcpp/pFsg8o9genGkLy9Crg97GKWJPLJr9SDyA/rggO96n1XlFK/jkmkv4pZE1Hip6QElYcDkUwcAe7YoCGgeNCTyW4O1sMQFPBmXgLR/mjXxTe8EpMAfItfes6Tj9K7VfD7btvcMfkNreJjD9jLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ts/L/s7gbX3yBF+2IS8ZrlfkWbVzeacOxXL4Us+wGc=;
 b=A/I4PcL805aAT3O3MDjmjl040THRVGdbcmk4EHpt2Gcje37NfPmp9WGQIXu5DdVz+5XQ8elQTAjFa/ruIgNz2yEbxH7CQopBu1UA9r916iI8DDBVd9IjTgWSP0xhJeMHPciwDE+RnlXAItJIyGIDZkmjnGkjnBWyC5Tny+v3QX+VV3BGsvWiKRZ+PSddrhnrAu9AxvqlWUYyfYcbqL0EU2Oz6e2NDq+xRK90E1a/y6J/DAAVGqlylfMFjEZ6nD1/5noGDbLi1rQZk/UUaSp5a6OcEgXZoz92c3qWG+7Fmu3pLmDJH14cL0VzSALtJio1xHZiyFGQpnWRen1RjBinkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ts/L/s7gbX3yBF+2IS8ZrlfkWbVzeacOxXL4Us+wGc=;
 b=R3bcrpDElv/Wz8kq7ERqAwvBkDWevh+bIhn2j4gATgo9kjSWKgtmGprWmr5kEhioYyaVZige9KJEWzpMF728TdfGcaGjdDPl+rwmvs3JKzb9QLiQZRP01SwB+a7uBGB/bsBoBwokdm++qzOrg5hjf15zgkzMhINdbDFNQOc1eFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6607.eurprd04.prod.outlook.com (2603:10a6:803:121::19)
 by PA4PR04MB7645.eurprd04.prod.outlook.com (2603:10a6:102:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 10:13:34 +0000
Received: from VE1PR04MB6607.eurprd04.prod.outlook.com
 ([fe80::71f1:4e4c:c9c:bd9e]) by VE1PR04MB6607.eurprd04.prod.outlook.com
 ([fe80::71f1:4e4c:c9c:bd9e%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:13:34 +0000
From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/2] ASoC: SOF: compress: Add support for timestamp on capture
Date: Mon, 22 Aug 2022 13:15:00 +0300
Message-Id: <20220822101502.17644-1-laurentiu.mihalcea@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::14) To VE1PR04MB6607.eurprd04.prod.outlook.com
 (2603:10a6:803:121::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 750f49cb-9bf2-4967-8270-08da8426f879
X-MS-TrafficTypeDiagnostic: PA4PR04MB7645:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+zMRIVqsnLZUDhXy6qVosZQwjgs3w5ypX4/srPgBqO4D+Fxr55SG3F24DeBHe7MifEDQ8M74zLK5zyklR8ToW4BqLPUhjcugTXToLsE8zUrkoqITv6AgHCcK5RSCCqCOSdk0/ZLpMUcn218pYqj5/2QyMOTzLQYHLRz/CvYEs2quXDZM8WONEM7MNcKLoSffs6dMZxIMmeqTWiFdYjSTrim7XuHa3GTZ91YKg6NbC5wKC9nWvckSAnZWU/ecPgyG3EYbjch5C++fq3O58nOx0oOgMK0GOTrbtJ79uYPNFHgIzQWdSfyV20VdfBFonf39NUjIc8I/DcO90yArtqALwtrsPUdrysLMUuC3802hFG3SdHO18GCXcP4X7dbLy+75Wy9pRqi1L7p0qTpWpwHmoX9ZaO0hhCnqUpXK9KnjMmjeLGUrQA5fa/C/TOczNQI/LTvCafOx97hxn36TInVZfdiLSxG+SpkVdq/00EpxFnG9AErj+uYJSs5k4+B1poNni029KECiu/J9BxxlPeS+Brg4BSrn76oH8DEaQ8BY75t3rCEB3ZxdGgo7sjViZ/CSnKk/yHBNb/zrUcNFypOAwNp0pjD6dS8QT7cpPyJejBOgguOBvazcUcMTgNw81Bfdv3gLPenCmuBjW7crHvTRCwo2sQ5k5aaZneo5l6d1sbP6A9Dyh1Ck1+zwYgfcGMCM2AIOEz9ceolIg/0Nyt67Vggg/WPVvhfcKwSB6gRi/74T6dE0XUH4kTMWkaaCOFg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(66476007)(316002)(66556008)(66946007)(8676002)(4326008)(6486002)(38350700002)(38100700002)(478600001)(36756003)(5660300002)(41300700001)(4744005)(8936002)(186003)(1076003)(2616005)(83380400001)(44832011)(6666004)(52116002)(2906002)(6512007)(6506007)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8qP9OWJksCE7eTrZQ9YfmEWl5dybxpeiWME4WyuVFB+9S2Mxk/oUu2p5Q9N?=
 =?us-ascii?Q?kUPHpwj59sU5JbjEFQ/vtuHzV2qMRR3WMVFYOY++c9IjDDEsIQX9dDenDRfx?=
 =?us-ascii?Q?CGKuTnMdJEqxpB23ego7InlI2BBLiux1DIlcLI1wWq++HggCR1I1NJPGeCU0?=
 =?us-ascii?Q?HF4Wu8rurcrx9rdHkdjhMcSQ3Nci//RxJV3eUu07LhsMykW8Gcu8EeWR0gRQ?=
 =?us-ascii?Q?SDJTA6p0Q/rNwtLNGXrJnUMLLThOoqz03L21+RspZTKM+owsJXMsnO2sAFM9?=
 =?us-ascii?Q?JQjMIzq1cw7AYwONTLj3FgsdrFZ1FcxqJHtvzsjU6usbmRnYS11kickPhNnW?=
 =?us-ascii?Q?jtWM0DyggrYWQ3Y0yApPzryb1lUxAVvCNs9R3LnRalmkc2p7+Majn093qLsa?=
 =?us-ascii?Q?5q6mAHyIn4VJN6yk2fMZOfeNlLuHxNmpRWAk6//jRicdqINtWj9V6SjKhzs1?=
 =?us-ascii?Q?jDQ0Bqz1MkICwyhwyWlBbFTT6ZiLY//7kDL6fi58Bu9DqbaVEJY8N4FiqnUF?=
 =?us-ascii?Q?nwX9K85Y5/LlB9GlH3MUflg8O0kWVqkp/PLbt8HtQDuya+Z4/MYJOOsCOYJ7?=
 =?us-ascii?Q?lFufnaelYJTjeMnO6Q6/e1IHIch1zEzbbUawG13qFxSmXtQjz3j5mnOcQx3I?=
 =?us-ascii?Q?5/yinwwq/YhHW7cELq+PL0KfzNZ4LeHE/WTif0BQxR13TeyNVU9p5wwUuCUM?=
 =?us-ascii?Q?gGDdQ5jriLDtvVzAqHGi0wobbUSdv40LliXOwu1SB6onJv48QfNIiVPJP5sY?=
 =?us-ascii?Q?qr7pFGb6SpA5DYlQiGi4xQ1TfiWFyh7GgLxf5QAj5VC7Trb8sPvJO8V6J03w?=
 =?us-ascii?Q?cF/wgxZGSAJD1giK+6E/ByaG9huSv0f6ftveFkQlCgSQHE2H1nC0M1IynnWH?=
 =?us-ascii?Q?0EMWcf9zVc7vhvRmNaLSmSGlaXIul6JBG4Gd/hC9FoVQNf1vxJMQCvy4Puxv?=
 =?us-ascii?Q?Djq6WCAxZUYa6NQm/6/ulN/2amFegA6kU5r2CRCm+3E2Dgpe9FYTTS5eZAFo?=
 =?us-ascii?Q?koa5kKUwUlq11AX2m0WbWGZSQ2ocGvy9sRrQaWZZ7gmtplAL+iq4u4C1vptf?=
 =?us-ascii?Q?CmEkgs8JHoInA4F5IkDq54orVKOtJ+hMyQCJ8d6MYzTpl7A2CkRBOAA/qTBa?=
 =?us-ascii?Q?6lmT63XOc7iJAYUbLJGx0H1nvSegj4rmZHYIN0fyqOfBjBjppi/rLR4ZvEZU?=
 =?us-ascii?Q?RYH/JgXkS4lp4RYHctaqFILDDWhCp6WpO4nAtPJjKn+wRhpqT0g9zyjsPxWz?=
 =?us-ascii?Q?4iRYNJcxyduBxhMeExBEp5B9t3+zeY/DrfT1BCqOLHP5mNZNppN8fbR5Gh1B?=
 =?us-ascii?Q?cE5QvvzYObtoDHnHk0GS4qMdwj3wUWC86t2Ic9YToc/gifnKkYMsIhQ4XtK7?=
 =?us-ascii?Q?zN5cA+mxxAsZ7B73GhUGHWxhHu+4UfPGvzBC4ui9ixtE8KD+lZgrdxdAEIhs?=
 =?us-ascii?Q?+p9jB+Z8o1eWT6jSWoDxwFwEH2o3b5sWtEtgVv5GcmdZxQrcE3a/QlhjPV0g?=
 =?us-ascii?Q?XW4fTpEoFVmxfr8JfMDwB4n4XnemzoDzoFwn1J9ogVcGOj8UfO8I4qFlqsP2?=
 =?us-ascii?Q?pa9BzYL1CvEkMvK0h5P01nSjEeed9QzwBXz1rcQkOJIFnfrJj/toyZbHDDW8?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750f49cb-9bf2-4967-8270-08da8426f879
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6607.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:13:34.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FytZlopmq4qEnuvx/NKu8slmwoJLa8NaOH2nf8CZ6J1UNgxHaA3n9RCAr8obsU78L2C9aTRcwMXPTRRtBwRO8/hhlt2MWdHHtqu8o52ANQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
X-Mailman-Approved-At: Mon, 22 Aug 2022 16:13:56 +0200
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org
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

The purpose of this patch series is to add support for
timestamping on capture direction using the compress
API.

This is simply done by splitting sof_compr_copy into 2
functions: sof_compr_copy_playback and sof_compr_copy_capture.
Each of these functions handles one of the possible directions:
capture or playback and is called in sof_compr_copy based on
the stream's direction.

The only difference between sof_compr_copy_playback and
sof_compr_copy_capture is the fact that on playback case
we need to copy data from user space and on capture we
need to copy data to user space.

Laurentiu Mihalcea (2):
  ASoC: SOF: compress: Move sof_compr_copy functionality
  ASoC: SOF: compress: Add copy function for capture case

 sound/soc/sof/compress.c | 47 +++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 8 deletions(-)

-- 
2.34.1

