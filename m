Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9588E6FBBA5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:54:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64BE11B1;
	Tue,  9 May 2023 01:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64BE11B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590094;
	bh=xizdbhVnFWIfgTGsEn3x/B4/1UAoiQDsbxLE3bV+Tys=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KJTUZypCTCg9FexJPKBOoc13RV1XMGjddEJ+Inokhwc3bkPtcEnrlYE02Gi4pkk9Z
	 pQz4AG3Y6yqgYYVBbkaIcT9xaz/UnLtrZD8F5pHnfMjZqAEuvets/V3kqw29h/l6GJ
	 vuW20DBb6ljH4CdNCmrtrc71dfU5gHPPMkXATBfc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F25AF805A0;
	Tue,  9 May 2023 01:52:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CA53F805AC; Tue,  9 May 2023 01:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CB9BF8059F
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB9BF8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dWBGZY2b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuD5efntpU8YiDzK0Znp+ZAHBUMoZohLNJKkImgVJh54zsAgHkra63VQ05XHxu9IulkjMwwoGuPfv6lXMLdCKKUL2kO5g8LQJLMoqZjG0K4ryRRQ3Gq+yHx0SFi87x5d3VuMpZeMCYCW3S5v6Xn0kra8uN/8eN4ljxKyE8zCHQfGkbHfv0GdRSPU+5FAMiVMDmoFH+bGUWLWd5pQU9ZWWokQULVslPAiRCXdW2W8nUnXom9JlEbElWKr4mQAys0kt9VPjobPLDAbesL/ecBlgXr2cGW9DUGn6tc2NJy037tBFV+JGTv9q/cUVLd5pHt8KrIDh9dg2hdpd1lIyROTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztr4i5werXWl1+l4Wph7b88HJ5Fhem4Zb0APeyrj+xs=;
 b=dVxOreOiGFQ1IyvqD+0ek0LJWbVwcdWtD11ADdhCkGZ6A2lwjf4j5Gv0lkBwi1YkPl+pQCucPwFhobiY4MGbqXbs2RRx8WGL5cjXB5jmdX3J/G0Sze74VVhL1Oc+DAm6q585xZw1QW2wAGPXcqShCU73D+vj356ots4Oxe/ZjNeknIhFWdccJpEUR9LivWUVVouJ80WLoozMvvNLuJCioew854VG+psXVbbirYcg++rQ5nYeSxeXKfZVeoDjmf+7J8b1GBq5YczsaJRaSpee1CNSXdVpanBxaEtGspuY3XfrqJ9a7NEONveh9qtD5s8nUL0fOnTBmzkzRmVbZVnMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztr4i5werXWl1+l4Wph7b88HJ5Fhem4Zb0APeyrj+xs=;
 b=dWBGZY2brgZ4QXiW5RLN4cV2d1Fmz+hAHGlqq9qRBxQ1C/pWbOd0CZiqYytnN7bXiDvkv09SYiqcTZ0PgpHDPh1SRG8J40m9sMXcPZ0bJUy/aGCMaZm6QyHN55Sl5xlj85Mom9iaATfhhMpRNYHvroIAGwse1FJ0/ypvT6LLnyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:52:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:52:29 +0000
