Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D57677697
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2463870;
	Mon, 23 Jan 2023 09:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2463870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463485;
	bh=b2JQ/knpf7CkyEBrdoDWy3/6Rbbb4V3sfJB+YFPnkdI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FewuA9bHkQrmOH9h9GVTcVdMqVDWxNaJ7F+nVDIQh+Xr6MTrHlHdjMhVFvwDKWqme
	 WohD4jvGiDORO7M+LzNppxO8GXNYo+sl8uHcUNAqlm8mBFw5UgadXgAwhrkKSxJPqo
	 k/ZXG4sZxI7HpK3QA4S3jbYZ24vSPP0FeWRVnWB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5CCF8055A;
	Mon, 23 Jan 2023 09:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DD0F8026D; Fri, 20 Jan 2023 07:53:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951ACF8024D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951ACF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HaaLt8It
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfhTrqVABfTCqELbJSenmTsF9uD3iSGGajyPEGWRxbpSCfQmhKqLQz/sMeRQk4BpXl8W2t8+lutVK94BojeQT8kNrXQaTctOs3W5j6nRzw+1j914NQwxclvbgrWmgbN7Z2ttpf9h1AkDmHQ1oPjkrX5KE7VwmvPwA6u/JxIU2flUeXDSs2Utgapo60FnsiIP6deQJpCnshMVX3fIKXgUzPvT5Si5HfYvG3WU8Ns6tNX2bLUXlFrE6V6q73hpgjKWTYM/a+YtC9ShHc8GtCUJlQ8nXB3y6KItTm3w9gQru//iCEefoKxoId1w+4RHwnrGpqt23cbI9mGESHeezava7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ok0rbOYBcQHGBDYHoohiqhhhPdvkD3njh6QlAmIPQM=;
 b=hD+D1QmlR5zMbF+BdRYeZTNOaHQ9Bn8+7PqX7sLGJg5BlwIJK04uVvLB612H4xkeG2Su3UDiykljWx3HiKVjZaDJCsyi7Z+k+5Y/TGUN0L40nTBWwXvzxm3mtZ+oEOZgBt380qhnHj3HkxNX9jgjXqnuqGEJCpA56jZCuSwAd8ucJf9+9anQ+y69tL5oOT7uTGGpQg/qoev6xU5CwnqCYKFTSe+pzfR6g48fY6o2ORKCvU834wVg20O8XkilCymzx6R7Wns6Huap6l+TXEGBpe4uXXNaMvpuOK78uXtT7KuDQJHXSoWVKhbzInoEDaQTlfuMda32Qt5UWyh5WjJv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ok0rbOYBcQHGBDYHoohiqhhhPdvkD3njh6QlAmIPQM=;
 b=HaaLt8ItxdHKRYoUvlRBCknJ1FMCV1tRH4aMD5D6toD+xvng2hgBjmWWEYiUBo08DxDlVMP2GZHhHwvAtAKS+nq2ueUV74ERFvdfhcsykspCC7wKgm6c+m/8k3pJpLIle4UFu3Do7/xuHnhIgbgX/OSstL+L4K+NiLPDEJ4UPfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9638.jpnprd01.prod.outlook.com (2603:1096:604:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 06:53:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:53:04 +0000
Message-ID: <87edrplmsw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/25] ASoC: soc-dai.h: add snd_soc_dai_tdm_mask_set/get()
 helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:53:03 +0000
