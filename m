Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DEF894950
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 04:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB1523E1;
	Tue,  2 Apr 2024 04:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB1523E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712024693;
	bh=mhvyh3S28pgY0XczHMG/53UGAM6cbsEXfsT9F6ywXFA=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DCf/eDG37rRsfV29A81uf68Zqh5DYCZP101LzafoeZABmZPcyTS3cIypyH+CAXx9L
	 QagAO/eegE77+BlkPD/zfdWpk0VSmYpJLCHylhYZchMXRtSSNG40J6KPNJladdgKk0
	 99xEZSrHqvnSbDaAcSWRnlhtMkfqBae1yyUyYK68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5162DF805D3; Tue,  2 Apr 2024 04:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C80F805E4;
	Tue,  2 Apr 2024 04:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C41AF80589; Tue,  2 Apr 2024 04:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19A20F805D3
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 04:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19A20F805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QOSkQfFD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhfsvwZRAW3F5zLGsLi2bjsaQJzr7lc3NCwJLFJiXfnM4fVewv1frKrPVLkrX3vu/ZLssCRhKa+Ro4yYyvFeNaP7fNxtwMoF1fVV8RmLC2xnRvM2C/jz8HErxOdBYBB6p03NE4Pw/nNdlzDCWH9meDXqv7UaDL7oIm6/dR6zMo43YnUUXHUjySja8Ffty3bc3wts+XPqxCByR9oIu8v30Q1hbc6dDExg0GoXcwYCpXbxieT2FUArl4YMsVkhxxeAztpnwflrdxJ63nUQUA3JKkT6m8g4nGx7HVLTRUEjEApEaPMdIxIw8fMs2N7pIlYfobUCszjC5Bs89gSAHtiApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zqAoCmfvYyC/NbMep3oJx9Co9fwb0KRVN1FETga0Cs=;
 b=GJKIZ6GRrSShle+vI3U5Op3jmJKEOlHtzf5RxM1DZr514fTRDuDoMw+DGzpnXHCpmNMN+j4wdZRkysUbFOG+XNSXk1S1q4EHE5njXwWaGQpQN9RPStv/wFWjnulmPtb5a4lkJJUqH7MFUMEqFmc3D7wotmw4T26lnfsUSJXno0ve2olYTgRDx2w4Lw/gwmTcTKB17P9sOT0TNjdGfFDDWa9GfO7BxLMH3uuv3u8Q7T867Q6IF9E9gJ3yA+sDi4ijd2QVNtH1PLH8yYzqY0q2PjM0uYMHJYdhdC42bGLQm6Bni6JZhVAWs6oCAeAWru7QQ3xtKXYNIzn6tlkz9uTr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zqAoCmfvYyC/NbMep3oJx9Co9fwb0KRVN1FETga0Cs=;
 b=QOSkQfFDbn1y1Aq5+3vFmEPhDcvx6csJdUa1sNrspqz5poyBgcvMKAsL00b5JYaVBHqKlm+RDTiH7Nkk4Zd1V3Bmt6hi1s/w5aTS8DBtJq9oHuah8yV4t3NEBIVNWsgnn27QX6DQYZADe4mBRd/n+Y07YKXKk3SJCa0cIe2lvRo=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5959.jpnprd01.prod.outlook.com
 (2603:1096:604:d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Tue, 2 Apr
 2024 02:24:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 02:24:02 +0000
Message-ID: <87zfuca4e6.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
References: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: rsnd: don't get resource from ID
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 02:24:01 +0000
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	haKd0AZf+tegZYTL2DrahhDF51NfEBJbg03aaACaDxFBC50HnK/xoHtJDsgAmrshZOtuXJUk9ouMD2mDIGcM5mBaJV6xidQ1+fzRKOrqo3NLLdVTw1Ij1NTdVqLDXGQwDWVHsm2291rHYKjyuj23OMfGMnulvfQqExdk/A3dwHophC9LTHuhMqvbdZZSAAiC1QhKQFtaOSDR7xkKkazbznI7ZF89XiGz7bfTxs0XZhSttgYaByPQFuTdeEah9pScVkCTqKcJMUPzwF1qAV/yU50h3zjuXliuX3QwSNZGAuKhJFfr2QCJgPgGU9Mrw+VvIaKy2ENUvDrc9+zYxUnaNOLJVRk17QqS9MYWb5rQt8q78lV1yRgcWtY2TrvPAkXH0nNGUJc2uUO4qgg6ajxqO1BuM8Pl3aHfNbcV7z9/DWVagbQQlcju/6R0ryagthUEABWSCIxj6tImwRrA9FwhTSDKUrLhzjQB3yIsHXVPCQcm4M3s1XGUd5W4OKNUL8uCEolnKFo8teKuDsQZD8VW9J7lDBOEkP4MwLsETU/pFTGfsGwMwBMMm7bbjFBcJyAHFT1cMzb6d2TeF9q1leU43UY6Roa+OPdP3ByQeYzBrgSdVH/xdWzAGKJ9ZAdvwbXUMvOQMnLzbQp7zee6YcsqIPcGxCNgTMOLFapvkZmV/lz8EFD+B5Wr4vyLNsjX8Z3NXSgiTE6YGKH/vyDpnfPgIQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mEuANLPMlxHzOvpV/Ookae9GNjZJA7pxLv3jpo2BYHNqvvbMrHTn11HIBqye?=
 =?us-ascii?Q?o1o0n5wFYQY/FzcuItgXFSMuWEBzJV08hJhWiVDtRMxAw5QJKzYA4x2NnSJt?=
 =?us-ascii?Q?l3ubZ0OVAs2r3fGNVJEHJ+NVQVHNobNQoQCPzdAdbmCM4LbdeLz9pkmyU4YZ?=
 =?us-ascii?Q?og2bipe5CEDFPhtUsXbhGVCXrEtpWDLf+sAoTfrBCxiyHOGIEmF5KMnhs2Ng?=
 =?us-ascii?Q?OB+/3grKywnImq8k3tOIviObSlIKB0bOOrxaV97F5RHcXC/GxKZrP46QQqYC?=
 =?us-ascii?Q?jW3HC7XMHP8I3EoNRNOQvaL4AWicUzEWdORRl6pvaxiZilNynR6/Iab03qS7?=
 =?us-ascii?Q?1PPqZUzmNRyDhA2Zfqb4aBRJzQP+vXBNq8IODQ3nLJnov+GgBUZ69YwtqENo?=
 =?us-ascii?Q?+kYSctbFnNJtcG9K9XjO5C/BHZM2zxMaZohIQP+IVn3RZwMtWTDYldrkHcCD?=
 =?us-ascii?Q?99p2FOaqOC3l75v3WnUp0+sZ5epS7VXPlxQrTWBjzaGbpyKyEY9Elb1mgeBJ?=
 =?us-ascii?Q?UOrTvWqiCnKyH5i6zVq1zSA79IwIhRqsCQwqqGOgWCjrx9JEa69UnnTTLpCl?=
 =?us-ascii?Q?OLj03ieBAH7/QRR8o9qhrg6viyhIX1HWYcJJV+ssot/rdOYnLkT2IgHZ3Fwk?=
 =?us-ascii?Q?HGegRI7T6QwB8ZgrNuCJotlSGp2i1MtzweYWB0N4tYuUW3h+baDhTQa3STS3?=
 =?us-ascii?Q?BJ7sqc9iwLRVQCKb2yeq4Swq9xlghVknpy5DuqAM2IwIQZO3+nn6R6M9MGkl?=
 =?us-ascii?Q?LUB1mfHKpP/03I4hgzFaBcnpHLcvzI0891rrmUDPgmB/4Tmgh/jOGEN+mznQ?=
 =?us-ascii?Q?YvmdXA+VyLvmC4TNnkB8I7Xx97puJsoPa9SOPYienkw/QRU8bcHf6MIozwBz?=
 =?us-ascii?Q?Wozecb0Hb896bMVpkd1qReBanGrGo4F9B+HGWGql69bW1FEeXHZeRPXDabto?=
 =?us-ascii?Q?Sc/xFi9Utg5ZMueJbIAKTpXbT0B2DcwjeIvjA7ILBD/A6G1jcBfa1lejb3R5?=
 =?us-ascii?Q?0sZUEyKCs32sSq1HZU3HuD0F6ROn49Yhlq54iEjoJi+sE/3ZmKOSW6YnjQeQ?=
 =?us-ascii?Q?hmiRtdo+cREhgwUlHSuWwiKN1E4siyxppOkY1/inGhm7WJHoDXOTD0Le+Dog?=
 =?us-ascii?Q?I86rE7btBp/rNfkCPb/yju/PFxENlojHNdhpWrnSAbiNrY/Iex6pErVeoN0a?=
 =?us-ascii?Q?g1zQ0BQ4jrcrfY7HqNAVjlkLUZBhPbKWggyQCe/Qfi19jJ4GnzsMXrJHIIW2?=
 =?us-ascii?Q?rOdPlFiTCvLE/D0y+lApkwLisuGFpbabmI7bPgsJzCr/wLiz0cU7TFYetWYZ?=
 =?us-ascii?Q?xWbyE3YVVsVtXd4GU+Vcuz/SfXO4yc5eMRMTDPNGOdubqQPGEuKcQi6jACBa?=
 =?us-ascii?Q?AB2Ux3Kz8YO6MlGhAfdFq9PTTelpqoa9wyEBVCRMq86s906EIAo9AiBksk4p?=
 =?us-ascii?Q?VfRpcovZkVZKGJYPv4sI5ZTFGPc5LENpwLoyPFyohtPwnhiD8sWKeiLM9oW+?=
 =?us-ascii?Q?Vhigs05ULPnww5BPUb9DxQY5jaYEniukgngeadZurVGGAtcCyiurSgyL12dc?=
 =?us-ascii?Q?K6YTrqcUpXHORnBDn/OZVT5+a+S4t9LLXmAtxaPHtwP15A3K5lSzO6y1bz5x?=
 =?us-ascii?Q?btJw/uBRlWPTr0AUnlQ1wfk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb47a454-aecd-4af9-0973-08dc52bbf5fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:24:02.0059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SCwuSAIdSSiDIw+qwGKnRvfEJBcswl6FAzoN1vMkEVMl8nW9gAdw6Oj482braUM2rvinI6LTdFLzhDaBXhqGe+3/EvLkaznL84I078Rv9OL+SOfp3obH7DdfOJgNHHkH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
Message-ID-Hash: 2OJD33J3ASS6X4QSUYL55G7QTXEH73UD
X-Message-ID-Hash: 2OJD33J3ASS6X4QSUYL55G7QTXEH73UD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OJD33J3ASS6X4QSUYL55G7QTXEH73UD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All SoC has reg-name, no need to support getting resource from ID
any more. Remove it. To get physical address for DMA settings,
it still need to know the index, but it is no longer fixed.
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/cmd.c  |  2 +-
 sound/soc/sh/rcar/ctu.c  |  2 +-
 sound/soc/sh/rcar/dma.c  |  6 +++---
 sound/soc/sh/rcar/dvc.c  |  2 +-
 sound/soc/sh/rcar/gen.c  | 22 ++++++++++------------
 sound/soc/sh/rcar/mix.c  |  2 +-
 sound/soc/sh/rcar/rsnd.h | 19 +++++--------------
 sound/soc/sh/rcar/src.c  |  6 +++---
 sound/soc/sh/rcar/ssi.c  |  2 +-
 sound/soc/sh/rcar/ssiu.c |  2 +-
 10 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/sound/soc/sh/rcar/cmd.c b/sound/soc/sh/rcar/cmd.c
index 329e6ab1b222..ec086d8e4d44 100644
--- a/sound/soc/sh/rcar/cmd.c
+++ b/sound/soc/sh/rcar/cmd.c
@@ -119,7 +119,7 @@ static void rsnd_cmd_debug_info(struct seq_file *m,
 				struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod)
 {
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  0x180 + rsnd_mod_id_raw(mod) * 0x20, 0x30);
 }
 #define DEBUG_INFO .debug_info = rsnd_cmd_debug_info
