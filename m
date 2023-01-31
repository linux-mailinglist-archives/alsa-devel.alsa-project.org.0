Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB76821E0
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156CAEE4;
	Tue, 31 Jan 2023 03:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156CAEE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130748;
	bh=K5+vsxcXyCenEqEs4g7LZmiHRlvK1brdSaJcFKmIDrM=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O22EMs3kJIqAK87tkzRoxeX4ZU/NnYaSxHJewj0lB33BNQ/Rs0zQ0Lf91+jGn6we9
	 +p0G8/Izcn9NnBU+F/GFKMITErgtChAm3OOhzMRQK7VdFjdISH3QEtwef5cvqx9zU4
	 DzjiKXci1KNMp654g7kvjUrLFVeuYKDN7vk6YwCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C76F8032B;
	Tue, 31 Jan 2023 03:01:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9AF1F805D3; Tue, 31 Jan 2023 03:01:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::716])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48DDDF8007C
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48DDDF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SW24CfFq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8fHcpd8z2aC+u2bCI7zdGClST224K1BkGL86HAvbG35ITEku9dmYORT2KZTNAxFJ+YvFnv3saHIdsm/rUYR8RUBKITBR+CGsL3SNYjcI/F9eOnUGR9ziQm5EKR1xJxdH1oXgHlntNYVQK5j2O67+MLWO1mlPjuVjck30q9zJLAGLHIbH4c4ziya7YX72lKsTUD26sWtUiK3kzdnNKTPar6cUae6LwCagSP8Z58N0Kfv7yEvVRSO056jKadQ61bJVGbYeSMgOEemxOqM0cTvUu1Z0iciwi0EmZ4PA2a28H9OIDFrYM1RnYZo4VwwrGE2/7kLkzv3JsJnhqweVd1ewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGc0opdrznm0DhXnWEbsMnR6kkYw9ItwtlVP/5rn9r0=;
 b=WBeqwaQILN4w9XihG29BU4BhwGdwlVa+nkS5W/HnFvXrQNDd79JNNbHFeK0gM0lU1pb29C1mquMDbX8U8J3G4LJog1rVgJpdrfvOcP7VRPYhMnWnoDG0vDPw/dXHV93CdsmPGtFGE0Fm1rEdIM0BQHcjTIwoKvWt4BCJ2zQmAKgVfe8lklSFLGRTtQ3lYOliHFS3mqBafGQy+73RQ0KvkgIT0vFQVL72quTlsOa/IXlOC1Z3+fmlk43xr3DGOtGxRfUqlWaPa08U6Yz4e8s++jZnkfkRxSXll5HzZrJLP2Cfsa3i+TjxhqeTaP949Wa76cGglLMYIKtvAcP452AFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGc0opdrznm0DhXnWEbsMnR6kkYw9ItwtlVP/5rn9r0=;
 b=SW24CfFqTYIIEeHjKkrV44Pzwey7TW4rN+9Qs+Ba6eH0ReKgsvOvvvzEhdQBQNAsXlcGvdgkZ1rviWQqGNCcpxR4jZmUF9SWF5scWuU6o9KYCQxxO/0NXCaZWEKr6DflP1Au2VE3eD7ecWMlYXbMExogAdJ3wG68tOZ5pMSkczg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:35 +0000
