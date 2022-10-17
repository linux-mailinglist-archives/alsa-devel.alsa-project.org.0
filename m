Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB89601DAF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 01:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365733F06;
	Tue, 18 Oct 2022 01:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365733F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666049901;
	bh=1KvCwReGeayU6hmoQJ72YHG7EE+9x7N9TR65JcmKXM0=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bCd6I9jaMufcnzZWIxxeFp85bcfiGR5zzd/l23UQOCp13S0iCs2y9A1DYEJhgLNtb
	 Xrn38s4YyKagWGGSFkZ2JNdJrgepQWpl0nrgQmbYf8ew/mbvMdMzxfxLM1pLNYpfRN
	 GckDq3B/zf4aP2lDsS5MGcEiZs3+wEaWjkpBCvCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD5FF80563;
	Tue, 18 Oct 2022 01:36:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC0DF8055A; Tue, 18 Oct 2022 01:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3657F80542
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 01:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3657F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="R0ST2PHi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AugTApEOH020pNkTlXsC6jhezKaYU8w32p0+ng+nmFf71op2DW0V545YbPQVi6ZzO6flX3pP8QTUdGVLIMIhzwPQIx08UlLRS1Q68biReGKQ37u3NmLFuh8ekhe8nHP3ehbdWHbDFDMoao6vOLr9ABTz3tLCzVydRmmkAesUfcxZ4FatpfkYcyyWZx7f2wTkiBXsvK4dRFdrGWEXZQ1nv0jTVXU/JBbOwdV6gDXDm9Wub3zhaG1ozMuAcSwaS86FwUTVP6x4ceLGywspFimXatSG7IZC40hlf/WdSUl2riLkpy/iJghtn4z3l7tTtTnC0SsgTB49/hYMSH97Y2ojmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu1YmXBT19kFURly2I2kxfY267k/jEYm/1vVwbXwGFk=;
 b=XtNQaaowfBzNR/dg103EK/yKJVM+JpJjIoO2irR60ghbo1tqVaTx/h+QqKfGH4D1BWol9r3/tx2z36M0M6WlnoYVtsNAu5ETHJKWaZ7mEXYWVWnSY9yP2Vopr7YByqrAjkNJMn71BYaVVMfY2NIuijsRX+ruxs83WSmAUMGzuhz2y28cvlaSHKkmQRynHRy2gjL3zCz7E2l2rMOLQCiZoFySptPpHzXzXcr09cIuSE2904FwGx/WURoKkR3Or5y2GeY3w484McrsbcbYoNBhWvD9OPZ2YH6voo/OafNZX8cukhKd7feR31EYeKkgmFynhVvbrofQPoOr1yoXW1VEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu1YmXBT19kFURly2I2kxfY267k/jEYm/1vVwbXwGFk=;
 b=R0ST2PHilfa2RvI3CPpID/0JwJ5cdGRrzlibpvMlU1/sAmipW9CXAxCr6ALYKZZy1lMUWQe09Plz819hfhKycAJ2ogObQX2ePzLuHFw3/NfBHMqHTEQu2p/YPRYeEsYHxoDRrG3Bb6thQo3Bbw1qxSjzkK7uKdVpE7AiDdL/SJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10199.jpnprd01.prod.outlook.com (2603:1096:400:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 23:36:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8860:a9ae:8e74:ec53%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 23:36:49 +0000
Message-ID: <87wn8yowdr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/11] ASoC: soc-dapm.c: ignore parameter NULL at
 snd_soc_dapm_free_widget()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Oct 2022 23:36:49 +0000
