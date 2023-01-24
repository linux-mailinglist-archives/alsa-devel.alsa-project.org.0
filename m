Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA33678E07
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D715DE98;
	Tue, 24 Jan 2023 03:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D715DE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526287;
	bh=FYEMEZverDpT/l8VPzz1dryizpJ20nREbYHc+hLbIgs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=men5wBZU2xAe/LUpMGBB/Zf+KUGS1yMjzqmx0YouWcltxt9OsiG8+fFkV+saBPto1
	 KThot+YTo3UkWNIB+aen29puVXWFMGBwQuarqzMXuHifzhSIvpqCbmDA06IN3KBG7Z
	 069zTFkGMnfLpafiHaf+TaqyuIjRC7oC2GUFUQ5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13083F8030F;
	Tue, 24 Jan 2023 03:10:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A384CF80543; Tue, 24 Jan 2023 03:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C97EF8030F
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C97EF8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MSKK/z4p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDPxPdOyLLGPx6TGUbLvhKgMw5NWnEU5WLblQd3npcq+lglDqx6b8MNPPoCoMcrTpudTVP6NgRyhrfL5z2bM9Ow6vhOGyLZmTVhgk4Qan/CZ98sbwbkVe6nRAu4wGyE8xN2WeHyi1CMwXQjVv9t2Mvh79LzWWAkg7Gxd9TcnWBjwSV87t+qyLq5ThLg+XMURGyTVcvvpR7LCUKT+6LU94+QgjJaBJ6GE7i3mhUli8XNUffRr2uivR1kF/S3LQyXx8RjWxNsX6orqh6Xfev55rGDNWuCqQtBNB3n5QtTJyZFYBQDtJbLLAGP5sDuUjjfhvZKEqrWrz83VLnV/Q/SECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQDboAe4Y6sGeKLK8cEpp0tfsDmJhZlmOfIo9hM1LEw=;
 b=W/z5WOPWbr94R43EuZJ6AAt9CAopShc2Qahztuys8ijw8uZ2u26D2ECDl2riTchtqo2T0+DxJi03RBHcM7wvPbeyPlCnfeQf5U6YAdY/VQ8JoCs8IlFPC3pqMzgwsShNdER5+dYkINStAegEMcTBuZ4mZnbVHXMD6LNNWaGQRTM+p/ve++0lay6fEEVrZnR5ruxgKAZVhbQ/oowIuHqCShp4SQd+9i/g1QxO8zaMpXYd7Vt0WxHv7q9IPmzeMfzpk07KhnZgnYgQMaqEF0PToNXjGtvpcQRLejYnRy0U8orP2PVwEv4a5fCPrbiG8HBK2DjGYb6Uf/Pi+3wSLLrnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQDboAe4Y6sGeKLK8cEpp0tfsDmJhZlmOfIo9hM1LEw=;
 b=MSKK/z4pRdUDn5nBSqDg3Un/1/W1hBBTxF05UFcEEqATqtYGSlnzj1RWDcU36JJ3oRiNpOHwnmeYczy8K6F2k2zpVFyg5yWYWrlNpIoAcxX7MhH9tbtErWMJ3zPy+W4D56HAn2Kmnr68nJal7n2OVXKjQCPzqvvbgMVopfB/Qro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6128.jpnprd01.prod.outlook.com (2603:1096:400:61::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:10:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:10:21 +0000
Message-ID: <87lelsu1gz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/25] ASoC: rt: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:10:20 +0000
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 571d2605-ff57-4a82-ee95-08dafdb0254a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3NpA/jbwMuKCW6C0tmtVMKnADnIo5erMT5RyR1LgXhZGU095Z9tg6Y/6uwBh2owteaKswJHRVr5kdmRvFmv1kWjQs2VBecFX2LypWB6rEPEyOr9jt0hfioPWtBEA8G6vnY5JfCDmGAoYu6sk4wE+qyZHwmWB1pqo115B9HOgHMaaXJV+ZVJR/xY6sUI12q//wrE4qgWey73mgSzPdUJ3MI0txkY5fFBqbAlM5QEjdqb6oTcXgF6KCCDzKK4lc92gzWeKz4JXXBRpzC/QBgAQsGLGNOoV0eZA5Q7HbOo7QFNq2Cu1ICjAH6mdVrodsZ04wkV/Xg49R/tQWkx408dB+aB7X8s779RwhOfUbKo+xxI/GBsNW1S79UyUyXH/4KHMcHuYOnuBmj5kWu9n0+Mm5yA5PTPo5TNhf96Tm9S9SipombcOXlDJ8+gtX+az9OdwL3kWv0Wa8VuF1cIIYvXB8i5FwxfEbOb7YMB4p8kHPfp0JTSTBAoJfmxSq2jo1LbtDNlYMlFNmj6ojzXH2p5eo0h+P31/BGIBAcBafQ82LOxX+QdC8wlTMsPpEjg/5t/1itKQJbGqWY3Uxii/4eTRR+4NktJGyZG8btmV47UsPmsza7iXi4kKpc8kFWn+4cOlBZP++/QuthNAbNY9QAq96AkH5hEkLKbpl0Ta2+cLS5IINfra020ODTw9vArzswfy3jfx2e4ILWFXcNIsWoMVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(36756003)(86362001)(66556008)(2906002)(8936002)(66476007)(6916009)(66946007)(30864003)(5660300002)(38350700002)(38100700002)(6486002)(54906003)(52116002)(4326008)(316002)(8676002)(41300700001)(478600001)(83380400001)(186003)(2616005)(6506007)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5u4eP/ptUi6SQXcaCPPgtJmIeYgeV+wLhj64PX0WuIU0pq5P+c9KF/E3d8aB?=
 =?us-ascii?Q?D8T5vgX5TEnhbHNaS+HEfTD3A7BisAU/hR3+pIKUosmglOAiWGIKmVW+XMqR?=
 =?us-ascii?Q?GclSVCQjdOb3mekYZg5GO1AwuhdX5xkW37LaKmNURXQPsiv03Bqfw5OzrWRR?=
 =?us-ascii?Q?f9RVS8b2JZltapsTCPY/GhWsm8pzanRVJU1wf+cnrORVbXc5OGYdKrX21Ujm?=
 =?us-ascii?Q?4aJsfkPJhuh3jRRnwBbAWaREQyWXetlDWC/670Al2OBOO4FsWFdK6IHTYHr3?=
 =?us-ascii?Q?Quo6ZVkC7zfUC4v/FyiOY5+GysDKclb/PGQTerU0zRPtGkdZxeS3r09KKHNH?=
 =?us-ascii?Q?34xXSLs9K58o/98oQY1IHrcJam7xzmjoKojKN38DQnBV4xk9B1LnQ8lwhZjl?=
 =?us-ascii?Q?+NITO47r8hjP0uHTXjP+uCuyVSUlFx6MAKhRLaVTH5NOYIt+35OxjBshpuwK?=
 =?us-ascii?Q?wyJsXAcp319LIxH3hnaJ+wNzKyF77mDePBdDOw7AfqY/McU2thA6DV4C9tK4?=
 =?us-ascii?Q?rySqi04mGJ9NOK+XGS9cwKCQTcBvZtpkfXlI51ELiu78ZYzv9uhCWE3cqWL3?=
 =?us-ascii?Q?E/uqdRYYy5vt0SA3kSgKyVpJ2fzvPbR8RB87XcPt7iDlVbmtz5V5p9NujD8o?=
 =?us-ascii?Q?4CFv6cW3CrdrYi4u9aUkaUYBstjsVTRIifuYLv4Ko/Qw5mIsmTZyiYURpLTt?=
 =?us-ascii?Q?Y4+ONl3SAml72s1p0WkgGYMgy/OG20XID4SiEas+cQTgzEq+z3HUugfqa/kr?=
 =?us-ascii?Q?K92oqlq8BpIvPTcdDPe23dsaGysYq3CmoZR5rpSxRW24gl4dsARBIcqa16nK?=
 =?us-ascii?Q?UDWWbfK9VCAfutupXXzD5vLicG9IQujslrQMwV6v6ycsJw0JxD9FWhnQV5TX?=
 =?us-ascii?Q?y0tSgpnM1oGV7WHKxD51xnuwWGn1Fyyrs5HuFzo5yihDuhmzolU0chC5LaYo?=
 =?us-ascii?Q?4udZI7mmTyvQYs28bc9mqeJkUPChYLAahurkkbRijUlJ2DyzI5+LVpFpbMS4?=
 =?us-ascii?Q?o0FCY/mahAWFYqjmhsV/CvLrYS6lCGOgFvwx6LVc217hr0uERQkhBou18jBC?=
 =?us-ascii?Q?LqqpRXBGjJHuDGgnBL+zFqNDXyDFQsido8Gdvc4BF8y3atTg1CyQTH9vKlxt?=
 =?us-ascii?Q?cgoa2ldRW7AOpjG3QJ65uVrw8fYPZSA3xS6wvH1itSCEf4cYBwcmwfNoa4s9?=
 =?us-ascii?Q?JXg3O8LCZM+ZGQCrXUhpR4OsXiZDtWsylTCu9GNTCTQq3bY6DhRCzQxdQPCz?=
 =?us-ascii?Q?TkSg8+k39P4RCxWMsGK77Ppuoa4TqD+46jHJgWmlVSbiems2mrDc3tIFO6xF?=
 =?us-ascii?Q?tUF1AVemoGN4viagPkSymbdPDRqd2E8hzWi7fH9Fv5IEf68aB060MFQHWUdM?=
 =?us-ascii?Q?fjkxaVAkyFr8UmsEz2Y75h5TsVYV8HkffmZsrmAARJcMx/v3B1frs7E8jxZY?=
 =?us-ascii?Q?P3REG/apmTv3Tl/7XXsqH1SD6+kGqq5k+Ohc70wCU5/fZ3QX685Pdb2eUrnl?=
 =?us-ascii?Q?J3xYohpLLuvFyeRIghlDixkQ8iT5SId/kQ3kMtpvkZaNxzfN7UvcG/0teL2i?=
 =?us-ascii?Q?6Srmwhxn/uxsuxFf8MrD6N5j9zIPDYpD6bWCLdqQgaI6PM3lBNMSZbCctBSo?=
 =?us-ascii?Q?3UkDa/x5ltcliI6UxYC/2eg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571d2605-ff57-4a82-ee95-08dafdb0254a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:10:20.9335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Gl4rNHSJoDbqbom/2RKZOD/ot/xeN9BI9KyWRAdpWuNZtSCHLeF06P8PO9MTgX+98vLrJqHYJbWr7AID42YQl0tcZujDRIJzFRPhGu9THC0xB7rmaxHYYeLOe+klgUF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6128
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
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1308-sdw.c | 5 +----
 sound/soc/codecs/rt1316-sdw.c | 5 +----
 sound/soc/codecs/rt1318-sdw.c | 5 +----
 sound/soc/codecs/rt5645.c     | 2 +-
 sound/soc/codecs/rt5665.c     | 4 ++--
 sound/soc/codecs/rt5668.c     | 4 ++--
 sound/soc/codecs/rt5682-sdw.c | 5 +----
 sound/soc/codecs/rt5682.c     | 4 ++--
 sound/soc/codecs/rt5682s.c    | 4 ++--
 sound/soc/codecs/rt700.c      | 7 ++-----
 sound/soc/codecs/rt711-sdca.c | 7 ++-----
 sound/soc/codecs/rt711.c      | 7 ++-----
 sound/soc/codecs/rt715-sdca.c | 5 +----
 sound/soc/codecs/rt715.c      | 5 +----
 14 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index ca2790d63b71..45544b530d3d 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -508,10 +508,7 @@ static int rt1308_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index e6294cc7a995..6dbb59f51426 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -507,10 +507,7 @@ static int rt1316_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index f85f5ab2c6d0..784147a1004d 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -575,10 +575,7 @@ static int rt1318_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	dai->stream[direction].dma_data = stream;
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 620ecbfa4a7a..7c7cbb6362ea 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3157,7 +3157,7 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
 		snd_soc_dapm_force_enable_pin(dapm, "Mic Det Power");
 		snd_soc_dapm_sync(dapm);
