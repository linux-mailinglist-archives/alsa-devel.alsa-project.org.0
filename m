Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40E4558CA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37ED7189A;
	Thu, 18 Nov 2021 11:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37ED7189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230359;
	bh=oWgfUmGpScC53mX7YbfQXkOptj/3blPF4qwWjxVNxKg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oe2v5qcnzWibhu7F4JbGQhjYE7NmvUqE2JxpIUFwR2ZOqzw09Ug09UqmX59CdyRTh
	 gWZNxwx6NPxpt+qscnmSHW+Qp+T/jgiYZb5Z+oI353xriVv9KcqepCMfO/TjVxvmat
	 SRTsP4wWs8rcqPsDwtmzNfhug75Zg/C3cQ+tbiOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393ABF80527;
	Thu, 18 Nov 2021 11:08:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37023F804FD; Thu, 18 Nov 2021 11:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11609F804DF
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11609F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="lhrNjCOB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOclHhCP8fWo+biXKaRtG3NyxvC1YQXbfAvGwmLpJLFA9CBi8LAWxVjCTLy70EYC18mEvJRqQshJNM0grdSpDPyBkKpn/IL46+JVOJz2WqkI2n+OIOZPu3P+8vJeq4xdifua5iplKhWoOO5OHI0XYRdF37WnlA0OP8yXx+nu35p3e4mLDu4RFsEZNredlYc1No0Nii75cFMkCgw3srZe2by85mgB2uWxnnoN/Kzrqq3IDdt0fa2ImbOVGDfSP1fwPJYL3tJNZNTo8EgqXnUZTUGJMbor5IJQje9o9UCpJHebPkj5A0rU1UhFbAPcrrS6GdkbEulU024ZGD1jJYejWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCMUzfA8hdjBrmOIn6d07q9GBomDcmPvFrEtSFmZKi8=;
 b=DYoFfRwpjqnD0HAasDJnAn1938oOoRsubFUtiOo4BUuHBoLQkMagKYWggNQJhjTS3m4/VDVQNB8toGAsVmUm1CYLRX7ps/ESLgbzznqA8YGKXMXMV4SmEQi7V1Y3bf3DScIqC+wfuFgq/Uf15oXNtv2bC7VqoNN3fX2Asel0dr/N7vraLUZCW2L7/PCKhIzsw297ARSz+TsJTGABVAUiXBUfJMLVT3hWDb8MDmTPPPhMCtVfG+8oxMJgpfo7zs5VX0+cJafjmhwEx7MNvRzv06iSEdErjZrc+PGi5Qg/t/kuqxIp4Ic0WZjrh2eygJ1jrB4wi4Y0kFwMmCCLaC9etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCMUzfA8hdjBrmOIn6d07q9GBomDcmPvFrEtSFmZKi8=;
 b=lhrNjCOBBpsc8Uz7E9lEtanSWfBNAdkoV3yS6qt8pfXLWHVTmlN/ozJGwpEMNT09x1EMi6YpQemy8XR4//pcTUdf68Mb7RKZeZJb1FTjKXmJQjUsoWhKeTN7vCx76X58nPLYQNr2GLv23GZQoY63Xa9Dgn/5wmDbJ4YGxfGCY4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:20 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:20 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 7/8] ASoC: SOF: mediatek: Add mt8195 dsp clock support
