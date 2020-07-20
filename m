Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A022586F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195191661;
	Mon, 20 Jul 2020 09:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195191661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595230029;
	bh=VH9h6kujXGzsgGPV0xRJI89npBS0vGy1bvQysHbsZ4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUGeSQREFGpzNYK0I/kgLYQDqsB5gY4shGgUKcK2mYg0FBeg2fSgDe6xo+RamT1xz
	 Q4KaeEkTi7aEB8CZ6rJ7Y5RBLT5FuiY8XUjoW5thS9oyYrX+SSk5PsySTRXNfI0gGR
	 1xzM3nKnZ7UTy/NjT5iTDsl1HDhLCDCHcO+sK54E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4E1F802EA;
	Mon, 20 Jul 2020 09:21:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AF93F802DF; Mon, 20 Jul 2020 09:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC49F801F5
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 09:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC49F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="R/JXEVmQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnGzGZxzfjElFx7FAIZyCITwP8oHVCpmlEWqE3M3O40pgDENMaH6xFx3u74ThVTR9NGAiafr0ABJBXbiRvK4w1Q/4d1VUp//f8xwYcrRorjx1EdV8FjOHeR5f6gcLJtXHHCYG7+VtqMrOWYj3oTAXoHQm+FJwtQh72wBoisyY97PBDrnKWuFB3BTTODKetQkIQAFZ2Z9cSAme2zB4gux1YCgM9lVVPpvXdJUT60vvzgQJeNO6klca9Er1o3BQy+pSVQ9yksNdGxKZOcq11+MdE9d2jbb9f9i/7IFDFFzdDB5A42WVdnnx6OLDj+FA1FqwrLnHE7oowb4uOgk8e+ERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXhWISAtUg/VB3boXVA4OYfWfWB3AQBw12ZzUd7ceyQ=;
 b=IyIiW03IYis7quggAF+ZWYnObzJ1YJko5Mp52TeYPZqxCuDcKCOC71tsLij7als/yzHN/AMnxRlA93GAgM4P9hw4HAOyc6f9atP98IgWnV0WlXOoCWoWlzRduw3d3sVMCACQxtXhDPRxvI+8Je9uiArguQFNNHJP4WuCmwwe+XAPNp4Jysn3L6A+k74BTdnIgucDzOTIWHE5omFQuMBO4fKrOAn/gZY+uXsAYIMDhq+oO9sw2UQgfRAMezpGGg5zzfsihz3prsxlKNyt8bWRd+Aj1puo2iI0L5/MtOTQgcS+HVmCHW2cNVRl1405flPev+r3/+ErnJuXI+Isc+3heQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXhWISAtUg/VB3boXVA4OYfWfWB3AQBw12ZzUd7ceyQ=;
 b=R/JXEVmQoqOD8zYsa6pIb3B725v+hSrNa48tte4u2OGzXKha61qx2ycrsYtzflNCLV46nSYmUFe4Qo2ZBM5WHvIeLcV7lKYKCO8YTwllb++0YMuBfrd48PjMHhl+ofeBSTj6I9iCbiZXTXXbnWG+KiRumnFia9yKhKg3aR6NXQo=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3344.eurprd04.prod.outlook.com
 (2603:10a6:803:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 07:21:36 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 07:21:36 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 7/7] ASoC: SOF: pcm: Update rate/channels for SAI/ESAI DAIs
Date: Mon, 20 Jul 2020 10:20:46 +0300
Message-Id: <20200720072046.8152-8-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
References: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:208:ac::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.14 via Frontend Transport; Mon, 20 Jul 2020 07:21:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7cbad908-1cb7-4401-afaa-08d82c7d893c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3344E1E79570AB2B420C3A1BB87B0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZFHf/cQ1TuLkm9jfm+VziNbPjfzu027+ULSJFucZml27K6dkiHBWS6N2qfTXLpO/I5i1xYhoQ+Dd46zTaBjLdhp5X6xUCv8ZDliO2TDsd+8JUwMIHBV0DmlsdUHnalG9kWNpJNBIa+o73S7Sr7s/DW8rzNcW51OzUmg+4oH2NfQjTrHiUzzadkMBtEd3HDeVk9hjbrJY1l3c93x1kyqospNYp8TfEcv9+lspgglV3uFMfo3De8H3c5lO556vKDGUcSh8V7jE3ZCMkILz0+6KucvUcBXBWh0zrzPH9U0KfSQGTkD9A9qH/IdGkJ/LnI+yHzbSyrvfc2xqEe1KhCoMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(6512007)(66476007)(66946007)(4326008)(66556008)(6666004)(186003)(6486002)(2906002)(52116002)(86362001)(8936002)(44832011)(26005)(1076003)(956004)(478600001)(8676002)(16526019)(6506007)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7amuy1bCSliXJGQSirdtSASELA3plvoWIpIT/9dQ+NSg85IxsSHIkFRyc/AqWgAKWvytfigwUokccGDvSoSdA1wvDaYEE4YwwTPiHFagE47gFS58lQikRq4mI/R8bdvMeCWAAmwUZh7Igtwlr5fQd9HXElIr9GGuwf5U1trYvHYwos1dcsPLNgDL7EwC80QxWJBBCMtKnfWanT6c/qAXyQDG5WZ7OvHPVOLviUnyJBRrQ/Ybdb2HInzTCQ65NZC+IG0Hnd7fuI7cDkcPv1eVeZJXQImBF63BBXZfWZ5Li4231ZibX82+zpfaQeOU01Q9zGkRO38978xCYDWdSijakasm5qvVBrFh+6FoEe41v3UGYVKIaMOPB0lU2K5Us7PlG/+WQI1ltGiXQU6jSMikoPn0s2zejELzMAYJiLQ41BNAihkVQuIpRIuv/5cO5q+4xHKpjqCTHenr9xDGGclmPN8NZPAgk0VH2AdRJRf1N1o=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbad908-1cb7-4401-afaa-08d82c7d893c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 07:21:35.9914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dpjh49I+n8ZvF1+Q/Lde0PActmcbQGCjp91BrQO4z33togpWfw6F3XMiUdLf7p3txKGLgwTKrsnCy9nmIoP6Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
Cc: shengjiu.wang@nxp.com, festevam@gmail.com, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Fixup BE DAI links rate/channels parameters to match any values
from topology.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 22fe9d5e932b..5cfd2611b252 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -718,17 +718,25 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		/* do nothing for ALH dai_link */
 		break;
 	case SOF_DAI_IMX_ESAI:
+		rate->min = dai->dai_config->esai.fsync_rate;
+		rate->max = dai->dai_config->esai.fsync_rate;
 		channels->min = dai->dai_config->esai.tdm_slots;
 		channels->max = dai->dai_config->esai.tdm_slots;
 
+		dev_dbg(component->dev,
+			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
 		dev_dbg(component->dev,
 			"channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_IMX_SAI:
+		rate->min = dai->dai_config->sai.fsync_rate;
+		rate->max = dai->dai_config->sai.fsync_rate;
 		channels->min = dai->dai_config->sai.tdm_slots;
 		channels->max = dai->dai_config->sai.tdm_slots;
 
+		dev_dbg(component->dev,
+			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
 		dev_dbg(component->dev,
 			"channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
-- 
2.17.1

