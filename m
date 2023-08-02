Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BB76C1B3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4668E836;
	Wed,  2 Aug 2023 02:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4668E836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937723;
	bh=F//vrXsNL9/LizxvQK5GOU03PkOkreAf3NoBESh8Qv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LUHdAW+DyClNJ5P5SEEuF8ITdvLBaz3IdVimooIBe/ZV3dGzJlt9LlthlexO1G5Bw
	 UZFLEQUam/AHhNCjP5ZpMGMLr4S7K24oM31hxpLy283ZX0Fddh/9PZyWxPUcgmjtMb
	 UF3J2K/dUsQ8/N1QIbCJZEWgOH9pHB7MmNoQWqbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA9DF805B5; Wed,  2 Aug 2023 02:53:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3D9F805B1;
	Wed,  2 Aug 2023 02:53:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E90FF805B2; Wed,  2 Aug 2023 02:53:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EB68F80425
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB68F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=U7Ridq2j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijVWrBaG2yXLF/LB0zRLFACVogjtuOtwSK6ysvs0Ich2uZtdujxe82TLaWpeICurdK3hZxIsEpbFLz6N8n4h3oB5eoe7fJJhCyr4I9zlvzQxa/DZUxZI+A7JOEP5Wj0Jj2nBOmFvm0FMNUDQt2MND0urNaj3VJg/Kzx9jer0Hvs+OjtEwUpfJEYPErGMe+zS0TRwZg+X6Axc4WmDqbxNfaDGZCrr9xwpFRjin+73wclP4gamukFW9SRgQ3X7yPMa9JVKCFQJlaKC4zRfX49w81AG8opSF/BgvqLU82FqVbaE0THIat61eEq03rQJiyUVOl+f5TcD9cyzY0c/+9Gyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uULtnjeH9TM9rI6xly8bh1Pvoy52lkgi36kj7XerO6Y=;
 b=Fen/UJ63GjPHNdIU7kzVwGDE9rE35I27prVwB4GosQyC0A6uC9cX/uVC0QfnZ1sHN3r9Ik6heuT1jBHuBC+SmoHvX2oqzYvnG6l9iJAiTgITu4GeLvIv4BHX+q9aapr3BA+p2FH9RTuZyPYorz5c2QKvBGsJX8Vrid/k9oTO/cbiNdTjPoOWibxG71TpzNMuuH1a5vCWIla8D8o5T/rWvXOEcwx2F3ZdIZ4hRCICbT3/bIQ3Rms/reldObysTvVUsQjOHZYV+ZzUnZB/E8FTOJ2ryFpyIuwR+5VNGVJFu9NopbeQcX0X/l1vb4JAuJdvPnr+3vVvNOAoC0Z4NxOLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uULtnjeH9TM9rI6xly8bh1Pvoy52lkgi36kj7XerO6Y=;
 b=U7Ridq2jiMt4sF2oYP2z/mVzwvF9+pEJu9FtqxoRFlWiSz9VqeKODIPWAD95QIHBR7ZN/xLrbp2S05oL1fbod1dgwhFw16XGL/JcyYVsbTWFDlC0wuu0ZWKlbG08O+0EXeuzPwoOMU6zGnAFpi6K/J4Jc5Kp2QSXZQ3jxGz9IFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:53:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:53:05 +0000