Date: Thu, 18 Nov 2021 12:07:48 +0200
Message-Id: <20211118100749.54628-8-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4a513d-9bef-4f57-abdb-08d9aa7b5950
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4285B5A8778CF938FACED40AB89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:277;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8N3moHGBB50MKxznFsQ02ZMD2H5rOzOgK6YKb0b2PqXFuNeg5QHKco5B44LjLDJsNppBz1fIXczBWJSYy8y8moKNoTDFkyoS32ydWsWWuq0kAQ4P9ePhmpHQ1enCqZu9+KzeQFr9NuIbblhS47Zm7YfIBAL41njIp2MxMkWrb1sTqDnN8D/qjZyo6LkTuNPJq7k1v98Pqr+qn43EqanUUEpKr7J5Jcqu3mR/eeD2MaAdayJuTZZlsQ8wwE8b/YsZQRw40+xOZPWDcn+U2e//1U0tG4mW4l44RnZGqZAVPK/ayj8cVOTOKx1qUA9Umo1wpwzc70V2HrETN6Wr7cXXDYWrWBmlHcKexnOgSr04/mTo+3UdOa8nwQe4bmWPbFTuB9z1AFEx95sqO8U1fxrzvWedqlVHehUvGMw4QT+GhJxTFBFW7zj46S6KjsQZcXFnWAb+iXO14GjjoOZ3aZ4eN8D5MSTEL2vsKIAYAoPLP18iUAOiewC/DXXp8CBGUxmUSGb9/Pc41eRu8tHbDwWPrMFNRGUv/ptfQwi+X3XDhnpXNlVTR6SCBPm0lkIRI9YwR0Hdcqqe5wrusWj8wuLMAFw0A0Lejpa4H1/tY7gvTSAvLZoMuK33Nn3/cIuZ8pyqHNJdB378HT+O56ZNOsx8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8676002)(2616005)(4326008)(44832011)(86362001)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EYE5w/bTLGCoKeQ1n1RyhGEqDO2rFf19w1B8bJW2eq2EemgN6P0PWRhR6KaM?=
 =?us-ascii?Q?IX+a3s2ShAhgn9DpnFjGka0gkkKUpPfNjUzfCWSCLv9wU8kB86YmtjkHBNCG?=
 =?us-ascii?Q?pb+ndSEnfjTCvu7dmHZLGxIhRCfrhkHfkgHeZAD3O+MueZdroispGuCrl62m?=
 =?us-ascii?Q?kZI06ns8d+jPPYJu8wx7oqlmWWfzSPH5znmfC0XmN17FFwTm7V+fDnfwo2RY?=
 =?us-ascii?Q?mtBXJD/D4uPFUEH+uQDYetQxNopC4W0Dvh1m1rAL6yaW5MS+kpV6Qo2ubqOE?=
 =?us-ascii?Q?GP8Eqbr2Bmv3Ii5tuTGTeD2MJ+68z8lyQFd+Cwr4FB54L9KwbTljP0ySZFhS?=
 =?us-ascii?Q?5RApz5sNrrvKTpyRYLyKTkEGf2O5zzsiBoJ+QkAHL+7O7Sb76Qdiw5nFeTy6?=
 =?us-ascii?Q?cg+1NR+ZquvGAwTDGppd3QPE/9nWngounu8eQnK57zQZSU13wala8Q5U1c0L?=
 =?us-ascii?Q?Rcm4J5DthGrRWOSxAwThtklhpTPD2y+9/u0/Ay3lSzu8BYxgL2Q+0Yv3NDhO?=
 =?us-ascii?Q?LQ9+6P1MgntAgIc6ppD56nNlHza7h4BmqWehY479H7NsLqzXUStvnU0UQfcK?=
 =?us-ascii?Q?aj00yh9WlftTNON+sR7OC15VRq2O1jPT69cIF0LiJHdAZV8k0edney12FfmD?=
 =?us-ascii?Q?W9XlZzAbAOzSMThfTTmqvk+8sziKP0Ozrn7ZbOL8t764DtZsK6hZxzQrInc5?=
 =?us-ascii?Q?7Uq5bWtY8uqDsgXrgBsML795ptiFBCEJAbtkJEeNFJHDWOKwW5sJucsMhNqd?=
 =?us-ascii?Q?zTipCGfly9g8RhSxOfVsRm9nVd9aIogX7TBRRSIC1Xp2SJNB1539SqQEWWia?=
 =?us-ascii?Q?txfL2EXVPB40kGZG5zWAQ6Vh2z6XEAbn6PbdY/TwiUxLjuzrgaY2WRr0Lyz4?=
 =?us-ascii?Q?a/9FskFSlE4rsavjI7dNsuF9fmjqdnPMLKypJsVzpDqH2uZSN91Cd8sba4+R?=
 =?us-ascii?Q?1j+4cMZXhrGMuTXclNCsM4y02ayCE2Xz9QEobSg46+pPD8CGg9qxEQ03c74G?=
 =?us-ascii?Q?zOaXorzrYAz3s+JVjpC8pCGqn4ZPD1ZXeKjyyHbLiIQZoxQ5Me6IOxj2R5+7?=
 =?us-ascii?Q?C0+l5au6Ad9QYyZlJA69vy7qayzaoMBcwhSV0Exvy4WOHGhHGcApWLzJbPwh?=
 =?us-ascii?Q?BH7oIStmd/snJhDmEEJv7V01z80qKwiWd3Ut5LUk1/tLhQLHwkhoGusMs47B?=
 =?us-ascii?Q?l3E/Qcd/nZGPOpEhmzRikd/Z8jM7DXMStfkC80eBu6KnzDMQxOKVoa8FnnBg?=
 =?us-ascii?Q?0lz2gJGRwAXY1n1U9A7GzkTKh6OiSbUFJNnf9TI8ZrTHtPb6f98izxO5TpJ/?=
 =?us-ascii?Q?k0iCmEo+qMuhsAPqqGqQQ5YtWUB1ikACN6y24Zn9gSSb47dBR/qpt3dXKFlo?=
 =?us-ascii?Q?CgwczjDKBbzzjV5PEn1Qr2Svncla6ITwdypxmtKKmMc7nEURrFPJ1IkrKBZG?=
 =?us-ascii?Q?mllgJ9qf1tEeomgTn4DgqvevTjN4wWAMxGWF+wPjYcU17SZQvKeLLF7nFfAD?=
 =?us-ascii?Q?APqvQFm2rrOOTWJgGrdeRFVHYiqXygxmpmKOiGiyPr9Q6J3MtVc3bIXvdJfu?=
 =?us-ascii?Q?zToCb9mLI0Btq3/k3seeOkyqiibTtCg35uTU9iJn1hLmY208sm3TdM0FAm08?=
 =?us-ascii?Q?PSqyKeAOYoK0I44uZpsOiZWNwscLoFnbbIPWqTSu+o57Dh+1jBQ7529uiboq?=
 =?us-ascii?Q?zPKcbMvamnUGpA9Wai7URe1s4Ms=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4a513d-9bef-4f57-abdb-08d9aa7b5950
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:20.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7t3a+KRAVhZAhYGHqcf7NCOx6miw8NEbtL+SH8yBGGrCyZfcspWUuLS272UXn3EuIbq4aR8840ateBvtzV1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, daniel.baluta@nxp.com
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

