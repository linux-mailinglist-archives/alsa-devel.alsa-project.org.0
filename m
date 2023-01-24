Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397B678E17
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A3EE83;
	Tue, 24 Jan 2023 03:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A3EE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526500;
	bh=T0z3Mce7vgQU4ka0NDRhRgidtcpoOLLnFlssbGJ0FOQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sac2saov8X4bCUQnXp+y2LCn2SK3NUGTp6gSt3LaqfDnV5LFqwkC1gtKvz1tXKIOL
	 INVRUBP/+lDmoXDceIPugQVGgmBBtGCjtvcLGKGwH7RTF1FiNeaBytOl1RpwZR/JCQ
	 6jUkMk7nePkJBKAmYr4zQlKCZFYsLMJT9iVsjvJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B45EBF80533;
	Tue, 24 Jan 2023 03:14:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26B29F804D2; Tue, 24 Jan 2023 03:14:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 722A4F8027D;
 Tue, 24 Jan 2023 03:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 722A4F8027D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Okq0VfNs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENFPMkzFJNEIHDGt2MtOESPq2wh8pi2P1Z/jkQSkEZzDqTKlpNTojCvybH8BuybsPnHhzYXPAc2X3jnuAXxSe2zAjkg8bLAlzc5JZoXTjn4jCSLdWyjv8w/HdAFrPzVptinFT4yBEuSiBWDOb1tYrynv/1hM8n0ci9Wb51sHJoQTh3XCaaXA2O8oGEiWNu0QdOixjKpotwucHijvvgGtqpcaPfc8oFoLLc/LEtVkAJ4k4yokoBU1Svy2S5uf+j6jO0ljqqVqx11j2fO5+a5lUB6iFobcf0gIapl435CaVqJDXmTFHqxloyyu2O82MaeVgjvzitcdYGIioSeBJ1DWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQyYNmm2Pimn1dvbZEDcRO+KSwa6SXtya5LlOzGqfxY=;
 b=JzJ+kyZ4M2ARixIbrNHb/SJPqOSrZziTVksBife3zIGud0TTgQkLbPGNWQVAWMRbmY9sZZl4fGBfZ7vG/wPZDq7/CrrMP3wvtnxZDZhl2HH3r9EIQeG5smxIOvDvH8sGV0Fxu/rq0WdMt6QFzUhXAkRm4ZI9YyNcijySKDEUoINFUbuOMlnakopgEDhDvB4Gb+El5v4ibp5XbedGgPkxn/xAeh6sYSpm6o8ounYWIFP64EISuWrySDVtq31NfzwcXPNTZfrWIpU19ZsAPwN0Ag83XdmYYcp5gMNbyyYR/OlIgkL0bU+RCShkUoC6ma3b3JaG6bx8ihaX4jB3PoBZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQyYNmm2Pimn1dvbZEDcRO+KSwa6SXtya5LlOzGqfxY=;
 b=Okq0VfNsEZC6edL3OU/BN5A7kJnz7MPwZuIsvmnc86T1yu2m68WfchS6Bhhas2Vkn0HJ+P3/vNtd8idy6/7CBZb3XI6XOL8ug111SvEsHWk06HUPU2XuvO5pCfQTk2jiQpb54POXKMnO6qwj7RUteMeyTEOfiGBpETAcTO4GcOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11127.jpnprd01.prod.outlook.com (2603:1096:400:362::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:14:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:14:00 +0000
Message-ID: <87a628u1aw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 17/25] ASoC: sof: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:14:00 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11127:EE_
X-MS-Office365-Filtering-Correlation-Id: 1365185e-29b2-4311-bf2e-08dafdb0a807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+OwsXUDHva8Y/dQLzDFgMqj4hscbvxz2G7q5cLGCLYiI8vsTSfoNaeU3XI1ovuXo0nftO8hB5hN5vYPjuU4SR6EkL/yxNsl06jdXfOAli2IvnKP5pVh6v17Jvri6vok6XQ45mE40atSk9cW8/SQ6bhX6UVdnyLP1TGZoztARwAaYBtuYxWE7xCo5B+H0KddL/3XUzA2LNrXfd6Rgu2cwuPgNAP5FD0ThVkaJcjUfBFNna0SxG5Dqf9PsJhGjQVCvDABm36KVCi7DyWcQJvbXNJWlZ/zfTqbHEE83K5Rean+XPjGaDWu+v6YVk97UsyChBbBtfCCstsXeo7f5c1Ny4stn09rwgrjRz+QEtUfYftcwzGb8xnuhdXa0teCZbGoC3l5INSqct/RYDlic6xjk+Z4DZjic3lNmQqbc7Niw5tSKSdZgxP6gK0to82ieGibHcShVDARYVwoTdr8FpDBMt8M/AcSTZ5iBOUjdEdmC1LgIS+96Bmb6y8C8WdcYxHHEUbXFmHBU5gS2tdCWefFKHLs7l9FXJ5b7+bDmv89wGDzoFYlthPA8vuu6S/AK6Jt2jl+VVexunyTSQpe/5xdupbNhWLwlh6CmOwy7CX4nyuJC8kj9qxCYnTHuKCMOV2Z8PnvKr6BPeayTTTcPSoAzhZ9PWzNJQ0pMnK+phBGhPOJtOUDmx1/TjE3RHrit3ja1mdIvN+TziSvIU4C7vX0Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(8676002)(54906003)(316002)(86362001)(2906002)(36756003)(4326008)(5660300002)(66476007)(66946007)(66556008)(6916009)(41300700001)(478600001)(6506007)(83380400001)(6486002)(7416002)(8936002)(38350700002)(52116002)(6512007)(38100700002)(2616005)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ifemb1a3Z6FXEw4CO2SUVBs4Eyc33dZq+4venuIn+oJVOFXiZxDdb/CToBdF?=
 =?us-ascii?Q?2D4CR6Bwd3y9iAoDN015NCQENRcuBo4ZQgdAeq8P6Gy8F6iaaznQpptL7hlY?=
 =?us-ascii?Q?CzCsL4ttd7ZZuISQrbELd4yGIhpN3swQOsXe/PJ25f0vR4FgAMq8SgbwLIf0?=
 =?us-ascii?Q?zusaBK7fn/4VFcrbfY6cFaNqM92JB9hc4bdZWXNThwzyZjPVgXSI+AAuyFgS?=
 =?us-ascii?Q?L+PSB9kY5SdQKa1WrNPBw/XOBrVjMnxSMjrIsBCsDA7mqKbSyxOZmXq7jVqz?=
 =?us-ascii?Q?jT35/MR1Llsu+PU2lfXO54re8bu280/7YQtpBXOdCQMSQmGLSxe1WUCZyszy?=
 =?us-ascii?Q?iRNiH13Bsg9V1z3v8WIwtpRVStK2MVmGbhN75z7UMZ6kT6Gb7c9zU8XdQMM1?=
 =?us-ascii?Q?c7gPeZPW5g2EeZsmSFOPpWG3f6k4+3Sxx7Yrbo4kjzx3JTZlAOWwupFXuXD2?=
 =?us-ascii?Q?Z/m6OaVLG5WJB9ZcgQmGIiuAW4zyIvWnew5+Dy3WLOkgMpbsjPSSTskay2ek?=
 =?us-ascii?Q?ecPNPt3U+K7DKQQcpZKbN5K+l4S92h67JUHOYsEtGhWmW/Hbb0ImXFWLVZy3?=
 =?us-ascii?Q?+NUd9xqLQ2UI+eMp0t33zG6EW2vm1UY2Y+WKb7hP5rmVUazRBZ35cxX2kaZT?=
 =?us-ascii?Q?/rGytVBBYUPUslh7y2fu9KBMOr4Vb5iGDyITsOqMYMTCPCp510uyj4dw0xfN?=
 =?us-ascii?Q?c3mvTjxUsv9Eh0OEhL5l89iuDJcz8VDAkCqT/XkpMOpO/iragP9Z2l28PSjG?=
 =?us-ascii?Q?wr5lyKfo3XTeQvYUFlzrmdvORHPBhQii3E4jvSr6COzn6NyxNB9r0PiwXUbW?=
 =?us-ascii?Q?B+z1abBc9bCTguSa+9R55rIQQLlIM49GFPqNzt9qWffD0d4c0GT5gJrK4dFV?=
 =?us-ascii?Q?lj3FWAy+4vPfD0RNviPcfIFx4Bi7Hvz75mstYLDtWvyXYDtGwzDYoD9SIFpZ?=
 =?us-ascii?Q?SQ7goSmP7OZ9DWKL+hNH/IxDfaYDvpD6wwsWIN/Z3eoYWc++RRKSvBTGv6bQ?=
 =?us-ascii?Q?XE/1DzuUeTcmSIBUzFKi+EZT51oh7g1MAkIRXOx5eo1NjSSrKFw7tjQVEkNd?=
 =?us-ascii?Q?/EHnDVgwqGG/w5lS6Y6PZaRI7vv/csp1hLkCc85vBJRblYOXViIyyyEAQKj0?=
 =?us-ascii?Q?fTOyVB1M0o+kz55m7cxKHcnjPc5DA/Ok4eWEWEFqu7C5Z0ShHR4NW3D6zsL3?=
 =?us-ascii?Q?oFGO2fAPsmx6Dq2e5X1iHby3sGmD9rGK7YSmEqfGg8eO6uOQvHXePD0b7IEc?=
 =?us-ascii?Q?SkC/8vCnJX4kBgUQi7+bTZ6qgNCJoT9AAOeNQ4x51giVxif+LtMzPdaOHZSN?=
 =?us-ascii?Q?m+amHeZ9WMmfv4qKd5WSYPUvnR72iP6O8YkXDwdppXHXUifaRtTX/qVvov3N?=
 =?us-ascii?Q?yjtus5dBHVMrT4r9YBdXK4jAfbrhCENWbDHSZdmncrKbpZshLMzNxFaOd2P+?=
 =?us-ascii?Q?oS/G65rwJ7186xz2Q398CbeMiVl+3R+jEqxkx7N5bO9QgKZfLqCDyPmGOThE?=
 =?us-ascii?Q?VJodUecfV/vpX53nTifKZuqotwQAzJYieAlmtLbnmQdvgn+LHIB6j07+dYU6?=
 =?us-ascii?Q?DURmP6MkOBUjuUgtwyMYrPfxNkr1pUtKC4WJd3fBcEIxjTtOr73l0gUDDMvL?=
 =?us-ascii?Q?7t5Ci9V5xj6kJ6inDnLvt8c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1365185e-29b2-4311-bf2e-08dafdb0a807
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:14:00.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DvkQRgyfrAeL/qjtlKaYY5rusVpkjY4vXStR4XOvESADGZjAAKaKCLPwWuiHUzvgZTws2ywg9+ub8fos5vPWY28hzi9+a09sU8dPN5XmsPLvQMOqw8FEE5nO4JOUPwx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11127
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/topology.c | 104 ++++++++++++++-------------------------
 1 file changed, 38 insertions(+), 66 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 560771ba8fb9..e9a2d4a240b3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1055,6 +1055,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *cpu_dai;
