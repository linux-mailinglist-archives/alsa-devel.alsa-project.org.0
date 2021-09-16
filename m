Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25D40D853
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5112818B4;
	Thu, 16 Sep 2021 13:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5112818B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791186;
	bh=YDcAco6+2z3hSzMZ03vb/m3o/bODu4kFdsSeOoMyVVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqf3Ql77gMXa71J5P8PlD3c9EC8lLUuuloce72jSVsoaHMXCxULTOnChLf3OLtxb/
	 wo8i7r1fgvKWyo0DdlIfkQYGj243EReOiK7r9JYJLic/AsrZ+h3Q/+gSmJu4cmCphD
	 f+q5bjmFAbG4O73Vx/27xSh0fJ8HLfb5lM3OQ57Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D577FF804AE;
	Thu, 16 Sep 2021 13:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C4CF80507; Thu, 16 Sep 2021 13:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3202EF804B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3202EF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="X6HgEE+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEiZiu8/asj++LQxSnS8gGGnhgDFy/N1UAkeiUPQyiqxKznIv7NRJeQ13R3s/P6yVkwHtpyex9LOTuykkukjs9/6BtHgrUO+rjKHc8uah0WEwFAHKuGjP19Er6i/i+B1cHNL5JIjvDXjiaOrfhUDoJySFX8wce696YGesSqE01jhzvL9MTOd7IEdivxLX5zgHNvu/9ASlH1oP1ZxkIqbee6FxdlLGKCLz/94Z1fAAHI1PcRp0y8E5+3rOVwcu6nHeTTj+U35g/8mGHbzy1i6P5f2TYS0Ora31WSHDu5H82Y+Bqy8ihra+X3sUNoGCExr3vVfuLUiDMX+1gn00Na8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9F6N7Pj6vo69zc/ttEoJKiruQrqXNdVgT/jVWK7imMo=;
 b=OolH5jumsXW8RlBwtjABDXzQv8QKHkVCLnRixwqx1PERQ+l8LoCPVWbBtaPhvXBY+lhaVXkKGj8Y+Q7HrF4FFttiyTyyjW5l9XTLt8p8xllX1SqO4Zw/uG/wK0QOmMI6jCOqmn1oTNrrs/DbVaOnVzSItISHGyVfDlT2X2l+u7Ie0/LjXc+JdGgSqBexGenppPW8XhRbmAF2Cu4wo0AFg8l3+NxeDT6m6ZPGTdRXJtlsl0Dpz7A0NzjNTJCE2qUmF9yZ/XiTfeTkknaMQWmPXHMxxRY34AYiz5zYa4J/sxqjqT3ibxDiN3iz0Dsx78zxxhrf9Cd+Wmv1xPxyuFl7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9F6N7Pj6vo69zc/ttEoJKiruQrqXNdVgT/jVWK7imMo=;
 b=X6HgEE+Wp9nFAnlFP6UFc2PRjLPpH+JYuSlH8VgHy8q4NURnQzgrFsufKgqbMfttAi8Wpkbt9xUsC6SkuhNuWsLjJlhEH0o3R99llKBsCwBMoy36LHFqAsPnR5JAWzpio9FI1U6iCwZ7Ibb/l1PIh+J7EjUvGVhjBsvkBFIJd3U=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:12 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:12 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 06/12] ASoC: SOF: Add new fields to snd_sof_route
