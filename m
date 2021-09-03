Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F99400196
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 16:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBDE18AF;
	Fri,  3 Sep 2021 16:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBDE18AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630680969;
	bh=5O+5rNVRK2yomesK3Jeos6gNcZNkGxMS6gM106SeZZo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWiHxMD9qNaAHNMs50uvrYNdQzMrcsFn2Ywo9mucuPL27A2iLVjPepKLoWvKrkXbU
	 TtaoH+DhZ8cn0Xiq9yDDWNYi9s8/sMeNDmo37604voyiRYbqV1y8tUDGh6/dAFo78i
	 1G66CAV4q2yrwlHzF7uTUWzDydPff0WjR1v1pbUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64AB2F804E6;
	Fri,  3 Sep 2021 16:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A11CCF804E5; Fri,  3 Sep 2021 16:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9102CF80254
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 16:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9102CF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="TU2Ikxin"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6/pJMkHzmGb/mAa1Ve0zCBRmIcUmmToJ/PaatYvc02XmXsNfhN3tSDpXozUnPAH5E/Sie2eC8GdtsOvU/vG3a5ElKWVPLA1KQzDvZHiwb7EY0omd0Tg90OwF9XdEUSArWFMbQJh+j1wvo+L5+bojuhfRYqJs6jMVdpibVhM3iOinkJcSzzsCCZRH605kSqg4Zi2/t4VTK5kshztCHE6SoEMucd+VpjCD5/YsMMI2B5Q7258hDm/VOjEORXr2woIHBctUqKj8d7XxLdAGZQAoXvkd5dxhE0mBjmJkCj4D3foeAsaj4AQ3GMsmZhH0kdKVFD9Mwi+RHRBXeWku6EEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KmqZnWedP1AJSXsFtOa8M95+jajfkJOrqyR2j0dN1Gg=;
 b=aQUXdUdz4mwQ1MT0g1aoXsEMUNbCT5nFXRptfafpKWprDXr2arn+yYwB5XJxDdkZwZdhJ1CN5X0NP3pGkggrtqc64XEHxQCnRGEhRxVPPtg1kVDxyi9abibkorHgRrZL6k7UMNTg+XkUs9nIZzVH1U2ryVkfSOO6YgEBinpO9Nr261PRvbkghWhTdURdtmVvI+o2NfMhIIyxlwbdsXFkIB2VPJNqOJeZ2EgsuBPqAj0qaIRvjqmscElt4BtH0StF/dVFTZCxBwImBw6YL7/1aCfyA02QvsE/Py1+PZ4lZE/itefWonHXighM3TQ4yBjYph1PpF7X7sFUugfszMyA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmqZnWedP1AJSXsFtOa8M95+jajfkJOrqyR2j0dN1Gg=;
 b=TU2IkxindeWmaBueZEe/s+l4uwc9NOKkSnZmU5e+D/Z9Al5FlXCcQGYY+iF401bgso+wrD5lwKbQRCVIn0hOMlyhgN+PspDyDDxy0wtKP96S1SRb31+tXpU6dlxkCjfFtbiT7beHW2lvZ1NN9JVGWMZXjEqE23HyhXdyC7BevHg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2654.eurprd04.prod.outlook.com (2603:10a6:800:58::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 14:53:57 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4457.026; Fri, 3 Sep 2021
 14:53:57 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [PATCH v2 2/2] dt-bindings: dsp: fsl: Add DSP optional clocks
 documentation
Date: Fri,  3 Sep 2021 17:53:40 +0300
Message-Id: <20210903145340.225511-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
References: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 3 Sep 2021 14:53:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8abee408-5033-4f3d-aa15-08d96eeaa7e3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2654:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2654FA98D33B2A8BBB4880BDB8CF9@VI1PR0401MB2654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1EwvMrtVhHdmZNdLZ4B5I6XfCApnMAfBFcp84iMPH0gMfGv9pe18u4j2l1uEOrC4t3qvQhvx0aUmlG80ebC7ygdOX0Kb0t8gkFhvhC1tXTRNjE5qNXTtQBG9LNOzy/Hni7AjPeucTH4zrwIU4exjR6AEhaazZyQSgfAZMcr++vjge6HZmJ9ES98wqbDufuCZFVUYs+tzfX8za7+ns1ZbrrZ88pM/rnRI+uER1TSpND9Kfx4kQSq8vCo9tJ0ac9Zm2aljL/Q16wXCtrOO0qt2kYogeYsq6CeuMQJ6Gi56/O4xZaBVi6xviSRBqrYr9yR5oD6rL5xpCQgivTbCZlAi3uxaWbyfa9SZoJnUoi4+eZaWny6xP2D0XN9U1yQvjvWEAGEb2L9hx7lQ5FweFbieSE0Uy8eKn/LcShqlnCgIP/AFTEthRXnGHQ4YGO4K5TCYV8Jbks6jJX/b8mUmKrwl60fAnMr4cn4mboq8pekodeczX0wD8rGWcZr/3u+ZecHSFob54tut3tEjEooA0Y6tx7BgKadw7n6NBZIXWCp+XvllFJrx8M2LVzT54tPdyXV+znSFd38MaYmudWE8/BFdI2gK+Chot4pk8RrQIsFz67IvlxUc83v9zY8EZcTINRuMSoqkoTHeHkLF0JuN04I3zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(66946007)(44832011)(52116002)(6506007)(86362001)(8676002)(6666004)(5660300002)(316002)(2906002)(66556008)(4326008)(6512007)(6486002)(66476007)(508600001)(2616005)(1076003)(83380400001)(8936002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8oFI3p623F6E+R0PaY+ugG0iPJwNUpJwHu39fJcgW/rMMfxfHPP2MyIpbhLM?=
 =?us-ascii?Q?3a9ua/HFLpq0b/6A+2bgTBj0/mRwry3YN2rEuHfjZJk5IJGGQvk99586VGQz?=
 =?us-ascii?Q?rotKw51xIugNPx709kI4VACtFY+liVw6piLEkoSozxDCcvvi8O4qQBvqXl2W?=
 =?us-ascii?Q?UXH4G33tRQh/FYlGvkxr0AMc+PApG79n1H/V3cU0mhmflk6jYaOBPDKkrt9N?=
 =?us-ascii?Q?HH6bCqOKl6zkdboZZq3yV46ARfefe3J0wGQ3LUMRGXkIyckFVhMD2+tr1vZp?=
 =?us-ascii?Q?05g+JljHnuXaAZqDGtvNJ0YgP7L8GrNGaVZv0KgwW8A+yGPr21ejyghk9/PK?=
 =?us-ascii?Q?wYzo1YzQ8kJQ1P88ZCPSpWeNf2Mwqm3JUJhMKRc2lyce+p437Gt9zlLMq0/w?=
 =?us-ascii?Q?6VgEgqsI0bkAYCHOQlOFr26UZb0LAYYjDLDJ53r1MfcmJg2c6cSdQuxmjosR?=
 =?us-ascii?Q?OhCA7SMZ33lsNKpr0Q6Sprpo62KUHgIuHUk++OEvLHH8dj4Gc2bT+LmKT6jk?=
 =?us-ascii?Q?vK07mtsG5RLJEnBxsRSaXN7b4/YyQ0fypXWq1NcbPxZcw6nNa7ni7g/ksbu7?=
 =?us-ascii?Q?FUWRjEcqnJ4qKZj9VOjaJs2YBIyRA8eUeiNenxnT89VvFYcpc1CnI9GmmYiy?=
 =?us-ascii?Q?V9T3vcMZz8NG4FfzyZme6oCgAxGHAHvBOAnIzzo9XtJp6fh/io2dlSgwxKWz?=
 =?us-ascii?Q?XOSlFCWAjIw3mBb3MRM6bHeHY/JlnX+8vEZPRLI4Bzq9if0kBGFOGj0HuqnL?=
 =?us-ascii?Q?hLPsYVbhkbf+ltsN6Iv131ZvvaDLtAk2s5a2QUjRskwp1ImfsXbM0oXqxuIm?=
 =?us-ascii?Q?KY2jRSOLd38pDU/hvWJRBY6OPAGO1DrPsybv0hnp0DN+qfufjoUDZ3h8v2Et?=
 =?us-ascii?Q?neKnQQaobtr8ahcr4x/bVgZCOttW0eAWcWiDyv0zo3ncDWPAsgrVcs/BYZj/?=
 =?us-ascii?Q?Gq7vGNbnbB7hIa3uIUWVyIZL292WAphfHb7N6agEUDND3pNtvC/PPcAZhOGd?=
 =?us-ascii?Q?wVksR0j/GeaRPMGRDnKfjXgTSiXoxF/iMbMlIodxcDxDgaWgO4f165z0JxZ1?=
 =?us-ascii?Q?/56G8/QT1QsdG06f8AbyFmJLECNjd4xgKeySqjQfFCLgv0QUb6nG38tiOrrx?=
 =?us-ascii?Q?SZMsKGANkYu90gqVINCez9CDWaaOu3ET9qllPbN/NzIM7ofF7dlX9YtdZJuH?=
 =?us-ascii?Q?/QEIYqh7EIXlT0gaXu6fDt0ugj7W9agm4px12yDTRBTzH+Mg38InoqDao5o2?=
 =?us-ascii?Q?9YYOKZz15xOg/eZnSYAFBmRTAOQnIz8YliDF4ZrSXaTsiGKzi/vRK3aZ/Bih?=
 =?us-ascii?Q?IJiKBqqua9pwgKuNy1XIa1yfhCuv7PCraAy1JqaC4zLmZy2ft4MtO5NnIFHx?=
 =?us-ascii?Q?Msdf81v3VYU42rplbUluEJf6R1bD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abee408-5033-4f3d-aa15-08d96eeaa7e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 14:53:56.9532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbDeJ9aPbWwd/frx9RPMbFQYa2GxfGhHi3OEVtbU4sFnxXBMfk9Iqz56iB1QdsRTMuAhRndGNYlDmHuGaeIh0w==
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

