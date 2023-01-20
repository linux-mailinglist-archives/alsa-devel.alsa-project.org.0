Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C680A674D96
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:02:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 382502DC7;
	Fri, 20 Jan 2023 08:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 382502DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198178;
	bh=iFCahi2D9P40IVzu0J8iR7GRiaq4eNVcCgXmDn/Q9tg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QUOVz8wVMGCLGYJoMOJkUGtRj7ZYR5LTeY9l9d1VpSJY0em7yc4qyil/le9nZBZ2B
	 Ib2Xh5HbHLZ4bhxPpN6V39Rfds8xTVt6MBRIumAgiOrOAas1yT1kr7sOTEkPEy8BeI
	 Yx6+mzs/4zA4bgBkkSsYYvqyZz7JVDapJ9U5Y5SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6978FF8024D;
	Fri, 20 Jan 2023 08:02:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7C69F80482; Fri, 20 Jan 2023 08:01:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B787FF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B787FF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YzQ3CiO2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeoHO7pn1d+CMEwihUUzQhbmDUEYBKTvsUtNDxciN4kvic1vBHgJ0hiE8vTd5HcYp+0uvgWwIHT/b8+fVW7ZzpficBpoxG7lxI0BnSwLbHedxp97sEab4yhYe5/NlvdTqxDd9Zlx6XA50KnFrVpbabKvuNsP0N7i2sHiOmikySt12u9LVC2AB7RmpjLuWEulqt/X7tkALtiWgP4sVOrZRVzo3/LVYMpsogr5UW64Ak8qhRIbHEZUyei9pbJQKs/6mUYI5hF7G4svHozAg4OHTCDU/eNGgHkl5k/pTFJgqQ9CUQD/q/v4YuuV0GRPTE7pIM1zQg1SWZxHtRPOS5G4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ3wtJi6XO/fhWm38om37eJPH2PqZpdJ4xrVOUhjESo=;
 b=Ya/N1p35Tqx8LJXq/yl0jzA4pDyAMt/zSak4ViD/h72MwQwootMLfLiAWeq7hNz891j1ZX5BuZLqQlIEMzC9WEeYTPxOwwxnOtBjAPksT04kp0OzCFYnyIJCMQ9zyP8j13I9MJPmlGT69WVO7QwLKLrwWZdEpPE0l9I8WIOa71zsEp+g7k3jOXtiO6Hb3kHhJPkT4tIlkn2aHlN0g9wfEqFRNAUJB5Rb2ZFaoN3OiCbjNS036aRBtGfeFCx68KtfYunAy5thM3qB3IKczVnuO7WrvIAd6HXKY/TucYpt8v1mny1tVYiMnzcGUqsinlfW6ervi/rEHjvh690OFNz5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ3wtJi6XO/fhWm38om37eJPH2PqZpdJ4xrVOUhjESo=;
 b=YzQ3CiO200if56IkRcjDHQXEMTiEgRQzgOZEMJ9F1ZsbWTzqI9syniSvgaLlzMNtOon9ok1nFJ2wCEWt94Jp8wwPp5129b6mYTetfLkKxY6LCUg2Jbd1d2GQOgAw1jq/X8cfLNzZ6JtVvmJAkz0h95yaztvJuCCrlpyZ8Ds3+5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:01:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:01:45 +0000