diff --git a/sound/soc/sh/rcar/ctu.c b/sound/soc/sh/rcar/ctu.c
index e39eb2ac7e95..a35fc5ef8770 100644
--- a/sound/soc/sh/rcar/ctu.c
+++ b/sound/soc/sh/rcar/ctu.c
@@ -284,7 +284,7 @@ static void rsnd_ctu_debug_info(struct seq_file *m,
 				struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod)
 {
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  0x500 + rsnd_mod_id_raw(mod) * 0x100, 0x100);
 }
 #define DEBUG_INFO .debug_info = rsnd_ctu_debug_info
diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 1c494e521463..7b499eee5080 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -585,8 +585,8 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 {
 	struct rsnd_priv *priv = rsnd_io_to_priv(io);
 	struct device *dev = rsnd_priv_to_dev(priv);
-	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_GEN2_SSI);
-	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_GEN2_SCU);
+	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
+	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
 	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
 		     !!(rsnd_io_to_mod_ssiu(io) == mod);
 	int use_src = !!rsnd_io_to_mod_src(io);
@@ -666,7 +666,7 @@ rsnd_gen4_dma_addr(struct rsnd_dai_stream *io, struct rsnd_mod *mod,
 		   int is_play, int is_from)
 {
 	struct rsnd_priv *priv = rsnd_io_to_priv(io);
-	phys_addr_t addr = rsnd_gen_get_phy_addr(priv, RSND_GEN4_SDMC);
+	phys_addr_t addr = rsnd_gen_get_phy_addr(priv, RSND_BASE_SDMC);
 	int id = rsnd_mod_id(mod);
 	int busif = rsnd_mod_id_sub(mod);
 
diff --git a/sound/soc/sh/rcar/dvc.c b/sound/soc/sh/rcar/dvc.c
index 16befcbc312c..f349d6ab9fe5 100644
--- a/sound/soc/sh/rcar/dvc.c
+++ b/sound/soc/sh/rcar/dvc.c
@@ -294,7 +294,7 @@ static void rsnd_dvc_debug_info(struct seq_file *m,
 				struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod)
 {
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  0xe00 + rsnd_mod_id(mod) * 0x100, 0x60);
 }
 #define DEBUG_INFO .debug_info = rsnd_dvc_debug_info
