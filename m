Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9DA5B12A2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 04:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4AB16A4;
	Thu,  8 Sep 2022 04:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4AB16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662605187;
	bh=h7/fxQ/pY6Nwzl1j+DsBVYVTLLjl6jB/bpxPGFRdRJg=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TH3YZog8XDt5VdKSw7cZYEv8zCn+/AtDFLg7pgliHOQKqrVgM/HQvCRSzA3+ZQ5Ub
	 aJHiEZDJdHRvP8XTXwkhaVJ0n14xLuraWpsS5IFYpNVXGaT/yYVrQipMhoYRPIrTiy
	 QUBwhJaurCunK1iuZSWgJ2bhtDGrksxtCJshQNzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B68F804B3;
	Thu,  8 Sep 2022 04:45:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B658F803DC; Thu,  8 Sep 2022 04:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6F43F8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 04:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F43F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="WMll64kL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+jG/7eghKASggiaHkkwH+C+JdnXR2cqGQRuKk3jy5P5GCMWj78wIXWrGzeGfRZpjoaef6/evXQbBrX+h4dnQKcbI1k8qiam51hA8ZcAnaJ0NEEGbcwX3ah+49JGAjaR+TFuBTVSBUbzuPN8OAFAlOkQGIk+btYt9T1EhmlX8FvNl8DYXLN1TbPrZwVKUfpnD+ZquZQSDH3zFmAtv+YXOtzfMxllxM5DkEytrPKtEdiRxkJqCh6nEGUPCWAViR/VlKCjRZSjzZ6xD6AtJw+ALGkL6lnWvoKpjyCFvUqduj7hJjIOhu6b7jUvNe3DxA4fy+dio7os+GMvglnxQr6V8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuiZXkUMwYyJhQKohswjlUeNqYXnXCNJK/4Z6cXFWts=;
 b=NDFeEZ/pYdIVmU0rFDG2vZ2Ph2iuN+E8XHAgQXxmxkAF7zphMhGcI7IeZsN7TEs4Fcww0HTB7AbdQjeuz/z2C7XWKLMfuCqrloC3FNsF4bbzLvuWosurjzY37L8DAJRDajZ6NJUX72DxWUqgG9nj2Ily1lmfLbBem6pD3E0360W4piT89JhmYpBBb9MQI2BkzPl/WQb4fecMwPSeZb7w4DFj1w41QociLkyQfaG17CmqEp8lilQNs8Qpi+WBmIZCO2NoK1S/PupzKQ0JUW9pNtgPUmlLX0HYq40gTB/CLS+8I31EW1ZlqFG/JDJfBFvI/jghw2Dk7z173IiXMPK5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuiZXkUMwYyJhQKohswjlUeNqYXnXCNJK/4Z6cXFWts=;
 b=WMll64kLuJi65uWe52M2+bE3DnUUXTySXrbaPp1wn1dRhD7ezmnvXVDEWt2czSHO+dKvayEfgGDekjdt/u5IOW7Wd4IKEviryNaC8cnabJXlNT+9sJ5/t2J8UInTIfG19LieYqMQrw7YIiVLoGpbaz3vi7yQ3A/lYlSmfMM/CMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8315.jpnprd01.prod.outlook.com (2603:1096:400:164::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 02:45:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 02:45:13 +0000
Message-ID: <878rmubn47.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: soc-dapm.c: add comment for kzalloc()/kfree() on
 snd_soc_dai_link_event_pre_pmu()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
References: <87a67abn54.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Sep 2022 02:45:12 +0000
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f354a4-7d2a-4df7-5693-08da9144274d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4DKIPzjxslFG4ixDfYn07U71D4KCWSavGUv812fvB7ra4OJ6zGR3Yj+QyqR0qLxt5kqtCXxSdISpJKjbEz2826K1pK2mPHiRqS80uapfhEMPkeWWRa2uGR4Srb5Ws52AzrwhH2ukdy1naxJYvt10c0f91qCh930FyJKh45Y4oCrboRS+a1qYBOGMmQkfYturpFRvmvOfeFvfUX+2dW6VJmcI9TGONHMXyTcTlFzxEXlfR76Yk4uXd4LgMswaumUD2D71a5OP9arGSy+KY37Ej/FTAJ9F803v+sBL7xAz0L+sC1QpYhh7Yj93/v8WRHahQtbKGh8NN6aU8ZvS8PBU0HrGFo/X/0irb7J5Kj1k6a0cpOvbDcNwYXDW2bYbLShEsDt/VUDCcHe0lTOkiHdc1SrHN/jfoFBt2d3nA1sUMWoIwTD331H5V4N0vdfXrdeGOW122iUL3/yrNeeqZtQWKbrBljyDeVb1DYCINEwyIZwwtr7dn/Dn6R36uadKjZM1rB1ceGRCZD4aEguhhWl/26AXgMinKpyOyza/++3Ix5wAftJSwD9Nx9NqS2xYj4n1hGlDg3wEQi4fbfZWjhpopK1xX4iCWeeKWsVSyQuOA0djaUXacWIu3Lqkhe5RA278Gc65DjxYXpW0plYilULs32JpuO52zfsgSevhY5peoprBC0tMMq+j+Tp5XqlexrVruddshqvzsvc4+DAiTwXmhj4Vgt4y5tJQdfJa16xeT+pLmAqWJcMnaBSsSpEDYuBx1FtsMxGO8vPy9v4LnzIgGoQUWqpaGcjEC8BjTCNmB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(26005)(2616005)(186003)(5660300002)(8936002)(2906002)(4326008)(8676002)(66476007)(66556008)(66946007)(52116002)(6506007)(6512007)(36756003)(41300700001)(478600001)(966005)(6486002)(86362001)(38350700002)(316002)(38100700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2FnE4oNgzOMmiqUuYhY2XEolKgm7MRRjJbozzvvY9bJn7qNuQBUqYzPxjuzH?=
 =?us-ascii?Q?NUKziBT1Tji18mTT8pI9Y9rJIH6ixPzE4cR5NbOM2q1tsekenD+RYkXTauzV?=
 =?us-ascii?Q?kTifUo597IZOGEL2RL6qdhWIKK1z4VNR+mFwB5Hvob67GWAGs3vOpXXdXv3L?=
 =?us-ascii?Q?awZh6vJx2sqL6e+QpoOtzEELlm1jkUgLHdZnbSCKuaBZgXz6Kam1+hWScEso?=
 =?us-ascii?Q?6M0anfWXHs6UKSFpsvfLDqyxtXllxVPNQoPqFKzEoUXgrF2hvDCz/tnY3c+I?=
 =?us-ascii?Q?FVNclssXU0B/VXeYWG/xIO478HwYWfTiBLMS0x0WjM+L6FABtP8vfRBqwHHj?=
 =?us-ascii?Q?yBy/zejpqiOOLER4V6PjHdwyfco01ZLbStS1y3M0AmyFMwRXqEBPEwGaaS+G?=
 =?us-ascii?Q?ElTj3PxV3Fn7VuCx/EymYPs99OjNzAxV3mYOUEXIUofsejLz8D30XetWA5RP?=
 =?us-ascii?Q?t3M64t4hP3Pob/EQgyH43W7bTU4d8oxtp26gpDJ0fbdyzfRUBYBNBkRw+5CB?=
 =?us-ascii?Q?4yqPznbQzYPdxdQUftubG6BtdayUTZQlA4FvRc+fJxTg7DenCF7fq1CmL3fc?=
 =?us-ascii?Q?i0anhkePENlbBs1GD5NRlmecsjT6nIxHECslGmvc7NfbLmuqjtTvU86CK2Xy?=
 =?us-ascii?Q?Odj+/7Pu2L6X154Vv0D/KWQ5F7/7cyjfxmpg9XL6Dqe1XeqN93YsqADRm/vi?=
 =?us-ascii?Q?xjtGi7q47FGTpEh/D8Er0jUO/O6WuvYchGszwXburcTd8gztVk75vy37T9HP?=
 =?us-ascii?Q?cV5YUpup5e8Em3LAvtQ/Kh7dShXA3Wr3S/E5YSDANJ1hFD3ja1TVTxT/M4p5?=
 =?us-ascii?Q?nUeONV+I8K/OBLI8WFvK/KhZMaaICwPQh25WRi8Zuto+24e4y6s0NUf3s/xX?=
 =?us-ascii?Q?0VfC364B+qBEc2D0NWEKWyqdtPgFk0yRJTMKWHZy73YygOTAXnddekXqcy+b?=
 =?us-ascii?Q?mqfOXesTMUVgd+Jdo/g9FMYVMwyVnRyPJ92Fs3oAyezU5t80lqFEvtMMu54T?=
 =?us-ascii?Q?a3/bmhzEhpWeRVkxBCxCfDXuyOJ3n/N1ypc3PERkTznJppTvi8OjV2Oa74xa?=
 =?us-ascii?Q?PAsuipQNZLPJ6s71YF9aFjauZ7YWMreMQVL0Lf42qbr1rEtQI/AJJpb8Lw7Q?=
 =?us-ascii?Q?nzsu3NvvovdERrPdGkbTDGQUYP+8/HgAigvUhCR9EL04H1wrPrgbiWD7j3Ns?=
 =?us-ascii?Q?Da5f815OXJ4YP9X9esq7lo/I72KS/mYsyhIfNMm+rN5R26iIfPvP304jOtmY?=
 =?us-ascii?Q?vsMMUWfv8s78dMR1yzrIQlt6a/sProAez08xE2fRwZqj85J3vM04mf8f/2vl?=
 =?us-ascii?Q?1r2NTArjdfLN3AEcop0mjPe6mR+dEXLGfUVlwLIqvXvt+3sjkqq0GENXlABu?=
 =?us-ascii?Q?FBvp7T3ToQ60CgsXsZJxXxT7o7PiMKr2gA3BZsWF1ZABKsM47DEW99n7UHDY?=
 =?us-ascii?Q?bX0+zlskDdUpTxZvKSeaEj0AGFB7ki2HA0D4yh8+WdzGfs2PKiRX8Iq8uFrw?=
 =?us-ascii?Q?9fbBtFtR2lkS9Ha1GTlFmI9yMsMUfwZKKbb53cFG87E6E6vqB0V3t0sbtZAc?=
 =?us-ascii?Q?cwfL7Kr5ZGq7aQM8+NjVyazSITYcZt3j06K5JNLiEWpwLXrdwLTZHTD2cXJJ?=
 =?us-ascii?Q?20kbHVAkvLfUNXWk7pE1QFs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f354a4-7d2a-4df7-5693-08da9144274d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 02:45:13.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJzI9MPxsYfY+BCpHAO6AknVjo1H/y18UUkiH1SJQOBso4pz1FI/5pDppdUP63hGfykPrZreBM6k3b06+I5dGYH9a6/0qOqY2wnIDBwYavKrjnKx+I7VHBV1bRC1SS82
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8315
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dai_link_event_pre_pmu() is using kzalloc()/kfree() for params.
It looks we don't need to use these, but are necessary.
But, it is difficult to know why it is necessary without any comments.
This patch adds the reasons via comment.

Link: https://lore.kernel.org/all/Yxc2wzbZsSVZNf8Y@sirena.org.uk/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 76615d59e2b6..fc2f75ed190d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3842,6 +3842,15 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	unsigned int fmt;
 	int ret = 0;
 
+	/*
+	 * NOTE
+	 *
+	 * snd_pcm_hw_params is quite large (608 bytes on arm64) and is
+	 * starting to get a bit excessive for allocation on the stack,
+	 * especially when you're building with some of the KASAN type
+	 * stuff that increases stack usage.
+	 * So, we use kzalloc()/kfree() for params in this function.
+	 */
 	params = kzalloc(sizeof(*params), GFP_KERNEL);
 	if (!params)
 		return -ENOMEM;
@@ -3939,7 +3948,9 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	runtime->rate = params_rate(params);
 
 out:
+	/* see above NOTE */
 	kfree(params);
+
 	return ret;
 }
 
-- 
2.25.1

