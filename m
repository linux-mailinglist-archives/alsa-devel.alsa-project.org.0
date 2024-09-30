Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B93989930
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9EA21A2;
	Mon, 30 Sep 2024 04:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9EA21A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662687;
	bh=Vw2xYdXdckIo0v/pRr6zwYaapVl4vL3esBItTt93teM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IDU2JN3HucNMjvUuMBjVB5b31QzEmT53XKSUrb4GLtzGbStCducLsT62kaia6l8gN
	 w46JntMk5VAV9kdSKEnq8HoaBEs21zraz8qzI0tbOrxBxDG6pHtaOsMj2rrRcc9Pyt
	 761ph7xdWmQ/rcxduox39KbJ7Jk1Zo//Jwfrlyi0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79060F805EE; Mon, 30 Sep 2024 04:15:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B93B6F80806;
	Mon, 30 Sep 2024 04:14:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B3A2F80806; Mon, 30 Sep 2024 04:14:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B76BF805EE
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B76BF805EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XBxDYyHK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcq0C6M8a/SRGmgPavsxHJ/fWDhYN6mCe2ODm8hYN49m8yFIkHK6Bzwd3Bm/0tvHbH1cVz2iUBUMXC92mtQmKNTbhaG36qkllXUHf84o6pVstN4/nct9Tcn1I2J3DUvOZhhfoWUHJQ41FBnLXrP1urgLCHnWZM1uxCTyB7bZOAlXnWGDzlhnqm0cK9/+0E7Rc3bWsS/8+Jjz5j1JalSDo5cSQceFky/nyvSoE8RYq81Reb8XJ5zM2v/eKpzzkLGFkvzIW1sqbpLFYhknw4c6K92F5R/uG3jzM0ImmxRyzghq7wJSBIjwPc7Jatn7lmbzuVMo/7KMBoufnFiXQKjV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOovbfK6vR/xOXcpsAN/tbbxAML/E0D1rQC/dk4nId0=;
 b=fAb9BoGwHiyfyfeae44Hm1tKGPTTr4dNdIX2T/1D9/kzhptkp4NEhxh241mRDejzkx9GwPrmjxNkHf8dS4izJOZR4X81SixCy0WWiqNERclpRNxLce9Sqh1/dyIaifYK+8IYI+oxt1wc/s2XY6PBhbr6yXKRZv8AQrUTzJVgrsieu3iZvv/ctSAKkKJoaPABAI6NIVe0WJEQWDbhcjU90Ru3yz5NbUioZ6ftujQc/Ok9lCzVjjYf7TTOq1wjT30U4Icz8kRMPqYrXeh+k3stoxYqmhJcTkgF6yKA0CaiCYTgaOw+0HncbrGzpmXd0Bs0nSXzuA7BqmCk+BFyHC7c7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOovbfK6vR/xOXcpsAN/tbbxAML/E0D1rQC/dk4nId0=;
 b=XBxDYyHKbyqbY9psHRa06WSj8kGBDBdWqaRMDwWspHSbVnzmc+4hf2SfMr8bLs0AlKx7xQPGZOBVV/3UEYbdTocffHA7BOg5OY0G2YJdZOdgyk0ar8jyoALT13uVQRYR7hmwKqTpzC3WSNfKNCKbeiqvGD/U5sm4LBNs9z2wY9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:47 +0000