diff --git a/sound/soc/sh/rcar/gen.c b/sound/soc/sh/rcar/gen.c
index e566712e5234..d1f20cde66be 100644
--- a/sound/soc/sh/rcar/gen.c
+++ b/sound/soc/sh/rcar/gen.c
@@ -177,8 +177,6 @@ static int _rsnd_gen_regmap_init(struct rsnd_priv *priv,
 	regc.name = name;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res)
-		res = platform_get_resource(pdev, IORESOURCE_MEM, reg_id);
 	if (!res)
 		return -ENODEV;
 
@@ -425,10 +423,10 @@ static int rsnd_gen4_probe(struct rsnd_priv *priv)
 	 * ssiu: SSIU0
 	 * ssi : SSI0
 	 */
-	int ret_ssiu = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_SSIU, "ssiu", conf_common_ssiu);
-	int ret_ssi  = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_SSI,  "ssi",  conf_common_ssi);
-	int ret_adg  = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_ADG,  "adg",  conf_common_adg);
-	int ret_sdmc = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_SDMC, "sdmc", conf_null);
+	int ret_ssiu = rsnd_gen_regmap_init(priv, 1, RSND_BASE_SSIU, "ssiu", conf_common_ssiu);
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 1, RSND_BASE_SSI,  "ssi",  conf_common_ssi);
+	int ret_adg  = rsnd_gen_regmap_init(priv, 1, RSND_BASE_ADG,  "adg",  conf_common_adg);
+	int ret_sdmc = rsnd_gen_regmap_init(priv, 1, RSND_BASE_SDMC, "sdmc", conf_null);
 
 	return ret_adg | ret_ssiu | ret_ssi | ret_sdmc;
 }