Date: Thu, 16 Sep 2021 14:16:40 +0300
Message-Id: <20210916111646.367133-7-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27493ac8-0ed2-4ffc-25ee-08d9790387fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4926E4E70B59968D4B167E4DB8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9lennv0wCYFwZq4cZwRRPOgZR6WE6BUupHGfiAk9n2uCiNE/f3QS7iPxGL5inLPPHAYIycAtnHbgXaDdzmHKXvRtpSUmAG9mZQWoJw6EK9kxoL8dt0gndBXvFdWXXxwu3avAcqjRxwcecD0Dt5+jPIytayLSnQ9VUau6Pit1mCS5/Yg37lUmUGknwggQuwu6HYwnuLdlw1VEIFXb787uYMuRWbPJWaqlto9CYEdDzcSasyyPCQJIsefgKPKIm4WGqmn6az2bb4D2xQjWrQfk4FbNuJVI4ekTL+vQYMXsFUHXCMzdA8W9FIu0fru64iuCGsqrnOSQxCZb5H9SifHqzKtPSpQBDa945mHc6PZAy5YxSrrkzKKtjqREqLGsNaYF7AipVfkEq34PoM+rklFlQDEMUei0dq1C5OwGtrj889uyH+wZI1j5K2/n6k2IAb0aEcN4C4OGiDr2uKVa6jsJ65yAtcAcTWpvIZVYq13VwAPe2gL3B5Fr1gUC7ffDGT1BQclGY81bESFtncFQgMiu+Ksv4ibK8J7iRERxrtHNf+Py4VqEuF7qJm3AVmUfL3pDaLI1FWwhRCvytDclAUsY31400wMOSu8s2vVQHNMxZ74OFx2sEY7MkkUKfNhT67aIJk3M0LVqL+clmtOz7k84w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wMxM702sl2V+sj6V7xguZlPfOe4QnIaB8fNWE3o1+xm/2zQo2uZJ+mzWIYZ?=
 =?us-ascii?Q?dpmChmDfniH8QG8gxOzCMsNa4qnO7hP12ZrKAZAmDxj+J4o2pk8RHoZY3Qos?=
 =?us-ascii?Q?vJh+g9fruO9PlZtpG0yZAAY51N33Qhy11l55zm/LrgRTYgBERk2OsoFKRbzB?=
 =?us-ascii?Q?P+VTTPb0emKWzAaEbx+xHDjbeFlXfdpqyX4aisanTaR5qySeGHFxgyt60YbS?=
 =?us-ascii?Q?D/FxEGdSGN7Z8ZjrfWSI8h9BWSH2M27MIShjJReFbUsF1bB//I1j/EjDcnGE?=
 =?us-ascii?Q?L6i4OOGOSyHh5GJ8+t+dt9BDqVAyVrP2FWGWHLPod9MFzCslw8JgNzlEH1pk?=
 =?us-ascii?Q?X4thWoCkMi5Lrc3gkWR5HOjKkwigkG/2SCAkYi7eULmXAC01S0dZxnxX+GkX?=
 =?us-ascii?Q?Bbxm9szzHXHJrIGJFeiR7YNa5dnNJDC6GlGKawcweLhlWWRxKQ5iyzdgO8PP?=
 =?us-ascii?Q?0rsgo1snAOMUpFc2lLJ4yVD9j98T0aUqa5DvVmt0OZY5BUT7a2mwQFrVkkWT?=
 =?us-ascii?Q?b8J77LGwSF8lKNlHwe8Ff+DOrpQpASqA9S/uiA+z6vLCwTlUwMYeI3GSmXmY?=
 =?us-ascii?Q?z2F0ZGMrBW05mNh+aizFZZrG4aXqz3xx7gG7RlmKGCbiMza3+MLhvjLJgPRR?=
 =?us-ascii?Q?cZvjdXqo+l8urXkjni+lgqK1uwZjk5UH4kVuARqlf9XaN4tDFZm4ndE1rCpx?=
 =?us-ascii?Q?k7lDs8m/eEA5tWNYSqRaQXUnvpzqg+gpuTS3LR+dB/jJ1o2ko8/wYzAntCfV?=
 =?us-ascii?Q?Xg1/+zhRF48cUeFs9vU0bncSfui5PPSB4JQzIUXoSaVATwKxD4UjX3c6kwPn?=
 =?us-ascii?Q?G8V3GdzFA4TLqfoSBQI9I5NOTP1JtzfuX7X1EwgI98W4qq4Z/9vGeHcqQ+XI?=
 =?us-ascii?Q?aSPDeGTzN8Tj6YSyuBgHutms3OMb7E5hv4+WvGoItyyIAiwdG/Ly0KgUNEBw?=
 =?us-ascii?Q?KeIVTGhpc1oEsr+mHwI1HIpRVX0SXCMsObPtc6ScKBO8Z+kedS2qPEEB8GqX?=
 =?us-ascii?Q?fwkofTSLnMmLgDjNaWWvWQIKrRatZeJxYMO/h1u14Yf27peOcn8AKTWasL7K?=
 =?us-ascii?Q?FLatnEXKhkhGcd6lRTk2rsgousGlyrN4s+egU1VoveVX6f+hXNhjeD3iTnY0?=
 =?us-ascii?Q?d475rKfCJWxpDHgZgs8bJe/nx9dZLgy9Jxl33C7yI2Fo6G4DiuNvaTh1ioH8?=
 =?us-ascii?Q?ognkmnGaDKIsalBjdKGbHX5oUdINBTSh7+bE7nsBOvyGJYPz0HTuT7sSCHsc?=
 =?us-ascii?Q?8UrJQ/EXlZ+cE0dohdGilNDxSoBXjUNJG6gB/wI4RfeEeb1UbJ81oSl85MtM?=
 =?us-ascii?Q?L8pIrCf0VEnFM30DEXbEkybLCmk97bHuTgghr7AmQb29XxzXB0hn7D8xBPoa?=
 =?us-ascii?Q?pXdQu78IOoS+gxiG9VLtJ9exGietv90D0KL9UPXwG7VWLb2WpA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27493ac8-0ed2-4ffc-25ee-08d9790387fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:12.4656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTK5hAVukmZL1hl9cdSdGkm2WGW2QhTQICxNiJk1xVd8tIbYAb3iKYOWT+rO1LZyt36W4fVocxiqCeFu5DM7gg==
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

