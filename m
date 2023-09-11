Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1B79B169
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DB9A4C;
	Tue, 12 Sep 2023 01:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DB9A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476587;
	bh=C7DLzJaF6OjjVwyXxCmGPriWwfmOGW8BDwL4mFESZ9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OGndWvalbbN/iXWcWH13kwVm/nhfbexRZxRZ581M/hsDNZOXc9/Vbql5Sd0/9UlmJ
	 Ngb6uGMLPzf4U1lmsHqg8Pqr9x+f8YFCUpD5MrFYIAkmixz/utrZbm27RCUTAkEWBw
	 /xJXqLDlzVIig8y6f0/vLedNoH7l3Dk2nyDxnVlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2151F8069C; Tue, 12 Sep 2023 01:51:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98269F8069A;
	Tue, 12 Sep 2023 01:51:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39899F805A8; Tue, 12 Sep 2023 01:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 626A9F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626A9F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VH4CwDyw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPAZu2eRqXfQQwaY6JT45qOrzo5QRg+oGv3Mlso8+ApR0eDOpiXx0LDoxEt2EJrJ/6L+nrGjPvlzP63GL+sLTEptJy+WHsyBPwkW0+WH4XeoiMi7a6ubHI/YcC9Hk2AKS3J8wR6cbVs2pz8nKz4t6b6YB1g3jXFmG52p5zL7MPC9zNXFS24aCWcOCXNwrQwtmLo+3x0/GzKUNoMF9S1LmfsKD4bBfbSJcEYsGkqnM0M5hn3WN0DsNUHjDjv9hVJs/lgz8UY5dz1DiAyNqu9rOUFzrhcm0ksT5W9+l9DW3RE5oJ4JS3iKS8jmv5gDm5iSxMPRFDmAgtx/8B2ujiFx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjcCBgDI5KxbYrusvQpP+x6YtxuuNJyXcAoMW9jiCfE=;
 b=AD48T8rY9R3IAF67jt/5+jNw5yvBkrpymLark7Os//eLm9AAKL05M0lvhr63y/puv+DQTN22h95dVcqCo+529+zgOG4vK3Zrem1QNZpBXo3BP9pA1OCv41HGHQnk82Whgm+df4izho/riRiIwEd8DKDoYESIMy6xk8GyJcUJPjOupbErpRPKxhaROt1ORbqq55eXhSYhIwyU9tjeE6aBrpHo69LsD5gU9etxDmfdpGDUWAp495OvrEnWbYmgABGVfZlGXazTlRPx71TEqfp2Zwa8dUxIkzIsd1Vz/DVWD3rM0DuBl2sHcysOQ0SWH1FjovRF/57fkGw52One0adUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjcCBgDI5KxbYrusvQpP+x6YtxuuNJyXcAoMW9jiCfE=;
 b=VH4CwDyw3qE1JrM/gAyueQHkC0/XkOitJQi2v4zlsowr7LCVvzbH0gcSuCTeRht4xiE6QcADcN1nbHviE/UT57jF1LBNrbSKjz4Zm18NZ6Iz34uTnSdxJNngnmd0RxCkWMMuRXceAlGJSUn5kqzE/n13T+4UuIuhEKFOctId8YM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:49:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:56 +0000
