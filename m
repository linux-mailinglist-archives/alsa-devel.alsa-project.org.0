Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4240D862
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F54918AD;
	Thu, 16 Sep 2021 13:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F54918AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791221;
	bh=v1KjnTzl4qOxoIUsNGgtzOD/w/VVMQ+fz3ojAe7AIU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Poe9GIhs7Btdp+d32MY0ghAqqhh6x8Yc37lZPeefjbhtEbA2JOiq3gp2o3A/RQ+PH
	 pBSr9DkN/tZi83geA72nh/hYose5c+5golwme8oGKyOlRcZCjSkFoGRYXlf9lz2gp/
	 VLm5ire0aW/a0PQB0yDy/atpYEB+WAdmQ4pjWJ80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D26F80515;
	Thu, 16 Sep 2021 13:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ECDEF80508; Thu, 16 Sep 2021 13:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0DCFF804AE
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DCFF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="R7khKUrC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ72Dr2lHI/a8CkMh5nzMg9BTGaeOBDG8cbGsXQmJCahONBwod13oEuq3pIIQUsyeBBrnpbZZNC2OjXMsRjLu1m5peUTpCrZ6lVJDS01kjySDND2dqDZzCcJVjemVJPIy+V/nK4P3wlfGaVgkUT0r0X8H/8rasmkHuDiSFwL+kQushwnr5zA9TbhGtUC4FcLeCyHXWOPQp8y7Au7cJW7FTkwH5ldZIpUDr2YuIpIpeimxmcXKLh2UuHj/YBUzwXcsuftFc6DnElEthT0VScA308qYk/Cnh3vnKx59QVWJ0XWW8hpTykjxwKJx3ECBomFL76A2AFzIS76Ar7NiqKYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=s4gSGFdBQikU5ekOST9Axn3JdIYo1AnQE4w5NId+WHM=;
 b=oIYShRrbbIaTkUMSmIBU0rX+D/03tK6mbtGU4fwQR4Lpww6VdMN3onPWICHUS8s6dgf6Zba9EQli5qVHpjSflKKJ1cDOIIIABFJBUimqHcm1S33xAPtaBEkZgIr1hceZjX/8K3sNi2BDlDQHovqKlUyESnCNYXS2d2iUEo+sKk3n/kpVus2bB6FvF6DrztZR1+66MMznrI4DbApsCmG8X0Si1Tk+V8YGhDOfTQaiA1AB0hugIaHdWvGPCeh6AFlsNB9eQDRKt3FlPLI/IGMsFOdj2BbksGXzXeksxF5ZEKOmGxNGtexoYgJXSE7RU7LaLtiEUHeb9010DYKfzEtaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4gSGFdBQikU5ekOST9Axn3JdIYo1AnQE4w5NId+WHM=;
 b=R7khKUrCzdEFptFn2WF5mjct2Znr4pN3+NZpzXPu02KAKxvXCBZyoILKRS+0TYz7VUuZcKYgjooyUi+z8zHYG5r1CVs4FdGbsQCzQwLS1cAEHllBzss+on8QWpvd1d9G7gIGXJb6LAF2bp2c4aaLCbEGlgHuJOAxruGPZLEb0v4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:11 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:11 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 05/12] AsoC: dapm: export a couple of functions
