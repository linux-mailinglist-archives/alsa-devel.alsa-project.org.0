Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C477466DD50
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3DF4619C;
	Tue, 17 Jan 2023 13:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3DF4619C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957749;
	bh=3dYIBo2YhVKETSxboSicoL7ymV4MLLiyACpr3dY4+i8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=en+J9Wf6y4/eItx3iPdGCyWNivQ54xYZUToRz6xnUDx2vG9o+gCf9ntdNyNlFVo1X
	 48iAFhVpConiv9zE1dpGMhKEjFsEEhsqbvO23yYWg23Azlpi/RYYI1zua1arL2RGtk
	 vhEeseBH6/3G954SWZmaZcYJOTVEO2R6fRFNqbAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF089F80564;
	Tue, 17 Jan 2023 13:13:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B55FAF804E6; Tue, 17 Jan 2023 13:13:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6513F804E6
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6513F804E6
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=VrpuXv7n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMmDMtHc2yFnUdnP0XQ1ZI2mVrYReM3+DUXE0Oo8ihynbl4SpLoRjdfD488CVf+YgKxllwGXJHebzQZ+0R829VHdaxaNJIplu/kfy9C31UhLD57espgB4/XZ+9HmYXTH5jtGQgAiRfnDoJaEQTbHRcwoNspCs1lwba2TLI6szPJelzlQHRYAFkoPOluedlBDR2ZuqLkU9SRfkPiNcMZJwjsgGBWqd0+zSBXLkmF3L4JLAkN2pm4Jk1iXX63AH/VNPz4CkEEPpl8SSYRPNpiAkvD6ree7wlOjACxYBaChuIPmIXlGnHF3/SkE81WmiaXktWzDV4oEN+DoX2vf4QSa+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlZ0D3uPJ8Li+tdjDdPmIc98pNQcO1XVPWTj8bralP4=;
 b=WaUmjtGFpehq7sLGbmYc+fc3tMvtgCeptyvjo978Upg124WLunV28VJD6sIfzEIjMJ7rlIuxtNv/3d689Vk/rf97HdNdFH6RQA3s/BBFqj0cDgMIOy9OtoaR3XfVThtflZ2/y3sUCe31bmgx5XItQCGmJgcaGmXd5X4obbhJTUCd/PulhK9DGSEgL5Xwnc5oLWNtzKrsaTTTad4aoKu8EYDbImzD0cjpGSXMDtUtq1Xs5RpOomXTUu/1yPXdhWgGsdbhTZYNlqsPv78ZdgrlsIs5XfMkHvAGFkRlZEj9jE3EKGsqzBtgC8sL3cIGGAwo0ug6MRecSEnHRHt1ZAwKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlZ0D3uPJ8Li+tdjDdPmIc98pNQcO1XVPWTj8bralP4=;
 b=VrpuXv7nwxvnyp+Ij9CxrgMuq4q1SiAv8aV/ntjwnS/eU/Pga06jqGsOqiSBGhWwqVBU1UzMskMccsWh5E3dzs3+E2r5QftOLKpgTrIFCZPpmivH7Y5LkPQ7d7skhECUcKaAaGcK0W14NeVe1SarA3UkvY7d1dfr7l557dQzabg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9373.eurprd04.prod.outlook.com (2603:10a6:102:2b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:26 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:13:26 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: Prepare set_stream_data_offset for compress API
Date: Tue, 17 Jan 2023 14:13:05 +0200
Message-Id: <20230117121307.200183-3-daniel.baluta@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cc77ef84-71fe-4868-8541-08daf8843ca1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7oQ1tDNEsYp+RZEsjohKMbsx9yZ68mqos0uq90LUoOXxK7jNph60WhPwzejDfJFf5Q6q0frQT1VdRUa2EN+zFvXBnoeDMjrj9I1BUv1M6nAD3QlxbxNAuafSikVpBQQYz5Qu7QEB+3PlWkpvAwQNb8yZGf4aiGrEcGGHctuqiUtVFoAFFe6k18MicVFoYSI6rGfsBuj8Rxr59CKENjDC9YRfQhyRYkJ7Ue0Eb8x4XhsE6Q1WWsZxNNN/cfwQpgo0XfXf4ODNdsNFiTVJoLuKy97ZGbOA7j45Cjb3Cc08bFhI9TIA2SBLRdCVZlzMvcvinDDRKjaoqTNBc/r4kRSUIwKWqC10K3aipgvBeTa44X1OuKpwqalPFIY8LKLUO3jito/By5xpnwN3e6Dad7lzn+/WyiOCZZKcjjKkG9qZ9906AMyiTwk5wbfowlimf5YImW4/mCLL4V0QqHtyHfVq4WMqmAIl8jLSuFPE+ltHikxBYhYckXukIj/9r4AJQ2ZdspYlTKcyv5cUGI0T0v35MoICy3Q+S2VGyOWk4+OmTM4B0B2n8fiwCfqhV7opYK7L9lLRbrvNpgU/mrEMZzf9rPrAcfexn4YoUe/oj8f6seBtvX4HxDdmrQMmY185o8mWREm4AvLa0TD41446LxkdmkbicNZdgE1zzj9bXyTW0pUAGEeQ6VLTQdkDIi3VQiomz+Pqfm9eV2AmQVq3f4HRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(316002)(83380400001)(6916009)(8936002)(5660300002)(66556008)(66476007)(4326008)(41300700001)(66946007)(8676002)(2616005)(38350700002)(1076003)(38100700002)(86362001)(6512007)(6506007)(26005)(186003)(52116002)(6666004)(6486002)(478600001)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phnO8zpZDzyvD/bu2wkSgFotzPsQFhz8s4ho1k67yiE3PBMcIB32Dqu/ASOt?=
 =?us-ascii?Q?HoN3l4Q9xrpfF3SL2i1+y7yzF6yFZpoVQvgUbiZCyE3oz1t16yN8849Oii9a?=
 =?us-ascii?Q?GjQxaLo3sNEqXnpSysNzujokZJNJopvINf+iyICTXTCSVotgBPyshnMPGW1j?=
 =?us-ascii?Q?sNCIp8N7mcFQhITRDsIXoiBci44GGyLWpixactDBp5DtxLsco7de0cqb1WiF?=
 =?us-ascii?Q?rLBO50N/oLIhYuAXevxqbWLo9v1+oewonDhiPLkSPHo/GlPriAnVojXBRm9Y?=
 =?us-ascii?Q?K9+eG3F+bemCedNeZT3rk9MKibIUSzm50GWtHtQj1Tr7BBekOCnKb9QlaZ77?=
 =?us-ascii?Q?k48CN1HH90fJPrkOTeBlFBsFFA+0JKhw9Da1um8/Bp0pr0gbgCiFO/N+rtLB?=
 =?us-ascii?Q?8MT7jlQKHrB3YBYffiTxjSqJ3Trgv31vkZ/tgpr6AMxIAfViHnnEMqUf8Raa?=
 =?us-ascii?Q?9HyqFtSe7A9277OAnUm2F0ODH2uh4DSaoyzHeV0pm+0q9zP56tYM+aKIvOYd?=
 =?us-ascii?Q?bRoxo7iRlWWzq34tSjn1oUmTPvBRvZQDFtI8J4f98yc5MD0d3c32RwR5jYYf?=
 =?us-ascii?Q?fOjLAI6CRVAHamb7Kg5p0m6+5vNogtyOqF8S0AI+6fbPXnKcZ88Swx7DN3kt?=
 =?us-ascii?Q?yVW8Zy+T2RdUebYv8z6ZuOGoFW/68vLWXLZxYu4ca/oWhV8wK8sQYxb35RYK?=
 =?us-ascii?Q?Q2LGNfB9yNB8sZgtsjMuP6DTVEjaFCKdw4SINUbXOV4/cvWWruha4GAXVdSN?=
 =?us-ascii?Q?nIz0gFzggq/a9AapqYB/fJ/2v5MHa8ya95FfDuqo/CxghXrOKsWnwZuBUm+l?=
 =?us-ascii?Q?jGcJYCQ6D5cMD8M3U1xbQhPKvWR1ylnhmrs0LijSSKd3zSnZ0Bf090w9Gugf?=
 =?us-ascii?Q?QhBVG6HwVmGSnmQcKwu45907LgCD7IOQw6+crebGXmKo9eidQNqCfihNykrG?=
 =?us-ascii?Q?dfZWlprIL6y+ntaxKXyjFLOyjRq/A+SBSN6407l0ULxKjXkJ5TcQJRwWoA0U?=
 =?us-ascii?Q?8eB0XmOXznsa2bTjDcTP+70s98LwPTOt00wrhzKadXqJjlcsQpYH5x35biru?=
 =?us-ascii?Q?rEC3bihVwGENu9/Ie6QKb32ot6sVdEgYR9grtQQkRB+dXB1ACxMpXHQAR/Lz?=
 =?us-ascii?Q?uIsTK5FP2DjwZl2xVHY4pMn5mtzIImlVjzTHlZHwWVKh0LHqPFy5C3sCZCmd?=
 =?us-ascii?Q?ZkjX4INMUoFJgDJrXR7W0qNlJfI1erN9AKd6qrMO4IRonPEvbmVYnDMFNLtQ?=
 =?us-ascii?Q?V/kdu71CYTVWLILqEj+TIoRAfMWnBSYLW/YGAAS33rcQ40iQajhWHyCIg9K7?=
 =?us-ascii?Q?nYGLcuEhObIjK/dopkR9Me/7YYhNn8bSRPsGK8bi76Q04UZabr8gqcUJ/POp?=
 =?us-ascii?Q?qlSSGqnGYNWcpI6RiNO6ZGIHkvPwAXCY3heZKw/85ksWfd5jxhjbT+2zEXki?=
 =?us-ascii?Q?Mx+xSq1JRQ+52KEhpXV8RIL+WLI/nzvueoAUWH26UC7+cqCMpO7YP0BVHKwt?=
 =?us-ascii?Q?xyXYz10PTCRmdjNaoJL4DI7ok2gaoqZqG30JLrpiP0ZAuH0ecbJUFAsDRNPX?=
 =?us-ascii?Q?Giu4lB7ALIJ3oPB3Jhb2J6ONjaXFdzzDZ7KQTKo+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc77ef84-71fe-4868-8541-08daf8843ca1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:26.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSU2tHnSH8ANt3nHCrLHLm9+q02RaZZzqBbGshPlhAtObISUy30QOmHt3bE+cJQSFou3D5oMqAZh2CGNQmxpow==
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

Make second parameter of set_stream_data_offset generic
in order to be used for both PCM and compress streams.

Current patch doesn't introduce any functional change,
just prepare the code for compress support.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/acp-ipc.c   | 3 ++-
 sound/soc/sof/amd/acp.h       | 2 +-
 sound/soc/sof/intel/hda-ipc.c | 3 ++-
 sound/soc/sof/intel/hda.h     | 2 +-
 sound/soc/sof/ipc3-pcm.c      | 3 ++-
 sound/soc/sof/ops.h           | 4 ++--
 sound/soc/sof/sof-priv.h      | 4 ++--
 sound/soc/sof/stream-ipc.c    | 3 ++-
 8 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 1f614eff2a68..4e0c48a36159 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -222,9 +222,10 @@ int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sp
 EXPORT_SYMBOL_NS(acp_sof_ipc_msg_data, SND_SOC_SOF_AMD_COMMON);
 
 int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset)
 {
+	struct snd_pcm_substream *substream = sps->substream;
 	struct acp_dsp_stream *stream = substream->runtime->private_data;
 
 	/* check for unaligned offset or overflow */
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index d8cc2a92f1c0..39165ebf684b 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -215,7 +215,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context);
 int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps,
 			 void *p, size_t sz);
 int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset);
 int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev,
 			 struct snd_sof_ipc_msg *msg);
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 5705279d0707..d7e16e6b6f52 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -386,9 +386,10 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 }
 
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset)
 {
+	struct snd_pcm_substream *substream = sps->substream;
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct sof_intel_hda_stream *hda_stream;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e6f1ff591332..b3080b82ca25 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -659,7 +659,7 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz);
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset);
 
 /*
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index f10bfc9bd5cb..b29d93e0d216 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -129,7 +129,8 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	ret = snd_sof_set_stream_data_offset(sdev, substream, ipc_params_reply.posn_offset);
+	ret = snd_sof_set_stream_data_offset(sdev, &spcm->stream[substream->stream],
+					     ipc_params_reply.posn_offset);
 	if (ret < 0) {
 		dev_err(component->dev, "%s: invalid stream data offset for PCM %d\n",
 			__func__, spcm->pcm.pcm_id);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index db92cd338467..febe318b9427 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -480,11 +480,11 @@ static inline int snd_sof_ipc_msg_data(struct snd_sof_dev *sdev,
 /* host side configuration of the stream's data offset in stream mailbox area */
 static inline int
 snd_sof_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset)
 {
 	if (sof_ops(sdev) && sof_ops(sdev)->set_stream_data_offset)
-		return sof_ops(sdev)->set_stream_data_offset(sdev, substream,
+		return sof_ops(sdev)->set_stream_data_offset(sdev, sps,
 							     posn_offset);
 
 	return 0;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 39b015c59168..95a6b301da49 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -254,7 +254,7 @@ struct snd_sof_dsp_ops {
 
 	/* host side configuration of the stream's data offset in stream mailbox area */
 	int (*set_stream_data_offset)(struct snd_sof_dev *sdev,
-				      struct snd_pcm_substream *substream,
+				      struct snd_sof_pcm_stream *sps,
 				      size_t posn_offset); /* optional */
 
 	/* pre/post firmware run */
@@ -766,7 +766,7 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz);
 int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset);
 
 int sof_stream_pcm_open(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 13e44501d442..872a49550672 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -48,9 +48,10 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 EXPORT_SYMBOL(sof_ipc_msg_data);
 
 int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
+			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset)
 {
+	struct snd_pcm_substream *substream = sps->substream;
 	struct sof_stream *stream = substream->runtime->private_data;
 
 	/* check if offset is overflow or it is not aligned */
-- 
2.25.1

