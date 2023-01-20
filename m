Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C0674DCC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:08:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000BA2E28;
	Fri, 20 Jan 2023 08:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000BA2E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198515;
	bh=WqNCTczcnC3RGIz70NfxDaqMb5NNciDpdyGvHbSsB9I=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P8BgkGlQJHIXpDvyn4nJLMaPVq9uPJu/J4snd9HCjMIcOEAm54kwkTBQsWc3OOj8H
	 swvpwKBHO3WM/dUg7Pkng647EnzOWHaSzmKPSAstYHHPKlkUUSkk2bttvbVbc6F6Jp
	 z8M5q4h+K+LXoKhUN+j3y3bi/QErseO5KrokCZns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CEBF8055B;
	Fri, 20 Jan 2023 08:04:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4145CF8057A; Fri, 20 Jan 2023 08:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE9FBF8055A
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9FBF8055A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FX6qbiOK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJaoXmewdgGBn/kkj8/Mz5ar4qBGRN1C+Qx1UkCvS4BZQYQllUODdDxw9hhwM7+eNlrYgBBrbvYuvewpTRo+i7a01oDxNS9ruPbwFMI9zYuUuga9gNGlSC0ZkUUebLFV5RH1g1KrecMAHfa/kBKKSauxra7mGa96pJ5OP+2YB6dAcHJyiuHfj/p0lnE17raYjPFTHziejY/pCJLZbX/XhYpHGTg0JAzSURedVD7bcmuI61WM6oMdB7nMRW7uJxZ0e3duLXci6FYH+/q/QH7hgyCpwK/UVDOI6oS9y1pm3DA5ae0L7Nu2pZizRqrwb/4cXqERADQDzH9T0rNDnGW64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAsFmWhDm3C44AnR+H36Xd5wIYOgOfk1i7aNO1iGcvk=;
 b=gzu1tSNBUvgKc+QUSTb2Q9gmSr2xf26QU3x9w2Kkhju9tbtEIeEHbDQFtPoPf7Qe3tdyyuzQ1jV0MQF0/0flpsM0g+hku9HtIeHok3hN72st/6+NNecBSbLW6PNzy4TVw9Pn0urYLkx4TP8nTW6tbH0YVJgCSTxbCFvAza/xtkcFKz85YYhBurGmXDPh4CYEpM7ezWGPjPEcZv+wGUGq1hmQtHvFTlSGhXozfjlCnKKne5SBjsHqNcY76eUNUmf2/q+Wk9jtiW2xr4sMb56NJH4RzOSVawk2j1qzZIgyCNcEVwXeRveSGzxjSxDkYXDWGe9lyz9jMfcDGQwFqiIqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAsFmWhDm3C44AnR+H36Xd5wIYOgOfk1i7aNO1iGcvk=;
 b=FX6qbiOKRo+jNRWHKLbAvKn1qZBXUjnPgydY+S9VF+ty2P7/y0sPwUBM14dq+DWJDhkXVDfVveZMAOBO22ks15vAPFp2jiLnjMeu7OzqW0Vm/NK1TAldgnWNpzfIuLG83gSl9yPqha85WLTVldMUraGuaUsrD3MieupEwjodKwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5825.jpnprd01.prod.outlook.com (2603:1096:604:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:03:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:52 +0000
Message-ID: <87fsc5k7qg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 21/25] ASoC: soc-dapm.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:51 +0000
X-ClientProxiedBy: TYCP301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 445eb3c8-5e09-4e8a-6e88-08dafab47cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCyOtYvGnXlypQCR/f+PX5foeKniSfXOLay/Yf99XkRRqJjzqoNRpawK8CVCxYtV7COo2ZK9dABxTSfZ0JwX1RwRS4NvTKpphRSboEHCFcSsgtjkfc4zRppvvc7Cb/IJGUQtv8SHgRcsxJnW/19D3V3N/UvELz7j3aOM8N+VacUgYmQfIsdYILftQXk0CXSWRillzyvtv+0Rs5n6c0fh+XS4hWY6vpymsgOxuVoKmulJmQLrzyCxVD94sf3nJ4mUp1KjLo6CylCHuxLKNCD5eirArX/EJb6bXp5+Vo1rE35ssUQsbncDrBUt75c5fm6EagPY+f2hNXCcv2BetM8VDs6W9GAf7gVm8csGMu6MpxaJBezlskVe2hOQIB4EWAeSVCOAD6tCfvoTRicDxj8TD95pyfvlxKOZg/hGQhi8BNSlhkR+umOlWqeP9oDd8HgOLS9+hwAMsBYQx9gJgvm2kzk61Gh6QIXLl0xvc93R1o6lQKcywAIaM/f37/VsITbuNxnZFweJNtRc6Qp/RVGFjnpL5/UNLM8ltoBazsa98teUa2aQz/HTpX3BhIHKnKpEL9/zrVqG5LQ6nLcVd1jfwH12bCcqJZlHyo5RNBg1jIQI7HexgbllSQDMvJkAdN2vOVoQ6M2nBOUl9N1U6X5suQPYFCgoF5E3iUWRJJBmk/IQJhxG5NfUYwoJcUkXI+xx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(2616005)(36756003)(41300700001)(7416002)(5660300002)(8936002)(316002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(26005)(186003)(6512007)(38350700002)(38100700002)(86362001)(2906002)(83380400001)(478600001)(6506007)(54906003)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0n7trYbQdOp4bq0rsci5tTkz2ZCGLwNiultKW1gDeyTuxpfZY2UD8YwJ2VXc?=
 =?us-ascii?Q?T1aXN9CwMaCkY5JJitHrkwZj4k2vtBU2pVgik1YgcxfwkIv8h/DMCGcbREpP?=
 =?us-ascii?Q?qd+CDOhaaPlpAJf6EpBBaMIcb+tva3yA/MJWXLwKciypJCRU/opJkWGlXF1x?=
 =?us-ascii?Q?n2AjdhMic1+sAzFjkZUa2iUyKYFER+CdioLVR12AFy7fO/n/R2HYEj3TSQkV?=
 =?us-ascii?Q?eVU/qQRM1wK0IVVWkB4BFxQ/C962iNhSr+W92VSHXt6mJ/8y3mpxshBUDXEy?=
 =?us-ascii?Q?x5sXtkB0XVFtlBK6H0mscT15KSsZMiv8h4lOU7Tzc4KjKZ4OrvDfGS0vrvHT?=
 =?us-ascii?Q?oN1PFlfZrChgnq5YODpCi7iJff288B9ldtIP7GnTIYDk9YvRdSJ2MgfmFEM/?=
 =?us-ascii?Q?12IFtmydy21S3oBt0XesjONbcW8Hc52Ghu6oBBhfMelMAo9uqNLzj9y97fq/?=
 =?us-ascii?Q?+pg6Ywd2x6rca079me77ZU51RmwzS6N0awdVPfX6ZGMFyoc0JIigQuEXd/lT?=
 =?us-ascii?Q?q4vN5S8HQIvHuVBJz2bc29Wi2qKatEyH8kJ80Aga4uQHoHaQ8gsueUYAYprU?=
 =?us-ascii?Q?ILUbwa/d2sVzVhFJlyZPE8TPxAQLpTJ1Q4yZrN6Wjs45ccQeoJwkdFuc2CMW?=
 =?us-ascii?Q?AV8q14K4MOj0oDgQORXlMm0mT5shNXjyXmGe8yfNig1R/UlV5oVApyN8nsML?=
 =?us-ascii?Q?YcffQe85g6LEIRppV+gpgCxwPrxHHeTTRFLoTxh02dUN3igZRoHDzde3wsZh?=
 =?us-ascii?Q?SW7oEjtyyvVgVtCy1oa3u7UvWEvZW9+tyZxCuT+JkO8g7hWYjXQ6TYTgr9TE?=
 =?us-ascii?Q?WygGKTt2UT5rNR0jV/6MyLBK4eUW5f9DAudMDZr3YwqZoQyUMZc0uvGlZj7a?=
 =?us-ascii?Q?Cgl71FO+EaylK4vSxHbMb2nzdqXSYYjFhJwlXQdg8DUxYBYt2Pjo+7QgdYAj?=
 =?us-ascii?Q?1jTH932XdYdADmvpLQPwIDnaOanWu5qK6eQkHAnrKadNGKvb1wCBeMRphv+6?=
 =?us-ascii?Q?SNU5THEyfbMUoZGUbjmSwJoVOwrGNdKfg2uThA044Pph8ZvVW1kvmfUwmay8?=
 =?us-ascii?Q?eIO7eGnGCa4DyGKIPPLBnMGkGBrvRToGMJ4E6ZXmYr47yzZY9kKPhGiXK3YA?=
 =?us-ascii?Q?M+EjFXoxFAbms1P85P76b1lXFcCRf3pPDWM2e6VWHf7p0PiDxgSg3KHxe48W?=
 =?us-ascii?Q?wqC2pzH0ndKBdQqzgbQH05OJQkI/nOv+oAguOOJvGj+U+1IPZy2Y3elT/5ca?=
 =?us-ascii?Q?Q/fIB7urz+YzDqKaadO1PcEASsgJ8ZzCopUyKm3d7E7LIZLM4U65hP+T42km?=
 =?us-ascii?Q?eJbrZ6Muz8/AEsbiGb65RsTiTzxsHK5Ea13rOyfXhH1+53FJbXEtxNIqjaYq?=
 =?us-ascii?Q?THk8uiLnmZqPMjh1Gr4SICs5HPE9X01+M/Of8ZF+WZqcWnZKy2ktHcaf0Dat?=
 =?us-ascii?Q?I7wS2vU8WYhP3oiUiHYNwC/coRfcnVUj02fZCJsKeMDzqNfEoCrH5dlL4QgT?=
 =?us-ascii?Q?LIUkz+YfRvMv063I/2DPubJcAf8+8KT9GemH2rMzHgPT/vRVDSKn5VAqICCj?=
 =?us-ascii?Q?sPV4yqrMIflOvd6ZBvIHMinlFAgF3y/Hmgd9aWGVSBwBi3tbYRdaptHaP/e0?=
 =?us-ascii?Q?vCeby8J0u7KYjDia/VoQXgc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445eb3c8-5e09-4e8a-6e88-08dafab47cca
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:52.2294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIdpPBSnsaCmevFMFF+65CrrjGgs3IeMKIdqHijURZ54uthVhDD4I7nNJ+FJu+o1L7zc0F2D6IegpYxjlgRkPnLjtO9in5Ht3HuTD0ZT5Be3cZfU8Bn7fzwzsws/b7FS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5825
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

