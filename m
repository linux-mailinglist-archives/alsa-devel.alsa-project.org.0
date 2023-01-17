Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AAB66DD8B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:27:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464116752;
	Tue, 17 Jan 2023 13:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464116752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673958465;
	bh=mtAo8zPws0VRYXGcw5BzRlqT7CP7e7Rl/41P5tk/IuU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Msm3wHGvUlXKk3C/zZXSL3zEqLG/KeHeo0ZMEpbVRm3tn5oGVQK2J52CshBhTtJtM
	 P77Fqe4EX5Ef5QZreDAEkpaoKGM2xYrrXHdfCQhvwkfYDgO0FgMXIC8mzhRrXzlJwB
	 M4xA488CcZPhCL2GB7Qzo3YR4/eTRydb1tjhyMfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83289F80542;
	Tue, 17 Jan 2023 13:26:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A976F804F2; Tue, 17 Jan 2023 13:26:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64792F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64792F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=Troqtwje
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVOcq+ACgHSoax6I7M0CXipWHiwybVrcgxr2IQ2KGJS1YWtQ95fiyk0UaZh28y9KATWe59wqbaXtf92JkJAw9L/qPiBuhJiprTpknsvBlFBZH8Tu+GOMhMjr1II2EEYAFUtPw7VT93UE7lPP8KyM/opp0EiWvMWpN9Z7+TY2EgPiHgo711KtZ392RkKvMPxmRORc1UvVsL8lL29mq8KbcZDZOhXdR9ITOacyBck9IN8iJ3/XYk5o5aT3/uCb8dyXJG3p5vF8rR2F7yE5jdyzZ3NDK/M2w2ll0Y+0OMHO0Aq/Og7UyImAdEPYySp8Sp+E+5JFA2t6fvXDck8HFXJEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbFi+clgmN5VEedYv5rxv9lAICVnTHXqz/VvbTofA2c=;
 b=NZqeA4Hb4GC9uyJw3EuykaIN3UGHahGz2/gppLEuOswr3ZtaB3wBEhjFclLlAxGnvx403R5AKjURJ6aOZb1RctjCFsB/giC5VCqWzVcXuGgQEQ3bdKhKwnmCz5ayc9FEXWd+qu8d3UoBVInLjzADpObOmm0KeRN+zdWOaCpPjfpBF8cu4ZIxKi2YEzSlb/ZTlUD/uYW3ROMDbPtr4D0cYmb2U2wNaK6qNXVREle3Mdsa9vX4B/CPznNvyWC6V3NAlNVU+q099jHEChYcwQ+Y3mCdEN12u4ao8P6/XTaRbWarmbocky8+hIwlVnP6GHY/2cQQZ/7y1Ce5bIsNgIuyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbFi+clgmN5VEedYv5rxv9lAICVnTHXqz/VvbTofA2c=;
 b=TroqtwjeMyfowVyo6c1VE7rcvp30bfLOQ3gD2yh66rBgIE55ejUKR+l1yfAOLpZIwIQVJHlpD05fbfGIY3hhFKwSzB8/7uDVKd0GXpoE1p9mjjIZq/9nwONH5/wmiETXTkk3BdnMisXy8p3XEnVWChQOyt9zH3nt4toyBe0zPmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:25:58 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:25:57 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: Prepare set_stream_data_offset for compress API