@@ -443,10 +441,10 @@ static int rsnd_gen2_probe(struct rsnd_priv *priv)
 	 * ssiu: SSIU0 - SSIU9
 	 * scu : SRC0  - SRC9 etc
 	 */
-	int ret_ssi  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SSI,  "ssi",  conf_common_ssi);
-	int ret_ssiu = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SSIU, "ssiu", conf_common_ssiu);
-	int ret_scu  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SCU,  "scu",  conf_common_scu);
-	int ret_adg  = rsnd_gen_regmap_init(priv,  1, RSND_GEN2_ADG,  "adg",  conf_common_adg);
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSI,  "ssi",  conf_common_ssi);
+	int ret_ssiu = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSIU, "ssiu", conf_common_ssiu);
+	int ret_scu  = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SCU,  "scu",  conf_common_scu);
+	int ret_adg  = rsnd_gen_regmap_init(priv,  1, RSND_BASE_ADG,  "adg",  conf_common_adg);
 
 	return ret_ssi | ret_ssiu | ret_scu | ret_adg;
 }
@@ -460,8 +458,8 @@ static int rsnd_gen1_probe(struct rsnd_priv *priv)
 	/*
 	 * ssi : SSI0 - SSI8
 	 */
-	int ret_ssi  = rsnd_gen_regmap_init(priv, 9, RSND_GEN1_SSI, "ssi", conf_common_ssi);
-	int ret_adg  = rsnd_gen_regmap_init(priv, 1, RSND_GEN1_ADG, "adg", conf_common_adg);
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 9, RSND_BASE_SSI, "ssi", conf_common_ssi);
+	int ret_adg  = rsnd_gen_regmap_init(priv, 1, RSND_BASE_ADG, "adg", conf_common_adg);
 
 	return ret_adg | ret_ssi;
 }
