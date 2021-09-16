Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A440D876
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E0318CC;
	Thu, 16 Sep 2021 13:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E0318CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791382;
	bh=qmp+2SNFBh+NhKWrZlGOGRZOcKRpiTVSKT1XAUEpdKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDNtbKfok5NRYOaeZhxxj1kgLo05oCaRduSnbMasSW/81v9EppAuqGzKeFDU3raD5
	 TsMyXnpnD1Rg8OVjmD+aaUsLJFwYygoOsUYsMzIGjUv+i9FxG4HaoJ6PYmngso/C6y
	 65OHmI8L1wFpEyDk/yGZQu/TbaIwG56d4SKvTpok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3D4F80563;
	Thu, 16 Sep 2021 13:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D7D6F8025E; Thu, 16 Sep 2021 13:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E168F804E4
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E168F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iums5hms"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh8ATRMslnwmtWHKRnwueIX2mQQGy1vPMHJNXOQEBKbWn2gFaTRo9iJJ8qZbcHfcIQjvce9E/mzleENJfTR0GnwvwbztWNgfI2YVXvti8TVvX2E/8SFTMEakUqfb2MOECBG8KEA4gHps8Z5F39wI6aDqpVRgSQZdnQB/kl6ht6NcizSgAV1PX+pBAg0YOxyOXers9+zcgy5+yjRKg6nqWrmaXVnqsrC26jMmo33UgPiGXqUwJTYxUhgyxO2TQ2+InnmC58l4FXJzX0/kag/oV2bklLBSetqW/tsisZRIwHb5LlvDgeW6216ybGkjlkUrBH4w/vKZveTv/0zN0JEQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=er7ZIhstytlbr4Fw+vwvxX46adHmT5K1Mclwb2FDIsI=;
 b=iPSeFXutwP0kSv7SZaxLTMVwoW2Ldy75kQq1duMxcPVw5917cGdRYJKmji1Ul2G9QWS1J89jLScKqJa/T9lv1/NPClDcQahWsUFs+j3oqbvqusa0PJLCUT/5FhbG/crPjFF4ZcQuyxujalHpJGOstDh1wjy7QUkJ4+lKK9K+BtBWpJJCe3264+saMs4j/gAEz5d+ATOPbIXAo8om7XvFLHzJ0gNIYmJwY+E+1b3XOP5M999YmR2XDFXKiLIWy/ORMi+pfAMnm8Gb/Dgm9wti3hpCHHU9FQW+cBa/Z9h8w5dU1zst2nNszgq/vyYrBB6/xs926IKgzRMZrEQ+UD66IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er7ZIhstytlbr4Fw+vwvxX46adHmT5K1Mclwb2FDIsI=;
 b=iums5hmsccn3M6Em6zFgt4mVU7AlIOzrCop7JSmzW8KYDHKCvTIHqcCeY2s6uxZ+/O2DulcvRsvg5xfw64C+KYFjf04kS/6YQsPwu4jB0w2baWVWRdYon5Reo8aMsLsZOc4IBMx8G+nBhJF9KLRQ02L+2A9t98wPxvfJ9uoycKU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:19 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:19 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 11/12] ASoC: SOF: Add support for dynamic pipelines
