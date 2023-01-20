Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A19674DD1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B55DE12;
	Fri, 20 Jan 2023 08:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B55DE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198565;
	bh=aBIS9eLwcw2qWqc3fSOiP3StdWrMhyu4mnVwlbnI1yA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Krd0FTT5zXqE9+ICc4Hkg/Z9G6Ymcb7CgurDsVm5julL0Cj/ywQbcfWW1vpdYMGn+
	 OhO5VpJvKxQ6cV2pZ08SfCSMcJyx/LA48B9MqhUYeaM1HqkNUixboNEvZPPFE/Ukpm
	 3VksWJxQSaX5GFlTx9zLMz9ZAEkcseKolixYR9YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7137F805EB;
	Fri, 20 Jan 2023 08:04:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1392CF805EF; Fri, 20 Jan 2023 08:04:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EDE1F805EB
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EDE1F805EB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jUfTPtcv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaJEXgSuTyBfGbOd4FdvgnbQPPR27hbK0Qbam5y2X4T/x1kx0CnOLroJXuPYg+84eFYSVrxm7ofvnVA0DYclnVPYlk79YX4pt254smfhg9PPX7OWuPllKrlpcoDpEFL8HVxe6jLeCBWOd+VIHNJ5onVtA7TwAjxzjh5dlFsEVdYvwgmPviVsMERSg2rXOrT4MHpTfY3NmzW0Q3XWO4TlF8E2VMh3MGebZuzw/G4x7000wxIGYkp+3Ch8s0BQ50wvUllg2aBUo0gJOvD0MY968/F9gZLpHnLBAIFvf43Iv5ZP/goFlatnWbvmbjdPf/EPeC68wr16pDyDtU1YWWfuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXK2sxJk8N/3kQByOfVX60fjYZw4VWoFiws6HBc0z5s=;
 b=cBkLvvx52RHwpah9gWqyOoZJkRLcNt0OiyOEzOHsVkpgvUCEz+tTS8yMJbaJMfRJ9yQG5YB/MjjISfjB49iUzMSG4F+Xmj39Sfr+qRuzZnk92m/6MI4UNeAzNKPcQbaQlriyHn0C+NXtoEAcO8RWYt0Ox51cwo3tscxNw6DATQFh96c8X5WfhM8e3Nh2ra4fNngR77YwcY1tVPdlP92D4i+b8QhWH5wSstzJnhiQZunWQwoEgqPyk1ifQnScfMBVBfBKqFUwW36pPF4+pdVvlOhZ347VuoJlnRzH7dyk15iXYJFadWna+JN5kbTabkbexUBjHlrjBrWSl0HmAwQoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXK2sxJk8N/3kQByOfVX60fjYZw4VWoFiws6HBc0z5s=;
 b=jUfTPtcvqMj7EVrxNpjAgI9Pj9GHnTMb02ytxkRpff8efGvg0UkiNildcZstlKjWaepBJr5he86q9C/sm4Kqlb5rtQoxabt3bN9omMxn4GCbfrlJsSYjPkHgwQmYZa+hqpgqFL1t+GHSp2K2slKnRzxQEDvRDCD2oCngf4IbHkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5825.jpnprd01.prod.outlook.com (2603:1096:604:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:04:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:04:09 +0000
Message-ID: <87bkmtk7pz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 24/25] ASoC: soc-topology.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:04:08 +0000
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: b5827093-d3a4-4f01-6df5-08dafab486e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UvnnJh1c27EOvMnoIKXhLWLEbdd5G+XF2zifh6NSz5wJqRFb6mREoTQqGbtg4+DH/gqi7IV7EunDrOzGV6E1xyvy162TaCFueo/20aCc2jTMWxJvq7duMjy5R8MKOuR7Hjp+kKtmau1fGezULMWPyI/Lp1pblrZ9ZpBMP0IuHQbjU3tix3QNzeyERbyA0WMihQP9+yVrHdzhql5mbA2ShefG6Ng99OBdGwOxthjVhWSPk2lxOslomRy291ixmZn5b4Iy4NIqI6xsuZYl+pDJMY5g2oxiszUaVpHfFQgPWRLmbqX6bWTT+5IzksOegSC5D6Ey45aTQNQn53ACORHZZz3gbPiVvuaso00ODM6vSMKqJq6ce3QF+gFPBlFfQUhRyQ7zr95GIsllpofq25cDsjb4ltL3y3mj4JbpxQJjhbrQp+52m74gtjLQyQ76+oa7u7/ARMraBaQ5zMDOTcZQByk/BAL823w6EvXcaPTqinwLtrR+jolySSHrCJ2/nRziQYdHhA9/rrt7Cmastq89venZd0vZnOb0ri5V2g29WKyDNuKZahpeun8U1+WuXCFU7KOVCAhMJN2Q0d32Ci9OfUMrfU8UFdYfUFjmxBirrGVbk9CVWKCU5BKbmojU1CvUV1/MMx086aeBkG4irCFuce/VuodVLndbxbloJ+wkxZVzduu9H+k5oy9oJtmo48Zn1PKA22y6VQRWoMEDqbiDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(2616005)(36756003)(41300700001)(7416002)(5660300002)(8936002)(316002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(26005)(186003)(6512007)(38350700002)(38100700002)(86362001)(2906002)(83380400001)(478600001)(6506007)(54906003)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nQbLaXH6cvQ+C8/Ziu82XqiNw47L5QLxOUpi9xTzs8APo71drklslG8WLfHM?=
 =?us-ascii?Q?IaMLAWyJPxCogCJJNLlXFkypevd/15UikH+iuASux6WJQMxakj8aX0/LFjhO?=
 =?us-ascii?Q?W6q6SvtSAdYDNb2/N1co4hT3eAsTv+3s9qK+oN4AR4aCIpTGKuzsaS9nE6LW?=
 =?us-ascii?Q?QrQhUoOfSomVnO6Eo1ZIQoKgnmfSbZbpTWLBKk+mhjW4G5d6zYdY4I06vJXb?=
 =?us-ascii?Q?5F8AigUSBcwItR6WxIHpL9OnEL+WWL7O3X2jO0+xj1M29AmFWL8iQzer2irG?=
 =?us-ascii?Q?y8bk0qlHimlNC8dbHrbEeiuyoBr1lSopCrAWs1XdUMh0kXYA7v1hvMbQradh?=
 =?us-ascii?Q?zfJW6gohcB3J0Dt/e9RZTwKb842/cO5XdVG+CA+XiG+xrzS4y5dhXtYnTaml?=
 =?us-ascii?Q?VURDsAeZ7ENOceubcQwrDLd6idbjuS2BY6/Ca3XAM+EjHkrAPKJMjgINsYQ+?=
 =?us-ascii?Q?h7tYymRD9cPUEmNRA1oVmfgjuIQeQr9uIJJo9tLzcpYkq9IDsKPFXCPcngun?=
 =?us-ascii?Q?43lQ7eQKpQDi+m7U2KZ+M/DPcByCj/9JY/bqp09XkoTUYMosOtbF7ZkkPGGJ?=
 =?us-ascii?Q?CWfWKy5d4JOCJj4W9TICzj+1+8oqiD9WuIQZAA/mSKy1DIhUKzeHKAbq4rmz?=
 =?us-ascii?Q?lr99o7G+xC4wH+0z1BlATGM5KUuV0uT3n2lCrLKcn/6gS5A69mEBNCgt57g2?=
 =?us-ascii?Q?l/9+1q45w0QH7hlQ+YXIXjix0Qhg5ru4ymAuVe+rqqp4uZaa4TmANvgmQ2a/?=
 =?us-ascii?Q?DAzp4FnRDj7wUNjU0uJBavQgsZxOuMQKtFBGLaMdu6Dvzu/3zr9os7A+Ew7r?=
 =?us-ascii?Q?YpRQwFZ0xIuXqRgZQpS2SXgO3NOUtY5J43rDjDOaqe0pdONb2LN7KxhOJBBk?=
 =?us-ascii?Q?OwqOCUax6O/45k1fEnmTkY5HYw5w4CF9AjsyJZr7rDwxVrqnMNOVUh+UCmlt?=
 =?us-ascii?Q?nhs/mV1wJnSiFYtchzoB1GUXaPS0xD3BI7FeoW/GPRaaqq1Y3JZ330x2jtu/?=
 =?us-ascii?Q?iSAN/W5gwZBhq2MzLIlTXFzF/WWnwwio03x6QcHYvcRANHlccx5e5ZN56Elv?=
 =?us-ascii?Q?FyNX9A/8s1TnnxqKSCELZaavqXq+6Kdz2Sgbj2Uj8PiOWkWI68nthp5I1Dta?=
 =?us-ascii?Q?yQMXr+9rrBU8syrYmnIvhfDujzWSrTUzW1/bbQG5h4u694LNzLeBpd0o0jm2?=
 =?us-ascii?Q?BS1+Ap/jgULm0X69Mpa5Zgn8DdXOuZT+23ipyB3ucfQlujFtzUR0pbgfsPm2?=
 =?us-ascii?Q?BYgtNucKaqzOJlDVt4O55svIx28j4Ihd7XSJ2xEcMfmbtBxBLJbW2Ow11AMr?=
 =?us-ascii?Q?cJvxMwGLMLFrE1iU1oYneAuiFbxIsgTLrRcwQ/ehqfIOYmVYn63K+PjFgX/0?=
 =?us-ascii?Q?XpDLHfYh4XUz7tCaGpZ1nr23rTyNQzMGjZRpLGrxhGWaIBqpGaA0QwLrjBkL?=
 =?us-ascii?Q?wq9vsK7nWoIf/5qf7/37Szd0mfV5mp19E3Z07L2h8+5HOb5qeLCVHMJN+fpJ?=
 =?us-ascii?Q?wXU+0ZljPDQWyaQlJMyBwZ5/BuBVPXYf+Z3P7zdGwr0s3/utUhSHdnNj4cEc?=
 =?us-ascii?Q?8gVEAM1+ZRuO7F2S5bTSSQRX6CSIvibJZs9zpYPnnPoAfIqI6vsC/5BWVjqZ?=
 =?us-ascii?Q?9Che6JJnH/sh9sRFN5VefQs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5827093-d3a4-4f01-6df5-08dafab486e3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:04:09.1392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WphmPw6G0gxerOqHQDgRw5NhEUg3eHsuMjH/PCFu+FKgNcrcCiP6o7I8fCjkjQFeMAkLj9FvDElYzqGvlJvgQF0DEFXoGxQy0Pw81rEZpGYyNqoJR2c8hzf05cxXnrUf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5825
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c3be24b2fac5..6bb3efcee3b9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1468,7 +1468,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	/* card dapm mutex is held by the core if we are loading topology
 	 * data during sound card init. */
-	if (card->instantiated)
+	if (snd_soc_card_is_instantiated(card))
 		widget = snd_soc_dapm_new_control(dapm, &template);
 	else
 		widget = snd_soc_dapm_new_control_unlocked(dapm, &template);
@@ -1556,7 +1556,7 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 	/* Card might not have been registered at this point.
 	 * If so, just return success.
 	*/
-	if (!card || !card->instantiated) {
+	if (!snd_soc_card_is_instantiated(card)) {
 		dev_warn(tplg->dev, "ASoC: Parent card not yet available,"
 			" widget card binding deferred\n");
 		return 0;
-- 
2.25.1

