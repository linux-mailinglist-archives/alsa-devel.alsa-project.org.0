Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E12140D873
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:22:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA8D018B3;
	Thu, 16 Sep 2021 13:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA8D018B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791355;
	bh=0lbl+0a/EZ+s0FiBUHXD16bXJ4a/DB5tzTZEeRM6fws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zz3MeephGqxxYZQcc8NX5lK2xpPgZJDX4byy93KexfmBFrDPNF3lPaJypERL5g1uB
	 Cak2X+HOX68IBnDQZXRjtJy8cMXcBiKHuTU/XWIjzJAk7TUjQ2yjf8nTBfEQF3Dn4L
	 tJFmRGOH5td2kQbNiuUTDDHEovtqNy7IHniYw+kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE4CDF80551;
	Thu, 16 Sep 2021 13:17:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36EEAF804E4; Thu, 16 Sep 2021 13:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E606F8025E
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E606F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="MzxxExJe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWxIrj5IY5LdeGPGtlvZnjYyRRHyEppwpcF7caENIUzc9O0iWKQNBN5Gb3+hWQT7Er7P0WkvyfmwckbMV9HeKZkE28QvtmxVl5DlEO5bBbY7N7KcffV1QLrMLIS2IXc5RiSFzdgpl+Wo69I6m5HHiHttWslH3gpvYhL7fX0vsjZob9FLnttBE/UeKLPGOqiaw38TKLdGxE3Mzq+ua4c3esXrBrNO2cysNaQoy7qSx/KfIX49Cl6VI8rXl3d/l9gxw/xUaVYUqoe60XmWztfF3c/RKGsUlAoDnizUBr7HZudkHv1ab2Bj6tFHztN/6/09abwahOrjf1KX447fE+bBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WGTu4FC1Vty5d47glpMeaHEc8IYgxJcBUeCdzK0LeLE=;
 b=L5kNG8AX3COa5aHoPwaZGY48S4JJrATra0YdoTYa6ir1ic/I3tL708fRX+gTlX2HVXwlGHjOAnZcRo647LP/zedX0/QKzm475rdw1tQLvnp4aZrHd6W90pKskkBAYxN1hgEtyvacd6NEWfStQ+1VJ10eOiPM6RUTAdeFwV+wwps+Zz4I27BZ8J730NX6F+Z2OUtj3UBdxSfpDrXNiwOprGI2lWgzbDDHkXyZWv2U0WPon+HySflG6Qb2tTMI5/2mLnFKSQY0w7541H0B/UepQVjLBgdGDBPJzieoj6otYY1zQ4UtT4ihc0w/GDZ3GTzKt8+x7irKK2/7rsKDbeRf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGTu4FC1Vty5d47glpMeaHEc8IYgxJcBUeCdzK0LeLE=;
 b=MzxxExJenAE2MafxzrWjX0ow3AsciMB4mscgi6EqPPUHvg1ZQsYFy5X2sqKtHps/tzM/pt+9Bf3T8N6GBoxF61PHiGp5Rxe1MzDZQcVrs0zzAl7/9NVhEntaJfHyU70o8DrDaTY//LZ8W611NIKkshnBlBMnEfcjF0CN8EUfMdQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:18 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:18 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 10/12] ASoC: SOF: Intel: hda: make sure DAI widget is set up
 before IPC
