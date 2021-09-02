Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C573FEDD4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 14:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F05117B2;
	Thu,  2 Sep 2021 14:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F05117B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630586046;
	bh=wdKULYYnDm1XmJs2vaoUN7AHwdlI/ObE4cXlarIlABM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SIu0eEefRDnt4gccynWfaTo5jXGcbqAYDjtYn1nTu9wrD/M48OzjwdPUOeV7rCVwm
	 T/kogb/NwkWd34eK3JwcNYSGmgS9n9XWtp06cD46kvWcHx8Mz4fI9mHQl9C+ofFSZl
	 dv13GX60YHmdkuM2eKidpGhFd1bhtGmlIXkxuoBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E21ACF80290;
	Thu,  2 Sep 2021 14:32:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0FC2F8028D; Thu,  2 Sep 2021 14:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E332CF800AF
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 14:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E332CF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="KhIoE1n+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhP7GLMYfWMqaELGGwjRFz5qvbjkH+lxYxhnYXRvE34XV//jHYZPoyFFA04WNZLY2xQTJN9VM4sdBqeaSp7Oa11/mqzjMhhKsWMXQdA8DUm5AsfsGPsjU10ZpAexVYC8TF8n8imBLw4RM5/CJO0/n6aJFe6Wi2TTt27P9LUs31Sz6+QOFo++tbuREXswHC+WKLIS/AXKgqVXsbt4357iDW4ntJ1jJyn6OC4oqBbUHyamxGDtjXG/pXMyc+7wDzvCUfb1pgkPeIYB7WBTKUgYulmy0esR3YNkUCKDqhu9zE9q5umD0wBSSPQJzeiuomH6bAQ+f1TZwvGCTD6DPDCMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QdA7Vnoi7i5bjf+52yRjv58QRfFaAeOuSE1hEvQDVPU=;
 b=RYfN5KeJMtTo5Vg/aDPojD+J7rcfNdNOT3IlshF306cSn7IGPV1efVPtKQ9cNtV+Gb0sjAPBxpLgC2eIiNe+kHm7QZYNnAd5msXV9htUad2Sxiir/a2j+KgbiI0Py8oSw/w2IiyWKLtsajNpZuxsPsylWcI5XHSAFMFjzW3Gl5hTl9ovzGxS0g4NpcqGFSfiN45+wSK88CJOzTgdZhCyCI996B1NATH0HofOALKam/73saFrWnvGc3vTyUK1Hrb66QGjZ2cXlG3i9DA2i0Wr9HQNAh/puepF4Jf86QuPngakkcCXDHpZZRGjy7Qg5AXwR+5itTImVBT2RvkB9AR+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdA7Vnoi7i5bjf+52yRjv58QRfFaAeOuSE1hEvQDVPU=;
 b=KhIoE1n+4DPsf8L5MpCdsSdMYsdaYVak8TQXuQmjk2VMCV0QEg5vNRTSzspNgtpsSTjJMJun2Y/nfcg9X1pmMgvR4OoquHe8HB8CIRj+Mu7m/Db1gWXnFPH+HXCjCC/fJJqkAE8m1Vvsag8ROR54E29B2GFHCw2ugr0HrlrYC88=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 12:32:39 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 12:32:39 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] Add code to manage DSP related clocks
