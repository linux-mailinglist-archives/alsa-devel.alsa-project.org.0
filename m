Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D33CA08D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 16:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B611688;
	Thu, 15 Jul 2021 16:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B611688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626358814;
	bh=gL2PyweFxEU4mtW573oytrkhuEtMRZkIdGR6ip8p4ac=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d0A1u2AT8Ew/XXzqxSVIFjxOBC6Z3a/0Z9kbk2QnuRR24J3VX1adBARL8XFV62CfX
	 vLzJLQUOyhEa7JOWaLdMNpZ7pJJaygitSxX3tpGoCVqHp2xbTyRlRgUxCs5aXnwFQs
	 3KOU6K+vAkgXG+0q1mkCD5z71EYXIV8cb6BFl6sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91612F804A9;
	Thu, 15 Jul 2021 16:18:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30271F80430; Thu, 15 Jul 2021 16:18:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F147F80217
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 16:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F147F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="e+6I0YIX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr2ZW6Lb1U3f/CRAcJZxzmGPbST1yBNr5pKCYqauqWlYZ0cA5CDp5rMPKPpn16WhFnqGV2YM65C0RoHEG7G6Cj3KcMsC95AxbJjxAGM36KMcmiUrCjnhIXAkvfj68Mi0C3WZm0bA5lqXYLmo4ZXllF+f75bUU8pfUwkelKrFSyquGrrw0XGtjhd7v03IPA9yO7BggGSQYp9uQhK6398d5LVPFbAU5jy6eS6Gex2waEjFDaI/NvuqPppoqn8JfMMj7TCsKygdQ2PqS1j9NnE1ShjKpNhvANbluLjIjHQxoVdplrFXKLxwOb1uxitPjfmnLAMgdOzUhAMmNVYwNeDZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb9XP6PM6JoBIPTIvg7BwRFeSmoX4ol3rPGMVKTn6vI=;
 b=cOIefxD8XZl49tSslZ5MZ1IrxXIO6yeMAqRWSOqy55RIev4Rq1vVcxKbwt81Kwl8wX2FkJXnwOIX/m4r9MaS9uIml03M6M//VsJ8Qxg8wOj+Sk7GqB6Sesg66DkF0ri6hiFBMJMr3Nyr7uigVpRgUS9uG2QFMYNn+y5c5M4knAm0E6BNYwuVd4zPn5qZ+d2cTJv5/COWkBRXjaZLVugjYVpCqqW60sVH3qC/AWxTbt88Ydhu9Y4ODJtgm8S3qPkJXPq7V/uHTBhF27ua/dsh+5dIkRiDovCRxha1+k9+TCCw+jidVM6upvcLIkh3akVwZij12lGNgK/s2WEv9PHBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb9XP6PM6JoBIPTIvg7BwRFeSmoX4ol3rPGMVKTn6vI=;
 b=e+6I0YIXlE2jg2xkkXNkFTE6bV0nSKh+y8OCx05FGE7hKadVS3lNmOoDV14TqRlDdgXtJPkBDNJil69kpeXDgZMe4N8HOCIapcOtCO5EQfiak8q9RIf5hd/Y13b8DRP/L1M80ppAF50+zEnX9fUFOMzA4Ic/rH4uj1qiu60kwlc=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR04MB6835.eurprd04.prod.outlook.com (2603:10a6:208:180::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 14:18:31 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3%6]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 14:18:31 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Read firmware, tplg and machine driver name from dts node
Date: Thu, 15 Jul 2021 17:17:59 +0300
Message-Id: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5503:9f00:58f1:af0b:2fd9:e70)
 by VI1P195CA0085.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 14:18:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e53ebb2-ffde-4dad-f6b3-08d9479b6c0d