Date: Thu, 16 Sep 2021 14:16:44 +0300
Message-Id: <20210916111646.367133-11-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 136bcf5b-b0ba-4f59-e919-08d979038b64
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB49268FB4C988A57E49881B23B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPzkglONUtzi13XVHDb4cV1Jbbl/tnIEVjJjT0VgZHtTIF4pN51AUMbj1lH0w2McT67+bYtyavptd5f4IqQI6dPY8OY6V9dKsyAXtImh0BgRbfY4IjrchsG+m2g0THRc8J9BxYuppiu/nSL5NEhF9pU9F+YQLmGbWNnUOSeqn0QPnFBtwWhwuxHwicL+xLWPRZ/y/iLPtK3Gzh736SmOOdhoKO2tczZ6cAoAR8ToiKiePsHuLqZU+LixFlKA/5UsWNJaGaxt6W6CRaSdVjmW9hCA+NaHqvmEdxyWe95sczfv8cQjrl8EpVQIwdN3O5bAWiNMq+DHTMHh/SdfkA/ObStTPbdPR01R9m1dtDSypeuBpQ96tGkSV9K8Z39HYXkRI6sU2uuJRYgVBk4DgwO6IdC9v3Pu+G2sdvyZDOXBichHgFBWDOZAlxk81vLhvEVUeovBSbFvLvBOgtOau/ROrdj+Uejn2/9A5T1g67T/UUw+FaMxTdddLYco9p7Z9h/VsoQq/vJyF7khZcrGHicsQbGbwGQbYt2GzeyAziTNe4/JmK+T9NtrqSKsQlzgtRKf0pRELq7Ai5JzGnJb4n5JgqCQ0B6At7RQ/cyCQl9cB+DujU8AKNM/Zdc3uG42Z7J+TC2KJTJ4KuJsI7OVQDCX+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(30864003)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lg1sA3AIlCUtpAr3M46Y/dl6TzOD/g8vWVGoiozkWEPomxp4iwt/LN5+AxFL?=
 =?us-ascii?Q?SjNsGrCeqiVa2i4EsJfdEvV9/bM/WExYb1vrvGsekWr/50tSglhEXN6e7EAB?=
 =?us-ascii?Q?hTU8qXHrLSJdZN/zqibo0TEvKraye3Ee4DGZiQihukEjDBE9qackr6cN4vNh?=
 =?us-ascii?Q?fsIZ2IMtVRRBre5L2L26/1K/vjDZcBTIo/7avvv5y+K3Nv7t6ClDbcoX7ZXQ?=
 =?us-ascii?Q?MbL9k02HHp4BdZmKpJY9rfp+zLdo6UutM0jOBnlks1+1qK8/BSGTzvPIYDBF?=
 =?us-ascii?Q?/rUhuXuUpST+W/PKBK3KPxuUNosyuXfxF8JChhdfYJXd1cPm5KR9o+nJ+mN4?=
 =?us-ascii?Q?oS0QAteY/7ayp2cIa1HEfGwVu49EqTGJxIQ83fLaZBbJIeTflGbe/A2uP+7c?=
 =?us-ascii?Q?i0O3gS2FVBw8QH5fPqo7e/AafwJncfd1Z4yQrPbAy2wZUHf9cyEv8SIg7SMM?=
 =?us-ascii?Q?IbsyapYRSMYdetOYs3bLFQPfk9+Lfe/kG1udDsqeJkGxzuiMIuO3/IHF9xeR?=
 =?us-ascii?Q?4EuCT3YO0p9LA1gP3Gzb9r0i6gCM3D2Wn/phNSqqE1ADGwAhbUA2CMDKSYPE?=
 =?us-ascii?Q?142J69gOwqd6ZzuTqRqoBbdcQ9wLfzRFQpct4b6ZpvMhMEDAkyVHAyUQFy58?=
 =?us-ascii?Q?8+awKBDWY43BaUsGKZaI4ruOzEVMS36ZLfR3lbrA4dt/O1T9PIgPGd3yuhXP?=
 =?us-ascii?Q?+xhozI/sDOT6xXAh9a5W6Jp9n1ScX+t6Ny134qMr24+ku/eKZAdSvhG689gG?=
 =?us-ascii?Q?aLW00n7QwHdKkdMQtXWDw8vtp1Yrz0gYfu+h3JnNfKgTDok25W4JzrRLj0Np?=
 =?us-ascii?Q?PHBe94ftHcmvTmmzBKV1DdUD+pCZah1L5SHMPeeyU9GNSXLzRgoHIuPpv8hA?=
 =?us-ascii?Q?xLeQwjVNfqBS/CDhRcPDD+PkrPKxr5b8f53hudBiiHrwR2q9m8y0gWm670f0?=
 =?us-ascii?Q?Tz6oZoeYg8vVUNTgeBMTzGiNHs71L8xRoDA+LgsMaqQvtby3rdC8zN2bjGUe?=
 =?us-ascii?Q?aZ0JARRbLQZW5s8O0/dbU73YSvhto+uq8WIlu+tkmRSU0l1VPdBLt2Mbf59p?=
 =?us-ascii?Q?IqmSj2Sw4Z7eB2JS3uUAwWlY4/dKcTvdazpT1JIV9tzorpoXB2FzNCrGAB24?=
 =?us-ascii?Q?n0kJ2gHGPEta+i964coZGl6GNvkro82Qrx2K9a252Xd8nl95jrOLlLXM5D0r?=
 =?us-ascii?Q?jfkcJL2et8TR+voAuk0tPe/XC9MiLyYmIjRMnxIHS91CQRfUFXlT6k5sCjNr?=
 =?us-ascii?Q?MyKkkHqTQ14G3r7so8iclr0Xifhx5Pg+imEjya/TDlAwa43NryiYj868dR5T?=
 =?us-ascii?Q?UcVqN5FPVEAn8j6dpnl4jaRcPklAuX/Imy+yjgKJ6sp9Fi0kaGknJLHD1mc0?=
 =?us-ascii?Q?qDbfnp1m2+SFAZG3B7rhM8frCc4m4ICjcK4TzfXreQ6D8McAiQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136bcf5b-b0ba-4f59-e919-08d979038b64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:18.2093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6hQMkFgwS0knvQ0em+tcWy3XMBplcBFGM3lcVC1ishdBbM6O53YWy/0wZt9LR7R+jcHsHf6JjLg4SguD4+Ojw==
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

