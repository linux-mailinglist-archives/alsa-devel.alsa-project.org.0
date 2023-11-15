Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277087E6BDE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 15:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3343100;
	Thu,  9 Nov 2023 14:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3343100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699538447;
	bh=JVRlUW1eUT8VZ9sc3IAyfjxKMXkmPoWRYXnkT362Enk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nftI0zLuuRPhkc83xyNq1F+wYP98AYQTcdky6m5NIIVcByUONStxR2v5IySpXEH8x
	 BsMS9dIzII9Y9tlkI6XYLHuCZ1LA1r8vmGZn3mIjklb01oZi8gfbPnNQHGwFHk4yMK
	 NGKmiY7IYT3Q/X7AyI9YUAItadPuOxO8qORKxTP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37F3FF80558; Thu,  9 Nov 2023 14:59:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8776CF80169;
	Thu,  9 Nov 2023 14:59:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE5D7F801F5; Thu,  9 Nov 2023 14:59:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16453F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 14:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16453F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=At5fn7KN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqTGDH8fEfNO8pd1kBqeCvTwqS2VxeKcQ55qpWLqfEcvWDV7U4YP7DzDDN6qWI7PqZceGHLP7XF4aAQkGBpMe6cNmqnPJ3fQ+z+bmExTRc4RCeoptBdqAUx0J2aUl5BDWap7RxLe7SSYWuImFgtDN/d7mb/nBQUG4YOTV5gj9CzX2dk1VZT2glBVy9InpHC3aEAWNdjid5qft9BYJE85DRtAV0RWMWtK2S6c+hSiubHiry4edC4oWdl7k5UFrzu5y05RLp6jI32sxfYnsIfFPOh4hhh9YNwOPkeJUPt+MO9jXdd5xkWb6/zAgpd2QQQRQmZ1QgS3kWQO+NJtgG6agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxeI/GMb7l0efy0rV6hfftJX4t/cDrnLOJ7BPtywm9k=;
 b=QLo62tidjEV235TBVvn5MW+yDiW0uT1JsfH+peyeIQ7ovSnN3EjlcRz5p4DlW1RF6uSXCzItRwGhxGnAxHcZrkNsKWPQXA4KJRr7fPQuFC29EamQt6Nq0uC1Kg6hi6TIGhkck1DVZ3Wu05rvdndzuFHUD3kMUbH5j+/KK4s6N/t8OFis1TRjzQPuBORLpwFCVWdJ4VHKwIvIrqsuZIuYa20+r/SfwpcZ+UQ3nEqW8TdFeBL5qVDeYfgN++duzsI8QeXlz7JAHThR3OUuFTqpIMr9JdCdlZXE2wHsSRsQk9WLPqYB0efL5NYDd6zmo5Ya17UvV+x/0W2ERwtuiGcFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxeI/GMb7l0efy0rV6hfftJX4t/cDrnLOJ7BPtywm9k=;
 b=At5fn7KNuB5nxszbOiCg8sfOjo+K09gNQdtRwFhFco505oRBvZM5aV9K/8sgDxSH+1u7I8sFOAxQisyccSTAql541aV+PS5xdR9N+TW8gTGvRfX5+0cc3yFVhzV8lLHYUS+o7RniNwWVcRKqUvaftQH29AN1n8oqMBaGwhz7Pn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by AM0PR04MB6867.eurprd04.prod.outlook.com (2603:10a6:208:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 13:59:18 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c688:1f14:2ab1:c78a]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::c688:1f14:2ab1:c78a%4]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 13:59:18 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@gmail.com,
	kai.vehmanen@linux.intel.com,
	linux-imx@nxp.com,
	iuliana.prodan@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: SOF: Add support for MICFIL PDM interface