Message-ID: <878qv9lwfc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/13] ASoC: soc-pcm: merge DPCM and non-DPCM validation
 check
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:47 +0000
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f06f06-7932-43f3-0091-08dce0f5a83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vKAH6fG46PoMI/qQQqXIw6KLXSXp0PuQwSqRuaSw2qbpta/QohTxqedgHssD?=
 =?us-ascii?Q?uqUVGdMoiDX9reNFBN+Y0I31gPAg6EoMVHxPkVkRMS0dDf/LgukE8Z0joE0K?=
 =?us-ascii?Q?ic4VlkQ+9oX2BwU8jHwMtsK+yFdYpGkaM0Xcv7JxWna/2ko35FtG8mRe2vPm?=
 =?us-ascii?Q?pkBdlUn5H2QOQD2dJF4D80JQ03LtvDs7he0LrTbDRpKLQtqdoxs6ERo76A1w?=
 =?us-ascii?Q?FNwr1kqBj4k3nmidEOb747A58JfYuHp06e6HVheVieeK80bHwRIB3FhnIKQo?=
 =?us-ascii?Q?mECnRZumQ1XdLl0D/XSxYSZYm0BfEcGHUQe0PazSZqX9wUoCuCIqtAd1UHv1?=
 =?us-ascii?Q?uqioqr1MrADDwHimCz8P03UBgulB5bSa/h7qUxzvGPLJ0lx94j0QyJ1vCU8O?=
 =?us-ascii?Q?cnhMzALz6oK+Hyf2gCXj9uOZgwZ/fXHO9BpM/uHrMzPC9Rf0V/rr9XfYPzcM?=
 =?us-ascii?Q?/78g4MXCVTqNARSx5LtLobr8Z4BvFJF+ZZ/8dy52rjIsIPOpfWWSO4uR5PTZ?=
 =?us-ascii?Q?GKuGwyhb5XEQcIoX2o6IgK3TVPfDL0G6eCYlKNJt+sBRrGIwwd2p9RVHDvT0?=
 =?us-ascii?Q?gfDj30yufYuhCaCX8aj2Rh5lcGlcy209/vBb6DcgYrEunDKQ7LZCoqbyq80I?=
 =?us-ascii?Q?SZOQiw+/NtPRFPo76VsCfVX+KJexxhCfvnQg0sRuFGsecWnfJqJlaGF3O0Xe?=
 =?us-ascii?Q?LpkKSIu/xKfBYMj4JZcQQFi966dVA7R6mizP9FVW6/5GBVbI4PS4JE2VMym2?=
 =?us-ascii?Q?HGEXk0qBAhQcoeS6qIOBKUf4IkKuINa77SLAHSUm/EJ7+UE2iYGPfSdY7fbB?=
 =?us-ascii?Q?6ML3LrjesMfy8NhjnMo/F9MJT2/gcRGfB6Mgp9w8xUCTHTyqfv7Ezis5y7vJ?=
 =?us-ascii?Q?2BV6TWetOQXSz5gACkLpHUfjggJhSCZAXWH6PQniQgtwlAgYODo6K8ySONnV?=
 =?us-ascii?Q?HVWEMi5W8ZzSMsuPGwqd3NbMh9AcxXr82HGn9QRI4UB9b6NUmO5mWzfGmnYt?=
 =?us-ascii?Q?SWw2BYvtxLLzWYGY7+GqvDUVzA93W1AiBbiLiJBUKye7btLvylDP9K21WXj2?=
 =?us-ascii?Q?G9ya1jEHwZWQmrkcJ6IT3xUOFBc+2JOvXbB/1aNSY02+rKaOwSm4l8Ev+vEE?=
 =?us-ascii?Q?jeBl0DpOWpQa4J4fQnkRmAhSm+4mHHN5SrMPEwLkxhzdlsCsja2JtuCcGV1l?=
 =?us-ascii?Q?LuJn6ATTwNyH+f2vldrW7vBpiLWjDCuwPi8bwV0QVXacFE7E28FV1/Sr3y3W?=
 =?us-ascii?Q?VkO9Es+SzacEgZcdV1+M9M+ptonEcFHlHTHCiAGauZ3vaKn3vBzRkGoYiiSe?=
 =?us-ascii?Q?w9tEA/N5u6zqoHLjNQ1cZJbyfs0PwtvnCR6ZexbyONb/ktnRC+BeGdOxxj/N?=
 =?us-ascii?Q?cwQqbs0b3IilF4ywbUx8MHHYCtuhZ4hBUCym9y5tquY2/78HEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gx2TcEaFQZNjoB4TfKEovps01+sKO4qYFmi7At3z4rdZg5HG6S0DDjX5iS6Z?=
 =?us-ascii?Q?I+1qSgLmwpNrjx8LfYnhGQQ0YQfiLqVSb9+LBTtgUVgWrUjperiW/GfPvlOb?=
 =?us-ascii?Q?5bOteKvC1Qyyv5JHs6u9YiSDT7TWfArr/8BGsw3RF2t3M+EfXIV9iKm5CMoI?=
 =?us-ascii?Q?QQZP5xa1AiFJmkLo9WIH1IImogCx4k67cZlatS+CjiDdHcQKs7vzQT/w7KId?=
 =?us-ascii?Q?g83SlEQmX8YKrqvG81gkecG8UNT8Ppo0jCQpxrdMt8vKvRyJja9Ev8u8kt+T?=
 =?us-ascii?Q?WRTTu4j5uEb1wUWcmLwei3wrgJX8UAbTpxK+uriHx+WYnJunWlelS/Ib9thb?=
 =?us-ascii?Q?iRI12QaxJMUdu5Qkz+0qE+Ikb5i+aQw20CA1tKg45RinBNnY5E19YjAuTqHz?=
 =?us-ascii?Q?TSUy9+bxTg2Hu4+YvngicbcfzmDgvgIApOxQJNAAXk0CxkswGL6ClJMTOAJb?=
 =?us-ascii?Q?d95jDKdtJuDMhwI7nuGgvmX6oXd/kk868Y1euO2wWNCU3ZOKvDTkl0TWdDe1?=
 =?us-ascii?Q?G0ZOZVhX4cWt/7zoenPWSKjr0D/1fvTYpC80nx0C81d6PjKaYpx2/vOW+jMO?=
 =?us-ascii?Q?whqeuXuImJBNsuTrUZEXxB3mg3XfcSqWH+EaI4y8bpY11vJLhQal55/rDLF/?=
 =?us-ascii?Q?2EPhP4eqCkO4C7AUHVXnJQzPfj2IklZ4VW/iqfEGcre5b6rZ8LaC/Q9NgpP3?=
 =?us-ascii?Q?QwLTKCVTj9hye2Xs0DWE4LmE/hM3EvxD1z+94XGgkPOMGcx2lwYfKgqSwxPr?=
 =?us-ascii?Q?XaAmjhL+NNDJfPFVd6dTOvuTZ7pM8kfwep++nGdf/E45N0GghcyPyh+cOR4H?=
 =?us-ascii?Q?2S1Xl+klg+LSRfhhoWjY3VtfCRfL1XQq0xh0r6yULhV35X9frCOU1YUNKnXh?=
 =?us-ascii?Q?9KNFboEtE87sMsQmrcsAFx3MhAcU55nfERhl/+NZNnL6BV9hgy2xVqhn0BT+?=
 =?us-ascii?Q?Xr7KciizqlfGdnOdJglDfrU0hX7YgI59OzhBFSNwIWyF8texXLiglIYZ9TRp?=
 =?us-ascii?Q?aOpEDPkou0whWuPHTYfzaV6+57WNiQRDLBni+Pjl8Tb17VizLjpaao1tz4vI?=
 =?us-ascii?Q?GuIN/ysTMvYykVqb5bnbeTJqwSlNTeJnf887MxpbxnBcWdRbWRzuW0As1Qm2?=
 =?us-ascii?Q?/OMbhBwB51lVWQ5oGB+NbFp2v1mJG9S54o3jjnhoWEH5YLVAcvQXSb1Rvw7m?=
 =?us-ascii?Q?WIxfGSwgpD57Zh4f2QGXM6CrtB9ktmVR2SMtck+NAAlvw/PeGAlxw8hKr3tl?=
 =?us-ascii?Q?M0M+cDs/5ZAVqItICFAm+5hdbptUgCjvqtjJve7/FjKb1g/SzsUnp8JRjD89?=
 =?us-ascii?Q?wgfWKpB/q8CmtfxECLi++6ycDUTI7C4MtfxwaBa1kYgqjhzhZ2d3L0VVM9VA?=
 =?us-ascii?Q?pSaNpy5j3M8LDBdHUzjgWyTmApg1Qm/MuBhm7grdvBMfI6EGTjW4hg+ruOrh?=
 =?us-ascii?Q?HgtXpuHOPRJHGlBEadIQC4BZ3qLiaXTlSVmj1bg6Q3JWiHIkUFhMaddfsQ7i?=
 =?us-ascii?Q?i7jLIDRyFCcrIl4hqLHGZL8Avhou9ZWiBe1bcKUrZrAW6teqLymyKMx80dVS?=
 =?us-ascii?Q?hqr9k7onEARi7hmdQqgyL25ANcfwv4ZVdnswB6xtVmtNbSQhp1RO/QdkyUPE?=
 =?us-ascii?Q?SqHLHNokDl1nCwjsktqcYpo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b9f06f06-7932-43f3-0091-08dce0f5a83e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:47.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3sggcjDT8NhjYuauZ4GKDmslE5ZbgWdrt42dVjXx8uPrWVNmFm/N1C93cht8lY2Jgr2NGILnbtGuz7DUP0ckIXVLqamHceYI3Yoc0/IscqtzUPlY+/z/qsF2wfk4QLEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: 3JIINAIPK3H5G5ODA6QPLQEDKA7HACHM