With the implementation of the dynamic pipeline feature, widgets
will only be setup when a PCM is opened during the
hw_params ioctl. The BE hw_params callback is responsible for
sending the DAI_CONFIG for the DAI widgets in the DSP.
With dynamic pipelines, the DAI widgets will need to set up
first before sending the DAI_CONFIG IPC in the BE hw_params.

Update the BE hw_params/hw_free callbacks for all ALH, HDA and SSP
DAIs to set up/free the DAI widget before/after DAI_CONFIG IPC.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 176 ++++++++++++++++++++-------------
 sound/soc/sof/intel/hda.c     | 177 +++++++++++++++++++++++++---------
 sound/soc/sof/intel/hda.h     |   5 +
 sound/soc/sof/sof-audio.c     |   1 +
 sound/soc/sof/sof-audio.h     |   2 +-
 sound/soc/sof/topology.c      |   3 -
 6 files changed, 245 insertions(+), 119 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c1f9f0f58464..fb1b429cc451 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -151,49 +151,70 @@ static int hda_link_dma_params(struct hdac_ext_stream *stream,
 	return 0;
 }
 
-/* Send DAI_CONFIG IPC to the DAI that matches the dai_name and direction */
-static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
-			       const char *dai_name, int channel, int dir)
+/* Update config for the DAI widget */
+static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widget *w,
+							int channel)
 {
+	struct snd_sof_widget *swidget = w->dobj.private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
-	struct sof_ipc_reply reply;
-	int ret = 0;
 
-	list_for_each_entry(sof_dai, &hda_stream->sdev->dai_list, list) {
-		if (!sof_dai->cpu_dai_name)
-			continue;
+	if (!swidget) {
+		dev_err(swidget->scomp->dev, "error: No private data for widget %s\n", w->name);
+		return NULL;
+	}
 
-		if (!strcmp(dai_name, sof_dai->cpu_dai_name) &&
-		    dir == sof_dai->comp_dai.direction) {
-			config = sof_dai->dai_config;
+	sof_dai = swidget->private;
 
-			if (!config) {
-				dev_err(hda_stream->sdev->dev,
-					"error: no config for DAI %s\n",
-					sof_dai->name);
-				return -EINVAL;
-			}
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(swidget->scomp->dev, "error: No config for DAI %s\n", w->name);
+		return NULL;
+	}
 
-			/* update config with stream tag */
-			config->hda.link_dma_ch = channel;
+	config = &sof_dai->dai_config[sof_dai->current_config];
 
-			/* send IPC */
-			ret = sof_ipc_tx_message(hda_stream->sdev->ipc,
-						 config->hdr.cmd,
-						 config,
-						 config->hdr.size,
-						 &reply, sizeof(reply));
+	/* update config with stream tag */
+	config->hda.link_dma_ch = channel;
 
-			if (ret < 0)
-				dev_err(hda_stream->sdev->dev,
-					"error: failed to set dai config for %s\n",
-					sof_dai->name);
-			return ret;
-		}
+	return config;
+}
+
+static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
+			      struct snd_soc_dapm_widget *w, int channel)
+{
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	struct sof_ipc_dai_config *config;
+	struct sof_ipc_reply reply;
+
+	config = hda_dai_update_config(w, channel);
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", w->name);
+		return -ENOENT;
+	}
+
+	/* send DAI_CONFIG IPC */
+	return sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+}
+
+static int hda_link_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
+				      struct snd_soc_dapm_widget *w,
+				      int channel, bool widget_setup)
+{
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	struct sof_ipc_dai_config *config;
+
+	config = hda_dai_update_config(w, channel);
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", w->name);
+		return -ENOENT;
 	}
 