Message-ID: <87cyyoqnh8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 28/54] ASoC: kirkwood: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:56 +0000
X-ClientProxiedBy: TYCP286CA0260.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cf226c-246f-4dd5-5d4e-08dbb321cd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WEyEd+NpYDNNtGQ1UdIrLX0+iPo7QlNccs8EW+N94VsI1rUanOmXcspdIgj9pAmT+z1iHhRl3w6p/vUridYlg2FMm40fq2dgPQGWNadqnaWdCdQ+zGrnlI/3/cx2OagmvZdsIT3IPiWSySCv9p9xh6vgdvMdQxPRCCqkFBw5YdFQdhVLZbF5cparXDrNisQFIWvJSDxDtAX7Q2nEckwSU1XW+2jTmjc81p078dyAD/97E8Rr/hWLZj6VL49ifgRbxSplrUUKK6yyi1Fo95AAIy24PeCQAGamD47DLl2G59ggf3h0Ak/bUhM4cKX5gQs+Y3d2lX9iTToI7yhivgUhE7r3Ehs89IErvgIz5FYZkISqOklwEFzu3D9PowaI7ekpz8hQvF1azrySutskU2gi8N+azkyAQZrX4z5XgRpvg5tu0udwp3AeviDtBlUoRTfkJik0mvoDgN3f7VwBW+cWXIhzzW77pnxaniTTXp0hgnYY+DGn9RivGh75MQG8VnCBgQ5BhdnbkqkOHv722gLfV7vm9+7WY2grfuS2b6VwzHGpQHHx+Mh7OkZL5uk8B/qLYQgpX072ce8G1oBpqSBgrWCjwOIotli84aoUmvb8vkZZ1v33OFjvHmu+45kbG8NEmShJ81kzj0j6SIuZWLkZrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dM5Kl4LKFe67g8kRiJM4QsroWC2RF1ojp7nxhJNngWvvAaklI+vtdnUjcJpV?=
 =?us-ascii?Q?pnn3DNlX6nf1LT88vUTgHVv09pMuCbmkE6ZadtE8fcGBrqg2h2nUEB+aRi4A?=
 =?us-ascii?Q?tImCIir12XynBDmwO5ICMA8M1SNJ3MiZ4VKfD+hrI8Pm6nz8hUPuYrqLSSaR?=
 =?us-ascii?Q?Hji6+kcQOt95aCcaUUlLNrpiyZI4lYg9Z+gxLWjWnSiOYdpU4ruZPR2dhDxv?=
 =?us-ascii?Q?Ny/T2ONABMpFF75SuzTf2ZxxoFDKPVX4ObnNTn0bH9KD8ApQ/kM99G8MuXgk?=
 =?us-ascii?Q?Fsv83Sp2rH6iFfDX+SF1/T/GYUVq6yu4fzR7J5BWZmFU6E5hyQodUmQOUpVP?=
 =?us-ascii?Q?k5nEf3gk6ENSoIUtotWB+MG5kODjvQOZYYLmPLgnR20+fjprzxTJnVRg/Zhm?=
 =?us-ascii?Q?KVAlXq+bBdfyQmSFW6eH4Jsa7fcpf+5/nCsD1hzR3OrimAleB/ltcKXhC2mA?=
 =?us-ascii?Q?ruGAk3B8sK6KYS+o3wUBv/BL2O1x7tZgWmaD4HuuBMEVNfWnmaWaiajRTAdS?=
 =?us-ascii?Q?xlo/X25Jh/sumwhBIcdLHhCLaqR/yuSj//PvJE/Wfn14Do/toTGfyN7yQ2W4?=
 =?us-ascii?Q?Y14yHAVfqzHN2QfkiomoQAwWt6G01/90DFaY7bhF4S1budIyhcs8qoBV4LFD?=
 =?us-ascii?Q?+cZdzMKiHtuVmEp4/pjVLO6sOBUXmnq3l33GtPuSsiMICz81jEHEcIs7OOUn?=
 =?us-ascii?Q?lZ+sfev2VUVmOZI+YdolNRVm8aSBggzfTwA4Vakju8y9CP2ORmz0J9kmLlEl?=
 =?us-ascii?Q?M0N+fr4rwNvhgElT4ObVrOvAup8vlHlXGoBzGMHu0O+LV1LD+MoVsYh6biU0?=
 =?us-ascii?Q?+uZspBGdLizUub4XnGOGUGVXdMHFBpdh4NCmosqxTkwyNV91h3tfsBVU4ZNi?=
 =?us-ascii?Q?hPYS8kLMdytzyWX/A06Tee7S+cmx5CUy6zN/7KhA9c/tk7fsA5lhOf07e0Mr?=
 =?us-ascii?Q?JZHGyQmudSyVkjj5kB3Yf1Z2DJ5jLbMs8UvxXShy9rGqqBzfymJaLog+Z0sI?=
 =?us-ascii?Q?S6At/6XNBMJDN/uZab4hbNbSHWkzdoNx28fcg+C/SWWpi3m+nyXH3DTt0bQJ?=
 =?us-ascii?Q?wLAO+CWBapXWl4pgvw/dCf6tmrdjmhLhQHntig7uAULD+lMThE/p5ax3IXhd?=
 =?us-ascii?Q?CE1YjyINfmhZrgwc7bmFBXxywiXwDhv+vWUQgBSratP3K9gCIz6vG8/uG/sa?=
 =?us-ascii?Q?+aKhVXsEeuevPVTAwZ+PX9Xsqr4zqZL+Ud6vKpbEAcBnCly+z2ZJe2/ViSuv?=
 =?us-ascii?Q?McSkjjUqzH2E0hh1Je3skeozHunlsAhPS7lhYjwL1bU7imyNEWaQMcQhdpHx?=
 =?us-ascii?Q?TOZ/WHrIlraef1+wO0l11nahZ5VroIIIB8hM0YyoJ7eCTrxNtWuTkjZiqP7a?=
 =?us-ascii?Q?JB085ubjx+9pm0/+xu5bS61UH5mqEzaRp5TqDG2bzYlZmGc9ykOsVdIAu4w/?=
 =?us-ascii?Q?QVfMl2P2nIMb59xo+5czBKdleOwlXojJGTT0ogBtjnPBmTq1IcwDjyPXp4ok?=
 =?us-ascii?Q?fPqw1gsIZxkMjxytugkdT4WHlEL859xP46hmPs3tjxw9au29W+WF3g4RCS1s?=
 =?us-ascii?Q?6MP9VuflE3MC6xyMOn5U+HPtwcpr1qTcz2LPV6gMf7p4Wke0hgkHrg7yadFL?=
 =?us-ascii?Q?VpSUJv7eWq9wwr2w6cndp/k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53cf226c-246f-4dd5-5d4e-08dbb321cd68
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:56.5295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7WLBX0g2PIqh95bq3J6QsKdfvCYH0vK4KqseBWShni0T3CrgP3d+ycmVPMbWrq/6QhHFu1IJXD9Nleki+wNtviFqHbbnrPoez0LXT3+HcZdN5wqJmlPQ0l4XYi5dieuW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: 6JZ3NDDGIFZML7C53AESHZ2ECKSBYIP7
X-Message-ID-Hash: 6JZ3NDDGIFZML7C53AESHZ2ECKSBYIP7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JZ3NDDGIFZML7C53AESHZ2ECKSBYIP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/kirkwood/armada-370-db.c | 4 ++--
 sound/soc/kirkwood/kirkwood-dma.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index 81326426da33b..79ee7599f06a9 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -18,8 +18,8 @@
 static int a370db_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int freq;
 
 	switch (params_rate(params)) {
diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 640cebd2983e2..dd2f806526c10 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -20,7 +20,7 @@
 static struct kirkwood_dma_data *kirkwood_priv(struct snd_pcm_substream *subs)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = subs->private_data;
-	return snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(soc_runtime, 0));
+	return snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(soc_runtime, 0));
 }
 
 static const struct snd_pcm_hardware kirkwood_dma_snd_hw = {
-- 
2.25.1

