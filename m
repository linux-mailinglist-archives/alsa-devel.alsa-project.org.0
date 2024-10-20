Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1321A9A5796
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A28301FC;
	Mon, 21 Oct 2024 02:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A28301FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468939;
	bh=xP2X8aAnobhEdyDs795dU/bWbG6tfLueL6B8Rgx0VK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A9IjxasVGGJ4Ee0Pk6YoujH6B2vSvqBpOyznR/Bc7b02h3GyqNl8FE3ufEXotJbA5
	 VgYCKOUCRNKpBXIoEJSuOTAAqK2XaiVw1UjlzRVYxE1kyLSQsgHVxQJAgkNPDBPkp7
	 YM69pneiXpZeRYYK6q64vJC7zxUP5h8/r/c8gvxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34EC8F8060F; Mon, 21 Oct 2024 01:59:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA5F5F80714;
	Mon, 21 Oct 2024 01:59:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62DBEF806DA; Mon, 21 Oct 2024 01:59:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 879C3F806CE
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 879C3F806CE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mmJzrJ7v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBK/YfTtLpEwa1mXV46xFembEDFkBG3jdL7QQ8EUwayrn6zEo9nC4f8Bsi37blqaAVfca8XtBInvkiDXJo4Kwx3IuHAH8Rmkixrm6GwY52YNrWDNrvSOepJ2CVBS8MopCTkV11flc5GXLEFtUf+kzjtF0XrMUKpwR+W4zmPl+p4Bety/VFOkrkEqWa7WqMAnesEsT884XiZKqEwGF4NP9dedYZGFFsKdBfdnkVhfpf6/EsrcfftcbpDZ3Ym1j3HVsJ4uPT6pZ/l9GGRo5/W6Jtfypnbqr2Wc96uDnRTxycAk3n5xIBa4I3TWpv6dTxb7f7HlJ+X/aENsW6g69VHFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipkSOmeON/ZiCVwUItpOj0MUDy//xaN1naeVDuNPPJE=;
 b=BQ2fdSZig61qUwl9kd1rZdO02qKxhvvy6Y1TbVLWEH0Z/0D53iGY/LqQhtwvQo57pIfjYUSEVgWTnoLZEBPybq9cwn9MJurZtKASHz/696sDdIbOzvuDKtkDNIZHXJi7IF33wib4JHieVdOHBPyI2B9H2+yDBm0imWItcs1IGJvvCm7SGHeHY1z61c3bzLBPNNYclhKJ5CtyLhrZ7pArtxuwdI6znvXYUnTNemcnJB0OvVeYqrJcuSYJTtOxMw1SM2JY26MwE58yrQg+R36eglqjCtBz7Ef/Y/xcDGKJy4hoNKWhr132r8cfxffgnrHeqP4kFc9B33FaeZJJTJa2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipkSOmeON/ZiCVwUItpOj0MUDy//xaN1naeVDuNPPJE=;
 b=mmJzrJ7v9ugIrbe26q2+HmHa+Lu7Jbj6DWFshceT3tMJAbVYkfe2VGfhqAoMHBQEw+5lUZuUMEQy02dZfidaOqA8qyaRLJUi4bYhduIuwy1doKFp1XsqMJ23x8GjryR4Kp9F6rVQk+H0ApOf31DJ44T/7sU8ylsSEuhL4gRUYro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:36 +0000