-	return -EINVAL;
+	/* set up/free DAI widget and send DAI_CONFIG IPC */
+	if (widget_setup)
+		return hda_ctrl_dai_widget_setup(w);
+
+	return hda_ctrl_dai_widget_free(w);
 }
 
 static int hda_link_hw_params(struct snd_pcm_substream *substream,
@@ -207,6 +228,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hda_pipe_params p_params = {0};
+	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
 	int stream_tag;
 	int ret;
@@ -225,9 +247,13 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* update the DSP with the new tag */
-	ret = hda_link_config_ipc(hda_stream, dai->name, stream_tag - 1,
-				  substream->stream);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
+	ret = hda_link_dai_widget_update(hda_stream, w, stream_tag - 1, true);
 	if (ret < 0)
 		return ret;
 
@@ -283,6 +309,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 				snd_soc_dai_get_dma_data(dai, substream);
 	struct sof_intel_hda_stream *hda_stream;
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
 	struct hdac_stream *hstream;
 	struct hdac_bus *bus;
@@ -317,12 +344,16 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			w = dai->playback_widget;
+		else
+			w = dai->capture_widget;
+
 		/*
 		 * clear link DMA channel. It will be assigned when
 		 * hw_params is set up again after resume.
 		 */
-		ret = hda_link_config_ipc(hda_stream, dai->name,
-					  DMA_CHAN_INVALID, substream->stream);
+		ret = hda_link_config_ipc(hda_stream, w, DMA_CHAN_INVALID);
 		if (ret < 0)
 			return ret;
 
@@ -353,6 +384,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	struct hdac_stream *hstream;
 	struct snd_soc_pcm_runtime *rtd;
 	struct hdac_ext_stream *link_dev;
+	struct snd_soc_dapm_widget *w;
 	int ret;
 
 	hstream = substream->runtime->private_data;
@@ -368,9 +400,13 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* free the link DMA channel in the FW */
-	ret = hda_link_config_ipc(hda_stream, dai->name, DMA_CHAN_INVALID,
-				  substream->stream);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	/* free the link DMA channel in the FW and the DAI widget */
+	ret = hda_link_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
 	if (ret < 0)
 		return ret;
 
@@ -414,47 +450,51 @@ static struct snd_soc_cdai_ops sof_probe_compr_ops = {
 #endif
 #endif
 
-static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
+static int ssp_dai_setup_or_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+				 bool setup)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
-	struct sof_ipc_dai_config *config;
-	struct snd_sof_dai *sof_dai;
-	struct sof_ipc_reply reply;
-	int ret;
+	struct snd_soc_component *component;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	struct sof_ipc_fw_version *v;
+	struct snd_sof_dev *sdev;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	swidget = w->dobj.private;
+	component = swidget->scomp;
+	sdev = snd_soc_component_get_drvdata(component);
+	v = &sdev->fw_ready.version;
 
 	/* DAI_CONFIG IPC during hw_params is not supported in older firmware */
 	if (v->abi_version < SOF_ABI_VER(3, 18, 0))
 		return 0;
 
-	list_for_each_entry(sof_dai, &sdev->dai_list, list) {
-		if (!sof_dai->cpu_dai_name || !sof_dai->dai_config)
-			continue;
-
-		if (!strcmp(dai->name, sof_dai->cpu_dai_name) &&
-		    substream->stream == sof_dai->comp_dai.direction) {
-			config = &sof_dai->dai_config[sof_dai->current_config];
+	if (setup)
+		return hda_ctrl_dai_widget_setup(w);
 
-			/* send IPC */
-			ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config,
-						 config->hdr.size, &reply, sizeof(reply));
+	return hda_ctrl_dai_widget_free(w);
+}
 
-			if (ret < 0)
-				dev_err(sdev->dev, "error: failed to set DAI config for %s\n",
-					sof_dai->name);
-			return ret;
-		}
-	}
+static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	return ssp_dai_setup_or_free(substream, dai, true);
+}
 
