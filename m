Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3579B3D9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35A9ED4;
	Tue, 12 Sep 2023 02:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35A9ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476855;
	bh=5yoWt26/yCpO5uGQI282aNfXHfoRMVrvpLLkhc/Mb+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SB2uB8aNxTxSXmOs6IQ0plLbAYthTVv1zPnq/3keZxRo4C8FG9ZCMlf+a0opaXBZe
	 LUMY0cGzl8z/SPUo/jJq1h+oZNe4U/g1DYkzgQDXtJN7mJVgHYRF3FjqPpBexgr9YM
	 7kFfuNa/F1LOPZy8bC1smnrpJ3rrOyvKBi+L76ME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 222F8F8060F; Tue, 12 Sep 2023 01:53:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 273D5F8058C;
	Tue, 12 Sep 2023 01:53:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD915F805D6; Tue, 12 Sep 2023 01:53:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E736F80537
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E736F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bisAeMUP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbFTwp/BhbagyLxq7tHaLnyjv0TwH1G8hjI33l7p+UHxzlti7KcuIdu0Dg6mIV2+m1CHE8l/zNMqWLykjbf4bHQcA9bEhtVXyfnK2kPXCkJFm8N7GtUMEa/JhtO8wfZHwKpAINsXBn4MGgcO+S7HJFokS3Iv4qIESsfYGi4aXHhSu4n6I+pAiTlaqSdUXSSCG5jqMeLCDa2mubzx/MbsBWKr3y44HULNJXuGK894ffxBLhPj6w5YmlwG7R+ZCvk/xD+43IW9XfOsVSvI4RkjiWdIfqKjkSP6LFg0BY1mt1xJWClaoCh4q+06cB4YcHzDyJeRrKkm9Yh8Az0kqxrJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L30m1KYgg8PPMEvLE66iG+pWaL/K7NDhfByIOFrGmIU=;
 b=boNvkBKxF3NqRofu+7+4z2KZzfaiOJLu6Vwa7koBgsye0eOCqQkf4n+y5LEuZGZQWhBgdoIAx/9CPHnliZ/ggHFhR41A69u4w+Z8rdJX4XQVtze729cJX1nBr8COK9TOtvFcrEl09fdLYg31Bv5a7kUxucCFI1X9A8P1krdA6Z3W597tVmTEDL2/Iy+DunVkyJj3DeDBy45B40rr9Glzo8mhIx6YLyg7WVwDqx4MslMYZTexAwuHfvupw+RQ1OO4LLS0Fd02DViRAQzU++WkyhXRL4UP+z/Qdf5e86P4fC8gH8nSfaQBjb/ReDCPmqn/pgvqPx9Nfvd+Py/4v2DPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L30m1KYgg8PPMEvLE66iG+pWaL/K7NDhfByIOFrGmIU=;
 b=bisAeMUPdnHfkqNJ3AcPhR6e5gZ7HmnfGpbzyvKThIaxuAtt3hm/BzqYQcPyMTCjhPZQs/ml2/38U+wCqxSKSPpO+wWteXgnqsKvm7QeTKwVPy41bZY1hOf/xnRUc71ziKDgDEx1DEp4K9q+HGQ+7UDLDmlUtDg3FIRE32WTDkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:42 +0000
