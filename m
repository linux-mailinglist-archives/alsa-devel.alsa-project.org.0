Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF613FEDD6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 14:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E31C16AB;
	Thu,  2 Sep 2021 14:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E31C16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630586097;
	bh=5O+5rNVRK2yomesK3Jeos6gNcZNkGxMS6gM106SeZZo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jebIkfGfa3kZXKWT418WD85z5cAU9BosiuQCbSJWIO88cJoubrNKnZIXcwht0LUvq
	 RkBChzBjaLDe+S24MxC5VbN7z5VHpciVPrdA8eFuuqZKQ/f1XQBoR3Kx/D5DoeDp6/
	 mEKVxpAn7JTd6sA0eAI/bJlASOua634ZwgGX02MY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F3CF804EC;
	Thu,  2 Sep 2021 14:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9BD8F80125; Thu,  2 Sep 2021 14:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A89FAF80125
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 14:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A89FAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="XTomKd00"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSGaf7P8ABAL+Olwlw6Uk6iKfXvsm+/ptNQMjlROniEzwOcB5giN79YiEnLrC7/peSa0V6Qq6OHZWsHg05/3nQC/IFBT3N1DbdawckhEbNiG5+jc+TaH5U7vZ50oncwWZoOrTVyoGg3Jcbu7bajimTQZYkTBs1YyYGOwKqtz0uToXsG4nyBXLjz4dDon6/MkRWaKdVV1FS2JDlGPw1o7wC66gfZAJmyTc3zIuTcwViCMof99DhX9V8Jgxzk/XrXMya00gb2b0Fpri2MRBm5bvOoPrmVDyI5ZZA2JUM1TuXxQ9KvJmy58EM543no+SvFC/uaAC5TQerIj8sz5CKUk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KmqZnWedP1AJSXsFtOa8M95+jajfkJOrqyR2j0dN1Gg=;
 b=huWHNQEQVtW0WDfD6YR2Otl9iIxHCgz9MII8b8iCvKagHvERrtTVI5oOJTvkfsbuBsZmS3H//7tT0EMd0euCnPvC6owU/D9vNTtmDb9W1syhSuysQ+DL22KAhbD4CyKVXimKNNH1v34YjM8qkXwx/MAQylP+x64sH7ncgsJOZC+xEbO6CXPPnnA0ID9Tqs9Fyzh5SwMtlHiVirdqFPy16MH1z9lAY7kpsZbj/d9iMkfgIkGCj+lyqP62D7Ol2VfavoiMguCu/4qjQ9EUjtW7NoIOldei3jAo4+vBHrQSa6EtOsibxQ4LKqMsNSCTHk8DChA/KFUfCT5meFjJhn6zVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmqZnWedP1AJSXsFtOa8M95+jajfkJOrqyR2j0dN1Gg=;
 b=XTomKd00npGEaCtFnbjajYz2MvW+E5Nu4r/kofz9HaEryHbkwL/9QZQW/OvckmffMCU0q6OQn0+crOyjgmwV2usbeMUZw0xArB4J0yeF0tBJSUb3WC5XFrw0ULUWdVl0nQ7Q1wvNUhKNhtHnweV3NsCa1ZndzX8g1e2ftSb4X+0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB7053.eurprd04.prod.outlook.com (2603:10a6:800:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 12:32:43 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 12:32:43 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: dsp: fsl: Add DSP optional clocks
 documentation
Date: Thu,  2 Sep 2021 15:32:16 +0300
Message-Id: <20210902123216.787025-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210902123216.787025-1-daniel.baluta@oss.nxp.com>
References: <20210902123216.787025-1-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 2 Sep 2021 12:32:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3948cb7e-f583-47e0-9eca-08d96e0dc2f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7053:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB70535B7A191A5432F5F13D8BB8CE9@VI1PR04MB7053.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /F9eJbidpHP+CCc8XR6HBpckUAcS4qRos5+STVGDfNljUVVGpIoI2Q7HKEzaRSbnX6Zm2jiht7eLi4RCQQrYNbTKhZorT4WVeD++yv3/kck/j0vRTTGCnI5s+AgVD+gRJmC1TdI3kLHVaMBBjYMk3ClCW9YnNtF7Uwc3TnFMjkfXXMKThw6BsTkkj0uSkOtmZotaZ8n1MoEq0rYLTXth5q5+pDiVpvMpz3cU7N84+GvRWdY8JCbvd6yW4ChPW7fr9AULiWGfGDvKauQAEDIZo4zhHbdStIzhk0ozO3vE4iaw1B+qe1yfXHkoI5NeOd9xWzKVbmpiirWT4uR2cMkwi7VZbbRogBp5OW/ojAD/GQ1HPz9EtX2KxnBVPWfd8xekaXOMJdNwBuQNrstS9pU3DBIJRQEF32LQWfOFcJJbBnS86rB+hm/ExiJCvouu/6SFyzvMsYrjHHhjvxwAqxWikzGEU8WUzbg4+pn2ZZtWhGKalhp/99XHSMzB1gKz1PKEBze82Hq7+g14pYIGHswB7KB9rNQydV5BH00nExR+Kg10au5m/iX5Qv+7hpnSuC6rckWr5BeKvyjdaRGJoi7PoN9kzLyzAxnBSOfV4C9asj/uYAoS2pJFh7M0igW7HIX9wGgudCz3mwAhqTfLVa96jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(44832011)(478600001)(6506007)(66476007)(66556008)(66946007)(5660300002)(2616005)(8936002)(4326008)(38100700002)(8676002)(6512007)(7416002)(1076003)(6486002)(6666004)(86362001)(83380400001)(2906002)(52116002)(186003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14UjaGr5nImsRoVgV5scD0HWYRPpLHDx+yrj/JT50IkS9QikAF2wJQK176fd?=
 =?us-ascii?Q?YiPIORZc6nS3cEgpNoz4VHPg52/ffDuOH97g6t8Mq8L50BJy/zi5mZOG+rQE?=
 =?us-ascii?Q?S26eD6+DGpQK5GXSUUJ2VNzim3WFPwkeeBokKfn9jTPxZ85LQ7z0H1bmzuJF?=
 =?us-ascii?Q?Z1v5qQJpIEapvoZ4CqJe7vbBp3jIF6HOWXSDCx5BWjYCNhAhOkyRQxG/hK3v?=
 =?us-ascii?Q?lIHV93GY38ZrC5yQEBCFwKd2OaoM2MQy/QOHTjA/Z9VdHwwpt8uIZwmUFsXE?=
 =?us-ascii?Q?jTRXtAlam81xvQijW4zT7azK5vloj6OBZUBlFAkWGrdXlUkDMGfCBjMBB+X0?=
 =?us-ascii?Q?1tovH4+KIdiED7t/+NUtem/TwXVmi756zJxunQPjRrCZnUuyUf0/bO6sM4Im?=
 =?us-ascii?Q?NhhtPMgtKZXkmZ36qtbwacakFdJqfiWqO0orDLkP96TolUD6jhBMJ/VHO+o2?=
 =?us-ascii?Q?N+J9e6DgtBa889nKCrzOkkfEyW/450O2Z4TfNYZToela5dynYwGdFOtuGShy?=
 =?us-ascii?Q?7F3MHDaiFg55rFgnHTPAR8/o3nroRMfbTt4AlJO/kbvDuxfEb1lEoyq3WUtX?=
 =?us-ascii?Q?VVe+qmVtzQynTMXEt5U3czLcBGWXRaNhW5AGl+CjPpYxSO1HnmoWy3lVVpuE?=
 =?us-ascii?Q?317sC6/EJ4eNSsjQfhonLfQnKx3A0MVw9/o5SCcLhWLN+rLaBDj/xrloUI8K?=
 =?us-ascii?Q?UrN82an97y+1Fv5IZ1QnBojkYondCHT0+mK+v/Gp0YHFBnpTRntF28+rm9ZX?=
 =?us-ascii?Q?+GbEksqjXAMQMM5+p0ipbY+IC56Rq7p2kC8x1cLdqYL1Vd/08FoauKtbT804?=
 =?us-ascii?Q?F6fyK/f9MOPAIvPF+Zaj1l3tHK/1TCkDsI8kDDBn0KhE61rOZgjRA5bHYp/y?=
 =?us-ascii?Q?PWfBfClFK1vqUkhHlahYClbpGa3YkApt6P5dB+I3gFX4h+4c7VJKHFXhStIB?=
 =?us-ascii?Q?o8FUBqlVVJ5PTzwIWi8vACznrJLX3lywqjDM23s9mfjK4Ylpp8QHbRszX20e?=
 =?us-ascii?Q?EoGj9ggkYpg2w4j//ZJQ7KtA6EYtqpkGtHGkNU8XXwd/jitB7uOo4IP8WB2P?=
 =?us-ascii?Q?OgL9JC1t4KVYJsHmJU2KstHiwl4hTlIwHir6jCYTg2lHAN9Ym6oUbar88oJi?=
 =?us-ascii?Q?b9BPjvFccaX45bMAOsm11YwTu8HCrYszekkyHe9LnxyJnPorjSBLt3l7BKEp?=
 =?us-ascii?Q?96rI2/m6SKMXxxOrV28X8h9GmOyNBRtIIiVp5k7LYXXBe03cP/xg/lE5qqlm?=
 =?us-ascii?Q?QD1dzQp5yqxwX8LLQFJYNBOJKSBCvwDcLm3eTijYnE+VVQUxcAYaZR1tW5Ti?=
 =?us-ascii?Q?hAfm4Mk47rodqo/Uqh2Kt5GcxwJSVgdaLZCtK5bEWJWfnA4SOdKCc/dKmCNc?=
 =?us-ascii?Q?6AJzxxnC1AkSynHexW6rebE8a4VY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3948cb7e-f583-47e0-9eca-08d96e0dc2f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 12:32:43.6034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WksgD+wLwnty4akcWz4T3tje1AG1qDUQZ1O82mdTvyETaeGXjfRhUMZ07vqnxQ1hgS9QPf3YN8gaWK7TyiaGA==
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

By design we choose to manage DAI/DMA clocks from the kernel side because of
the architecture of some i.MX8 boards.

Clocks are handled by a special M4 core which runs a special firmware
called SCFW (System Controler firmware).

This communicates with A cores running Linux via a special Messaging
Unit and implements a custom API which is already implemented by the
Linux kernel i.MX clocks implementation.

Note that these clocks are optional. We can use the DSP without them.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 7afc9f2be13a..1453668c0194 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -24,16 +24,49 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: ipg clock
       - description: ocram clock
       - description: core clock
+      - description: esai0 core clock for accessing registers
+      - description: esai0 baud clock
+      - description: esai0 system clock
+      - description: esai0 spba clock required when ESAI is placed in slave mode
+      - description: SAI1 bus clock
+      - description: SAI1 master clock 0
+      - description: SAI1 master clock 1
+      - description: SAI1 master clock 2
+      - description: SAI1 master clock 3
+      - description: SAI3 bus clock
+      - description: SAI3 master clock 0
+      - description: SAI3 master clock 1
+      - description: SAI3 master clock 2
+      - description: SAI3 master clock 3
+      - description: SDMA3 root clock used for accessing registers
+
 
   clock-names:
+    minItems: 3
     items:
       - const: ipg
       - const: ocram
       - const: core
+      - const: esai0_core
+      - const: esai0_extal
+      - const: esai0_fsys
+      - const: esai0_spba
+      - const: sai1_bus
+      - const: sai1_mclk0
+      - const: sai1_mclk1
+      - const: sai1_mclk2
+      - const: sai1_mclk3
+      - const: sai3_bus
+      - const: sai3_mclk0
+      - const: sai3_mclk1
+      - const: sai3_mclk2
+      - const: sai3_mclk3
+      - const: smda3_root
 
   power-domains:
     description:
-- 
2.27.0