diff --git a/sound/soc/sh/rcar/mix.c b/sound/soc/sh/rcar/mix.c
index 1de0e085804c..e724103a2e8d 100644
--- a/sound/soc/sh/rcar/mix.c
+++ b/sound/soc/sh/rcar/mix.c
@@ -259,7 +259,7 @@ static void rsnd_mix_debug_info(struct seq_file *m,
 				struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod)
 {
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  0xd00 + rsnd_mod_id(mod) * 0x40, 0x30);
 }
 #define DEBUG_INFO .debug_info = rsnd_mix_debug_info
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index e063286cc328..45cf21320280 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -20,20 +20,11 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 
-#define RSND_GEN1_SRU	0
-#define RSND_GEN1_ADG	1
-#define RSND_GEN1_SSI	2
-
-#define RSND_GEN2_SCU	0
-#define RSND_GEN2_ADG	1
-#define RSND_GEN2_SSIU	2
-#define RSND_GEN2_SSI	3
-
-#define RSND_GEN4_ADG	0
-#define RSND_GEN4_SSIU	1
-#define RSND_GEN4_SSI	2
-#define RSND_GEN4_SDMC	3
-
+#define RSND_BASE_ADG	0
+#define RSND_BASE_SSI	1
+#define RSND_BASE_SSIU	2
+#define RSND_BASE_SCU	3	// for Gen2/Gen3
+#define RSND_BASE_SDMC	3	// for Gen4	reuse
 #define RSND_BASE_MAX	4
 
 /*
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/sh/rcar/src.c
index 3241a1bdc9ea..8822d50b6d86 100644
--- a/sound/soc/sh/rcar/src.c
+++ b/sound/soc/sh/rcar/src.c
@@ -606,13 +606,13 @@ static void rsnd_src_debug_info(struct seq_file *m,
 				struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod)
 {
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  rsnd_mod_id(mod) * 0x20, 0x20);
 	seq_puts(m, "\n");
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  0x1c0, 0x20);
 	seq_puts(m, "\n");
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SCU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SCU,
 				  0x200 + rsnd_mod_id(mod) * 0x40, 0x40);
 }
 #define DEBUG_INFO .debug_info = rsnd_src_debug_info
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 0a46aa1975fa..8d2a86383ae0 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -1049,7 +1049,7 @@ static void rsnd_ssi_debug_info(struct seq_file *m,
 	seq_printf(m, "chan:            %d\n",		ssi->chan);
 	seq_printf(m, "user:            %d\n",		ssi->usrcnt);
 
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SSI,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SSI,
 				  rsnd_mod_id(mod) * 0x40, 0x40);
 }
 #define DEBUG_INFO .debug_info = rsnd_ssi_debug_info
diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 17bd8cc86dd0..665e8b2db579 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -413,7 +413,7 @@ static void rsnd_ssiu_debug_info(struct seq_file *m,
 				 struct rsnd_dai_stream *io,
 				struct rsnd_mod *mod)
 {
-	rsnd_debugfs_mod_reg_show(m, mod, RSND_GEN2_SSIU,
+	rsnd_debugfs_mod_reg_show(m, mod, RSND_BASE_SSIU,
 				  rsnd_mod_id(mod) * 0x80, 0x80);
 }
 #define DEBUG_INFO .debug_info = rsnd_ssiu_debug_info
-- 
2.25.1