Message-ID: <87wn1ijs8z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Amadeusz" <amadeuszx.slawinski@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 13/13] ASoC: soc-topology.c: add comment for
 Platform/Codec
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:52:29 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5d1d97-4cd1-42bc-7274-08db501f485b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rWZ31Z1AksqbXF/76qDh+2KtgTF4UkF/OvswQV0CVcZUYBARkDgP+vfdLhFCiX5z6n1IbwS+Dc+fnisRTOjoPheSTzwjpyE38QI+G0r4tYHIr8qjFRIKychJxNGgWG25t5ho0N1XeyNqe3nS8vM1EaZpxyZOeOiznQQUZD1/nV4KUCNOFtdEvynmh4L8MlNe0wbeEhnqnVqgl8q0Owh9GQzP2LobOPDNLIllY0gzbCFdAJ26c95MhbwOFss312MeiyQzef4Qg00+fZ358toPwHGM3alRqIbyfmfgNryvNAg0fl/iUL2L+bt7TZMCWn6VfVpYkjazU0GnBdbJm+pQ8WRJ5alOlKRQRVMK9etmOekd7stGovYWL6J/ooeQpNrkM5co4HZn3ivDem42CBhDOBkRv0LVi4r5iWmKmWf66hII5xIxa/Rl9BZXu/P8iDBWIz9LNpJPqRLrH9lHxWaafNcGECaUjgroX3XnP/7hk5pa7l9qo7re4qQUR3eFaIUjjBV//v7dI3/TwTynYBUgP0Z/uuks0WGfi7HrnvaI/ktj0Cr9yvohMSJgHCAkXIxAjk2G/cmo9ns7A4hdZ+h3ioZhh1d64NFZVW1CmyVvNotG2A0G4xMk+WFRhniuxTwI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pduq6Zt9otD8mr/VrunD64HqzJSf+J9siq/WqdooyGrxqTYXysDz/ico9eY4?=
 =?us-ascii?Q?Pr/6xlwIDEhR7W1F9JIbxYtoEtK5oG66JgKGyHis0Ha1yft8nl16NIWbm4JE?=
 =?us-ascii?Q?klLeg0aFRFpt+8mlFg/LKocTTdlWH7gtI1RqzAkW0lBTTYTu3uOgMEoQ85xx?=
 =?us-ascii?Q?z4h+Z3VSuuk4tBvRUfTyQzBWCmzzBzppomAgDIz+7TWkwp5hnPy0qJSSvUDF?=
 =?us-ascii?Q?pTM3V91jk+VA6Cv/dPXOjn8AnoEI/VQGIbwb6Cprmh3fnhdir5LMpR1zJldg?=
 =?us-ascii?Q?Mh5LJyxLhJOQXp4sLMTgrE+MPx69JzmsubGfYhVX9LiQ+wgxiT7GdOozh+sX?=
 =?us-ascii?Q?d3cwrTWEflwfAzOgSSjxC+6uVfh+nfq3W6+FtlsQbV/Zg43mlad5PChkACXE?=
 =?us-ascii?Q?z87Xb8OeQoS4G33b9EAZJA9sfwnw7CmEHGrJQxGHpbws0++Wxm9CWJgYLX8p?=
 =?us-ascii?Q?F+YhfPLF3S55l4X9cM78ltv7JpsJ99RS8rqScXELoO0uelMbj+aZkXOL/BsN?=
 =?us-ascii?Q?Z1+sEr+ObD1pAqLj0GPUIBmW18OUYuItXPyZ4Qj+NqdodrNS9gbWLCRA5As1?=
 =?us-ascii?Q?zZcZQKuS7+NT4h3B3yDZjwdNqiY3CmGqMYL2NAGMTh64NS51oYV0EsjkzgZt?=
 =?us-ascii?Q?ZDH49lFIt8l0rcH4JzKAjEQpEO9402sOQxgwzrRStEpExZfkTKWApZFPMZcQ?=
 =?us-ascii?Q?f93DVNqEL5KGdduiToPPuxOOFbNMnRd7GT9e8jDxmapvBREl5Rm5aX1UPW2R?=
 =?us-ascii?Q?qhl7AA3UKAVD1cFMTcehSSWhUPOfUM5rNLVrki70ndw8QmpurqG1T6WGen2F?=
 =?us-ascii?Q?9MILkRh85FRs1M6nBQT4S1WlZoaYpfaFJq6b05SLq1Cf84qOpNNNekoQbtox?=
 =?us-ascii?Q?X4NaflrvrgMtco7PSwGcTLFaat7/OiS8loKEzHdMUf+gzv1LEiZaNPNZBw9D?=
 =?us-ascii?Q?iXMatDenI6YB8oiun9yKh4daA1jK08JgVNQhxeL0uDxU8Zpz81FQmGdxA6KV?=
 =?us-ascii?Q?Oc/hHGZZebdl1F6ptd5HusX4o/O6VUhX6QB2higf+gwclyHMJO4zyWzHcyvH?=
 =?us-ascii?Q?CnnnTOkIeR5YNts7qGLX+44EcJ3IRBXtVEv7RLULDGIiVUBxpK6+GmE7XD3U?=
 =?us-ascii?Q?1QoCxl2foaCG5P/IgggsAJcG3IUgITguwEewjCE5Hih+6UiNB1+5Zx7lM1/3?=
 =?us-ascii?Q?HcTD6qLrc21dFFoGUmmvRZ8d9VwD/wrvmv0ohIxjM+G3PD9YxvmwNa/uD/P+?=
 =?us-ascii?Q?hVWCfBxVf6gTfxRRtKSWWza00NX68lTv0p2Te94SOGjv5dSc3B0RRCQfA1jZ?=
 =?us-ascii?Q?8b/gWiRZjfnhoKYGVce4kGb5wjfBCLW+MZev95Ao0J2I4x/dsOJNTqsRowta?=
 =?us-ascii?Q?L/ENMFXoDDao0Ly+f+hqtygkb6RrHgmsF4xDN2vUClMRHhlPnwi53KOmqZxl?=
 =?us-ascii?Q?5AlGZdPG/St3NxxSSmKhy8ngdsCvhB2ksW+3q/o2ZFw4G4K+FXoEYR51UTJb?=
 =?us-ascii?Q?7pNR4AlYOWHpog6EQ3TcDSdCRurr8ZcwpjaVH01I5bjjIIMkWHw1i01mjECb?=
 =?us-ascii?Q?O4d7TIgR0dTOe90G9/CpoAXZC73lTUgp5C3lTIST49n2aVFkGGHp0h9oed/u?=
 =?us-ascii?Q?K+uX0arvsPkrk2wr2Tokcv4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b5d1d97-4cd1-42bc-7274-08db501f485b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:52:29.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9dFi1J1Ddc54i0eNNcrnKF0KIMO+zlQwcsWIOlIBojipvissTE0snavp1jdHj0B1bvLJeRK83W9UTyIccVXQEpuuZjGnSuPnNJKOgCee25pFF6haMdtE+QrIGeBEbKrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: GEZDXY62PCLLV5XEOJCDT72JCXOYVSXD