X-MS-TrafficTypeDiagnostic: AM0PR04MB6835:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB68351A08DBB7D6FCE689ED65B8129@AM0PR04MB6835.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JqcBzRMlz3MWzx7EIAPwd/mq4dCGpJr7E9NhBryDvXprdUp0P/nwzaXNib7fYbT2t9XdpVBnRr9vydeom8cGN6eUsVlzAUZrWAbCBMwQIK12hY8UB2N3mubuQb1H2+3XQcf5muJZefg9AO1nGv05CJ7GR5rEgvfXDojafi4aQBYYkHjR2h9YXcWKp8lrapi51sP61rzv46aQKb5tPhihBdmI99VFrilellL4ncTFPMnP8HuKDq/9dBitCSkwHf7en+KDF2d6rOsznC9WvY6Mw9ocVfO3xQUQmiqWkLSAV/J+BjfOJIV2rVrMrHCvWYNlZAKIbmIUZXQyAoGP4FEgbNYMawvBRdut/ZLJvkIXFctpizDoTVD0CXwqkfqdzUl8ym9HEu14zWBi4s/3/z4nRfANoLHkVWtrquOpEv7xpQw7arTAlBC2Bv+AmimslUGPubob7jVLZdH7mCkVbuhq0XwI1k+XPCvcZGF7K9eAFvx7hnjhcsXZqUiiz//j1wMQGLg4P5YG8vCd9VKrzkZPnzv3JEyIEEGs4DlQzcnVd0fpmQNlkfX6HXcF2MGHULopx6/S5ED9O7wTv/mdPJe8uDJXVpwiigRAtDaEEZizPCR/uf6dTmRa+oyUQ8aKfLF+tWvrZoB5Rh6dhzuOBBMQTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(52116002)(4744005)(4326008)(66556008)(44832011)(66946007)(8936002)(2616005)(6512007)(6486002)(86362001)(8676002)(7416002)(66476007)(316002)(5660300002)(6506007)(186003)(478600001)(83380400001)(6666004)(1076003)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dBPPCcy9fm+hQ1xRwb34qwoFUBiznrhmYmUfTNwWlozi/yPwSQVmZuHfDcsh?=
 =?us-ascii?Q?iRKZMDUOAwSYQp2ywDrweVVIta6/ydvVUKDzhKRPIMDLHq7OGMqWqFAzBk1n?=
 =?us-ascii?Q?82aqnJnbrVXAMqzCDDLp8t/RgNg47aA9pl7czX0+UIWOmJmXbjCYMwa97yNs?=
 =?us-ascii?Q?eNm+DBL8bBjNy/11/c6WX2lU9ak7gIpcnOr6TENHwtstZrNWqp6GK1YmXN3H?=
 =?us-ascii?Q?o8piCUnNDixmJDCXJlJS7JGxrk6YkwWKjEAcux8/2lVAd/+PxiA++bHkdgm5?=
 =?us-ascii?Q?sgZVkiA5RNHvsVbkK8gxozvwaVLJIQtoOq2xD62Az/NqjGzgFKhU5BpNIcIY?=
 =?us-ascii?Q?iej7AHVTOptCnD2ymXhLZbjPOMj9HzCo9xljm9rcMl8H+OMAX7f+0PIg8bva?=
 =?us-ascii?Q?Cc8I0ST0ffKiNBDUOBxZfLb3bCTcA8UrWt6yjGTNLK+MDx2f/Vti6aqCvI+P?=
 =?us-ascii?Q?gZ1yKM0Yyi84PuceFwO3X89GaMRChN+eyDMji1V229hc5s4tpYQTnvfNd+xH?=
 =?us-ascii?Q?JCF6n5ByuXRPcLX1WXT9gT2MMefoeInbKMLVjUETabElS5JZGaNIQz+aoL0P?=
 =?us-ascii?Q?KlgoV6ja+XN8igLwvWXeqAjaQ9MB47Gha7TW1u8IfG/8oOrbcV9Uk/Q4PzJN?=
 =?us-ascii?Q?qMaJlV8tm5rKqug/EqhJFh0ocg2x0ossnteVg9+We3eknBIjTvEl5ar/YLrh?=
 =?us-ascii?Q?yIzqj6RYxoNjv5lYoHhOggaLCM2IAmAIowDzFWVlObivBhhbNMmQflYZl84Q?=
 =?us-ascii?Q?6TjPKuaCJFXHPbbtSE9P0GhbMygR9/lclZ7MVFG/kmExy+RrUpiW8LkPcsEZ?=
 =?us-ascii?Q?5Ie4KCqsTnVR7z+4TbJuiwn4W4i4cqiOXrnKtFsr4DnskrrdkS8YXNdte8l6?=
 =?us-ascii?Q?G2aya25hnDooK7IfFvkZ7qg6hy6cXlOMcRp+/9lHthOP69GzNrN2RVBA2s7J?=
 =?us-ascii?Q?fOPRYMEAcAO2zHSwYhr0XYj16T2qerXu58UtUx/5iPzI4XQLPrzGBJC8jTqc?=
 =?us-ascii?Q?UA4cL0Ar4j1Q0PdDT486OiShJBxeqRx70GPTOOOjTQyZXlcs/qWvl7NTPaRq?=
 =?us-ascii?Q?TUCVcRzeXwhwgfoEqyWvMl/P6vjE0glikg/rqoJb+abEQ92EuSdswRFw8+cz?=
 =?us-ascii?Q?u/gZps/a9ZUyt3MDCPCGuZ4va0DTGAgsdw+Qg60yVmpfOE8iOit1pv/4xSWw?=
 =?us-ascii?Q?OfTXNj4gmqlI4HXtfnkZWrSx2wAy6BDHKfuhTfznOMzaniyd4/cwkJw5sK+z?=
 =?us-ascii?Q?zC3JTuNI1I9SOKgIvnKcUMLUREigSST0jtZk5846XQqkpe4u6B6fMUWHSENp?=
 =?us-ascii?Q?I0bYqvnhgrxyL0K3tx5f3/3Mb8LA6BTkEcajN2/6AwtxDhmUub87k21FqdP5?=
 =?us-ascii?Q?brET5dzzvPT0tn1tMlrsG4wlPR6e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e53ebb2-ffde-4dad-f6b3-08d9479b6c0d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 14:18:31.0681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtR18kRp2Y7A9z1RO+6ujyvNXaUVJhuOPb1cz+11Foveu45sEP2V5b1vxWfW8ltY2/P23qtDYty55bloAwsNsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6835
Cc: daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>
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

This patchseries adds support for reading the firmware name, topology
name and machine driver name from dsp dts node.

Intel side uses ACPI to read this info. We should use DT for i.MX.

First patches should go via sof-dev tree. Also last one could go via the
same tree after we get an Ack from Rob.

Daniel Baluta (3):
  ASoC: SOF: Parse fw/tplg filename from DT
  ASoC: SOF: Introduce machine driver name
  dt-bindings: dsp: fsl: Document newly introduced fsl,properties

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 20 +++++++++++
 include/sound/sof.h                           |  1 +
 sound/soc/sof/pcm.c                           |  5 ++-
 sound/soc/sof/sof-audio.c                     |  2 +-
 sound/soc/sof/sof-of-dev.c                    | 34 +++++++++++++++++++
 5 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.27.0

