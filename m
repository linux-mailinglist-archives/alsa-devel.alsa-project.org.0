Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E487774EBD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD7EBC0;
	Wed,  9 Aug 2023 00:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD7EBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535429;
	bh=n9gd26c/nL3rLdUOiWqp9/HwE0u/pWPZzqW0WmiLEfw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W0MWhjbyUzjaPubZaia4ph8lGtJgGEwnXXvLa5haca6MuyZ3lVm0RHA8kvortpXYN
	 FvIaDsTzPoVmjiR/J2wMhImtjCGAL/G5sCAcocyyF+AuVdDMDu3qSX6abuqep8gVjp
	 dWiJpXnRNoMmbLHbpnXWm4ZqzXaEZEmW/3JQtPYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EE10F8058C; Wed,  9 Aug 2023 00:55:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC22EF80588;
	Wed,  9 Aug 2023 00:55:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C3E4F80589; Wed,  9 Aug 2023 00:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 454F7F80579
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 454F7F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZM1NZ1Rm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tw89aFcoMAbPtupyVHFyVbSp5VOmsHLYKNipLSqgxraWfYXhGClujVDrG9KDBiYP6pFRdaU7jfq7ngwe3lo/qRWta+CpmI4htyzSTwjVbSBWOoxKx91TXonCoTjCDwGFCmDa4hxc7UsETwbVXoCCKAor3w24zyxNhlv85QaqLqXZH5t5xawNLDlylR8dHheOV3csSnl4NUFP2Wx4RtK5z10feu0tifu3RhA+ylJIm24fAgQg4WcNUJ9LLBzKKzMdb0nSyT3o++Ae5WHhKw78XlScpNvpN/uu5UcDJmdFfZ9B+09FNIg+fkXjRjFyHuMFiggxQSU7bMBdgEIJtUIlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJylNVR5lMMjdUhxUlnECHIEPKz64CsRzx30Je7H+Pg=;
 b=b3OfhAZoOlK+IW6LA8rD1a00qMgiIH7NZIir5VpKo8sZdecIue7m3qNiuSrb3ZBwN1ZCpCNF+TGKiXK8ORjcqjD/PUVDxZR8c7CnBmY2qH3YWgLx0D2lQQWbE/Nk0mpbRNn13rsKch509Qimk9SKPZb4ae46VNAZFbNlhGPOFeADLaqMmVzie3ykOGPJEcjEo2Vs4GvVrOgGtAbNjTgvjaPStJ6v4QKIS2xMGj27CmfX+KPfmQd3fSmBUOjE/57gr5cVTp6n9g1QuNM08CfXUgFBQqYSoF+BQN+i1tsM+ySSUPUl87uyKbwNR8VQQ7e5sewnWBg3eq1B3WZYKNFqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJylNVR5lMMjdUhxUlnECHIEPKz64CsRzx30Je7H+Pg=;
 b=ZM1NZ1RmA4CmJVM9Bht2vOgBRul2YaG7+/I0woFTsqXVPzQZP/4fnmp3jvdIdh1/CBVzOjwJfMVJjnytBLWwSHSKIpSLufVHy9zbaLXIy/o/0ZaoaMO2XV2AB/LoYvVxMyi7ptbzop4yQZGXZpCe4g7j/SV/n4TYqDlJsUp3xzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:15 +0000
