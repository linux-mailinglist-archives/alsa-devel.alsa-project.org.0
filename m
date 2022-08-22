Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6259C55C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 19:51:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E05D6AE8;
	Mon, 22 Aug 2022 19:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E05D6AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661190661;
	bh=uBrd1IW/FAEjMhpwp6bn2tFpWAIAjWFG7zVKD6CHBqk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lDkbpygSkvNdhCe+l1N6nk6JPgminnkVFiil/TSO/trWkWxYgKQ+VtLFgzQIb+nVN
	 pczC1m2bFbFehJDTRVyWvmn8GIHnpK8cuaXJYhaD9SKly0iwpYhW9vvTb5nVXn3kNm
	 MSrySCYwBwLeWfKAfxN76PB2xqKgDbcqfbUATfS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C5FCF800A7;
	Mon, 22 Aug 2022 19:50:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 257EAF8026A; Mon, 22 Aug 2022 19:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17DD0F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 19:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DD0F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="a+WHAWSP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyCkwO968OZGVIOZsvPzLvBFpbtmHbfRZ+86Mxskvn2vJJfzJeIsue5h4nxCsUqLljNCkMZY4yUIjFZd/YL46vL5KnFQY0d8BQeNx0mPja48VafAA0o1W/nxrH7TBa5L40zDeW9lJqmH+mpCcoiavSm8Bw8DWvt0soMIeqT7r3M3kEB0+xCgZSUs9a7zdnkXMyZ4qdgkOaT3ToFgEunwWKWrpEtBEggMQKrsSHCRlkviWEA5QFhlgc1wQ0Kdz09A5MFZcA/cMK5cU4rnS1QTAcstVUE8iA4k/R13FSOx63R7eceblmCcuZYzEgO+9IGjMGVorjqYKJe+pxa2XZ7OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDZwVtNg4dtUMrat6sPZHWUINSdLLFQCxDvh7eJsXSA=;
 b=Rc35tptuMWfKW0q9MBBRChTfqLEfmx4yGGlP/VjVqZuD8LAHMMn3rSsOPuXHEX9gTHKymMLV3h9m85/RRWEe6aqbXTEPCJxMoF1cps6B+K7m1jzZoGGsE8ElD/s5sNLwA7gXreB+rGPNwb3e7krWtjhjXga8y563pzXHrUG3KsGyGVqfMz+ouVdjIf4SK7RVirdQVTrwtdfeSsM+qJJWhPFOIk3wmiJDD2lG7nI7yFXzoz5hlInBiS2YdRX9BBQsj6WBMML3HOISqV0GRmWThQ/XkJyyU6ganqr7ctH0Yp2RS7XQshaNCAkvFh5Jdk7/hXd14EMM5EJfwzNCJ7nSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDZwVtNg4dtUMrat6sPZHWUINSdLLFQCxDvh7eJsXSA=;
 b=a+WHAWSP93UMpgppJZY1cauCceQHNi0l9Q/T0K0ZPnofsmLlSAdgOXLgWbubwvAPsUGlxU/vL4QwCL95ire94M86KS56wM69ZHI6lGK2EY03/Gf+xpdxV4VGf25DyFjAEpZFc7Gt3bwT9pwhi4o3qSvXdOG1wjcq8lmATEK0+dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:344::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 17:49:50 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::68e3:e10a:8232:10e5]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::68e3:e10a:8232:10e5%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 17:49:50 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: compress: Remove dai_posn variable
