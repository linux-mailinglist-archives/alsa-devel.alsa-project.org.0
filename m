Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A92736066
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80475852;
	Tue, 20 Jun 2023 02:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80475852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219579;
	bh=sThBh9CANAyFgEwOKlVIZMDiX8/Hi+yxljF6atV4/HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DrdtMYqmrg6O5aJxy2064QBfffvPuNATnGRM9t+x0Js2K6hklMz29MF2NnUNOgf+q
	 BzBNQTxhwcSS3cj9zTt9CdIpw8Haw5x1QKvyzs6vs1O1ncLpnOTz9Pj9AjiEMhP2Z5
	 DsI2yn3OAqFOGuoSGY7GSlMnrUUbPD13x2s5HKDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CCE0F80124; Tue, 20 Jun 2023 02:04:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD739F80132;
	Tue, 20 Jun 2023 02:04:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36105F8059F; Tue, 20 Jun 2023 02:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41868F80589
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41868F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XxohC9Hn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX8BvZV/9MbFFYYwdEYvge6AOZ8CcfwAT31kuOKFUz4IaPiOJtJ41N0DMo+mBhavIB1fPp3AvNQWJylVR0GW+qzIFGR4ziQNmiyLNH9CSLsstctu5iPlxGdysJiKFldTRwrYePDdqHYp/tZ7AEXHzVN5JPOUMxMzT+/QWXiS3QwqtlPVcSCPAlB+M0l4b8iWwfZYmqj1vlCNgt5AsDIOr+iGn14sKXymtsKohapg8IArFqbGirgOCmen2qEgjvDAb3rmRXRVqi6rqbQdZUt492Mda7+DZxCugRFhVd/GeXmsSLISXLLd14z0Z825GIGyb05NIeLf2fpyu6B14Jfpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XArk0njumHjOYVXHbxOAWfCFth7uv5h7+T2/ANYBKo=;
 b=P+8msJ7QGlltWmNlBBybAIcISDbXuXGtomd9MRrZzWKkZy51toiyBkhjDBYE92uSdCSkDgst4UzCGez10hY6CPDvCZAg33ViWptxSKw0tTd5NJeBWXCquh2TonbEAZp2Ps9oelcr9q6LszrqmFugHsktsIl6+vBIVjUit5f1IQdhezQvvP3T1y5ntIY9eOuu5qNi7aTTgingBU9tRD6cVeObmdHFv305odKt+JU7Y6TkuTZag26qjaAV3cLw+yXfh5OfXv3EEvGIFgrJ8Rr5uocJ3kvIT5dRbrMkIk0F/s20T7g3MLdlsonYgeRxb2BV+yfZduUxBmlxD9VzQpNhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XArk0njumHjOYVXHbxOAWfCFth7uv5h7+T2/ANYBKo=;
 b=XxohC9HnQ0hmvKu39hnqDHdXIEkQypHGTgUQ1BC3klAGMpy5tG73m6E7n43Wlmppav48gvJA/SSkyWefYh2fXZmC6kStGYvq4opDOIS/xHtllCl+T7f1Bx2bg75GltK2jmhkkx1TUOH/IpYW8Bl5UZaXQJl/vLkyBAz236rEZlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10425.jpnprd01.prod.outlook.com (2603:1096:400:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:04:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:04:45 +0000
Message-ID: <877crzdmn7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/9] ASoC: qcom: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:04:45 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: b47ce5dc-f4d6-4196-8e10-08db7121f485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JkqEp1hfexzYcNVC2qrvbS20lP10Z8U9ct5ITa/0OfHy/3GXI/+2qWS9+8gaNY86HVtXtbaegZvvSgjBaUJvAGNgXgza/Yg/quSy2ogPUdIqpmYmHLKKByyzLyDkVx51w/i3EsRwEfd3NXR6e/brvM2oojlAs0uIN7Iok7eSDlNnA4Leyy1jiW4b2g3qWE2Zk/Y3Rifc1li8vCiwz/a+O6VEP5rXYJYkNaZAqpFzS1eqXt8nyMFVEXsNrX+PJO/MauD4PgjhbnS9dZpTWhGqtpA6nuTwRfdKMg1t7zbFSBlqtlJsvOb8nqiUWKXcIAEhclIvSQujiz5aleFK5NYn6u7YllNorwV6OUzKWbSF1WMhjFngide4/dqVxbN20MLx6EuJ4pqjxWc9gCme5dxTYQAmnDiZ2v1JPREB/QHmFGC119XJMc0v2zIpEboHYf3zAXNPjTkMjVLtWT2XVz5bj5eZtZ+lzDC5yAun9lN5MuT4nrXI2yLMdVBlanAYEMC6GDn+6jusP0WWWpxv5zC/C9lscrXSuJksMIvGTZbJ9PWIcY37dxqPclGCC6LAkaeThoPcPpT3NGh/r9EEE4U3DSnQqr+LR6IL+OHcQwSBXD7+sETkXrldyQSJYiEoHzRr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(8676002)(8936002)(38350700002)(38100700002)(5660300002)(26005)(6506007)(6512007)(186003)(6486002)(52116002)(86362001)(2616005)(83380400001)(478600001)(110136005)(316002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vxff+HuwK1YXrcD02+A9QyPhqdsqCA4MbZ795PF31OL+QmZHQr9qQv0zEonP?=
 =?us-ascii?Q?EsE27layCLjIQlujvR6uhSTYv8ecIEZrBhoS83bRXfjnTA6nO/qAWF2K0qvG?=
 =?us-ascii?Q?0HMTOX4VpMCYQ4jC0HI53qu2K/xHIxoFE5t609GBSMRGYmI8ZFyi0j7y4ySU?=
 =?us-ascii?Q?1PY7prjRy5W6UlPZyiGnSOMjS7j9+v/7IqCZ4QxZMFxTQXvmA1hClHZA5Fva?=
 =?us-ascii?Q?aWH6I7KgZwW2NOb3AX41GmYMDD8NAmG2iy5avgx8yBqQn5mT+bd97xRS/0Fy?=
 =?us-ascii?Q?RTYDOgyhQ0XUeBLHI7Ge7lefh0iGrYKjESbgTJaYvQNeH83sxRwFqaA91i5C?=
 =?us-ascii?Q?qBrMCUMmyfR6vT8tZ65HdfeaE0CsrJuLiAyt/z/WNfi2eJQc5rvmlZhNwfcc?=
 =?us-ascii?Q?sqXVqg5eHbxQzTGelcw87qmzu02C8NWKa34Xu0kTONrXHuIC3GUK3hOBKzMl?=
 =?us-ascii?Q?zagayqOdsgvmziQ71XW5jcCGeZ/VsgyM9QmjqXY9hz5qlg3m8vHzoO6VDSnv?=
 =?us-ascii?Q?oADObSb8JKDLk6oE3CyflHlsFcQoN6166BmSEscDLHzkqYr8tyJ86ShL2zi7?=
 =?us-ascii?Q?6a8GjJ0YclNBWURm29YkMrvRqBxjDuvvVWuKsX6ANbTHRvlKO3EtSfcSuTo5?=
 =?us-ascii?Q?5ep/rUHMfkqgO5yCxgY7oVDO5UQI6PK4XX1PstZe2+0n6MXEAp7TWjSdAeJi?=
 =?us-ascii?Q?oi1tk2KJLVNEmdD/3Zt73SadETj+tSvG3jVUDPXUW6fGiolLUClJ52t8VRR3?=
 =?us-ascii?Q?7yDLYIcUMhvepjb+eFRuQftYgpM4rtkAeoNI2gVK0o+44JeObI6X6Z5cluJM?=
 =?us-ascii?Q?QLvXP2nGrJqnjwymHAfHUeYbGOEG9H2ijyrSMGKjXydRmZVVyqPrrLxHvjl8?=
 =?us-ascii?Q?GFqKh6kxIb2Wcwgk1hh/4L5kkYm9X+DV5eCVSWR9vWAuGGPQdO5hoF/Ef+Hb?=
 =?us-ascii?Q?i5GeNhHJFHEVKYJPoTM1tH9YDAlWUEGd2+AWLgcDvuO18T7Mkph+pBkIfq3B?=
 =?us-ascii?Q?bT9YNMXDbWQ4x3mGpQ6TryOhUVyM66ASAtfGQPRMkErEyzC4Tp/dJK9fNu6b?=
 =?us-ascii?Q?d0wIcMfZHJ5M/ztBzrscYDchobWLR4DfbzWempu3JkMFVwHXAtns4s2dBZsx?=
 =?us-ascii?Q?fvf6ztj6SYKafzwoQLNZubfXQnuqtOslbQJxYZ83wkqrtzFhJiHf6MXmuQ4M?=
 =?us-ascii?Q?FS09Zwx/41IIOw7+lFZuoGEbG0jaPIhl9xR4m1SZSa6fEoy+4LIUDzNh/H/0?=
 =?us-ascii?Q?QXIwsvU85SUKyIOrHJWwMOFruYIVIZH1IHXqfVbm2dAl3iV8ehdiFYRY2Mnp?=
 =?us-ascii?Q?yGVfnWr0dJZFqoneqB7EU7BDECHS73ofa5nQwD+OM5uIM3t97qHwmqEOM55+?=
 =?us-ascii?Q?V31DJ3NC3GTOzsWbf2QXQ3Lp3JBxr83ZzLlY1n2Sx1OkUxrbu612efIhLTCL?=
 =?us-ascii?Q?+vV0OpCClt6kzU0aCQeQN8QUUHchuLAALp8w3OzS+shLnj0+Wl9q2V7bVRQi?=
 =?us-ascii?Q?QW9p7PWp+SQFlIgTk0p5F3sX1o231vgRV26xuLHweELpIZLreugWHIdHItRC?=
 =?us-ascii?Q?0I+dXFQd11QsyT65/Y/8APgxlIiQIF9jffIn7VvmfNUdm0DZ8kFRfptxnW8f?=
 =?us-ascii?Q?lX6T0WaLSpYa8YwLiXJVVOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b47ce5dc-f4d6-4196-8e10-08db7121f485
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:04:45.8498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XzGrq+CeMXW6fKUzZ5Ts1h/7YGGGYa6AFHscDCg+1UA4GctEqsLI5sIsAHz2OLz+wBFZHaIGR9tnR7wOOp9LebsEZVU1QfqgMtADfE/A/sh87XNCAwMWYBB+9FwnvOrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10425
Message-ID-Hash: YRFUT722THARXZWH4PXDTDT4QXOKIJTX
X-Message-ID-Hash: YRFUT722THARXZWH4PXDTDT4QXOKIJTX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRFUT722THARXZWH4PXDTDT4QXOKIJTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index d9ebb883b999..43b0a888f1e8 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -96,22 +96,15 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-					"#sound-dai-cells", 0, &args);
-		if (ret) {
-			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
-			goto err;
-		}
-		link->cpus->of_node = args.np;
-		link->id = args.args[0];
-
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
+		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
 			goto err;
 		}
 
+		link->id = args.args[0];
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
-- 
2.25.1

