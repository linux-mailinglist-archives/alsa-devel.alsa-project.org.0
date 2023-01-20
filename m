Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B75674D8C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:00:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681FC2DC0;
	Fri, 20 Jan 2023 07:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681FC2DC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198042;
	bh=Ay1JIUpIneUFqfScMR4RDDtjhXSUYC36Gewetz8Hhb4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q0LzVo0ef3dawlSVz/iVi+MjYYg180VXBSSSANgEsnNrdF4o/vdg5TpKkpqkg2nx9
	 yvc/i8Ulh027D5pkz9/8pwnMw0bPUcj5n85J4LJrqqyzf4oU6sgII5vctnXweaDD7H
	 kIOhaj8gsRoZvl6aY9uAXeibRHqqoQMfVe1ONGnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B3AF80482;
	Fri, 20 Jan 2023 07:59:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C06F8026D; Fri, 20 Jan 2023 07:59:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E52F5F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52F5F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iBi3TQqt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWY/E4Ijr/4PMWpKY1UzRV0UTAZ1aMC8iHmVlJkJloOWhoJxPT+8nwKns3rnxufZMdh0TSs7jR8NDGBfnTYgJnK+TEovVRv6VKHRgxpfl8DTO/DJ/6SvMhRGUjl3MsTj7N8CeWrp5mxroc/m3Sy8YsGAe437ykxCrY06X9ktGTqsOQHIvg0KfLpF6RlOty/SXj2vVJ9+wDKqgP72cXQ9kmZygBkTc0mNCYr9Rhbyl5G3Dr0pyvBWWazEmtjlPgsfQD9TF7bWvi2UVqgoRMqEa662ZCN92hPYP8ajbtNKeDxItqZvVJRo+x14o++pI+/Qd1/XsEAuBCpscJDO61J7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dUeNLxAyCtbYQd42ztgClqjPvlkol6da4n1cbQO/LA=;
 b=Ibie/i/cR1fQBZuenWBnWcp22j944CkaY71B+z1l3p5ZqE1dJwrGYzoqTZM9mjmYUZULTJ7brWrM/FMiJAsVMB4poGfXavh4NmrwlJHxCjB4uAoeQyisrBZjBTs4BT5yOSnCM3zpDnXrjQM6F72lrPVv2UG5xa9aFuM6IeIqYMvne9xPB3sB+JgO0NYppcGgNuorKBz3he7eptx2Pr46YKJYsg6Xl+ARQ4xPcAjJ05bsGCJNyXnb3RaujQMdZl5bPrMmFbNbDc4Rxj8Rdk0aQ+yDYzJ1fTRa00T9bJxX8qKdgQSdjtF1kCLqKcLX+WnWwi3ctMvw77iftKSHB9bgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dUeNLxAyCtbYQd42ztgClqjPvlkol6da4n1cbQO/LA=;
 b=iBi3TQqtP3dVun3FrqRyLkxIKqvgV7vAP4JPKydAySBjXZre5pPpnIicf6mYT3hq/s9zsW/CjtqyZvWQs+o7yHdsPSn4WqW8+OrExglNINO1i5odCt8vBv0uFx4H6+oW2tcI2meUl8dYo6OZm6Wp0glKVK4FOl9i1p4rxGTjDfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9821.jpnprd01.prod.outlook.com (2603:1096:400:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 06:59:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 06:59:35 +0000
Message-ID: <878rhxlmi2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/25] ASoC: soc-dai.h: add missing snd_soc_dai_set_widget()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilh1lnbq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 06:59:34 +0000
X-ClientProxiedBy: TYAPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:404:29::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: b386c546-867c-4f2f-dcb6-08dafab3e350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VaLBi8a7aMUV50VDnDfMobmHQSKRh9wQlAU7ljswpvdHLm+goUgcSRx3JJCrji6kVKkAe8S8tTeKnADyF2TbEKhuwxNcqSjksVe93J9BBAfThypcqSrZaGKBuSnT57x2/YwVcQccJJE4R0sowV3sc/9dzAP9tzTg9KArxfW3g8YhT2Oa0U1sELSSC2GnGwTDUKDRMriWTUZBbZCfg8i7qc3tRA60/nCpgRn2atfGzDHsVdoFjZmNNW51WaOGcawCl538rt/UodHz/4wwEgLnQ3D7Y6ToHjp9hn6QFcf4IkQ5+CBPIzDzbyngvGojzknE88sj+i+oIrTv3xK6zsisCece1To3CUvrZBbjUi0ydGV2DpeL8sE+dqjO9gfRD3SWBqBExA8ATAgnmYxW7BKjdTBbVMdTzh7GzCWhi9JkF1cHJwGKSNLq46Frqmd+UgGHq0mut9obqExBf+n7im6Ns37qY3rXDUsN885pxycIvDfuJImz2fB2j4OrV93kK80seTn4JgHjnnutMvEbRKc2xk04XmzHpLCe3v3TueX0O64slXUCvtXEY1Ns1qwrSGtZKKLjaarAa9u9Q6uG5iykl8hH/+4XPRcAhgt7WBtrR0fOsSnabYzE8h0wSNBJV2NNdoK9jEdi254qo3txBDHDcmglnXtGthMhBi1t6fIZiU7ZoV1V+YC/Xc+Uhlq33DctYWZiPCva6h6sB1sgrDL+UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(6486002)(478600001)(41300700001)(6506007)(6512007)(26005)(186003)(52116002)(7416002)(2616005)(66556008)(66946007)(4326008)(83380400001)(6916009)(36756003)(8676002)(66476007)(8936002)(2906002)(38100700002)(5660300002)(38350700002)(54906003)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdH1O8TRwpoqiT+mF6qYuPYM6TVvg1AjrtFsK0U92aUi8DkEFPqkt0KikR4w?=
 =?us-ascii?Q?Vg73zo2d8o5pdmCdngYFLHWvkQpoqtt+fKJqgK5fplvupbcfLBP2CvZD0FA7?=
 =?us-ascii?Q?IoOy7iah1R2mQlb756F8ipYBKvooAU8BOb5s+8L2YeUr4p16XftuD9d9jTiU?=
 =?us-ascii?Q?AeQdoF0pXdBRTTzkguGWBE+Mi1kWGjb8HtDMV4ksVYIHDAOBxYUVPNtR6SJO?=
 =?us-ascii?Q?Sk/yVFGWIX4DsxjZnfSzSyjDGz0SmYeKu85c7ZGJ7/uuZDb/JVQmC5PexYDH?=
 =?us-ascii?Q?0BngnPcdtjy4PbpxsjllXqAO2C//nysaVbKQb/VbnNsE6qNyloea1aSKscWo?=
 =?us-ascii?Q?UmypSBUvSmQalTcwo0njlvJp6imlLSB9vV+l7sX6pvtxVREOceCNReUeohoD?=
 =?us-ascii?Q?To3P/gQPCnCFjoaA+C5OgFBs8wqEAW37BsnePkjZM3UzDE6ZRF6V3IXewTxs?=
 =?us-ascii?Q?UKXhbGI692okI4pnylndkTauAHhIRIaa48fNrbTRr5MdzeaPYH/LFm5EPtEM?=
 =?us-ascii?Q?13N91LeVWe6o0Bl8EeZgkH7uYvixOQ6Q1dg0RmZxpOyXIMfhsbARAKUEagi1?=
 =?us-ascii?Q?UpTI92CoNiUFuPsZ9sKBoErUGCdBhMgWMQ/h0adMXBfkpJmzbt70I5iuIPpf?=
 =?us-ascii?Q?VkKqWXGLfTSMlgou0UjKGArflNGvZ/fpqz1nZa+ceWctBkjDhiDyMHYSiNTw?=
 =?us-ascii?Q?E/j1mHLbeCxoXObWsPil8WqVCNpolysr40n/wBrsVu2TOPn/iRTEwaFV05Ry?=
 =?us-ascii?Q?ucfhXp8pdpUTP5ASmJcZd+hw/8juTvnqfAZUyj1+OvNCqTyPGuSIaiF8KwAQ?=
 =?us-ascii?Q?73vgksL8o0bkF+h6AXSxnVLsUREgaoQjgCuC0lwh/KIHdXipHL/9sjsH8XPj?=
 =?us-ascii?Q?Qjmtu05CVz6PaOI/INva64B97S+Dyp3GKW6VG4TC3Aytj0rpAKylS38msNu6?=
 =?us-ascii?Q?CFx7T4qZHDH4la+aMjooZtJ1uG3KJhAT83ELkdSS4Yam/8E6nngYMnwqRHDJ?=
 =?us-ascii?Q?hkabiK16aLBhtqVSSz5/mpI1SHvWnKbfrcL1GIymmUR83kmM4LmQL40gqyuZ?=
 =?us-ascii?Q?1Ob0Y+f5DmbZTatFqbLXy0w0e9iAfnrywVmjZPelHl98zdM30tJ+eP6XtZmg?=
 =?us-ascii?Q?w9RuFWtrRkC+J71XXJGZsmGYaTn5vPpH9sE24fQjdnxWb6T3WH/B4GfNJ55K?=
 =?us-ascii?Q?zQcyHJ7inQrHSd95z4iJCSdBkuNP6p6pe3nWpCnq+HaWZte25s0c0L4TuoHv?=
 =?us-ascii?Q?4MXZQcES0idc7wblr4/jcxVRlWMA1ylAJd9pIqQFMW2x5bZGS2TheGTSfMVD?=
 =?us-ascii?Q?f9Gai40wlDKMfDHjmXZvj7TgCMSj7lIgzQ4YUA1uuAXXZ+yPriHGHyVX3Bgt?=
 =?us-ascii?Q?g42olExMHJE5hkEh6NTGm1HMwvsLwm2TA39oFm3QGXg0xa1dxfJtnE8C7a+q?=
 =?us-ascii?Q?d90IhV5hN+POsUZmr4lehWfQ5YZwin+zR3Icwu7dl/zZKZZdap9OzMACX8HC?=
 =?us-ascii?Q?gO6isx5lndZh+kSENOgX32XBRpSmig351afn2WHB+OTGXzhopvBJyAl4NdKu?=
 =?us-ascii?Q?L8ED5H0wVZnjtUvMMowYorrIZ3CKpHTsOfSfEkdohu+ZAjrJIQkcUYGPqcYC?=
 =?us-ascii?Q?4dasK4bIyEP0ud0O0UZk7Y8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b386c546-867c-4f2f-dcb6-08dafab3e350
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 06:59:35.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JsMZq+BT/LYwS1xBYYndIq/GQkPQ9SAONfBndFJ7wIlNIQ+sc1KLor8NFScb/V5YYAy67rk6dss+qRb6jhnstjFOXsZ/W4Qy45zeWd4sp0ApVdQS23KZkklzF2uNBaS
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

Current ASoC has snd_soc_dai_get_widget() (= _get_) but doesn't
have _set_ function. This patch adds it.

This patch also cleanup unnecessary line break for  _get_ function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea7509672086..ea704d92deaa 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -478,13 +478,21 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 }
 
 static inline
-struct snd_soc_dapm_widget *snd_soc_dai_get_widget(
-	struct snd_soc_dai *dai, int stream)
+struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
 	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_widget : dai->capture_widget;
 }
 
+static inline
+void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_widget = widget;
+	else
+		dai->capture_widget  = widget;
+}
+
 static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
 					     const struct snd_pcm_substream *ss)
 {
-- 
2.25.1

