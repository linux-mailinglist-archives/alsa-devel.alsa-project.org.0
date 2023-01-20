Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99630674DC4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 347FD2DF4;
	Fri, 20 Jan 2023 08:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 347FD2DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198483;
	bh=hZ4qmIsNr1IYsGbCqfC71T9AvkAFMeaLktbP8HlCfzk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XGtM7sJGAAvA/ZLtgNv1vH+pVdRGiD/SV3F0TAD4Lwdqvjn+WlFN9FYDLx3WDp3Qg
	 H0hJyiZ8ME6ptjalLI4qizZd/R9ewJRNW1MzvWbVmfDuOTwEo6n5JBGjlu6NVwI7Fy
	 LtavwTURl2MByXAjeB7suke/Xw07571sfQnI3xFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D212F804FE;
	Fri, 20 Jan 2023 08:03:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC5F7F80542; Fri, 20 Jan 2023 08:03:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A588CF804FE
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A588CF804FE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g1ypfZkc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7RHV2gwPgIQmBOZVg+4afO0mworw9Rt/oI0FjhNXPqLkNsmDok0PH9MiAOEBMXUcdp1uztTd08e/zrjYOwGJZIfQo4crXlcLVnldmciGP3eb7SqO7t+5LP8a/xDqCJ/nxzEZhWe+AB11IUcwp8dyw76q/flBjQI8MQ2BZnSD2JmOGu0rMA1hzdpzprKJFRMNw4RTK/Ca0XOM0mTPVPA9UWn+a1Rgtr/NEFUZaJI22ct/1TbnAbPYObRcU8gT66kIPMFQn73gS1bDGJOxh+FwgUg1zXAZVtSge/ha7xQZnOWYYjfl/H/Mu5AaTwZZ8feGi/ND8+nr1L2ZCR5Z60etQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrHPqV5fcL32FYcfzRLgfjorM6eh7YfLrn6q4GN93jo=;
 b=J1Dnhlc31hXEGZaTflAWwZChcg6CqfM0L2sd/UsqM39jWwXaqozzWzLkjNZiS1wdBoxKRDNFKia4mhgH4gqoQc7+MFjS5FjhW64Y266w5953FL818jc08Dp8y9FbCmV/HbjvuZRJYt4T2kd5Dgxj+/+fvVK7+MMqFyWuIeGmCIPqm+x9zGtrH5xfz1/BZEXqfR8nff8uW3yj8ISOhmhp+/gHEdLBM7HD3K4duijCt1ciePGMIOKS3+RE9VKryY2HmBbp09N92Og7LnGC02XOH2OHKfmPSRjjMnyGVFzv8LaIp0X09Ph70pHD5GMkgT+O0az7siYzfp+WGh4fE046Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrHPqV5fcL32FYcfzRLgfjorM6eh7YfLrn6q4GN93jo=;
 b=g1ypfZkchyXhM3c+CSMaNTGD34FLcCL8JgG7jo6vdMc5t8A1kSZYJyk9cO4Sd6OH7VneyEhl7CuC/ZPc2cN5+3QLBRfG/M2d6DI0J/DJd2maTMYM7RbewF8UgWe6G9AY7qGX6sF2M4LOusYREZpiAp9m+K34j0tGujDG+jP28QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:03:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:38 +0000
