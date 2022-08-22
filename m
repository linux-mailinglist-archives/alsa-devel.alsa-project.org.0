Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0259C176
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 16:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203C816DD;
	Mon, 22 Aug 2022 16:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203C816DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661177755;
	bh=8RN+nm2nXHT37Do37/pAAO5egUYyKf/0p326sS5ZSrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKLn9JOwMA4WyyYqwErMSsSGuUm8T+1b9rcHPhvax6zrwOMM9gykWTupmdrUaFUzX
	 4fcXr97NeLfy6p7p/u4DNEXR58el9teOIoFV6FBNG5sNjWVOTvFHG8eo0ueFsWQE8Q
	 bS53EZGS8vrSPNcSIKG/yrhP6DuKh1mh9PlaxAEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A0FF80533;
	Mon, 22 Aug 2022 16:13:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9C9F800ED; Mon, 22 Aug 2022 12:13:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D6DF800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 12:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D6DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="EDrjTeDR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzII8+pFHj7hhHukhAH1I85kcXSmP5Hwb/SyxSCMQpy3WVThH2kUz1OGQGnzp66m4ULQLQKCG7LmaTDi0A9RJa6L92Gd+J8qD3p93pIetqheHRD51NRRBq0i/AibtDfabktIT9kX0Q3f9GzIMCkOsQWb5frp1f0F5tEALDW/MEB83qz+FMmx/L+iCZrm/swtnQ9aJiH3wBa+YVhyS8+2YEGE01WTR/7d6baAeYxLlL0ojSXC3/khyLlEOB4fDDwtCRG9XKuXR/+oAIvHojm0AINNiH9IjqfTxJCNRzRNpcySwkxtv/2y5nXa3nA8aCthLapOii1c8tnCv8Wk5k3wFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2E0j9uKwTJsMBnA3nxh+3bjsjc275wQ3D0O2k+HSVk=;
 b=JqfuKZp//tzIIbbPbvJJZUcrpD/GNwGhQL5CrD0ncxIxQFNC97eDdPp9ufyNiSirUqQrHzewfguGynOC/BaYH0mHY8hMwDaOPZ2JIK34Br+pD2499WgKov1bFSVX1eFRuKnFbDWGCd9j+L2OVtRUZplSalirbUqBt3aDeR5KyRP8aUTWSZo/n/6wINqMleX2m0l301dRxt9BjOFnP1KUSr2rZNQkzgFnV9DHLzLgwpnfYaqmpkxHhJdzBfgl+PFE2sitNe5oTP9Qzbgs4YefxxmDLPNhDn9g2+aTRTEtVlNsQZKyzO52ZkWJD4ExD3i6zOK9K98lQwxd+8p3rkpWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2E0j9uKwTJsMBnA3nxh+3bjsjc275wQ3D0O2k+HSVk=;
 b=EDrjTeDRZn1vJaiiebDvgHfPGNN1SgRU7h9qdjPuKqkuwUixGmKeajcpo3TsStHVyPm7KJmGY7cIq4JV8KSikYqU8wKDby5Sprwo1XiO3IHRqwHNF84uJSP28gENYMaLCHFmtgB23gAsPF00hVrrYmIu/exRH2CiMh0cjVUZQ8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6607.eurprd04.prod.outlook.com (2603:10a6:803:121::19)
 by PA4PR04MB7645.eurprd04.prod.outlook.com (2603:10a6:102:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 10:13:36 +0000
Received: from VE1PR04MB6607.eurprd04.prod.outlook.com
 ([fe80::71f1:4e4c:c9c:bd9e]) by VE1PR04MB6607.eurprd04.prod.outlook.com
 ([fe80::71f1:4e4c:c9c:bd9e%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:13:36 +0000
From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: compress: Add copy function for capture case
Date: Mon, 22 Aug 2022 13:15:02 +0300
Message-Id: <20220822101502.17644-3-laurentiu.mihalcea@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822101502.17644-1-laurentiu.mihalcea@nxp.com>
References: <20220822101502.17644-1-laurentiu.mihalcea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::14) To VE1PR04MB6607.eurprd04.prod.outlook.com
 (2603:10a6:803:121::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc12e1c0-3c9b-42e2-6ddd-08da8426f9ce
X-MS-TrafficTypeDiagnostic: PA4PR04MB7645:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHWmIZoOeDXQzkrYWZVaKw4BpFgFu2s5HQg8Nc4xz7sRr1W/8C59pDx+FG9rZfLUevx0vQQG54J8l+fZTtje32TyoAbzh5ymlANRYEjx+hX49zhUQ9CuK310QLf9siIDWGuhdbqv62aiEfCSLrUTdaOUmdA/Irw3jTDEVzyLXM877/fchelo5FTerfAFUTFq+FDmTdvGaWTmjv6KJv4JZd+w1QSUVum3oj+TPZSPgtS1GI16yu9UvquCcuKrrnfV7KhYuw/HHRx+QIKB7mFLlWwcsYur2Lsx88SemX/hkqBkG7TGGUA3z03rzpXA74OIDqBBIFfI5K2i50eqTk1BdyHp1I6nE8dboiHqyb1jqBTHQ2EJYLi8VeyMSRJtNW8s3/nVaqLLowPs1GZY9bgvBAD7q0s3v039Zm5JRTJcVQM0jytuErYTiQyTPQOFQzE7RaT0VNds4DKp0mYBDJ/TV0meEOq9GcQDwKEykeuiLicXG2xVN3lx1jC0ZiReIckjwNLg7bVCUBs2bLAvVradFDJWOcQWN/D1yB4REtizCbkv34wDArAVEKKW8pi6Zd1OKA5kqpEjp52Hl8xEZlHjtqvXLhL5oMXlHRAx4C+QJl/NayhZhLJZINALFMlLx8AgSoqguPtoTD9lhvsmKQSZt2yTzjjj7M0QYSwWwP4VctyFKkB+TiNXs+CBYPZb67fIwh+dANGlhlZODXHaUIi/bbK/zCqLHq98JIeK3ptHAyQ3F2z8/0txfJUOuVYHMwwy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(66476007)(316002)(66556008)(66946007)(8676002)(4326008)(6486002)(38350700002)(38100700002)(54906003)(478600001)(36756003)(5660300002)(41300700001)(8936002)(186003)(1076003)(2616005)(83380400001)(44832011)(6666004)(52116002)(2906002)(6512007)(6506007)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?InY/EczyKgubmv6ThXqnU7FV97WVwV05sBGQbEEQsMUFbf481XjaDEz2gVnY?=
 =?us-ascii?Q?aYQLxYUQnXHGGq3Z3DSJBga24yLDKTBQD7yE7eFneM/u1GswJWdR6CyL3II7?=
 =?us-ascii?Q?cNCRNBWR2rJUbwu3uHRDejZvYWXEazsDX6aI+o0xdwx9MXdCl9MMH3VOIKc2?=
 =?us-ascii?Q?GkDfcMUoB5vWuO1DhXzTTDQySPkejZnKhjiWPk1NhahY+eG/VSa4smJrMNod?=
 =?us-ascii?Q?eEZrIjBkl6MHHW5goEbAq1iEayym7XF3eiLBwq2/EH7oeLkFldhfLJclU4r6?=
 =?us-ascii?Q?t6EHtRRpBsXka+oDkGdwhY5JMeLvoMhcqDQL+sJVUpd7bbjef8Kj3yyGsKRt?=
 =?us-ascii?Q?KDtSQb0bEjYzEwV/m1dVDZqnEfgCGPa2TTHpNYGnpi4Ntnqy27bHJHqeiOpL?=
 =?us-ascii?Q?rAe+3dQjBqr1UeGZmFDlh6trE+PXUr5VONSHBszsSPK+AXOCns2OvJY6/Krv?=
 =?us-ascii?Q?YTW2CVkTB6UJTJK1Qhy+BG/qosHba7+pq6sdWfn8nt2JBTe+0Tv2YA1qFY2q?=
 =?us-ascii?Q?HLG1JYzZljp7QqPmlb4cUkZ6ri1BvpqBli7wLMqAYMtwBeNgaY3FuXDT1G9Z?=
 =?us-ascii?Q?s9Lj/GKgi5EfyOdxElMhnJLV7zXKslC3rkhEHn3buh7OLfLxp1qedxfHcWPU?=
 =?us-ascii?Q?ZkVuOqmph6EPcPvcCT2WMl9yxP439cxKqlaa1Jl+M+6DyYZu7Q1Pgo32msGF?=
 =?us-ascii?Q?EzeKBQnFgNVgkMIO1eA8jdndS6wYItFGsSsohujdqO3GfM/fGLaMNb2dkAj6?=
 =?us-ascii?Q?EG9KJlhRrr8+lSa7wQ+1PfeBq0/8BUA0p3vZTP3GuHyuqy/Ma+GFG6tznfD+?=
 =?us-ascii?Q?FXPzR/zrNikM0MZgL4NxolbewsNyHF7m2N/BP5x1dFU6ARxnms1ZOAfFkLpk?=
 =?us-ascii?Q?FHZ1wzgPq67TDx8nUHA19/tW+GI8fIblL3mH6sDCA1/ckSZjvz1mOb/HqJws?=
 =?us-ascii?Q?rJ1zhcFNLxe395uls0pAOZtCc2VXy9SbHZoN0lNW0fkjn10l8FMpKy9ru/XM?=
 =?us-ascii?Q?AkbX/p6cvAh/JG2yAREbojdUxETvDQrBbmV46/ofwb2LEvUK/N0LExQ8V3Zi?=
 =?us-ascii?Q?7Pr/Fab9fGZmHcku2ksg4YzoNQi2Y8DlhHPUtxghPM2yA6XgyhaKpvAMRkIK?=
 =?us-ascii?Q?yY2Qy8MjmtSiMhAFykas8IDDmyU81MzUcz5JBt6BfvWINqDjinBGdRsN6HRB?=
 =?us-ascii?Q?dtkdFWPEfXNY99ObRkvh2KJiJ2FiO0WQg/i0OIxdTzv+A0NkqViZedXbP/HA?=
 =?us-ascii?Q?fMoZMmGs90v0G7n4dNSYRo0iX91hEgSLdNa8fsOVCFHatz72cEWZEuM6Pdzc?=
 =?us-ascii?Q?LwfqCnmywqizsisA7wLQ8JuV5iRY/VQanTMFxC72jNwJWRAWJW4kTR/BQFqR?=
 =?us-ascii?Q?fGT8BkR/U29HVbVmiwM+QTvTzAkIP9eDINlh1Bg7jPm5gS6mnqUxPIMZirqL?=
 =?us-ascii?Q?SQVM9jTcbMMuTTkq42veLjeAswLyxwj/tBp/PMZVkmRbKdlXZTO3YzQwqKPp?=
 =?us-ascii?Q?zzQeoFRqb11xJVgOPnP6t7J9IoSR+jxyuyxq3qxaLxyb00vwNfZ5Glk2IG/G?=
 =?us-ascii?Q?h9RF2MaZr4I4Yor8y3XXVonw5XYs3b0zoUdK+cUUG6kLEtq/rGFE2D8JdE+y?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc12e1c0-3c9b-42e2-6ddd-08da8426f9ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6607.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:13:36.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suF88xajw6ZQlC7Qlwoolr2NNW2UWI2dScXYB5w6QCUehf9I8XTp1qbffnoB51KEVOaOuTCtJMJ+ntVCHL2CYCr5z1Y1MX0GWrE8Xi6K0t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
X-Mailman-Approved-At: Mon, 22 Aug 2022 16:13:56 +0200
Cc: Daniel Baluta <daniel.baluta@nxp.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 pierre-louis.bossart@linux.intel.com, Paul Olaru <paul.olaru@nxp.com>,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
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

Added a new copy function used to copy data to user buffer
in the case of compress capture.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/compress.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 1b0b8b43723b..81202e4b7cb9 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -318,6 +318,27 @@ static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
 	return count - ret;
 }
 
+static int sof_compr_copy_capture(struct snd_compr_runtime *rtd,
+				  char __user *buf, size_t count)
+{
+	void *ptr;
+	unsigned int offset, n;
+	int ret;
+
+	div_u64_rem(rtd->total_bytes_transferred, rtd->buffer_size, &offset);
+	ptr = rtd->dma_area + offset;
+	n = rtd->buffer_size - offset;
+
+	if (count < n) {
+		ret = copy_to_user(buf, ptr, count);
+	} else {
+		ret = copy_to_user(buf, ptr, n);
+		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
+	}
+
+	return count - ret;
+}
+
 static int sof_compr_copy(struct snd_soc_component *component,
 			  struct snd_compr_stream *cstream,
 			  char __user *buf, size_t count)
@@ -327,7 +348,10 @@ static int sof_compr_copy(struct snd_soc_component *component,
 	if (count > rtd->buffer_size)
 		count = rtd->buffer_size;
 
-	return sof_compr_copy_playback(rtd, buf, count);
+	if (cstream->direction == SND_COMPRESS_PLAYBACK)
+		return sof_compr_copy_playback(rtd, buf, count);
+	else
+		return sof_compr_copy_capture(rtd, buf, count);
 }
 
 static int sof_compr_pointer(struct snd_soc_component *component,
-- 
2.34.1

