Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCE7277D1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B18D84D;
	Thu,  8 Jun 2023 08:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B18D84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686207068;
	bh=q4P+NsLb/c0lnXYU+z9HZ/DfNFXn+6KEgAJ8+ZVMqtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hj513mngmJ/bduzn/oxdXKfHxdWEHtoAGnusL5aUA7HzWgpiklsN0uFXkbeO5puQP
	 6hj4+e2OKD3M47buJt12dI/qcZhJA1H9f8Y35XoUMOBZOoIAM1vWJSyDsbzaKrNJEf
	 iQWIYKtPgBVwVYvVFABazXzlptSdNp40vr5cunuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0882FF805A1; Thu,  8 Jun 2023 08:49:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11742F805A1;
	Thu,  8 Jun 2023 08:49:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C274F805A8; Thu,  8 Jun 2023 08:49:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FD49F8058C
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD49F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EWhV+0cj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INqvgNjexRHr9Ew61rXkOIBr4IrEikrZYuulMwvvsh/5uBkMxNWDyb/Ht/WpFbQCH0C34r7wdR2xoYV+NGpCihdK6YXB89oawmdg6D4LL7LsaBi73TifezHR4WS6TEZkj6uNT76SLuXYdTGYRlo+lTU0KgZAj5x66s9GmLYQ/J+sp32i7S1RmFVUv9r0TvrfPfOHzDu7KetXVYMajuaN/TxaOCqyl8/95mhK+v1WnAZf8O8QUTdqLvW+GXUjhJ1b+C2nWDMizD9+xlq6sFpz02XrvC9ANx6UXKMMq6B8kGfe8PDv9+IkDE6T5pMzMRBz5bDP7I7pcGrIqSCWFBuhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eGlZ/vA/Aq8vSCJ1PnfCAJ6gKdI2REhaMBdsCpOLJY=;
 b=LsFISanj5ZH12cgGf44mlydYTQbhn/xJlBbCImLX0hZfZU4fShz0DjXpCg+tM/4ahf/iKmnGkWuHg3RnnhAQijms2RWhDdE6hzlbew4zZvc/6ou20TvVPG+uhAen0GzWdsMLjcz+RKfJDP8URtNGVCILywbB7PbcMJ/jENOFJfr2j1qO/q3l8Do5wnrv9cEV8SmNS9rp6fZAL6rDWjfjnIyw0MD+RB81w/oCjFjGjMoDH72SISR7v/REAsvHTgB4U0Dgc2xrY+eYGrkFezJiAE0esnADt2QMCUSdv08dLSrvbeZBOev5zV5XnzmfZfXkX1KZbWNguvh4+GX7M+kJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eGlZ/vA/Aq8vSCJ1PnfCAJ6gKdI2REhaMBdsCpOLJY=;
 b=EWhV+0cjEpn2zJPkZg6ugCx0PnSSiaVsnL25N0vHyru9CIcCnBqIiCj8wCFsrUgvu9EgGYYFBxYn8PwqUsG9QYg5Ofby0EjwwwtCsSKZ08WuHGVCs58c7TO3CPVCaExhSrN3liTOQwAuQkYejTNu2iM6zfhAyvMm/MbxX7WO1+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9300.jpnprd01.prod.outlook.com (2603:1096:604:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:49:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:49:04 +0000
Message-ID: <87mt1afnz5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/5] ASoC: starfive: use use new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 06:49:04 +0000
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: e122f29a-deb0-49c5-f915-08db67ec7351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8bW0PmlLc/QzObiWsTRM4yFt1qnqG/VBtSrXEwi/DLUbVhOLmWFhf3Ne0hZcQH2ZOCyZGJ30FEhbDdr0NUWJRDqK7ZSR8c6eP0j1t1JMsSBl39TPJzTssjQLgt/nWAuOtngUZa5t+R0fmyAmhGxF+RkvDr1WMQPZHzj2OfenRvwZ2WdjI4+T0QFTlZ2Uq7RYcdjhvfm1tR00bNUyUQPJR9g2vOVAD2BH/HQJmXLFSguQqTmWLZnjgokCiO90Sw6DWAL1mfpDHV86VS8B6hY9XXF21p6SoAJ0OQS5KkWnmaG2dvM+OLrY3IGkoArWL9EuHxgvb4i2QX/pW0TPqo/HBE/otZyXJgjFCQ7wiOTdGac3/jxwHQjIFI/rNnkTHoLX0Urm8s1BjOk5Y9sD9BUnZKVLV3PIPdG65lRJtJGu5RawrPgscarCiesRLOfeqM0XZqZod/clu/Gj80YV7IpS5ER4J9IPC80ACNWCKIdvTyw4S/N73RFB++W42HGU1JBwH6S8suJVyitKcV6lkoGLBRvLBUGGluQCalOrNTzY5S4aqK6dNfh6Hl5EeE1ntCnrUrOGb+47HTNT2ieUp0fs1K8fKuX0xkKU/bQgfH2wI+G4sl+AoE585Gkp/w07vHuI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(41300700001)(8676002)(4326008)(66556008)(66476007)(8936002)(66946007)(110136005)(5660300002)(316002)(2906002)(4744005)(478600001)(38100700002)(6512007)(6506007)(86362001)(26005)(38350700002)(186003)(36756003)(52116002)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TFlRWOjGFVuT4QFUBZcoib/4rXDOBHeXAlXJrS2qY6IkgIU6c33mZUPwcZRf?=
 =?us-ascii?Q?wppA+2+htzy3L9Dl3ALhVhG7dm4G98bwTQsv7XTCoQVrbz16qNH/UVacZ2ew?=
 =?us-ascii?Q?ZCUbR7meINMNCnNiY2rn6GnX+9jzt+k5VSZIfkfCVrAmX8SZ8SRc4EZyXS03?=
 =?us-ascii?Q?bKDkT/EkhwUJjjyit7vlS4Tfz5fGBh+g1roPD5sQ6KKcyLQxcnhcFv5mFwzy?=
 =?us-ascii?Q?9kufKrvmcG2btsBm7weJY+uiXzsKoQq3ynLiZULJ0f5yneCXJBn/yiXnKNFh?=
 =?us-ascii?Q?U3IzQiv+jqmIOgsISYqrg5qL/zLfY8aENM3oMNVft+pMUIr/zYeZkAI3T11L?=
 =?us-ascii?Q?W0qGAFziIE73Oxk2QNkiUyyMz30N12+PijNTqqJzSe/RRWN7BxyVf3QTbPCu?=
 =?us-ascii?Q?GeaKUbDEuLPJyNKqz/65ZO0JlpTq2s1GOob3bJM7oM7bHMctoW0yaQSVY3pw?=
 =?us-ascii?Q?2Rplcf4td/QWTCh4sFOF5n3MmzwX5vXNwdS8FKzpEPSEmmAG6yZVQnJdpIqp?=
 =?us-ascii?Q?aLwcwFstetbuD1O/uwdB5rt081eNPL0r9iyBK92Kcx/f3aUm/ucullQOMms3?=
 =?us-ascii?Q?Hbb4H7vuTfZEZX8CT9zXv2buin9nrGNeZxw17pVjieE4Q1nbCb34XBEqQLsL?=
 =?us-ascii?Q?lsY51EJVbX5xH0XrcHCiRUCekf/hoOnmkElLX7v5YLbGKA9y0Aab7IBgwJq+?=
 =?us-ascii?Q?NbZ4cjheLSbQeml1+06jdvpDscsn5PIAwge//FbyG9uuRpy6WrXs06Gures8?=
 =?us-ascii?Q?zj+HLaIJ9Fury1bCARpqnDedr+53WPFvZ0d/dYEQWBkPmVyvvUcu59AlViiK?=
 =?us-ascii?Q?hd26X6eW0uo3+bP2gQoBunpvepC7lZx6hgtJGQkGDWqxgXj/Fxa2Emy9nlWj?=
 =?us-ascii?Q?pPS1A73fSXFYfWWPCeVmSrFG1Cqu69p5FEfgwkLwYOBuZIJ7zsHc26InmWG9?=
 =?us-ascii?Q?MfA9n/O0Pu0Tgb5OixHpmbeSdBanksb3qY+V/d47z8KXTa6Qra0MdrDoTrzL?=
 =?us-ascii?Q?fW5H7CQaB/UNXwIkZv8h3qvMnODz3LN4ur6jNsqi9LWZKzfw+pStCFTammZX?=
 =?us-ascii?Q?4YI7hBW4LC5B9eKL83kkBE9cw0gPMDKl8smJDJP82/g8lLHjryj15wv1sx50?=
 =?us-ascii?Q?V9C6zJYP9/hHfFCRdxLNM0YKWWgyHKTfeKjshk/XrnddgjlH5aQxrUxmj9BR?=
 =?us-ascii?Q?sL4abqMU+P9nhZ1rwS6x/cac5uNIQ8MqtkCA99OE8tHSLPEfCANDq0V9s09+?=
 =?us-ascii?Q?e6pWag1ZQA8dJJkqpsSDlRQXqtUPGAZUtJvyamI1FlzvFeRmAvltVpdrfm1y?=
 =?us-ascii?Q?mb5znmjjlXKy4R2niW8mN3WoYOB8kAkng36d45fi6CYr18zAWjCDenECVUDI?=
 =?us-ascii?Q?J5JSzzX3bMXp0T0flq7R0MEghxUjFACgKLdv2Ulo2BbQtqZImZUGwjL32u+0?=
 =?us-ascii?Q?WcO/dKjFnJwXiejizaDJPzY0Yt4HIb9wAcy7/HQ4v2tXGlSHrVvSKHPRdRLB?=
 =?us-ascii?Q?I79t9eK+rF7qTGwnzCO2aDj4lw+LrXyMOjf+Vexm75lTHTbJCIS/nzmZqIWH?=
 =?us-ascii?Q?B64zY86A+/0nr6suPN4K7wAp051IuP9OAToz7ATLtoRAKURhZJMbsYBhFEjp?=
 =?us-ascii?Q?z4U22jMWecxTTtSh+eofz8c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e122f29a-deb0-49c5-f915-08db67ec7351
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:49:04.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EB4yeqnnZ5odAoZ/0DjNlveODmgoQX23MJmOriHvd/07RrN5vDzHJmZiAGzcy6aC+TpFWCiXkE9ZZlTIOHxtsX8ekkWYq50tTB5MHvIKBDYr4b9MjycHHP7mssEFIb23
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9300
Message-ID-Hash: KHHZGUFVUZAQITU7ZFD3MBJHDGFXURO3
X-Message-ID-Hash: KHHZGUFVUZAQITU7ZFD3MBJHDGFXURO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHHZGUFVUZAQITU7ZFD3MBJHDGFXURO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now supporting generic trigger ordering method.
This patch switch to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/starfive/jh7110_tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 973b910d2d3e..c4cf347b5229 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -336,7 +336,7 @@ static int jh7110_tdm_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
-	dai_link->stop_dma_first = 1;
+	dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
 
 	return 0;
 }
-- 
2.25.1