Date: Thu,  2 Sep 2021 15:32:14 +0300
Message-Id: <20210902123216.787025-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0902CA0011.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::21) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:3b00:218a:73cd:7fff)
 by AM4PR0902CA0011.eurprd09.prod.outlook.com (2603:10a6:200:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 12:32:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19044b08-8a72-4891-8a09-08d96e0dc040
X-MS-TrafficTypeDiagnostic: VI1PR04MB7053:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB705356A71A159208566B8C3EB8CE9@VI1PR04MB7053.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 28UiYjGtTapgHCpHg/dfqF08YNi+srFmuldHV5Si1j7kKAkrIeW/3bhqGVqEYzsAPDpaiEUpUPfJjECfr0pbA7qn/QF/mXG3/hYrwybW7aFL5KAI1kEViYmB6grbHdy+1maz0lJR2UCmAfYIRqJ6pJGJKPJJpP0R+kHrApcXzgpZZh7O/5loZW4bEZoOyHLq7lVkdn0oY2v49KOwjZFeHB4CiwT0Tg02MqXCIMZkbN+YY4IRZVU1tUQhjHErSA4+lJ1c5RNMEXAmgAFV/cdM+2ZX5XJz84OcCmakAnDRQIa+hUoDCvzRrv9DAo5nu/8bxCcziwBTXaN3KUup6h/qPGJLMp7Psde6EU/gx0JxxbdOJxSAz/4KPmnwfy84tRgeIBSWqgCeDNRpyhSVY5k68rDNnwf3/DEAD7tjeIVGzyKQJydv2kKCtLQ1wNIzCO5do06hmpyOiHaMB/sGEkrrTmwzceoktt07lwfzqomc++ZuhS6nreNHWpHlmw1htQ6Ea2PWNL50QXf2n+T+vFCe6RlZPj9Fk+CR6cVI153GSkP3BfzmTg5fOEvgF6nCzVOiV6M2N2c6Pln3p5UDDIreqUMv83NRF+gENQP1dBtr9YsLykiF9rgSA8dSjOdpxNqg3zelT7WPc0ezdqUG+s96nmK/yZ3KIjr/ehSwqPccbPjfpm82WLzC8Tm2Kn7FlGakQX7aNXba7VQRYk/Z8kLCv2Tmfkt0l7X6mmK8jXsOCmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(966005)(44832011)(478600001)(6506007)(66476007)(66556008)(66946007)(5660300002)(2616005)(8936002)(4326008)(38100700002)(8676002)(6512007)(7416002)(1076003)(6486002)(6666004)(86362001)(83380400001)(2906002)(52116002)(186003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gb4yKJjHfJBGC34TFpGUmQQe4WeljL+DhppWckQksLFrEC6WK5Qk1C1hrV6O?=
 =?us-ascii?Q?4zSKH4lRXOrVbmLgI4cROPBmZyaf7dCLfkv7TEJRqKlI/SPoD3vNsRRaw6DN?=
 =?us-ascii?Q?Q9pZkh6g0F94Jn5vI5iQ0VBXwDP4qd3X/VBo9/xsG7sL2u9hLGz5Ds0nuUxV?=
 =?us-ascii?Q?FYvcOimW7sB6rPyIL2S3EqzRmpuGVO6+ltFhVLRjxpYwXLGGhQhvUJ5fIUHq?=
 =?us-ascii?Q?1Gbaz5Hhgc3pU7f4KDK7iYu9fLxvt8AaZwpRA4yDE61oNaWOAJjNEt5QhKUr?=
 =?us-ascii?Q?AXqRzpVztqKylQhjsnbsZJ1KGu3NP75bBHkjTCePslwIlPbOg/GIhsD4Ci0i?=
 =?us-ascii?Q?E4QawpHFx7jHcpgJIoXqHvinFNsuXGZ7bzYenBGkPx+QrkeSiyqdLWWCsNLz?=
 =?us-ascii?Q?zsovAwZTor138uWJNg6p/OxVLM3kElGolXbSeBBujBsk2B+HhZvbQTfSLdbG?=
 =?us-ascii?Q?khXHcnX2aeOTjiwvuASaFZC/yLpl6nxlpAhVwmgjw4lQ/29o3HQTnrWypgk0?=
 =?us-ascii?Q?dIlMjaNZfMZY8GYPZxCyeAz8uQiFVMhMm6duEdEkrHDpiHNXMoMmGNvuzWen?=
 =?us-ascii?Q?BEN6YQavv9zqa9J1NLR+Qx4R8eMRzNDBnVvUWh0LWeNDGO/8N1e91LIXdZyV?=
 =?us-ascii?Q?UH9WbUzoCReuOjXW9bjCgS0RQTih2/RqPE7eJLRTQ31O0ZZIF0x5nxiBZZDi?=
 =?us-ascii?Q?n7ShIXk8ItBnvuh9rL925niESv8lAe5ezmTrC3QwDjJxjcgMr0sjOUcU+5Zb?=
 =?us-ascii?Q?q5dorkFeYQ0lFzhlhuMAjdsWp1UawaNW3vtU7MM3NrUaCGptlGDJt1URJMLq?=
 =?us-ascii?Q?7OKSIsJab/TlVkDFiha+REhwfeGJtV7aqVWmO82iekhf52CmU0UoHZKCGB/t?=
 =?us-ascii?Q?BLx3hHjBY0nn5c7KgRbmmq0wwKnjbs54Xel0qjUxxp6VSsNnSkTN/ReHLBXr?=
 =?us-ascii?Q?q0TLM9tjhmZJ7igOg7CJyDKByp/f/472fl5fI1vOxSFhiavugLL1ObItjl55?=
 =?us-ascii?Q?TA6Ayt688/1380alSrSUduuAVWFA0SX0XN/QXxi/RZ0Abgunompvs9zgPgLg?=
 =?us-ascii?Q?nP8B4zRuYdW+pJBb+bNOCOxN83QJUfZWEiMcJOpN60w1ZyLDE+NuTdmNsdO4?=
 =?us-ascii?Q?ROXfgvSWgfo6hGwOggYlc5EEYpwAfLehZPrVNPAcUApulQfNBkNUV2Q3Ros4?=
 =?us-ascii?Q?auj/4nfrF8L6UbFyWXAl1ks9pff0hvkI/oD1o3cqqK8zqV212OjGvOaHuO+7?=
 =?us-ascii?Q?HVMwtkFTqzKZKY681/RNrpGSi+g4BCIu0cOJrYeJd3qA70iWVLx5ADiV7q0F?=
 =?us-ascii?Q?gNxbrINeUYPp95wKgrTGaJCIrjRSRRkm5s9evyR86/riZ0MQox17pVY98Dbt?=
 =?us-ascii?Q?yKhpBsFeQJYgdZLxZakyVmEsZeZX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19044b08-8a72-4891-8a09-08d96e0dc040
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 12:32:39.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28mlF3rLS+5I2Aha6Yd9dy/toVYeEQkMBdO3tFkSD4mMFDCnTkj4bBqipL7r1qb8wYerksGkgPjlSipSL4Bc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7053
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, shawnguo@kernel.org,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 s-anna@ti.com, festevam@gmail.com
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

First patch was already sent to review on SOF Github:
https://github.com/thesofproject/linux/pull/3131

Daniel Baluta (2):
  ASoC: SOF: imx: Add code to manage DSP related clocks
  dt-bindings: dsp: fsl: Add DSP optional clocks documentation

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 33 ++++++++
 sound/soc/sof/imx/imx-common.c                | 77 +++++++++++++++++++
 sound/soc/sof/imx/imx-common.h                | 16 ++++
 sound/soc/sof/imx/imx8.c                      | 32 ++++++++
 sound/soc/sof/imx/imx8m.c                     | 33 ++++++++
 5 files changed, 191 insertions(+)

-- 
2.27.0