Message-ID: <87o7i8p8tu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 45/54] ASoC: soc-pcm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:41 +0000
X-ClientProxiedBy: TYAPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf4b0fa-b0a2-489b-9243-08dbb3220c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p6VJUpxUlJKMX6XmmHbBIWwrp1in/lJeBqyIFifvT5LH079r6CPs1E1yHS+w9uhPMAKGOJKjRsJtAudJSfiK/2WRaROLhyR/kZF2bg+8RySP8gYdFcztwvinTWIrMG/rVf9JuIoftKQIUDH4waLtXDev392bTsA2kReGU6Db2n4CHNucn93dCw9cbAlXMuIrXtBOf1K6qdKz5m1XyaRzmM7Lkxv0UkMEm8Pfk3aOYdzeXntz0/ro9hCb7QNcedsVoNaNr1aSmcjAnjLcp+73GKJCy5lKaPZQ31lQ9KpeMY0e99vz0OtjmRm10vQlcjmf49g5yTajhAeBPDuj4hcGGDTAKgEK9DVLW53NFuHxuMdZ60S9ayl3+viVXEsKuUJ8bhGhBFVEWaTlhA9hT417Tx1rDvSVmyKnYycvr554notQwhuVKD2XWej9PCPz0jiRwYVVrfINq365Vpy9coCiBBS3sA7b/ulSIP2Ayn9mgBcGggpS/q9kMcGsgnvS8+DDehtfSc0Jk6Zd5ESZma1bF1SSVv9OuMwar+qwTFTpLE1nqhxP32i4QkrWl3txY9K/XYhSl+1ZwVMJZIzJ9++Q+AylOhesfAUjJX0uF03jneawdcut+wEsjeIN6srqFPutzVYqMnayI2XELVVy9uf/MQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(30864003)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G0nlBeKQPmJ9KZvQo+kn756+hryyNyfvQyU47717uQUhqOXn06YpMwKhNxL6?=
 =?us-ascii?Q?LOXma+yCsgRpZDsw9SFx1KyWcPPeafRav5Un69b47Uc0jTGdRi2jaRInjsmK?=
 =?us-ascii?Q?ogucc+cuWh2Tv4W/mWJjK0Mc9zQMiNDE+33Zp9O81belMXc0cOdn7OHGMlgQ?=
 =?us-ascii?Q?C8zV+PUsPLfGUHNitlQJl2xykPzUvtcpXLsJwEMTLzd5IY8p6dpBjbfmssMo?=
 =?us-ascii?Q?NOltdp0uN3bYiFLPVe2dXwgULbYodWj7bG++fRur1vUSfjRbDQIRwJVdCbom?=
 =?us-ascii?Q?w2p6CfHHCm4aWHZ5OxTXUBOjsp7GRNG7XpDrvCowwCmJzrkUmBwUfAg14doW?=
 =?us-ascii?Q?Xuq8Aa2KbLivWzW6TJxHogL9s7OaO47Qp2NUHIVqq5cztZyb8VJg6VHfRYU9?=
 =?us-ascii?Q?CFsVQWDp4bUMLn5o1AdKYYmqN76EZaeB9huwQNG+5vTZgbFpW9zvM1oNZN6C?=
 =?us-ascii?Q?s17TuaIWti6Q0JsbjbQ6Oc3JlwwaX8YkRirgmtmwRxcbyAt3gVFxzmES8IAq?=
 =?us-ascii?Q?MG/LOy/jKOvh2wVQvMJbaEU61/q83/jQ7a7CybqyNW++tPjBaHV69w3NE8lY?=
 =?us-ascii?Q?XxLO04CqPI4K2ItRem4RUdQ79pUDTyTWwpQDbIguZrDaBvfOZmIqXjkAGsJA?=
 =?us-ascii?Q?sxfnIEO9VNM4gh0qm05gB3QqKWY3EIjl502r597cICAFszfcEV9RkUWDiww1?=
 =?us-ascii?Q?ZXHkIacg8Ountl10BogGufl12StWJ0aocQT7oa2tJtuXtlFK8wz9FuwRWX+/?=
 =?us-ascii?Q?+WhhthPhFjbpYWmeKo+o3WSSCRYtKi+ABynx6fIj4JpizVN9MoIWtEXATnKl?=
 =?us-ascii?Q?NgSqyeDxJdAcxzLTmywEzL4yBZcLPnmVkoRnqBYDrWPFF2YDO9E2HQzu2nJ3?=
 =?us-ascii?Q?8dry85LplmSvpzQ4kZr3CyTYFwDqbW3MMCm9lDkgQ3DIsdGz/A+yJqLC1XYV?=
 =?us-ascii?Q?WqS6lgVE+IgNiPuQyJ/E6KpVxm7NjsKoQ0xmuod75Ij9dHHlv56wKBd6pIWg?=
 =?us-ascii?Q?FvFKk2hf3CbFDOtZ2FfAe15R52ybYdKPTUWlyVBs1V7czwS2DCkgnkxZ1CdV?=
 =?us-ascii?Q?Df8LIf6bdonGesNtG9/YJCETYNzCp3/ld3rmZ4gjS9DPBLHCH+LfCtZYBhMm?=
 =?us-ascii?Q?agTBSXK3tVfztpOYJLIITJMUcZ7SK30AX81xChhtaLWyJU9cSyQCFMm0kfB0?=
 =?us-ascii?Q?PJD0cIZOxbFLHnvMYwxyUr8vLlhYTXLW6Mcog+dYU9GAXkVHS5EUGTboK/q3?=
 =?us-ascii?Q?3hUJETO+bVsMUv8+zpYaHHt+o1myxejtezcHJJuoPvwWmObJaOreEzcxRO4S?=
 =?us-ascii?Q?JN0eL1MQN2w9svaw/OJOzEZV1BBdkeQhmyl7XmjnMb9KUJzyzRwJ1f9ykjyA?=
 =?us-ascii?Q?IfGFnfxXY3cRlD4aACUrvrfYgS+6WoH6a9af1V30uoeCFLjtTXgSo0aWk2nM?=
 =?us-ascii?Q?Xtb7l1ckoKeZoryeZcHikCWMzwnFY+vIcOWt4wnofFCIZkLUsow0X+e1h+yc?=
 =?us-ascii?Q?SJEpoXZvDHAV/9X2PzT10UMkK2MRXPiz4uYmrU15q8O+K5/72sFNxwqd5aDt?=
 =?us-ascii?Q?EEFeyT4CjWqCvl3AqMeJwE8vnRZJyjdyGra5yQF6OguDDqc+YVlHFLUpCJaI?=
 =?us-ascii?Q?T8/+4F8kLHjmJPCPbB5D1ZY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cf4b0fa-b0a2-489b-9243-08dbb3220c3b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:41.9537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f3+LkqLDhVGAQkV4pwtZRWm1bbAex6eo7EIm/dpsmYP4lwd1iyWV0aXJ2z8dy1FSUhCz+NIYEUg2CNpcF8GMGxPNWvzU0v573hg8xzyQV1062ZxpVbrgF2iWUpmH15eX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: 633JDJ75PGCF3KZNAK767OOIQTOAMDSY
