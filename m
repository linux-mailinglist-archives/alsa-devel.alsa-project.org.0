Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B522B9E8C80
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C8C220C1;
	Mon,  9 Dec 2024 08:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C8C220C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730270;
	bh=LuEWTy/kuY2f34mx0Zfgcikbg9NuqlrBg/ytodLKvt0=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Jx+C95fm3/hF+GgYvVxf6iHI+IoYsIn8yUBXpk1dSFeP1X4ebmpb/Cp6wR8jWShay
	 Quq3BovlGWmSKieTw3rzT8nud3WCo59AN5WIrUz6Ro7HFDMRKiR0J+8RRLA/s991Ot
	 DikXubaofbh0N7tagIg44X4EsDCaWLp6fRcAIdAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57578F807B6; Mon,  9 Dec 2024 08:41:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA14F80677;
	Mon,  9 Dec 2024 08:41:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D663F805AE; Mon,  9 Dec 2024 08:41:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C6E7F806AD
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6E7F806AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=asKT+RJh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVVOLoNU5a4GMmLVEY8UY3A/aua2Hnjgk1UDBXSa+hkn7RD4O4mBOTEusitHFAJjz+m8wbd8eGo8FvfzP96jhnxRRJrIcRpdoG7JUrVVoD/pYZq6ogCDG9HuZgiFQT0y73paz/bx7mdgYekKRoWTWdgAS30UqCEFxfKk9Z3MjqMN8ziLJLLVTxssVv58z9TN2Vwi1cGuL5hXf52VS7vtuXXrAIjQtB2nppbsBKtvPZ9BoKI0j/qaeIfRK5WBSwRVNog89fMldQKy0DDBeXN4/ALeeIOI5wgu6Sf62KU8M6jbxmKWCo9W8mb4pgEnUaBYaqREAMnojNVOydEtFHgZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1j2QscSPkzjwrSQOKqUeUX1vL55tCOBHc5VHpsCJigk=;
 b=TUah/3kl1yVySv5STFzpvaItXxi5WqfEvJrrCV8mhKHLG+IIjwSOjn4hvZAk+EcjSuBTvHBKKaL6/Dhw8xr8yV9UsIRDFad6uwAxyeiAKRlJmxBDjVZjYOvuU9twrdF+7XR5prQ9tgdAeICMtjY9IXUznFuy/6O8AKBmhNcIqXnb6vuVO3MVhmUAZfIBUAjrEnZtlXOwiz3hD3h5Rtvuq2CVrR1bvm3qv7tOfeF36OEbRjrMw7jmeXqIq6yj9i+GgduymoWzrRBCZL41YtPGC5xlRmFe0vbV0SNXQGgx2dLBtZlGn3G3p44Mlkh+Vs8222EvuzrgxdET0oy47fpwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1j2QscSPkzjwrSQOKqUeUX1vL55tCOBHc5VHpsCJigk=;
 b=asKT+RJh5O4mHE62yDjfjTyltLd5JQTOKVR+2rIaZQrmyETq+klLaBPJsosGf/Mc7qrCw3lxfodzcD+nKENzKqLe9LnNzDvlCg1LyCgg431hqFSrpYk2tVVnmGdO3DYgcWZtBRrAfRnV8QOrFDMNCoLFOcVmgjQrzfqUUJeViV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5479.jpnprd01.prod.outlook.com
 (2603:1096:604:87::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:46 +0000
Message-ID: <87a5d5mhhd.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/17] ASoC: codecs: twl4030: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:46 +0000
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef4a4aa-f4bc-4c73-2826-08dd1824cb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z3Ee/6aH7/Zm7rZJOt3lO7Q8kDzN/TkkFYtPuAcme8WNNxUFzk+ImlIAGtAp?=
 =?us-ascii?Q?syM7pZVyk8wz6PU5/nkdpIAE78nK2m3226esZgJlaKOQEUwzei7fEtPTyJUR?=
 =?us-ascii?Q?87pjr4KgHQzjYIb7K4J5e9XpulA+H/kfzVrnTW0ZsLDX9j9+zJdY9XsRTyDN?=
 =?us-ascii?Q?a1Y68PCTgisyJ8EpUv06QMlIK08XAF6yxJj1Mm0pvFFI3CCZHTJowKvPMNEH?=
 =?us-ascii?Q?6Obugu53n2rJBOfCzRUYU51BjckweYwMGqGL6ye+xBXnE+D6K47TPdZovx4d?=
 =?us-ascii?Q?gdWH6w3Bn5gakvLTZqpjYvPlQyCOShJUkP39BddBhv82zMM6bZA+V8TFEWsW?=
 =?us-ascii?Q?LPvL3WdscNLP2iI4/vEiGLECZgEH40GJhM4wv11Dfo6IEfmueM5RVaFS9qw2?=
 =?us-ascii?Q?0JnMc1XOcLo18Uo+wEpxtx0lkwwQHRtdpbQebFwOeQFisYXiB0w58Is8D4eh?=
 =?us-ascii?Q?xoJb7A+rIQuavsF1hGJvv0+u457CzQBy7A1KNXWTtBy3Bv3Dsq1N1LnuYNzR?=
 =?us-ascii?Q?DZPfPY4fA6TMKGza4dm5m5Zcn6I7i0bt74Uj/Y7U0AssSOZ8nJleQOBKaaHd?=
 =?us-ascii?Q?9hvkQ7FqJH0P+Co6XPMyraEgjPbbMveuPOPrcCHVT9dssxRFLpk0VFM7ntlO?=
 =?us-ascii?Q?Emv60UDzVcmNzGfMv78DHXhSprAIpbYQupqMlRFS2ep4BhbvFzDWzfDDU8f7?=
 =?us-ascii?Q?fCKbQsGseRrN3pbpaK4wbgKI1Z7+bfk6Vm0GZnbVV+Yeg7xPGQz/anUchbl6?=
 =?us-ascii?Q?Vuh2hzkFCBZ5Mct4m+1vov3Ald4+9ItjsMY+jD5KaCmjkwaUKYrN7ekcFqyZ?=
 =?us-ascii?Q?Rh8QVWPl8SuTENxw/xBJfE0mleMHFpYMXJM6Tk71vPu5SQWxZ9NoqaEm8elk?=
 =?us-ascii?Q?gtPa2rgE2Zouv0SxLXmRhPwqhvKpwP7tW889Ip2d6VTmQ6FLX2X0S8Og+FLJ?=
 =?us-ascii?Q?gJlTbhVwIeZz86v0vMWAbaUyZ7ZhcLcPIBtkju9ovGuULAfgGKPUCdlngv/h?=
 =?us-ascii?Q?YZ2deHGV7Jbgk/ah++Nfv67536wCsHQ9jDG1ByH4zB8OtojWvAQgp3oS6XAv?=
 =?us-ascii?Q?fjpuQEPPv1rptAtp2EliOByPFeOxgvXmasaVsNpabMRlL3fbIoZtEKx9c59d?=
 =?us-ascii?Q?xnKN9JioNzQyQoZ5DwJbtHHqHFsrihVHgxXftFjGbBGKIVIiQ89jTXD2impF?=
 =?us-ascii?Q?wFIleURboseif4O0GyISAmmOnizfflQTqOvc/oDc66nNYSuXV96275OJPn6w?=
 =?us-ascii?Q?AnyL+MnzYgvk9jsWX/YUfIOvsjgAPj6aci5HjZAs/Nq17OdzbNJtTREhbYzj?=
 =?us-ascii?Q?cYl9m6x1Yj1dWGEGVbPLEesuFtk0yRaXBOt0XmfssjTJHvaz9jTNYYpqjv8Y?=
 =?us-ascii?Q?WUi79kv06nlslVzRhrXUjaa+aiGWnbXyST6vnSaFJ2w9FH/crP0JGsE0ViYw?=
 =?us-ascii?Q?hxg+f9pDsLrA/m6GXaZS3DDLvXEwK3Us?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?juug+wNUuw1ZZFvy/+YN2fTWMHcfvHJPnAZoZ8IsIZ0jQ+EcWPoBCS3WnVUc?=
 =?us-ascii?Q?V8PI7yhm3Y35GWXoUk2aNHQkWUHSY5Q/rSAtJwgrnsSyDXeWoQScNGumEJhV?=
 =?us-ascii?Q?it2zQA5z2SIoKilz9w0cQBE6vrow6hMz13ga0MIB5PZHwOnPbysFaYghRE+7?=
 =?us-ascii?Q?xYMlFv/KvOSyvnNLjGWp4yvQpMpX/OUhtmNtNABkgGoa9YjPh4y17JcLVOZC?=
 =?us-ascii?Q?7pwsAH32mdP6m08bA5ekn2vSKNxOpv9kOLawObKxk1MVvMddXzBH8mhIE3w1?=
 =?us-ascii?Q?5KNV8m8CojXyHXGavTS1XQybagNTSIKwXYQY6ntX0aBZnU5lxAL435TP4cjS?=
 =?us-ascii?Q?Egzcgcxv2LbzTV3sNrVISD1OusD+OUC8fy4wC+pqmWSR9S+OTXhK1vS99Z5D?=
 =?us-ascii?Q?sSj6azIc36mZyPYw1o1MmH+mLPuYn/aNYOHZZyg33HS5AfymiWyNdU7SXfWA?=
 =?us-ascii?Q?HanQ6N41Iud1yiGihiHXpYF4BZScHvQQ4JDlQDPAINeldHqXDWwM3iv/omMd?=
 =?us-ascii?Q?GeFoBGN/1QLssUF5GvTJNBuK41tEht2oiLDO+AGY4DZNngFq/E5sXULT4oWv?=
 =?us-ascii?Q?MbrDtrxU0D1zTe4gAoMwf1C+uz9fplWA6hYL8khu7xIlQEb2zQfdkgnjDeK0?=
 =?us-ascii?Q?78PZAuspRet3XaLRoueC82EOuaKIAv3vxoVFSUtO7+TGanMIh2PECTjyooLt?=
 =?us-ascii?Q?/JyMEi8vzkFn4ew/zVoBt6rN9vt4Zk0lXRRXIHUbSHYoUDTU6USj5wJESvAQ?=
 =?us-ascii?Q?NJBW6P3C5CdzYTXdGrgJdc3jO8kE3LowXCbbSTWnm4lD7S/W/mI76vYcmE6P?=
 =?us-ascii?Q?d599T70x0fhA8K77Wq6GuTImOGcaTIC7gHK7N1VUdSpIFMzNCi0fzE8hi20D?=
 =?us-ascii?Q?Onn+q2OPTfItl5QStQOnRZZ4wlVtlfxkXue2Iu8hXDiXsK1lsM5GlOdbvIWT?=
 =?us-ascii?Q?gYRsRjpBBDQzOSSNNpInmpt+BPjpLl8mo8Z8WjhC25+JLUPx55hHR0C5Tk3g?=
 =?us-ascii?Q?Y7k5vsvdrNohyCoQuu2FEU5J+dMBGxymJygWM0ECbN8apPeelXHL3hJf9Vvo?=
 =?us-ascii?Q?MtERYBPVChZIRTAdGp2srgDUbULW9flYKQXMnDq9c3RI6V8pCwfl8o6nhmFr?=
 =?us-ascii?Q?bBoQVs4ZX/9P6J/28Jenr5UGna0a10dbGR14Iu/oA82V1QGQUAx5rFg1cmEv?=
 =?us-ascii?Q?tHccvT1YYA0YevcD++Q+PQ57IZ95/P1DFgso1tJGBFa6Vhn+B0c86j/rR22r?=
 =?us-ascii?Q?M/cG7FyPJcsIhybpQQC4y7knoI4bintWXIsk9h2E6v3914ZyGnhn4+9uN3uT?=
 =?us-ascii?Q?00MAAb9GQ2Niqo8Y+ysaFo5PqA2B6JFHs5fQE5L2R9ieBTGwUVicatPMluH2?=
 =?us-ascii?Q?UTYdr55njWQgKTZWbJ4Ouu3oGygelKHdCB+EMVwCslBnxkJAGu3ozEYJ/qLY?=
 =?us-ascii?Q?59vjaYtf+iZdMysXepOKzUlonBG8F9/KKh41qLuRC0GCbbmBJ+7A5a6lN1tW?=
 =?us-ascii?Q?K/wuU3n2/P93BA7Luy6kNSaGuGVdHCu3WL0b3k8XrFj5i0gzG7eLDTGUoB0g?=
 =?us-ascii?Q?hVNE/p80OSUwmwsb/87X+FpqFe044rr+qgfOFCGkGft16FpFW2QoCJ3h6bY8?=
 =?us-ascii?Q?D1qwdAX25kV1ixLX/qNWvOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ef4a4aa-f4bc-4c73-2826-08dd1824cb60
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:46.7589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UIbWCv1y7m/Oo51guPHenaACvMFQ6l38tPYa6KFOtuUkxkw5NzQs+f829GRVYQ37PIySo3XPTWWW6MmM5D/qp/nEyzTQZUfBzyM3JchAddBvjUr9/lpMt3YIqUubc3Ox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5479
Message-ID-Hash: WBFKCEQ7NPPLYDDJIB7OGWXVJHHIUPQR
X-Message-ID-Hash: WBFKCEQ7NPPLYDDJIB7OGWXVJHHIUPQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBFKCEQ7NPPLYDDJIB7OGWXVJHHIUPQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index e3782762139f6..28ab6540d3400 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -1891,19 +1891,6 @@ static int twl4030_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
-static int twl4030_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	u8 reg = twl4030_read(component, TWL4030_REG_AUDIO_IF);
-
-	if (tristate)
-		reg |= TWL4030_AIF_TRI_EN;
-	else
-		reg &= ~TWL4030_AIF_TRI_EN;
-
-	return twl4030_write(component, TWL4030_REG_AUDIO_IF, reg);
-}
-
 /* In case of voice mode, the RX1 L(VRX) for downlink and the TX2 L/R
  * (VTXL, VTXR) for uplink has to be enabled/disabled. */
 static void twl4030_voice_enable(struct snd_soc_component *component, int direction,
@@ -2085,19 +2072,6 @@ static int twl4030_voice_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
-static int twl4030_voice_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	u8 reg = twl4030_read(component, TWL4030_REG_VOICE_IF);
-
-	if (tristate)
-		reg |= TWL4030_VIF_TRI_EN;
-	else
-		reg &= ~TWL4030_VIF_TRI_EN;
-
-	return twl4030_write(component, TWL4030_REG_VOICE_IF, reg);
-}
-
 #define TWL4030_RATES	 (SNDRV_PCM_RATE_8000_48000)
 #define TWL4030_FORMATS	 (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
@@ -2107,7 +2081,6 @@ static const struct snd_soc_dai_ops twl4030_dai_hifi_ops = {
 	.hw_params	= twl4030_hw_params,
 	.set_sysclk	= twl4030_set_dai_sysclk,
 	.set_fmt	= twl4030_set_dai_fmt,
-	.set_tristate	= twl4030_set_tristate,
 };
 
 static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
@@ -2116,7 +2089,6 @@ static const struct snd_soc_dai_ops twl4030_dai_voice_ops = {
 	.hw_params	= twl4030_voice_hw_params,
 	.set_sysclk	= twl4030_voice_set_dai_sysclk,
 	.set_fmt	= twl4030_voice_set_dai_fmt,
-	.set_tristate	= twl4030_voice_set_tristate,
 };
 
 static struct snd_soc_dai_driver twl4030_dai[] = {
-- 
2.43.0

