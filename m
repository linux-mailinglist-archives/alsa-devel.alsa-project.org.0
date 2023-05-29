Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C6714183
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:07:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA49D82C;
	Mon, 29 May 2023 03:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA49D82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322424;
	bh=/gGvoWNPIXjOCug9Dlvk31kLtLZT+m9PcFiEzCiHFes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TWCfPCvTk0J2d5f4FVZdHXgrda4EtRaVlkhKKyvT24ABlZF4wfKJddrEjsU1bLey6
	 fElCo/IzLGHLcuRZw7/OZTwIsbnNkucVDZixpIGykMu5rsTQqgJXsDTeESlPzobwC9
	 yUV4zg9hz4sW1mAfLjrWjFbdVLYeJMJqwlPSfZjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0EA5F805A9; Mon, 29 May 2023 03:05:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D08CF80086;
	Mon, 29 May 2023 03:05:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6973F80589; Mon, 29 May 2023 03:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D856AF8057C
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D856AF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jFziqqU8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvCFbzvvfyyJc0T+oBemvvXJxpVoLykm3Beq0pwx7BZB1pmh1igk1synfGjBf3h1S5OU0IKuaPes9znQgdhvugnFsQcBZcHu8eBmISWepSYzGzvB3KHx9Bolnw7yInXC6i/Pay67YYr5SSpnfGeQK2r3lX1SFDhgHjpdZFXVPnDdiNbHZTChk5j7E0ARr67bkBkVZIDGebIZvkHxSanEWUIEyMvUOt2ZXJSlxPOGN2ZOARe/auzDAk4RbsYYWiZQSP81smUVNKS/W3UKnnO/7aP/RRpDYmrkfOtxlktghDJ6dn0vLzoN+UudwRDgdsi6e+HhNVqlfkTG1HoG8YGesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKh20u7Mb5lE9ujkhgksEQ9tTPv+/CEs1v2IJf2fFM8=;
 b=DzEHQSi0kvVDSDhcUY0cwhsVGYfNyZgQ6Kx4WcijMBBo7ML8zR2XLnSRShB6ftQdqJwKG+dR/yjcBU4qJXkJ2ctraYcCTYd2OkGhOd915a7dOCB4VWsNIelpW44ypSRItFjsv7qrbTKNgfa8yN7USw5cDgLz1q7cZgGVKzZGc3OREWzCMXtTobyJziFq02ZeAnS+KR5TtbomP1GGp0SQpHTN+PYj0sFrJBrwKEshXcrl9O+tYlmWOvcQmGCrr3SDPgsrWwCYjEITsxvu0yt8NDE1LHPowD1nSDFCQq/UpzdNfguLB2U5nY++WKeK59XladQIbTeS+ZpX7LVJSctu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKh20u7Mb5lE9ujkhgksEQ9tTPv+/CEs1v2IJf2fFM8=;
 b=jFziqqU8EFe1R/6HvKrWfWFHIPwkoZJgnHtbGLOYEHmXADZs2lJpb5p3Eoxki+SRFCWb/xlpgz1D9b5960FOH6+70pXxruAiQPWEGwtP4cZCasx/k9CCueL3leeepassUH4kTbC1GFqrVQNFQUZAw7Kglv1vUgbWolVo+Qdf3A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:04:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:04:35 +0000
