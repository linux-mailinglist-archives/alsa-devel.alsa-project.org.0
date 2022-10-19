Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AF60372C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E745A862;
	Wed, 19 Oct 2022 02:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E745A862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139879;
	bh=1KvCwReGeayU6hmoQJ72YHG7EE+9x7N9TR65JcmKXM0=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOes+KQcRsLz7KcSXfCMClelRjXcbkEjUT/gGP2xLA4F8whMcwyavUPyaIAcvpVt3
	 u5bk3vb9onu6PgogoD5Z1j7m89uBFMwyEKTIOFC3AP+CCyJTcCv3YUG4hsQh9Ey8Cr
	 PEB9PcD/0DoDVdi1dQjeYT82CeVehZZcyabaSTeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB1B2F80557;
	Wed, 19 Oct 2022 02:36:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EBEAF8055B; Wed, 19 Oct 2022 02:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33438F80535
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33438F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="fQlxpzfE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyFtlxNmBtVzPBmwesRMD8ydTPVMgs5rrXX/DwN3X24dWewUHaibMu4T2ql6u8yLzYCJtFYSalM6hh4YioXDOeVhqdW2SbcZ8jvKLATsdElGFJvpiaCQIA9ZxGp7JRZr9BleQCdKSB6/TPqs2DubRytACDOX3KxoJcuSjQoywwpOlYHG7tLKjdPpysEGUBA+o+pmN8CoPhFNht8ONPV+Xz/wtQyAJy/jPlSzjx0SxiCQHHrZ643ZlYzv9UGG0v2b0XuJ7cPn/jH4hsnCTJHJPQTCjDaFeQlyKZ0kUAy4hHjVqcWcC0POk1+IqcyPzgIHuPRPucOe7C9A+10v+AbFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu1YmXBT19kFURly2I2kxfY267k/jEYm/1vVwbXwGFk=;
 b=YbMmoOmtk7tXLXutGdNEwCjr/PXc9rcgFHgcXJWj4mWPlrSaVZcrag/cWl4QstML0/Yyi1MDrNiKjtVhmui6NRf+ZmmmBtCvHIxu3iHXGlLzv6UEl4SjdocxF/w1kAl9jSQQZWdDYcSwxD4xfoOzNleB+Ro34SbQJQkaSZiujdpLNBAMTJsqbKkO7kqQzaLc2/YacBIsfUvupxfaoCYiCXaz/leoLKbQvSXY8tXbkJDQfPMW57+VYQt8xxpTE4o7gOmhk7me/Q/HFcdYpMx1yvvIRoUEFYt9YBdEY8jywx53eGlYZ++7gnc8roO1tla1ve/rwWmK3fb1RPeZ/FHLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu1YmXBT19kFURly2I2kxfY267k/jEYm/1vVwbXwGFk=;
 b=fQlxpzfELCAmc/L7EEHZlT29iYhOib6xgzb15KYMFgVp/+q0XmE8GO6J0o5LReTVSC+rDRS0WDeXDAnuV/Ik0qikN97dhEm/sXy6Mv1yVLCNk1INg+e5bi0e4T+3NTdC9HfnGfMkti6UaRXRHXKU9OYC213+xCKA2obHJHWjfuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7986.jpnprd01.prod.outlook.com (2603:1096:604:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 00:36:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:36:22 +0000
Message-ID: <875yggtzsq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/11] ASoC: soc-dapm.c: ignore parameter NULL at
 snd_soc_dapm_free_widget()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:36:21 +0000