Date: Mon, 22 Aug 2022 20:49:37 +0300
Message-Id: <20220822174937.254873-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::16) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f75ff19-b2ce-4a54-917e-08da8466b5c6
X-MS-TrafficTypeDiagnostic: AS8PR04MB8449:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCPGRjdQJRLtJlPaC9h4jPzcW6QqGIZRqqWjFhy+MPDkXtBapGr9N5gS44DSX/gj8QyVcRkfCWmIbJiz+Atb02z2Xvwb/yZVPKElAMNX3th02EHwCn14TzGo7Ms4nyEH2R+ShpjFbk3H9jbg2m6cERbCpg32dM5h3i5lz4vspLIJw+yUnWR7d8v8gCwWIYcwEPGuj4ze5dqneawES0olgcbguRBa7gch37GXxWPf/slxRhjaErSt2dNc7n/ugXWmBSyeBkIwvGzIG/Okzo+ZH0uPy6Yux5Jt2XJoOtF/w0jZx7BPabB+YVOo9AJrX7muAoGsRUIwS7jb3KW+acwzttLvT+N60PGoVthXD2gVCQe2pMd4e1V6jK/WxDZenMWm2o9YASZrFiAkjJpkVuyP3cL+3pDXq3y8HRoNecw+YYvjNZbyFKKpdw1mGPpjXazkLr0m+1nuV0LbwgnevLkPPNZF77CSbB3QmZyr1TVWbpIwf/4FVg6wgTrTvQJJTmyCNgDpYZkSPohPV4MJO9N1swbj76dN+nNFEW/X2EDEVKT1DnfUMrsVH4UUgBh4RoodznJ7h3vRGdDzMC1+O9v4Cb8a9q/4pS4ZL8UQZss0kCuvlKNL9d1vlFCBBBtQA7mk2JCLLmox5X3DnMQkZLdcWEHSBuOKEUXqt7Bf8PtjgiHxMynxN6zOsq2v/xacWfhR6UodH1vNLsybWlS+5vJViA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(478600001)(6666004)(52116002)(6506007)(86362001)(83380400001)(6512007)(2616005)(41300700001)(6486002)(1076003)(186003)(66946007)(8676002)(2906002)(66476007)(4326008)(54906003)(316002)(66556008)(5660300002)(44832011)(8936002)(7416002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gVnYwaZgNwsixv30N+rBWBaBigA3rKo0M3NCdoXTTGHyNhAT22Pt2RGaYxE?=
 =?us-ascii?Q?VwyqstHJKi4NRagBR7QMHC6T/t6FnhIvrOzwCpCyNrj6J/8ndVJ0KUcVDjcq?=
 =?us-ascii?Q?jwS8JISbSqvDecB7e2IZAspCnUqtGwEot8fixsS+Oy1BjfGNzABe/SQh3A8R?=
 =?us-ascii?Q?3f5+mK5yHbJrYhZ8lix09f++E5LvUDzbbMJe5rgY80wdukbH9G0hGfLiK7b9?=
 =?us-ascii?Q?TseW0hW79Jawlf56dIrP/5kjaDSw1WorPcMtEvwHCvqFbdRY8g+ZLH10W9dM?=
 =?us-ascii?Q?WEzBnKPqnFmszhEschVYn0EL6EKLZsx6X2sRxMEdFi6+bjxC4HKdgO513GAc?=
 =?us-ascii?Q?fpY3YgvpnyXdY4Knl+m1JfGcUexT84Fdr+XXEaaTRKuUYrkYYuMmZoIw6zQo?=
 =?us-ascii?Q?peTXDJB6/KJ0rkNC17K8bY6o1LhSutvVcb39wicw21JrbSsaG1pQp6uWnVei?=
 =?us-ascii?Q?p5zLewWLYNSeegfmwJJF48pgJ5mZK2WlEXe3WRO7czDhoLv/BAaQrVSKmByl?=
 =?us-ascii?Q?bu7KLEwa0k7mJlZzf+smHcFadDu3+AFa3GnZ3Tje1MaAfs2Pd+IopAL2LAv+?=
 =?us-ascii?Q?+IhQz29+jqksBT6BSTsFhgD75cj4l6bRTAWCwwMACJvgxcbg1XeogIHrpJe+?=
 =?us-ascii?Q?YDCoiCEmjEeWAY7PHW8AcfMTtp+kvoPdh0VMRY5YgM3Q9nhzeskBplQSUxog?=
 =?us-ascii?Q?hltb7gcdIjY4wsgQiNhPh8trWFVygVbeb7f3oWRjH1YEt68Z92+GdS0m6wkI?=
 =?us-ascii?Q?feBw8Fsc7OA0bDtKWqcJhvWRFQ/6qbpTR99PvJiejE4wVSiP/fLHZmdZHAsu?=
 =?us-ascii?Q?s+SZarYrmP+nwgyEsMPhWnbd5wIwbtUarsNFRwvFaoV7CFIdeNSlOrN0pIrZ?=
 =?us-ascii?Q?yw1qUIXdxT4PJU2qGOz0aJqMakPMi/blMBom4YW5eRWxH6UtB4zqdAoPLM2l?=
 =?us-ascii?Q?KSsULooGxNkK2Ts9d6loG8UOUKqOCAxd5oLo9H7R58RU2eMktuHliUaH+xZa?=
 =?us-ascii?Q?joT9rL19T6SqSOfBHIVcd00L9n5Rv7FxJrGGrx7XMRQlI6OC7tjANE4rHmg7?=
 =?us-ascii?Q?mLZ/8H9+TDxt9Wrq37ml3+BDDLVucDXccWw9lW7wNgyF3RLwkrFCBEJAuQUo?=
 =?us-ascii?Q?WMdvAG4LuTbkxXuQI5TsC8rLWFUWql7/V7QteUfuzTnXM5SwRTFvbCR4fYQw?=
 =?us-ascii?Q?69QPaE8nhLCe6l8sqZdY+nbD8h+E9yGSev6FryWsS9IhmxH3XKzOcrNTU1Qd?=
 =?us-ascii?Q?wv0HONqG1ERNY0xrMl+6Ie2x19pzGAuoWH6ynwez3/Km6oOjyZZo/fJkGdSz?=
 =?us-ascii?Q?1WLdF7lyeoO7rqI20uyGTCwiODnM2PGLLoPJvYe5Dv5G2JMbkk8d1/vkj+9t?=
 =?us-ascii?Q?okEQtWwrSeEIL9OH0piKT8RaRU46FOODmQFJ1jCgd+TZc9w2IdngfSBxM9Hw?=
 =?us-ascii?Q?N2TYELeW3xSZTzfSl+zUt8CFSxTHtiYFkKF4SNY8WxQEyEhCLW+2B0hxX4HS?=
 =?us-ascii?Q?925A5PWl4DjVpxtIjca5S2WtyLppHuIhelFu0+JzI8CwIXPx8//zKVqBpchg?=
 =?us-ascii?Q?iULojFEKt5/GxPo8SBXdikAdETJwje7J5IembUygiKsD127wTBdCj4wjnUvm?=
 =?us-ascii?Q?IJfcWf7TYUzEaj25ii+TrU7w+o4jUdWX9DvelfMNJMpyS8QuCSPEfkPLxzIl?=
 =?us-ascii?Q?bXphpw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f75ff19-b2ce-4a54-917e-08da8466b5c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:49:50.0066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2UOLn7VC1eePMbaQj01sKvwcKjR3bKKeus09aNgRA8Yyw6kZUrWYaAyfXvTDVfrPlXZKqdFUbVGFX1QXehtxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449
Cc: Daniel Baluta <daniel.baluta@nxp.com>, pierre-louis.bossart@linux.intel.com,
 kernel test robot <lkp@intel.com>, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
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

dai_posn is set but never used. Initial intention was
to use dai_posn to shorthen one code line but it looks fine
without it too.

Fixes: c1a731c71359 ("ASoC: SOF: compress: Add support for computing timestamps")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/compress.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 174b3d8e67dd..c8ae778a50d1 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -327,7 +327,6 @@ static int sof_compr_pointer(struct snd_soc_component *component,
 			     struct snd_compr_stream *cstream,
 			     struct snd_compr_tstamp *tstamp)
 {
-	u64 dai_posn;
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
@@ -336,8 +335,6 @@ static int sof_compr_pointer(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
-	dai_posn = spcm->stream[cstream->direction].posn.dai_posn;
-
 	tstamp->sampling_rate = sstream->sampling_rate;
 	tstamp->copied_total = sstream->copied_total;
 	tstamp->pcm_io_frames = div_u64(spcm->stream[cstream->direction].posn.dai_posn,
-- 
2.27.0