Date: Thu,  9 Nov 2023 15:58:58 +0200
Message-Id: <20231109135900.88310-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|AM0PR04MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: a8edec26-6dfc-4d14-6275-08dbe12c106e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	swtlBIGmIyrQBvg20BtebAmTo06GHVj/BtjB079CSsRHG7ZdRaTVMB+9ozaj2QJeFzp8gm2XLiKhy4oz9SXNNkvuyNe6j598Mww/QDuTlnxc+WcoPQxlfVHHNwnbuB+cLqrBRDrTotjQHb1NdU3SrrO+coOE5BvZstsYhSGM2F4Np1yfRCLtoXbuvHktbfBxpGPGl9zXdeJAySjXP1v85kd0RUmNjxk80u8r/PSWWhLzRWlS0sOfo9w6AhwX6V4bRq8WRxNoB/T5y4gZhoI2iYESEExM3FZromsxsgnUbq0L7IA23Pd1FEp0bvjoP0qmg70ciFvBfhw+LCVl1cDG4eDFm7+XqKkVMsn5VKLv131LgaXFBL/8MicajDFkGL/WbH5CJw7ULpjWTHGRUEa9tRWNQ8pJOeWUtR3fFej3FegGtIKYn25n3arkOszFDb0Yc95dL06hPLe9kXvxXZQK5gRXi6eW8XMABwu+1t9phoBuONhzu5QNVmOXeLe5zQJYT1iFn5O4JX9ttfy5edYV9ZKtlYrmqzPMYs3/+N41oKksQVf6fkzkqN+KLcXG+wFBh9ly9IFpdSkj4xxhmjoM7ctXbzkKlIoWBx0go0uXmGpkiqvWsskR/kZ/cFYmJCS9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(316002)(66556008)(66476007)(52116002)(6512007)(6486002)(26005)(66946007)(44832011)(8676002)(4326008)(6666004)(8936002)(6506007)(2616005)(1076003)(5660300002)(7416002)(4744005)(38100700002)(41300700001)(86362001)(2906002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?54yfgZ0LbEqm3OSHRnM0LQSPsFowYEKLJzEJVK9QBfNJJsRmUp/UH+7RH5q+?=
 =?us-ascii?Q?VZ/1kn/FGvePYE/T6LjeO/RncoCoZ6FzsJ9hy62+MD8bb9rEOoni1XoyDY6B?=
 =?us-ascii?Q?PmSe0sY1ikbTzE0ZFpMgYju/vcJwr2ZM4TN3gNSF5Ww/1OVuZOg/woQY63nR?=
 =?us-ascii?Q?LOwQLjF0xYo+e5MUv4eeMMHzj3oet7dDnZjEsW9XlYUpXq7jNnDYtonBU+zP?=
 =?us-ascii?Q?1w5M1deCA33S8uYhVkmJLSZwXj9Ihkq9ChcWaWpfV3Za5EENsZQl2WLbuoOd?=
 =?us-ascii?Q?mMhyH8aeyYHPP7F8eP6po0UyKtomZMcs1gU4pGZqScZiA458pyB+teRCkDVE?=
 =?us-ascii?Q?0pD1WZg2OAw+k1a0X8NPgK+JBDeGdKKaVIWxBkI/2jtFB+wWyund2EkkiILV?=
 =?us-ascii?Q?VsQtdZRzLf7fKxSXVxW1athsX9aeBM2aWyXLH9HQDm87l1abW7ZxDYPDwoQC?=
 =?us-ascii?Q?wJFEVPshXZ4ryeMj+zsjBxouxZbLEMaPWHlo2Ca9PEr1Sg8xd+cKnmhquidq?=
 =?us-ascii?Q?VwotWudASLZLBKWMbQNrcZL3bB3+EK0JmP2TAMncT7aTXJWKordAhQOtpf34?=
 =?us-ascii?Q?qHHB2YERFLJZGuThx3Lc8Of83cSfSFTDo6PlmuzEBxg0WdyP0Vlk+vV/4dx+?=
 =?us-ascii?Q?lic9d51GUjpovDDlHUZsGYJ1Mj6cMjXXNY5sAl6dyZbRO6nJICS3bICfzq08?=
 =?us-ascii?Q?Jh8dUJiUuauv95T0RSmw102QE4KVY+mrkcnnu13My3CITOUduWqN+q5pzJWz?=
 =?us-ascii?Q?dPPZFmaXUPLk706QTQqOhOG+2SlWPMppOVvxVjXyunObwE7isWnwWwaXE6nb?=
 =?us-ascii?Q?Cu2PO7fhgZtke5o0yRWVmYdb8r27FRNeVmw9hEefmy2/zx5qGFoiB8gMOpyL?=
 =?us-ascii?Q?zkMfgYPKcztgsh4qa1IaskwhLUxTUTmsEqARASwE0GJnqcvSUwUhfMpVUiEo?=
 =?us-ascii?Q?A4B7hjBbg5qoC1m7J87MoFEykQiS/ZjJCDL4vitqLrJQBvVrFc2PDkuhhXMZ?=
 =?us-ascii?Q?uZ1sXWne2NzTzJEaGHL01v0rhjme8q7FM6tQxZPihSdAt50o18LirhUH4grm?=
 =?us-ascii?Q?Ex3W4BY6wbUAC0nSmMKhApSrhKy/I3DGKWyaqyD49CCiUBwMhvVeigjVoCyl?=
 =?us-ascii?Q?lz/vH+NrceKOlXGzf1xqrchwuYaVTVp81Li0c9/0be0XqDDPZXOZXyM1+zn9?=
 =?us-ascii?Q?jz7KkiqhAeVwRZ7/5n3UTnaPHorouYww0EoWGd0RVZx7gEijX+gG2GTyPTLo?=
 =?us-ascii?Q?P7MKVIEZPytHD8soFRGf/yjTSAYQ6vM6zw89fKHkxq+xsvkh095ACanOYiBB?=
 =?us-ascii?Q?xZtVARGW8CgYpkpEijmE2P/9dwC7wKVRuMtshT5IDgNp1Hxv2zDhnjejYeWc?=
 =?us-ascii?Q?0FO1OC8StTCbHFIiAN6R3Q/tf//nZyWWCO2C7C4g/BKuwWz2/z/gBZwbzePv?=
 =?us-ascii?Q?9ZJaqaezcstVFcl1T1uAgyKDq8gfHXH4h1v21Ltv909aBSl55XjuVL92UIMc?=
 =?us-ascii?Q?eXiBUSeanFpbHTRAXg3uoB+q6PUw+Q6+NUar2E1lkec3v1lMd1sLhi5jysgG?=
 =?us-ascii?Q?uULR7NTYr3covxUVVP3MFctSiYzgyIhMyVehflEP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8edec26-6dfc-4d14-6275-08dbe12c106e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 13:59:17.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S9PD/hH/XSq2zpP3xOwuEDINCehteJG+pb87UJ1CfTxsZvp/uU8V4WnSfIOU+3Kw6SjDZp3/9ha+Pc0aOrH6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6867
Message-ID-Hash: FWP2MZPH6WPJC4GBAFG23RRPIWR366RF
X-Message-ID-Hash: FWP2MZPH6WPJC4GBAFG23RRPIWR366RF
X-MailFrom: daniel.baluta@oss.nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWP2MZPH6WPJC4GBAFG23RRPIWR366RF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This is used for configuring MICFIL PDM with i.MX8MPlus. Tested
with 8MIC-RPI-MX8 microphone array.

Daniel Baluta (2):
  ASoC: SOF: imx8m: Add DAI driver entry for MICFIL PDM
  ASoC: SOF: Add support for configuring PDM interface from topology

 include/sound/sof/dai-imx.h     |  7 +++++
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/tokens.h |  4 +++
 sound/soc/sof/imx/imx8m.c       |  7 +++++
 sound/soc/sof/ipc3-pcm.c        | 11 ++++++++
 sound/soc/sof/ipc3-topology.c   | 46 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h       |  1 +
 sound/soc/sof/topology.c        |  5 ++++
 8 files changed, 83 insertions(+)

-- 
2.25.1