-	return 0;
+static int ssp_dai_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	return ssp_dai_setup_or_free(substream, dai, false);
 }
 
 static const struct snd_soc_dai_ops ssp_dai_ops = {
 	.hw_params = ssp_dai_hw_params,
+	.hw_free = ssp_dai_hw_free,
 };
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c11e4c14d875..93305d389ff6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -52,6 +52,86 @@ static const struct sof_intel_dsp_desc
 	return chip_info;
 }
 
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "No config for DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	/*
+	 * For static pipelines, the DAI widget would already be set up and calling
+	 * sof_widget_setup() simply returns without doing anything.
+	 * For dynamic pipelines, the DAI widget will be set up now.
+	 */
+	ret = sof_widget_setup(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed setting up DAI widget %s\n", w->name);
+		return ret;
+	}
+
+	/* send DAI_CONFIG IPC */
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed setting DAI config for %s\n", w->name);
+		return ret;
+	}
+
+	sof_dai->configured = true;
+
+	return 0;
+}
+
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "error: No config to free DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	/* nothing to do if hw_free() is called without restarting the stream after resume. */
+	if (!sof_dai->configured)
+		return 0;
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed resetting DAI config for %s\n", w->name);
+
+	/*
+	 * Reset the configured_flag and free the widget even if the IPC fails to keep
+	 * the widget use_count balanced
+	 */
+	sof_dai->configured = false;
+
+	return sof_widget_free(sdev, swidget);
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -64,67 +144,70 @@ static int sdw_clock_stop_quirks = SDW_INTEL_CLK_STOP_BUS_RESET;
 module_param(sdw_clock_stop_quirks, int, 0444);
 MODULE_PARM_DESC(sdw_clock_stop_quirks, "SOF SoundWire clock stop quirks");
 
