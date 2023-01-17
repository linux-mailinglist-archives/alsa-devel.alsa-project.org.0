Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F254766DD4F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:15:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D98B5CAC;
	Tue, 17 Jan 2023 13:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D98B5CAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957728;
	bh=e3YiIqDNbBLO03V++UckrLt7B+BfRoBiVjs5zE8n/Aw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GUcP+i0uSQehiVRbse0XGxyslnDyE/gaBT+hR1OrTt3u1hTKfcTTggb4BBsExQ6nz
	 JQw58DQDJ0zke+Rva8D5dgDmMF5JQwTGqCyKIjxg8B/znpK7cgezKlYq2KdXnXdeTg
	 /gzmMGTarWrHWq9s3dbgJFDJ6cPf0GwEl5aSZ59o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 005F6F8055A;
	Tue, 17 Jan 2023 13:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3262F80542; Tue, 17 Jan 2023 13:13:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FB96F804F2
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FB96F804F2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=M7RSvmXd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSc4ihnfbI/l1u9fzq2cTrEI0vi4Ro6NWNk5qFDrv8fOFj688D04XIogHNH9vQ2iL/bUbSJpPNJOzKHAGEwpCpalGppg9cTiD98+kSM2umNAULXqcOhb91Heh7LO7nfrCF/l5izL5ur9HSXp1Bo1ZCrlNq8l1WflRQW8+AeI+kXQ/NB29qg7JlKX3gMG3yGnKjqAc2+pbnMH0CtA7jf0cXy2R+KvsCnsbVuBf7f5Yb+0oZMGNGn6moAR7ZB9S3PqaDAc7caqiW8kXyijTpJNCfT6Kpp5LvZ35tTog8TPzHM+Migi5TRLccQSk9emjo+U3x1z+UhrC1ZJXE0tsRIrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gpTCKh3Rvhd6Nd1QsnAm9CASys8tE8d6PdvqhMfvlo=;
 b=WmpSiO1A4N7n+37kssoLYpCpszVcxyManahclOEcx1mJvrqrLXb3tV0eLhmw5Y/ovo1l2FOL5CodiscsK3xd3lz6kbo3wabPJe2sXLqdfuk+qqA4pDw0zr9YU35wm/Xw46vd1PrK/GSNliCU9pLktCQ7tT/sHPBpT+Rn6FL7D8EwQlAFi/pTzKhD3CqVD18Q8gpVJyj6++jS2Q9kSMPfSUKNXGXair14/hcLAPzAohik73YS2pPl4IyLoRUodKsrGCBpGaBAIpyex/uV3fZib2hzJtFXmi3s0PK0fhZs/s3JzZojJ0M1LSqgb1RW9PGM3VGhaNOzTVTGN54Igl7CBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gpTCKh3Rvhd6Nd1QsnAm9CASys8tE8d6PdvqhMfvlo=;
 b=M7RSvmXdzR82e0yXzESzmlkH9T16AuEsIN8ljNih/BYohSooLrlyx8P4P+opgvtpxUD6LDo3mVEsZ64CzWjtgNldQMK2fKQ+aI7qtde5r90ojgRLB7BbVft+kz3+t7OlHFx4dMFYfDUUcNbNnApw76V6GOZSwVO989adtCxtfpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9373.eurprd04.prod.outlook.com (2603:10a6:102:2b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:28 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:13:28 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 4/4] ASoC: SOF: compress: Set compress data offset
