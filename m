Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FC989923
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 351D41665;
	Mon, 30 Sep 2024 04:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 351D41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662500;
	bh=E8uRcDIYfYQ3yNKQ9ccPMOVT18z2G83yqd3OOxbR08A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oz+xGE0SPdcMbpCo14Lw4L5DskYcDjsAjoTNn+q/5aGpVyBKstLago6UHCntorqU5
	 jXiVYKy69lV/dIh6E/LuSvF4Oiu17Oahqny8cEK+INtFqNXL9ZTxO+wp2A800ul23x
	 WNXd5tPJGz4qEzIY2LtKrO+8/cDTuVrEiWEOzf4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB3CEF805A0; Mon, 30 Sep 2024 04:14:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A797F805FD;
	Mon, 30 Sep 2024 04:14:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E404CF805BB; Mon, 30 Sep 2024 04:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79F04F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79F04F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JOORDDAo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5Hy3MrTDru97X/XzWxn6pBLZXmCJfxcUCov0miR8Kk46i3noCCAZD+Mre/pbn44Njg2OdVip17XX/tpzfq4EUR5ZARXOYmAtDtHy8+hFhW75gMWc1zfXR6k9cMWAbfs4iwNKUkSduMycf4stwI/mUbvGPBuS/zuC/ssINrH3iRAHeyI8JxhzOKiXg0vQiyMeGvsrQTiap/IyPGmskE+UZrBPpifQRsyQlEGsbUSMPmGxS8oul+tWueqZGW7JyBiQ9eylRoZEu1t6S30Ai4IsQI0YnOCXi96ewFTTz3p/TOt16L9bf7sgqcdZVBtXfO18y1RBn6PLFu1ajwy/0SrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdqlVGjn7/8vAeXOmkLE4hLk7DgXCc56AgZdATXFRY4=;
 b=YDwMwdNpMCRqvsGCgCSk4zSfzXwq3ENGC6gX1vM8d9iw5MYgmPb2DZXbY4mrlKk7AVz9arH7IRRVTKAvUfVDKtikujMFsajkvqcfGdFAczHZlWV0tcoMFcz4ljAsK6LZkIA+xFORqv0icyKGNouec25w0GCdXhNeBDkhiONj5rLoSqotIyvoqXYVXhAiecQEjovFdc2e4KZWIXYT6E+Scz8z3VCfQbWIpnErNY6tT+L1V1TspaL33KJijHVtet4Ync45PuKNkCf77g+Yo2QsL91o23qxl9/QXgeGyd/5DzWQU9zQd8brWR1a/tu1gCV/MAvAGg1d0T+xZc9NsGg1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdqlVGjn7/8vAeXOmkLE4hLk7DgXCc56AgZdATXFRY4=;
 b=JOORDDAoIRuPCS9qjbNPyZ0uVVi9JvAMnIlhwP0tTAgCC66uE5l9aXfK0uqJzvM9IbxJzhMfYGQVkfU5zwy92BGp49dKRrMTe5ifUQxSjKFkvYMm653v/qexCHubfQVXlGj6Wj7L0Y/OcnAvmjNNMgmEG6s4vmLJc5+SeC9vS2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8143.jpnprd01.prod.outlook.com
 (2603:1096:400:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:13:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:13:53 +0000
Message-ID: <87o745lwgu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/13] ASoC: fsl: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:13:53 +0000
X-ClientProxiedBy: TY2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:404:56::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 347f3628-e384-4de7-7638-08dce0f5880b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uPapkc+/6QMSv3DBAzIGWdZFjSlJ47/aZRdT4ftRxb3g/OsbxqCY8p5C4iUo?=
 =?us-ascii?Q?eeIy/gHQQOhHYwIoGsDEJDrv5G5fN/jTEtDHr2bme022IjyWCgR/id9rG8nv?=
 =?us-ascii?Q?lXIF12hRj5UB9aWlm+vrtOVE+gytUcrckPl2bJugARfwvtBt4zdgD82blK2C?=
 =?us-ascii?Q?X3vJd/MLNDT0FU7w6gUVJVY1FytE71sAChHem+dB53EAF3GDzLRCJ6l/sdZ1?=
 =?us-ascii?Q?FI99i1zRB+z6Xjn7re0CHXfonVdAkZLvK7Zz15ciLOhL38q1sHQkJFweI2qr?=
 =?us-ascii?Q?WAxd0F42Q5zKkWJpWuGEVsAUv+wH5kk6zREPDFC/ZlUbsMTDae89zgSbPNZD?=
 =?us-ascii?Q?fGtfvP862ncJ+LMa+AtBnrSQb3vGtRYHubuy35BTF4XaeX3Fcjq0MlORan29?=
 =?us-ascii?Q?XcSfSYbDjL3GWkutFnauE7ER7pY0xxkrJA9A/7Cs6hCDexvLacX+0jjjLT+X?=
 =?us-ascii?Q?8wJypQQWS/iBtJdgM5hnxmZ/HdKXt81OdoTvkepUrlSNbHkVDLqzoCz9rk+2?=
 =?us-ascii?Q?Teq6AIn4m4PAHz6Nc1StNt7nWAdzbFqZGbhWvTw9jY1K07roapfhScaA9UBG?=
 =?us-ascii?Q?eQhbFGSy0tGhIyX0f2i6X5SwP0qYL+sWypJyZw8K1zSH9oOfU+ShrHpJKV08?=
 =?us-ascii?Q?bNMPJ3m0mit98wOXc+Dutt685+f+/y39kulYljXSmDNTJwdbPiEy4eham2eI?=
 =?us-ascii?Q?q25s+ES9WOsTi8hZ3WYgQ5qC5Ohkn5Ojh0SsHXyHbRxU+ulTVr5iu0v3b3h/?=
 =?us-ascii?Q?SmRr1cH9z04JMEHrc5PgRuujv6yOhOatupkiQMfvOJMxyd5GIDhbuCNYK/ko?=
 =?us-ascii?Q?439z1MpcsxUVm1g9gxK9xOxNjUbvgnR5ttpQT7penHrnqkI79BHbA6EqJ/fk?=
 =?us-ascii?Q?NxD5zYTAKd9vu/mTCezTeU6OkQhu0jQ92yDeXjWYh88YKg+kOrOW5VF134LO?=
 =?us-ascii?Q?fEwMM3IltBAE6fqZRbmPdJXs25gbNSrUBF7io3etVKUqoGlQ41CUoojt8kyi?=
 =?us-ascii?Q?C73SQAHvrdhBwXXXg4Fw+3kIjrFP4RHl0+K6521urkyT6pmSCqjeMSf3iode?=
 =?us-ascii?Q?FDVSIdjEu9BZ+rv8qkbmimDoONcb3Vql1PcYDS/NNMQ0HF30U5MBmLmFxJh1?=
 =?us-ascii?Q?IhyU/nawgeZyWpfDJ/+pQ2P/ewUrG8Vrd40rl9PAXFYYoKIsOuMP9r3HPK/C?=
 =?us-ascii?Q?rCy2rLB63UpRjsaUYlGoynXykx5LmiarnlMuIhsVnlCpMlnSxneh6mvPsO+y?=
 =?us-ascii?Q?uDtLhqJEZ/Y8q7SjWRkanl75+KOYWFaio2i5OtaZjRchohb73Q7r2WXj6HoC?=
 =?us-ascii?Q?Yl7hbNyn2ZRd4YpWS+T7wtvWB4hMtShHA9CPE4swv53oC100JkpxLuVgoTXi?=
 =?us-ascii?Q?D3VON2IvSq1ejEalpRt4lzkFmswAbuE/3Inz6X6vIqBn2FlWQg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EPSde5nXBclAddaf80AousoxaBUBT3Qf5P3xEhYkjDEtbwOSP9cX/bjVUtPk?=
 =?us-ascii?Q?N7TD85klzDrhGxR2MaJUSIXglAQNUfKHwOXwcmjuW3MtxGp7C8R1ZUuIlLzD?=
 =?us-ascii?Q?mOKuL+bFbSRRMw7xG/HkM25ivwt3IOfVyB0Rux7/DCkyJarKd5Hjf6GQY3zK?=
 =?us-ascii?Q?b0gkeeNPl9rUAm/ssunevbQFMmz8Fj9umyiQDVk6EmWbk/ER3RrkVlg04CEb?=
 =?us-ascii?Q?8wFitrfV/f5T/e+yKPj68vCbKy01HH28Sb+XfDuoj/bBhyLoU3tHgaVmuFTL?=
 =?us-ascii?Q?11wcCpLOrUIAT7A1/helQExfDe0awZz23j7SMoQ6xAJJZUGrIdm9szcjeJzT?=
 =?us-ascii?Q?ROclEr5cuH0C4TCQdgHLA/tlBUahyWaD4QsAwUMNwE63mr+TG8cHuQrjWuUM?=
 =?us-ascii?Q?2da7EMKbYPkUWFg7ZQ9OQSyHuou7iYn6J3mJZHJhNkNE/fKnR/EK1BsUdcZz?=
 =?us-ascii?Q?AZ4pSEZlEDW5TntqcQDmNtKKJtdQ3LYOmARYEjZX0+ZWskZ9LZUl6xGAgZlz?=
 =?us-ascii?Q?uCixg/pz+eapYnlyYp+84aX/EU/xCB65eRoN9LWgXizFNZfuZ8TzLI+zbH+w?=
 =?us-ascii?Q?3dfHBolQnkDV6KcMUO0gc5rf9eF0oOtDz9e5HTvEK50aNfGd+KO5a0XY7zO5?=
 =?us-ascii?Q?ap0i8BRpwfH4mdUHE5+6uEr0tJIOBFt/ZhDg9yc9P4erbWkbx/+V5K72gIsq?=
 =?us-ascii?Q?1zI8bVjGe+bcjBEeJzEqmDwEUf2gwsc+20y/gxhAIEaiakYJKxdoMCgkDp+E?=
 =?us-ascii?Q?cMAgoYblv1L2o5OHgjXZasE7WuK4hzu4lfGiWq6ZfMu7VvWEcEyvfg6fHoIH?=
 =?us-ascii?Q?vyegre2dOaxKX36di/H8zUr2EKJOq9obYxiKC4hp7p3uFprOzWoXy3ExfmJD?=
 =?us-ascii?Q?3rOVkOP0Soiwg0WK7s6pBIt9XMvaeKfhe3xYeTgzWrg1qv5746tPDpdgE7UJ?=
 =?us-ascii?Q?x3OZaT9cpMaZILtMN42GKNQNyLo7zRSuDzQd4+br5UNzA0wOjR344Vx2uzbK?=
 =?us-ascii?Q?8+5ICAbnDUOfoAdmzz3rgkHEECthacmBsQK8q3W+fxScGLRYLwFn1J/oWQr0?=
 =?us-ascii?Q?SxELgOGJzXyolIvMo3l74RyJMv8EimJh07s5toUAIaG/bY/kiruNxs9yCHRg?=
 =?us-ascii?Q?cZ+fOrUOHNnTQFZ0icenqs7BxheZ9XYoPLBhTXKrQcPog0cFsH42UhrjhLrR?=
 =?us-ascii?Q?B2ndPz4GKwNynB2qOAfJ+/x6waHd16GoBYiRHAA8SJsm2upKlNtsCOHsEADm?=
 =?us-ascii?Q?A/CsWh65G3ol/LwO1ng30n1W3MW3o6gK1MjlJYlETUED1+zYPCNcGXfItOnF?=
 =?us-ascii?Q?IdIPUfZrdQh4TDbnlgv6jVswNGrlsdiI1xztw1q40knGI/w8oC9hprIcznJQ?=
 =?us-ascii?Q?KbvlZAnWU/3WFpkkapx4XK3gtBbf16gRGTDXxxn22x+a/YesdvPAbylg4kPw?=
 =?us-ascii?Q?R+qFT35vQTAJiVwmp9S9Vswg4CpTyHO7uydc9XwpwhB1mbGo/C3lbxqk3m0Q?=
 =?us-ascii?Q?EVHqX/wdx3mjrLMREdi7Rul3LitgFE1Fw5jwse7j047r+kePV2lP8648t16g?=
 =?us-ascii?Q?Ryqdps/JXCmSoeJfTokuUCTW7pIJQCw7JWjXqpYkXH+cvLnXX37UTrLyw0oW?=
 =?us-ascii?Q?z7xaVih0IAm/pMLOJut1H2Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 347f3628-e384-4de7-7638-08dce0f5880b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:13:53.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kKCKwDlRZeQn7xO6eVaUE7k/wPsFbxEh+00TzLRYuwF4PoJWyCy58Bco5hBTIItI2BOSmpJxhNMAXUEUC1B1LVQdH1FgYkRLMIAAJmZ0l7qbr2ZEiZiDXaBslJDSMm6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8143
