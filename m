Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B566DD48
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:15:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CE660AC;
	Tue, 17 Jan 2023 13:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CE660AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957700;
	bh=rGZDowB938FY5rEc62uxZubb2Ip5dpb68llWewfB7pQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rtkVM1aGe1iILh006pjvePxPAwAt9rnmG0i4pQVxNxXm5N7cGT1ohzwWDbbc2luI/
	 tck/cSv72Qd1O20EcagocRXqRM4+5LLmGTuufKmi+kqewP9c2+thBE3Zx++8YEpD7p
	 qV7Q/Tx4mKUViJiaj2CiHcNKD6QQf65MMpnIv5LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14516F804F2;
	Tue, 17 Jan 2023 13:13:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E75F80506; Tue, 17 Jan 2023 13:13:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 933FFF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 933FFF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=dTeElcvp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbEtft/YaSHLAaGnolOgbg70T8Yxo0e2AZJbTYGDF+nEwdci750GvbBW1eHY3EypDKTEWu44K91O6En4cMYFMYC4WYmWcRJco86XC6/fxrF2rPBFd8H3JHY8pG1yQXyiwVnafzSQ5HtL3d+YeIsVAbC1GyunbN+wPbVv7c2YUYKJduVuCi0sKkcDugys0+WP3tVrMjJsEFlM0rCqP5vr8WTIjTfzRbNYk4hZe/QsOhVFzsfcg9P3dPQK2loomE6pbH0kKzes0eGphCA3zit6/HOljt8ty/azN5uUKdfCLWRZWhws5zriToHzgdUAtWkZ1/Ij4PwdhMlJz2R1jKx90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQFoR14869BPDFAV3d4Dnf4aqmzatPC7m64G6ndoUCA=;
 b=Y1hcn036saBlkstiPdFU1DxaRzTy0QQz3lhKZi50qRqv5OTfcM8f6lkur4qyzLZQc6yOfgWXDFYGZGSLq04/y7DvAK+JAiPeP1dQR/qHL9kdOF9S9aGiRS2dTvcTNkLUYlbR3YlCb2einYEj/525pFUczxPrC6OC3IdeJxeTxStWfWeI9WlEM+7mKbvhN92G6HyQCIr2LC/VXcqgC5y05oyZeix9iCE5hDvRcaV2zaTYjYH6i3HlujwIE/gwatmRBP9Hj9gISwmr6PYM7TPcS4r4GlDuaXNdYNWNr7WavJmb6Dh0+99Flqp2V08tQws2dN3ONlKQp9mIG8hoDGxUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQFoR14869BPDFAV3d4Dnf4aqmzatPC7m64G6ndoUCA=;
 b=dTeElcvpjRpVZOMXX6MlahOyce9pqvqVKORFunPR2QzG/mteE3dcuGQeefGUH2xnz6K9a/58UmH5+yIdOL3IOns3QJ7XqOeKKVAZeSEBqJu2tXm97gqSYeBUt3RAyybQ7n7CDGqYHByU10t6reddZH0otFyfUg7xV7fovi1BQ0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9373.eurprd04.prod.outlook.com (2603:10a6:102:2b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:25 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:13:25 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: Prepare ipc_msg_data to be used with compress
 API
Date: Tue, 17 Jan 2023 14:13:04 +0200
Message-Id: <20230117121307.200183-2-daniel.baluta@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4d71e718-acc8-4325-6a26-08daf8843be0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0upXdcoeqosPJSXXfuOC/bKs8yrarx1Sg2yMH3cowG30Xv55s2w0W5eGSBdd3Gsv4x7TGU4++DCREm5/XO/GXzcFShF1HHWVrTiZlKwu1Tt1roYEbkDDZYeYvYUsLfmpjRYeEq2Ayuhti1Xxa6w5QnRujeYbEQvWYVlDgPiEXyqUWFhZlCQ2auaiYhvrMUBi/Vom8oV/2VLkTdFPad4zWV7inyTVnTHtwbPGxweUHHG6MDMc4mEkUPsOxbFQj7OUPYAIm1ulSE1I53OwnTQs6V4i9Z6phW5AEIf59yIu0M8yOHnQPGXDXN7oH84uUORzzAPXnf6CnG5aNJKKhzTuoCxqEVXzM8BY863gCkYh6tj9zMoafkTzuFZ6rw/agdMvJlOoq9w34BxKkR1ACXmAJ/EMQQRJvmef9Y3VT/gGXn5VNCIG58gNlnzAfmJ/62CzF38DPV4uZJw+hmuHEIkNFj0OPQzp25a9FvkSXSGnpzKqhPyNMB5JkARB7XyjZnAYQQW5bbqiiKQgfVrdRV5Ex4JI/xMwZqa9cVoBtpDhGshTl46fuonySOmCPkj1VPwXXwvtyVes/0cF9lwn6XpSd4B6S1t6Xf8fS7pWTbXASORE/xSAFyeq/Fhc46XFs2OTVSu//0B5895JRrnUUSqOJrhipWYjOEcjEzBtprtn9tmm1s+j3M5T1KOEYLokAvv3GCWxQbmxPz0yXTdUoDa7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(316002)(83380400001)(6916009)(8936002)(5660300002)(66556008)(66476007)(4326008)(41300700001)(66946007)(8676002)(2616005)(38350700002)(1076003)(38100700002)(86362001)(6512007)(6506007)(26005)(186003)(52116002)(6666004)(6486002)(478600001)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aur81q+syCvUB3B0DDky/EEjpPduTit5F8dydbJ/tIf4Ibkjgba7mL8EPFuw?=
 =?us-ascii?Q?wUoPYm3/9RpkwtngrBeMIrgPNu7lzXVKkKib6hhUy/mr6chRNdhtkYfaRVFV?=
 =?us-ascii?Q?TfzrRCK2Mc3DjmihwFo48f8k5xUDa84QRMOnTBKqTrjtt1JCZi5ndGEcN69V?=
 =?us-ascii?Q?/m5Cri1u14WQMXGvQg2nAOzLIx6U3m5VCa3EADxKh1/mxCdNnqyaeSp3Rkrh?=
 =?us-ascii?Q?GJrxPv8PFs6Q3DXdFG5AbVU0qvZpx/4R2aMGLk6IsDjUmcKNSF6ra1UgWG5W?=
 =?us-ascii?Q?q3RoGgVMHkyNLm/H4tthQ3n2DHms2m5Etl6GAL7/sStVYuEt32hsgaS3ep11?=
 =?us-ascii?Q?cZ15J+ywDN6+xNcB5EAbsI2qWJ9EbeG4lBpcZA/nUfsadrJ73gs7N5x3ouPv?=
 =?us-ascii?Q?7F7/6uKstiW8L3q3AJR2IFT7xWCEHymwL2rnO6c7xFNiGDt4GMrcpfOPrd+B?=
 =?us-ascii?Q?gZ9Y3PVjdodtG3rOsG0u0ALWPTpj+5RKcyAOmzlcMs9fLp99yhV/OHHnf5lZ?=
 =?us-ascii?Q?T+11DVMtUP8gndPTILFnc6TE4GtT9lBnBmNTOV4GlfZ3A9RR7slj3IFvnF7p?=
 =?us-ascii?Q?68uKmcTMCt9LDrJJyAsasd6DeGUFqIf/XHEkkNXV72CUbDakXLROvBWax/Ot?=
 =?us-ascii?Q?9hFz0EbqnZZt++yJkgRnab7pg0vwbaZUP0W958fxdgWr6nShvQ7lF5iJR4+3?=
 =?us-ascii?Q?6I/2fZpN84aTMYeJ0miBTZwwF57JxtRI3p64DYK90LEIJ6ZwkxtJAItwOY82?=
 =?us-ascii?Q?jQ0s2w/PjcLTl2Bk7qF8T4JIrG5PjJMsA69OTlxH36prRtvF3rH7RUzxdaDo?=
 =?us-ascii?Q?n6YSdIjh3KbrGJdN0va94MJD2dIxEy/TClHX0coxCL4N6lbN5IPsAT0X3puf?=
 =?us-ascii?Q?91YHlrgyiMrTwq7DKGboh5l4y9Ee8CHlKpbIVyG5aNDbxtn8m3sqaHy/kaU1?=
 =?us-ascii?Q?Wm3IH80g9F3k1RZ4bkS2RSiFRSrAmIIPU1szTWl4H2jSg9/+1Dza4/1Iaxya?=
 =?us-ascii?Q?Ke0Efm2QcNJAaEfXF/0dlZpMWCEi75BLUDIBW4JxN74eZuRLzOTeS9bl/f91?=
 =?us-ascii?Q?ppdoZ+JjfnObl07ZLEf3+ODDkPXOcBNV+L456570gay0UlwCwFejRrSZqBJi?=
 =?us-ascii?Q?Y0ak+Z+ZaR0vr+JYHLx2pfSe5AFKLqiTzuPZJtrk2DrMx3cxRyva+/UcS4WG?=
 =?us-ascii?Q?TXGSTBg9knLWoqs48Prbqu4triPh+htbSBB/ftCnieJxWpBaD61HlKeQwTjH?=
 =?us-ascii?Q?GmgNYxZNd2WImM80BT0Tk6oMrX5mH3YZdXCDjROEsynX0YR+Pj9UXPu2pZWa?=
 =?us-ascii?Q?JkMrlQoqB48NKIcIFcSlMG5NutZQHLuQrymR8la6HAMfvgrbD+viW+rHdeue?=
 =?us-ascii?Q?4zzmls+U/YLcUoYAS3ca4jeI3EafoQli176sQXRTLT/dhaqaUNEZ2EFYyK9F?=
 =?us-ascii?Q?IyvvEgoH7MCq6Svwmy9QWA3QmnF2M6NhKEnYWDzGz4HJvrVTavr80Ak2/FVF?=
 =?us-ascii?Q?KLFjGb5OdsbrR9yYtTIf4r0fxghd0GorH6uti1bZFCAyCLTuYIhKx4QPvPcO?=
 =?us-ascii?Q?9mJHuMPa/He7gC60s8aUwcVs5kcYN6ZV1+r0fFwS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d71e718-acc8-4325-6a26-08daf8843be0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:25.3405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW5LLAnth/1Bl78JClgBIMSxuraD/+4LCWI0QHEd+MAYcWdpKFip4893HsZjvJcim9hMLSH3Gy78CbZmWP9lhQ==
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

Make second parameter of ipc_msg_data generic
in order to be able to support compressed streams.

This patch doesn't hold any functional change.

With this case we can use ipc_msg_data, to retrieve information from
DSP for both PCM/Compress API.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/acp-ipc.c            | 5 +++--
 sound/soc/sof/amd/acp.h                | 3 ++-
 sound/soc/sof/intel/hda-ipc.c          | 5 +++--
 sound/soc/sof/intel/hda.h              | 2 +-
 sound/soc/sof/ipc3.c                   | 4 ++--
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 sound/soc/sof/ops.h                    | 4 ++--
 sound/soc/sof/sof-priv.h               | 6 ++++--
 sound/soc/sof/stream-ipc.c             | 6 ++++--
 10 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 5a02753c4610..1f614eff2a68 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -200,14 +200,15 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 }
 EXPORT_SYMBOL_NS(acp_sof_ipc_irq_thread, SND_SOC_SOF_AMD_COMMON);
 
