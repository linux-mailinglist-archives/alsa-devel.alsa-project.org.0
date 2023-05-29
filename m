Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8214171417B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:06:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED08847;
	Mon, 29 May 2023 03:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED08847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322381;
	bh=8jMztwyRwd+lRhOw/Ajg1Tivj5TkIUZMFJ41RlmjPLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DY2inucikkCMyHChFtY73drpa8IK+zAk+aVeKnotkutZJfF2eRuwu4/N91RUVpBG5
	 HOmz+fbCCeIfPby6jEeu8JeKM2XODIp4IRfH5LVCnLAya5+LZvFdFUswlsgPYDh7ZS
	 Js5+TQcMuIBBvdamS7C75rhWYwV341ClinJnQiQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F1AF8057D; Mon, 29 May 2023 03:04:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F47F80568;
	Mon, 29 May 2023 03:04:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C971F80568; Mon, 29 May 2023 03:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5614F805C8
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5614F805C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y8IJgJwr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zxf26VB3JTn1X9+dXi1SKB0CEEkHYPI8ScgW8ZeIv8AHAQ1jolpJoEVkqr+omSjn4hJpKlpRb6lF/f5mbPdYWAwcZMLp2WADC0qgysEA2uL3vgxXbaI1ZAxU2Vr/4H0xzLneukEUJ8cFPoBiJwsPPrJ+BrXM2poYWESpYz/4JlWysK7PlVmmnOdC0Hidt+IQ9TlJaKIfjX+suETbEkZiyCAPv8LxCjzOuqXnR+1LyAy/PY/gubbwUoL2NJuzSvrORsklUi9R8Osn+ez7XBx5FvH/i76NEJIt6GnEf4ZRYh1zsFkwgf9TeJeDT5XrWNUJFLuVW2OurOobA8lVJmSzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md0Fm1eajLDgX1+Cl2L1J8rabgMiGhtyYADTrQZisW8=;
 b=c0HpNbwVvufKcopBeZ+aotJvHrTzV1r8A0W97AHuf2rFLpF3ntvTsEs7IzVYgjZx9AlALHV0W9xSUHcjYYwfSB7Xeg6R8M791LiST961paqM68PCVAQRjGDD1pOFT+34lAa/7UlTZjcDTsh2u9BdplqUeJO+tPmnAW9Kk6dautV4kpcgsNXR2/s2w9ItYDUm4mmgYKujTNsJUsT5+AZS7iVep06dOYrEulFLtCBlNlcfHCOPuJbOjEXma9SPxGhiNYeMXNK6ClbTWBImdvucbzm0Gnnh+7xSPIPVGt76hYJgo0J9i200/aoD33EOzmHA3LATVBdzckim3OgKzHYF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md0Fm1eajLDgX1+Cl2L1J8rabgMiGhtyYADTrQZisW8=;
 b=Y8IJgJwrMk8lYGNsjcENMedTNsnSw7xztmKHVGuVigk16qZ7vhj6O0s07EPNbHEb3oMsrwAIC+mt+bUl0Ba6hQS3cQNreKDbH8gxJnCxudEAQQahjKNv1KKqWE2nyq7Ds6SLZTEePXtUjkoGl/nsDJzlo8MnX2MduDlcb894kAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11557.jpnprd01.prod.outlook.com (2603:1096:400:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:55 +0000
Message-ID: <87bki4lzic.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/21] ASoC: amd: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:03:55 +0000
X-ClientProxiedBy: TYCP286CA0160.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: e47540b1-13d0-48cf-8212-08db5fe09390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dWajB0mHhjs+V4WLKHiglBhpnC++S4RtksR/24Sqrdcg3dHV0hBnKEX/ptNbNLW2SOpFNFpx31NA3Ei9dg9eKo6ZAqQOADvwtoO4l+HlTxgxzkpLj+1VYnbqUvxay0OZTaMW7d0olkDqQbv21d+b3F6tYHygmdbVWDiLA2p0Xb+CKjmPn2mgZaIPFCzYgx9JXIq0Kr6hDYMHSVNwy0P7YMeBd+g0FD1xc+I8tDI/4Htz2YtvtQhhoPX6dT3Wk8IdeGGGufQCmShgTCGsGU/Xr8njtAaIyK3FzchSjwddVxSuQYY9jbhRpz7yei6DX/d5mUSi+DezNMOuzqL2FJOoHUnMxtgw6Ue5Nlomv03+EDqhGYFbTzNfMVdgmNemkQqT3iqPumeLYp8oCCv50eRLCPPPCCCRwljkyZO+jPMPB6wpOv/YVghfnLDM2bITlczd1ruKDgYQihd63vto9bPJ0LFZOMoXd5F2QsLrcVfS0xWcflmw0C83tiJodRWf2xMLbhkM8GoiFA9t/bxWSudsKbvSFo3Qj0AABDqU4c423LUm8C+6d+M8RUqydD0lTq4ffsqoc4jFZ9Qhbi7SBYNkyEgPPP5OwEdwdx+9FmtS0yL9wo2beq1rhqqtCrJzjx/A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(30864003)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(41300700001)(6486002)(52116002)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yRPkIFMQvQF/GSrz5Y+ZBQvuDpeIRJd4/fXqlnqEzlI4x6Z32sgkEz1imgAx?=
 =?us-ascii?Q?1GD6NczhhoQwikQoH4Y4ysydBEepH1cm/P6JN6x+m1+Sjpta8hzZJNKOjDgJ?=
 =?us-ascii?Q?2IjPgUvQEOykWSj/bB8+6VsPsT8LETU8mWF8/oz6hZX3SXz9WE2mCUkzuKQ5?=
 =?us-ascii?Q?/YlZpZGp/vWh7+JgVu933DxvY4yxpqoNmM0wEJPQmDru+AzH3zs6Q4GCWY4a?=
 =?us-ascii?Q?PoEhfRnHYje1BwB7GiDAKJOLOGHpyCUrE/N1dSsxoCcksyDVkP4skSnZxkrd?=
 =?us-ascii?Q?RZ3CONeXZD4yGiI0usd6Fatu39ch2SpIXIQRJwkYZ4bO1nC93e4W1cahAmQs?=
 =?us-ascii?Q?ifV4PjYAjHg5rWNEEYDQHk+FfvbxO71kx5prZ7d0s2zb+4kmvCiEB7hlZfCj?=
 =?us-ascii?Q?80vU1bk0fRJ5Sp1Fknir1KXr2bJpN9KWOPD3WyLVN5VhMB5Xzt9HKj+YbSRM?=
 =?us-ascii?Q?uHC+/JqG7m6zpj7JuJWZDMA4l+IqFkOZO6NqIBeZ/ZAAH3MhEBL0Wp1EJ/GG?=
 =?us-ascii?Q?VE3z/q30OkatYJmtaMMhNHL0vWvdjE/5+nAlbyKtQ6FmeI1jIT5+ejHw6PnC?=
 =?us-ascii?Q?lM2FZY9+i+IRr8dPjOuUdW/DY2EtOWnMLPhUa5wBEwUGlDTpaji6mK3BY39J?=
 =?us-ascii?Q?wsFffjdss6Z3jUYlXbSsRhwj9aL3qqkkm3IjREWn1QsZO/p1dbfsRFZho1Pv?=
 =?us-ascii?Q?4fDGgmyY1l64c1NsGYkCUvEilR/d44sexGbU7opWjVWnYPG6zjVgZA8Yb05S?=
 =?us-ascii?Q?ep6qoH5fO9nxwLqsamB6HF8Sbr05Nnt88upMLblVmSY9TePkcTA0eid/Ermn?=
 =?us-ascii?Q?9cWPJa2DTLGeHih18+uSb6usiT59+J2sFjtkF0wEJ/mxUqZtK+mYAkvOf1b8?=
 =?us-ascii?Q?bmPSL3rYWhgYAdOIOHlO2lnYCWM72QbKHgJ6PUhmq/IVL8SyTe2NJGig3kMD?=
 =?us-ascii?Q?CqoTtxVCQ9YHL5NWnvOAQgh7944wVOc+R4fjbTEam38rvK5cbkoGRCSEyA15?=
 =?us-ascii?Q?LCzUrPj1gSNviD4lEOyU2LMvVqLcgfLNoD9A8BkMC3J1jKy71uFmukztm7BJ?=
 =?us-ascii?Q?MeJMoJ8J9BZzjjJd2WlW67s/M+TUvrTe/cr0SYZiTB5cNaYLNvZEG0HvPxZV?=
 =?us-ascii?Q?WQS2mdAhSc1OKyt9iXxi5uPTDrSuATqa8gk68uGZ1iQQUUBvRZulCqWWVXt7?=
 =?us-ascii?Q?INj8Ihq0FNbzSf+yYadrLuyZHpc9RMBVbNeti8TulncMBLBTLWuAC9ulGEHE?=
 =?us-ascii?Q?9C/J7/UA2l5Hzku5mtwcqvUE8K99eLRFoMI00LyfqhXhzvwgoBJhPPejzqp5?=
 =?us-ascii?Q?WDZsn72zj/owyCVex1eRDeaeFstgS5TZYtGG9JfRcISfGORFL+nsuXOgWCmo?=
 =?us-ascii?Q?Ua+ppAEHU4Zb5UTfHoaXIaH2SCLJD5oTSXo4bRrzLUwmia51CAhgv9/SZDpI?=
 =?us-ascii?Q?unsLcpwu1xHgZifMbgLqj33JzqK6xIyotOqi6PvnOmtMmdoREJWsur+foA6F?=
 =?us-ascii?Q?e93xxbIH2LCiUq4mo21tZjNOvw6kqoo1e54YWJTztLwSCUYGYCveVzMmqJZj?=
 =?us-ascii?Q?TPm8rVAey1UVDOQfJ4zjm+UNmbi0zfR5lhcCC1KnpKlw5yTn07Vi0+8N4ZjV?=
 =?us-ascii?Q?v4OMq+RZS2qBRu6Sogjzz+A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e47540b1-13d0-48cf-8212-08db5fe09390
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:55.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3nEYSNIkvqeDb78UDaqovKaWn05Bd2w4BrIxSNg9xq8GKQi+gMPckA2lpanF/i2Zgbjxn2J37gkGrwYSIt8E9Owkv4gwuGIK2/mm+EhXWIWeaKUu6fQ2MZttiVxZoRqw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11557
Message-ID-Hash: WKI6WYTNXA2JS5KDEQEL4ABY4RBZBIU3
X-Message-ID-Hash: WKI6WYTNXA2JS5KDEQEL4ABY4RBZBIU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKI6WYTNXA2JS5KDEQEL4ABY4RBZBIU3/>
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