Message-ID: <87ilgnea2p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 21/25] ASoC: soc-dapm.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:34 +0000
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 843e04c5-7845-418a-fcb0-08db032f14c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B6tOs6hab5nsVB1/m5IFfdck5MMDEbKnckt75BOq5jcOPCYLIENZRhvSi37AWYcbFVMzQle/LKmWnvH6tZpgtj3oLYSE7nc6G56nDL0MF++zViYN4c2jgcZ1wZjy1qA0PUEUQyCxI27MfTJgfTlmVNwEbGh82jU74nyWbyiowfq9kGH739yUaT/auJ72ULPjK+OjKZhWKD5gvLd6c+a8a5jKvN0aFXVM3IeHjZt5EbFBz0QsIUYbeQgFNKe15RO8L5mRaFSPj+vu+Rjqj81tNqPPXh6fAcJDBQp3dxne911yxZ3cR10oUSSFibQ9BbsBzPBmJjo18rykUxnk/yjUzM5lUR/RmztvP4ybwpBLhrKL1WHtOF6FMqfpQtGQTXV1yrWGzKzRWufkf32x9ZDDBqCWfxCMg6twUSDhi8nWoCUlFILnM79G8wF820wH03SdLmlTeivYuimf0Kg4/G8SMxWYC5ilNGY58pfLZIPHDqMmgyyTRQ9yZMoDfPcz+xKk5s92Tw3LHiNo+OKc9ouEoW7TxSJvvHzmTrQQNrR6YD0bmgcZUd4dOPd4A1wtz1VOo6cq9sS4x85MGXWUXyEAyh2BMMzH1cZrr9PK36F47ZsSM6kSha3JJupDgxgkTagQLIXgYQpuj5v5tYzb/VkzfG7V2b0KTjTSSI+JAbzmTeW9EFKZfrBsUAcY0RHVnThamBLICHwfWae0kiIDSMaBdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tDJndM5u3AHzBejelwMhn7JpfL4h6QqWYOmi9yC7Hg9yK77ScdTlI8LuElrA?=
 =?us-ascii?Q?xOTdRJQ5Hny5MC2F74Gt61EKsCFYvlOzbVlKJKKEgQfUMPD/goQKkZ54/s2E?=
 =?us-ascii?Q?tKnTccZGQJunlECM2IQe/M44yOd0ZbklIYhmpw4jMexJSiVzymiFnreAzPZb?=
 =?us-ascii?Q?61Tv5C0pK0qiQEW95be/ue4C8WtwSsNoPxCQzJGbf+YlDBOUKIFAexW4TTpV?=
 =?us-ascii?Q?MTVYBWKMl1eBZcfjYzzDmOQUm7mcdeNdKq8lGonODIqB4IGh6vcJAVhJck07?=
 =?us-ascii?Q?BFI4Tpw/EaryeyKeDDERLwCIrdzM12jV23YFVxUREnWaR5QiUkt0DloP2BUz?=
 =?us-ascii?Q?dQqVcput/S7fpOX7Iu5Tsk854f7EnMQOtVVs2idm9uxw0GkuXjVZaGRFbW3/?=
 =?us-ascii?Q?AMmtk5vpSDg+Zh9q0PyS2Htd0LAVg/KgpYc7yD10Vf8hzZ8ZQgTxeVog8X52?=
 =?us-ascii?Q?jzf6G8aqz7x5w+zQ+wY8QPiuB1ogcHonGr0sedshqbq7tcgkgWtINXnxLnN8?=
 =?us-ascii?Q?JfxJVbjwh4ZgcQ/Kvss5RbyMF/+IGl/vlUbThhNTnsEoVvggJcdo2FNin1AL?=
 =?us-ascii?Q?phOX3jYYZxd9eKDIk7er4HPi3h/q3BE3eBnz9ZaESnsTaEL35MIlteh4uaIz?=
 =?us-ascii?Q?0GyhkoZWo5nbiDNt6bV4mDwiIVgvSiykMhSB9RO7HdYE4AFfhGU8VyQf1a06?=
 =?us-ascii?Q?9vLaiIO6ZaKG5xjPtujpPgygNYeWu0sZD0W0BSn16GLw8EMxv8wuIit11g66?=
 =?us-ascii?Q?FujBHlu5Ew7NSFNaxiqBdDnnh2BKC4+xlES/wt0cnHKYwhtKPAJaEbEHOkqI?=
 =?us-ascii?Q?MUryumd+bii50QFMDS1hcmdbBzkSFVSgdjIV3ryJytOKMiNzXesNJnSbivFZ?=
 =?us-ascii?Q?DDsWNb8vm8oSb+t3WaaKwDRxPUUVteHfaCpaamTE3Mrr0FpqcvALocElGOUl?=
 =?us-ascii?Q?L/dp7KesXrRdT9ts3mtFD+bU/HyLaOfNfhqfa6Glt0P+Dpk/I0bRL5yO63vW?=
 =?us-ascii?Q?Rx65fTd3ARNj/VRpoEQhmsOfy5F7qvq4sbCN/rrA4tBQFfWsjsRvBkIXTqQG?=
 =?us-ascii?Q?orxsRSveKFL5Jr4pBunHDusy+E4CLnHOGGz+iPSxEKlfABXBySmwuBHd65xH?=
 =?us-ascii?Q?OWUbBNVn6xHko6HfpdrBwtwxq03+H7KCnx1og3P/RQgnwlkFmP/yy1l5w/Cf?=
 =?us-ascii?Q?9LFBgKzdC2UYHqTtcT1sq5emEunX/Cai3qqaDRX8pHVgeinMhDoCkySJMphO?=
 =?us-ascii?Q?bxjCI9ERZdHkz/9VfAvy5CwQw4Gm4O2nPOJlvymjrCwBKvkm8VH7Ss9i3uap?=
 =?us-ascii?Q?+5s7PMcFpuqdM2M+URt53OXqYRC9lJpYLuzwwmGorZHFdhkftAkD7HItzCAG?=
 =?us-ascii?Q?FGZxZukCDisWUniAdQK6yTGYqT/Hx1eSnF9KGO5c67jw3Jcjy7QD0CTGJTtD?=
 =?us-ascii?Q?n3cwkQe7Zs0GYCFW7oB87LBUX3lyimJVBtFlB2CdpVcARYMi/avowk8EIL8b?=
 =?us-ascii?Q?9pFTSk109GFCZ6zXorrx32Cy5YHzEvFnd16bnwpNzM53vOeGyXkg/76kGlDi?=
 =?us-ascii?Q?3Fod5tn3e9eW6rK+k6lEvh6KoIxdFP8sRXsDgromlmvTRDgp6HBgnzz1Ahfd?=
 =?us-ascii?Q?dEtj3k2c/hD1LDqSVgOYPm8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843e04c5-7845-418a-fcb0-08db032f14c0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:35.0977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Nmy8i1nfsaKFSCv6x6iPaiEdLOruqCvIrQvRA5FzsILUzF3MLeFYVBM5AiwGqb1wnuABZ5eb6Xkz7gtFJEpyJvFFNkMdUzx9P6KBd9Th6DXxA6FrrdmOed59AbdoadL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
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