-int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps,
 			 void *p, size_t sz)
 {
 	unsigned int offset = sdev->dsp_box.offset;
 
-	if (!substream || !sdev->stream_box.size) {
+	if (!sps || !sdev->stream_box.size) {
 		acp_mailbox_read(sdev, offset, p, sz);
 	} else {
+		struct snd_pcm_substream *substream = sps->substream;
 		struct acp_dsp_stream *stream = substream->runtime->private_data;
 
 		if (!stream)
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 4314094a97fd..d8cc2a92f1c0 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -12,6 +12,7 @@
 #define __SOF_AMD_ACP_H
 
 #include "../sof-priv.h"
+#include "../sof-audio.h"
 
 #define ACP_MAX_STREAM	8
 
@@ -211,7 +212,7 @@ int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_ty
 
 /* IPC callbacks */
 irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context);
-int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
+int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps,
 			 void *p, size_t sz);
 int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index a7c454e03952..5705279d0707 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -361,12 +361,13 @@ int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 }
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz)
 {
-	if (!substream || !sdev->stream_box.size) {
+	if (!sps || !sdev->stream_box.size) {
 		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
+		struct snd_pcm_substream *substream = sps->substream;
 		struct hdac_stream *hstream = substream->runtime->private_data;
 		struct sof_intel_hda_stream *hda_stream;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index caccaf8fba9c..e6f1ff591332 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -656,7 +656,7 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 			       int enable, u32 size);
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz);
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 1fef4dcc0936..8e936353c1c0 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -847,7 +847,7 @@ static void ipc3_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 	}
 
 	stream = &spcm->stream[direction];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
 		return;