Add two new fields to save the source widget and sink widget
pointers in struct snd_sof_route to make it easier to look up
routes by source/sink widget. Also, add a flag to indicate
if the route has been set up in the DSP. These will be used
when the dynamic pipeline feature is implemented and routes
will have to be set up at run time.

Also, add a new sof_tear_down_pipelines() callback, that will
used to reset the set up status for all routes during suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pm.c        |  2 ++
 sound/soc/sof/sof-audio.c | 15 +++++++++++++++
 sound/soc/sof/sof-audio.h |  4 ++++
 sound/soc/sof/topology.c  |  3 +++
 4 files changed, 24 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index c83fb6255961..ce922227c4c6 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -208,6 +208,8 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
 
+	sof_tear_down_pipelines(dev);
+
 	/* release trace */
 	snd_sof_release_trace(sdev);
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a4b9bb99bced..b52a453ae9d7 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -276,6 +276,7 @@ int sof_restore_pipelines(struct device *dev)
 
 			return ret;
 		}
+		sroute->setup = true;
 	}
 
 	/* restore dai links */
@@ -317,6 +318,20 @@ int sof_restore_pipelines(struct device *dev)
 	return ret;
 }
 
+/* This function doesn't free widgets. It only resets the set up status for all routes */
+void sof_tear_down_pipelines(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_route *sroute;
+
+	/*
+	 * No need to protect sroute->setup as this function is called only during the suspend
+	 * callback and all streams should be suspended by then
+	 */
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		sroute->setup = false;
+}
+
 /*
  * Generic object lookup APIs.
  */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4a1c38c5618d..fe997a80a847 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -118,6 +118,9 @@ struct snd_sof_route {
 
 	struct snd_soc_dapm_route *route;
 	struct list_head list;	/* list in sdev route list */
+	struct snd_sof_widget *src_widget;
+	struct snd_sof_widget *sink_widget;
+	bool setup;
 
 	void *private;
 };
@@ -240,6 +243,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 
 /* PM */
 int sof_restore_pipelines(struct device *dev);
+void sof_tear_down_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 60d1db6a9193..58f966ab2e81 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3501,6 +3501,9 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 		sroute->route = route;
 		dobj->private = sroute;
 		sroute->private = connect;
+		sroute->src_widget = source_swidget;
+		sroute->sink_widget = sink_swidget;
+		sroute->setup = true;
 
 		/* add route to route list */
 		list_add(&sroute->list, &sdev->route_list);
-- 
2.27.0