From: YC Hung <yc.hung@mediatek.com>

Add adsp clock on/off support on mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/mediatek/adsp_helper.h       |   2 +-
 sound/soc/sof/mediatek/mt8195/Makefile     |   2 +-
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c | 158 +++++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195-clk.h |  28 ++++
 sound/soc/sof/mediatek/mt8195/mt8195.c     |  22 ++-
 5 files changed, 208 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-clk.h

diff --git a/sound/soc/sof/mediatek/adsp_helper.h b/sound/soc/sof/mediatek/adsp_helper.h
index 346953dd22db..6734e2c0c6b1 100644
--- a/sound/soc/sof/mediatek/adsp_helper.h
+++ b/sound/soc/sof/mediatek/adsp_helper.h
@@ -39,7 +39,7 @@ struct adsp_priv {
 	struct mbox_controller *adsp_mbox;
 
 	struct mtk_adsp_chip_info *adsp;
-
+	struct clk **clk;
 	u32 (*ap2adsp_addr)(u32 addr, void *data);
 	u32 (*adsp2ap_addr)(u32 addr, void *data);
 
diff --git a/sound/soc/sof/mediatek/mt8195/Makefile b/sound/soc/sof/mediatek/mt8195/Makefile
index 66cdc0e7bf3c..afc4f21fccc5 100644
--- a/sound/soc/sof/mediatek/mt8195/Makefile
+++ b/sound/soc/sof/mediatek/mt8195/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8195-objs := mt8195.o mt8195-loader.o
+snd-sof-mt8195-objs := mt8195.o mt8195-clk.o mt8195-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += snd-sof-mt8195.o
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
new file mode 100644
index 000000000000..6bcb4b9b00fb
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2021 Mediatek Corporation. All rights reserved.
+//
+// Author: YC Hung <yc.hung@mediatek.com>
+//
+// Hardware interface for mt8195 DSP clock
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/io.h>
+#include "mt8195.h"
+#include "mt8195-clk.h"
+#include "../adsp_helper.h"
+#include "../../sof-audio.h"
+
+static const char *adsp_clks[ADSP_CLK_MAX] = {
+	[CLK_TOP_ADSP] = "adsp_sel",
+	[CLK_TOP_CLK26M] = "clk26m_ck",
+	[CLK_TOP_AUDIO_LOCAL_BUS] = "audio_local_bus",
+	[CLK_TOP_MAINPLL_D7_D2] = "mainpll_d7_d2",
+	[CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",
+	[CLK_TOP_AUDIO_H] = "audio_h",
+};
+
+int mt8195_adsp_init_clock(struct snd_sof_dev *sdev)
+{
+	struct device *dev = sdev->dev;
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+	int i;
+
+	priv->clk = devm_kcalloc(dev, ADSP_CLK_MAX, sizeof(*priv->clk), GFP_KERNEL);
+
+	if (!priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < ADSP_CLK_MAX; i++) {
+		priv->clk[i] = devm_clk_get(dev, adsp_clks[i]);
+		if (IS_ERR(priv->clk[i]))
+			return PTR_ERR(priv->clk[i]);
+	}
+
+	return 0;
+}
+
+static int adsp_enable_all_clock(struct snd_sof_dev *sdev)
+{
+	struct device *dev = sdev->dev;
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_MAINPLL_D7_D2]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(mainpll_d7_d2) fail %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_ADSP]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(adsp_sel) fail %d\n",
+			__func__, ret);
+		goto disable_mainpll_d7_d2_clk;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIO_LOCAL_BUS]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(audio_local_bus) fail %d\n",
+			__func__, ret);
+		goto disable_dsp_sel_clk;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_SCP_ADSP_AUDIODSP]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(scp_adsp_audiodsp) fail %d\n",
+			__func__, ret);
+		goto disable_audio_local_bus_clk;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIO_H]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(audio_h) fail %d\n",
+			__func__, ret);
+		goto disable_scp_adsp_audiodsp_clk;
+	}
+
+	return 0;
+
+disable_scp_adsp_audiodsp_clk:
+	clk_disable_unprepare(priv->clk[CLK_SCP_ADSP_AUDIODSP]);
+disable_audio_local_bus_clk:
+	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIO_LOCAL_BUS]);
+disable_dsp_sel_clk:
+	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP]);
+disable_mainpll_d7_d2_clk:
+	clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D7_D2]);
+
+	return ret;
+}
+
+static void adsp_disable_all_clock(struct snd_sof_dev *sdev)
+{
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+
+	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIO_H]);
+	clk_disable_unprepare(priv->clk[CLK_SCP_ADSP_AUDIODSP]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIO_LOCAL_BUS]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_MAINPLL_D7_D2]);
+}
+
+static int adsp_default_clk_init(struct snd_sof_dev *sdev, bool enable)
+{
+	struct device *dev = sdev->dev;
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+	int ret;
+
+	dev_dbg(dev, "%s: %s\n", __func__, enable ? "on" : "off");
+
+	if (enable) {
+		ret = clk_set_parent(priv->clk[CLK_TOP_ADSP],
+				     priv->clk[CLK_TOP_CLK26M]);
+		if (ret) {
+			dev_err(dev, "failed to set dsp_sel to clk26m: %d\n", ret);
+			return ret;
+		}
+
+		ret = clk_set_parent(priv->clk[CLK_TOP_AUDIO_LOCAL_BUS],
+				     priv->clk[CLK_TOP_MAINPLL_D7_D2]);
+		if (ret) {
+			dev_err(dev, "set audio_local_bus failed %d\n", ret);
+			return ret;
+		}
+
+		ret = adsp_enable_all_clock(sdev);
+		if (ret) {
+			dev_err(dev, "failed to adsp_enable_clock: %d\n", ret);
+			return ret;
+		}
+	} else {
+		adsp_disable_all_clock(sdev);
+	}
+
+	return 0;
+}
+
+int adsp_clock_on(struct snd_sof_dev *sdev)
+{
+	/* Open ADSP clock */
+	return adsp_default_clk_init(sdev, 1);
+}
+
+int adsp_clock_off(struct snd_sof_dev *sdev)
+{
+	/* Close ADSP clock */
+	return adsp_default_clk_init(sdev, 0);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.h b/sound/soc/sof/mediatek/mt8195/mt8195-clk.h
new file mode 100644
index 000000000000..9cc0573d5cd2
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ *
+ *  Header file for the mt8195 DSP clock  definition
+ */
+
+#ifndef __MT8195_CLK_H
+#define __MT8195_CLK_H
+
+struct snd_sof_dev;
+
+/*DSP clock*/
+enum adsp_clk_id {
+	CLK_TOP_ADSP,
+	CLK_TOP_CLK26M,
+	CLK_TOP_AUDIO_LOCAL_BUS,
+	CLK_TOP_MAINPLL_D7_D2,
+	CLK_SCP_ADSP_AUDIODSP,
+	CLK_TOP_AUDIO_H,
+	ADSP_CLK_MAX
+};
+
+int mt8195_adsp_init_clock(struct snd_sof_dev *sdev);
+int adsp_clock_on(struct snd_sof_dev *sdev);
+int adsp_clock_off(struct snd_sof_dev *sdev);
+#endif
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 99075598a35a..5bfae9379ac8 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -25,6 +25,7 @@
 #include "../adsp_helper.h"
 #include "../mediatek-ops.h"
 #include "mt8195.h"
+#include "mt8195-clk.h"
 
 static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
@@ -231,10 +232,22 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret)
 		return ret;
 
+	ret = mt8195_adsp_init_clock(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "mt8195_adsp_init_clock failed\n");
+		return -EINVAL;
+	}
+
+	ret = adsp_clock_on(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		return -EINVAL;
+	}
+
 	ret = adsp_sram_power_on(sdev->dev, true);
 	if (ret) {
 		dev_err(sdev->dev, "adsp_sram_power_on fail!\n");
-		return ret;
+		goto exit_clk_disable;
 	}
 
 	ret = adsp_memory_remap_init(&pdev->dev, priv->adsp);
@@ -282,6 +295,8 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 
 err_adsp_sram_power_off:
 	adsp_sram_power_on(&pdev->dev, false);
+exit_clk_disable:
+	adsp_clock_off(sdev);
 
 	return ret;
 }
@@ -290,7 +305,10 @@ static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
 
-	return adsp_sram_power_on(&pdev->dev, false);
+	adsp_sram_power_on(&pdev->dev, false);
+	adsp_clock_off(sdev);
+
+	return 0;
 }
 
 /* on mt8195 there is 1 to 1 match between type and BAR idx */
-- 
2.27.0