Date: Thu, 16 Sep 2021 14:16:45 +0300
Message-Id: <20210916111646.367133-12-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bf17b06-1653-4ecd-7fca-08d979038c30
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4926B0DA3372EACAC03FD16EB8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uy8cyl+bpYMSjebxpZGLASSWc4KlaOBjxM0EjOyWFxXO1aqMcqBoInUS5onRrCAY1Qg0glIGJd+M0daeEVq/abJ8iSs3iMSA0MeCd3TSh4fqP86qqgTafCwSwXXIxa68tftielboMGNwqJZWPN2DWr7CLRkEDo7XLUtsJ864zI/HGKa0oNf22IPO6LZNh+cOIHEE+GDZx1sjMmHHnER/jJb1kLaKazJRVmmWJtADxlETyi4LAzxx5PAvdSe1boJkyVnS3ZdDcVj/RWUILRxDqjBjLjYWkl4QKAfzj8lyDb/eBFjzi3lmtDUIF40Woojwfn1epkvYFI+QJBn8utkxLt1OWFCisREIjuHQn63iZR4fnRprCM0Uw3flwoiYM0zgC+PeB3lrbvNfCDNHDT7kHEZ2TIE3oyuI/MQUSN36sDAOEoA4PFvbS0ogdLsyivN7S3kAg/ruFq0kOgDGGJGLQ+GpxJ8mac9CYMglBKKTLu5ip7KZo9CYJQuR5whZjOjQc3iYOaSKxQg6W/UmbjeQUcaKJZAUzCN3QKwhzfv8r90EdCdSs1Y8RQOg/dOxoRORTgUCuFepzhSh+BmwAHr2ay8RqaTb4nRGp9KpXwKl/RW7/QV928+HHYsKZ9nvIXKb673bb4OX95oxh2amraiy+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(30864003)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ts8UP2j2623592gAvj9tcUCcZ/YrPiAuG15rcCuGOikvjgjTVycX9bF3/1aZ?=
 =?us-ascii?Q?NIZAfpTVYlq6pgm0bEMMqyYZqwZXAANwvcb8BT24iTRqMrSdg94i/QAghauv?=
 =?us-ascii?Q?h/FdlyJfz4vK3tCJgBwf0e1tyIfeRXj+B703QVuM1ZRARdk7WyCrUu094cNz?=
 =?us-ascii?Q?x2dgSLv4oJ0o+5pampRmvndtEeBM3T/lZhGK5a1eupd7X9sIM2BzBTm5pvM3?=
 =?us-ascii?Q?tdwO3OO1gpOhJ1kgA19QD9coMk2I1IvYQDCXuTp/7dXfTXQadVT8IMV0jaUN?=
 =?us-ascii?Q?x8kmtQDfs/MAhPgobU099H0VUDS7OpoxCPOaSRFjgD0XLhuuC0a5ZX8jGno9?=
 =?us-ascii?Q?hJc/qqQAw30/FXj03bmQ5ozHMLATlulqvX4+xWLAqaQLEfXjAt5a9qQ2bAuv?=
 =?us-ascii?Q?L6ErJjhVP5tcuovkBBrp1E2D+PhKuXKOQrEeQILYVFwN8UPBCnQZCCVO6AWn?=
 =?us-ascii?Q?TNVUrSSQnMAUEAD9kEJimkAnEYJMERBUoeLLW3JR+1hVpWrLI1iIyKthXm6K?=
 =?us-ascii?Q?AEhbVa7S1qTs7BsvzijZSHQno5O2ZnlAhXXt/t1a3iu5bEtUEM2c6EdH1z+u?=
 =?us-ascii?Q?EHODGj1n4iSVn+7wOceUK/yLS7PQEQNayOQ/We9Zxar5z9iEeEjL0vc22xvB?=
 =?us-ascii?Q?sjMavbMb2GqxJsZPpkGf8evyuy0r/NbwlsqJ4IiftFxywiOJFDDjVf9PJVb+?=
 =?us-ascii?Q?4CAiikKVoJKC3RH1JBlAHOXOZz1nlypNOoCLcs3VQh7PMCfzOfEX4iXPxdH5?=
 =?us-ascii?Q?/gU3KQ0UBKc5veaImCRvRaRX26xYbGWVYHEPHyjsobe4rCEUCZgE0t1ipa1Y?=
 =?us-ascii?Q?yZw+Rnu+Qj3JQSPugmp0nIpppAZPJSv48CnXgAa81H8qy3XqafNuB5qJ3V/C?=
 =?us-ascii?Q?h8KplFAONT1Cb1WuMnU5Ya9M4fyCtTNFBp5UmPSEbFpLUQ4LEwXIVoLwkBqL?=
 =?us-ascii?Q?K6e39DkHht0tpkc8/vWbZCf5NrenKVj8zjY3l417QKK+Mt+5GHl+6ks5NyAj?=
 =?us-ascii?Q?jElsfpQK0kMu7b0PclZy9mtd9ibjjtg/pBeHjMFpRkI4JdEjwMsXGGyxLNAe?=
 =?us-ascii?Q?qxS+KEldZSptWAUBSf3cAt4XVHZkaDzdzdYWPWoKP/kZc5z08pgJ+Y5O5V59?=
 =?us-ascii?Q?TIo9C5YIL1p3ly2VsapYLTWnF8pdi7aKb83f+Za8E6/s9qOuBQYZxNxUndv3?=
 =?us-ascii?Q?/opKPWZF0m5odphub4pMzjVl8GUh6HwlC7TOBYtQe65KIRxECFivd0YNqzr0?=
 =?us-ascii?Q?cGQv/NloZ3hjY+MFxiXi7FJv1AGar37R7lKkyl+Hs96ctQKMn0bbZHYg5tHe?=
 =?us-ascii?Q?UYJJAmOM2/5guWX8cYHuZEuLEIhAXB9PDw01/Pq0nC9jCRxfZDL0llxiVS9/?=
 =?us-ascii?Q?FCSCKJ+f41xcOY++NbtCXiJbM+8AX7d0zB7IHQSYId/bDE1rzw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf17b06-1653-4ecd-7fca-08d979038c30
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:19.5106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ml0oUwwiBnf7gUJJgWXvTM4xGD7xY/WJGUqmY59oI/uWG+pWvUL9rLg27L0gpU6wRWuA1wIrG9AemtAzfu5j2g==
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