Message-ID: <87zg3atgcv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/38] ASoC: pxa: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:53:04 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de0cf46-5ee1-46d0-4c1c-08db92f2d493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nzAr2rk7I8HVr28svBOn9jetb3NutGr8e7734Va7GHZzcqboznRJ1dtWnMYlobBcQnitqwuYbFnKjZgxdm9yO4iU+kADXjuYeMy5tZaXuB1GMIYRRhPNoO5YKmUiVsWw6D0JuKDKNjvVEyPf2H17/UfKpMS5292Ji0tdXKFQtbvuoPyQnItx6Za0TNCP0tnF2p56JsvWxaFL2tEE4/0AXAGMjBd3evR9mKlm8sqf5HEyPz2NtD7jjClUQbOIX08Ve08VPFtCR8Sz4jPsB7sPVure8zZXf4iBytOXMiPjvrDufGvpxTR9Ope4NklB2opEUGhIfpJ2fcSm8XLTW9v2UXdGd8RnANWffDjJ2VhTsO1RV+TgMaYnVWQ0oDQ/z9ZxMRuMowwxL3Wuq8APmKk73okKTK0KhfgLrxReYauMGnjHUiCKzqey5AH2lNDpgTsb1PoNcY/qWW4C4oKUY4GtxnyY2Ky2P3NY8q0IJgpWnVpSkRzyQCmwMEd2ZYyrMnADm1GRjBDv7VUk5yV9QnsLkHBij+gsbkRlr90g9g+WfqmtAj4Shre346LblwiokazF1hXTt4Nb4kdXO7d47/EBwn1eb1WFz1MgdAc8cBGQ7Jk/mepwNNzVmF2DUE5Htz6vfmuLnPQW86tWBFZRRH7Mhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(4744005)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8wpQ+DWLTPthnVPV9m0fVGP7KKDsjYB6WPGUxQgEHucLHNXkUwJhxcYBJyvO?=
 =?us-ascii?Q?OAHQOns6gb/0gJg9N7GlgSt8iJ42WO6B1VijZzgorgrVQXGvm9tG1rWqwunX?=
 =?us-ascii?Q?8fOI2QJu7wMJEQ0wrq0c5aviwrYcWkngDUjCuRQ0X13bGhlOjPwrhXUQrJ5D?=
 =?us-ascii?Q?MzLGLcOhZY8I48F6J4itP7jUYsRQnEniTCHynW9hx3U952TlKDbj2S18HRG8?=
 =?us-ascii?Q?ZmFeNtXHlejFQ2KFZkW5WdbD4OwS4XQx4rs82Cp545lbHcOM3Y9QFMQLqu9M?=
 =?us-ascii?Q?070BxipSM5IxH6hwIRWx/Itfb4Md7TWKgKmLkPHvD/SXT6ITGP46xzA22xJB?=
 =?us-ascii?Q?Y4FhckpYncqVDJEiDCbFUcukPjc5Ne7+btC6hs/FsZ8j7PVWLbS7DQXEdFGM?=
 =?us-ascii?Q?KfGKpOGFsDB9ahMr/OvWFALuIy9fXPA26/++ls0MVJNbRX9q1gPwgZfvoxYN?=
 =?us-ascii?Q?xN9HtfcPpWhmVokV48g7+tsURGx/8CAV/lgf90/Q5UDM55U++36X84+0RFOu?=
 =?us-ascii?Q?osbdiJwQG6RSFkasstqrp8jlG32/WQYDJ1SSvtMHFzLe711gJQN3oi3Mda46?=
 =?us-ascii?Q?DmHYja+n+AWP8T7X4Tujfc99WRdcSs1vA6D8o41Upi+FwxvqmJo2j8SkzK2z?=
 =?us-ascii?Q?qVmCUd1M3b4NrZjdQo36Zc7PiYZxXncI5FsOtmJ+R3FFHw19csHFtRHf5TAE?=
 =?us-ascii?Q?AWUJ4MP99WzAGJNcywZOhCF8lVW2RIyzGurn4tt9FCbsi927xpIhJB8jpGIq?=
 =?us-ascii?Q?R+wJIPHuWqCq/JmT9Ja/D4uOXZu1V3hdxojmJ6crLs3w17RnAMDilJtL/3xH?=
 =?us-ascii?Q?U8WdBhqk6WpWggLdSJzK8W39a2GPhHiSLRiUsecDXjlp7dNic9BygZ7kuKv1?=
 =?us-ascii?Q?0JMfjfnRB86j2pGtIDm8a54EfsgV5T+ooaFdLG+nSAoJfNl4DX/CVsN5rNfA?=
 =?us-ascii?Q?0oCaeyes3PvCl7ualioX/l/5l9KVrOwK/VS426AOPFpZlm4/aUW0sOuQ9+lz?=
 =?us-ascii?Q?Xd+PEFgmXQN0VYYYoHzva/0G3//EsEszXxBx7ztUq9VNG0ljDqp+8HeYWNvu?=
 =?us-ascii?Q?AT2QuFefNVWJy9ZZ9aQDmY3k1xvVqBU8YiencbRhGlBmFDs0rZK/M7crkSzD?=
 =?us-ascii?Q?8AyRH9pVg2Le8cd8pEPHm7CyVftmc4qI7A4t80uPvSZpCsHNZPK2RCkvnUt0?=
 =?us-ascii?Q?zCuG5xYbS1JDC1X6YHzfwmJSLbYKGcWWsM+b7hCL5Q3qKYcNhDCvX50PDvLK?=
 =?us-ascii?Q?I7asjroOOpAH7WJ6XUuJ91S3hmxxF0eLd2ZUg6ovcquYO32lh4vNaKMngZ5m?=
 =?us-ascii?Q?ZRDcQxSw/EVGRzAZ0uzr01eCig7KKDeK4qDtdpTHhcTCjyP3B0MICk/PBVzx?=
 =?us-ascii?Q?RWpelFJ007bh3o/ECnYYuil9hlGxifT0SE4tGqudNgf2mi4qBek+wOBGD5eK?=
 =?us-ascii?Q?Ra1mcHQOq2PTfb72Pe35RpC+Mojs/11Sc8ps56A+E/oJHnHxyfi5NbiRPXq6?=
 =?us-ascii?Q?s+MMM3QnddVOe1ne3JQBCsZRF12RIAeR6hF8ikwY9Y6zNpjj4AylNBdY+Z3W?=
 =?us-ascii?Q?30nZrWNI2B1+cnm009UfgDqOwlGmGrHZlJW7d8Dr0XEsPtNXFAzTQqoHoRUl?=
 =?us-ascii?Q?mmQS6L1vIN2YlIgwft1DvTU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6de0cf46-5ee1-46d0-4c1c-08db92f2d493
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:53:05.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QYGScysoyMdVuo8wNyPTMngk5JbV+07YsvqbDYjficLfElKPrYFrwa+a/XO5ovXoC0jvxIgymaUbVnn6TU27ZiQPv0LYHRPIijdoTN3/CzAY3Dq0bUL2NonuzOlSacT2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: CTDUVADSLR34XHN5XQ3OJDTPY6UHUHL3
X-Message-ID-Hash: CTDUVADSLR34XHN5XQ3OJDTPY6UHUHL3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTDUVADSLR34XHN5XQ3OJDTPY6UHUHL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/mmp-sspa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index a1ed141b8795..abfaf3cdf5bb 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -340,6 +340,7 @@ static int mmp_sspa_probe(struct snd_soc_dai *dai)
 		SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
+	.probe		= mmp_sspa_probe,
 	.startup	= mmp_sspa_startup,
 	.shutdown	= mmp_sspa_shutdown,
 	.trigger	= mmp_sspa_trigger,
@@ -350,7 +351,6 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
-	.probe = mmp_sspa_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 128,
-- 
2.25.1