-		if (!dapm->card->instantiated) {
+		if (!snd_soc_card_is_instantiated(dapm->card)) {
 			/* Power up necessary bits for JD if dapm is
 			   not ready yet */
 			regmap_update_bits(rt5645->regmap, RT5645_PWR_ANLG1,
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 6e66cc218fa8..17afaef85c77 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1298,7 +1298,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	while (!rt5665->component->card->instantiated) {
+	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
 		pr_debug("%s\n", __func__);
 		usleep_range(10000, 15000);
 	}
@@ -4748,7 +4748,7 @@ static void rt5665_calibrate_handler(struct work_struct *work)
 	struct rt5665_priv *rt5665 = container_of(work, struct rt5665_priv,
 		calibrate_work.work);
 
-	while (!rt5665->component->card->instantiated) {
+	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
 		pr_debug("%s\n", __func__);
 		usleep_range(10000, 15000);
 	}
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index beb0951ff680..ecf3b0527dbe 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -1022,8 +1022,8 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5668_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	if (!rt5668->component || !rt5668->component->card ||
-	    !rt5668->component->card->instantiated) {
+	if (!rt5668->component ||
+	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index d8a573dcb771..5f80a5d59b65 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -107,10 +107,7 @@ static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7e3eb65afe16..f6c798b65c08 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1094,8 +1094,8 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
-	if (!rt5682->component || !rt5682->component->card ||
-	    !rt5682->component->card->instantiated) {
+	if (!rt5682->component ||
+	    !snd_soc_card_is_instantiated(rt5682->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5682->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index f5e5dbc3b0f0..77dc62219bb8 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -834,8 +834,8 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
-	if (!rt5682s->component || !rt5682s->component->card ||
-	    !rt5682s->component->card->instantiated) {
+	if (!rt5682s->component ||
+	    !snd_soc_card_is_instantiated(rt5682s->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5682s->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 6534c9b51442..659ce26e9f3b 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -163,7 +163,7 @@ static void rt700_jack_detect_handler(struct work_struct *work)
 	if (!rt700->hs_jack)
 		return;
 
-	if (!rt700->component->card || !rt700->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt700->component->card))
 		return;
 
 	reg = RT700_VERB_GET_PIN_SENSE | RT700_HP_OUT;
@@ -887,10 +887,7 @@ static int rt700_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 7cdf184d380b..c65abe812a4c 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -295,7 +295,7 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card || !rt711->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt711->component->card))
 		return;
 
 	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
@@ -1249,10 +1249,7 @@ static int rt711_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 78e1da9b0738..862f50950565 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -243,7 +243,7 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card || !rt711->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt711->component->card))
 		return;
 
 	if (pm_runtime_status_suspended(rt711->slave->dev.parent)) {
@@ -976,10 +976,7 @@ static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 1fca7a3f46ea..920510365fd7 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -793,10 +793,7 @@ static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 1a2036ccfbac..c6dd9df7be45 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -777,10 +777,7 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