X-Message-ID-Hash: GEZDXY62PCLLV5XEOJCDT72JCXOYVSXD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEZDXY62PCLLV5XEOJCDT72JCXOYVSXD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Not only Platform but Codec also might be overwritten on Topology.
This patch adds comment about it not to use asoc_dummy_dlc here.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d0aca6b9058b..47ab5cf99497 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1693,10 +1693,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	dlc = (struct snd_soc_dai_link_component *)(link + 1);
 
 	link->cpus	= &dlc[0];
-	link->codecs	= &dlc[1];
-
 	link->num_cpus	 = 1;
-	link->num_codecs = 1;
 
 	link->dobj.index = tplg->index;
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
@@ -1721,16 +1718,19 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 		}
 	}
 
-	link->codecs->name = "snd-soc-dummy";
-	link->codecs->dai_name = "snd-soc-dummy-dai";
-
 	/*
-	 * Many topology is assuming link has Platform.
-	 * This might be overwritten at soc_tplg_dai_link_load().
+	 * Many topology are assuming link has Codec / Platform, and
+	 * these might be overwritten at soc_tplg_dai_link_load().
+	 * Don't use &asoc_dummy_dlc here.
 	 */
-	link->platforms	= &dlc[2];
-	link->platforms->name = "snd-soc-dummy";
-	link->num_platforms = 1;
+	link->codecs		= &dlc[1];	/* Don't use &asoc_dummy_dlc here */
+	link->codecs->name	= "snd-soc-dummy";
+	link->codecs->dai_name	= "snd-soc-dummy-dai";
+	link->num_codecs	= 1;
+
+	link->platforms		= &dlc[2];	/* Don't use &asoc_dummy_dlc here */
+	link->platforms->name	= "snd-soc-dummy";
+	link->num_platforms	= 1;
 
 	/* enable DPCM */
 	link->dynamic = 1;
-- 
2.25.1