Date: Tue, 17 Jan 2023 14:25:31 +0200
Message-Id: <20230117122533.201708-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
References: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 767bf056-7076-42de-ec2c-08daf885fc76
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rEBx4SIev70PSElexcwckBzePKwC/xuThKxi/QBIrIBBG6CfwYTpoeGRTJAp6TBwcphwyuNhouy9BVb2c/IpgMR2l4rrpFaj2YD7e1eoqv+hbUI1ED9vfzyCEpa/kR4OhAuLQ6umTRF2c4/nvonppAMfVGiJhbZ6/lLb/RWcFscxbqmZMMu0BM5kJCN9R8I4egJ1+yykUw4delBnODlK+GteMimQkaXTkWvEq5jQgF5PcHzt55Z/9AhIY2xMggj007R0AomcXNnnSM3KxGslxt0/pT+4Hx+T1eyUBoMQhqmnTJVtuS5f8IXb+gMoBz4QapljsnvMlG7HK6r/7VHz01oKkWQNUVSCO4ORDmBHkp27Cy5rM4mqR234Fx5Q/n/c7RtAkeDbOZOHOutItVYSqgjG9Wa16nf5e6VRdFSho9yi/n5HFY+uUtwYsDFLZPqye3B8kyuwJxuVwDXNhBl1qEdp7TjaP98H+3c4GzSfy9D4IV4XKr6IyldJJC//HiWl8kcSrm2sRGOk/qJmG1AYcx8dPRy/z63loRoNsRcpT0/oAYJA/ma/yuAebxJjN0CSSKbK6D1Lwj0Jio0SzV8BEZs8TtfzRqiqp+1bu2J8P4d9D/wYI+YwV7+JohaX/QYGuau4TYGYoPk+hkBHxW1uMbBmmXiuOnSIfff0tNNUghl+UwsYwKVdxHAQ44tmJYHmyMG/iWpxNol6GLpPdUJTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(66476007)(66946007)(66556008)(41300700001)(2616005)(8676002)(6512007)(26005)(6916009)(186003)(4326008)(86362001)(5660300002)(83380400001)(38350700002)(8936002)(6666004)(478600001)(38100700002)(52116002)(316002)(1076003)(6506007)(2906002)(7416002)(6486002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zIXFmXEKR1YsgaFLThjqqKmcRNohhBWO+WuFpn5kv5+p0/3yz3a9++DArIxf?=
 =?us-ascii?Q?gZCce/HvtHMDkzjuopYOU2x9DteSKGS15ASIWoguu0OYNAB5FAJuzfKsIljM?=
 =?us-ascii?Q?GrYv9quI902Ba4GHOcVKyyT/0CnVwpuMVqJ9TKjxUDX20ac0wMRdwvAktMxu?=
 =?us-ascii?Q?+ytSbZ6Xr5bkKv91p24aXSDCN3dCXK/yiOVN7FWoZft/KvtTIHxTickl52uM?=
 =?us-ascii?Q?ra+6OUeiCwR6SfkxXzjFlHX/k29rkJWx16sH8C2148bzQQEPCZbtDsmjXaqg?=
 =?us-ascii?Q?D3SBAxjfdbVMHqFuymCuMPx/cHVhRalfiRQS0K3xH46A5FSkmQNkYNd4V4D+?=
 =?us-ascii?Q?8MpZSzZTH3ECjFDpnMOXSHBD3osfbSiKO0Nl5Evsl1LZtimpY9NSy5XT0NPi?=
 =?us-ascii?Q?surGbLXOUQBz5mcxSEeXnpegeuf1JkJg1e5EUbit7Vx4Zs3SLd9avtOVcE+T?=
 =?us-ascii?Q?UFL2Wo72qwswUgvZkGdtVR21RYxjrzvjmwVkE6VQAI6EWUXMCudJF4NwJHiz?=
 =?us-ascii?Q?HwKzMeH5a+y9a9LqBwmPvNj42+ZKoeKIBFqsqdC6uPrtEWX4UuS4qcLhHaJU?=
 =?us-ascii?Q?MvhNOKknxB9vJwSugu5zugx9WoQis8rNLA2JkrpRUPv8cx7+8vtaGWdKYQY+?=
 =?us-ascii?Q?nW1pMCmvFMYQPkg6qFe4GSWJDR0AkFY2ssqudDO7Sh4JmVB+N7QBqXxmqyRJ?=
 =?us-ascii?Q?Jy1Z88kgh1zDGcQK9IX9Z2x59glnilGPHrDvkCs9F01ExuLDyl8HX3lSHByQ?=
 =?us-ascii?Q?AcswtpH78cIGcvylJtQLA/GW6NUDHKeE4tFYZxNv+Pj+SGb2uDiG8m+c6muX?=
 =?us-ascii?Q?PA2gQXQHGmpTtM7FIpMoVDlmUmmmfgkgNXBkw17h1cRA1pnK90u7cJ7B1scf?=
 =?us-ascii?Q?H/ktBAY0JLLQvsWZaizjDANdf0oXnMVCWxTvZkq+krZSBcMWoquygFUxpTIt?=
 =?us-ascii?Q?S63GrKftk9ANJCwG06Tox8kUrNpeFhhM0cBIUiGcNXJpXclzMaMHq7Q+nGoF?=
 =?us-ascii?Q?Ys+hV30ue590k1vFYVT+wXp3pcNCxZMTnzdiJsffHgwcvsZh0CajZ02pL96O?=
 =?us-ascii?Q?yT2JnBlpGx1f4GZOYIUzRwOqT6JjamX58hHxJ0+JwTIk3KgXMU4Pm0tLqNvs?=
 =?us-ascii?Q?IRTkiRA+nBOZqdK5nUTW/in8SACvlx9EkUWi/0U1GNzFLoEtIw7Fe+C7B9rK?=
 =?us-ascii?Q?QrwSpjzIsDsoy9RNu6odFRXBwIJCi2aNKFQPiA+wer1obAJ+ZyZ4SFTZjd2G?=
 =?us-ascii?Q?WE2PJbMFiw8Z+SXfZYV4a2imbM94Cmd0QCIKuccaOIWXRzEHUQscqdI1/CP4?=
 =?us-ascii?Q?0wLm7xICQza05oDOLkCQbOZCFrrMBsnosOHBcJ1Y6U4w5F8nDe46zAjpALnq?=
 =?us-ascii?Q?4av2HDDUNy/TgEVOIoJypEmktkBA4An1F2XmrJaUorjhlNb3FutpPno15DLw?=
 =?us-ascii?Q?koitwfoz4gbMguyCmBNTM5P80Em+fn2zlpmKCxMGpxwU/ZicZOnesvo0mbL0?=
 =?us-ascii?Q?eIDoI0KKcJfeK2mxweUFFqzhJC+/y4sPyaJZVpNVmlPf0qQKlNUmS5oYLbT7?=
 =?us-ascii?Q?kOld7y4bazaMF2s5pbi0Bc9D2fgLMEdvVyGNG+Xq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767bf056-7076-42de-ec2c-08daf885fc76
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:25:57.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WWyIEomHEwzfjF/Yb9y7Xi1qYIf+kjSFZ2wQFBpNDY70wqFIZ9yO/CGC4dh9nvhqLEmO5UNibKuJW7O0mOgWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595
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
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.come,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 peter.ujfalusi@linux.intel.com, angelogioacchino.delregno@collabora.com
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
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