X-ClientProxiedBy: TYAPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:404:28::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c744fc1-ab50-4cae-fe14-08dafab2fa5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZwbxk9Fr5t6L5B8kWPiB3liIPckMalscd1XhZOpWlTE7AmIZs2dYoe0UHme2oKNo6VLVyrnkTxm8hcC3mAPCfomrCQzTmAKFF+jd9P+HnwsoorWQjpLb0ly4oF+BNmJISamh7CPslIuS5EhRB/6sNZHRa376i2/lClNN5TvKOv6AU3taw4bictXYY7qTWyFfnL+QKau1+jsghIJPCMTxyxDBWfS90zQIcw3wanQbFCmlE61P1d+jy2U+0Z3d/+ogZpyG5Ahr4tH6efehj4+rBkdK/n1M8UA1iDMTtj9SpH42iUbRrymIRvuHEZX8AaX9TeIb8xjihbIRZIaMSTVAQ4q3vlvNbPN3GW/s4INm5keKRXAKeWoW5HVvz8JPK0Qw73pqT93lR5eVFReJtbc70qlMfV+vopHBFopiNjJs5cgYzt31n85NRNgP/DPE+kIZ02jmOvhObk/kV7qBaQkcDgDb5slUPJjnwpHqvaCsEtuT9Jodqfw3p41GHrVu9u3FZ5Zz8FqKYHSzbF1Aw7X4/OrsDy1+QCyYuZYG6sp/lOPpPknRYqBOyJvV1HtO9PHcFKA/nPZdHD69aQBUyikx9OU91016teuFNgqTpo9jMwIO5ClgCvjBU7+E7la90j9ArCxdYZrS4W68GUC1J1YFL08aTca0d7zGQEbTQYePeCPDn9eSZeuB0sRS//FgQ4JQ9vuTYRFse2DLXalQR5kmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(2906002)(7416002)(7406005)(5660300002)(8936002)(66946007)(316002)(83380400001)(86362001)(66556008)(54906003)(41300700001)(36756003)(4326008)(66476007)(6916009)(8676002)(52116002)(2616005)(6486002)(6506007)(186003)(6512007)(26005)(38350700002)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b6klulyYvQHQ1rDUObhLdnHO9LDJ2Y3V9BSCgG39c0v8gEt79OvXiW1hJZkq?=
 =?us-ascii?Q?bq01AVzZhGBHM0lrhxhurJGBnopRYOVMjpmwwOX36JQMhL6X20t7XWiEdafa?=
 =?us-ascii?Q?FIgy8P1sGCQ9nX/W3qjKoNq0FRiJscJFq+Fkkii+dlpSyoeAPiwcPwUVQMdE?=
 =?us-ascii?Q?EE/Caslr5aPCefxH+vqQiwRUO9pFrDrXnJBjESvuQphDEJ9PIfy0r0TwkTmC?=
 =?us-ascii?Q?JIDuegTCqkbX+cd34DggV2poLnY9J2cLOucWZWYJ/GX9nPq4/ghgU5zYZ+TF?=
 =?us-ascii?Q?ZU64hMbdBfBIJqW4wZ3O1gRjDNnwivjgUxryMfVnI1Koxf90m29ouesgRU3Q?=
 =?us-ascii?Q?H1wiEQEMWXTJzqT9Cg24Mxu29dHiokCIipdiO6z1epbChzIBXVkyrhcMx/Zm?=
 =?us-ascii?Q?iR8rAXlXNTYQlI+/dhzTQImqI9oMUr4MgaGKLDweDIFA6YJzGLmRLKc1R05P?=
 =?us-ascii?Q?hvcmSt92oFkiRGchZqI6eM8c5ZDhlra4X+q5RWwBQ0/mnauFe/3OV3X1FK5h?=
 =?us-ascii?Q?GdBsowHYougWwT1CtBA9Xou04NE1So0vu9b6ajfktfXJQPPN+NDAKeAJJ4d1?=
 =?us-ascii?Q?1SkSyytU2f9aw9fXA0qjTHFOk+ehtbqHjL0OlJsRuyPXl0PTFBCqZmtZkdZe?=
 =?us-ascii?Q?PtSdw8/EWajypjyhx2vyeu1KWxInVcygPf4R9D5ndkMdAVw2U8WFdLY2Wejy?=
 =?us-ascii?Q?daW3WAMoifV3nmd0atssZpLCZLJaNSXubqJ4NbCshjAcsicQiuJqx2fVzRE5?=
 =?us-ascii?Q?FBHG7RZGcCRZFaEsUa5MzwZ5stq6f23SeO0o12rxmI6vbPgO3iMAYUwSLGGt?=
 =?us-ascii?Q?dztcW87Kmv/QGapAoEj+qE2c4Q3BofslAeAmN6r1xWhVA+sQD5IumoW1b6EH?=
 =?us-ascii?Q?UCNAh4zdw8TDsOrFKp0NXklIH6XVIghGBlyreMlNgD07CHf0OOoYVqvr5luK?=
 =?us-ascii?Q?prLTfzZPJZRzQp2/X3vVZCx6YQEnpHrd2RqePDFf7NF5o14DgACznr/cRpxc?=
 =?us-ascii?Q?imVHR+W2CUnhQAjb97dMXA46GQ3iMfExstHj2JeKnXFEtLigFVqUR5JuJvM4?=
 =?us-ascii?Q?HIQcMEKpTrGNyW9kv6q5sZ9HUzHt3cN/PGX8Q3bFNtTbfDOyCsrhbr3I0TfB?=
 =?us-ascii?Q?HX5vmZgKiQc4NTajUKKw9DyaZse/5192lIQlqJXxKuhTc2SPU+ogGApxR25F?=
 =?us-ascii?Q?jrnBhArzZDLd9etEVTWdZpRNctmG1sbqL+XlCqODQ6aHTEgas6ZsTSMExMNB?=
 =?us-ascii?Q?A64ZUlEJqRv3fArBSA3Pnzt7iFTYIYbKBVpzY/+HUMasgs5ri6vT9pOjlKt3?=
 =?us-ascii?Q?1dXmTo2KNOd74JovN3jGmncs8a5qL1xYY14TG3LC5r8lBn2B4jjuDwmbJ10J?=
 =?us-ascii?Q?ZTWbiP5392Zw7rtwGRMHjwqUQb9leteBVxmU3rPDP0a2axZ5r81ReA2V/+wa?=
 =?us-ascii?Q?2zlJOfDBQFAljVRQxmxzXNrF16YrLy7zqZBPEaNKgyE6UtQeiLvVpnCH9iu5?=
 =?us-ascii?Q?9lq3iSW/RlDRx3fDsonZjOz0qpqcTDBKGMylkvcrDAvSQe8lCSa0HpTUUt3K?=
 =?us-ascii?Q?49S5tuBkS3nkb6dmDa17HxnkabYFe/6Q/NqBNy5AS+rFFgZ/oWY7DlljT2oU?=
 =?us-ascii?Q?nMvHYFHK8WWHZg9Hy9/IlQc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c744fc1-ab50-4cae-fe14-08dafab2fa5e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:53:04.3323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja9n7M7fOrQ79ez2t0aP1wtDfxMfh/ZPXXYRYo1WAwMfRjsz5k7XcYQLjkBOz8bqYyTzOpQRH16336QmUwys3bKcaScuuYzicF9au0BZgGy2wOBbQs+aABtFOUCIZ3Ic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9638
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:42:43 +0100
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Chunxu Li <chunxu.li@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Dmitry Osipenko <digetx@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski?= =?ISO-8859-2?Q?=22?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has tx/rx_mask, and is directly accessing to them,
but accessing to it via function is nice idea.
This patch adds snd_soc_dai_tdm_mask_set/get() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index f27b33dd97bd..9b18e230e5b3 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -520,6 +520,23 @@ static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
 	dai->capture_dma_data = capture;
 }
 
+static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return dai->tx_mask;
+	else
+		return dai->rx_mask;
+}
+
+static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
+					    unsigned int tdm_mask)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->tx_mask = tdm_mask;
+	else
+		dai->rx_mask = tdm_mask;
+}
+
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
 		void *data)
 {
-- 
2.25.1

