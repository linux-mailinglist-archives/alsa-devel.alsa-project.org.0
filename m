Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DC7AE5FA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A03B151C;
	Tue, 26 Sep 2023 08:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A03B151C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710005;
	bh=DIr0zRppt6DiUiznCuK6MGZKGQFmudWRIaMdCuhcM8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=esXAOYWqp3mX4KZEYfxupWtGTzmfm39aqaQjLcghB4Xa90zqhozUXuS2AzHyUDdrG
	 4QL6/foYllXF/Kpy43JvUR89igWFY4LjlzYRMKOdRFUxcY9n6k6STEsxVjo4elcTHC
	 ikt9jCrUI6UpjsYT6zZHgEXd3cHbzGeU1LSKhAJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 059E1F806E9; Tue, 26 Sep 2023 08:26:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 769C7F80558;
	Tue, 26 Sep 2023 08:26:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D669F806E5; Tue, 26 Sep 2023 08:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A4AAF806E1
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A4AAF806E1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VfMfgGjy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuSQRJl5R9DPS6DFPHrT9h6Hl8wD4ECBHKx6gclIHdsDIR0oYM0CELq5std4FKoSsGtD6T0uPukEpb3Hz00R8A6ycMYv/7fXGPZeV8KcTUvTazdiUMmH+kuEGC7R87icdN9krEZEcVN3JzDvJcKSNLarggzN0bZZo8s+He0JWUljxbIbGznrcKGl8nlAo8De3o+KtZmfvtDHVWTpR4V2e8R8sZfwOZ6ULlVSkpOaS/PQ59khrVxOrzYZTVOOsTOrJftXLW18CmfTu0vhGBRM8K68uJ/Vmg9Ig8/ZdwtmVHjoxWhabSK1l2+TznlSHKhffwm5cvWnodG3w+aJgWTSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2J2FATrIGzY7BjbMhJQ1zVoO4L74ha+JUZmyLQV5Ssk=;
 b=LCtG0dBMFLZEWVLbM0MuDaMQDb3wrvJoTvAZkkaJi5zrl+++/Ttno/c2yuBRRhMbCz8owSW4EVFv6k6armsEd325sUtG/FALhjlT+UjLA7LqYKu07RwqA+LRweApL6ilCUM6k0Ewdok2VRmUtcHrRLJFbyWihd7pNBSg8CifZlVGol+YH63Cf8udyHxTfqK2MpljNf+XVpkWH5S2lWW/V2Ktqv0BYr3tx7SqOmmaxNR23GSM+5nipHhtsTIAjutXGWJV1nWMhp6XPbv5JVNTY+DPTVBRKkTlhpDslGYQYig2Ewwx+ppnHHLVhfT5cc6pTGJCZyZouSCytoRpR494Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J2FATrIGzY7BjbMhJQ1zVoO4L74ha+JUZmyLQV5Ssk=;
 b=VfMfgGjyobou5IQ9ZRtpFvJ/dtP3DfAKd+/8qVsJHtfxq3IElKuSKe3Dsv8GfG1VMcDh6VnhlMczrVw5V/dsJrKp4Tjy9NZAOdRbJhVJlH/PwouR97GQ9OxoUaO2+buWVjT6I3Q0ufsy9nOzRrddstNpoXMeTnYxuz48GZrnIpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:25:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:25:53 +0000