X-Message-ID-Hash: 3JIINAIPK3H5G5ODA6QPLQEDKA7HACHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JIINAIPK3H5G5ODA6QPLQEDKA7HACHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DPCM and non-DPCM validation check are very similar. The big difference
is that DPCM doesn't check Codec validation. This is historical reason.
It should be checked, but it breaks existing driver/behavior.

Anyway, if we uses dummy DAI as Codec when DPCM case, there is no
difference between DPCM and non-DPCM. Let's merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 62 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 27810f6f86302..76cfb6b115445 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2838,7 +2838,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
+	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
+	int cpu_capture;
+	int cpu_playback;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2848,40 +2852,38 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
-				has_playback = 1;
-
-			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
-				has_capture = 1;
-		}
-
-	} else {
-		struct snd_soc_dai *codec_dai;
+	/* Adapt stream for codec2codec links */
+	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
+	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		/* Adapt stream for codec2codec links */
-		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
-		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
+	/*
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_rtd_ch_maps(rtd, i, ch_maps) {
+		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 		/*
-		 * see
-		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 * FIXME
+		 *
+		 * DPCM Codec has been no checked before.
+		 * It should be checked, but it breaks compatibility.
+		 *
+		 * For example there is a case that CPU have loopback capabilities which is used
+		 * for tests on boards where the Codec has no capture capabilities. In this case,
+		 * Codec capture validation check will be fail, but system should allow capture
+		 * capabilities. We have no solution for it today.
 		 */
-		for_each_rtd_ch_maps(rtd, i, ch_maps) {
-			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
-		}
+		if (dai_link->dynamic || dai_link->no_pcm)
+			codec_dai = dummy_dai;
+
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+			has_playback = 1;
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+			has_capture = 1;
 	}
 
 	if (dai_link->playback_only)
-- 
2.43.0

