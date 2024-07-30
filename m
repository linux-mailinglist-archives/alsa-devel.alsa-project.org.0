Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46A9403C6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9EEAE76;
	Tue, 30 Jul 2024 03:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9EEAE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722303113;
	bh=FpoDlIX1MslWTg19mpqiF1DdrCz3kTd5Lc0Bi90rjOQ=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RRG0tPUUcIwwiNr/sopl0/dRLC8AzzovFc2OengVxneYPWw5lsQQbj80vjO62Qcd6
	 qQPkDjc1N7v0kwCgGdQYPHo+LM4cZG0iCD3nuVPXn9tGJd2ZPj5veKeb8S5TTH5q2E
	 80iCM712ltB3x0Y4yMReq3KVEnaLhAHr1fMb3+Lg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1592DF805E1; Tue, 30 Jul 2024 03:31:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A052F805C4;
	Tue, 30 Jul 2024 03:31:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8298AF805C0; Tue, 30 Jul 2024 03:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA336F805AA
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA336F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oi9unk1J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZ+KMpBVJNdU/MURFB0hSuT7t6uiNaovIgiZ+clXUIhb46IxgQWh48ImOcZjlg4rQ1cmpmSO4cGywSCwmsEbjb/gImR2G2uC9GqkAuQBOiahd4sNqDC/uLW8uDkw+OoyM8E/yR3AaKXuFMV+C5IiezDoxWgaoovHpU4xvAEYocxWm/5Vu7WN4iuDfD3fjR9vJNCW9emNQobHMHX5s02x2AJEC/jzV7zSFyQTd8e0lM9LoaRBKBnIUuAbNvaNhED0knfnoo7xBmdS+wF7QfEarqh1rDrV5y0tI0KpoXi11Uk2TCPnvzxWhzypR54b1YilzDwgR9wz0p9Q59J9iqyJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Gd9H7CDHIhv3IdsY4+rbLBTe+6BB7vH/IDcHqe37wg=;
 b=p2cbFMfk3GZEVtS+s3zMqPhzDTKAGi30PKifV2HxTgD8xjA7datQ/2mUtqdy3iHVR/iZeTqeFL0N99JdC4EEuQ5g6IhYRaDrByswOJ5FNLpmgIEmUF2EAckELf0uEpvrH0un7pLS0i1aBiKS+pIxU6AU4kN295xt9SvD3EABPhUqtV6WKg7I3qItAHJ8AtrDuMieWiJur0YFMqMKAM3BsbhpB387w8xiGMN98yroAPlTly20oZ61RaKlt+VqU844ikP60LIcliAV3U6ZjxZO3c/owcuok5CheBeSlbRhtgSatDgbcKm5nIBWt7NFXwkDGgeSneYhWARx9vaTaCIl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gd9H7CDHIhv3IdsY4+rbLBTe+6BB7vH/IDcHqe37wg=;
 b=oi9unk1JQ7oHLHuMVlGlv1J488J8D+vyAWHfWLrvhe8Y6uo/JVV5MoWxXlu7nSZfy2Afy+qUVUvS7CHDbN4kxn0WLnopvceRBprMY4JbnMN8dvRB9/N1JEFsDdxA/TPNWClQ3bNjpjZD7T+UNi0BXtOoWNaFensFkSfdL2/AkQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6494.jpnprd01.prod.outlook.com
 (2603:1096:400:9a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 01:31:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:31:11 +0000
Message-ID: <874j87ll7k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm: remove
 snd_soc_dpcm_stream_lock_irqsave_nested()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:31:11 +0000
X-ClientProxiedBy: TY2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:404:a6::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: df447325-1a16-4198-45e6-08dcb0374b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eD5pJvGiofkJ7EMCuR3jsQ7nH6IgW+5Tq1ePzgUZEnskCnHORYttSashWLLt?=
 =?us-ascii?Q?JAzR8bG4h9bozYNcXoy9tiHmb5FNIAwVYb++7ZSFX44eEUolR7ZCx80tM1jQ?=
 =?us-ascii?Q?vfgFNzqeo1TuxP59MsxL/t7ZxdzkXBKikVzVEwT5ZtwnzJHpy0f/CRqsiYKi?=
 =?us-ascii?Q?JzAONU6eviMuYuXxzVbgd0iLp7DWm5ol8l6e26fvvujQ1T5KrV7zi0FWZK2q?=
 =?us-ascii?Q?m3J2PzjU6M2U2ZRLymJrzteuJBpO7L/y4PnNjVvW23FMSlQFmovKqlkVI+gj?=
 =?us-ascii?Q?F/JD8p/PrKmkp/BArooC9Cntd+g0R2aLXfGzNim9Vh+EUrKBUqRUvTp2nDhr?=
 =?us-ascii?Q?GnP1EyJG0YWFtqPcF5NdMMvQeGqWkM5u/h4thHRaHfW1CGr3AAnKrXcxv4S6?=
 =?us-ascii?Q?yUOuCjra4Td9j+N/GtVGelXTzNmuk51/oDHaxBgOqfbDMkpM8/+1IOrx35Y7?=
 =?us-ascii?Q?lMGIER/iqetiG4+ssnKTxH3kLZGkabdiOCf7xn5GdLTo74+D2uEjrYGi/eqd?=
 =?us-ascii?Q?t1faIYvMQWtVOOV9aLl/f+pj/8L00ptagR9LSHL1lwAOlI6hWd/tzHCWglQX?=
 =?us-ascii?Q?AaJzUrXbk1J4cdKw78kuPKz5Rj7CL9MqyHXFYVt4KsP/cfJ5s9LrWj0O3+Py?=
 =?us-ascii?Q?ju1rBiFR3qvhs6fpMr64SAete57OgAoqVnaTdutrqQO0K3DLNaW9ViaRMNwE?=
 =?us-ascii?Q?4DsXMakfOEUlRpjGfXWbzsh8i3/TzH+v+eZOVKeuorMfk15dA3B7bXfmC5HC?=
 =?us-ascii?Q?R6X0M5YvBSdU6ENqbZBeyNu+Wrb4tTqhKv1fqUztsbd+Wd1EL6Vh5N9AHlmY?=
 =?us-ascii?Q?P72fGfQxp7P09s6dlH6qVI1PWOXD2AvNGdG2XPSHBaJdG7nbwVivI4hJLa/I?=
 =?us-ascii?Q?B3pGaZJNzA2gOziGAyfR5pLB2C3xEJsazmOAWZ2si96NKj1YNrW3Un0iwAgv?=
 =?us-ascii?Q?Qp2kIXUQOGvvlkm1wahp64SyayLD+Ex762Lk3knVbqwjosV6AQncDjN5OpMJ?=
 =?us-ascii?Q?duAtxpViakAWzME1nQA/XsaekqefQLi2EunF7RmR04e4urfSlXxnCvy/Rf34?=
 =?us-ascii?Q?QHRnkSpa5hp1t8IqZDAdeYE/CHYMLkuoCRUtHQkYaznlCZgaZwQebRn3n5KX?=
 =?us-ascii?Q?RLYsLA7yqzsIdmwP4+OKlip2hqkwfVoTf/3o8po4GjaJphzYzJ8A4Pg6JQLU?=
 =?us-ascii?Q?ysuumZkri0Feps3U+VCOQjPKSicI5vxMw1jRgtcTYL70528N4vFEvgg3mRc1?=
 =?us-ascii?Q?lDiHmlIQF19DgfB0cQvjmsORV5VDWgDSzDriofyAnHduaem+qK8+uzauPssy?=
 =?us-ascii?Q?jJClPdVm8jEAhqdRbnxoKJkcTKCjOYloWVzkFNkABHftM8uUxNTJ34N05t9G?=
 =?us-ascii?Q?3OCQc/Tbx1KpCDEdAbNZEJNQqLBHbpI6RCFgXuuGLm91+OgvDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n9vHeSigYKkzFaQ0LEaYIP/sBWgQ7qtGt/v7cIRDCLyIdKLBRLrgW9FMfVQP?=
 =?us-ascii?Q?qhhOLzhtKJRnGtPONCMf0ttHxvpXpWX9Fq4Tp86w06p+x3+BWhoQEiDsW9/n?=
 =?us-ascii?Q?VRrNEjkdIUcnS1jzDA5V7HP8QVyWqGP8xdablvMqN9HSKxJck114NioZV3/T?=
 =?us-ascii?Q?vS2tKgBehKiBJFyQvJlAupdcnoQFalw45Bxq+NbxBdA8w3Eot/7/ROAbodVZ?=
 =?us-ascii?Q?vfLkkLM/m1ShUjakt5xWnqNUeutZ3787FubM2j1K213kcy5GhFvJEaG/l6sd?=
 =?us-ascii?Q?dcYYlJLrJnbarK4eKNCXzJnKhQ5ojBj9Gi80Xc11scebiz5/JD5na1o0THz2?=
 =?us-ascii?Q?uQxUYgeb3S7Ff2n8RZGsgZGFVqy3h5e8kcDXFIUFUTLlDatiixDHYqyk8zGP?=
 =?us-ascii?Q?wRc1e0Cc4KbCpLOqCGTkRgnWDVGhVoMLHYuTgY10g/4c5VHiSZMjKqIwcSz+?=
 =?us-ascii?Q?UxGOGLfBECKPITrQn8rSud6ejFOWSJWAHaPqFTwd5EHeid0GGZAfLQ52yg7v?=
 =?us-ascii?Q?f3JtqLJwxIBlKS6VzQ/qdY7JEXqjVny3EsOSf4jStqriPksHcMGOvlUaoc7t?=
 =?us-ascii?Q?GKrvyrzXxF+5H8x9jNrUmBhI8Ezfobzsbb8sFa4p/izLgOQDaIMoQUinrME3?=
 =?us-ascii?Q?COZkcQqO8jTSVeKm1ws0O6zxUXX0lBWCRHr0uXAsCwRPZRSV+pcL1i+ms3FK?=
 =?us-ascii?Q?9Z1+F3y6MLPnr8UQiawivzxHxU3PZ9uhFo1Q/NeBCktRKShpBd+stT/OEDe5?=
 =?us-ascii?Q?P3EzBquqh+nQzGDVex+aHJHbP/qbQZ+d2lCo8YPcu66tTopF0zamolj6JGFg?=
 =?us-ascii?Q?4R7ojWxYvRW2BMWQks/ZcwFyrgYrlVO9jwk2x8PzfxbljCeEwWKE408JupXq?=
 =?us-ascii?Q?zitBgMKmskSUOxKubXClc/TidyeQrndOlVYsqYZNHe6OruAnzL3xNjVhMuwX?=
 =?us-ascii?Q?flX7nd+7I7mvJXZKq/NVebb0ZwFIz09k/bv5GkafbPckzcA17eDP75BqpVY8?=
 =?us-ascii?Q?DgksRBVXAzLozdAmu78X6s4WhM9DwIFTDONr00PZfF0199tsRoVvwd9pYX8R?=
 =?us-ascii?Q?qJZ9rERvYBXiWJB9XeoxhDouBYeNVX5S01xMbhp6UfRTO2ZEa7QeU5Gfz6D0?=
 =?us-ascii?Q?kxKbYRRtYVEDZM4j2pRTi8y8DiWwG8aYJ0oulZO9GuY0Pmsi1LfqqK7KzPBh?=
 =?us-ascii?Q?727jX9YBLtyMvjErmggILTS+Vin39Kk3eIEzHa5ZFT6NdhM/sCFXqx7EF9/p?=
 =?us-ascii?Q?WeMQlVZ1MycwDEUONDPP0Sw3arhsFMvKDF+aXIHzKTuba2FGEbVzNcD1xNFq?=
 =?us-ascii?Q?gQb0usZt4AmSxDAKQaghmJhTI/6I/vfSQya11nNbgthdqzCSHCp/nLKGh8VX?=
 =?us-ascii?Q?/7XqRdpVk96ZVfy5dMU5m0coIWeRTuELXXs/FTA5MqiuGDqpuipuJnrag1LT?=
 =?us-ascii?Q?9M6ZWsqyLflykD+teL8XEYPeHTc43QKsFkN9kHHlnqhpi8JsdDjoBJ9/owQG?=
 =?us-ascii?Q?Szc/LlVkhOmfCrmFvUNP+4pvdZaety/Etk8rHGwRXcXufOeaywZk0Pmbhqs9?=
 =?us-ascii?Q?621s9sA6iBqUZGAwDDQzljcguaOF/735HLXneN+41+Xi51e1n+YcUnEiYq8v?=
 =?us-ascii?Q?nCzfZDYhowh5mhEoWkuUs+A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 df447325-1a16-4198-45e6-08dcb0374b90
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:31:11.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XSboAsLY++f/auorEJtBYAClMw7QNgpCiyzR5BYhmHSxIWx5wQ7YTDqeUX4Zgr7V1FriIDAJG0TWxmISJbwxI/7q0zz7uzkUx23qev9qpZMWlfL40i5zr3NaWFrjhVVi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6494
Message-ID-Hash: Q3PIL3E4PBVLLVWCTGPU4KCVTFTJRHY2
X-Message-ID-Hash: Q3PIL3E4PBVLLVWCTGPU4KCVTFTJRHY2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3PIL3E4PBVLLVWCTGPU4KCVTFTJRHY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-pcm.c has snd_soc_dpcm_stream_lock_irqsave_nested() /
snd_soc_dpcm_stream_unlock_irqrestore()  helper function,
but it is almost nothing help. It just makes a code complex.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 58381801e41d4..4571785736f76 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,12 +49,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
-#define snd_soc_dpcm_stream_lock_irqsave_nested(rtd, stream, flags) \
-	snd_pcm_stream_lock_irqsave_nested(snd_soc_dpcm_get_substream(rtd, stream), flags)
-
-#define snd_soc_dpcm_stream_unlock_irqrestore(rtd, stream, flags) \
-	snd_pcm_stream_unlock_irqrestore(snd_soc_dpcm_get_substream(rtd, stream), flags)
-
 #define DPCM_MAX_BE_USERS	8
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
@@ -2144,7 +2138,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-		snd_soc_dpcm_stream_lock_irqsave_nested(be, stream, flags);
+		snd_pcm_stream_lock_irqsave_nested(be_substream, flags);
 
 		/* is this op for this BE ? */
 		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
@@ -2291,7 +2285,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			break;
 		}
 next:
-		snd_soc_dpcm_stream_unlock_irqrestore(be, stream, flags);
+		snd_pcm_stream_unlock_irqrestore(be_substream, flags);
 		if (ret)
 			break;
 	}
-- 
2.43.0

