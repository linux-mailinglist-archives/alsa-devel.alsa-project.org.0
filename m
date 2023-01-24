Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07162678E1D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5D1EAF;
	Tue, 24 Jan 2023 03:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5D1EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526643;
	bh=K5+vsxcXyCenEqEs4g7LZmiHRlvK1brdSaJcFKmIDrM=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pASn8OM7u+V5eFmK+S2TwITxUsE84QdhdFJdudwGW+l+TDxIloDq76XmYt+8hFakj
	 pfXkzpSwbCR7o5mIotfY1aSClbs9fSJp1yLWVWWD8dbTgdL+8L7Mq5UIzaNWD1uT/T
	 6tahJ7jerZyzKXVSymnLTKPuema6PGIdaFWDK0d8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00839F801D5;
	Tue, 24 Jan 2023 03:16:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B1C6F8053D; Tue, 24 Jan 2023 03:15:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E850F80515
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:15:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E850F80515
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PimZVjfC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdhRfezU+Ko/0OUblw1nJfYKkjG5Wmn5htu2d9p+ZtDzyJnvK5j+hmaRGe6kxvmhe6MKWr54nBZw/vIkH0aZ0+Eh1hP8cbvlgJvifEIgkH7EGJWSegnriqOzz+cW6l0HugmHnxAQVj6CGKA+SmWeMEDkLeclxLnQz3M69TwyCEuu7fg9eocuGQNiFOyRoLVI78P20YK9AYRBnieu/U2WMQmmQwMevY2u+cUHoSuqsPRn7gSD7PEeSgVTqo0hKmMOY7pcCJ1ysdcpkA1nzvbIhGpRdc5QXHIiwKPcjXGj8XpqWAzjD14gqrmqYpFI+tZ49ChUGamo+0l7WLEszSG6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGc0opdrznm0DhXnWEbsMnR6kkYw9ItwtlVP/5rn9r0=;
 b=X8mqd9S5swXEoZjfAYeVWwtLf1FkQi+WyZec5HBmnZfPZLBOd/EIpJHWcLdLE9WiZuHXM/TAS77ABVJHWMRL+XUp/UcKKsZ+6Blh4MHUld27SmOQ4ChAWrkoM+xqosYfqml/Dq+T85LAk3gewrMgFALzhMypgKojjXtgox3Wi/9zrK9/+DQkrhKKyV+EDY2DQKWr4oVcJ1jxOT+VrvwVhOvVhehLH5l0YV6aPWy+URFUmRIAF0kzTJRYNTIuk4d3nVFiD6D4F086pBNwo5dXpXe+SE1BBNtFVc6p5Yf4FPf976VqpU8edk/XIE9Y6seDJVYMI0gHkXJdh7iZa2pY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGc0opdrznm0DhXnWEbsMnR6kkYw9ItwtlVP/5rn9r0=;
 b=PimZVjfCg/ud/HCpcCAMlbR2oMOsC0gJ5Wh5Ldixo8XdkTm+mNnPYzH7N6INPX0XCLR472kFTOZAw/F8FJWvoUCifXJ6Uy+v78nwNs7jol+bhWs938yCZedmujJTAD4g8tzMaJbOl4lEL6J6Tq3wHEQB3zSEEuKvEX6JLXpKMog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8812.jpnprd01.prod.outlook.com (2603:1096:604:17d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:15:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:15:51 +0000
Message-ID: <874jsgu17t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 21/25] ASoC: soc-dapm.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:15:51 +0000
X-ClientProxiedBy: TYAPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: b574ee2c-e474-4ee5-c33b-08dafdb0ea45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X8LdPpXTtxDkusAyZKq0BtISMYFfyYkb7+PTx0bxiuSqqx0iFsN2gJSN9/ggKWiTVU3cGKCWBMcHoRu4vA/YIM7BGQ0Mf78A1e5VdDUNYG1zRsIEcNem2EMQjgvHJ9KlWAr9K0XvQxsZHnTfyTcfHt/4/Cml0euSHCRHkyWBmJR47CalTT06WeF2fBLatchxLD8xp6jGdNoK7WQGP2t4jA6K7kol0qpod51pavfmOGxmRZvTfI3XW8MTkYQ97owTjBfce6rNPiFxDWRZFS0B7eTa7z69i0x2HYqelOFUtAh8HCzNzAGobTnkm4o0Q0HJI/pNidX4+s7LewIRjFRyuj3x6x9EXKVztv8EfjvHRMiaQOAdoScHXSfgKjQsdHl5sveE2es6ZO7Zyt3NdPlfFOj75DXITlhhApXFJTF6cRUqlAit1qgKLYZwO5KX7plDaeGdPVZcJ3aEpzCoMtok5clu8H2G74+QyamD7rB1KelQA2TY3WU7ELUlUd9WLnLDym7NDDAnPmshX5fxEb3uj98oSMbaaMm2CKaJwU9xOopaTt4gvaTwii+W1TU7XAYqlOypZXqIFqcH2ar8gtZ4pB0qKYrfr9pkgneiU/jYZd6QpzYkwLrLORpOWvmkqsA1cJxNEGvdmi2vm3MuqDszqBXtGnBu+pzU9+DyF7CNzw+VLzfTYeYOgqpwm1yu8lOJ7/clNcoVWEijoFplGwqh1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(38350700002)(38100700002)(83380400001)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(26005)(6512007)(6916009)(6506007)(8676002)(186003)(66556008)(66476007)(316002)(2616005)(66946007)(478600001)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2zBOuOrSaZrh29i64tqaOyired0WlFiDSI4XctpR/1Ju74+00+MX63w7on0B?=
 =?us-ascii?Q?UsIEAYz754ZBtn70hjKFjn4RbmGY3yo8p7C7VeI4SEYuZon/j41BGFjkbAEZ?=
 =?us-ascii?Q?OF48rGaAO2qRh/FgbPUhjQYHpEYNQS1d+eALFdAz8+DrZTFf+O5I1isHMDVc?=
 =?us-ascii?Q?oILuhfwaAynxJCWk1SGc04mWbxyLI1l+gHwEYiPs9R5tP7A4J+hPlYeoX2To?=
 =?us-ascii?Q?P7/k2ZoxiHL3xlATL2Zvxu8e0JgN4aXCTBV8ayM5h6clZOHnwYNpK8xRoDsG?=
 =?us-ascii?Q?U2NgUimziEdAMjT9KrJL82wHjX7pWC1fe7SDRxUtuZicsuT+t4CfVZzKbVyH?=
 =?us-ascii?Q?nmcD2cLTXxioARpRGtXCTJc+lHr82cLBYgsOrnbdMtvhR18Ty4o4yVIbSxPK?=
 =?us-ascii?Q?1t1Ceszw6/hk9oxlfimk80o35ECaXrVWUNCd4+8KXSR7ZJcsDR/vf8TmrUwD?=
 =?us-ascii?Q?fRHgNl2vXzGwiqEm64Yky/55V0CuFjhyUC8uC0ncY9K4aZfRZIpqDwtvUtJV?=
 =?us-ascii?Q?3SFn1dCNRxYk+Q7oefPknOi1onXbuJ0+PZXybCWpfhom1Oy7C8emmTynsXGK?=
 =?us-ascii?Q?UgwuBVVwGjpUomQp615JdbxU0FO8gmVxJHDYIUQT3eIXfD3IT2+8c6Rygr02?=
 =?us-ascii?Q?FRmUqfoce1cMt73uGHqf8DgJx9QtFRy8O4RhNH9fFcUf7/FI69MFpXTfvJAB?=
 =?us-ascii?Q?YDu9r86mmUu85GfCKjsEKkOPIQzx20W2gIW5uD3wOL119PRP1dOCU/NkR0rB?=
 =?us-ascii?Q?uKdIlmgOFJnSqtpLnSLw/K860on53ni+TKZkpbH5+GrHKv9422dkJu8146Ma?=
 =?us-ascii?Q?BxZP5pqPkr2Wn5tU67Kio2b49IRoxwbjoGzLuHrQqu7so9dVLTWeikQr1e10?=
 =?us-ascii?Q?XRoCi9YKLtDq6aaRvbpxXs+0zRAbHFZ1GfrVFxM1ew+81E3UnpQj5X7I7+Oj?=
 =?us-ascii?Q?Kq4R8LFuYisUIPZWDj0rcjuQKrATx+LtCv9dpue9LPjaTWGnwWHVh9rOIkw+?=
 =?us-ascii?Q?+oZR4ajAB2PBLPO0fLJ9CW9IKZVtrs2xxsmCQ6NXCABMPM+u+DeA1AsMYjHY?=
 =?us-ascii?Q?X1e/5Tl1aStF7r6de3x1GRGS8Nk0bmui5qOoA8MiPq3SU3baLC8o6wiVhFHE?=
 =?us-ascii?Q?cQUvkNhmrtQI4BsnCK72mRpj+lykw1WU8D0O4cQW73+tQs6GK3bD0kNj4sHi?=
 =?us-ascii?Q?OtKG77OfJeZ774wkpPs1hOCPfX8kyf3T4Zj/++sljK1CuW6FXHszFFBTG196?=
 =?us-ascii?Q?eAzgsVf4Ro/WoJ1r0mfBY8LKpdpoHrYSm73s7ZV5jbKqyuNtBADbpjNhBUMe?=
 =?us-ascii?Q?qCCMKu6Z0r3Y4yQHDm0iOpZTRsGw6C9AQ5KwKq7x73QNmFf74dUsy+eGno++?=
 =?us-ascii?Q?OfUXKkwgqAZ+sH7ESeDmjujgtept2sg6c21Z/eTjS8U8a5ExGF7Qbwl4/wmH?=
 =?us-ascii?Q?rkwfws19e64D/3kptbtUp/Nq6CvY3VkK9PIjSfJfHilFY7GQpVEWqIe8XUar?=
 =?us-ascii?Q?9zeQR4/YZkh5gc4nI8X3i4vQt7mpS3bdlIz2HEnKbGUkQoSoZgyneYTTaE51?=
 =?us-ascii?Q?KgllkIVB0u+1xr+nHq/aeXBK7fMbuYTCNyMGL9cRBieoo77dDbIpIo1x9SuL?=
 =?us-ascii?Q?3hihS78zIenVi/Bsst41MjI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b574ee2c-e474-4ee5-c33b-08dafdb0ea45
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:15:51.3652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyA8DQpxcrtDvXdEE5x+UvENNO2uapozwrtvooa1tPhVu1hu0wCc2vLkNYJnlmqkWFvy5WWE3VK6arB6OvXZnHw3xTov8VEmxgOmC3lHVX5tb1YFn+7nA1ZTVtDDuWMp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8812
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f61c8633e7eb..5d9a671e50f1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -149,7 +149,7 @@ static int dapm_down_seq[] = {
 
 static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 {
-	if (dapm->card && dapm->card->instantiated)
+	if (snd_soc_card_is_instantiated(dapm->card))
 		lockdep_assert_held(&dapm->card->dapm_mutex);
 }
 
@@ -1297,7 +1297,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 				      enum snd_soc_dapm_direction))
 {
 	struct snd_soc_card *card = dai->component->card;
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	LIST_HEAD(widgets);
 	int paths;
 	int ret;
@@ -1305,12 +1305,10 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		w = dai->playback_widget;
 		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
 		paths = is_connected_output_ep(w, &widgets,
 				custom_stop_condition);
 	} else {
-		w = dai->capture_widget;
 		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_IN);
 		paths = is_connected_input_ep(w, &widgets,
 				custom_stop_condition);