+	int stream;
 	int i;
 
 	if (!w->sname) {
@@ -1062,62 +1063,41 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 		return -EINVAL;
 	}
 
+	if (w->id == snd_soc_dapm_dai_out)
+		stream = SNDRV_PCM_STREAM_CAPTURE;
+	if (w->id == snd_soc_dapm_dai_in)
+		stream = SNDRV_PCM_STREAM_PLAYBACK;
+	else
+		goto end;
+
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
 		    strcmp(w->sname, rtd->dai_link->stream_name))
 			continue;
 
-		switch (w->id) {
-		case snd_soc_dapm_dai_out:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				/*
-				 * Please create DAI widget in the right order
-				 * to ensure BE will connect to the right DAI
-				 * widget.
-				 */
-				if (!cpu_dai->capture_widget) {
-					cpu_dai->capture_widget = w;
-					break;
-				}
-			}
-			if (i == rtd->dai_link->num_cpus) {
-				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
-					w->name);
-
-				return -EINVAL;
-			}
-			dai->name = rtd->dai_link->name;
-			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
-				w->name, rtd->dai_link->name);
-			break;
-		case snd_soc_dapm_dai_in:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				/*
-				 * Please create DAI widget in the right order
-				 * to ensure BE will connect to the right DAI
-				 * widget.
-				 */
-				if (!cpu_dai->playback_widget) {
-					cpu_dai->playback_widget = w;
-					break;
-				}
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+			/*
+			 * Please create DAI widget in the right order
+			 * to ensure BE will connect to the right DAI
+			 * widget.
+			 */
+			if (!snd_soc_dai_get_widget(cpu_dai, stream)) {
+				snd_soc_dai_set_widget(cpu_dai, stream, w);
+				break;
 			}