Message-ID: <87ilh1k7qu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/25] ASoC: ti: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:37 +0000
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 92534383-8d5d-4ea3-282d-08dafab47459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RI0yOpyvWEdl4yo+/0k4GpzxTW6MMPV3979N5757rdLfTZG/r9YnRaHBD4mOKW17lz+rp5AAU9K33K9wjlbJBExH7TBpwSQ1IpQk/iCcYn4YeKKkYtLK2B3QzQ5CW5Ygd5qD0DtVY86F+9DF1G9MSE01qCtoXJXwTcNUcwvY5eSexhGTvdjTmPiTOL9DNTMNMAV2f0XADbEKz2YkNhlY9WMiekiniFU7u9fkWDJoCMENt0J9lCLLq14FaTlX6IyNN7Bb0hV5cxH+Sw2wyFXxJI/c/ZRU/WbOjIJPe6to9LRvH5hm050cgpIT59gqfzkmmg4IJCoZ8/uqCfbyhV1vOhd10zCNYdxWR+744vAudom51YwPCFLe4UopK+jCR9gv/WlmdCy+tSpvghhpydH3vuYScPA8nd8K/+wlGKaKCfVvrDPQFi6zfhvwueT4jY3fAT4L1yJkqoTWyeoB02rHbhwLYuff7UsjnsSBwchy7zXBLfm8CsYmMXFOPqyiU90UImHtcE2im7O773z4FC2XogMyG/0pmuFDRRm9ducYQDY7XVSD7PPYkbk/sAYwfX3o7MXbOLwaPKdSLFFHZ6ZGrDmN61YW6GNxyQuIqKf5PclJy4o5mLbl/bIYcuLR1pIIJD7eyGFYShkZEygZfpM33QjykW+jWFd7co5CDd9vlij51fIVLlBtC7b1VxyR1t5g/+9giSnUlc7E6Zs75DYbxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(8676002)(36756003)(83380400001)(6916009)(66476007)(66556008)(66946007)(4326008)(2616005)(7416002)(54906003)(316002)(86362001)(8936002)(2906002)(38350700002)(38100700002)(5660300002)(41300700001)(6506007)(52116002)(26005)(6512007)(186003)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5s3o5F+LcRQdoYaKqY+Mfxfqgb1nIZnnOc9QBm79YAXWdj+C54F6YEEaeGWs?=
 =?us-ascii?Q?Wxhi92LHRSeys38r1I7amuG4ZpE/GNTTsH2f5Lfcgarx46vMw12szPcR6d4P?=
 =?us-ascii?Q?orEXnqjSHh0gEgya+6Be3fdI6RvfuYZXf8kNE/bSJ9VXNChNLEJMG237RTDR?=
 =?us-ascii?Q?9YlpJ/2B4cakpMt6Sp5XmNlvFwg8G9GCNgd0WMOjcTa/HGdFA/5jrjPRkPMu?=
 =?us-ascii?Q?N7zryzJRvyxAATNiKtcXcfYRwwoVaJUc0OuoLbIb5kH5Mn+r7vfs7xHZWzjf?=
 =?us-ascii?Q?dpf6ohrnr/bk72AQvDuJF66ejm4Y99QBwQuYxDsOBvHyWidWkKZZ3aDfN52M?=
 =?us-ascii?Q?f5o4tVIr9OdK6f0Ym7xAy73H5lrydQGepUBpCoBSMiGZijQmKeJLiNdKf5FX?=
 =?us-ascii?Q?KfCLuBCY5YU3OJZ1ytWU26GPTy0jxZlIlHXgbvrimVK47OipQ2QGZSw1S6NW?=
 =?us-ascii?Q?K558pp3VSmsg0yfxLm1rz43AFzdXXg/dRewSwcVkMPrwtvRRB2q7KkF9PK/+?=
 =?us-ascii?Q?W+5MvxGIbRaPWA/zoaQf6eL/XV1iKPh6N+akRLfp9rhqOtGc25eRjX5nVvV5?=
 =?us-ascii?Q?TVQeWMe7o5W1Nbfnlskgm2piaSLaUo3PWGixt/OL906hHEM4dn8erqga7yJM?=
 =?us-ascii?Q?bOhlUPcvoRm23RBT6RbxfXGH3hzMx8k4S7C5fHbxfhtMk7smLL2qYcdiXdRV?=
 =?us-ascii?Q?pxpr1hKTDRXCyt48OhrBF7E4mxZt3D0zBCbHJyA4WrTNBDS8mYxkcdYBHN57?=
 =?us-ascii?Q?8pj1P9Zm2niU9ob5F9dGn8nJ9Hq5l6+M3wPL/Ojq21FaKTn2xK0p1DtrlHm/?=
 =?us-ascii?Q?uno2FAPTbQJO44dba6ex8i77UsWHEwTJ3BHXDBg5un+qItt/xSJi7+R2jqaX?=
 =?us-ascii?Q?SSCIVyRd9BCTTLYAt6uwdy/+lEg3uUqFYzTE1PfD1ik5qxaRfoYwwf9xj+GP?=
 =?us-ascii?Q?eAZVFH+ZL1qZvd7W7JNvIMsgpnZYYL4W3hWdBTFrioQ0C+20f2L7YbMT2oOn?=
 =?us-ascii?Q?D+uk7l1wikEJPhO0OyNoB+sYiBY7yu7BSPftQZsHX6iAspMVBa4edTJpmSGr?=
 =?us-ascii?Q?jvuLfA1/SE8EDwz213W/Ft1Y7a8DhnoxUE0GR7tDTyoj+lQ+bQvONlVzGw+U?=
 =?us-ascii?Q?Nn2GejBKZIGPuE6lWpi5r6jbMGoAJRIuNNfxLsjnNQUDbTd5s3NH8hVIDz7n?=
 =?us-ascii?Q?Lk45GRcDAvvTdfU3L5iAco2W/VC0JXpI1QIcNWenpPUeF1oQc4XPdGVEpfZr?=
 =?us-ascii?Q?icElZkAI8aBc7MWo+VSxIuEdlp1IiqjCFqjWCxSh+fdEgxH7NACAY4UGhP8k?=
 =?us-ascii?Q?dIArk10/4CLfJjZC/Goocm2IXZ3mw+Vp3gk8lfWLuwCIT9o//ckh7prj/15C?=
 =?us-ascii?Q?yPPY+27mJYoBzUudZ2mmJicvbgZu+spLSEmrs8Lwc/BpUxNyQd1/2CtOu5o0?=
 =?us-ascii?Q?4E9ejW1hQ5bk7D6F+bdU32xTF6Baeh3trqKtg1vDV/qNwyYMsdTjpANFLDai?=
 =?us-ascii?Q?Ua6/iNjrqKONeKbdqc9hu8lBv/rPsldV2k4oyu4N/J2goF7DFGmjHdX/FJSb?=
 =?us-ascii?Q?+tcndlHUm7OqAF7xUV5EUrgCqxrVquOzjgR5FWtwnjPxYQHD5ulNDML+O6+O?=
 =?us-ascii?Q?f/Wms6FzQOthVP07e7qIEWE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92534383-8d5d-4ea3-282d-08dafab47459
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:38.0653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0G6gNL7XQSp58s6MCraOXnUopvWlTHSiRqsm/yiMQvmQx97ERZnxJlOgCqdJk9nt/r941BVm4aIxOgiHGh1Rn1HJgjSG5GjEkbN0Vy1cmnnG1uHtIhkGkYvbezyZe/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9821
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/davinci-i2s.c   | 5 +++--
 sound/soc/ti/davinci-mcasp.c | 5 +++--
 sound/soc/ti/davinci-vcif.c  | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index e6e77a5f3c1e..3ccd0cfca008 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -614,9 +614,10 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &dev->dma_data[stream]);
 
 	return 0;
 }
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index f5ac2ab77f5b..578254549d2d 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1699,9 +1699,10 @@ static void davinci_mcasp_init_iec958_status(struct davinci_mcasp *mcasp)
 static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &mcasp->dma_data[stream]);
 
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE) {
 		davinci_mcasp_init_iec958_status(mcasp);
diff --git a/sound/soc/ti/davinci-vcif.c b/sound/soc/ti/davinci-vcif.c
index 36fa97e2b9e2..fc16b3b8f71a 100644
--- a/sound/soc/ti/davinci-vcif.c
+++ b/sound/soc/ti/davinci-vcif.c
@@ -161,9 +161,10 @@ static const struct snd_soc_dai_ops davinci_vcif_dai_ops = {
 static int davinci_vcif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_vcif_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &dev->dma_data[stream]);
 
 	return 0;
 }
-- 
2.25.1

