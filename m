Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811269A578B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 01:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EDE7DEC;
	Mon, 21 Oct 2024 01:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EDE7DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468766;
	bh=Dh5iNNI+MUZdbyrHuWXLEFv6rHdFP9Kv3BIH6KoZWi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D9bH5yO5m7pnRirQrwJ5tjn6309np/3u7O8VFGnq5eMax+7I+8pcQcOe7AfD0IxD+
	 Smp8i8mkXYI+85h82o4JMTUy2FjgcqnlcYsw6vH6N4LOO7C/LOW5kd+uP0bbn5xXMN
	 IztyBmrdIw9Vvd6B16771ZaAP3tprcJnIsA0YIcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15BB9F805EB; Mon, 21 Oct 2024 01:58:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78852F805E4;
	Mon, 21 Oct 2024 01:58:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A00E5F80588; Mon, 21 Oct 2024 01:58:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 74357F80104
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74357F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dAF65kpV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJqmbkVzuGVEmmkz3sMj6iBwZEX+LiuFj2nzbamByqkOPEDLD0qw5Qq8B/tU0BuKxHlMl/Ox5eon5ISXz8tL8VsjcHOGNBWh46qX0hgZsF2zTS/wSDdNsc363S0x186U2AT4+FBOM4jJYC6J7pPufk8ovxcVvbeXhixzxDjChiJQecFLghj3c+n3tAIKt4wX3JhmvQcV7CQGO3tbC3F9ZDt4+9/mUYMXh7Rvd8ACAL91EFfGLAaCaGnGwgVnUyUlIJQmx33v1iDol2F3l/gh8KemnphwpG8buJjxMk36VKMVJKUWC3gFD9t0e8WY5K7SvgCjL2vCRkrV/TYMq5+4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7U2iEfN1L1cOoyetZNY5oXZqAbnpVCXjvJ3IQpJcQc=;
 b=BxD87pgb95N2jzr2ye6nnkk2/+qKUpYAjWb8zrQf4OJzXCkXrfFgE3rqvB+M98cwwdYBoeg9ELM/bfeUx4UrH22PvvRSGgQrhgjS55rsUwaotzMDwX0wl0tKwDkKYWuyq/ns35hK4jSk0gYutSueyrKxPdhymspNr0awP6E91uo7kr9xzvGiD17r6/hRw3N4hwxkjxLpHYEg4MYzmU+XKQO9AZ/CUEYEK0poxf+XqXiwAs06uZdM+qeQ1+pIf3i2PgmXOzeXFbYVteKTFwOgAvnGlyrx5rZHf1x25p7YknILESYCssjKalUZOaI0skC4XKM4W994jN0EeL0rUanqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7U2iEfN1L1cOoyetZNY5oXZqAbnpVCXjvJ3IQpJcQc=;
 b=dAF65kpVOCsKMh7Hgk6/tVh9wScdNTwkUXHy7PvSd4JEhAeahPClTgi9i2SlcLck3Tar6AVbC+M/auITok5D5ply2m/oE1tMvb2Jai/8eEW2pG96VC5L2JQ28gCtKVINvhOv5mnk9fvRptrO2hZRN5aHvNbo3CCpOKlFr4gLUX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:58:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:58:38 +0000