Message-ID: <877cxhlmef.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/25] ASoC: soc-dai.h: add snd_soc_dai_dma_data_set/get() for
 low level
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:01:45 +0000
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3b42ed-8759-4287-604a-08dafab43151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoxLcJBN+ody+NPoAtnt9egzy6IE9WVdvu2p3/yirSwNsCRPzg9ZiNVxfP+p4vK/uU+RcefXRI2GRVMU8VtCNB2fh+l1UyybUMt8Hevi62FlTgSktC22NkrO7jYEl5hWVMuqJTplJjjo94Ld/0cA77M1SRoQI76whvxsA5rZ6semFhJ5g3A56F/n/TcBOGIcYoWXu7aGQ4/2ZqBUrjG7xWfrtVm8DkskP4L1C3VeAyCkzdUpnTkU2h4J82eKdKTP3jJBPEwiNFKf+t/WpVmcVoXFArqPu4SRwPkg3vkHc2C59AO7so0+VjZF+HhUAmGpX9MdOj0MVdB0ncGDayUO7tr7EJs4TfZcsfxcHIUvJllK7MPkxEpenpaAm+QmBD83uEviCB/IhmhaJWg9d5TFXGf1OjJ5oYRNOFJT8ftadWtfrlk/K/CfxuNlX16PidMBsauODTSBVUDH6rEuSz4WG/SNxkkYFZBvkEzhJwMoGaPNas5pT0TromY1maaxbiZ2fHiRHjmvgFccd0HcJFSw6L7xUZYYuxMxR4Pncj5w+L1ddCVrha11H4l487hZaC7V+ABQV3XWVcbeHA5t6JcC7Ocvstxt5mgUIvLdKqg34k29cf5trEQy4KU70Sd6BMTeIAojDphact0TC0rIv9IJ3jF9g2OXrl3m24NvDiwidF0OBQtQ5xv9Bwx5PmYJsiLzzd8RfvKI8T7cVj0vF+8fQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(6486002)(478600001)(41300700001)(6506007)(6512007)(26005)(186003)(52116002)(7416002)(2616005)(66556008)(66946007)(4326008)(83380400001)(6916009)(36756003)(8676002)(66476007)(8936002)(2906002)(38100700002)(5660300002)(38350700002)(54906003)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FbubtogC8DLv2wQi72IQSMbIKoPzLwIfRNqbJOBDemBH72OHAzW7gHUsKBK3?=
 =?us-ascii?Q?RZmz1AGt8DyvnwwZj92GNut6S5G/nSQIBB95mkksYO0cvK0aKAEdIWhThhsW?=
 =?us-ascii?Q?Wte2V8mdyymbV770hwTpmDkSJnwRj8ynmhuTK1InRuLPZkw5J3q3QKiPYeMa?=
 =?us-ascii?Q?5epddg29q3bnyzLBT/0ndRpj+dHQoLd6wkxY4XWQBlU2+hdXQ4vtfPYHtERL?=
 =?us-ascii?Q?9Z6NyFwiAOHuVxFF1uI9SW0Pm7+ziQ9zfALo2qpBux6iV8TDqsvUTxXoM574?=
 =?us-ascii?Q?oWnmKgWLVmcBXaiGFySqq/jVorFFkdhUBoRGmFFWLYb1kWJtpOskZgXKppn6?=
 =?us-ascii?Q?KDRnTVt4v2bak8AmTcL2W5Q9AqjQd+5yO7YdbsmGP4cpJehfNHQY1DrP3lKo?=
 =?us-ascii?Q?Y4nh9OU9LrUB0182UAv6GQ3zoCWCOGf7LJKY9RaqTmU9a7PEQ7PpjiX/4QT4?=
 =?us-ascii?Q?BDORVj/w0rWLM9KiJL/4Vx7fw+3S2A3fKxGsp5J4UYie2QaLp5SC0ZZoaMqQ?=
 =?us-ascii?Q?cxMg3tR5kZ5tBtrFjLN2FD77pBDmAznY59uaenxe9OtiNrYwGy3+ZSDMdYEa?=
 =?us-ascii?Q?pxB1JggZteuc1+/qhRyhNb2IpEmT11OMc9SIo+fMbqgdZcnccwlVS5rax5iv?=
 =?us-ascii?Q?vYOZkq97xAFcJHQ0KjuQvTinSh8sQ0whcBda/hpqnCew8oKc8OSgTk/vhKty?=
 =?us-ascii?Q?lsDfJ0v11oh0hyEVcnxlsLomotCH3udfkpbQW3z5RPjoIR2w8bUba++wQJut?=
 =?us-ascii?Q?DC77ntAxS4NQhG1lJn4deBDkdfU2dcQ40Wees8zuCzdlUHwv/Y2mohzCJxBE?=
 =?us-ascii?Q?H1LZDeqQj5Og+ClMHPkk9Et1zqf3+0DO8hoBfMYaqHnv+4/0lxvojq9FrQDj?=
 =?us-ascii?Q?RWUDeE7IVc1Yb6OkMtX8Nb1QxuJHKPusolXSRSwhqSQ7ZCnA5skSFD9IQtCV?=
 =?us-ascii?Q?7tA9YY0aH/WFXtlQNXfr/pa1JxJ5gnYFZ9OTwjUQOuWKmEgTR2eYXcnva/Fq?=
 =?us-ascii?Q?KjxqQjCJYK91xqZRRvVPPTVUH+WRwihjr+LleCkYonfY2gnFyB+zHsuDobo8?=
 =?us-ascii?Q?MeAUHLgPlOdnZNdkGyGmFTsSLQzTUJFg8QOlucV86bGKl7cQHMu/LQEetIHu?=
 =?us-ascii?Q?JBm6Na95+hn5qWuFclizBpujPxx6duhcT4ZRsofrwx06jIIoZjg8ku3FeatC?=
 =?us-ascii?Q?SkaIOvNJvo2vIppS8hbvSP83Qv/6Ws/ecM+QyfivLp7sJr1TJNZ0ju/RPD56?=
 =?us-ascii?Q?XxBK7jgC4xFAAqpXrr6+PHkHdtRCWYX7LC3RoiskdSlRkSAIGTvAcUyIHSwi?=
 =?us-ascii?Q?734wxxbMANxKj34GfwJ64rkjZsQVPvsuizRn0KjA8Hfb0P+3/fzGVcmXGjbT?=
 =?us-ascii?Q?f7b3cmziq52u3mQFSAHKXHH5l/vrtPfM9oQKk9g8aBUCKi1etnJED/zFzXtA?=
 =?us-ascii?Q?zxxGXQyN9XqbuaYgF9xo4KozBiaxtYhbsSdZo2wRA9yoj7x83yy4Kzjuypr9?=
 =?us-ascii?Q?egyeyI6YQ49NbdsZQ7xo64uThRbjRJ2nHpkYJlGGK0EN623jw7P4l9snINGd?=
 =?us-ascii?Q?AXJ/1ssSBzHxkoCKqC1RucI+wHsaBB68BpGnlU9aZRNlxXdU4fQOHRxCoItt?=
 =?us-ascii?Q?PHNSP3Bc1PnIHv55MeI3JOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3b42ed-8759-4287-604a-08dafab43151
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:01:45.5913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPoXKDK3EC/r7MhjcuZBHpo67SDC+nVzu9hY+RFnxs3WhyTG30t+4SiTGV7um8mz9Xn1vBYXZJzAVpnO+/987XJKtlJ6C5rWkRMdn7ruG/oAh5mnFWESdYfpu1YV7ulP
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

Current ASoC has snd_soc_dai_set/get_dma_data() which is assuming
struct snd_pcm_substream to get Playback/Capture direction.

But, many drivers want to use it not through snd_pcm_substream.
This patch adds more low level snd_soc_dai_dma_data_set/get() for it,
and previous functions will be macro for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea704d92deaa..f27b33dd97bd 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -493,18 +493,21 @@ void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_
 		dai->capture_widget  = widget;
 }
 
-static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
-					     const struct snd_pcm_substream *ss)
+#define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_dma_data_get_capture(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+#define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
+static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
 {
-	return (ss->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_dma_data : dai->capture_dma_data;
 }
 
-static inline void snd_soc_dai_set_dma_data(struct snd_soc_dai *dai,
-					    const struct snd_pcm_substream *ss,
-					    void *data)
+#define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
+#define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
+#define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
+static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
 {
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 		dai->playback_dma_data = data;
 	else
 		dai->capture_dma_data = data;
-- 
2.25.1

