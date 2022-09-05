Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995245ADBD7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 01:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394E11607;
	Tue,  6 Sep 2022 01:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394E11607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662419968;
	bh=htIAbLydJv6OOca/NJUypSHPkStF0b65Undmoej1ZZs=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKEv4XJAZBmilQRzfgqGv5p/5fvvhIxQxbSz2FUGCKRuTqXvQnEMviBd2lDZmcBGw
	 l6oiALNcmU5BivCds6gZBW/4WAOdDbIIpyi7xYSKq1xdcbh+wLV/nYZJGK9XQI9+/k
	 7OM4wHP+67iJM3pv8JgDgfVhOr6/m9HwthGOJwKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC893F80536;
	Tue,  6 Sep 2022 01:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9548F8053C; Tue,  6 Sep 2022 01:18:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2097.outbound.protection.outlook.com [40.107.113.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE5EDF80536
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 01:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5EDF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="U4Ec/dEP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxVHWnHdM6Q+RQvK29tv9OqwTE7jYIjFnaaqel9NIbQ6i1p0+lD78oCJJRV9iKptA1nxJ90OkJk8zOwRSu7XUkdxeK+624dZ7waK2b6ObBgkZtrAGS4OMr/3qeVzuPmTpiFlowK5X3JYfKbANuf1WS2ZACOnBo6q74lsrYEz8d+fy0DZD8xLTcL1AAOmYjHA7KHxH3wWA661e/9FTSkzweRLWUOxLTe6wpMQBGpB/LHAog+7Owipmim5Vbjx4rFlfIY4lyDGSVGocmSVHfb3yp16Gcto4qr3qX8pIquv7l6kTCibjLza7wX8bXy5bmxZYZU7u3U/N5Am1joLCMnBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iASYS0wxgz7KMQ44Xv7z0gXs5PGpxqaGhnwQaWEWsY=;
 b=j2PfojqnYBLnPq9KBxjG07Bc7bmk4lMgt0awsHfbqiwuzeVFiL3N3mvGlIgi2KoIeQoHu2MPrRq26Jc7+Gi9N+MjKrSZe2T4ybywl/ujPtVMGLGc1iSOy0C3I85eV8Yq93O15z96POyLs1pZXFOSZIVmFtYU6xpHzLzDzBCgm/kSsU5bWXI9gQ2AWgUKunmdTymIHga/moVOACc8CngQFVGuq28uhH5OzJVCwR6qy8KFIJlkwg9ShpvfyKuvQlpLrCWfBsB3G5OZBHwgG2c44/e3+Oaf5ykRbh+Vs7U6cJ2YeBYx+mRAIkSCbYp2n4jL/14DHZ+Dlp6j7ECgZrXyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iASYS0wxgz7KMQ44Xv7z0gXs5PGpxqaGhnwQaWEWsY=;
 b=U4Ec/dEPuqgn7rLwjnspJmjLRh5qOpnkXAqDZhUSDapbw4mYrge4s2Ka08XDHunrHoMB+tSM6sP6Dkcq4WibHMb+7c2Vy2VRrxDnzmORbBi6rHow2qBYt4i4IJjk1bD+8IEIU+nRIszSb5EKyQAqbXR+WGYAO5jx9CU6e8A7b6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8191.jpnprd01.prod.outlook.com (2603:1096:400:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 23:17:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 23:17:51 +0000
Message-ID: <87y1ux8l7l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Sep 2022 23:17:50 +0000
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e93185e-f6cb-4ba3-2e7e-08da8f94da75
X-MS-TrafficTypeDiagnostic: TYCPR01MB8191:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnoBHGMSu5f3SV7Ws7TiuL2Ex3GAEAG02o9oqckn3Lj6JcwHHF0UMgFZrGEUTgdizmPd5dIIE86Zg2FUriAdqq3RX6t6gG7tsDYk5iTIRP64e9qawILI1x7krzcx0HUVGVRJ+aj+/Yzz+XgVsweHCS4BJuDq+6ynOakmnf88TGCLgGJ75AB4QnGF5O2cyAWPGfeqWoOhYstZt0NFvYqACPsZVrjDmYijpZgS1Xh6p7OE7a9wlzo/pRfvXXN12gqlSz6Hyx4BHauYPrJnee98VenCTK76mJNctnTp9rTkYGL3OsrfhgTJO6c6IllP8Q98lU7M965KLpFUidmNHhlYpxt37J6j7kE1Qgh825G06NetxIQRfw6rUGSLzgE3yGhkj/xe69d2FxFjqd+apRYlMOMmgcrtWwophtTriPRNDF0XvAiRj6iROt6FPNUloY+8YfSy1epcKK3PYSuHQb2wEgR0vBBFar3SQXyaEGNpQw5i0+hqp6tbeCZFG49/iOkQVZd01X6K4WwX8PgXMb9wrGcioib2N7+P6Fo/p49s8rMxj6DHGptFZHqbqspASzfD0A/lu0JFUoxn+VBzW1OAysjRb6Zk7IoXE3wRvv9nFOGmEzXj8AW/ql7W87oG9PZ82eR+GK54J0MZPex5PuRNdvz/Ng7DPtgH6P1og0FOO4v6Re/hwCJ5oIKARxZ7d7MgcXNcQJGQW3/CqeVgRYR7twBc3G9PUzP/BCCD6q3ifWse6yiu6zlXxN6hAFvJRUhBvIMdjV2e3axwtvKUk6f9OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(8936002)(83380400001)(8676002)(66476007)(66556008)(66946007)(4326008)(6506007)(52116002)(26005)(6512007)(41300700001)(2616005)(186003)(86362001)(38100700002)(6916009)(316002)(2906002)(478600001)(6486002)(38350700002)(36756003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?APec+N5kI1mipoy5Ob5tgXvx/d92gDGJZzamgUdWiDnQrJwnMEv6pMdpbpPq?=
 =?us-ascii?Q?kAD5bmhR8ofr+HVk/WZJe2BVT2WaHy15CkEfKNQbulQwzI09pydlVE6XqaKo?=
 =?us-ascii?Q?nTigreza65KL5LE7UbgMjLxWWPu4jcUKMlTA3T3k6mpdoaZz9du703yNgOrp?=
 =?us-ascii?Q?UyqKRL51P4I4dKUFUEB57OefBVA3P4VBheW6ZJ+zqABK9LHephIqcwL3Ml2+?=
 =?us-ascii?Q?cH9h88q2HY2qr6p8uOuAEysJ1guBaVCRoaeVbzzswn7GQVQeIo64dnYdD5JA?=
 =?us-ascii?Q?Ti8d6gdHemdt/ltEa6LOtWQy/UVt2ZG10Xbh7F8CHi236asu8EWdRmS4VbvW?=
 =?us-ascii?Q?k7hoZP+ShCpUq4ltiDRbaln6uTFnhuGs/QNKlqWLWsT3xLrJzypYCNgrZBKk?=
 =?us-ascii?Q?uf1JIJ3V2AaKhgiw787+N4qWRHNKXsZ5/hgNjJqY2AW5PClswgTbge8HN4hi?=
 =?us-ascii?Q?sHp00L6cS76WIYHItRmzJTY7xn4Qg+cDL0vWVj6ODxOxvae9QhZy1txr/TZN?=
 =?us-ascii?Q?3yjEpkzDt0sCRlOcLz50DRYjlyJrm2m9uwleOL2OQRrxQ5/yYZLoxjcVk2aI?=
 =?us-ascii?Q?GemxTPKzoGEXqmoT8qHcjDO2GQHTbgtXAfylvMAKpzs8foHRpxk7LqBiL5+z?=
 =?us-ascii?Q?MyzrT6VWQ90LHeHa3zQ7/nUs1/90/WrvIK6WdiyfGtkbfVQq7eGp1WS202nl?=
 =?us-ascii?Q?InnvJ49DR6jyrKmZLI6+Lr2WIiVci/bxGkUlaXTa+rFSJrxhQuK2fVEA8GOI?=
 =?us-ascii?Q?ExaB7ZrdslxW4s3BMk+uqrPAJs3GEBGZCqtGzuFH7H6oMa3RrA2HXWhjTKO1?=
 =?us-ascii?Q?N/HEJpRjxekDcIcoriebAKTgk9Nb+9AXVenKjy4GevoPlsVCHfygeDjnKc/0?=
 =?us-ascii?Q?IG8yN5yr6lNrmXsZtG1nhnpXDrPuZVrZe06AjAFNJB8LFPkt2dO18JLE4rFd?=
 =?us-ascii?Q?SBX0c4Maw4Jwai9OeKDEOeKBMD5pOZOMI3Q/gLR5hAju55nWCbbZVnnLiCCz?=
 =?us-ascii?Q?hDODsxtRFIcU23KiNIntAc0XQS8S3EAOEgQu6jIGrU+x0Ifk6Yu1f2SWXAr1?=
 =?us-ascii?Q?toMFc69HUtHYcHFUHBUmGCtuFB2cKNPpG+BamttQuoBoDPVvxJbuTaoKKpMY?=
 =?us-ascii?Q?5SaWsyf+VDW1W/H/YFgWskHDCToDeWAGsmU8r5GYFnvIQX+K+T7ru32WcJvp?=
 =?us-ascii?Q?v3WcKH38xoolurwE2Fxq3nBMj7H1v9g4ImNelIt5qO6v9V8E4Wi2clhC5IjM?=
 =?us-ascii?Q?Zt3O4TJHh9H9R5nYHK2eXJ1jvYc2FFT5CAsERMm6t3+ZwRkSrbMOxf+TQS/m?=
 =?us-ascii?Q?aKxib58y512+6r5/84GN1siFTUsPmY/+i6JpdynNtBqiiimBkLcI8KMSeLKk?=
 =?us-ascii?Q?8zKm7eg7Wa9ahRTSqnYPvwwnXAsaABoFLeahKVOTWanjwnIf8LolkrJ1nabT?=
 =?us-ascii?Q?F4LmUflaArYUnxR6oKWyUMJjFNKPvjtAnMys5FzfB0whIorXgveLa2qZI6zQ?=
 =?us-ascii?Q?PUm6eA69HWgGUZUwiwH7+K7wBQKk0dcF6mXumhQBB+kYQarSd9kkNBwHOdrv?=
 =?us-ascii?Q?E+EeLqR0tpHT8xU++sJEOCEQe9q33SSuQtL9KiHWMnHv8TKpbYySqbnJSShp?=
 =?us-ascii?Q?w/uSbhmOV43ewIIQd6R7JRE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e93185e-f6cb-4ba3-2e7e-08da8f94da75
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 23:17:51.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcegMM6EosOtlHnRPVHl4Set04kYeNo8me50Mmc12zEhW5yUswsi6EORVqXcEB9HUzelR0hAvIbStfz9/S7UI9FSfYiEjmq28GPKcHsNz+D/q3gHdVkhEHVhpOj+ZVN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8191
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

snd_soc_dai_link_event_pre_pmu() is using if/else for config->formats
check, but "else" case is for just error.
Unnecessary if/else is not good for readable code. this patch checks
if config->formats was zero and call "goto out" in such case.

[not readable]
	if (config->formats) {
(A)		fmt = ...
	} else {
		...
(B)		goto err;
	}

[readable]
	if (!config->formats) {
		...
(B)		goto err;
	}

(A)	fmt = ...

Moreover, we don't need to indicate config->formats value in error message,
because it is zero.

=>	if (config->formats) {
		...
	} else {
		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
=>			 config->formats);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index bc7d64b570b4..e8c813586b53 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3890,16 +3890,14 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	}
 
 	/* Be a little careful as we don't want to overflow the mask array */
-	if (config->formats) {
-		fmt = ffs(config->formats) - 1;
-	} else {
-		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
-			 config->formats);
-
+	if (!config->formats) {
+		dev_warn(w->dapm->dev, "ASoC: Invalid format was specified\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
+	fmt = ffs(config->formats) - 1;
+
 	snd_mask_set(hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 	hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE)->min	= config->rate_min;
 	hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE)->max	= config->rate_max;
-- 
2.25.1