Message-ID: <87r0odb0vg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 04/39] ASoC: adi: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:15 +0000
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea6245d-a958-4fd2-51c1-08db986287ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xwHi6/POzONPpotyNz0gnzvna3NpaVtEM0sDKL3s7rrWX7mogDCaf0JqRfcEXKRcSi/4UVW1bYNtPjb5NtMpYh+R0uXf2ezgkXIlCq1jNmrP7bKWzr+PTSKRJ9wmxoC6NdS9rXNmTcZp5SXQW8ukJIGO5pj+IV5uoBSMUX1qCmwXGWidNJh+PS+Q3CxUQRzGt7ltdLYutNCSCwkis/SSYhZagiuRAC/Eprih2xib1yUQ0+3vH7kydZAtLCup+lozsAZt5LITmrMMtJKr/GU1mp2z0M1/gg4JwFxiLYbcNDzfElThs1GmdaOot+r8y5PSGSOaF9hQ21adNMP3Zt8k1uZuklWO2VBx1FL7wftaf8gcHynSBmSLMPt0AxZKj0n9VfHpZKo3DpA5V9CSabSrFdazfksM75iaI9ubebd3vZHGn9CF4nwqgTzmdXEufW9fJC21xhz0BJi85+V+PgZASrNY3ds5c+pbma1O0ISwMIoVAmjUKYa+rY/qozj2p722FEWblgq6Lm0Ur6DZZrdADtJ+o/+kOLhENB46yjde0g00+7B9YH9Qki3lf/Uavx0EpadHCVp3K9SL+gtPKdyztm5wLYUElBaZ8DCnSmyAe6pABxCSH9yT1zDpvSvMJScW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(4744005)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZUbY8npOECE82sTNkSVeomOyFU3zv5Ts3xm6c+5VAJlbnak90O1IPMVhcABc?=
 =?us-ascii?Q?yDlLT2x8+vbjDnhcmQ+UZ4kRRfAS+tK0lqXLQKSiauawSUB8+o0lBh8eFM54?=
 =?us-ascii?Q?UNSevnQOs98TcAGUpMYyERnEpjCsRI6hvpznf+jbDZSc3ppljUfNkQWwqrkz?=
 =?us-ascii?Q?wMj3nfMptYaByho0clxhXxQu72g/RBoMeErwWaRTWk6Kx7CIm0R2ZZ+q/qsM?=
 =?us-ascii?Q?l6obPFmzFqGvPIrcoXeOJ3LkvWDdZ7k19ihKNMEi4Ue1w0oNDdvzAhy8OrGN?=
 =?us-ascii?Q?HJgbbiclArh+tKBhfV8zErVrbJdzFKHwivdJ2UOl00QLsvmSksIGx55e61eH?=
 =?us-ascii?Q?H4JeeU2pkwCtIyISfRKYXubAm+U179cb8XwnGR0fVwBU0t5qQ4JOKO+Bndt6?=
 =?us-ascii?Q?pxguk5u4zUTqrTxnB/3v5mitE/9lcNkiyCY1JrT5S4boH4KFigfNjW2KuIdL?=
 =?us-ascii?Q?WElNfn+I/l4DeU3ZrMPoR60v7zWFzxVF6l/HcTgSTrWhL+s+AbyS16bc0881?=
 =?us-ascii?Q?NgNz3Dz9rpCIdcNdkOeM/l1dPc/YOFFRNZd16AIy0RWXykhX9YFCIqn9BHDf?=
 =?us-ascii?Q?eebuEDdPdiuXkNEnpgUSIGIKiOlP+7OjQZiInh/NRR/mIT8A7XdP0ewXPymE?=
 =?us-ascii?Q?JWPbTVa3JCtUvhg5n2k71J5S661P8SQcEZlpJD5g6Sce5suutiFDNvWft/gt?=
 =?us-ascii?Q?F2vLFwZ6LMw1PIKqa0f2M9xUwEEkwSFLfUNo2FaJDyovYuv+uEXuTI2NhbUS?=
 =?us-ascii?Q?ukp52/gMD9zb5qjeOTcei6wI6hITMIqhj7fUkh5gI24BMp5ZF4IKnteZOo+5?=
 =?us-ascii?Q?ytoP9Bku3iYgMKDMwoU9bF/pyQ5EPUrWXfcbC4V5HjjQJPLyOHig0Y03dsCa?=
 =?us-ascii?Q?slJFdIiI2OnQUJZN5uKBOg2NsP5pNfWIKQOSqXAbYPiklyR4MFbtMrj0hxNn?=
 =?us-ascii?Q?xZ6Rn6H+KSoZ1MIdJN3AxLjudYL7N0oF4EIYJvW3phhpb5Tx5vcd4fiCVMCP?=
 =?us-ascii?Q?Uclj2TLikCArd6v07AAyhPcJtfT1erZVH6/qPB4DmbDKDnYbLtazOmOOscHl?=
 =?us-ascii?Q?WDFdNuX8iBoaaQ0oNrjMBv2F1hSWamkEHVD5G6uCxD2BQi1T3F9mjXsfU1jG?=
 =?us-ascii?Q?AT8rso3oDOffTAWg1ex/P0/XST+Ni7GAHj1cka9jaB49FSAMSmgWobTe6wjb?=
 =?us-ascii?Q?MPGgDaIiEHUarNOdXe3XEcb1G3pP+EnBedsWobfXJcQbVNiV9ZtEEIaQaqZK?=
 =?us-ascii?Q?eTWXSXP9GUej+NR73heZejjyk1EzaK+ff68RvFCo0Qt58OJUiPfBWqUscN79?=
 =?us-ascii?Q?0WVlC1FzYYp3f+e/dml0aIGqUfRvJ6RF0kefxU/ftu106DVEKgX4+if80t1w?=
 =?us-ascii?Q?s7xBFWxZtVV/NvGYnfv/de7RsZEjRXDNwGL+O+dGfQXshGkDssGI0FN+1ODB?=
 =?us-ascii?Q?naE78lz954y6gxfFCZlbPRmV7A9uLNeKrfguGEiaLPG24U+Fv/3Sdc+GkTM9?=
 =?us-ascii?Q?IAuiSInFIeiHyuHmcwfRc2mUJoiQle9FOaMkSZNCJ7csO1zU6nMcB0kMf5F7?=
 =?us-ascii?Q?kPZ4WizNhfVGkr7R2v2GPol3NBhsSo5Gh7+Av2voldiPIrbQsjPuvl8fi3sN?=
 =?us-ascii?Q?VgJhTmkRzzHOrEYmwNFoNeA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ea6245d-a958-4fd2-51c1-08db986287ef
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:15.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t6FngVQ5j01y02eB1y2Ah92q5+XgVwj580MP3Sg4TqkcBKmBQIscy9oesP1Od9hnEl4za0QkabgPhAHZxTkR3at0ZyS+V1I98QCj2nBOy09KVqOYFD1IPKsSrN8oEFBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: X2XBAIVFLPHT4OSDWANN47NKXVIWKDHX
X-Message-ID-Hash: X2XBAIVFLPHT4OSDWANN47NKXVIWKDHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2XBAIVFLPHT4OSDWANN47NKXVIWKDHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/adi/axi-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index e4c99bbc9cdd..10545bd99704 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -148,6 +148,7 @@ static void axi_spdif_shutdown(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops axi_spdif_dai_ops = {
+	.probe = axi_spdif_dai_probe,
 	.startup = axi_spdif_startup,
 	.shutdown = axi_spdif_shutdown,
 	.trigger = axi_spdif_trigger,
@@ -155,7 +156,6 @@ static const struct snd_soc_dai_ops axi_spdif_dai_ops = {
 };
 
 static struct snd_soc_dai_driver axi_spdif_dai = {
-	.probe = axi_spdif_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

