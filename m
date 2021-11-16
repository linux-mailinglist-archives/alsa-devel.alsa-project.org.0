Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 850EC4535AB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:23:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CAC16AA;
	Tue, 16 Nov 2021 16:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CAC16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637076210;
	bh=GUy+oy4WUkK5YOsjShJK0WkJ6NGMiYBGIv0/zN0CDW8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V+K3AiSpO5QDjhyi54/8f5VPB0tr1wN+cMfmfAwFuI0yLncABN0YjWWxznFETBu3I
	 TzNJaD4YdEwXyIcgzZOMUYtMsjsmnpeQ92UkAOqAxeWRGRkBjKK9uIHhA+2ZIyppa2
	 hCNP3/QXcPzSjGODR3u9LwSHOz1jIvGOAPzoHRqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65DE2F804BC;
	Tue, 16 Nov 2021 16:22:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CD09F804BC; Tue, 16 Nov 2021 16:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5022F80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5022F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ikkr5Bfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffixyIU2uZpl63z3kO9NIRMSBxzJnU2YqMXM7H46WOiE8E6J0DihlnrcROa6ke/x93cr07/r4gfDobpJjuMn9XBu678WDCg2j8eSsHlsmBKX6LuL3dxZjWFJVwOrKz6qcd4/rikmYIclTWdqZ/yVBRpTydmOHFUVQlMrap6luAd/XDszo4+lNRW//T227nPclF67cbNtPhBGJ2AQcib4yWlT3fwkmLK/7ebSy5QgIZmiO2Hvohy6vVKADYUEslVTuNkfpzoT+X00j7sMHhgiRQe9z5I0f6HZXEeJ3uhjC4IJlFqO9l3yNm5AH1tuHDdBOMsNPWfkPFZNReGQb018kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODu0bLQYEOuXiH2fGIBDqIZIppgq8J9XHzZ5JuAWXoM=;
 b=SvbBZOxKICFNo0QIyq9AowN48HHei5G669qJcrF3M5ExBqHWNiMoxlSF2izTlLWUEUyvuFm1ixC3VNkvUbHVkaXheV0IByGgpjpBNPR3DfgWp0Q28iMdzXsQ194AeOjpSp2e3UuJ/Qg1H4+5P9YQvYOSnYhsYH/de1dgd8OGD2i2sa8+XsrI1vd0Js6/ibkcIY6Padst7X9EfZMc75VM3pTSEGdKCO0R9KOjJFNBSDQ/nsMVYp2AnLcjSbtyb870CluHtXavL1vUvY8s9HwIUnuJtXcKAxXP+hTBxEvX4GhDogDwX3TR/q6xFEsuskY7jd7GNFpWDJFmGT4ZH13PwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODu0bLQYEOuXiH2fGIBDqIZIppgq8J9XHzZ5JuAWXoM=;
 b=ikkr5BfjGfYiD7OYjEXNU8ceJW4CZjlPClb7NubMzRfe7oFh0+e7/WaZ5QTj2lWJohx0oCkhvRGCsriKEHxYQwlup+TO2cZQB8x9LKS2biS1ovPKH577Gve32HljThztP4iaKrlpE5PhgPxNHuMbTyKNEU0/JH6eCqoA7lDAKKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 15:21:59 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:21:59 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/4] New debug feature: IPC message injector