Message-ID-Hash: KLFCTQJKXCO42A5TLWE3SJYWMZ77F3AX
X-Message-ID-Hash: KLFCTQJKXCO42A5TLWE3SJYWMZ77F3AX
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLFCTQJKXCO42A5TLWE3SJYWMZ77F3AX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 24 ++++++++++--------------
 sound/soc/fsl/imx-audmix.c    | 18 ++++++++----------
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6c3aeff0d8ea..82ca137621cbb 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -317,8 +317,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 	},
 	{
@@ -326,8 +324,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 	},
 };
@@ -504,13 +500,13 @@ static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
 	}
 
 	if (priv->dai_link[0].playback_only) {
-		priv->dai_link[1].dpcm_capture = false;
-		priv->dai_link[2].dpcm_capture = false;
+		priv->dai_link[1].playback_only = true;
+		priv->dai_link[2].playback_only = true;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (priv->dai_link[0].capture_only) {
-		priv->dai_link[1].dpcm_playback = false;
-		priv->dai_link[2].dpcm_playback = false;
+		priv->dai_link[1].capture_only = true;
+		priv->dai_link[2].capture_only = true;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	}
@@ -764,8 +760,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name[0] = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -791,15 +787,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name[0] = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 6fbcf33fd0dea..dcf770b55c4bd 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -264,11 +264,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->dai_name = name[1][i];
 
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[i].dpcm_capture = 1;
-			priv->dai[i].dpcm_playback = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[i].capture_only  = 1;
+		else
+			priv->dai[i].playback_only = 1;
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
 
@@ -285,11 +284,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[num_dai + i].dpcm_capture  = 1;
-			priv->dai[num_dai + i].dpcm_playback  = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[num_dai + i].capture_only  = 1;
+		else
+			priv->dai[num_dai + i].playback_only = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 98b37dd2b9013..c4647ba912a63 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -814,8 +814,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.43.0

