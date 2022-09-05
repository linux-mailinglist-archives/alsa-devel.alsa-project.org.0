Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D525ADBD4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 01:18:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468E3165E;
	Tue,  6 Sep 2022 01:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468E3165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662419938;
	bh=VsZvo0BksPOfxAqns3yc9+HfnA+je/l6S4PAYMaTU3M=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Un1Iq4XHKUjj+8o+kFoMwO2WMXxnrNQTGGVNP/inuNp+WWCY+xLjDmllfg8NmmDjR
	 idD/eXb4KWbZqkpnPiHfetVAvnX5preyAqf5FHAcb/nh3Q7TtwAhAejVdOpjUWFHqw
	 5aQnIk0TG5Bhv/1jYmLAXYunRI0PQqn7OXSwcksM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E44FF804D9;
	Tue,  6 Sep 2022 01:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBF25F80482; Tue,  6 Sep 2022 01:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8E3CF80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 01:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E3CF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="TWQvxebt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP1+mV+jm0YrtfKmAgMuSb9aixgw5/im80MaFxqi9BDbNwE9kJVdUeB+A1bEE2vvdhIsWVtkXjx/fCxX7X6ybCkbO9bWbkQDn3qT4UkRdVKLNjOjKYEszp1EhT4HKF6K4dsu9jyKMrP+Cn9H6p/U6luXC88ctUSBfHILITLXOEbLaBMK/RYgelnpJFgqAXK7/yLy4mEHJCE+qMA61jHFiayNZb1uI9IAS1QFLeL9ZRJEl5jNYWerpE00TZAjG/jL3DArV8BxJLNSEDGxy+8gknv0mX7TcFuixf6lLYcAd6S5Z9UyQUvrFGWDW8FrqEUPyuEGPqynq/dc2cOPrSGCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEuf/YnJ9LBOTgUK8/rw7STyT1ESvFrPHl8SHT68/UI=;
 b=Up+xLUlAQpt/cPcpm82ryzCxa5X4PTkYzrh27TKMwgt7Vj8e3ti1IB2W0Ta9I+hmzxB/7FstKek24SW508ewKn2WBs5F1mMqhLJ6ZsCuIUoGfIWfpYGOZjsf/Rk33CFNJbN0GlNA3Bzaw6ou997l6+hYWCwSFqYaT+tJb3vu3MJ2XETJqcQqesT77mcMLqy1ApO0myq/mToXCPQK4AaqhRbma9qUWHKEETTbORkGKfBvOSBazY4KBG3ckgp+BLYkgMAOJ7vccbme5KRIAua/jM8QVxfkKWNM0C2gaEecUNGgj1k1SsUcqB04x4kyT6M2lCl5JfU6r0IGf+YcGwM5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEuf/YnJ9LBOTgUK8/rw7STyT1ESvFrPHl8SHT68/UI=;
 b=TWQvxebtdhnkiwE9/U7ffWRgxCFK968YdKGnrShHLP2ne+dNrY+LVK0xeuL3lnCUnT15+ta4NUyVzy04EYruYye/UI5/BQZSS4jZhUWkKTSzGzSyNxppkbG4ZYj8G+A7dKFUwxpbKnFKCEGMEwnQDKrLhVq7l6PcvVk67g/lyIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8191.jpnprd01.prod.outlook.com (2603:1096:400:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 23:17:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 23:17:30 +0000
Message-ID: <871qsp9zsm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: soc-dapm.c: don't use kzalloc() for param on
 snd_soc_dai_link_event_pre_pmu()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Sep 2022 23:17:29 +0000
X-ClientProxiedBy: TYBP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a765e18-5592-4ecf-858b-08da8f94cdd0
X-MS-TrafficTypeDiagnostic: TYCPR01MB8191:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrfcaVGVq+zP0nVqHq5FdDRId0PyQehvnnSM9IBMtkbaZ8hECvj8/TgLHf62Q6AnVdAKnKYR8bf4xUwTTP0QLAHrCUc582Dv2Izi2O0zXGvQj2wuuK8p6NhyIgKgDeNt9ZYuh1uUdAwzN3VFHOMKLZZEkDTwNSqTSuBLeBzjggO0zdobBFh9LEy45aJjFZHjkZmaJouRkx5gkvvkSD+ICnFG20CX/X7rmadjrp67gAyYTVc6sZ6f3S6ZvMd4tSzp9ACqOgyflV2xf2rdu3PLvQlB/UNUaNaAeBRPcb5ikDZzMNTiRpZtWV8pCzwDTttGqXOlN6VCDVTBKYVzW+Zg5BvD1oOqHIgaE5G+NkBp30YlARZBdaC0rhaP5AhjZbzgtib/yQkv5HoVTi11jCQ0s+jjFUn9UG/xM75V1JfkTyR2R9ewEbg4131uzY1f0g3LJJWLsFiH+iIDr08byACmIGl4ussCi54hIK1MKGDuBU7MUChEIkYfBEb1sV7w2R1nj7aSZIY60B1Xre/v5anXmqASdVPoAQ5axsFYg6GPvlh0PF13GyxIJ1DdZtDEvUPOnyiLpnprJWwl3x16PjlNb1ZXoEGXz1bGPSytpgZUb2hGQxtGTtyTYLucFf6/ls01ICO5Yl3vvVLduZ81+Rd6AzqUI8+h45jNKKpKXkeq4nWGlZp7tHjaAqovVhBAnS7xAzanGSiDCkY4751AzcPeJTRnAeU5V/jXgqXXWpLD1BE4EhuHTIRE5ErKQP3k4MItPAMvgvWAuxn9v2xEiTyKMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(8936002)(83380400001)(8676002)(66476007)(66556008)(66946007)(4326008)(6506007)(52116002)(26005)(6512007)(41300700001)(2616005)(186003)(86362001)(38100700002)(6916009)(316002)(2906002)(478600001)(6486002)(38350700002)(36756003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ID2+Ealw+ccnzuNT6hfykfXOGSFnBCavAIVd31PcnSEwri7HcnzjU5kzKpHo?=
 =?us-ascii?Q?YQPZJ9QDb5mdfB0yhGzzv7zCKq1/SgAALwfH01yT0LsQoVNhCO08+q9e8P0W?=
 =?us-ascii?Q?NmnE7guwy3M49I+goXYEB8yollVSimNaeP4nY2D3jLOa+kQYxpX39z21WSaF?=
 =?us-ascii?Q?Pn8gfTmUHkSK5C7eiF1GVWVaLUQ6EVkqWEBido/7cyMhFQEI3SwIZ2ALLh1B?=
 =?us-ascii?Q?o/oxgViQw/vOfees1S+wOoVJBs97tm5xhuxH4Zmfx5fkm3Cl1/m0ELS3jx1u?=
 =?us-ascii?Q?3DGB85mNXF/MEMmWpU/TmlSDCx3A5HFz2vZe6u8u+gRCZG0Nsupk2ZbJ7T5p?=
 =?us-ascii?Q?k8EYx7ksSu7zCpMCrWCnk2ucqjkq+BmCtKmfZFmKQegvYtJu8AHKGj/IS50C?=
 =?us-ascii?Q?WpAuKz6da6RVVCu30DeQQkIzTVr1/DM1htVa1nYn45QQtb9UAWL24aZJ3KJU?=
 =?us-ascii?Q?6JMV4dKq5pL4nwxLiEsB5Dw1ThZXVNrO8FXe2NW+T35E/THBPeYkn/gw98wx?=
 =?us-ascii?Q?L4s0YqoSk5vsHrgP6LkjSr6/ZAWAFs79hwc9+7HYzlSAdPfMroqbPnpYZQjV?=
 =?us-ascii?Q?cbrdytMWes9mTHZLJyofCbuP+hJPaWkkApHrJ/vCbSi5ahGyKRIY4WmYbf5Y?=
 =?us-ascii?Q?wnZZekRiBBeIy3WyAXsUu+STSzV9d3ptX0DZrOFaw1q9uYZnu2GFrd1OqBfQ?=
 =?us-ascii?Q?GPP3jctF5lIVbZVsAbVtk5tDRHFQseir8CEUYS6PgoIsNwJ00w0yxZnRAv42?=
 =?us-ascii?Q?aWIW0Ki91Te/Dav6yMt+3mYzd+qMZcpqQCEv5N4FRZeG7jcCG+XtsQZWcGSi?=
 =?us-ascii?Q?+uge0es7zmQcr1s7CIMIzjGLYsw5v+xJo/DIwUVVPxqaH3S2g7dexA3OLTce?=
 =?us-ascii?Q?Bd3jzk2gjcwTQAXogi9eFPKoXlj1j3SjTVGSt1yZMgBrXt/CLLMaqOR5o/5S?=
 =?us-ascii?Q?emSZ2yFsmilofq9RtXxgWoWBJBZOl//yEQUs2yOlSv4RpVUj1S6la0VxMGBn?=
 =?us-ascii?Q?fs0HjLoXor+W1BLLAssx/D7KgI9zbfToDo7oaHQNn5ZwcJKMF0wCDzR8MNVf?=
 =?us-ascii?Q?OvJ4PUXrZW3Mi1rk1swTBvAxPv8zuXSefYxq1KhMQ7mlHh+jQpe+rOpzDlto?=
 =?us-ascii?Q?ePnadaP15MjK2+Jw+r5DwxMpSlE2hJG5NImv/EsSYEbY9/LZEJmNPC3SFiT6?=
 =?us-ascii?Q?H/86xUt6n1weGj6bKmUcf6yMz+KLDxsk9XvqmJ2DVio/zkXpCI0LB5AUZmav?=
 =?us-ascii?Q?g/3qeMWbaUyeZuK2m5k6Tn9TdgsnJeSX14sffdO65UxH7s0JCM56RHBxiono?=
 =?us-ascii?Q?TEGSLQRTXSTN6jRpmU00+63OvGGX3J+LAJxBhG+LrCHu4i+Op5Ld+S6UbEQ8?=
 =?us-ascii?Q?5QEi2okK8k6/7uvsq78jQTBBrtKuSjBhX9W6mU265//JCOchGiawyyF23tf7?=
 =?us-ascii?Q?xcZ6qm6IUpnwaUi5kdGECL4ETzDWYo52vILGZc4x+Mcak7sX7IHQeSX+XKKn?=
 =?us-ascii?Q?/qhYpo/NW2ZG8hiyukRmCv/8a9RN5UQG5ncPtAuk/FlJxVW9dZFtE6f2BzRu?=
 =?us-ascii?Q?9lObC9ftxv5xSKXqm2EyvZMwRvKeKOHov+AZmOMr0ZZs4wJNzLYSFfCGMRP6?=
 =?us-ascii?Q?JHI5U2sjxLXDDKmpAW3tbGU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a765e18-5592-4ecf-858b-08da8f94cdd0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 23:17:29.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ik0O52P/8voMpgzxxrzykBb51foILOwM58fHoS7OQm3v6KDAedsgWZpgZiPRVQFvxMYKApTwKdqL8WOnIXZMFyacWZP/+WaarcrpqIbyuSxOufewq1reoVLS5KF92RG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8191
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

Current snd_soc_dai_link_event_pre_pmu() is using kzalloc() / kfree()
for "params", but it is fixed size, and not used on private data.
It is used for setup rtd at end of this function, just a local variable.
We don't need to use kzalloc() / kfree() for it.
This patch replace it as local variable.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 73b8bd452ca7..7d4e4068f870 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3837,15 +3837,13 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_hw_params *params = NULL;
+	struct snd_pcm_hw_params params;
 	const struct snd_soc_pcm_stream *config = NULL;
 	struct snd_pcm_runtime *runtime = NULL;
 	unsigned int fmt;
 	int ret = 0;
 
-	params = kzalloc(sizeof(*params), GFP_KERNEL);
-	if (!params)
-		return -ENOMEM;
+	memset(&params, 0, sizeof(params));
 
 	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
 	if (!runtime) {
@@ -3902,45 +3900,39 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		goto out;
 	}
 
-	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min =
-		config->rate_min;
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->max =
-		config->rate_max;
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->min
-		= config->channels_min;
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
-		= config->channels_max;
+	snd_mask_set(hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
+	hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE)->min	= config->rate_min;
+	hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE)->max	= config->rate_max;
+	hw_param_interval(&params, SNDRV_PCM_HW_PARAM_CHANNELS)->min	= config->channels_min;
+	hw_param_interval(&params, SNDRV_PCM_HW_PARAM_CHANNELS)->max	= config->channels_max;
 
 	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 	snd_soc_dapm_widget_for_each_source_path(w, path) {
 		source = path->source->priv;
 
-		ret = snd_soc_dai_hw_params(source, substream, params);
+		ret = snd_soc_dai_hw_params(source, substream, &params);
 		if (ret < 0)
 			goto out;
 
-		dapm_update_dai_unlocked(substream, params, source);
+		dapm_update_dai_unlocked(substream, &params, source);
 	}
 
 	substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 	snd_soc_dapm_widget_for_each_sink_path(w, path) {
 		sink = path->sink->priv;
 
-		ret = snd_soc_dai_hw_params(sink, substream, params);
+		ret = snd_soc_dai_hw_params(sink, substream, &params);
 		if (ret < 0)
 			goto out;
 
-		dapm_update_dai_unlocked(substream, params, sink);
+		dapm_update_dai_unlocked(substream, &params, sink);
 	}
 
-	runtime->format = params_format(params);
-	runtime->subformat = params_subformat(params);
-	runtime->channels = params_channels(params);
-	runtime->rate = params_rate(params);
-
+	runtime->format		= params_format(&params);
+	runtime->subformat	= params_subformat(&params);
+	runtime->channels	= params_channels(&params);
+	runtime->rate		= params_rate(&params);
 out:
-	kfree(params);
 	return ret;
 }
 
-- 
2.25.1