Date: Tue, 16 Nov 2021 17:21:33 +0200
Message-Id: <20211116152137.52129-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0013.eurprd03.prod.outlook.com
 (2603:10a6:205:2::26) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM4PR0302CA0013.eurprd03.prod.outlook.com (2603:10a6:205:2::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 15:21:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f6eb785-d24d-4d4f-b19c-08d9a914d4ce
X-MS-TrafficTypeDiagnostic: VI1PR04MB6880:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6880BA13D0725CDA977F22BCB8999@VI1PR04MB6880.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTzPEu727zLI3QBqv5k2TCbnMgYSl/68uM1CqDd1uP5eSygxgnqikZw6bKPTmC6wx71REuV/Td/DpOTZgXvyGOg53tOXjdIFeovADz4toS8N83V6NkowuABbKe+xBAQ+fucPDunTXCmmMJkgmjPA8V6O+u42bpZuGZ5pN85T/RrcIfZKwmjKT4nsjXthhPk2q+a8WvnO6AaCPAhmBxr2Y/1Av5OwEBZ7g2kI8w0+PWYg0QhYvsNzqUdEjQVcdczaPi2n/O2JZUWUI/DFnVV+UZhj/6f+q+UInluYXZXBLUQYserhmckmauHVqzJDe4riambNH+7jf7bFeEn1Cu8nraiAt5m2tyAIk8laCU1SK+QU02arRrJ+3yvQXaGxTsj/ydVuwLXFQQ4fPSdnAFoNcEX7XJU2XENZk1yBcgS5APHkkYWeUq+Tc0fBMQQgF5BNH1MVKGs2MTMXFltzCFiLNxj3eMgrGa7kmjWSgcInzLY6YU5atIxT/9/D7vixk0LSH+IvSKp8omrxW0BiElRPwBhDcLd9sM0f6Nh0hSSqQH8t2AWBu7WlMi8Og9bg66IJVrghuXXvIpCNgafY+4DR/1UltMbWGBAz99QOoGWPxOt67tplEPuww9WHxE0ZQeXnvAdzCuoVAjxqnhBrJmKz/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8676002)(6666004)(38100700002)(5660300002)(8936002)(2616005)(52116002)(2906002)(86362001)(15650500001)(6512007)(316002)(66556008)(186003)(1076003)(508600001)(66476007)(66946007)(6486002)(44832011)(83380400001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sg/OQBjQ16eDdJBvyZSHpcqFGjCcv1JIe71YK+thqsXTRg+MKJ5kRsD4sRjA?=
 =?us-ascii?Q?O5qP7pq0gBjj6Kw/b64fasWzGxyfDAm++9fTnZSC6wx4Uq2Wy9nubNNHlOaR?=
 =?us-ascii?Q?UlYG/7mr2lGjNMqb3iQH9xwI7SZIfAP8Uhkp3KHV7jAOoNHcvy25/p/fzraM?=
 =?us-ascii?Q?nX76mKwgQb50utsXBuIBtkK4UPP5M07NU+kIi9Va9tH3NoVk1iu1ckccEI01?=
 =?us-ascii?Q?fqoUigpQMBRgvyjyqYfQtUV9D7Ixma0HrKMDDwDCH/1clSLAzoKkgsuxsz6E?=
 =?us-ascii?Q?CabyWChcP+rPYQPXInGYejwJOL8gaV5Z4J9OIigh2P6k6kV9nCdwmuB7KOYl?=
 =?us-ascii?Q?Aj6tgne0QDMH7GbHMleEVbpD7uDXDbN4slIYJtGfuA53tQJRfvwc/onDZDcc?=
 =?us-ascii?Q?7U22S9ksX+TiOQTCWhUPOLqOm7BbJv0u+sc9AtBQmOr7ih4ZTiFQ7zyDEWeI?=
 =?us-ascii?Q?KmM9Y9e5Ok75sFsnOGMNdZwAqOrvCwfPWfswr8aIjaHv2joySmZmoNdVyB9+?=
 =?us-ascii?Q?4OovZwV7J60sODMSLyJAJjZWMVrZVko3jjQauMolwhphJDPOJaNFPGu4ZdsR?=
 =?us-ascii?Q?QcKqkrSJozT8zJ1ANKfLTAHGO6vKZNTt4DXdYyDWJJ5z+qIPSNZFhn8mSNb+?=
 =?us-ascii?Q?YErYjT7z0S6P2BqNURz5UA8ya8Sqt8yfq8rR7M7/PdCssqa3V4wCJVeJfiY2?=
 =?us-ascii?Q?q5wC71TwnnoHN8mma+wiwuaMqy0R58K+c1ER9Jqz6XOi/awRRShk7/l2dQfz?=
 =?us-ascii?Q?A/cz3ibN8M1EMO6l3/a0E9vNwQLkwpCPYaKun8BbP8EEKhEMuYVvwfroqEm+?=
 =?us-ascii?Q?sPmoMkv7SQ8jOQj66/XE78ajlDEvtEHh5Dzuo/+P9/0klh4sE+OUnMOfQlpm?=
 =?us-ascii?Q?iYuRpdsYVZZvPCQmnd6EqOZ3MggJdfB9MjrZ5QKHMS9lSBKaMwB/ZdfPFTTj?=
 =?us-ascii?Q?OzH6bmtD3DWLWwcw7rfiMwFtLdLXHWFc1SNrajVwsndyOjDiqAqV1g4OjdZk?=
 =?us-ascii?Q?yhE5cUglzD5fUemJcmbmIztlD52ljTphEPDPgVIfB2k43+lSVsTHcAIbEV6i?=
 =?us-ascii?Q?7RWtjG8GH6AVZn5aURsHyn4ysYty+1+snqiZpojzlXd8TPQJ3AfX1BazX3Xh?=
 =?us-ascii?Q?GAgwcovWAh1oiFc6oiqaT7JC3Xg5/ziy5997khQyY3w/RO0wS0mC2G8rU7br?=
 =?us-ascii?Q?F4eiF5wvbDOk4o8Xjn9j3tAtmzOgJzSkJgF5E0GFVbUngRyoqim2spLRXzXC?=
 =?us-ascii?Q?7nGp2jZFzmlNYnWYX7lyZa38uwFHKB0ilnFgPZJEOqchOfcCsYR6BNMgzfvG?=
 =?us-ascii?Q?uoQixdGlC6Z3PpEdNz2wpBpw2bJcGaDgYyl5IvEZUPRXk+lGtqKIDb4qWbqZ?=
 =?us-ascii?Q?HK+uh/aMs5hXvlLtluSjxU2avCUhuNNCZp14euu6xptyS3vFgDpF/oPTOGhX?=
 =?us-ascii?Q?cmQFQF2ihWmaFjtyrAf5TPAkjOjRcV4ZLxzNCCveX/9fE5IO66k4MFluQ2oK?=
 =?us-ascii?Q?kNDEs4pf22q8yb8Svd+j7niDnnd7MGn7GdKBT6soCppzun1tnYYi8e1mooOB?=
 =?us-ascii?Q?pMmOCy+tGFBz27S0emhSsiaOP99upvbYxEBnzFJ6qqtkTMMRlpy9VOS8TVZf?=
 =?us-ascii?Q?vgtkQaygi76AEEnLR73yqSkMynkLYJbGqVPYHnfdQrfOXCtWeHHxvz/JIEoe?=
 =?us-ascii?Q?wTmXUE58J0YsQx8EurUtrw78EZ0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6eb785-d24d-4d4f-b19c-08d9a914d4ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:21:58.8749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5wIl8NOu0HM1s8oJaaFBRuQotPomaIsvyCOnoU34pSNKLBVErktT+6jXurlZdLvnBAkTo5NS7QzlKivKdP3nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880
Cc: daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com
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

With the new SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR it is going to be
possible to inject arbitrary messages via the debugfs/sof/ipc_msg_inject
file and get the reply from the same file as a binary.

The main use of this feature is to stress test the firmware's robustness
against maliciously (or erroneous) crafted messages.
We also receive firmware crash reports with only a binary of the sent
message which caused the firmware crash.

Before adding the new debug feature we needed to make sure that the IPC
reply handling is working correctly for cases when we don't know
beforehand the size of the reply (since we don't know what kind of
message we are sending).

Peter Ujfalusi (4):
  ASoC: SOF: utils: Add generic function to get the reply for a tx
    message
  ASoC: SOF: imx: Use the generic helper to get the reply
  ASoC: SOF: intel: Use the generic helper to get the reply
  ASoC: SOF: debug: Add support for IPC message injection

 sound/soc/sof/Kconfig         |   8 +++
 sound/soc/sof/debug.c         | 107 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/imx/imx8.c      |  37 +-----------
 sound/soc/sof/imx/imx8m.c     |  37 +-----------
 sound/soc/sof/intel/atom.c    |  43 +-------------
 sound/soc/sof/intel/bdw.c     |  43 +-------------
 sound/soc/sof/intel/hda-ipc.c |  29 +--------
 sound/soc/sof/ipc.c           |  61 +++++++++++++++++++
 sound/soc/sof/sof-priv.h      |  10 ++++
 9 files changed, 192 insertions(+), 183 deletions(-)

-- 
2.27.0