Add support for dynamic pipelines by modifying the PCM
hw_params ioctl implementation to determine the widgets
required for a PCM stream by querying the list of
connected DAPM widgets. This list is saved as part of
snd_sof_pcm_stream struct and will be used to setup the widgets.

The sof_widget_list_setup/free routines setup and free connected
DAPM widgets when a PCM is opened/closed. These routines accept
a list of connected DAPM widgets as input and determine the SOF
widgets, their corresponding pipeline widgets and connections
between them that need to be setup before the PCM is triggered.

Please note that the dynamic pipeline feature will only be enabled
for those pipelines whose dynamic_pipeline_widget flag is set in
topologies. Add a new token called SOF_TKN_SCHED_DYNAMIC_PIPELINE
that when set in topology will be applied to the
dynamic_pipeline_widget flag of the pipeline widget.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c |  22 +--
 sound/soc/sof/pcm.c       |  58 +++++-
 sound/soc/sof/sof-audio.c | 358 +++++++++++++++++++++++++++++++++-----
 sound/soc/sof/sof-audio.h |   6 +
 4 files changed, 390 insertions(+), 54 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 93305d389ff6..c0bdc5c36043 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -41,17 +41,6 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
-static const struct sof_intel_dsp_desc
-	*get_chip_info(struct snd_sof_pdata *pdata)
-{
-	const struct sof_dev_desc *desc = pdata->desc;
-	const struct sof_intel_dsp_desc *chip_info;
-
-	chip_info = desc->chip_info;
-
-	return chip_info;
-}
-
 int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
@@ -132,6 +121,17 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
 	return sof_widget_free(sdev, swidget);
 }
 
+static const struct sof_intel_dsp_desc
+	*get_chip_info(struct snd_sof_pdata *pdata)
+{
+	const struct sof_dev_desc *desc = pdata->desc;
+	const struct sof_intel_dsp_desc *chip_info;
+
+	chip_info = desc->chip_info;
+
+	return chip_info;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9893b182da43..7cf6b18be240 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -116,6 +116,40 @@ static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev,
+					   struct snd_soc_pcm_runtime *rtd,
+					   struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dai *dai;
+	int ret, j;
+
+	/* query DAPM for list of connected widgets and set them up */
+	for_each_rtd_cpu_dais(rtd, j, dai) {
+		struct snd_soc_dapm_widget_list *list;
+
+		ret = snd_soc_dapm_dai_get_connected_widgets(dai, dir, &list,
+							     dpcm_end_walk_at_be);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: dai %s has no valid %s path\n", dai->name,
+				dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+			return ret;
+		}
+
+		spcm->stream[dir].list = list;
+
+		ret = sof_widget_list_setup(sdev, spcm, dir);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed widget list set up for pcm %d dir %d\n",
+				spcm->pcm.pcm_id, dir);
+			spcm->stream[dir].list = NULL;
+			snd_soc_dapm_dai_free_widgets(&list);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
@@ -213,7 +247,14 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
 
-	/* send IPC to the DSP */
+	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
+	if (!spcm->stream[substream->stream].list) {
+		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, substream->stream);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* send hw_params IPC to the DSP */
 	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
 				 &ipc_params_reply, sizeof(ipc_params_reply));
 	if (ret < 0) {
@@ -259,6 +300,10 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 			err = ret;
 	}
 
+	ret = sof_widget_list_free(sdev, spcm, substream->stream);
+	if (ret < 0)
+		err = ret;
+
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
@@ -316,6 +361,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
 	bool reset_hw_params = false;