Message-ID: <878rd8lzh8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/21] ASoC: sof: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:04:35 +0000
X-ClientProxiedBy: TY2PR0101CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b2cc22-1f4b-4154-5dda-08db5fe0ab94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P0ZL9qPhwpNh26Tm9F5ilC/E0sdGCIObFeTRxcp3uzhucwJWBM49ppf++UKTLX3gZwt3MQ8l0BhHEiG3q0Fa+C5RY2B82h3tX69ENm3TyJ0Jqxg9RTDhX5UenQ89mJLp/U4eiEWp5V9TONMkp5wpuPOa0TNharZJYzisQSl9yDeV+lvdCTfrlLYbqhCRWayooV32E2mYHBFuFsvl+SNjK7UsQF2G0AXc68zAeH+yAfK6N72fxMeETqllIgBaffn9/XhQiUbr9Zn5O1tJGUz/JOMHfMudQgy4BaN9uhTfTbysNwgMbSqO0VKFWyK5BV1bXzAaCfFmWpCe3E4BX/qYFte/ivOgX1jmFJATZH0Rk6eXP5M4sSwkDqFHQc0GaEw1xGjYlzFgu0DF1kR9gnO5j3c/Zg6BPtRsQ3nMEqRE3VkGHXeZB98YuPjDYBvDe0L47W3+rOkhgn2jIf+FWHJd+fE7vTdqmQsgBeV4lNtvEM729l/mR4YCOR4Dbh1q5662WYoIPoPeBZLh0BZ+23Arpk212BMT5wyMGhsAhoCcnJ6Q5SrhnYN2zrsEHsr+K+Gren7YMPaCkbMmrN+ml7ex3x4d3JZTSGDDojx74sJA/BxlNJTyzHVNIvK/KLxKc/Tq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(4744005)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(7416002)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fvqs+Mm5OD0YESxPQrLzvSPjoNrT3udZ01vMh+9kIi3vOZpw0w34fP3P6LXP?=
 =?us-ascii?Q?asUKMW1cE9D55AyPhP3w2XDPtxDE5VyEsPZAcJDsmf0GHAEfMPc7iZ2lDEJ0?=
 =?us-ascii?Q?HbqPsHYGVIjt5p9nMZf+BX0cjYHvJ34m0AMVdot4ku82n9ud3aoI3LNZXM+W?=
 =?us-ascii?Q?uCUnu5Gi+veVkdnImIwz7NCFdCnnhFKySvymP/Bkn0KNhF7KkwskcJ80YBVx?=
 =?us-ascii?Q?+1V1nV5D7HD8700tv8c0Mhto8+nRaTfUbp3Aa6cXQioQ32SsOZT3utdWC2x3?=
 =?us-ascii?Q?BPy73oEl2HGR8o0BscpYda5jBjklBwbMrxWCIH5P3vhxojBJtJh7IammNO0a?=
 =?us-ascii?Q?x0wT2cOdb0MBLFxliLoDgZLgc1FzUqofhhg44pRSAR4Dvx03i2d/h+ClDYqQ?=
 =?us-ascii?Q?8l2hIZa9MVqyQTILE66NCXvw6bocnuAP3+R2w4MJrOw3XU8bulMRi/a2QKAq?=
 =?us-ascii?Q?q3hoaehyCR60O95qIyNYpbcuVXRfzICwbh0fvDZxIfdftlnQ9SWf0Kb9LkEz?=
 =?us-ascii?Q?VG03qNOzkbJcMFvF1GWHqrHpPr3dsJ2WknmIz2PjPTjBllv0R2yHoK6bFAYd?=
 =?us-ascii?Q?oVMTeC+8Dh2HunhfU6R7h6ZUSBsUNQM7lwUAqehMuGjjzJ5YygLtrDqo+bHW?=
 =?us-ascii?Q?+dL3DqgUOzClX8XHBblLEdklzPAJgbz0Jkr7anJsocmugPphoOXoMxtL8RFe?=
 =?us-ascii?Q?nG549KBPDmh/MpE/NtYcJNpKiMAZ0v1kZ7xmhvFc4ja8EZ35DXNiXE6MM5d6?=
 =?us-ascii?Q?2InR075vCVvCYHCNihnrjB7I1fSO+JycbEdixF9Dnpp28+2CNdXcfLYS69Tf?=
 =?us-ascii?Q?ZVxSfdpjDj/kShqPwij3/mXtSAOIsaLaoQREhIFTtZD8dZY/3Tf/5GaimNT4?=
 =?us-ascii?Q?fMdqiPvj9GNkHbUGS/uQAujkGdLA5y45dYZRT1pMiFb4jcTIyJupM1RRYXE5?=
 =?us-ascii?Q?gxg96+YDuyizQX37ZP9VIj/kIjJRlog0hTx4Ph/dK4zh1BHOhipb0oU9aNrI?=
 =?us-ascii?Q?gkIE8xzw9fYaZs3yMCZHsAhu4F//iTUA5DQg/Wv6dBJglUgfHXtVM9N4vjnT?=
 =?us-ascii?Q?/UGfqBsI00Q9sgJAQb8mMkDRSLY8gaQiAlBYnlrV/ZGsiW0N+a/+FpI1PtQF?=
 =?us-ascii?Q?j+fWyxBKXRDMBgH0bxwOysjuTmwksD37pXtBVtlWa3xZKVDYkfdaANDrW/qZ?=
 =?us-ascii?Q?3ZmkiCXO+wPqW/DnF1yPLn6AXvyGhAn5Ozkh+k1ugKGYbRADsUGVLI/s/KEr?=
 =?us-ascii?Q?YzPR/Sy5qhierqX8AQGXZiJ4lbaN29PDbfT3zR7EuODsF/RuOX7dhI86nBtM?=
 =?us-ascii?Q?SAfVIWI4/FBikuz2oDJVjUXqNQWYLH/YmJ+QugjxLMAs1GW7HKXsxn+0doeM?=
 =?us-ascii?Q?0DZ+y8mH6vXeUCa2OJhPdJXiHsAjXdYzaOFMBm78y2/E4axCYN11ZgylMTsR?=
 =?us-ascii?Q?lnkjA48pIkgmoGhIjU+i9K19YIeHQuZ7vtFjCZy/vhX6ra3qdC1f8BLcx2RY?=
 =?us-ascii?Q?2H0sb8KISfsCPYNDB8w+PmVvOmNCKP1/3SfxsgDtg7ufmeL/L4MyJ0ixPuOA?=
 =?us-ascii?Q?O492S9CtyRqh5Dd+jeVOnSSIfz7/mGwX9NZPjO3Y8NgmxNoisW/oQsaqFD8V?=
 =?us-ascii?Q?Z8MEfsyZRaeAFqsQAXNcT3k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32b2cc22-1f4b-4154-5dda-08db5fe0ab94
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:04:35.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JJkNo4Cgoph3fLapYtMmTkkMQKd4o6DWtNQbEmfcl5X4D82kua9N27TkxcgH4WAVpPE9hQEhKkSkSYmWb4f7HK4UezjAf7KfHn23CsBYCD1y7Pt5kZc9IRpY8l2Fujck
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: FWNPBAOWNOGYGJWF75OPV2EM7KLCWBZC
X-Message-ID-Hash: FWNPBAOWNOGYGJWF75OPV2EM7KLCWBZC
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWNPBAOWNOGYGJWF75OPV2EM7KLCWBZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 7c5bb9badb6c..51a51a26a74f 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.25.1

