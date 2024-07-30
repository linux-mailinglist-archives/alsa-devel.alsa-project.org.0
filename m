Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61794041F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A33E85;
	Tue, 30 Jul 2024 04:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A33E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305291;
	bh=eaREuIYdADP26AlAHjaTDRbgVAOT6w07YB3UZyxl/qg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a2u0cNKuOauhEvXV2O753oSFOlSBGcth2mX/6txrngYQIPx5EsXNb8qRK3bUu4qqZ
	 HJ/WiLR5orMMqFImki/8m81eS8nLlzvlyvkGzlhvYzsNRJpWvTsAtqP2Nh4bMM2ovq
	 StCDiG8xC7D+yERozPfOw++UULD+GhfwC5dGMnrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97861F806C0; Tue, 30 Jul 2024 04:06:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 009A9F805E7;
	Tue, 30 Jul 2024 04:06:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA165F806A5; Tue, 30 Jul 2024 04:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0CC8F805BE
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0CC8F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=A3R5HLeh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuL/p8WfydZBB1c3uTLek2WJlKBSRzJe4cnn53DWTvW5NKUDvceHExUO6afkBFhhSdvUuMKwvzw9BLCdqqwkUJeESYCEssjVj2FJnSrIJkxGsgPNaCbE/wMYYbsBSThZhp46Rw+8Zb2xBmUHs5fcGeQF+mA5aZrZFynQGbaWi0S7KPQF3darVzjYuxFiTe8bpSJpDMA44vSGgXjEeWioR9z9hvx2TbrCjO+letZZiPLbqsnN6kzVJDV2kLz17qwId+uDi67p88CNXRSoAOPFrfeCwPja2ooXLc8HHGilj4Fdif0tbNEHTutSEm+ibMPoR9+plkRvvwuTyoLoSOouCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3kNPnI2iBt8KcFwlRECRpZWKAHia4I5PXpVsBj49b8=;
 b=zBfWiRXYNtkPmFbcuIYsmooQKTob+74oNwn1UjiNbFJGQFDoqq/g/xfE3r2968c3vSwAIXIrBcWPjO6iIuV5Ai3neMElFNlBLb7gqJz7l8o5JJPPXibDYeAZkJdnezX5587x6DG6TUDLCrmUsgkJTnbvj5nBmEqtMLNrsPQC7XeKjQBU0c4+EXGAwMtGwGX2BZIbgHAC+nWa/fXLJT8yOEIocQWuz3g4MigMDI8i7xUPgEJjkyh7BgnkwwhDJnP4Y71NBeaYfYvmmX5AmDbFuuPiiywI3iImHdEzz2GbKtQFIaCi3mTDFLOaC4tqLfP9lzQUN1lUpkalamVSZkWvmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3kNPnI2iBt8KcFwlRECRpZWKAHia4I5PXpVsBj49b8=;
 b=A3R5HLehdK/fevbqbvx9DjWXDu3hh/+pv9HAJf0/g0tCo2Pg8x8e66csaocauVwxqGrDNLA4zMeTApUZSvJHGjMk1rh45mpI89N8BYYJazylIioak3WNpfd436wKXtXJZpsGxcpKUkxaYSMK2YYmQtgcQJZ9PWhwqfGnN1GcoAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:05:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:58 +0000