+	bool free_widget_list = false;
 	bool ipc_first = false;
 	int ret;
 
@@ -386,6 +432,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 			spcm->stream[substream->stream].suspend_ignored = true;
 			return 0;
 		}
+		free_widget_list = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
@@ -414,8 +461,15 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
 	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
-	if (!ret && reset_hw_params)
+	if (!ret && reset_hw_params) {
 		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		if (ret < 0)
+			return ret;
+
+		/* free widget list only for SUSPEND trigger */
+		if (free_widget_list)
+			ret = sof_widget_list_free(sdev, spcm, substream->stream);
+	}
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index bf5e7c7019a5..7b4dd64576fa 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -83,6 +83,15 @@ static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_wi
 	return 0;
 }
 
+static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
+{
+	struct snd_sof_route *sroute;
+
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		if (sroute->src_widget == widget || sroute->sink_widget == widget)
+			sroute->setup = false;
+}
+
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_free ipc_free = {
@@ -122,6 +131,8 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		return ret;
 	}
 
+	/* reset route setup status for all routes that contain this widget */
+	sof_reset_route_setup_status(sdev, swidget);
 	swidget->complete = 0;
 	dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
 
@@ -172,6 +183,19 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 
 		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, comp, ipc_size, &r, sizeof(r));
 		kfree(comp);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to load widget %s\n",
+				swidget->widget->name);
+			goto use_count_dec;
+		}
+
+		ret = sof_dai_config_setup(sdev, dai);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to load dai config for DAI %s\n",
+				swidget->widget->name);
+			sof_widget_free(sdev, swidget);
+			return ret;
+		}
 		break;
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
@@ -193,6 +217,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
 			swidget->widget->name);
+		sof_widget_free(sdev, swidget);
 		return ret;
 	}
 
@@ -206,6 +231,266 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 }
 EXPORT_SYMBOL(sof_widget_setup);
 
