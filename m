Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C24E8E00
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4C616C2;
	Mon, 28 Mar 2022 08:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4C616C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648448296;
	bh=x4PoYRo0g8dRq1shTohOgKYslV4l4Ya6CWl9VnZzWlo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESmCtv4WM0e3MCNt727BbVvZrhkxG8BqfwSH1Q/eQMbFn8jFQt6vRt9L56p1pX3eO
	 V33KI58ClKcDn+/1k3DQytLQqXKWJQoKxjaZCNSDs6A7l+9rXw1mO6ojJiQ5hnTeeS
	 Qw+5P9DUTzjhC4+HZVR8dlT0UiOFnE0HFzLVtKRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA20F80528;
	Mon, 28 Mar 2022 08:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 509D8F80526; Mon, 28 Mar 2022 08:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FBD4F8051D
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBD4F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="qBPcNtK+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD5JoBUr3S4JW1SN1aajh9yS8z8S+VWoL7PdXpOcZFJ+inNLw72cSI+10Exkc7m0aJMDXEwWyKvONWBaLmL/JR3JVf67SlSi66lGmbdnA42eYGroltUN20VIgd6POriJklW5rd+w2KdMf/4GV6v6puRNUddcZhoP6Ue9N7tI9tx02DlKcbvbd9UrZRZCjvHkYO9bwx8qkt9Eln3S5XWxyCOadHYQ+HFUuDycXUB4F/icPnYnVUOkm2t+d3rQJNX4MGB7gdF5NXpRaAJJn9ZqKhq63YU2yOb2sVAeQDw4Ztx/1TQiO60iJQSOOigEIiLNuJSBB0KI2zg/r0i74CjEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkBYi7Bi/sHUSLsgRcl8X+ehZsFuG5iUJZzaW5Cb0po=;
 b=OMBf4LeKGV5Lal0mXvx0nl4ppWvQZwaJqi6VRRoBz4dp6dZjQMdEKW+L2r42cOKB6XoeeYg1Mfns/i1Mzu4sIewT4fo+xELvsLdfwmX1El31ZyyeZ3ESMOpyTSeYmb7VAE21ni5/aQDUHLLcntjolcTTxmEjei8OFLTYoTVdl04aSvrpAyspz3KMdHEVFaaSpP9/y1EGy1pVHL1Xasz34hM1gY+aTvHWb8sf/4rOZg27sajRJaZgbUygz9xBlS15zE+90qvD0+J+ktLI6DCAgVSzUSiPF/OnyDteZeVHsX/l2nKy6Y7aNdwR+aGyn3aDB6ovZb3McoKd7i/yBzeJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkBYi7Bi/sHUSLsgRcl8X+ehZsFuG5iUJZzaW5Cb0po=;
 b=qBPcNtK+gnIqkqtbGtR+9IToJxlmgn1u0QmQGJDZn2jgaCDOsu7/fSPiJp/7/laHQNyEFgj9dZbawzMBdOf4HXG883YzlXQovFdYZf4wDQpsK+ElDnTRNM9wcYyvKJesuoNIQJ5k+9RDLYMD8/pfCr9cqAZe1MEK460q6pzHTo2Lrz2XxLAdkIXXQlRRmlSDAgpeGFxDDewrRkFdzSuQn8ED51LaBor5xkcQ2AhqkeoMbGF5G1kKYQftMpYjAHg4WTUGITG2OKDQ8Ck0CG6vb02r1cdPr2lVcRbZy8tN+9gFp3NSlJfMW1e89YSJ5c1FPxdWCFuCAo8X0ZWTC77yAw==
Received: from BN6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:405:70::15)
 by MW2PR12MB2379.namprd12.prod.outlook.com (2603:10b6:907:9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 06:15:55 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::2c) by BN6PR12CA0029.outlook.office365.com
 (2603:10b6:405:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Mon, 28 Mar 2022 06:15:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:15:54 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:15:52 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:15:52 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:15:47 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <peter.ujfalusi@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH v2 4/6] ASoC: soc-pcm: tweak DPCM BE hw_param() call order
