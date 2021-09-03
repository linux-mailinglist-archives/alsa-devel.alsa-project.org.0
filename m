Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B397400194
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 16:55:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04470189F;
	Fri,  3 Sep 2021 16:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04470189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630680925;
	bh=jVjgsWexiTMwVosv3yRWKBfU2wkfKS9oZ14uUSrGdMo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BNE3h8UEfb7AgOzTeP06h1Xr75ByWF6SRjptDCgZiU48uuWk+DFy3ajduDoqKEjiK
	 hV1jBhax68YkIEI/YmbnqqDQXjh3Onop15jbRf5P7GKhxdccDuiU+10HXa/H9WWLC2
	 49j0lZZQ21QR6MB+pvlWOMlXE+wo0jJA0MEESm/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E6A7F802E3;
	Fri,  3 Sep 2021 16:54:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6E44F802E0; Fri,  3 Sep 2021 16:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 141A7F8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 16:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141A7F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="FKuJH9Rh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYjVdqFeeN0D1aNeO7NQ0hYvuXW8y3vAzpKGbdxy5df3iGMxpExGYQ+kbz7o90iD78v7V4neUuSYpBrpKecdXhl1ZqA82t1XNW9+vxyxm52lx/vulYoP28UMUDDniTgX4ibl8aj60MbeGy2gIzF283nDuMLzyzsMGlQZpgfzuXHAbaCwYuSBlID6zrh1MDb2ZzJeDfR4+dP7BOQ3Lgi4LGqP41mVS8OCBRydUQTmeYJCz0I5/zdjPA+QNiRME0FT9BRCC9ueydhbD5oRA3Aej9XfHsORbd15VyKOC8/5KbPbFe2w4LNPnFIwm92m+dVRg3QjcL+9+eZ9q8dFj5kKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0f/eM0GlHrnhSOZsZ7O3ATduEUuVK/z2HeHTpl9IJtg=;
 b=DhZHG3uGUPPbVWspObnVm1XRhLIywK5C13RJjgnF9XADfTR5VuB9Wp1dvfjAZ+HYp0KOrxMlIrpqWvn/aDQvHBLMdOZqzaFxTqQaxtaqVeiGQgtQ+66q9SGTrDS/vJWVJaySvrdEV9htcXO7jqRsbpIkatstU8Wa3J642FeD9gzztSTUIQccrYGT6/Tljyo5DoOU43Up5UGRdy6v9QgOBghBmtp4bM3UCwIUw3uW+JFay9Jco8rJpl7D/VF2ydk8EgZNtgB29UJI4zfgmZa0J4GgqWeyBiEYxNAJeaLqW1WL9wXU/T7Qmgzwp+CEBuz7dOZWiv0SZVX+TKF2Kx6o2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0f/eM0GlHrnhSOZsZ7O3ATduEUuVK/z2HeHTpl9IJtg=;
 b=FKuJH9RhVvVXKKwbg0Hs/Z4JChSFQsYOnZbQgNR+ncbzZRbyojswP/MR5kfgIJGDFvF35ETkyOTRTfMFqYWTYvXBmdQn6uy2VjM+kWxsvqeSAeSE+T4smtsvk2miX05GeNJ5KSHypY9iQU1tXa03EYz9g4KvClnsdiMd3SlEc0g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2654.eurprd04.prod.outlook.com (2603:10a6:800:58::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 14:53:54 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4457.026; Fri, 3 Sep 2021
 14:53:54 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [PATCH v2 0/2] Add code to manage DSP related clocks
Date: Fri,  3 Sep 2021 17:53:38 +0300
Message-Id: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0200.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::24) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:fd8d:b9e7:97b5:dd4a)
 by VI1PR07CA0200.eurprd07.prod.outlook.com (2603:10a6:802:3f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend
 Transport; Fri, 3 Sep 2021 14:53:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17477f74-f74f-4758-faac-08d96eeaa60b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2654:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2654DB235A75232E2F3CDDEAB8CF9@VI1PR0401MB2654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fuNroluqZJkW5IGmpuRNKiUeRuS4/HtzUViVA0CfPAFv2zVNdDomwHyw6LPgFEbedy7GepQsx63ha886K0Nn1sex5STDLDtEcNmLwroDwHu1IIEDxqSXZAnKHp2w/wS1mwItl9fsBCpFRxxNNELxq+pR/PRf77hi/Pp0Z0DOmL41tYyecNzhkBKKHWWAgnYHhQUixxJdJRmgxFgJ5MghUaTWccgvhmh2xXlH2Lc4IF8yY/c+sLsnO/k9RpqYo+IRPHeRDs+k0O0YpZelD3KTcOu2Ov4quBoBlFqjqLlMIybmjJdx0/FTf/YLW+pss+BXkIkiD0Z91k4V1OwoDBZV0tUWGXs6Rxo13VhWmmZRR3xAyNr6VHj7Z5u5lVDizg4j6D3Zx5RhZJVAcf+23KTz4ejhC149lKLkc5tnPi5KKqEZlM9gWABsWnlW/iv1SuEFPri+LFRvd0Ntyr6R8okpUpeTGu0iXrqaE0sAJFvZbhNCyT9uvhIkTglDNJx3dIaMWs6U1o2sDANlkcZ7t4EoU/ieEcYpAhUdButZ2uIrrVybRNpX6fkpLq7mvUXs8SK1BCYEVM9J4zjrCX4jfnooTNYBSIrvf76uVYqEYIku/XCB+ddBOmyR5BONkgNWAqGDSrS9TMAUXtugnX+Nr0YPVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(66946007)(44832011)(52116002)(6506007)(86362001)(8676002)(6666004)(5660300002)(316002)(2906002)(66556008)(4326008)(6512007)(6486002)(66476007)(508600001)(2616005)(1076003)(83380400001)(8936002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O2DLZdHmEcKktAKlLYOIIBDHIhb1etlpTIySIJ7ZU9mFsjSNhKrA5y53UoK2?=
 =?us-ascii?Q?mMclAo6ueoElIZ59xKK3uhX+9IMu6De54K3QqPllcM1U9ZEmhYE70rg/h6Qk?=
 =?us-ascii?Q?sHDCTYdFT5tahbaY2lcNCjPLfRRbti2soXGRGf8BkkVLOuV4CR7USzDRNypH?=
 =?us-ascii?Q?Sfa8ZA76TLNQvBNGEyZ1/io3OHg63tFenIFY7E4TUsKf0gbnUAlvpNvYHNLb?=
 =?us-ascii?Q?JeQkWrksaheWrI6Kwj4xHoxw7Taed3zYpZ370RIxXwpFKy1KUIwAhjnVZDnz?=
 =?us-ascii?Q?eufLEixPTw56YJ+ze4JGbQd7i2PIymifF/j30YuPOITPU+W5jvtszNenk+s2?=
 =?us-ascii?Q?g+f1GDuC+jdHJ/hocs69blY/zsRS5NGa0LicFBQnLCTPCMoPrP+D7+d+aT8t?=
 =?us-ascii?Q?6KabAyrUYQfn999MO0dee3RBJecpOhyLoMF3LAtEhlxg1QllzZ9eaA5WTo+g?=
 =?us-ascii?Q?Lcc5ES+HCEBWShEbyMqsMGbibVnJAdgL0LZor796xjZ8DCryN0yrXO+519CR?=
 =?us-ascii?Q?0c6o2oWHaa5oU+4dQE4KMwmBuu6UZQwe6DuUAwSW8YOcoLFBTVsRyS3IBZ8Y?=
 =?us-ascii?Q?pT+4xneAw5llw0rTPwZKOhwqbSi46ZM36EzSaSMw84tMZuBaKnUjehOuP/t0?=
 =?us-ascii?Q?oSx5q1uI/3+xzlIQpxmDq9Xh9iubhDX/KfAGWp/1M+d9PDfhMziOjerL0WB3?=
 =?us-ascii?Q?3ZS6hKugX8QWbySdP08+zgSWStAZBYba+OPRI1DGyC2xwAC5qqqpFlKTwDRV?=
 =?us-ascii?Q?qtjGRwmGL0mlRqJqwmjA95dvDSLw9sESGAols6i5Y2pc4jLfWrVG4h7eefcQ?=
 =?us-ascii?Q?p5Yxk0jT1K7M7lrWOy6lIyhjdCK7PBzbEFRLmFpsNN6QrIU3wXtYOL2ghwu/?=
 =?us-ascii?Q?nMGbw4FaPOj9x1PmzczN+QaL68kv5sFVnUVDxMEikVzJogNjtimOqAhuTyQm?=
 =?us-ascii?Q?Z0WNr32t9FHUHirGUhkE65V+I4OAlAY4y/TY99hYbuSKW+t9xrYa4HXIyCyI?=
 =?us-ascii?Q?+L7/yAoIgzzEg7K4IeYs+rJHVqOi4YwCWCOVbhPBpIwMn2NWHv/d6BsokslP?=
 =?us-ascii?Q?R903VHoGGib5hi68VAHIJrA0SBYnHaTHntPWKYJsbN3NE6XfCJpDgOP7NfG1?=
 =?us-ascii?Q?RjaGTDp+fCiXKOyk1YWKEysLSTmn9rNDAl4cbZfFUiz8gkwNllFUlq8J4vVY?=
 =?us-ascii?Q?vJIdcZRGY+4pKEJsKc6vaVzytTbq1VJ5Oh3RDZIpPovrs1ACoobY6YsTdNdI?=
 =?us-ascii?Q?64xMiWigUZRB6Rt1Q5Hbq1gngsUOnYFnyNKJZB502OC8HyLiFqKZckovDPFU?=
 =?us-ascii?Q?hz8wPe/SCTgxXYGgLPiSOY6SfjAMtCU01DAxCYL19MiFB/pEykzQjGTQZKR9?=
 =?us-ascii?Q?c9VNwNvs8AFoss+HoP/o4tS2pFin?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17477f74-f74f-4758-faac-08d96eeaa60b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 14:53:54.0049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyqCkz8DUqYf5EQW1spJb1dLQXDc9aWb5FSAqhZLO6oMR1K4sIFT2tiJXXw01TJK7DzpdQyH0HV2h6x3ugIHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2654
Cc: Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, shawnguo@kernel.org,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, s-anna@ti.com, festevam@gmail.com
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

This code is based on top of SOF topic/sof-dev branch and we want
to have a review with ALSA and Device Tree communities then it will be merged
to SOF tree and then merged into ALSA tree.

DSP node on the Linux kernel side must also take care of enabling
DAI/DMA related clocks.

By design we choose to manage DAI/DMA clocks from the kernel side
because of the architecture of some i.MX8 boards.

Clocks are handled by a special M4 core which runs a special
firmware called SCFW (System Controler firmware).

This communicates with A cores running Linux via a special Messaging
Unit and implements a custom API which is already implemented by the
Linux kernel i.MX clocks implementation.

Note that these clocks are optional. We can use the DSP without
them.

Changes since v1:
- used clk bulk API as suggested by mark
Daniel Baluta (2):
  ASoC: SOF: imx: Add code to manage DSP related clocks
  dt-bindings: dsp: fsl: Add DSP optional clocks documentation

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 33 ++++++++++++++
 sound/soc/sof/imx/imx-common.c                | 44 +++++++++++++++++++
 sound/soc/sof/imx/imx-common.h                | 13 ++++++
 sound/soc/sof/imx/imx8.c                      | 37 ++++++++++++++++
 sound/soc/sof/imx/imx8m.c                     | 34 ++++++++++++++
 5 files changed, 161 insertions(+)

-- 
2.27.0