+static int sof_route_setup_ipc(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
+{
+	struct sof_ipc_pipe_comp_connect *connect;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	/* skip if there's no private data */
+	if (!sroute->private)
+		return 0;
+
+	/* nothing to do if route is already set up */
+	if (sroute->setup)
+		return 0;
+
+	connect = sroute->private;
+
+	dev_dbg(sdev->dev, "setting up route %s -> %s\n",
+		sroute->src_widget->widget->name,
+		sroute->sink_widget->widget->name);
+
+	/* send ipc */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 connect->hdr.cmd,
+				 connect, sizeof(*connect),
+				 &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: route setup failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	sroute->setup = true;
+
+	return 0;
+}
+
+static int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
+			   struct snd_soc_dapm_widget *wsink)
+{
+	struct snd_sof_widget *src_widget = wsource->dobj.private;
+	struct snd_sof_widget *sink_widget = wsink->dobj.private;
+	struct snd_sof_route *sroute;
+	bool route_found = false;
+
+	/* ignore routes involving virtual widgets in topology */
+	switch (src_widget->id) {
+	case snd_soc_dapm_out_drv:
+	case snd_soc_dapm_output:
+	case snd_soc_dapm_input:
+		return 0;
+	default:
+		break;
+	}
+
+	switch (sink_widget->id) {
+	case snd_soc_dapm_out_drv:
+	case snd_soc_dapm_output:
+	case snd_soc_dapm_input:
+		return 0;
+	default:
+		break;
+	}
+
+	/* find route matching source and sink widgets */
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		if (sroute->src_widget == src_widget && sroute->sink_widget == sink_widget) {
+			route_found = true;
+			break;
+		}
+
+	if (!route_found) {
+		dev_err(sdev->dev, "error: cannot find SOF route for source %s -> %s sink\n",
+			wsource->name, wsink->name);
+		return -EINVAL;
+	}
+
+	return sof_route_setup_ipc(sdev, sroute);
+}
+
+static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
+					  struct snd_soc_dapm_widget_list *list, int dir)
+{
+	struct snd_soc_dapm_widget *widget;
+	struct snd_soc_dapm_path *p;
+	int ret;
+	int i;
+
+	/*
+	 * Set up connections between widgets in the sink/source paths based on direction.
+	 * Some non-SOF widgets exist in topology either for compatibility or for the
+	 * purpose of connecting a pipeline from a host to a DAI in order to receive the DAPM
+	 * events. But they are not handled by the firmware. So ignore them.
+	 */
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		for_each_dapm_widgets(list, i, widget) {
+			if (!widget->dobj.private)
+				continue;
+
+			snd_soc_dapm_widget_for_each_sink_path(widget, p)
+				if (p->sink->dobj.private) {
+					ret = sof_route_setup(sdev, widget, p->sink);
+					if (ret < 0)
+						return ret;
+				}
+		}
+	} else {
+		for_each_dapm_widgets(list, i, widget) {
+			if (!widget->dobj.private)
+				continue;
+
+			snd_soc_dapm_widget_for_each_source_path(widget, p)
+				if (p->source->dobj.private) {
+					ret = sof_route_setup(sdev, p->source, widget);
+					if (ret < 0)
+						return ret;
+				}
+		}
+	}
+
+	return 0;
+}
+
+int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+	struct snd_soc_dapm_widget *widget;
+	int i, ret, num_widgets;
+
+	/* nothing to set up */
+	if (!list)
+		return 0;
+
+	/* set up widgets in the list */
+	for_each_dapm_widgets(list, num_widgets, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+		struct snd_sof_widget *pipe_widget;
+
+		if (!swidget)
+			continue;
+
+		/*
+		 * The scheduler widget for a pipeline is not part of the connected DAPM
+		 * widget list and it needs to be set up before the widgets in the pipeline
+		 * are set up. The use_count for the scheduler widget is incremented for every
+		 * widget in a given pipeline to ensure that it is freed only after the last
+		 * widget in the pipeline is freed.
+		 */
+		pipe_widget = swidget->pipe_widget;
+		if (!pipe_widget) {
+			dev_err(sdev->dev, "error: no pipeline widget found for %s\n",
+				swidget->widget->name);
+			ret = -EINVAL;
+			goto widget_free;
+		}
+
+		ret = sof_widget_setup(sdev, pipe_widget);
+		if (ret < 0)
+			goto widget_free;
+
+		/* set up the widget */
+		ret = sof_widget_setup(sdev, swidget);
+		if (ret < 0) {
+			sof_widget_free(sdev, pipe_widget);
+			goto widget_free;
+		}
+	}
+
+	/*
+	 * error in setting pipeline connections will result in route status being reset for
+	 * routes that were successfully set up when the widgets are freed.
+	 */
+	ret = sof_setup_pipeline_connections(sdev, list, dir);
+	if (ret < 0)
+		goto widget_free;
+
+	/* complete pipelines */
+	for_each_dapm_widgets(list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+		struct snd_sof_widget *pipe_widget;
+
+		if (!swidget)
+			continue;
+
+		pipe_widget = swidget->pipe_widget;
+		if (!pipe_widget) {
+			dev_err(sdev->dev, "error: no pipeline widget found for %s\n",
+				swidget->widget->name);
+			ret = -EINVAL;
+			goto widget_free;
+		}
+
+		if (pipe_widget->complete)
+			continue;
+
+		pipe_widget->complete = snd_sof_complete_pipeline(sdev->dev, pipe_widget);
+		if (pipe_widget->complete < 0) {
+			ret = pipe_widget->complete;
+			goto widget_free;
+		}
+	}
+
+	return 0;
+
+widget_free:
+	/* free all widgets that have been set up successfully */
+	for_each_dapm_widgets(list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		if (!num_widgets--)
+			break;
+
+		sof_widget_free(sdev, swidget);
+		sof_widget_free(sdev, swidget->pipe_widget);
+	}
+
+	return ret;
+}
+
+int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+	struct snd_soc_dapm_widget *widget;
+	int i, ret;
+	int ret1 = 0;
+
+	/* nothing to free */
+	if (!list)
+		return 0;
+
+	/*
+	 * Free widgets in the list. This can fail but continue freeing other widgets to keep
+	 * use_counts balanced.
+	 */
+	for_each_dapm_widgets(list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		/*
+		 * free widget and its pipe_widget. Either of these can fail, but free as many as
+		 * possible before freeing the list and returning the error.
+		 */
+		ret = sof_widget_free(sdev, swidget);
+		if (ret < 0)
+			ret1 = ret;
+
+		ret = sof_widget_free(sdev, swidget->pipe_widget);
+		if (ret < 0)
+			ret1 = ret;
+	}
+
+	snd_soc_dapm_dai_free_widgets(&list);
+	spcm->stream[dir].list = NULL;
+
+	return ret1;
+}
+
 /*
  * helper to determine if there are only D0i3 compatible
  * streams active
@@ -309,13 +594,32 @@ int sof_set_up_pipelines(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
-	struct snd_sof_dai *dai;
 	int ret;
 
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
-		/* reset widget use_count after resuming */
-		swidget->use_count = 0;
+		/* only set up the widgets belonging to static pipelines */
+		if (swidget->dynamic_pipeline_widget)
+			continue;
+
+		/* update DAI config. The IPC will be sent in sof_widget_setup() */
+		if (WIDGET_IS_DAI(swidget->id)) {
+			struct snd_sof_dai *dai = swidget->private;
+			struct sof_ipc_dai_config *config;
+
+			if (!dai || !dai->dai_config)
+				continue;
+
+			config = dai->dai_config;
+			/*
+			 * The link DMA channel would be invalidated for running
+			 * streams but not for streams that were in the PAUSED
+			 * state during suspend. So invalidate it here before setting
+			 * the dai config in the DSP.
+			 */
+			if (config->type == SOF_DAI_INTEL_HDA)
+				config->hda.link_dma_ch = DMA_CHAN_INVALID;
+		}
 
 		ret = sof_widget_setup(sdev, swidget);
 		if (ret < 0)