@@ -2614,7 +2612,7 @@ int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm)
 	 * Suppress early reports (eg, jacks syncing their state) to avoid
 	 * silly DAPM runs during card startup.
 	 */
-	if (!dapm->card || !dapm->card->instantiated)
+	if (!snd_soc_card_is_instantiated(dapm->card))
 		return 0;
 
 	return dapm_power_widgets(dapm->card, SND_SOC_DAPM_STREAM_NOP);
@@ -2908,7 +2906,7 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 		dapm_mark_dirty(path->node[dir], "Route added");
 	}
 
-	if (dapm->card->instantiated && path->connect)
+	if (snd_soc_card_is_instantiated(dapm->card) && path->connect)
 		dapm_path_invalidate(path);
 
 	return 0;
@@ -4229,7 +4227,7 @@ int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
 			return PTR_ERR(w);
 
 		w->priv = dai;
-		dai->playback_widget = w;
+		snd_soc_dai_set_widget_playback(dai, w);
 	}
 
 	if (dai->driver->capture.stream_name) {
@@ -4245,7 +4243,7 @@ int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
 			return PTR_ERR(w);
 
 		w->priv = dai;
-		dai->capture_widget = w;
+		snd_soc_dai_set_widget_capture(dai, w);
 	}
 
 	return 0;
@@ -4339,16 +4337,16 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	int stream;
 
 	if (dai_link->params) {
-		playback_cpu = cpu_dai->capture_widget;
-		capture_cpu = cpu_dai->playback_widget;
+		playback_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
+		capture_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
 	} else {
-		playback_cpu = cpu_dai->playback_widget;
-		capture_cpu = cpu_dai->capture_widget;
+		playback_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
+		capture_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
 	}
 
 	/* connect BE DAI playback if widgets are valid */
 	stream = SNDRV_PCM_STREAM_PLAYBACK;
-	codec = codec_dai->playback_widget;
+	codec = snd_soc_dai_get_widget(codec_dai, stream);
 
 	if (playback_cpu && codec) {
 		if (dai_link->params && !rtd->c2c_widget[stream]) {
@@ -4367,7 +4365,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 capture:
 	/* connect BE DAI capture if widgets are valid */
 	stream = SNDRV_PCM_STREAM_CAPTURE;
-	codec = codec_dai->capture_widget;
+	codec = snd_soc_dai_get_widget(codec_dai, stream);
 
 	if (codec && capture_cpu) {
 		if (dai_link->params && !rtd->c2c_widget[stream]) {
-- 
2.25.1