Message-ID: <87jzh3k515.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/12] ASoC: fsl: lpc3xxx-i2s: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:58 +0000
X-ClientProxiedBy: TYCPR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:405:3::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f31d12-85bb-48a1-79a6-08dcb03c276c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bDD/Rf19Y00X4LeV3SH7Q8SfXUDrvE+K7wKYcnsoI91+f8qCu11leZ7YAOGc?=
 =?us-ascii?Q?8Ar/4BodACYjhbKOfwHxHPnjvB9b3qDjijGds84pt8V+ZAtxD+ug3/HED2BK?=
 =?us-ascii?Q?gzi9yYLRVi+RaSsGyU4QUG+PBuw1c/W4KtDYvxoIYYJxrQhoUKXPLMiVhOTU?=
 =?us-ascii?Q?5FytW/Kg+R63kSBo3GM1ThNmn56gFvHyivN3y18T1IN6Lw1QvmKHn/TSqcAh?=
 =?us-ascii?Q?/iEGU3lWYHTpCDyWp/AJXYPSMDGcVcL+XFO36Ob8zbI0NMS3fT4RWpV1q6cM?=
 =?us-ascii?Q?0b4xCtjqzzNjQiQZpDQ7+aief1ZCN8D1Zi815U81/PgTpXd2ZmrxL/pqVyiZ?=
 =?us-ascii?Q?BQ9u6J9yQyC4PgCW/WtJ2kfG5An9RS2f1BajvCE+ptRCeGQn5MIWikPMZ9rS?=
 =?us-ascii?Q?9/0RRKRF9iHo1r13SpqJY4p72o16OiAdtyDlDqtoyL/NXBQsz7AvJyPxxh4L?=
 =?us-ascii?Q?XUetKEQnHb75sAfQ6DBhqrbgD38HBkF00eNv8YwMqauuy/vFsMqrlBdwXPH/?=
 =?us-ascii?Q?LvcLdA73Hjvban2u9jBQ2RJOiv4DALIfj30cjIwlAMjP1vu43fAa2Nrt4Mn5?=
 =?us-ascii?Q?dcNVqRVExlUnIeVxzEWRjyAQ4EU1GNg7UY1NeM9E7CN4YHCLZCz0gSaZStcy?=
 =?us-ascii?Q?fjCLXvvEWnp8xlzEG4sJQ5plfWCX4OCkk7Szv5qAG3m5lYG7k671nkTFw4zx?=
 =?us-ascii?Q?9krXA/FXcYOkr12kS+J+8P4Hp1QxX87ogC89RDCgqxAefGWuwFLIac2Ozb9L?=
 =?us-ascii?Q?DAOQ100s/ZxlaDXyATnX3L9CetleuCL8HPHmmi7VxD55WLf6sqL0UlRFJY4q?=
 =?us-ascii?Q?RTRXSwPEC6v/PUxNFGyYcJ7UZyIZYrIOOqtRP0XyFjqOGkrUQvL86nBQrpet?=
 =?us-ascii?Q?LSEgx/idH3e7NiJVJot6ZJvyzJrOfTR82BTXo9fkwLr3RfnoG4W4O5uiEjN/?=
 =?us-ascii?Q?qKPuKJqgVZLnq/FELZDiCMQr/+b1NZg7aclu9iEzRDypi6C0ql10+jCoZaZ4?=
 =?us-ascii?Q?JhhKpreMb+/LJiIVOERB1sCLBopq+ZfVzzRURaRyyA23FC57/gNSo/hsoTXz?=
 =?us-ascii?Q?lZ+6d2lGtKuQhNhkOjwywGQxrK+tocd1tWMFXtPiGCecuDk+pksMquONJo0U?=
 =?us-ascii?Q?YvL45SgfbzsLTlQp8wOPdOnL7ac4x/a/QLcKQlG+aKarHaQC/eAABSeOcTtr?=
 =?us-ascii?Q?sdTvkYmGJVxkQmoXuumiEDbemFqwwj9U+3zv/t1xZN0czKS4/KYpZ9351PN8?=
 =?us-ascii?Q?EAW12g1YvUMqjkZ/slvKDASaac+bG8Vh65PN96aGTj1jr+cHSK8JIQZqp8ne?=
 =?us-ascii?Q?wRjIwePGQAkSPdpHipI9fBiZTX2rPO9xSh2P9sFsn97TrsmPMmJc7sX0uquT?=
 =?us-ascii?Q?5p8/b/LRqZee74GVqhSUmiPnaF4FKObpJsUnEEo+Mbo5R6e0WA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N2l7NgKLiRHsfnj7oFCmHWHJUltqDHrbW/S8R2woGLG5i/5RXRn/xlFxwMQI?=
 =?us-ascii?Q?gYgjYiULnYJBskVZM0cTrKb3msfDCtjTHE+cvqAFk6aa+qgiwYkLD2td0SSc?=
 =?us-ascii?Q?B+LrOGioxkNGC9Enq9SxDDrGuCT58e9yYhenhoSV8dFTzzjQI/H92uIGK7EB?=
 =?us-ascii?Q?HZTNvRYfPnLUJ3s//i77V3R3wvk4P1n8XmEz8VMS8ebmZqUMupOxMDltlK3p?=
 =?us-ascii?Q?7wMrT2fvZWbvNqijwli+QjgmBqmRi5rJE/CY9qI/SYSdLv53EUKtVDaLhSEE?=
 =?us-ascii?Q?2KGxWzpgB4OrquewJVO4Y821w4jXlZB0br03tdRM49wgd0NQ4iYw39wlKv3g?=
 =?us-ascii?Q?DMpqHR6u0WQiVsrGKRB5l5Bn2KrSZoL19I9bOX3ClnFS/PQd9v3t0XuyD02C?=
 =?us-ascii?Q?AztAvl3OqykuEvm1GjDKo1sBpFWEae1xiBcEEVyS1NGewK+xUF6AwDJyTZEB?=
 =?us-ascii?Q?b1rJmlnP9t9HbmqjzlsPj0JPzhvkkjqlU+yFseISKmPAJ2Pan25ncGXnb7BA?=
 =?us-ascii?Q?4gBV5B6ja2DLJ6gySlO+TNmvF6L4KWHU/r83ybFJi7tjtriyWsFZYeV+hlyu?=
 =?us-ascii?Q?psc1RmE3ZwBLePpnCt3ip78F61YjVZWCuy+zw08NxUNMcSEFRGaWM9yhfasZ?=
 =?us-ascii?Q?I/73gNZOLhKy+XpmtZOOSq39UdQ2GRNU3m1yNLLkrtBk+I/4mY9esKLql+Yn?=
 =?us-ascii?Q?qq6bMI8vI9nLVkl2qxGM1ojJB74FMOfjmVtXSLLLjxaTrH4q/jJNKjyZR71h?=
 =?us-ascii?Q?AOiiTvNHG3fbOUAHqsLfKiiyy9ww75kjCTOGU+WEWZWaRxTaehX5GSlazhbw?=
 =?us-ascii?Q?DzulSPMlTHWnhZqT2H6Ur6c52QniNBo7scwMiOczgrRVLhj6C9bWeI3oO5c4?=
 =?us-ascii?Q?AMRYPJbW3wVafoNIx5+sD2TvSTB8RQW8AS+X40UucKh+Ywj8s2B2WkoXX56p?=
 =?us-ascii?Q?1aaxPcxEu3qCbtv2659GPS2uGt9iJR7fJZRlw3UUFPIIpzJ2l20NR/fA1dLk?=
 =?us-ascii?Q?NrTmaGa6q6JqeZSJBEMSCkk00tuYXuU220f8bDfjU65HXvQutNWSDEqD6ywT?=
 =?us-ascii?Q?JLKQVDzyMM016VNjFns22JNPS64QLehssg6Uc5astZgFjURjT2smCS8eVtH4?=
 =?us-ascii?Q?jkJHeNa+hwnmLjA0VpWkA6VnE4OetdnViWG1nuEjE4qPzGGM5YXte7zIGHiv?=
 =?us-ascii?Q?9HGQWdz9/RHpnMf/0QQrZCH+Pt43ghO2gbP6hEEgmzmUBiACA50EijOj6Tvk?=
 =?us-ascii?Q?wVGypDs6kX4CnNxziA+nhOwyFZ19DeTpyAoAhduTHv2xGFtVORt4lLnmYSJh?=
 =?us-ascii?Q?O9Ddfc2tAWkfDIe+9VIZ4rOU22oAyeA27gylCyflYOLuyNeibif2fEPsxyv7?=
 =?us-ascii?Q?VRzR+APKld6B7/Msv52664MJS8x918gDW1SLiYXZrhJ5GnO/E5cRhaO2hvvr?=
 =?us-ascii?Q?AwW5YEgtHO7n3gYRYKt4ZgJ7Ih/eS/dmxD/jh4IhdtOIx3HiZBd1jsgrzEDL?=
 =?us-ascii?Q?RGB29xZ7apiC5LpSB6RkYIquxu7vz1/5hAKQdhUgg3USiZ+jYacY5/ONuN6C?=
 =?us-ascii?Q?hzV/Vre8WbRDPK4LqkjN4bJdcNFfg5EIKDrYZJobX/9wYbMEzJ6h43nUbTQC?=
 =?us-ascii?Q?XXA5BdzRtVer7ehawSatuUE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86f31d12-85bb-48a1-79a6-08dcb03c276c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:58.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nxuFiC9eVFJecZI9grAjL8ZXSUuTrVgUxqoSOFyh6R0X7ld+o2t+FdKgAFOUe+ch0FuspPpbzZCtTmbYrP1ZH4AwvubS7BIbLEdPDWDbZcko+31NikgGfp2xe5nbza87
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: 77NRHEVWGBYWGER2MF73MVOZXCTDPCBJ
X-Message-ID-Hash: 77NRHEVWGBYWGER2MF73MVOZXCTDPCBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77NRHEVWGBYWGER2MF73MVOZXCTDPCBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index af995ca081a37..ddcbfe1f92a98 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -190,8 +190,7 @@ static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	__lpc3xxx_find_clkdiv(&clkx, &clky, i2s_info_p->freq, xfersize, i2s_info_p->clkrate);
 
-	dev_dbg(dev, "Stream                : %s\n",
-		substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+	dev_dbg(dev, "Stream                : %s\n", snd_pcm_direction_name(substream->stream));
 	dev_dbg(dev, "Desired clock rate    : %d\n", i2s_info_p->freq);
 	dev_dbg(dev, "Base clock rate       : %d\n", i2s_info_p->clkrate);
 	dev_dbg(dev, "Transfer size (bytes) : %d\n", xfersize);
-- 
2.43.0