Date: Tue, 17 Jan 2023 14:13:07 +0200
Message-Id: <20230117121307.200183-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117121307.200183-1-daniel.baluta@oss.nxp.com>
References: <20230117121307.200183-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::9) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: 98805bfa-fd45-4857-5b36-08daf8843e02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyDLMyXFoMEQEJj6h6hOkY1JspqaEaZukcHtAPlnbi7HuSJ1sMQ9/NZGk3fdf+wdgmrEX3kv0q+tMqhXEyfeIFxNwiAmTFyIG9YEP8NHlYyuQiiPvFONJpwS6NHwMSMvmSiaunKWjrGi0IN4B5gpM0ylI1CizGX2MSrMpZQg5p5Oe79660gmt9qowrvZkmpDmH3I3rTj5zmR6I4V/NFiQqtcpUKIyqsQpsOoqBvP58grX1IKfVP0GYfk2yM7QWlY+ptSqqGai14SRET+MO0jySnhWcpemSaIeKcHut7edBxZTzrd5ZvteeNhJEbLBaUB7nWJJvNEYZq1jYlCJJ3pADH/cu7+ocjtMePqj2UYVwncW2o/mYpwprbYWsG4hESV4upN2ipMSzRFr9L5jjjMevR6glYyQUhwW4XkjhWJYYkuQsS+IVEljR42/qVjf5DYwTYeCHX5fap4fy91BNIjw3crDAdJvHa7Y+A+xrEKe4Xzh8kgGojwFw1kM21zyrOQA/Ck46O7TQqhf0o/QimnDzD0P56Z3/UWPl3IJq12mt1GLzPqF1uFpuvV2AT7t2or57m+GxLYwCpNIL11qAutqAfldUCE5Ng81xs/0J9nCpDO6JJBFunHQLqYRnjw/pBZvqmhV/lfb8ql1p/2CFWGx0RphTynt7wp3xectbtFqWqHP56E6aoIjh0DaU1F8vbIgfQiW42e6hFxXQrHqZxGlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(316002)(6916009)(8936002)(5660300002)(66556008)(66476007)(4326008)(41300700001)(66946007)(8676002)(2616005)(38350700002)(1076003)(38100700002)(86362001)(6512007)(6506007)(26005)(186003)(52116002)(6666004)(6486002)(478600001)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6kMuhlCWZliV0pu16K6Sk2TV6acbX0A0kmf1+O0qEFaJZyhynFKQkGlYbKuP?=
 =?us-ascii?Q?HMelidiP+GPpPhHc6sWXFLOkB5xyEZw6FsrediyH/zJdS5OrDLUSBz2VUfJD?=
 =?us-ascii?Q?82Pm1gIGe8jGOK2KC8YT3uLtwPDfw2wd+sRNCy0vAf2IhwRrMSdBZVuSmaBS?=
 =?us-ascii?Q?2/9a2KSd8TZd/xAW4gurokDRAX87k/FFGPYHaiTyLfjJ60dsEr5kz4bjawtv?=
 =?us-ascii?Q?rr4HFtL7vCKjexs/U/tp+BGwdqSi1sGxG6gaaCk1448jeTKjIKPB9lSfc+t9?=
 =?us-ascii?Q?migQ838wv0zxkGhWgwpQjkrE+UIgn8XiKfXIv57as+qnsRT8eP+3aGkElfyC?=
 =?us-ascii?Q?lzDVSQALexo0Vp+Uix5hxaAEk8ETrn2Yq0oB9imKsqLDQWG113KgKv+B2M4Q?=
 =?us-ascii?Q?ojUKAJPLuehJH4li5orv8rWzocgmJoVg2B/O9smlSmB4dcerm9MDkhMJYjl2?=
 =?us-ascii?Q?Jo4BItNI9Jo6Vzwj08wOnzoOrOp6PIvSm4ZSPL/P6TwK0OhP2ajJr/N5ZruZ?=
 =?us-ascii?Q?YhrJITGqLL2AIT7jgX2SY3zoMjaPbq/A6yAaZQt3S3cf+Bbw6/5IQnpiEQ2g?=
 =?us-ascii?Q?8pFt9T8osNwL3EFQB+ykNR7FNRUi/+7tgJMsaDdL1cBcJ/UtkHDixw9ajof4?=
 =?us-ascii?Q?fWTKSljwE2dYpMY5wIP08MOW3KFRoSwz9HsnOxM91goYxOhClbqSZZvtZ2Ls?=
 =?us-ascii?Q?gjt2tmtdmb/EM818z6Z9elaWbPdRct2hYv8fvmPGl24MYI5R7qApLmnUR6sU?=
 =?us-ascii?Q?7ivjR2xosJRrz6msbTnSFYojicvkfn0vughbCu0APLvajLV1FfO2uzj8V79a?=
 =?us-ascii?Q?1HFNZNiKaX38vskJWjsj9kwihXE/MKDqBa4ZNHESx8Zjue0o9oNAq+x1dyVz?=
 =?us-ascii?Q?adcDHQDwPgXLiYnX+uVIY28g9RGstZRfFnqbnOjr6IsWwW/qDH2y4MkghwYY?=
 =?us-ascii?Q?D5JUIJrNTI0jHT07PtLhmIIsYUmmpXaqhcjmxBG3DtYq8GjmJkGOfUQ8JHjF?=
 =?us-ascii?Q?8ZKzr3nIIuIcwZ0CRDxU6f2qMg5m+eJjQijB/q9F13Ofhm8CCjVgXYspj0SJ?=
 =?us-ascii?Q?Sj6nDwBOec4o0itHsB8DDEQpUCjBilKKawduOAuDddjR6fXtZyksM4UOf7iy?=
 =?us-ascii?Q?64J8poadrMcngGok1C9y5Lhd5+CJGpRta1u+RbS4+S8DlzWEEjaRS2n75E8x?=
 =?us-ascii?Q?zmHEVYhR5FPh4q1zmjFlb6/smTh7N+MzmqVAhusG1x9Nd682DjueUmrtd9l2?=
 =?us-ascii?Q?6V3gHPYtOr+j51eGp5g8ZiLY3nZiV1eG2c2VKff0FtXmB6Xe2Rhc3w39ka9R?=
 =?us-ascii?Q?2qkscmkEgyTQN2wQRiHNepmC6/HNVZmMNa3QPpRhSBbsw7XshaLcGJy/iCcl?=
 =?us-ascii?Q?BEc0CMnwnkhTP4aQBYi174WO+UCOnlbva7/XsHnkd5Fxx/7IsSuZheHVvBTW?=
 =?us-ascii?Q?iwNruLFJ5hp50h4JYfPk7YFQO34oYNIqipqV8zKPAVh7Ig9kEjDzJILCQrWL?=
 =?us-ascii?Q?4OORXcdYmfaH/lOJPVAgD/YxXjsgnrlqIw82PVI7ZJoUk+1BKVLjLsEEZaM5?=
 =?us-ascii?Q?quaI+R775APzGt88O8CyfxLiYDYDU3gs66iEp/gJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98805bfa-fd45-4857-5b36-08daf8843e02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:28.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x0IKCyn57n/JsyB8O3vQhxSEPtSNEhef5f5nlBzHA0yrGApqkedU4Dn8aBC+6aoj7sVF8gct8H5u+yN6Sr+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9373
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
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Because now snd_sof_set_stream_data_offset has compress
support we use it to set posn_offset for compress stream.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/compress.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 8e1a9ba111ad..8d205eb16d2f 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -10,6 +10,7 @@
 #include "sof-audio.h"
 #include "sof-priv.h"
 #include "sof-utils.h"
+#include "ops.h"
 
 static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
 				      u64 host_pos, u64 buffer_size)
@@ -237,6 +238,14 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 		goto out;
 	}
 
+	ret = snd_sof_set_stream_data_offset(sdev, &spcm->stream[cstream->direction],
+					     ipc_params_reply.posn_offset);
+	if (ret < 0) {
+		dev_err(component->dev, "Invalid stream data offset for Compr %d\n",
+			spcm->pcm.pcm_id);
+		goto out;
+	}
+
 	sstream->sampling_rate = params->codec.sample_rate;
 	sstream->channels = params->codec.ch_out;
 	sstream->sample_container_bytes = pcm->params.sample_container_bytes;
-- 
2.25.1

