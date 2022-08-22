Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC0859B7BC
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 04:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 265B41674;
	Mon, 22 Aug 2022 04:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 265B41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661135807;
	bh=1VebgbfX/7x3LtOYLRPQ6Wfs1NkxYvFsHOK36ycc/OQ=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NA/YTunp/5VZ16p0G0uJFq1wFfs1dHVCEI+RJ+PxjUXVsDgwAHENbErXwJqFdZhEX
	 R6wSzd8KKZwa6LHU8O62Yl3djXMlj1g/waIfby8yBbacAqj2Lg7Tq7o0Y28wK8AHlx
	 BQEOIWBKSNH213JtPmK5WfbS1h/nO4r4UIJodgpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C456F8026D;
	Mon, 22 Aug 2022 04:35:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4698CF8026A; Mon, 22 Aug 2022 04:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38244F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 04:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38244F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="E+8wkDnk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FStCnCREGNp6PNLVf0PJGeCHtwDVkbaI+5Bpro43y1JvXrctl1g1JPVuA1pxsLWiSuEpNqyh8Ltyn2C0Amm5PxbsdbuckI1OAb+2DiUiVFRmcYfN8q7S+d0PPYEYVXuae0mJ79Tg9WnPkKOVVJmKh+YN91oPaLwzgOjNamtX5TB0MlnRIxqMNZYXW0hLkFH40ZJr9iZGUsVEFZWP94oS3wCEx9HTdpVhtZr/oQuvHDSSZFnAIacTKkap0A4Im/W7NMwnqMQC7tdQvkvfPr+fUxu53l5o5KeT0x7M4GiUDsYryC3wHtb91AZHJaPYBkUqJDZeMxTc4Gl8F7Zk+4yNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmmttlKlU0npkg486P/hW9ytuQ0xjAiyxgGcmfM2KrU=;
 b=h60LkimJEbfN1N3j+WUNEFoK48vze/L9K7HDPX369rnOJmyC/e8rDrqaVGLZZT/cXy7+zj3yvU3WFHpKqBt9gFKHjLGeJof0Zk7t3iggegJ35+dlw9sGMVdgsPu6oLsaF/cKcLZ1D/FRJ5LUwOpAfMt5IzQ9uHubWw+4sGb2LBfvizjsoBoswaPNuVkUsb4I7JmQY0skVUBufZLYbiEcp5LoPiveO5NWBvlhwzkolgBQUn9BzA+O1+sUjQ+AtNFhTIMgBvItoQcKJRk0y5oOOXNFBwq+JG8k7Aaopw+FnJGnDQFWAeS2kO10daTXs59Y4Kk+mLM6R95oyiGGyZAwdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmmttlKlU0npkg486P/hW9ytuQ0xjAiyxgGcmfM2KrU=;
 b=E+8wkDnkmuqwpnVQ3j7cF/YnEonZZQo5hBpHSx5ZX3eBhbsb3qbC+I8IZWd4gy7na1sevs/c8EPWDbGq1Y1lKqUYAzDqcd6aw/C8KBNQi4Kupt95nnGi9abt0LcbQ0sCQJ2RXrCt9tg2wQXN/3o1Eg0rILHnA1PoWFsryM2T4Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7890.jpnprd01.prod.outlook.com (2603:1096:604:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 02:35:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::cf2:7a63:ffc5:5cfb%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 02:35:32 +0000
Message-ID: <87czctgg3w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm.c: call __soc_pcm_close() in soc_pcm_close()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Aug 2022 02:35:32 +0000
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f3abc40-0646-4592-f382-08da83e6fc39
X-MS-TrafficTypeDiagnostic: OSZPR01MB7890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QS9wVCYYn0KmA1MnPVFn0mrbvlgS8e6MwvlfFuXWOukE/St9sCzrAXBGceMSOwfs7WGJzEX+jHCkWfCKVzDC9KekfF7K0E3NkGV5XCE16tALmZBUBDk21qjRJK888ettL2NtwAl1mj9CSDXFjtcsS8C+EIwFo3JOl+4Vr+Iz2h5GxmE7pt6XIxKi1cWXuf/JxzaxD/o7J2Ia/Phg2XeDg8huVJOd8QtVBTBrofux1W/rLA7hb/abJTune+iX0w2MKf2ewfh8Lg8afhmUVjqN39QOMpZ1zFtYjTd9iFDW4gFwYQH8hY6jQ7PBn3ZwLtNSBXSIYPZQFL63aLTu0Ob1QLyOkddGaWUQITu+v3FI3zwUlXJ65rsllY3EzYTLBjGIEiIsZ8NJm6sRAoJHCc6j/MMdABlJz5oKnF32HTBkmT1xtF3h5AV6McJ0E8OIpFyZgMJPczmwBiARvV5iDYD8JaJE1iYBcFBzgLH8kmWzUPGMiy/mm37ib7vItnjfHJvAy60C/r8X9jAB7LFzTI8r/XaZ8++dbH9vxvTI9tNzgA5QMJSVsd65ifZfPQHr8+dybSJ/+eueMb0E5bEqZHG039oWPYP5hDnysQiQzRDujZyLC2YkJk87LC5Q4rZOZVwGDS/kZL9ZF5f7Tct/nd6DMn7cLykBwQCTgGPwHw9MT3vNjJIM8hj6K6lj/MrrszIuNRKRd3MA58uFuI5gXm1t7CupqBYxkmNvEtv48F0dXvd8Thm5n4ri1mKatnUC6scFKAsvvfKDQr+pD+9D0FAiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(38100700002)(38350700002)(2906002)(8936002)(478600001)(6486002)(66556008)(66476007)(4326008)(8676002)(66946007)(54906003)(6916009)(316002)(2616005)(186003)(83380400001)(41300700001)(5660300002)(6512007)(6506007)(26005)(52116002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DXW9Vgtfjv5z8LcZOtuW5A8dQsYNiBqyxNg9QMboQfEZE8HR7a8xRzOtEtRF?=
 =?us-ascii?Q?PQnMjaDM+njWLCrEGqnrqusld+QZMh5fd1su/8P+fp+5E3C6Sa/UIuEV2dBI?=
 =?us-ascii?Q?ce2Y772ktgYRXmYoMoFm9TndI++ZbQ0/yX8RmEKFLq0TPsFreM1xZVOAsvDH?=
 =?us-ascii?Q?Q957MP7n6AluTru9CWZkJPt5O/UCXKJIyKV+5EVW5k3tlzwRf7uPbeoNAT90?=
 =?us-ascii?Q?cFvBzcAb3dFePjik5STqefSC93SGb1kavlJDgIpHO47+drpq4i2wodSpDsPJ?=
 =?us-ascii?Q?5aC4B8MkMhCaRJITcp2GuWPT7mn3c37EJX2vPm7v/QGQcCKxIuAzKAWfFyEa?=
 =?us-ascii?Q?HQ9TS0/zSs3u5C+42TsMf0vj8erKXgH/40BFB2t1GHmKc+fR92UUOBam3lRN?=
 =?us-ascii?Q?iZuyFZ6Glz/C4SvWe/FFcEY+ECDzVK6DvPFHQmCdPIp2j91rNvCAYyzXHnpE?=
 =?us-ascii?Q?RbB4ZuP/nZz8NJX2SUb6mFQE6Nq4kcaW6o+4TPPwutk687ctzRTrqW3fKxz7?=
 =?us-ascii?Q?y3TlxUWrf5JPVEmd1uR7b/4s7LqhXXMyDlAzBpi2LSPE+8Fmb8rR85y7Otdp?=
 =?us-ascii?Q?w2pIU59XwklrT7kv8R5Fvk4S+2SkNP2udPBoBHgfIL4Erhq9oCihhXxyOszt?=
 =?us-ascii?Q?MEnYi+GPP30r4HpvBhkskbkGCUBtEoD6gc/kqPxvJlOmyfTcwFyH8/Fji9es?=
 =?us-ascii?Q?Bsk/prWO0UarxiisB//auCWGk8Wn+97533Cvx8AzI498Qvor/BFh2vpgiRbc?=
 =?us-ascii?Q?tyIsJM1kOqFqw50kUNpcvKPHGBfvqx3R0UBbBPfqPh2hmaGJjSvlJT+XdRIL?=
 =?us-ascii?Q?vu/yhzQM+i1iedAw873Ti84vihS4eWSodboeHaYQkz2Xr4NOF+9lOwzKt/0T?=
 =?us-ascii?Q?6Eqx7eMteUMi+YSMPkAX5DtHKfnPx7eaUZVtPC+9bITd+1JaMhvZVNBxQMm6?=
 =?us-ascii?Q?t0OMMgVOG06Xb8ay+qmkt5chUbKDQkX4pmzXScXnzditLjRwtp7Qyw+3DiRe?=
 =?us-ascii?Q?NSxgguDxYdnEVq0JxVZfYNhGl4lk8N+R9vpsgCkC3GlAYOBSkw3OV2jxo89X?=
 =?us-ascii?Q?tl6ojoOvtZgUKPi4b9mK/qyK1tw3xhzlMtyxxyZBjJkZJtWqnfG2G57p54vu?=
 =?us-ascii?Q?usCP5di0uW10dPqor+/9g5wKRWYIgIWO7FWfTn2RVKKhfsJZaUIs0i29tArW?=
 =?us-ascii?Q?crLfxqlTJiYnPdvFlxmltQtmntLGqtp4/Ho+5hRrn7YGiOJX+t0rOvS8/XiM?=
 =?us-ascii?Q?824dFBl5cUXwuAhNX4Hr57JSRpUWsp6W3tDwT/0EJHO4HchpP9VlAZSQQHbC?=
 =?us-ascii?Q?vgCLbmxYDAG/kAFwgFbLm/S4E+batCIWX+ReYCyIL4ZJIc322wiKjnNR/V2P?=
 =?us-ascii?Q?BYENnRGPXqGYphCH9h0RVRO+d87tTfs+3nTd/So8dd25cMF6/iItF5tF1yQn?=
 =?us-ascii?Q?kGdvt4uR9ysHOi6VHPdqHru0ljkGqLfqtA9Ht4oArzQAaBO7KaDrB1F7f3Sc?=
 =?us-ascii?Q?hXk0kUxiqkWbp9H+vDsNhqg3nxq4LKSs5UDS6geSV4MYdBTDCz5uMixD7LuI?=
 =?us-ascii?Q?KLHdLfW2+bfRHUPEjTwTpQBQVRoubPqvFQRo9QdloL+niusvRoK4IISVBFIX?=
 =?us-ascii?Q?m5s0vtwnqKcz7TP43XwoLLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3abc40-0646-4592-f382-08da83e6fc39
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 02:35:32.4500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A0R47eGU8CnxjsdhlGfrlJuXc9cyDl/9myE9qpW8zR34/N7YDBSXjUEGttgMhjliRmQkaJAP+JO8g5QUls8Wg/GulbcOH8P/DRnQBx5fnzu7Kb/UAJS+6vzIbJ8cGoT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7890
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>
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

commit b7898396f4bbe16 ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
added __soc_pcm_close() for non-lock version of soc_pcm_close().
But soc_pcm_close() is not using it. It is no problem, but confusable.

	static int __soc_pcm_close(...)
	{
=>		return soc_pcm_clean(rtd, substream, 0);
	}

	static int soc_pcm_close(...)
	{
		...
		snd_soc_dpcm_mutex_lock(rtd);
=>		soc_pcm_clean(rtd, substream, 0);
		snd_soc_dpcm_mutex_unlock(rtd);
		return 0;
	}

This patch use it.

Fixes: b7898396f4bbe16 ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5b99bf2dbd08..3ca073edf7e7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -723,7 +723,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 
 	snd_soc_dpcm_mutex_lock(rtd);
-	soc_pcm_clean(rtd, substream, 0);
+	__soc_pcm_close(rtd, substream);
 	snd_soc_dpcm_mutex_unlock(rtd);
 	return 0;
 }
-- 
2.25.1

