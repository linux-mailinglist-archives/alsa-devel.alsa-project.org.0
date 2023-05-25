Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC571051D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59651843;
	Thu, 25 May 2023 07:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59651843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990946;
	bh=8jMztwyRwd+lRhOw/Ajg1Tivj5TkIUZMFJ41RlmjPLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CFK4rzCCarcUvTq0mOnDZFhSuu6BTDjE/5zQ0JcCdIdru9RZ4XyKXQN2Fc9qNLneq
	 iCmpt6yoX7vGFegBfnXzce1tydGeqjie6kQW2xjyeUWUMjbR1rlfBsly77zI6a4/gM
	 FcD6KMZorRuQAux70PvUAOrgzg/IK0VVspHYro1U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF9E7F80622; Thu, 25 May 2023 03:19:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7D9F8061C;
	Thu, 25 May 2023 03:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B87B3F8061E; Thu, 25 May 2023 03:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E6E1F80611
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6E1F80611
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Jj9ipHe0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDfBis+zm+mPv1YHtHlKemhChjla++BUW6cJ7L1ULTInG3Z7iVvnipkEwIwGEywHPsF8KQUJUTRKMOd7VmxY3C9RmcMwvIIhJV0TiMtkID/18EWwieej5awc50PNezm+Gbxu69hlLLUJvWufiiVhepwQlzoYkKPHZduDexOo4reKYgA4/tbzwzlSBw5f6Sqja0uA13E1Lb4qQpjU2vYojgkinBvK1iqyBGzxWNMIhv6BzA8b/3c6IU9SNJ9FFuHf2RA08yOrr3AmXlqi8/sTghe3evIb+G5w8m+WhXYqiOrMPmtP/z/OObBgXKcbZgxI1QEZSzbjjvmdIsmslBC/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md0Fm1eajLDgX1+Cl2L1J8rabgMiGhtyYADTrQZisW8=;
 b=GY4fuEI35Sg1K6N+kXdJvWxDo5ZVRugQPTXsp384AtTZc1o9fiKsYPnrTopmHt6DAlyiqJ8MS1b/BQBJqFB7XPcmDL5jATBIf6ohRRGbtODJ6QF4g+UTOyLyfd4r1gHuxBFc/47cq3NtJk64JPIogDEdEpyaUw2NmM8x1gteBNGifkERDAtB4INjWe2gdhppYeDEadIEkqpH1Ejp5AiaoocWVY+x8j6e3lbNFwORlydoVWkMQFxMAj5zo/2k8BCLThdFEgLB4yb+cdbQEHkxzYdQZJ7P7SRXmaczh+FWbvRA6HOJnGYjE9FkjRPVjmqninLDR0JSBdtin1wfoze/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md0Fm1eajLDgX1+Cl2L1J8rabgMiGhtyYADTrQZisW8=;
 b=Jj9ipHe0dCqcxVJyBmSUqmWFt8p+XUjvpfXVsmXQj336PqSud0MbWbHzdlQtPyn1wILL5YtpLKYdY5M4MYu53nWkEWKxmDWnNTVSCn0nbTFBuMyITc33h05KaWFonqtPN9B4gKB1LK34bw/PNGf0jzHNPmAO+d1E2Vk3CiXdP5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB10982.jpnprd01.prod.outlook.com (2603:1096:400:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:19:23 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:19:23 +0000
Message-ID: <87h6s1gqck.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 09/21] ASoC: amd: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:19:23 +0000
X-ClientProxiedBy: TYXPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:403:a::17) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3d40c0-8069-47e1-0a30-08db5cbe12e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qs6y6MH7dqLxTdhcBShq+KUiBSk3Vh64djmjwL4lNexecY046Ve8lLCFacGSfGvqB5y6hWMFEA5EMMSOrcJYe6W5HPovSi4RsRX8PR+10N6JnoT5nipU4OmX4n1sycFO8xIk60aS+C0BumzRSfs6KLdv7wFrYW2V39HgeXTyk6vFSI7cdLGKp7GT58gjAlmuHDi/lKj+5KJdAEJKeBeF0+uC55odT0ppQAB0VXOBSov4X33XFr2iKl5xu7bZ89B0nWmjhk6fz6VxzD44ikk6Qt2NXjxFeLOOi4LRgpIEsHPmSoddOgWm5MUmgvdcTKEzbT7RPXAhh9M4JC8MgqvqgcKkdSqAFotsCLhjHGg4O2x/WHjzurgPiYLco3tRj1o/WRXxDI23hUCzkyY1+7qarPKCqNDs3a/YLGN5bHBAfEVqNrR4zCaAGoFo7hYXoeVk+TC1RSJI9DrLlPlcIR3R5RlXb6nCaZDGJ5GbKabP+5VLN3c7PteK8MfNOCBw5ho5L2wQv1PLL7NHn7KxZzkI+SwvOQZwIM/XgJmHSk5Ra5img6alLLRaWxHMXVcYiy0KFgBbJTVa5fs8yFFYQelY6ySGdgRppCIA/KOfcDFdVWDcX025LSiMZa7k+Ym+mNO8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(52116002)(478600001)(6486002)(6512007)(186003)(6506007)(2616005)(26005)(38350700002)(38100700002)(4326008)(83380400001)(66476007)(36756003)(66556008)(110136005)(8676002)(316002)(30864003)(5660300002)(2906002)(66946007)(8936002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RHr81TPQOAKt2iLeGQp8L5Pq4ITGKOhOPTI1ovyG5vUDdDmwHgn/4Z2xuaDG?=
 =?us-ascii?Q?b7nbLn0A6cN5YgGT19n7sfqbGsGg/Bl91ajQSO6e1TfldqKp1BR29E6TbZeH?=
 =?us-ascii?Q?6KM43qJD8y2cOajXdK2qb3TwPUxMkNz8M1RW2Xeojwb6LGmkcvzlqYu8hwQh?=
 =?us-ascii?Q?beDKGM9HIZiZETsuDuGCMSr5ckbS7jliJ+tK7ytZLQIZbR1ybFpxV/rXW6v2?=
 =?us-ascii?Q?S9vK+tzRdZgvtzEuqtI8/bzAad/30pThEbvkREgqVUBF8WV8TzdZqMoHuYFx?=
 =?us-ascii?Q?hOFrziKOamk6lYfQCXLOY0KYma/cQl1g02Q728+oPLoIabVhZeBBbGmEqPJL?=
 =?us-ascii?Q?Wy1tqzsFcmaJdQc/K4C3y47uUVh9kwuLkRB0bu3IUxIHs5RJKOsGOSZIHnmc?=
 =?us-ascii?Q?eKidzEVjPU5kF+Qj4tK5gfx3ApAkPfjgocqHfmF7eq1TCY8hz4ZjddRXTJAF?=
 =?us-ascii?Q?xva5j098KgFltlWOHzo1SsdlNBRUoBQN2Z7+BNhigaw1/pWlIPLOmK9znB3m?=
 =?us-ascii?Q?FrfZ44QPfdmI3pav58fePSvWLSToU2+/iV8APqeeXusXWliiXDtDrIcsO1E1?=
 =?us-ascii?Q?IKFKzb2peng9eIBNN0rAg08swjRNS4CYK4YmUpbVqm/g3TuLW45KxyjyzBLq?=
 =?us-ascii?Q?3d0HD3seyQzZfVHgoscAepme/Lk8Fc5jLCVLVsrQvU5JHw4LJudxuaDX8Ecr?=
 =?us-ascii?Q?jnTPanBMVXHYSd9OGuuy81/cuCwyvf4DEaN/jBKrGgAmYKGp4QSf40MhDsJe?=
 =?us-ascii?Q?dDME3DWsOVBubY8FlYz+IZXmjlLcfWk5eQCjOPn3LIxXfVTKcj8wfOVhaB/u?=
 =?us-ascii?Q?L8QdaSLWmaCbfLlSKl+BNkE/Bs4OZMrlOrnXQFedB2CMREFd8BKKqwIAMDFr?=
 =?us-ascii?Q?aLZX+b+s2BPkE5LcOdPgZTXepu7fm9SMvKZQxhsjHitwTSs2VB4jmjcm+zH9?=
 =?us-ascii?Q?LxStCdgsLDMu/tbaqtuXINpd1ho5mRGSOONiDuop197z8EPADCCkGWWWYaKZ?=
 =?us-ascii?Q?j0eii51ZBrY/gUTh2aMnLdSIMZdQl0+uFXQW4SU6WMe7nXO0nXc3mpkxcidj?=
 =?us-ascii?Q?pcxyYL/0ZAhFip8xLHlRLQBqSG39UqoFgFrqnwv9ZJhuPBbq4OFT/AzGp3UH?=
 =?us-ascii?Q?LbUoY5FRrc6hySAHNrTS0InKOJKgKcsyt3lWju3PNGy5FD8SZ0335xIZRMib?=
 =?us-ascii?Q?821g+Mcq1TGJ9GbaQ7e5aZ0qYHIaPKhYbEQ8wJ6ws+Fumeq0WEdkeXdkrcEx?=
 =?us-ascii?Q?NkxsTG11lQYWJV655bfFSxd37ucPVW6kzERFLjOHaGNrLhm7j8/GPa2bwhz0?=
 =?us-ascii?Q?7EwAReI68iyk9K6vljiiWQsj62k3uf1dN+xl40L5j0uwPOXiBiGzp7kVb0v6?=
 =?us-ascii?Q?Oh4qMyJxkmteh//3p/cEyjpSsdSA0UrhAQZsS067JWRezgJUFR9XJfF5TtXn?=
 =?us-ascii?Q?KjrZ6Peso01mVH9j6Dqo0sQW0eLHKT80O12y+uHb5czFnJqHjLyRsxFgX9NG?=
 =?us-ascii?Q?AEL7x7D7vB91Vxpn+jQhMVElg9Ty+8darv/WdJDILcoTHG/aTfckejo0zzr3?=
 =?us-ascii?Q?KCyO8IrziUxd7eUcDpAzUP+Pgl8eNBPzwaA061ucaKfkpnft5KeKdFmToZ/F?=
 =?us-ascii?Q?Isb/6UQenacrD4l6QSjF3/Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e3d40c0-8069-47e1-0a30-08db5cbe12e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:19:23.4845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hjsgDr2J7WAZ16J1UC3sCHfwUNxP5zsTRDORUQ7WnfS/o1NRpdEiJzO1KuPpljmkaNrthgje9llXb9jN3HVQOPALzhcHPlOJsglD67INo6fZO/b8FM/PKofSDkIXyT9w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10982
Message-ID-Hash: I765UVSHABSPGIN34IRAHDUXLVBQ7GWL
X-Message-ID-Hash: I765UVSHABSPGIN34IRAHDUXLVBQ7GWL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I765UVSHABSPGIN34IRAHDUXLVBQ7GWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 20 ++++++--------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  3 ---
 5 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 375417bd7d6e..7b20c25388ac 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -523,7 +523,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -533,7 +533,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -543,7 +543,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -565,7 +565,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -579,7 +579,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -589,7 +589,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -599,7 +599,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -610,7 +610,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -621,7 +621,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 89499542c803..982db7d9cd17 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.stop_dma_first = 1,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 6da17140beea..3df2f7733b32 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -899,8 +899,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -930,8 +928,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -961,7 +957,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -993,7 +989,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1027,7 +1023,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1065,8 +1061,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1099,8 +1093,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1128,7 +1120,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1163,7 +1155,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &asoc_dummy_dlc;
@@ -1207,7 +1199,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 0543dda75b99..154170f353ec 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -304,8 +304,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -314,7 +312,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -326,7 +324,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index e5bcd1e6eb73..9d8bb9c0efe5 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -273,8 +273,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -285,7 +283,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
-- 
2.25.1