@@ -882,7 +882,7 @@ static void ipc3_xrun(struct snd_sof_dev *sdev, u32 msg_id)
 	}
 
 	stream = &spcm->stream[direction];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read overrun position: %d\n", ret);
 		return;
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index dbea604ebc04..597cb4476acb 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -494,7 +494,7 @@ static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
 	}
 
 	stream = &spcm->stream[substream->stream];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
 		return 0;
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 5b04fec9c9c9..42bae574c87a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -520,7 +520,7 @@ static snd_pcm_uframes_t mt8195_pcm_pointer(struct snd_sof_dev *sdev,
 	}
 
 	stream = &spcm->stream[substream->stream];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	ret = snd_sof_ipc_msg_data(sdev, stream, &posn, sizeof(posn));
 	if (ret < 0) {
 		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
 		return 0;
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index c52752250565..db92cd338467 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -472,10 +472,10 @@ static inline int snd_sof_load_firmware(struct snd_sof_dev *sdev)
 
 /* host DSP message data */
 static inline int snd_sof_ipc_msg_data(struct snd_sof_dev *sdev,
-				       struct snd_pcm_substream *substream,
+				       struct snd_sof_pcm_stream *sps,
 				       void *p, size_t sz)
 {
-	return sof_ops(sdev)->ipc_msg_data(sdev, substream, p, sz);
+	return sof_ops(sdev)->ipc_msg_data(sdev, sps, p, sz);
 }
 /* host side configuration of the stream's data offset in stream mailbox area */
 static inline int
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 752bf46c7bc9..39b015c59168 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -20,6 +20,8 @@
 #include <uapi/sound/sof/fw.h>
 #include <sound/sof/ext_manifest.h>
 
+struct snd_sof_pcm_stream;
+
 /* Flag definitions used in sof_core_debug (sof_debug module parameter) */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
 #define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
@@ -247,7 +249,7 @@ struct snd_sof_dsp_ops {
 
 	/* host read DSP stream data */
 	int (*ipc_msg_data)(struct snd_sof_dev *sdev,
-			    struct snd_pcm_substream *substream,
+			    struct snd_sof_pcm_stream *sps,
 			    void *p, size_t sz); /* mandatory */
 
 	/* host side configuration of the stream's data offset in stream mailbox area */
@@ -761,7 +763,7 @@ int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 		   u32 offset, void *dest, size_t size);
 
 int sof_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz);
 int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 5f1ceeea893a..13e44501d442 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -19,6 +19,7 @@
 
 #include "ops.h"
 #include "sof-priv.h"
+#include "sof-audio.h"
 
 struct sof_stream {
 	size_t posn_offset;
@@ -26,12 +27,13 @@ struct sof_stream {
 
 /* Mailbox-based Generic IPC implementation */
 int sof_ipc_msg_data(struct snd_sof_dev *sdev,
-		     struct snd_pcm_substream *substream,
+		     struct snd_sof_pcm_stream *sps,
 		     void *p, size_t sz)
 {
-	if (!substream || !sdev->stream_box.size) {
+	if (!sps || !sdev->stream_box.size) {
 		snd_sof_dsp_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
+		struct snd_pcm_substream *substream = sps->substream;
 		struct sof_stream *stream = substream->runtime->private_data;
 
 		/* The stream might already be closed */
-- 
2.25.1

