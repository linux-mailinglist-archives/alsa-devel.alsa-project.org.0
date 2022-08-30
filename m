Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C396F5A59D4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 05:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353E51671;
	Tue, 30 Aug 2022 05:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353E51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661829514;
	bh=5ltHZgsni5pTlv6L85mYrzGoFsXyeliSosUVXHQjQgY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPrr8xMYpj+OfhBPMllln0t14S64b2OeG2Iv5QxmvKeKUNzb4+oUV6UsJVeYXCrWf
	 KSc3AaBWPlrlRRCWpGqMipm6iXytw/JOzFFyc5jmKE58FKEGLYFNkTI5SU55aBZ8Oh
	 MEoVve9McsvMXvjhg81GFFZjNEcaWAxHw2Jdtgf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB2F5F80528;
	Tue, 30 Aug 2022 05:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0724CF80529; Tue, 30 Aug 2022 05:17:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 714BEF800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 05:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 714BEF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="nWMyxFRS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnY33wqJ12QzNPWdOxBL3ycB8zNa6P2C9z8JR+irrg0civQthjfYMn7i8brDDM5RGPagE2mir5WFAEpPBHXpkLZJG1BYwfosJpgLU4aanByt3pH2xRicdJCYWCxDSzXA0zLlkwEK78KSacyPhMqv5d5B97AuiFlJwT0nWl6SsnphtIPLH2p3kepeoedvvbqwnjJj8+m7hLvyr4Flj0jbOecTWf0oJ9OZzMrl25Brr7sGGS1iXij2s3TeVLaI2Vckz2yQ+CQ0mOSmhDyKsg5QK/gSBLtCXFnuCHFOxUdpmPuSSvXtGYkEK6yhGrnrJALM/GGArh9sA4d/UJL439cgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrUUbZyaM5jjPHEZLLwEjXAXY1BtFAVWM/FH9HZkS9U=;
 b=JRUSk0fyFlILiPiADzNPvEH8SWTkNBOJYYNv3zJ6iiH2EKezNQaWxd5btjA9rjk8LWIutKGBPqyetttzB7qBdUSv72FspR3Keb7PEZp9pCKe61ZZt13O1jZO9pKItxwN1YjdtvffKk8d6bkHH6i++qy+HEo4z4aemBPykVQmAVSjKRvTqB3uHxAYkkE1KsULVsTBKSupvi88o+aUVOKG4f9IreldazE7lJ58hLq1olySkNlbU/NlsiZ/pCFFcfvwTVbScVd/PJutDnzf5uWT68WkglDjqCubsxDg6bwaA+4vZBvBLQsenS9+iEQ4E/eZE6Ynkikqx/YAwIQa5LvbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrUUbZyaM5jjPHEZLLwEjXAXY1BtFAVWM/FH9HZkS9U=;
 b=nWMyxFRSgle9KjdqxDr+9H0ry2ft/ifMwe8Q40RcOfJMJearOvsVs1QtQR0/0u1zjW9jAP+nvTnD8V38AXFm6EziUq0vVFcZ2C1P5njIUE3Mx9dPkuu4kIUIbBTvngUF/dmfgN/EsDQEottq6Ns0NHPOFIWRIqP+8NK9DRwfUnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB2675.jpnprd01.prod.outlook.com (2603:1096:604:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 03:17:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 03:17:20 +0000
Message-ID: <87pmgi4dz4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: soc-pcm.c: check fe condition at out of loop
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Aug 2022 03:17:19 +0000
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13efb0ab-0e62-4729-4949-08da8a36260b
X-MS-TrafficTypeDiagnostic: OSAPR01MB2675:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+z5hu+cKMKZ+sLS1qFiYQ9k14OV9TACJxwopnA+XBdGz2DPXs9XzrYaOgs3sqyNbEEuUz7wBfX+GHAqJf2AVF+rmRtox98Azo1HyxX0mBQoCqCF5nhYJk/kf89LthD0Mj07jl1oqBlk2K9az4akBV0XFYWWumZ/juduYo0rYdT/jY5Fc6Df196lhptBPJLP4ptQOwrQCmucHRJXGJHdS+Uccpkhe/A1IkgoDkireqxM+hJSH5EWALahI7/WSKkp3xRHvfrKOW3eCAbTTQk1xB8YqTXfhChPNiDINfYU2OHigMgYf5Sw/1qPQfL3cc+1YW1u/HbJ01k0H1vONpH/XcoOjT9qLTmaHBWOhhcORUpleh2CBoDfmdD27JoHH1e1PQk230XAPdfUb6YGpc9oDLP9yw0IygN7Q/Umik9E3/QkAvOMHswGkkq2x5qLrVLUFXoGtCei1pnSp5VbuLZGZ62nPYM2CNiysR8BREJxWR6dUj46srlOlySro+vgaku+fPfhEM8e+Dx3l/K+7fB/w4VxCTLV2/D6Xe+l6wVKWwtyF2Z2zZG0Z9YBpSx7ahoX410gx3qeES6wx14AP/vdOE6isblKy6WjkhOjWxrUC5dPpdekujNNWf4mDbJodi7wJTnp6Eu2HsciOf9EJcCApcax/PJdlMFI0WD0Uhq8c7UVK0v3Zwf4ZDrIYoTMfCrOwazAm0SIsvxFdGjH+/cYhTCaf7LqmSLIzUfjwDXKuijW284TEGFLImjPTlR7RC7XrI8fsgg+ebPvow3KDikjTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(316002)(38100700002)(38350700002)(6512007)(26005)(8936002)(41300700001)(5660300002)(478600001)(86362001)(4326008)(8676002)(2906002)(66946007)(52116002)(6486002)(6506007)(66556008)(66476007)(2616005)(83380400001)(186003)(36756003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGxsNsiw7WOZyf9EiDQCNxTU9IVWX+sdg7lEzIaalEWO72L/n5cF12QRCAQI?=
 =?us-ascii?Q?WPRYoX4BcCOodHKRmK7lJs+/dQqNjAHUoCtyxlki6rW8oEG27Q0GVjxeMMMo?=
 =?us-ascii?Q?gjBTbvvRlNItzw5gsknLsqzuYsT86SxLVav8TmxRVZvHntxC4u8S7TrXveb/?=
 =?us-ascii?Q?yLZp0WoAzkYoIWZuXNGvlJsSFH2bk86pLF6nsqpsTcJlosWQTTrVKAbAGaUY?=
 =?us-ascii?Q?2KP4Irna2w4Q3ocOyeSrDiDp5tAYlQWQTbjGVsK5vFHboQ47HR4IctaIlSld?=
 =?us-ascii?Q?4qh2CJZ7J+WP7oIHVdCI41uVReC7ZueUW+lnILRaNSsX8aPZTUDXFieLzLZQ?=
 =?us-ascii?Q?/5/DEqimylnGfpZYhMUh0Mxllqha8/STaNzRW80BCWX/zb1wPGTYjw2kMBM7?=
 =?us-ascii?Q?4cSbAzSKLfL9C0O3+5L4Wdx29kMfA8yzenkCv0WhZusVZra2a9hyGAwAUOQQ?=
 =?us-ascii?Q?PVC9175qD9wwunUxnzCcMIZRQoQhOknuJKS9XqmPnLDPbW5ot0zTEdVuWL5b?=
 =?us-ascii?Q?qyWHC67j+xJOXEFWaDkZ8onM4U2KxuL8LM62rNNwMesxB8nQTT7aUwv3pnYi?=
 =?us-ascii?Q?/sF6zCkfjjz317/PIqOll2OrVMbJbjpAzb2fQfXf99kZXykdMASs27QtF17q?=
 =?us-ascii?Q?/4JVaoLRKKqnwsovjRZ+gm2dGQAu9vvQbhGeRmNc96f10zxyjfB7V+0UGYhP?=
 =?us-ascii?Q?OggdT5FuArp1ac7gj/lUFwCj0R3AkATNOLyY9rrLvnz/NQfe8Pr6Mm+Itv4P?=
 =?us-ascii?Q?jg7hR7EElk4YK4/XiKAuxtuX8kj7OdHTMXRJYGLayFHxX62/sAXIvlqi+yVo?=
 =?us-ascii?Q?Zhk4tcmemzmex7klVRCgqCL59qBJL2R1Dm8L8IKSmMLct2bwkdmQNiRgdHOG?=
 =?us-ascii?Q?YYEfl/OMSXKZ5Y/K3s8ZWOkfp7k0YEPlF3/XAKVgg3Oy6WvWQwtXUJDQeaZN?=
 =?us-ascii?Q?UuHqZ9ArlGirqbTubphiEa8piGZbsHtcpnRnvrPZMW7A66aLanXm/2s1v1lU?=
 =?us-ascii?Q?CyDnnp2fXYjbt8xcD+22fymV2wutrdnzivRVfOYMAUo5ls20zQ2z/OtILvH4?=
 =?us-ascii?Q?CVIoFm53Toj4wGvgZXWHHY6h4OADRXRLm1Fn189u2hq4F4k63urg/8cxpF4g?=
 =?us-ascii?Q?upgXSnZ8uoisocItA9riKCQ0Zwvx+C/htFHSAfCc2ogXPW04oqzyKqj9iX7L?=
 =?us-ascii?Q?8wpLz1w9Re5Ap+X4H0hx0ikQXF044G6LsKfh7kSfiVD5sGtiKD9Teh1S/cBN?=
 =?us-ascii?Q?08G+qKlHsn94V05iTttwvwQ1HOPSGhqmULpDJCYYE5sl4ZMUr2SIj8b0MSuA?=
 =?us-ascii?Q?IPOALgpULTVXgfysxsIvzny6VatDyGH9BCQnuxIZ/EwnzeBDcauOlL5b4aLx?=
 =?us-ascii?Q?NtzYEtABysRyKFpTLOegbFoZlvxCD4nywk8I9lv5fPvPafE15ms4M05gm1oM?=
 =?us-ascii?Q?yNZ3SImJYNAkuyzCE6+DDm1tOB67QCet790dp3AGSCo4Fs/rNGHab1NboR0y?=
 =?us-ascii?Q?WthDjUK09G3n709voxlLtStyZEL3XnXZac/hRlSiI0S6KHag21C77NPUuuMl?=
 =?us-ascii?Q?zYKUe+QH5kiEFRI5ShkLRFFiOTTnFKhMSgHvxd0zKIf+RvQzzI8l1JMwNNaB?=
 =?us-ascii?Q?+nvKc6gbtJWBwFbyqfshWQ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13efb0ab-0e62-4729-4949-08da8a36260b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 03:17:20.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzIa3WKs4hsUEHJotgzZ27hdzMrbXtFouV6u6dAJwaCtPbRcrAmMJB05En3YrjTKDUPWz5dZ2h2nJslGCJZjZbbGOzt9+0eZ8mqNYh3/KTuurxHwWhkF4SKnh2op+Fp6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2675
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current dpcm_add_paths() is checking fe condition in loop (= A),
but fe condition (X) is not related to the loop (B).

(X)	static int dpcm_add_paths(fe, stream, ...)
	{
		...
(B)		for_each_dapm_widgets(list, i, widget) {
			...
(A)			if (!fe->dpcm[stream].runtime && !fe->fe_compr)
				continue;
			...
		}
		...
	}

This patch checks fe condition at out of loop

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1f55f8d40d5e..1dae758bc4aa 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1458,6 +1458,10 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget *widget;
 	int i, new = 0, err;
 
+	/* don't connect if FE is not running */
+	if (!fe->dpcm[stream].runtime && !fe->fe_compr)
+		return new;
+
 	/* Create any new FE <--> BE connections */
 	for_each_dapm_widgets(list, i, widget) {
 
@@ -1482,10 +1486,6 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 			continue;
 		}
 
-		/* don't connect if FE is not running */
-		if (!fe->dpcm[stream].runtime && !fe->fe_compr)
-			continue;
-
 		/*
 		 * Filter for systems with 'component_chaining' enabled.
 		 * This helps to avoid unnecessary re-configuration of an
-- 
2.25.1