Message-ID: <87jze29vip.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 01/13] ASoC: amd: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:58:38 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea5079e-6893-4a8e-0f9b-08dcf1631dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kY0JDm+MfHrRt9sCweoSUissWv02KK2C2XxPBVecrRUsfM8fKEABpOTWmUYo?=
 =?us-ascii?Q?2KBfRekDQJt0AVodckh3mcL/S/IxdMDGtsauyM3r2ZZQK7+ufdyJUqeKjBt0?=
 =?us-ascii?Q?nfqgnNVFp/ELvse1oeLq5Rv/bw24NGQgI+zNUhEmo2xZyaUvkKDQRS/vUk8U?=
 =?us-ascii?Q?qA7Ks+kdf9N05oUEYV482ZUWc3z/RnJ/Fugikaspb3U781dLUo5vjRG6xcTP?=
 =?us-ascii?Q?MKTaP9bTmOcPb9/Lz9wZOpVn/wO1HVcotU3fizJP7eKW/16fi9370jLY0+Cj?=
 =?us-ascii?Q?YhP8spQpSsmFIbh3rCMnmxLKmlR6EvQ1VQUb2GADo1NHFxrCejJ6TI2VdQbb?=
 =?us-ascii?Q?Ueiu83+/6RNWeiALjoSkz/CdeAleX2Ux6KDnmknYYnM4880GwUV20jpyk6jC?=
 =?us-ascii?Q?t/1SDAkaZ/yA8wY8h/QOu8ef7rGHDsLxN5WQQccj2l+xyQcZrC4tq4JcnpXX?=
 =?us-ascii?Q?s2RIGYoaN4+/ehtNMOn1MOnEzNMfsC5cHJxi/qTtMDxLMFvIAoYwiRcUJo3j?=
 =?us-ascii?Q?bt5h3bqAaokjKXTy1aL0V84ffHDaC04A1iOQSKMl6K4dBKj7oDRNZDrgDlJI?=
 =?us-ascii?Q?Lo1/awvID36PprvM/B/UvBuiKmdUlFbzmddgRfmsU6uAoIpWSCalav0qbwpj?=
 =?us-ascii?Q?BtHthfN6zCYPvjojMoZoo6GkU8yQMpF1396/GT37kNmF2fWhZvqsAH52DcJV?=
 =?us-ascii?Q?WvK18mKT8IEeQJjzAWEQDWhyTPKSNUrRIjERN/vlKmmRxD8bhQiwYC8Danuo?=
 =?us-ascii?Q?JTw11TYDvXYJj6FEXhxmPvMEVmhKjhx6mk9c7l54oTrF18HCJQHEZIYZlST9?=
 =?us-ascii?Q?DM2GXr+4rNhumxu0g72y/nAPOoB5Jdv3f8f8Ql9MZ6aKA5VzQufmO7LYo3rR?=
 =?us-ascii?Q?uVZvdj/sS8LNCEpxdiVT3Sl4v5okPVjba8yTRAzNAONDtE5RpU2uHUttL/JJ?=
 =?us-ascii?Q?Xfn1IQ+Feuc2vIVxowc1XRAC83rJtV176cABUplUnUQm6A5D+Hz4+vJGseYJ?=
 =?us-ascii?Q?TfTu+8he/pqtOLLESNC2L1+knDpnMuFqsx2hKXmgPyc+mb+m4Kmwg+Y1Vq6/?=
 =?us-ascii?Q?iBaL3lEnbaWMwJFpHxGElktZs5zzEhaQ8OJAX5IeYcwFLI6FD2ORu/eXOej5?=
 =?us-ascii?Q?Wt9hIwkfncPlt+vXIQm6Upf9cLh2n5EaXreVC4PCi00vfomuOwmxKl7VaX3z?=
 =?us-ascii?Q?1BlzzHq52Wkjlx6tFrlGqxe97PEoAGqDe/yQPVuplUHTAThEEvcX1nmI74NX?=
 =?us-ascii?Q?MUrXjNHWDSUtE38Vr1r/zZtAOdKb93qzn/KoGaxvx9kmx/ELNJKLr0a/EtGz?=
 =?us-ascii?Q?28okVxTyOIPgZFkpdCkyRfO6PBIPsTP5kvW7oJ+GF5s1Q3zdXx0l2PnTovvo?=
 =?us-ascii?Q?GjcIIrw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JnbwTl8n+fpBtoz+Jaclm0ieogcuaSJ+3wPU+awZ0yJycvHh1ssDhzaFPxnP?=
 =?us-ascii?Q?pv9oJN+NDRbBufxEHIuDKjYeSxOHNRC+Jeh1e8XfYYn/0nZ70PE1o9vzB5Gk?=
 =?us-ascii?Q?YpJHPuCl/SbDL68DHGjYrFfLB5sUFYQ0sQFwDoDz+3lyPyv5EcRcGMC1fTrq?=
 =?us-ascii?Q?QJICsFu14jKYWPOdGnDkgnOZRvNqaQZ2b6iYW9S7QTWXgZq4oq+wVXKJUYvn?=
 =?us-ascii?Q?NYIblFLFoibL0nf6Ij/lHgIzR04HuXONQqELpkpNMsFLrxORfZlh0YFxauRG?=
 =?us-ascii?Q?MBvv19ADstLi/8MDfqyjdspGsRHiotttkvpGlbbgQpoJMdy0TMx5Bn8yPcRn?=
 =?us-ascii?Q?s14dW4XHhuKrS4E81sry35P91m5fdT0Yzzp/AYG+WnTFv82TG2+8/6S3uq3/?=
 =?us-ascii?Q?hIRDZz5/wSdf8Fw8Bttiu9owQjcJNT9ClVBJi+t3ZrAX+8rO9ZA6Lg6PQwTX?=
 =?us-ascii?Q?fqiQ+wiR9VpsqbDAZ5nh5teTYY2QkJAqThmb42coP0JxemqqVn/dJ3wYbyH5?=
 =?us-ascii?Q?bAIzt+GtgI/Wy1tUr5cGzY7mhlMk91O2ohh79GK56aszF/fG/87mXP+948Wz?=
 =?us-ascii?Q?W2zaOaNQPmdwo1wHmf1Nzi74wuWX2o++mzGJDYEn1QILEbf01fPmym+PTB7H?=
 =?us-ascii?Q?8RmZCQHKDAFtFcv9COsNdKnfNp6q5Z66IGxVTI26UlNXPH8+spAz2gcjNejG?=
 =?us-ascii?Q?s5+rMR+silq929Vc68TEUAQDiPF9QWgJCV4S3gyTVQeFISnPnfPmywRL+s0g?=
 =?us-ascii?Q?PFjjj5C2ROE8gAZAdRmeQLH6JFBWydwP+DbCCHx0S/5B94JvkcptiN6QTTK8?=
 =?us-ascii?Q?H+ZD59oXyrnmtQQTFAWL5aMN4c7qNvWvCPPnLrm9vbTO/N0+TTkHI4hmELXs?=
 =?us-ascii?Q?cbmZWtkn4oHCFOE9NkfDaXQGKl+nMvnhHh+YiBf7tUGxgBK6Fd8uy56YvcGJ?=
 =?us-ascii?Q?X4NBPCsCkrqwGb1FjYhnVS88SfS/nh8oq0AakdvCOyWeZnPYsPaSypmExR7l?=
 =?us-ascii?Q?D/fXWxE0rhizel1fvL5XVbOiXDKN58eDkeCqkwjM0BDtbmAQWdZBUe/1APav?=
 =?us-ascii?Q?cULuq2k+VWUwNJo18TcV3JzRRvP3pf9p8thxvNWxJ9a9CNtp2QPm0RPnFEaL?=
 =?us-ascii?Q?40baKgd7reD2IswVwBKmHOS0LHUd3KN7aAu3bwwRRIvi+P/5tkZ/rdEafeIt?=
 =?us-ascii?Q?bPeaLmUfJcSF/+xFiLEmyScKea30EiJrjsa+KysddOu6J2HjcQvvKlHP+Ifd?=
 =?us-ascii?Q?5Gm8O1rwHM6kgd546L5X/hu7S0i1G2LAbaw9lsGIpjGd9nL+hfxIYWiQmJuF?=
 =?us-ascii?Q?QSREYaWKn3PjvVcd6DadxHib7+cG5egZgcgVqhS4Uggb16qBot1KLwReZZWH?=
 =?us-ascii?Q?YCBhn5ugRZ6/bRARyS+CwxJRZeaPZfg/mPMmU6HskHsQSGaIDkeLTnpp0Kjw?=
 =?us-ascii?Q?Oe0yiqU3GfvRew95DK2mPMJsr3ueMmGYy+jW0179Fv83cP8dufJzDhluTyGd?=
 =?us-ascii?Q?63oFwLzzaCvHeSxFsDRqFjCrm+rSfN85cszLf9jdrM5O4gXPW5lybnG9BuEF?=
 =?us-ascii?Q?y6ZTpYOtAwSLFIEovGn4/WvYgm/wV0VSaduzN2hJ9t9CLl9P21ul2e+3lG2S?=
 =?us-ascii?Q?oYq4/oqO+IhZ3ahzFxc+NWw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ea5079e-6893-4a8e-0f9b-08dcf1631dc8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:58:38.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PpuTzzqlBhxPpRbHmj20ifaL3vJKtIosq3VP5DjfyoA6vho5aOzUn4aRE/l5YGrVLwKc0xRFVSGG5koCzUWI6e35vJUbO3b7euFx+LkhNR114pkkpsvKscI6uNi2jzQ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: JNAEDGLLD5HFL3NEITYGPBGCVQOW436P
X-Message-ID-Hash: JNAEDGLLD5HFL3NEITYGPBGCVQOW436P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNAEDGLLD5HFL3NEITYGPBGCVQOW436P/>
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
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 77cf72082e73d..02b04f355ca66 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 3756b8bef17bc..0193b3eae7a66 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index e38b478e15f30..67aa0ad83486a 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].playback_only = 0;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1575,7 +1569,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1614,8 +1608,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1663,8 +1655,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		}
 
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1692,7 +1682,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1735,7 +1725,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		}
 
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1792,7 +1782,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 357dfd016bafd..4ca1978020a96 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb98..2ca904db82abe 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.43.0