Date: Thu, 16 Sep 2021 14:16:39 +0300
Message-Id: <20210916111646.367133-6-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
References: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:208:1::14) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:b29c:ccfa:a961:8ebd)
 by AM0PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:208:1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef094a39-6457-4cfa-21d2-08d97903873e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4926ACCEA0F8A0E15E20E335B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1xzJeisueNgJhlZ82tMibSdrwAvj3VvUivnyAV+a+P9R9c53lfpybPK4QLk1ayt3R/mDrCBERlzxz/XahiLnMByxZFQXc3/IdOLNInJLklO/TmwTpfYeqe95JPFndTF8A0tr8YVkDmG2R6AIxw8GP7ujjkueBIVpEzZqzUs1bIxfJUDiGYFoiuKTxaAJz8i2EgfPr090mggGw5DVFpbUrBO8E8Gg4JbSgrJRl74TAtpGj8qgDLGUqdIknkvXGkiWa7AWesSmtJJIDTDMcdTzVQ4wxiazb54Ulf9JpAxmR/CjqC7Z55Cetbyb/3KlkWHEc189sijBFrXW187jjLvEl8ITJNqJW4Z9IMl7hIBdB2M1RtoImWLh6289xPqEopjBdjQdul8FHoO8vmtF+bM6b78k9qmD1TdJcTOj/uxvS1fDk8UZL130zCUNW5YrktJ7YUUpUdGaVNyvDezpEidpg36e6zFk3LK47YgfUIm+atWsax1iVOzEeHQEO2lgVN29x6yWnmvknDXZlybJiI1En5+uV2xCp9OT3FQAhLb3yzRE+xwiAeRIeFBGU7XGECamgeMCs5qdjI27SfWZsUDlr+Kwlp6ccmI43QLqg0BfcAhNWkIoSRiw/uLdOgt4ldwu+L9zr0Tlw9hhToX4Em6dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?csUrKDvwkv/kdTcc8YibPSfOGPcSgIBIhp/wJ2NEhSEE664Iu+f3H15Od49F?=
 =?us-ascii?Q?sXLRSwhM7snzOBCADC0oH6AqYy2POVaNsHlynnyE9RDaRyugLYAQmYpY+9Ze?=
 =?us-ascii?Q?RjPtCB3MTbUNpyfGuvcmiOApKv8zD2b3xDfevBwGrF+uTCZzlSDLzZ4uuc+H?=
 =?us-ascii?Q?nSuEDD9LbJo7hypq11aQAeW6QTcR5HGYFp+5eQ3SznattftStiT4/xwNHyNg?=
 =?us-ascii?Q?AeB9fYpzz1roSGowuPAs6RYoJZ/IDzJPBqOHErLp/FSwvJiCMAusdhrMCbYl?=
 =?us-ascii?Q?aEnPdhSs9Pz5PlXNgqKorvAcucp8KR0hRvuPYrlNl0MPcy3FC9IYs+YDxQeQ?=
 =?us-ascii?Q?LvyUiubZI/EGIVigNduf0PVbwkGlnoOXCLFxPtfmnwRIh0pAk0XyxDb76T1W?=
 =?us-ascii?Q?8Wh9Q1s/xTUnElTdQHoM00S0VQTIGBOYOOfhPcE2q/cJ3TadOtgLJ23LzZFR?=
 =?us-ascii?Q?a9CuSYglEbjx9eHhtYcW/Dvxit7JqO3DxzpjaAVQzeaO2Y2tHPSb1ukx+XfD?=
 =?us-ascii?Q?ziwZ/IbiN4AohBys6c/JeKzY7fvQRpHMHRdihWEH+t05lOANC7hHULYESHA5?=
 =?us-ascii?Q?3mQIvc8XnHH+FLmzeJncFcXT4tkA2wM4H2EislTTB9zipJHRIMktp8/IhOin?=
 =?us-ascii?Q?/EGhO09oUI6g7A/ZmjB+n+XPsY9u1jH8gUpHcIkMqlzz6VNXH/LGuAnvqsEa?=
 =?us-ascii?Q?V2ijWdOnGKU5Jt19RR/cj10xQFRUfo+V5D9fMBNRavnj/xOgpT2Zx8kKcL5u?=
 =?us-ascii?Q?WWkmrvs91SIDpsZqhOBVnEBU4c851ZX0cHP06/sg7GBNMqWhrdpPRQLkCTTr?=
 =?us-ascii?Q?3L39wyslO0W6ZT865kPozPxomMuxeWxVY/10LZDQKi5uddByMCGFtRfqZoZq?=
 =?us-ascii?Q?8JltJKKPYaUYtLeRtXHxRjRD/HlzYTQ4YfjpYrrVq2zYHaVZeAeSCqvp2/RQ?=
 =?us-ascii?Q?ofBvKL+2HyJcBad1MwCTsRqQcIPdWejl5TY9vitOXc/mAOeTAocbF4tel9o/?=
 =?us-ascii?Q?W8yLvaesz/c94VmquJuBcVAdqis4/+od9djqlm6TvelUrGrUc8PZX97BUPF3?=
 =?us-ascii?Q?LAbOjuOSWQd3DQVD/eh9/Yi7SzOQ8WPCGp8c17WnTAQAa2XYf99rqSX6zMqA?=
 =?us-ascii?Q?/ytWkngYWwwzXBYl19/oSc5qjef08/ugML22XH6mp9rqOxC5DUXMrv69gSCJ?=
 =?us-ascii?Q?qgKE23H2NzS01IvWE4eHZlcv4pantfUgxrtfg+HOM8o9faonR4ac82MU5dBY?=
 =?us-ascii?Q?Q5hyJQkz9MJTvqbNKIcA1vaOyQsDGQSW3AeVdXcdSQm35+cf6h8W7BXPY/gM?=
 =?us-ascii?Q?9oi/x2yFYC+xNP46EWGmtxWRlyQtPXrtl21mpBQjZTp+rUj4f3iAo7bib1DI?=
 =?us-ascii?Q?HSJQkPp6/afRYDfxrSREv39NaQsd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef094a39-6457-4cfa-21d2-08d97903873e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:11.1993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J6UT7qz3mCk90j5hPqAhapQH1+yd1sGO5PUeGEc1LtY6HPt9R1xET+szzncqU72xxVAieIUlzucnpdTfEOv/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4926
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 peter.ujfalusi@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Export a couple of DAPM functions that can be used by
ASoC drivers to determine connected widgets when a PCM
is started.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/soc-dpcm.h | 1 +
 sound/soc/soc-dapm.c     | 2 ++
 sound/soc/soc-pcm.c      | 4 ++--
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index e296a3949b18..bc7af90099a8 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -159,6 +159,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream, int cmd);
 int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_dapm_stream_event(struct snd_soc_pcm_runtime *fe, int dir,
 	int event);
+bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir);
 
 #define dpcm_be_dai_startup_rollback(fe, stream, last)	\
 						dpcm_be_dai_stop(fe, stream, 0, last)
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7b67f1e19ae9..44c4d105ffdb 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1331,11 +1331,13 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 
 	return paths;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_dai_get_connected_widgets);
 
 void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list)
 {
 	dapm_widget_list_free(list);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_dai_free_widgets);
 
 /*
  * Handler for regulator supply widget.
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 48f71bb81a2f..fc1854e3e43f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1262,8 +1262,7 @@ static int widget_in_list(struct snd_soc_dapm_widget_list *list,
 	return 0;
 }
 
-static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
-		enum snd_soc_dapm_direction dir)
+bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget, enum snd_soc_dapm_direction dir)
 {
 	struct snd_soc_card *card = widget->dapm->card;
 	struct snd_soc_pcm_runtime *rtd;
@@ -1281,6 +1280,7 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
 
 	return false;
 }
+EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
 
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list)
-- 
2.27.0