X-ClientProxiedBy: TYCPR01CA0008.jpnprd01.prod.outlook.com (2603:1096:405::20)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: a49528df-0fa6-4e13-e6c4-08dab0987648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3tBfNz+xp0m64QCXEyN/SmOkBU3Hoo3GRNDoNJhAO/QFui8/181l9u5ENhXMFbEgtHH9nkye0ayGrZ6r66KIDXSocyzOPWmoSOKI3CoeHU+l89ozhL0h1shEsy7bHi3K8LtN0fDHZ64UIdQDHBRUIOxs7V57/fTyCrfuUt37vhFfgm9crKDebL7aZ/ocvRjn8xQwKoZWJ0SfPeA8I5D1vOaGF53JTiKqeEIPNLLh2k1oyYgQvknofLQ0SNYUHStc+SG2OdM7VCjDY6wenP9D1fY9z+x4CbnvUf3I/AAfftJtLrq+mPw9h5G7Xg1LBfaMOl9G9WdqGWcy+WdJPeZt9tSDc0aix6WzZnwpCKw5JzfwUg1xaK3krqm+G9c5ob3itnpchninaIqmJFvT2OpZjrFI6CBWSQyYWMt9+nS4TLNPXrheETnDkQMyJsA0IrASQm9lb7SIQ5R8IGTD6jwOTx7+29KyuPJDwc8uVIl71l62bG2VjJrHT+QjcyDSDiF+NNMPfPooL8OpYuumHPm4wXpdGmSsSnMXSA8TygSYnaCloNA7PZlQdOB+ZcckpeeoRBDlH7qvXVi13aGvKvIsfnYan17+61ftl2pT42weayaCUKS56iGUTf11s3IGgo58BQ/W81epFJKuZ2uP3hMLmfWAHQZAVPQ5iWYN87/D3r0ATfeTtVvsccN9WtmxDOdvmTqiZLa8ohp/CzMtnOLr+5tkwqIx4/wAGWqMoqX6MbhpTOtKq88Jeyv/TkUksrp3aghwcBBgWVzVNIMGTgdcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(41300700001)(5660300002)(2906002)(8936002)(316002)(6916009)(36756003)(6506007)(52116002)(478600001)(6486002)(66476007)(66556008)(66946007)(4326008)(8676002)(83380400001)(86362001)(26005)(6512007)(38100700002)(38350700002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wwhPLXZJYYplAWD1mEceXmXcd/5E81OMY2q0FveW2e5T06UzPYgM0RePRo3s?=
 =?us-ascii?Q?GZE2wP6aC/COXz781R24VmF+wKV324Bz8Eur9eZz80U6GmBuEaY3ctu3/5YX?=
 =?us-ascii?Q?SUcOOEgWRJC8nmbQbXS4ixfr9Puvw9RyOgVMqhXt5M77E8iRxV5WWLUvyDPg?=
 =?us-ascii?Q?fWNxHJpMBLPQ6U7emwVWtuO7bGxu8e30iPrJa2tls17NFUfAids0Eom32Sqd?=
 =?us-ascii?Q?wKBNQcIVVUw4D6gIOVmRQaEG9660jfZ1BP50b7ecF2vA4jOx9WNiUUo/CvKa?=
 =?us-ascii?Q?l6gUFWY5lV6ba+0X9emgX/4csvYo267EtM2A6zqnsBupSN4fUm4OCXoPbcnN?=
 =?us-ascii?Q?NiBcsxl9LJc/eyFExXHnXgaI9GVa7CjFj06NdiK4T59tNBQbAnfbzKxDmw1Q?=
 =?us-ascii?Q?M4g6uidoB9GvRCNX3mV2UT55UAApuUWq05NQeNmSOh9pSIt2IlsV/hKAzex+?=
 =?us-ascii?Q?N4NqeQTUDqOzFSLDb3iKvX9eGpt+uVKiUeOvp77iUfEbTFcaFIlMnhZTzqbF?=
 =?us-ascii?Q?XdzceGNI+p7pRP6+WRAK6Cc2h0+oGBsIHaYVG30Bkpzf1SCIaVtCWb6X2R3l?=
 =?us-ascii?Q?vh1etpgk958QjE6vQbDJNTeWuF5l4Yakvl04Vf2tqit7OTktXtbssRMvums+?=
 =?us-ascii?Q?ASvqaXcd5IdWyE9qTBdZgzFDD6UF17ST8x0Nal6fu+EG4vqxIORxIo0228p+?=
 =?us-ascii?Q?Cgckt7qjcUCv/uTtzGyfbeBeRGx9JWKxac4ECjS/GU1XKpNkU0QF+iFk+mTb?=
 =?us-ascii?Q?aKRDdm2rz5wRBrg0DhEr85BSsOoZTvNpURPqZ0bn66uGH+lnMFSitAMy5nxn?=
 =?us-ascii?Q?lctQdzPFBwSnOqs1Ax2XFc0o0hzJIldGDVn24NTcr4btrWY8thkLc8kcgk50?=
 =?us-ascii?Q?seCscEOyj8Bx/afZ9nlkvWSIU9FBeEOn+lTLJapU6XQOpDOsJE04ABtQsXOo?=
 =?us-ascii?Q?Gi33lt/cedUxQCCv+YSIc9i06Phn5wtscB8NmH35N8bg5xpFC5iMhmk5HlAE?=
 =?us-ascii?Q?yyCw1k5cwHnS8wFXl9yfGAKD4CjJVAkIHXuTYo68i50/Q2Ofv6G6cyalVwpX?=
 =?us-ascii?Q?T5e4Y0wdCZK/Q6zckLLtr0Vdw2fDmxQSMuB2n15H3a2/FAZ/ZKlC65SCpLYG?=
 =?us-ascii?Q?HbFkZZfJMtx08nihgQqomCl8FIRQdlPaExANLDW9UNcTrcNyqTmOH8KVdL09?=
 =?us-ascii?Q?nLENo5j9/05llAXG1I6sruxDW0kPwvfBp2WEBTmD4EaF3uDpKGPH/gf3czcY?=
 =?us-ascii?Q?0+EdAf9IuRMub/lPL2guVfLLE4sgWPrlCnxUYRrLpYs75iBoTDy3pz/Ea8MZ?=
 =?us-ascii?Q?rJ0r0yk9qt0PWrJlkvcW9OkzWEBgnnHpTuYs/A8kqk5c+9xFnINkmk3SnGzl?=
 =?us-ascii?Q?UMNfSICKcBqoBc9AhrfiS5XCwe/3x8RtJARJHYDCPgxsP8Pj9hOdX0D5lojl?=
 =?us-ascii?Q?Rz0pytgQrn4LsaoT7z7dsvOetDixnJgWInH1y8EH11Z26J+Q6zQURkapxyGu?=
 =?us-ascii?Q?SV1HLpZTdXrhMJy/DA7sroEp24acxz7huwaGAKnK53IHT7rOSyKL2zvUKDPZ?=
 =?us-ascii?Q?ixPHkm3s5PYQCsAMxKMrKgRKPlYHORfnFnSwAkTgD7W66BotOvllaJRQrM51?=
 =?us-ascii?Q?ntiUzFL7QnP1Dpwo1b/JC+4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49528df-0fa6-4e13-e6c4-08dab0987648
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 23:36:49.3759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8xwj6jy+oFoJCR0uKD4k/q64P7gw1+GrWzRf1UTwbsG2xTWFLO13HF9rhgnse3GvBimRmF3ZlpYBHQaQByxtC7+PVPeNKUJJtJAYRM2SNVWg5TmWMpp07uqiSNKRs9l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10199
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