Message-ID: <87o7hpfo28.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 43/54] ASoC: sof: mediatek: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:25:52 +0000
X-ClientProxiedBy: TY1PR01CA0198.jpnprd01.prod.outlook.com (2603:1096:403::28)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 8463690a-498e-4c27-4992-08dbbe596f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p3VfFcER6BQTD0vE75dZ4iJjbIbHjDe8cywobMVjHoApO/pSQ906plVsc6XM28vw7FYA+9xgd/g8bur5sQu45IxmOvjqry/9/WAM0PCTkaSWRYsWpDzGC8LozU1vJACDEQ1Vq03fSYrTm7Vb9FlvN2Thi3RnkPgiD6TIw6YkylxpuAWW8t9bGcrsD3/9J8rlFtR1EyD5rmS2d9gzcUf/OC1bVSPP2FRqYKE89FKEFYTsS1AsCvvydsWINd+Fk0TkoVTfff2aACMFLJG7gibZa385GvRMJVTochpaRLaZAbXA3Dv5RKHBt/ZzNJzn/9+EyHxH5w9tpMTttoOuuewuVnJpS/y/3KcE3yJIq2I1t6RrzYFvtkQTRVpioCUROxBoKn7XUwqzJbTTaSW9aKOF13uIQ7Xxktearyc6cCZNRUPqWGDlc4GG+KG5e8NljUV+grkqxYqz9uP1NGIz8gdfUe0dxtJYM/Gl0+O6aflMMF1hZWPmvAgvBA5NDLAPpsCJ5prHl8ELKQNZ1CSEcDdl/G6f6WFLLdWv2TGjZ1fhFHvUNRaw5/r1iSip/XaPyoSsQphIJQh5x97RRlN93O8V7zCVuztAU1hfZhQvwgwmE0z908SLnMDdV5qEIVq2zqk9GOyyMSesC+0voO09OK66Qu0fwLp9DBjTVzonwrCdl4k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(7416002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(921005)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V437DiZnBJLuitFME+E7kewhj8+/NWEN6PVT2aRHPr1ycNY3PeS3xvitbnBC?=
 =?us-ascii?Q?GScjwOTDFHxnjcTMlv5aEw3pOXLETkYTQo6u0/4m/hcm/Damsn7ABcCkDdWn?=
 =?us-ascii?Q?mQsZ+TPusOlxvhoO3Tx7XP4Q69mtW3ibw6uMuyg1H83ja73u7ZssbGHIdTOC?=
 =?us-ascii?Q?/NS+4V/xnmgqeUQ2DSI0YyBcGDCcaS4umyYTDtOrPPVylrkagb8jvvPXEzcj?=
 =?us-ascii?Q?zv10yokTz0Y+pClWGNyn3wXDps63EnrUDlksvzYmJUL28k2NGbIVyYbkNg3d?=
 =?us-ascii?Q?ZN7d1qHz33DFI0v4NYTBSnyGUiNAJhM8f4vaTU9e3CD6PCCRU4QVRHXtVto4?=
 =?us-ascii?Q?ACSdSQuF+oxJb3Q2FR8PcKFP6A6l7HsXsoUpYYLM74InFv6N0x0SZ6gLKnbk?=
 =?us-ascii?Q?GIqXEP8Y7HfJkrd+Fs7z0FyXNYZhkBUnQ47vTdxEUDexJGz7M+h+vo5ZLXkO?=
 =?us-ascii?Q?dxGQPcFDdqns6NDkAfxhU7l8L68Od2paVvB0GR4Bc5mgwjsCf5K31609XOt4?=
 =?us-ascii?Q?T/LWm3e/rMCnfGFTryyFd/D2tnWrPZRZASd83KAxQX1zLiKO1z5Q/cgJjLgU?=
 =?us-ascii?Q?a+PIhRb5/4yMHSwxAolNEYT34XzlEaos0K0kk/GzFaphSh4ickiB+TGco946?=
 =?us-ascii?Q?RGCTB+b8yiPBPMhnyc3G22erVPaNsANsp9q6y4+O3Hh2Lo9q3DBNuYQu9q2L?=
 =?us-ascii?Q?ueZ8G4z3+bPsjNzgr3CZ7KcUn7X4WF5jfgf9B98A6W6YzUYhIbgJBZlIHzs2?=
 =?us-ascii?Q?dfs/fTPxMIBkOAUzYILD6taG07gN+5+MkOwN8rEPfvUSjnqCcD7UWCS64EXX?=
 =?us-ascii?Q?YJSFtRegnFrHDudr/JihhCQmVtm8VI/kSIJ8yyhJ1tlr2PYNnSHBCif5guzo?=
 =?us-ascii?Q?Q/JuVMsXPoI90B+GOCqCdo2iaypqWDqKY0eynMdZisBD6qmHbqH9SOnCJfq1?=
 =?us-ascii?Q?UU3TV/v6ce1sxncvsH+m5ukk03/OynpYUwaOVeNG69+gvAbbYhBTDuOdu5eX?=
 =?us-ascii?Q?ItqCxOCN1YTKUKBiBd/fctJJJCb/VbxzWg8pakHgqIhdp4jmaDl81xFYt7QS?=
 =?us-ascii?Q?ZNEg34mdK9uucsAac2Djwj2RPG1aIeh9aWtwWvVCgRz9VztSqvgu2aVJvIIW?=
 =?us-ascii?Q?+N6F5WV5alUOHF7CuQcb/hcyf+Vlzxr33XPDA7FSNxFMadzXza71Rv1JvOCy?=
 =?us-ascii?Q?vD7xy84/o+9QU1AkDrj6X0mA1vYVpF0rjY21m9lLF536HCSJmX0v0AE1VVu1?=
 =?us-ascii?Q?vRFXPQjjFKbXuXgHpbfZxReLIO0XiQMLp7XzUvF++1rw0gAfQ8Ug/tjRCMIV?=
 =?us-ascii?Q?8+wjaBqTidyxbskff1/P0RJWOEAUB/qf/wavegEJNB9UaOCSMqsqmTWqoXxq?=
 =?us-ascii?Q?nt6moTWmJDZhw7AYOT5q0727Yk9PyfZNLQn3Gm+cCeCUUU7Dr94CbIuZ2g9n?=
 =?us-ascii?Q?PI0htdo76J0bladx+p4AaOaG4hy3tz1SuVxC9KF4bp/Q8yC1nAuwZCB83Vrb?=
 =?us-ascii?Q?MzkPeEqbEOq7dI97J1FwvzZFr//Wb9lFA/qp7XkFAjuzzTu33Y34mFReduPb?=
 =?us-ascii?Q?6LlPVh7Ys3c3ElUMwIqHNi7YcS7L7ph1bYAKr/bxEViwMtEQfC2vvEHYUcYf?=
 =?us-ascii?Q?bvrFs8KKiS9WVuPEVqfvH9E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8463690a-498e-4c27-4992-08dbbe596f59
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:25:53.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 65ibpgQguuky5aSHo6R1MwJaeNQF75wHk0ofHuRPCRDPwdGswi2/5TQfvKUvlR6nI9swrpbWle5yBJazuCOxfJIqDzkvXIEC8a0U+8IbGmwKIBpvqZNvYoWARFe6yW+N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: JNMVE3VULKO24CIRHQBXMHJ4AQX32IGV
X-Message-ID-Hash: JNMVE3VULKO24CIRHQBXMHJ4AQX32IGV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNMVE3VULKO24CIRHQBXMHJ4AQX32IGV/>
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
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 8544d65bc2cf..811081d9a05c 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -457,7 +457,7 @@ static snd_pcm_uframes_t mt8186_pcm_pointer(struct snd_sof_dev *sdev,
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm_stream *stream;
 	struct snd_soc_component *scomp = sdev->component;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	spcm = snd_sof_find_spcm_dai(scomp, rtd);
 	if (!spcm) {
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index fab2d5af8610..21d4434dd729 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -476,7 +476,7 @@ static snd_pcm_uframes_t mt8195_pcm_pointer(struct snd_sof_dev *sdev,
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm_stream *stream;
 	struct snd_soc_component *scomp = sdev->component;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	spcm = snd_sof_find_spcm_dai(scomp, rtd);
 	if (!spcm) {
-- 
2.25.1