X-Message-ID-Hash: 633JDJ75PGCF3KZNAK767OOIQTOAMDSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/633JDJ75PGCF3KZNAK767OOIQTOAMDSY/>
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
 sound/soc/soc-pcm.c | 90 ++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index eb07238768511..f1b5a443a1d0e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -71,11 +71,11 @@ static inline void snd_soc_dpcm_stream_unlock_irq(struct snd_soc_pcm_runtime *rt
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
 {
-	return (rtd)->dai_link->num_cpus == 1 ? asoc_rtd_to_cpu(rtd, 0)->name : "multicpu";
+	return (rtd)->dai_link->num_cpus == 1 ? snd_soc_rtd_to_cpu(rtd, 0)->name : "multicpu";
 }
 static inline const char *soc_codec_dai_name(struct snd_soc_pcm_runtime *rtd)
 {
-	return (rtd)->dai_link->num_codecs == 1 ? asoc_rtd_to_codec(rtd, 0)->name : "multicodec";
+	return (rtd)->dai_link->num_codecs == 1 ? snd_soc_rtd_to_codec(rtd, 0)->name : "multicodec";
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -184,7 +184,7 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 
 	snd_soc_dpcm_mutex_lock(fe);
 	for_each_pcm_streams(stream)
-		if (snd_soc_dai_stream_valid(asoc_rtd_to_cpu(fe, 0), stream))
+		if (snd_soc_dai_stream_valid(snd_soc_rtd_to_cpu(fe, 0), stream))
 			offset += dpcm_show_state(fe, stream,
 						  buf + offset,
 						  out_count - offset);
@@ -386,7 +386,7 @@ static void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
 static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *soc_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	if (!snd_soc_dai_active(soc_dai))
@@ -419,7 +419,7 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai d;
 	struct snd_soc_dai *dai;
 	struct snd_soc_dai *cpu_dai;
@@ -452,7 +452,7 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 static void soc_pcm_update_symmetry(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *link = rtd->dai_link;
 	struct snd_soc_dai *dai;
 	unsigned int symmetry, i;
@@ -473,7 +473,7 @@ static void soc_pcm_update_symmetry(struct snd_pcm_substream *substream)
 
 static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	if (!bits)
@@ -487,7 +487,7 @@ static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 
 static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int stream = substream->stream;
@@ -636,7 +636,7 @@ EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
 static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_hardware *hw = &substream->runtime->hw;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	u64 formats = hw->formats;
 
 	/*
@@ -652,7 +652,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
@@ -672,7 +672,7 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 				    int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
@@ -738,7 +738,7 @@ static int __soc_pcm_close(struct snd_soc_pcm_runtime *rtd,
 /* PCM close ops for non-DPCM streams */
 static int soc_pcm_close(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	snd_soc_dpcm_mutex_lock(rtd);
 	__soc_pcm_close(rtd, substream);
@@ -748,7 +748,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 static int soc_hw_sanity_check(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_hardware *hw = &substream->runtime->hw;
 	const char *name_cpu = soc_cpu_dai_name(rtd);
 	const char *name_codec = soc_codec_dai_name(rtd);
@@ -854,7 +854,7 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 /* PCM open ops for non-DPCM streams */
 static int soc_pcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -908,7 +908,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 /* PCM prepare ops for non-DPCM streams */
 static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -965,7 +965,7 @@ static int __soc_pcm_hw_free(struct snd_soc_pcm_runtime *rtd,
 /* hw_free PCM ops for non-DPCM streams */
 static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -1086,7 +1086,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -1111,7 +1111,7 @@ static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream,
 
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int ret = 0, r = 0, i;
 	int rollback = 0;
@@ -1398,7 +1398,7 @@ EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	int paths;
 
 	if (fe->dai_link->num_cpus > 1) {
@@ -1671,7 +1671,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 
 static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
@@ -1705,7 +1705,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 
 static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dpcm *dpcm;
@@ -1742,7 +1742,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 
 static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dpcm *dpcm;
@@ -1781,7 +1781,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 		 */
 		if (be->dai_link->num_codecs == 1) {
 			struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
-				asoc_rtd_to_codec(be, 0), stream);
+				snd_soc_rtd_to_codec(be, 0), stream);
 
 			soc_pcm_hw_update_chan(hw, codec_stream);
 		}
@@ -1790,7 +1790,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 
 static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dpcm *dpcm;
@@ -1829,7 +1829,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			       int stream)
 {
 	struct snd_soc_dpcm *dpcm;
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	struct snd_soc_dai *fe_cpu_dai;
 	int err = 0;
 	int i;
@@ -1856,7 +1856,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		if (!be_substream)
 			continue;
 
-		rtd = asoc_substream_to_rtd(be_substream);
+		rtd = snd_soc_substream_to_rtd(be_substream);
 		if (rtd->dai_link->be_hw_params_fixup)
 			continue;
 
@@ -1875,7 +1875,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 
 static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	int stream = fe_substream->stream, ret = 0;
 
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);
@@ -1912,7 +1912,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 
 static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	snd_soc_dpcm_mutex_assert_held(fe);
@@ -1978,7 +1978,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 static int dpcm_fe_dai_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2081,7 +2081,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int ret, stream = substream->stream;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2284,7 +2284,7 @@ EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
 static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 				  int cmd, bool fe_first)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	/* call trigger on the frontend before the backend. */
@@ -2315,7 +2315,7 @@ static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 
 static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 	int ret = 0;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
@@ -2402,7 +2402,7 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 
 static int dpcm_fe_dai_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	/* if FE's runtime_update is already set, we're in race;
@@ -2456,7 +2456,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 
 static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream, ret = 0;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2633,7 +2633,7 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	}
 
 	/* only check active links */
-	if (!snd_soc_dai_active(asoc_rtd_to_cpu(fe, 0)))
+	if (!snd_soc_dai_active(snd_soc_rtd_to_cpu(fe, 0)))
 		return 0;
 
 	/* DAPM sync will call this to update DSP paths */
@@ -2643,13 +2643,13 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	for_each_pcm_streams(stream) {
 
 		/* skip if FE doesn't have playback/capture capability */
-		if (!snd_soc_dai_stream_valid(asoc_rtd_to_cpu(fe, 0),   stream) ||
-		    !snd_soc_dai_stream_valid(asoc_rtd_to_codec(fe, 0), stream))
+		if (!snd_soc_dai_stream_valid(snd_soc_rtd_to_cpu(fe, 0),   stream) ||
+		    !snd_soc_dai_stream_valid(snd_soc_rtd_to_codec(fe, 0), stream))
 			continue;
 
 		/* skip if FE isn't currently playing/capturing */
-		if (!snd_soc_dai_stream_active(asoc_rtd_to_cpu(fe, 0), stream) ||
-		    !snd_soc_dai_stream_active(asoc_rtd_to_codec(fe, 0), stream))
+		if (!snd_soc_dai_stream_active(snd_soc_rtd_to_cpu(fe, 0), stream) ||
+		    !snd_soc_dai_stream_active(snd_soc_rtd_to_codec(fe, 0), stream))
 			continue;
 
 		paths = dpcm_path_get(fe, stream, &list);
@@ -2707,7 +2707,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
 
 static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	struct snd_soc_dpcm *dpcm;
 	int stream = fe_substream->stream;
 
@@ -2722,7 +2722,7 @@ static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 
 static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2736,7 +2736,7 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 
 static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	struct snd_soc_dapm_widget_list *list;
 	int ret;
 	int stream = fe_substream->stream;
@@ -2820,9 +2820,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (dai_link->num_cpus == 1) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, i);
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
 			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
 				int cpu_id;
 
@@ -2833,7 +2833,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				}
 
 				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = asoc_rtd_to_cpu(rtd, cpu_id);
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
 			} else {
 				dev_err(rtd->card->dev,
 					"%s codec number %d < cpu number %d is not supported\n",
-- 
2.25.1