X-ClientProxiedBy: TY2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:404:56::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a8ffbd-21a1-4bd8-9480-08dab169f23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkWuoz9iReiNcN7vz/LQrqNrhS9SSpSMTHZcPwYsFBhq+9EOJ7lrkTg1Aj+zfl2hPfTY573X+U4PCEQXDxEYAydeOkkeuQv0EnmFNROR7MhxVC89CF2caQfw3Qk2FVPOQpA7WqkZMPPDDkbReKX1CVdY5+TFDp+5uESI+QUdtPLvl4RW+dwkyXQOAieeabBvYkg2yJaB+LUQjqykooz47nuVVXFijgsgn0jjPHHjZgxrRxfWi1qRYgkI3uq2I1l92moqiTahah6YRva5qAHG2w3N+UrmNrDUECwy1jXLKoSFxaL3fBIV2qxD80Ak9izmqfDkNBdzPDM0rAo1e3N6XxK4v7VMSRdaN7t42u8QEMIyOx+nH06QCRVP0uVWhy8cenfw2j3B+pPpBvCurmYcOIpNobPU5gSWIWovklUeHE/qC/M7J4lePlpVGH2si7QMChUFt6Z3bu+3AYObSeQ2uBsDvOji2G/pCCLyYh4DJKz+wdMKPrQVVAgo2aDxhmXQxAU5JQka6E2kpRLG5UI/GZkUz4tfxaC53JXVwFj7va71VKS2cJGCwzl8F8CPHEaFBOQSIEfKgTPUPXuaHPSmj09d2Elwhv3PXqFHh6lcZNkFCPIoKtc2XCHNZ/tG9S69waPWZQN+vSLsCjOpRelbQLQ/D4LuAyqP6if7i/CMlF7RFlLVVo3KZHpufzgdv6GGTN+GX7NpainO8zLEM4p1uLwOEvmATbLTzsUZ+wP1p/tmmj1ghqLpdfF7a3bMfIHjw4IXm70+xaaJfghSc9pwWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(6916009)(6486002)(478600001)(83380400001)(2616005)(38350700002)(26005)(8936002)(38100700002)(316002)(2906002)(6506007)(52116002)(186003)(86362001)(4326008)(5660300002)(36756003)(8676002)(6512007)(66946007)(66556008)(41300700001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kulQC4mvQ/p32MdUkyYAZMVoCcdo1OgUp1kfMbWB5uiQUpp19g7X59NQw8mX?=
 =?us-ascii?Q?jRuS+tDHs+Oat9XUBPTySa1W/KKr6+B3f81WwmqucLOX3kF6NaMxFT3UXg8g?=
 =?us-ascii?Q?xSW36/EzlDGCNp1QAmf9yo0L7RMHDPXJq6fNVZLG2naEOFtTlQ9i9/GH4yHX?=
 =?us-ascii?Q?+2yycBHdADFdZySRmZdBUV00qefyKnb6MRS+ITxDrWYWpWqnumZ0Ebqqt562?=
 =?us-ascii?Q?sZ1MTadx604VzXkGylzr1jiUy2efuvCzehty+S/SyuGoMKW5U4n23Q6pdli7?=
 =?us-ascii?Q?JeDtYzWloHQritIlXOAacImQ7ZW9nvisccOlDWxxDZNUbvqGDSYn6+RmlkxA?=
 =?us-ascii?Q?2Np0LWAZzypwy4Ru15dwX4z/IVpbv9jYxTJKJtWSJ92Zcmy+GOijZ19lZbwU?=
 =?us-ascii?Q?xfNnDR79uNVvsToNj1A0AOZiWbPR8/niJbbXm13H+GcGP6JQV35rjVCj6eGi?=
 =?us-ascii?Q?VrBAkGyHWOdT8aH7CcVFuOFkp040jkaLjGuQRt0lBmDW0/UME164sP/aXP0V?=
 =?us-ascii?Q?PWSDM1f67aztDc8TBzv9BQcFHYLz5YdBLoIOrPXKWQ6w9tCYzy20tC5pJnns?=
 =?us-ascii?Q?J0rwTzswmJkG456/5M+HNggbO3yvTQ/mNR7arBdMoDUgoozK4wFRSWy7S1No?=
 =?us-ascii?Q?nOiLxt2rW4IR8LMigYwpsST9RxYCBlBL6b+jCM9Zn2+PWgw+TFs2mD5YDjZF?=
 =?us-ascii?Q?fgdldHTiVoa5ceQeJypBiV0H8qgk28CLx5ddWut8EVoJxOK/pCe21ogGY+Iq?=
 =?us-ascii?Q?28QWXt/VwJKeLKkdXzsED8lVFM2dmgsJ2iCSb3bTt1aukbXmYxesvov1Oy2T?=
 =?us-ascii?Q?ZQ5VPzWek0w9tmNY9Qvtve0GuL74e4CvwCqkao+BWY12yKxJOBPtsMBcw8Yh?=
 =?us-ascii?Q?DRXCBnXkbubrxQyD2seU8fJXCtV4vmsa5l6VjKVkT8KTNNVRWFqxezlmgd76?=
 =?us-ascii?Q?aIGRRCGGeiDg1wLfeXEyCo2pQqjSGTeu2YpcE5Bu8mQeg1FGCIXqGWi53pW4?=
 =?us-ascii?Q?8H8CHUA13qGrT/ng5KtjJNg9/ZW7dWs7+IPQH1BGQQgTcAfweQPfLEvIXh7N?=
 =?us-ascii?Q?D7hXdGmXorsXBv56ekNpB2x5CEU5GpK/lDJhPEjRQPXrnn0kxGk1ssS7UqrP?=
 =?us-ascii?Q?ewqkv3Y1u+BlwrtCmwiPs3RtSj9f6LDqvhxUj/lCXihjwz4/WebWf2sOVXxH?=
 =?us-ascii?Q?Jei+2lHpmI97gPwj8l9lNLNkQBwjXswNTtiF5NTWtkBJciwJ4nLTmw6H/OGQ?=
 =?us-ascii?Q?LKBGiJSvBqgLJDPWroNuFCUdwYfeMgRv2c+S9EKALy1hLOsmyNvOAPJYxs95?=
 =?us-ascii?Q?HIFttOxQIR8G6yOGRTa8wLs86J+c2XidN7cJjyvZTuIM3Ut39AcqQPTNuSP5?=
 =?us-ascii?Q?kJQJttVQEVwZClvBitOgPQTWmz/TCKsOMbvH8LSZIkjd1h6s2W8G23DzzP6Z?=
 =?us-ascii?Q?izfb0SeiCWkXX/HC13FK0ALgCV+U1mEbFQuJRsKIXLl3eFAreAbp9sDlFRdq?=
 =?us-ascii?Q?W29MN0TS03PqgmRqX8UvIwLw2zFmqgKaAhUcbCAduozVj5YNeBdooA8bH64G?=
 =?us-ascii?Q?J6jK3LWG3ZEr+9r///pIpUspk1zKuUqcWvQaOGZfsK5OAXgrCTTKD6criVQk?=
 =?us-ascii?Q?SXsZr33rNexFdGeO1j97Uyw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a8ffbd-21a1-4bd8-9480-08dab169f23f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:36:22.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZMimTZy+V3XHAPHIENWaERxD1fcjwnesjHVqCt46s0KXPjt43Qs/awWst4GLYFgBPwPTxn7M6wF+oGhqGQsohbUdk1Ur2LFaalLiuQRcqSwFbRz9AhfkqZ2M7IwnbGv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7986
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

Currently snd_soc_dapm_free_widget() is assuming input parameter is
non NULL. Thus, caller need to care about it.
This patch care it at snd_soc_dapm_free_widget().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hda.c    | 6 ++----
 sound/soc/intel/avs/pcm.c | 6 ++----
 sound/soc/soc-dapm.c      | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 61e8e9be6b8d..a79916ff351f 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -130,10 +130,8 @@ static void hda_codec_unregister_dais(struct hda_codec *codec,
 			if (strcmp(dai->driver->name, pcm->name))
 				continue;
 
-			if (dai->playback_widget)
-				snd_soc_dapm_free_widget(dai->playback_widget);
-			if (dai->capture_widget)
-				snd_soc_dapm_free_widget(dai->capture_widget);
+			snd_soc_dapm_free_widget(dai->playback_widget);
+			snd_soc_dapm_free_widget(dai->capture_widget);
 			snd_soc_unregister_dai(dai);
 			break;
 		}
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8fe5917b1e26..8037b15cbdcf 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1016,10 +1016,8 @@ static void avs_component_hda_unregister_dais(struct snd_soc_component *componen
 		if (!strstr(dai->driver->name, name))
 			continue;
 
-		if (dai->playback_widget)
-			snd_soc_dapm_free_widget(dai->playback_widget);
-		if (dai->capture_widget)
-			snd_soc_dapm_free_widget(dai->capture_widget);
+		snd_soc_dapm_free_widget(dai->playback_widget);
+		snd_soc_dapm_free_widget(dai->capture_widget);
 		snd_soc_unregister_dai(dai);
 	}
 }
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f9c4fd11853c..5280a1aafb92 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2489,6 +2489,9 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	struct snd_soc_dapm_path *p, *next_p;
 	enum snd_soc_dapm_direction dir;
 
+	if (!w)
+		return;
+
 	list_del(&w->list);
 	list_del(&w->dirty);
 	/*
-- 
2.25.1