Date: Mon, 28 Mar 2022 11:44:08 +0530
Message-ID: <1648448050-15237-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25187317-a0ec-4c08-8cd0-08da10826abc
X-MS-TrafficTypeDiagnostic: MW2PR12MB2379:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2379CF0304D5CBC378B83927A71D9@MW2PR12MB2379.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNa/xL/uNU/juMw9tV6U1iD2cHJWbCPX/StepQkzsL1t/3gyUh/Bul/lLV2qIqXX6n4yj0USe6pNdvWlvXCL1utziHkegnCvwq87Mkfbn9EFcj76PQqGtg1lx1EqwNixCvQ2ECKAzirCjWYM2WjjFvjZ7C+RGVjY6/TUD5ufR2NDZUXlAv1rnZ0s6+kZmVYbwbxMWyVe10352QJc6h6fZzcjzLzcgFBqhWFMFXCdOaCnarfq52iexPI6lWqvn6IgF2FOnVH6kXaH32+iVmDJnOY9aiXGcY0uV0VqwDClWmoNrEctNUpa4wZr+iiZPbUYgT35TV2pnXSapPEo8U7TuTgfEM8YT7ZqVbGBEctDVsMcW/Apau8loVLdFWoCvO7rQZ+nCU4OWHssT6albTOh4EbxsA/lo4pZGkerIL6cu/1rMB8SFGNQkk4vqDTK6pZXLiNL7OG7Xtzed+vPBJXqKUrpp9Ic4DVE24IRnaZXTm5/S+izGonJ/ziLsLumTosuFwuCOBFD+aC1NFfTdGV4mxrQqjC1YS5E4IN/rddYP5S1jUo7w0w66R7k6sm87c+wmtiR8vFB2eLPN9RYO84vWQYR1Whjq0ijF1XvedlxrZP010tKMJGv3uA1wG5DNtqlLXPQn6MKSF4KtDP2s+6m0uGZQCdk9g0jlDaCd1zrSXlEt/RLUfjWUf04CQXeXP+8aDwu8ESCqA3aQnyZu50H/A==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(81166007)(508600001)(356005)(2616005)(70206006)(186003)(26005)(40460700003)(86362001)(7696005)(54906003)(36756003)(8936002)(110136005)(82310400004)(7416002)(2906002)(316002)(36860700001)(6666004)(70586007)(4326008)(47076005)(107886003)(336012)(426003)(8676002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:15:54.7162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25187317-a0ec-4c08-8cd0-08da10826abc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2379
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

For DPCM links, the order of hw_param() call depends on the sequence of
BE connection to FE. It is possible that one BE link can provide clock
to another BE link. In such cases consumer BE DAI, to get the rate set
by provider BE DAI, can use the standard clock functions only if provider
has already set the appropriate rate during its hw_param() stage.

Presently the order is fixed and does not depend on the provider and
consumer relationships. So the clock rates need to be known ahead of
hw_param() stage.

This patch tweaks the hw_param() order by connecting the provider BEs
late to a FE. With this hw_param() calls for provider BEs happen first
and then followed by consumer BEs. The consumers can use the standard
clk_get_rate() function to get the rate of the clock they depend on.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 TODO:
  * The FE link is not considered in this. For Tegra it is fine to
    call hw_params() for FE at the end. But systems, which want to apply
    this tweak for FE as well, have to extend this tweak to FE.
  * Also only DPCM is considered here. If normal links require such
    tweak, it needs to be extended.

 sound/soc/soc-pcm.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9a95468..5829514 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1442,6 +1442,29 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	return prune;
 }
 
+static bool defer_dpcm_be_connect(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *dai;
+	int i;
+
+	if (!(rtd->dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
+		return false;
+
+	if ((rtd->dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+	    SND_SOC_DAIFMT_CBC_CFC) {
+
+		for_each_rtd_cpu_dais(rtd, i, dai) {
+
+			if (!snd_soc_dai_is_dummy(dai))
+				return true;
+		}
+	}
+
+	return false;
+}
+
+#define MAX_CLK_PROVIDER_BE 10
+
 static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget_list **list_)
 {
@@ -1449,7 +1472,8 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget_list *list = *list_;
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dapm_widget *widget;
-	int i, new = 0, err;
+	struct snd_soc_pcm_runtime *prov[MAX_CLK_PROVIDER_BE];
+	int i, new = 0, err, count = 0;
 
 	/* Create any new FE <--> BE connections */
 	for_each_dapm_widgets(list, i, widget) {
@@ -1489,6 +1513,40 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
 			continue;
 
+		/* Connect clock provider BEs at the end */
+		if (defer_dpcm_be_connect(be)) {
+			if (count >= MAX_CLK_PROVIDER_BE) {
+				dev_err(fe->dev, "ASoC: too many clock provider BEs\n");
+				return -EINVAL;
+			}
+
+			prov[count++] = be;
+			continue;
+		}
+
+		/* newly connected FE and BE */
+		err = dpcm_be_connect(fe, be, stream);
+		if (err < 0) {
+			dev_err(fe->dev, "ASoC: can't connect %s\n",
+				widget->name);
+			break;
+		} else if (err == 0) /* already connected */
+			continue;
+
+		/* new */
+		dpcm_set_be_update_state(be, stream, SND_SOC_DPCM_UPDATE_BE);
+		new++;
+	}
+
+	/*
+	 * Now connect clock provider BEs. A late connection means,
+	 * these BE links appear first in the list maintained by FE
+	 * and hw_param() call for these happen first.
+	 */
+	for (i = 0; i < count; i++) {
+
+		be = prov[i];
+
 		/* newly connected FE and BE */
 		err = dpcm_be_connect(fe, be, stream);
 		if (err < 0) {
-- 
2.7.4