Message-ID: <875xpm9vh3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 11/13] ASoC: soc-pcm: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:36 +0000
X-ClientProxiedBy: TYAPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:404:29::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: c67cfd80-07bd-4975-e3bb-08dcf163409b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0XQBITJD1/vgvRFV36C6zdx5bUKmTmzXYJVYpP+mPFEJZdnDrfcHr99rkPyE?=
 =?us-ascii?Q?xJbuI0OO4+tAVDGeypke6o3oF3bS+f+tcXElOGNt10A5GkXBIgLE+4fGDUrD?=
 =?us-ascii?Q?Z73tsDDnsfwQ8Yne4k96ty4F4n3X+e5oG9AY9Ianc488AlGXR61ScGj+hzW3?=
 =?us-ascii?Q?EFhzjJB82yqvDWGjioGaLylZPSVdnzlTOy4krdcLgw79Fz0oU+UMNazdFKGd?=
 =?us-ascii?Q?gcccTlYs3w2qT3kuiWYz5NtZ9gKQi5uXRRjENWH/iPMCcNxxzfnRlO62bnGH?=
 =?us-ascii?Q?45XxXrZn2mS0H6FW7t9y2BH/Ou2Of3kcmgYD6QMPibxlnelMtlmGmgp9bLd3?=
 =?us-ascii?Q?sKnZi1Z/EBWoBK7KEeBQKHqnHSdt4NPUltNUVoCOLLEz6fJHKKeoEL6dDFte?=
 =?us-ascii?Q?EduoHFZcsyNAVbcNl4d6kmTLatNuYky8eTviG/i9hP4Rq/MhOkFu9grxQjbn?=
 =?us-ascii?Q?WgOmDZmgNMYaM4cnoT1vaEPQzZ++um7xIihCE3uzrsTA9S7JOylGV+xe+YlK?=
 =?us-ascii?Q?i6fZiICjY1Ujxfb6Gaqi+3NRfs2VcMP84LNjdEV+zNE9tsRy6C6FeZzGDIRf?=
 =?us-ascii?Q?BdSnKVGxhMJJKXQVUx7zOSHISno5hK2iL9wbwWiZ8/SpyXXYPA2zctxevUpm?=
 =?us-ascii?Q?oN4P41J5oDlPjTP9L0NXn5ZQAeBYdMWvFKRuzOjqj1eQH00qI0a4DNo66xFd?=
 =?us-ascii?Q?x2Okoq1UKXYGSZwMW594RtshTBQPQ8RbYivcPIWllDbrB1iKdKbeHw1Jncdm?=
 =?us-ascii?Q?CrCaUNuvmHY20Z/Os2qkrA5LlvFHt1HiHSDFjrF+KRofY6qFWSmchcqqL8cS?=
 =?us-ascii?Q?IwqypUmdWmtUmE0zSAzCyA+GjddtzJuGVKF8NL+9LbT1Qb+KCkg53E0z3Lz9?=
 =?us-ascii?Q?gTPVz4lN1dW1uszxnqG0mXpq58o8nl0qOAuZECnduuCHpbDeDd0yQfYiY36J?=
 =?us-ascii?Q?/mtoKhu+G+kAuYfs9ggKonBonRmfS5CFOVO3gkLqfppJDxBbMG1kTJKAbSjG?=
 =?us-ascii?Q?yRx76nCI198Ssm6GDeM2Rxkmrj+fLAdcmH8/GfDv8atMpjjFYsK9c8VBrMzS?=
 =?us-ascii?Q?Y7e6TZSI7nZFMZRPowlaz0PACywxBOgQLh/R03C21meKvOQ7mtNixVLjX5G0?=
 =?us-ascii?Q?W4EKDel01ghzzi1ysPuZ5leEXCof+2+Ydd00I7LrLXR0MbR3fGxbfl7SFfya?=
 =?us-ascii?Q?0YaGGfcxKqRH3KPLfE9yKdbDKiLRajryjrVWur4rFTMtlF3aGiyLoUgw6yo0?=
 =?us-ascii?Q?woHE9Euc5zST24/bmE3F/0RRV7eVVfemaXSo1U4keFuf1pfcjeZli9coY7af?=
 =?us-ascii?Q?I7Y2tdgWyqOZIUeoK+hkILxe5f9XUy6Y90wmBa0d7F+WxsEFD6bgiTfEAhn5?=
 =?us-ascii?Q?qK6gsxE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gwM5RIpK6DhzPHspx4OiE08Oe6miiUE8IWGlz7aNrKsHZ1F67eEMfavGOB7x?=
 =?us-ascii?Q?DbDXnuRn/bhOWBgiRXnV/QW29davnZ5ZQF9kETN57JJMcLSLgp7nhCsulzhu?=
 =?us-ascii?Q?24gg0UoKIU5JHNtt1ngQ8VApID8kBRgsWordM29vxv6DnEBD0kB0EWGlfkC5?=
 =?us-ascii?Q?te6fmRf5YVZrbbDOcA56ZH8Uw6OGQvdGymeNay8pYvz+voYXeaytQ3ynHDTu?=
 =?us-ascii?Q?CNsHmHDvg4gRgFqoxfNxbw9R/zFKvhZffeiCfAbOImpvOePjGvCb+YelunHH?=
 =?us-ascii?Q?X4veiboiyYHs6fGPUorK6bv/G4GoK/5ukGZUXxT/EbWz3UelLG63N+0gMrF+?=
 =?us-ascii?Q?7sxwO+yXXGdE+5tNAVZcT06iUPkOzrHNLnGdUVX+EWo1HVsV4k+dJicTKqV2?=
 =?us-ascii?Q?CzPTZpd0Mn9naWAe/QL25tVcVajGUQww1n6Jh0c14ijOkd0yDM1J8mEByKp7?=
 =?us-ascii?Q?uvX9fNYHnpcE4KXk+Wh13o3dZ5kvmBxKkiA8tQM+31VBC49PcAoKHsw2po7v?=
 =?us-ascii?Q?npISYfI4T/9PTNKo5Hl/1cSD6T3CWX/l74U6vJysXO7jpQpZU+MRaxjc48mq?=
 =?us-ascii?Q?FbGs2evS8/XxA2dnR28fXMPP0tMSpIx0NTEwgcOQkT7ukQLpvi0hSqy+Kqbk?=
 =?us-ascii?Q?uW2bp+NxzbWJ1bP/R3U31Vhju0jpDbwjGsN4MV34KYDd74Sh0s+CcXOA8JuI?=
 =?us-ascii?Q?xAsxnqvBmMuVUH5Ue27i68bCr5FQ+B+ac0gPMNE/027FHqqzc4YgvcdZNupN?=
 =?us-ascii?Q?bdjakorJ6XAOfPm6E7C+MyRKSTcoYD3T5FIZJpnuumsEgao42Ov2fkECB/ej?=
 =?us-ascii?Q?2Dlo51DSW1TF3PMplHMoBZPL9d5DLydBfvhBMmxQSxQuVjiaPwbcr16K4iYF?=
 =?us-ascii?Q?y0jtPRUMgFWDg0h3TDK4u5BrC4QJdPaHvBvbBBPxodAveWkTsKvqs/NrKB2A?=
 =?us-ascii?Q?HO/pISfMfw1Yvw4Amq5jNy+WAeMeR/qm0qKY+tWc9zHtQRXvvivFHhBQJZBV?=
 =?us-ascii?Q?dHr3EyJ2HEh9u1Z6/Z8Rszd3FR+AHLJVq7kMFTZorMLm0nD1DNo/7Iz5+tc7?=
 =?us-ascii?Q?Rf4d7Y7+WaiObD1BthKmo+LxTsBFUfDg1191DPLMec7LLsZyHqoZ8ueczBlb?=
 =?us-ascii?Q?bBLkmPRs4kwbp0zuApS+RAJ8IWj8+6rsLmrMwYvI4PisJSnuwwH8OlsFJAUX?=
 =?us-ascii?Q?okdn5ffgHSaY0p9uRqzSDQe8qou6NyD8ZXYWAiciItim4MKG2BdIaQEs/TNW?=
 =?us-ascii?Q?tg9voNWxmq+tuzYReiTRuF4BXTohhhc/NCbcu2ubt6h2M8gOQNhqrtXkCS4j?=
 =?us-ascii?Q?2KjC4wi3UlrRJJ070aghLBVvDzPGFo5rTy3X1fQ7a3NiPiKet+GTnBquzilX?=
 =?us-ascii?Q?3QBaaZDEMv4MaYRv1h4JM6ndV8VKyIxmm5jdFHOJmCIWXU3GnIC4EASUvYuU?=
 =?us-ascii?Q?3p14Cbivo6fQVQwp7an7AaLMVU/i5XpMfdwL1v/HnlpFqtfL0gNaPv8HhSFE?=
 =?us-ascii?Q?zr780jHUJK4RPWomEpSNBp615alNsvK/ghPJaYh/PzNJf9/HP/Hmi9y94xhU?=
 =?us-ascii?Q?KMeNue8Y5lIGxSK5PLmOOhXaU9D1Ju2KhwFUOTj6DvdbkvPsuIaCpNRgP77s?=
 =?us-ascii?Q?OaTMexXIEEzggnNleUOgwTU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c67cfd80-07bd-4975-e3bb-08dcf163409b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:36.8500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Y16Ej4ikkkcrhfYIKNdJQRa/eTJro5XoYnkyYm04HZfZ425g8SL5SXCpJSZgz4Zy3lu6WKYsdDfsJ0svK27/byjqtK41oc3tZpY+MRrizixlzZhkvI/tCAb41ydppo4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: K53EUCELOY6TZ6QOPXTC3NQEIFVTDIK4
X-Message-ID-Hash: K53EUCELOY6TZ6QOPXTC3NQEIFVTDIK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K53EUCELOY6TZ6QOPXTC3NQEIFVTDIK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  5 -----
 sound/soc/soc-pcm.c | 33 ---------------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8a1db45988ba6..3e72317e2c20f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -820,11 +820,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* REMOVE ME */
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e2c5300df0f25..5142d1abbc7b0 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2844,39 +2844,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_capture = 1;
 		}
 
-		/*
-		 * REMOVE ME
-		 *
-		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
-		 * as availability limitation
-		 */
-		if (has_playback && has_capture) {
-			if ( dai_link->dpcm_playback &&
-			    !dai_link->dpcm_capture  &&
-			    !dai_link->playback_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using playback_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_capture = 0;
-			}
-
-			if (!dai_link->dpcm_playback &&
-			     dai_link->dpcm_capture  &&
-			    !dai_link->capture_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using capture_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_playback = 0;
-			}
-		}
 	} else {
 		struct snd_soc_dai *codec_dai;
 
-- 
2.43.0

