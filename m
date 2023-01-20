Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20992674DCE
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:08:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD882E27;
	Fri, 20 Jan 2023 08:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD882E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198533;
	bh=6FfNFXBz47Dx6rMU0maquoTwo5w7uUt0eHpEymvf3ks=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z31Nku54YroHUCHIjboFNqUVa9ezVpy5EU9GYDwzeep+RYqT44l4r66gsjbdzp+Oo
	 ltefeouFYEXtNxv2RU8OgD5PYJolE/uyvr5uXOKDaYsw51xpQ64ZahA+iRwMRkZKCs
	 U94GnYkGgTPaFFOfJHXe6X9rGlh3fijvzMks5t3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF664F80563;
	Fri, 20 Jan 2023 08:04:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13992F8057C; Fri, 20 Jan 2023 08:04:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E330F80571
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E330F80571
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FE6MjW+F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlWyjuXZvfxLlCtSCxqEjmma85BjV6P6tQPdojxA5p9GgUh+LIXt3aNP95k9a7ky82sonYaRZJImUK8JoiRgB3Lsngk+EkNpps4Hg2mu6eOrQoP0k76RzJB4rkj2Z6sulZ24Syonj7Sn+qGhMStvavcalyWUg6VeYma0ZiWdrS49i6ZZxgb8yxpiOx7CYDx7DJAZ0BU3HGEJu0A7W2RbyyG7aovr2UQpfnfw7YOaTnVrq5HxSRwkPq4ZT0LvgnWylJwOhX00A9T1sXoO4QZnDRIbuKReWhXtMBK96irW4fRai3FwWAd3iffL72LOSwb2ZinDcPnxjfCRkWnd1twUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EdcOb/DHyBzrFRJqU85jer4bvxNeURMaqU93JpvLkQ=;
 b=J+Nw9qPzof9ygpzKfoTsgZ4J747q8lat6PpY+JgPXznl8SKi4XEjeVk+j1V9U2c76SL3AiZ7NFNbyu2Mhd70R2zHCL78PyIet+UpBj8snmmYiza8jegaQTD7QK2S1Fl7kvExE9txlrI+QqGUKZGe9aOKcemz09BIFBIp8WvXXUonmo+iqAPXT440uMuxUWj1tLGaRSXezrF4YPSS1KPNHi0FcvppgzXaEltTAygbUowds2eGph8LxZwJvrElr4+cJpliO2fYth0HXpCGQMt5MsCirfauH4kCkmPNs3R4dR3e6d1pOw99yxzO5almuvoNS42wf9nHu6pZvJ6YvJjcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EdcOb/DHyBzrFRJqU85jer4bvxNeURMaqU93JpvLkQ=;
 b=FE6MjW+Fo4zAJpwh/LevXTlYyrBBr7exdfwYtrL+EGCJ8aeFZfxomVtnIGyKUNWH4FHiE3JRXFjqgAztLn7f4J/trS5v1WsLzv6vI93pZXFlE/Fq05DBkwDRO/9hDGnmW8OpfYFo8svyUlYyrDZk9rFIlqZlMM9fDj75J6vv5xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5825.jpnprd01.prod.outlook.com (2603:1096:604:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 07:03:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:57 +0000
Message-ID: <87edrpk7qb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 22/25] ASoC: soc-dai.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:57 +0000
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb63c08-d3b3-4ec4-5064-08dafab47feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQG5LnxCY27Hq+i8RZ5jTkhgmLg3DxjqM6SUt/y/vFK6i6EWeq6LQjXPzXDl3uyH3LbHwjCYkwDI5fnQUZvCIjAwUGW+JVjG6OEXKYvOvU1/3W+1BMYXg8Gicdchudojkc6vSgFBTd8VoVQY1GynG0oY12ddG+a/u6Su0y79bEdurwBOxP1SVsALkeJl9TAvAJTy1KdOH6SPPucwxa9BoZ819yHHegLn9H1EBscYS4tWcmaekCA+C/lGprH/4gXJAyArvz1UR0BDIxGIp5t3QxdeInJeMZ86voWnuM/UN6O2ovKFjLI5oBA84ilq5uKhZmwFWknhOHN5HTTJpMZjg+B+FnE5XwbnAnNshO2PffLAVDceKjD0hr6wf8RbMml6QCQ96GbJaqpSZRK5z0lYIMnMU2dopIs/1MVE73MEzLILzu2IXCKKZ2HicLWE4L0bUZdU9Bvi1VYwhDPTZmk6DWGvMOhQmRVHuXW8p42XFzA3cN37qfL7YXJPfXWC4EI0YfKX/kRivF6Jio9905N/0sNbRHpQKZvKtRU1ojTLT0rnbk844qV9ith4MweGHJp24+rxwfTRlqDVdfafZF5ptrcck/e/CpXXBr7d/+kXSmVg4cyhnTkG2eQLT8sQlAfsejjp/yvQw0LD0ueGUvj/sLe89Z7JDa27LBTGJF9LD301GE81vVGm1lFvCAjBY+e2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(2616005)(36756003)(41300700001)(7416002)(5660300002)(8936002)(316002)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(26005)(186003)(6512007)(38350700002)(38100700002)(86362001)(2906002)(83380400001)(478600001)(6506007)(54906003)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1BB/z2CC7C9PUMkUcai39QZOGFpUljc67vK3VZtuVm4VEPMq28BY7sx8JIus?=
 =?us-ascii?Q?QcwBUyQS2WlmILOWn/c3+ttyqgR348EGgQxvZ8i8S1fvgJi4Qjz1Wb0rMd6l?=
 =?us-ascii?Q?yqJIiJ2lGp6gDHWiydfSIPMAiA/LqY4U513g1a9PLKCD00pVXwUfTpMG7Gen?=
 =?us-ascii?Q?GT+fzVjJlRujBXzwLU2/+SemlHw1DKBzdWDwK87Cj9eKwE0ThGHvYhb0fIDG?=
 =?us-ascii?Q?qxV3QFKBqdG2UHu32DpAgNg56Uz7PNYv6Uy5lxAteqXZTK6DLey8f31VsIML?=
 =?us-ascii?Q?ti9EA+Wx5DIt6odCEvwCjQD0L1yevi6+wZOLcNRK7p+POXO1kUKV9I/KFC3k?=
 =?us-ascii?Q?ySQJxWnm75IXqRg061I6U9aS6CbL+Jvr3li4I66azWNuK+cJVQrHr/zHQkQw?=
 =?us-ascii?Q?dAw+CgUGG1jaH35cQklgMTtzaR+BlraIh8ggjrbM/741sp04ZJhNusOL4l9Y?=
 =?us-ascii?Q?0ap1wPTyw/zoqfKDIV9E8vsBZix5s57Ljp1Ngcd1/94rqnYtIZKFbues1HV1?=
 =?us-ascii?Q?QDs7fRin+j7FQAXNQXHIIlvCsl6m5OrD2wl6xRV5PsY5XJT52V/YcIzhRSm3?=
 =?us-ascii?Q?KG/fWauoAWnb0a0l8JcKczqMA0HWtTo0NlcYZ/vg4Di1FEtnVshYcqDcwxoO?=
 =?us-ascii?Q?YOIDXHnqKV0WFvtxKcsvgRj5uR5b/gtwIfFqTv8jvGmzjYvSG3i+tXejQEJH?=
 =?us-ascii?Q?krmN0ioVbCBkx4gCi89mq21qgU45H7xBtWCv0piy2xSb1Vg4HwrqxFvQ0uW9?=
 =?us-ascii?Q?F5zqj2IW9e6nfvQENitqzZ415RCjAhcmw3Awe81uHql0ExI1K9PPsTWmOoEf?=
 =?us-ascii?Q?0hyukWjflxpovGX8sQhCNoGLH+jaTPRemlmoVy7Nh2bQjfhoqePKGT65ndMm?=
 =?us-ascii?Q?EqAFv0u/he+cUOUvsmEZIwOZX4pg8Rjizui8/tdYzrfXBLaqA6KaC4T36zMI?=
 =?us-ascii?Q?BYX2cAMgfknpIVL3x+xMgemuDdReSHFtLmKB6BOJ5t+xLXIGqM+AysJmsut2?=
 =?us-ascii?Q?Exe1iLpGdI/lC3euPrB2wG33dtkN6EWPi3vqu32tVUBrU381VxASbzjsX02k?=
 =?us-ascii?Q?a/8vSItaer0dQChX2bKrhJiga5U4haSO2UoIpA/6c3LMaSUOg5DKPncw3myA?=
 =?us-ascii?Q?OeyMp1yJBVABixnJQvF3x/sv/uNTbf1/yG0FYedR8trrJOxUbGwyVSyaDuIi?=
 =?us-ascii?Q?N6rWieWHGfkTHxjnPcIMc3gJca/NOygENhDzHiaLx0NXqGjqsLtdlI4raB3y?=
 =?us-ascii?Q?ABvBzOjxdkXhhWEO2bVSR16Xdz7l6ezLNr2FMgm6CveDpObpWIHfh1WItVXW?=
 =?us-ascii?Q?b9yVsnwodJ+oTTozOI3xLIWN8+0AZoUlooNJ1E22MQmbk3B/jSK6D9R0iF60?=
 =?us-ascii?Q?k9vfgXjkgl1XBIL7dmaVk1sFItbnJr9FakohVUWrxmFiV7zZ1xDRd4tXU+NR?=
 =?us-ascii?Q?CNDEVE8dRWhWata30ZKpAuaymNaKzFWeADw5nExEccnMva0iFIOiXuhdnAzw?=
 =?us-ascii?Q?MJLSEOkzMS2yDLU/hHr5qCFow3ZSrSpG2r9ZKSQKzaYjKieSxbc5Z6S/gQQt?=
 =?us-ascii?Q?6azBkXTpBDjiqG/9RWB+TdHfZQyji4QA2IlQ3wThVTTQDdL37abOpndhZRsG?=
 =?us-ascii?Q?09/bXefLYnqp4rcLmrcib8g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb63c08-d3b3-4ec4-5064-08dafab47feb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:57.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jCH329ascgjOP0zY+7kg9tg6Y0oQuThH7EZWn0VW0L8ibuL3q6SoxqfhGK+/NMho5PdQc2Zj18FjwUxQsMBHIGabZbRnSvpyn+gQsCMDp7jfepn8lmXNwRnXUV1MGUs
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
 sound/soc/soc-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 29a75fdf90e0..e01b87ea04d4 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -267,6 +267,11 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 			     int slots, int slot_width)
 {
 	int ret = -ENOTSUPP;
+	int stream;
+	unsigned int tdm_mask[] = {
+		tx_mask,
+		rx_mask,
+	};
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->xlate_tdm_slot_mask)
@@ -275,8 +280,8 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	else
 		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
 
-	dai->tx_mask = tx_mask;
-	dai->rx_mask = rx_mask;
+	for_each_pcm_streams(stream)
+		snd_soc_dai_tdm_mask_set(dai, stream, tdm_mask[stream]);
 
 	if (dai->driver->ops &&
 	    dai->driver->ops->set_tdm_slot)
-- 
2.25.1