-			if (i == rtd->dai_link->num_cpus) {
-				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
-					w->name);
+		}
+		if (i == rtd->dai_link->num_cpus) {
+			dev_err(scomp->dev, "error: can't find BE for DAI %s\n", w->name);
 
-				return -EINVAL;
-			}
-			dai->name = rtd->dai_link->name;
-			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
-				w->name, rtd->dai_link->name);
-			break;
-		default:
-			break;
+			return -EINVAL;
 		}
-	}
 
+		dai->name = rtd->dai_link->name;
+		dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
+			w->name, rtd->dai_link->name);
+	}
+end:
 	/* check we have a connection */
 	if (!dai->name) {
 		dev_err(scomp->dev, "error: can't connect DAI %s stream %s\n",
@@ -1134,37 +1114,29 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *cpu_dai;
-	int i;
+	int i, stream;
 
 	if (!w->sname)
 		return;
 
+	if (w->id == snd_soc_dapm_dai_out)
+		stream = SNDRV_PCM_STREAM_CAPTURE;
+	else if (w->id == snd_soc_dapm_dai_in)
+		stream = SNDRV_PCM_STREAM_PLAYBACK;
+	else
+		return;
+
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
 		    strcmp(w->sname, rtd->dai_link->stream_name))
 			continue;
 
-		switch (w->id) {
-		case snd_soc_dapm_dai_out:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (cpu_dai->capture_widget == w) {
-					cpu_dai->capture_widget = NULL;
-					break;
-				}
-			}
-			break;
-		case snd_soc_dapm_dai_in:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (cpu_dai->playback_widget == w) {
-					cpu_dai->playback_widget = NULL;
-					break;
-				}
+		for_each_rtd_cpu_dais(rtd, i, cpu_dai)
+			if (snd_soc_dai_get_widget(cpu_dai, stream) == w) {
+				snd_soc_dai_set_widget(cpu_dai, stream, NULL);
+				break;
 			}
-			break;
-		default:
-			break;
-		}
 	}
 }
 
-- 
2.25.1