+static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
+			      struct snd_soc_dapm_widget *w,
+			      int link_id, int alh_stream_id, int dai_id, bool setup)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+
+	if (!swidget) {
+		dev_err(sdev->dev, "error: No private data for widget %s\n", w->name);
+		return -EINVAL;
+	}
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "error: No config for DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	/* update config with link and stream ID */
+	config->dai_index = (link_id << 8) | dai_id;
+	config->alh.stream_id = alh_stream_id;
+
+	if (setup)
+		return hda_ctrl_dai_widget_setup(w);
+
+	return hda_ctrl_dai_widget_free(w);
+}
+
 static int sdw_params_stream(struct device *dev,
 			     struct sdw_intel_stream_params_data *params_data)
 {
+	struct snd_pcm_substream *substream = params_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = params_data->dai;
-	struct sof_ipc_dai_config config;
-	struct sof_ipc_reply reply;
-	int link_id = params_data->link_id;
-	int alh_stream_id = params_data->alh_stream_id;
-	int ret;
-	u32 size = sizeof(config);
-
-	memset(&config, 0, size);
-	config.hdr.size = size;
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.type = SOF_DAI_INTEL_ALH;
-	config.dai_index = (link_id << 8) | (d->id);
-	config.alh.stream_id = alh_stream_id;
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config.hdr.cmd, &config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to set DAI hw_params for link %d dai->id %d ALH %d\n",
-			link_id, d->id, alh_stream_id);
-	}
+	struct snd_soc_dapm_widget *w;
 
-	return ret;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = d->playback_widget;
+	else
+		w = d->capture_widget;
+
+	return sdw_dai_config_ipc(sdev, w, params_data->link_id, params_data->alh_stream_id,
+				  d->id, true);
 }
 
 static int sdw_free_stream(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data)
 {
+	struct snd_pcm_substream *substream = free_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = free_data->dai;
-	struct sof_ipc_dai_config config;
-	struct sof_ipc_reply reply;
-	int link_id = free_data->link_id;
-	int ret;
-	u32 size = sizeof(config);
-
-	memset(&config, 0, size);
-	config.hdr.size = size;
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.type = SOF_DAI_INTEL_ALH;
-	config.dai_index = (link_id << 8) | d->id;
-	config.alh.stream_id = 0xFFFF; /* invalid value on purpose */
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config.hdr.cmd, &config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to free stream for link %d dai->id %d\n",
-			link_id, d->id);
-	}
+	struct snd_soc_dapm_widget *w;
 
-	return ret;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = d->playback_widget;
+	else
+		w = d->capture_widget;
+
+	/* send invalid stream_id */
+	return sdw_dai_config_ipc(sdev, w, free_data->link_id, 0xFFFF, d->id, false);
 }
 
 static const struct sdw_intel_ops sdw_callback = {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 087fa06d5210..9da8ba0ed38d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -733,4 +733,9 @@ void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
 /* PCI driver selection and probe */
 int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id);
 
+struct snd_sof_dai;
+struct sof_ipc_dai_config;
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w);
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w);
+
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7a4aaabf091e..bf5e7c7019a5 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -163,6 +163,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			return -ENOMEM;
 
 		dai = swidget->private;
+		dai->configured = false;
 		memcpy(comp, &dai->comp_dai, sizeof(struct sof_ipc_comp_dai));
 
 		/* append extended data to the end of the component */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 6ac623137026..d358d455da1e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -130,11 +130,11 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
-	const char *cpu_dai_name;
 
 	struct sof_ipc_comp_dai comp_dai;
 	int number_configs;
 	int current_config;
+	bool configured; /* DAI configured during BE hw_params */
 	struct sof_ipc_dai_config *dai_config;
 	struct list_head list;	/* list in sdev dai list */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b996b89f2920..d8eb238e5229 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2756,9 +2756,6 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 			if (!dai->dai_config)
 				return -ENOMEM;
 
-			/* set cpu_dai_name */
-			dai->cpu_dai_name = link->cpus->dai_name;
-
 			found = 1;
 		}
 	}
-- 
2.27.0