@@ -323,56 +627,28 @@ int sof_set_up_pipelines(struct device *dev)
 	}
 
 	/* restore pipeline connections */
-	list_for_each_entry_reverse(sroute, &sdev->route_list, list) {
-		struct sof_ipc_pipe_comp_connect *connect;
-		struct sof_ipc_reply reply;
+	list_for_each_entry(sroute, &sdev->route_list, list) {
 
-		/* skip if there's no private data */
-		if (!sroute->private)
+		/* only set up routes belonging to static pipelines */
+		if (sroute->src_widget->dynamic_pipeline_widget ||
+		    sroute->sink_widget->dynamic_pipeline_widget)
 			continue;
 
-		connect = sroute->private;
-
-		/* send ipc */
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 connect->hdr.cmd,
-					 connect, sizeof(*connect),
-					 &reply, sizeof(reply));
+		ret = sof_route_setup_ipc(sdev, sroute);
 		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to load route sink %s control %s source %s\n",
-				sroute->route->sink,
-				sroute->route->control ? sroute->route->control
-					: "none",
-				sroute->route->source);
-
+			dev_err(sdev->dev, "%s: restore pipeline connections failed\n", __func__);
 			return ret;
 		}
-		sroute->setup = true;
-	}
-
-	/* restore dai links */
-	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
-		struct sof_ipc_dai_config *config = &dai->dai_config[dai->current_config];
-
-		/*
-		 * The link DMA channel would be invalidated for running
-		 * streams but not for streams that were in the PAUSED
-		 * state during suspend. So invalidate it here before setting
-		 * the dai config in the DSP.
-		 */
-		if (config->type == SOF_DAI_INTEL_HDA)
-			config->hda.link_dma_ch = DMA_CHAN_INVALID;
-
-		ret = sof_dai_config_setup(sdev, dai);
-		if (ret < 0)
-			return ret;
 	}
 
 	/* complete pipeline */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
+			/* only complete static pipelines */
+			if (swidget->dynamic_pipeline_widget)
+				continue;
+
 			swidget->complete =
 				snd_sof_complete_pipeline(dev, swidget);
 			break;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index d358d455da1e..8d1fc6a8d7d0 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -28,6 +28,8 @@
 
 #define DMA_CHAN_INVALID	0xFFFFFFFF
 
+#define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
+
 /* PCM stream, mapped to FW component  */
 struct snd_sof_pcm_stream {
 	u32 comp_id;
@@ -35,6 +37,7 @@ struct snd_sof_pcm_stream {
 	struct sof_ipc_stream_posn posn;
 	struct snd_pcm_substream *substream;
 	struct work_struct period_elapsed_work;
+	struct snd_soc_dapm_widget_list *list; /* list of connected DAPM widgets */
 	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
 	/*
 	 * flag to indicate that the DSP pipelines should be kept
@@ -256,4 +259,7 @@ void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata);
 int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 
+/* PCM */
+int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
+int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 #endif
-- 
2.27.0

