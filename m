Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE786894952
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 04:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99132393;
	Tue,  2 Apr 2024 04:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99132393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712024718;
	bh=2lWNtk02+KG24CiDtdD97MfK3INjyYbowMj4JPnwLRo=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AMpI0pt6HqoWTS1pKdd6hDX4PyBN6PU8Nw34of2aRIuzL/aWu5khzzr+B2W83FkPt
	 nMxzdVI+wmoKwFroyWrdvdS3W0B6pTAYhp9sorolvd0DkXpe4eEU1z53g5nBYnIHTO
	 85w0/xSDX5SagqZtTsBhgCrWJ2JV0y9bviqyvdQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 719ACF805FB; Tue,  2 Apr 2024 04:24:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9468F8057F;
	Tue,  2 Apr 2024 04:24:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9721F8058C; Tue,  2 Apr 2024 04:24:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13BE2F80588
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 04:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13BE2F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e1DqH8zD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fkxj/16aCtImDUmXPlpi0sVS/kVNb5roG2ZRjQYipRIeyAMeM0bxikMPip6h50rFlyZpi0O2dpKOT3ZPOibKLlpdtzhJfxTacu7ADoIEbUZbSMkfkasCLjWJ3sk5EhbIFYGOzlXwU12SCn7Cm/jbAXhs3sCxC29K2Dxji2UH70wHV1lBVE1x0GicBC3ywpkI3C8qi/35yhobXsjpXz8MFgdvGGFIAsbhJUXU+RH/jSQFNarubqpUDV10XFd3wKG980YAhD2QjDshFt3VXQtF1BE/19YFtZ2VRkiOIjhX8f4TXcbNihyns/S/HZoUYV5mvQKZSC68QYnQBPGv8axHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orD9JULd8gZB1HLcn3gMSsTpzHeM6sW2XxzS/XYoDQ0=;
 b=iyJ+MHSsc3NxasElOkG4I4sCH6IyL3aGQ7NJyyiAYGAmrJCmanS/o3tllmBzldH/t7ATJ4rcW3UDFACYQAVhN0lW56D4363tn9q25IAia3eoPADr4LMjdGXdOrDH45+DlObJSM5rpZx8ppDSAwasu8UGfaHhAj0xyt7tVHCP4w+M29jsnsQpVM8aLFsSwsA4RB4HF/leomWFerFXCtvhbykfWOjcpscWlwXlY+TN08vEEXM+Zu8Y36TBBES/MoSPlAddwxTxykiUCkQxU79uf5kX+VyK4i2wR3bZei+GEx88AnDnr02s4ugoghsPT64tTbQJtgKByzXKQ1KFnqwgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orD9JULd8gZB1HLcn3gMSsTpzHeM6sW2XxzS/XYoDQ0=;
 b=e1DqH8zDo54vwhGzeMwAESFYQLItyNhkSAVoW2klzSKlOK1ZnFU/UYgIq179y0ZPMIavN8vYp79rk6t/OiAebAzEwJ8CNZtI3H6mB7Up5Sle8rJnfHWQiwDx/D7V9KH4F5OLWr4AKOIcLa7ydXUGcMSdWICt2Ye2ZeMipz817T0=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11608.jpnprd01.prod.outlook.com
 (2603:1096:400:370::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 02:24:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 02:24:09 +0000
Message-ID: <87y19wa4dy.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
References: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: rsnd: rename rsnd_is_e3() to rsnd_is_gen3_e3()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 02:24:09 +0000
X-ClientProxiedBy: TYWPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11608:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IUaG//lSvF5Q1XiK99Ta6IgUHG/9YIfoUPDw46uVbKM3X2HqG6vmKrGeinT3WEAqjGTxHuEKBtXqw+tLhTmGENMYzlNBV+pmTD4Bd4xDM3BwKzIwWTkfrd1v35FLCM/aW3wqU4ma9wIbrgx8moyzNyyGmmtT9tAFmGXBQXSAxGnzyuxgbrJdcIbTG8S6M1i9pxrzu1VUDQafsEGp1l6EgPCWlyDwx8lGix9DSKBBgVZjphp6dEh2GzvqKKrjkmkBssnMzoAisCQIBubDa53Ur+lokANqM+00w01EnLdKrg7DR4yYmoFKbjMywFDg9TBvvlgM16pkTZqUlVzYRGRshJEuNP/U907XewsZp9gWtC6hHhc9f8q6/FS55NAdcCxQ2f/ofG7KGVTIAnfYYuV8BZmnXfJSldQpsOOCUYFMqaLjNymvNhEjNBDhi1NZ7WI2HVfTrV+hu0tgzQ/04ioqQaDn8/6dHEmypozIEnR78RBEwkenOeJMcu/BW3+CI6xGs3DiWCjqhya1jByklQp2PbCqZPeRS0e+XbMbb6ufhnCU5Ec7um+npET5wwl9aFOhUqSwFBzXdUPbgolPAGHUhvgKOALcwwU7eqBdTUYn4JDg3JqRw1BLwVE557Yqf/ZghwoqG3b4KGkQhIGt2cg7jxfOP3kTeHEpWlwzSFr8nNq1yiB6cxkNOHrLDvjliaiX9mfoEqwmZFBLZWjCyA0ADQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+jw2NHdJ6gQLFt3fzX5JoiZ39gG5SfNN/yzKegojJcTcqhdJ1gHZ/+x4+Hap?=
 =?us-ascii?Q?vhuGtBnHzTu3iZDNQRc3252ZUaAqlUsw5dtN+10ozJeXdWmhYowdVkOwWwV/?=
 =?us-ascii?Q?cFH0ZXi50X9B/4J75xEyGumLwRZG7LZD42ko6YkxFlq26oOcGyvawf5AFf6D?=
 =?us-ascii?Q?ZVnvjOnNuFGbMciCJwoGM5Ef7dWLP8zp6OVC7bjF9XWovHEVvyB6lsAmkBDP?=
 =?us-ascii?Q?/MpiKAGU9vn7ojWD2voMLpuKBGZRIjdA040+CF0dMkm96KsRCAiLpGqFtjMV?=
 =?us-ascii?Q?W2kAlh2hjuIjb30M8GRTIrE2sEwqYJzVpUvWBAUSAqzKugIAXUM7g/8zPxoe?=
 =?us-ascii?Q?9SG/hZUycC7PW3hWqzhy9IFnz08x+DIj0I8uqRzYvlLgi5EUJvcDA0vxaZSg?=
 =?us-ascii?Q?eiwTpPcmlTf1bQSyRTXso8CkettF6jrLZFI4LQm6dDEZZlCZMDe48sx2ryyd?=
 =?us-ascii?Q?T065n+fP9Nxh6aQivSAy5DirbMcOJeG7doEWTLrI5qb1WXFVjPNAZtsJidG0?=
 =?us-ascii?Q?MNbRAZ5GF9wBSUvMOR+7zyI+Mzt0JIQRLfgwfQguz9TzwgcOcBRwgZN0o/Bt?=
 =?us-ascii?Q?TC4s6fRJwRb/bANCDcxkuWxX50aKbk/6vX3r2EMtoX0UUDS86vvkona2Q9u1?=
 =?us-ascii?Q?b8LcYAW9DMvwzZpexqx0ok8kbLlzCcQFr1hRZOKegrbjBSynQ3qLTFpdPbeo?=
 =?us-ascii?Q?qTo1aRIETtVowRCKMYmNI4vK3SkUtusIv2G9QM+Mu86/wmvp//CHhcKsPJkt?=
 =?us-ascii?Q?0FY9rU/WRFSXFnREf0A0wYoj9kLdQXfruYud/EBdIbpvd/qcQACizpDbq6So?=
 =?us-ascii?Q?0NR2NTMhSf789c+aWR6cMuAev5fd00nO8sowIDdK+oOWAjm8a37VpnCK8FH8?=
 =?us-ascii?Q?MPYsADODdpAxXXNfHIAsbgG5GDbsY067afW9EG7ZSjHCfHe6kFRQ4icCwbjE?=
 =?us-ascii?Q?6owIFtyi6sezKKottn4xn6AqIwVsUZXQsF5QAA2AmFaRoK1VDvoIMAW7s6FZ?=
 =?us-ascii?Q?MuvcP+LpWJ366uFChJKjqMKikd1vIbN++BmylqPD5/n4kykNwU2soDhLl0ds?=
 =?us-ascii?Q?Rzmd7QkxorHwaQtiw1E5z1nVcoDj6/elGjPmQb9DGKSNzDSMGNBK9AMaFcNy?=
 =?us-ascii?Q?38spVuf1i5ZZbxuQ7qasVi683d0SolGnzso39Q7d316r8o4pKSEfFJGvhBmH?=
 =?us-ascii?Q?XPsaXcv0OZ8T9DnZiN33brXJpXwDtGCO5HfDshIG/fQ9LodpAkh2PHURYfYy?=
 =?us-ascii?Q?lhJG05T6pmAurot+y/XGDCcMLRWMoG+TUHPnUjjvRX92QJa8NEV/WWTiQfbj?=
 =?us-ascii?Q?6tkdZc4ORq2bBzUGJE3A+Bb5fpwC8EfbepoedTo9W63yXaEXa/oTtJr71D40?=
 =?us-ascii?Q?VI/IaEGha8XKxMmrTFmGfGn7JfomXbUgMHHBFmyhn4DhH6pOPjb4j/veFowp?=
 =?us-ascii?Q?4eTxdVBMT41bIiM1Q+FYhYDUIF6EOlaCDHqJ61/PZQygmwHXymPW+boGIeLK?=
 =?us-ascii?Q?FGk12Nfarl7aHuI5wJzAuFNKuA1vpb2GIqU3qXD9jPcfS8SH082GfGtLzJvQ?=
 =?us-ascii?Q?QAr7h7qkpuzWEcM8nuf7pV7vI+aBHjvLZpXcjksuc8VVDWR5itmL6F9h0NVD?=
 =?us-ascii?Q?v/lRgO4Im1V+ecMQ+XPaZ2g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebb0df50-bdf7-4393-ce5f-08dc52bbfa89
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:24:09.6563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oZZAglIoY5K+hfjM0ZjZwpb3ugr/7DauI3q/tVtpdn9INVnJHIyZTlB1OPY9Q9sg9FiKBYwtsTJJeLZYtR5EFoL7vV4bOrgnJEE8P6Xl7ASxPf9lHNP6p0KCu/AtQRZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11608
Message-ID-Hash: 5FA4X4GR25XSVMHJSRFUFETJCI64IHSK
X-Message-ID-Hash: 5FA4X4GR25XSVMHJSRFUFETJCI64IHSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FA4X4GR25XSVMHJSRFUFETJCI64IHSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Renesas Sound driver is using rsnd_is_genX() macro to handling
difference. We can use "grep rsnd_is_gen" to find-out difference for
each SoC except rsnd_is_e3(). Let's put same rule for E3 as well.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/rsnd.h | 2 +-
 sound/soc/sh/rcar/src.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 45cf21320280..ff294aa2d640 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -703,7 +703,7 @@ struct rsnd_priv {
 #define rsnd_is_gen2(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN2)
 #define rsnd_is_gen3(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN3)
 #define rsnd_is_gen4(priv)	(((priv)->flags & RSND_GEN_MASK) == RSND_GEN4)
-#define rsnd_is_e3(priv)	(((priv)->flags & \
+#define rsnd_is_gen3_e3(priv)	(((priv)->flags & \
 					(RSND_GEN_MASK | RSND_SOC_MASK)) == \
 					(RSND_GEN3 | RSND_SOC_E))
 
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/sh/rcar/src.c
index 8822d50b6d86..431e6d195b09 100644
--- a/sound/soc/sh/rcar/src.c
+++ b/sound/soc/sh/rcar/src.c
@@ -310,7 +310,7 @@ static void rsnd_src_set_convert_rate(struct rsnd_dai_stream *io,
 	/*
 	 * E3 need to overwrite
 	 */
-	if (rsnd_is_e3(priv))
+	if (rsnd_is_gen3_e3(priv))
 		switch (rsnd_mod_id(mod)) {
 		case 0:
 		case 4:
-- 
2.25.1

