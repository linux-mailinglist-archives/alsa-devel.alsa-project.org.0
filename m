Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDD76AAE8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 10:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D6B823;
	Tue,  1 Aug 2023 10:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D6B823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690878381;
	bh=O6tX+xSMAwOWUTEedvaspx1RKUJy6tdWGWxgZ8b5NuY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Qwbf5XVnMQjoy+N0C3z+dfgJokoBy7uk61pe/vGCcrWrPkwAQj7R+b7o4J2DltOop
	 jzwPU1zzF+ypMcfVKYuqI7oxeCMieDTiVXt7ENUUmN4olvAJjIafzcRt0uwSaWKTrq
	 0wSCiyFdd9ySWZEsC5ThYAkq79+74lVtOW9eIvEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38D24F8016D; Tue,  1 Aug 2023 10:25:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F143BF8016D;
	Tue,  1 Aug 2023 10:25:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19777F802BE; Tue,  1 Aug 2023 10:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE0A1F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 10:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE0A1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=XK02OkTf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiyYx6ipXOydNvv3N1KIG3NeE8dHh9IBenYdgDZGdPIRyj+12IUobZXAp6DkEQOwlxgiOxiS7XEXSZ4WMPo5+LPItOjjqp8vxC35EOOJ6BorSpQCyqldNpt8o+4KYe3wBJp1WuxfgxkdcV2zLi4X6byvZgW6DSbS+RNGG33mAB8IWMv3gQCPjnB42qQWVHxVliARJFAscDs9KOfxy2AyA1xgnSYTYYPCvCk7Rf12HziSq79FovXqsgENVVPhIMLSv8T/e1gSJ69+phs9BjxiSR0+UD8IZVgPhdodHz3se+P6MVzX2nUSVyDvhV61b0WVr4pNV9I2yew/82cqnU5HnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNPNdQ0UYtaqcGqQmsY0QWUUgfKvH5BZddxo3RIb6ts=;
 b=OPWwM1dbmYQJ8c3aCNdPkPOSqpg2VJicEPom+v9guS/pYm88IsWrQBDV6PyNjmfBhjMiYVhRHsjkmwCtiwDNSdG3XeADv4mcpSmVguxM2w2c/5rjIKRcanoF7cu7kOK2/eVg0dLggioJ3VRYiuePGYkfIcAMebBgiFOjHrbOaROHGdXCDnma5u6iM+9XZVSg8qcu0Wtr4tpkm26UNXBLapHfIcVNm3cDx2fXCuUPbKfz2rRF5aGZHbGEFbPzC5ayd+NOHCxTPu8OhaEQLe0baqVyZHJ/lcPr67upwc5GY6MhagkRXibIKBsXG4ZvQSDrBaEq/agvA1u/iOlIhVc3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNPNdQ0UYtaqcGqQmsY0QWUUgfKvH5BZddxo3RIb6ts=;
 b=XK02OkTfoAlvj4jYDfY13E/LqmT9yRq7aEOzMaAqrSHhuUZ0DF7ULKClFs8T/Go+AePf1hZRZbb1OwBDXdMo2OQpQgTpKLp6q7/oQjIseHsan+2RRdHWhVXvmUgBCty1kQUMrEDX/Kura2aWSGn40ywMqnYIBwPT2z8V0BnsLrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PA4PR04MB7917.eurprd04.prod.outlook.com (2603:10a6:102:cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 1 Aug
 2023 08:24:49 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::d4e4:973a:b085:de93]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::d4e4:973a:b085:de93%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:24:49 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org
Cc: kuninori.morimoto.gx@renesas.com,
	spujar@nvidia.com,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	daniel.baluta@gmail.com
Subject: [PATCH 0/2] ASoC: simple-card: Introduce playback-only/capture-only
 DAI link flags
Date: Tue,  1 Aug 2023 11:24:31 +0300
Message-Id: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::21) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PA4PR04MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fce1c0d-8758-4474-1fb1-08db9268c55e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HB+e1WwwNGSSu7VnQKCLm6+CbGrHdUMV2waHPmsazu0E7HT23V7NkV7zN476avTzBxNJb8WbravmdLc9M5456VXpYgZKQbzezTrRQpNyqDVSS7BbawJUFU9ry2FL0G9ISjoThaU0fPcuDpEZ+uVDPVLpqAQuBs0W+itvXM/Tez9ssMVYKF9VIuhw13NwVjB4TJpKA+NisSIJ46N4+ZFFa2LSH+rgbEdcgDbz82Im1TD33812Q2YSOfKHDFStvwCnI6mF/7gStvbJae2RpTyHhNz9SoQbvtDlRIlXZsFK4uM8YXaPBjruMrvoHZZslB6UyKbyyI+nv7Ov5PiKAAlaHEx4u869ixdw0jjOUiqbzlEPE8VMejk/k6BBE4TtE4hj2PHVoKeD9CW49ROwv+K2tzF04iIN93n5R0WUhq9Vuz3LikgvCT26j9DRgtaSH9OhoivQsOsOsf0k8y1PkaXbL9PWoB8x0ca7rVpMGqQ1sY5MdOcEJ2gAKBbopDaoLrKQz6cqyOgluJDI/rW/VyZGgEtk7CDGY88Fau9bkMQmkRvXsbVZ+nmEZ8E4T8mEocYODa1gmsEKT/yI+1BTdlFFSWOgctmxFEESdvGLb3X6BDAtrGARV+DlpO0WpZYI68Ej
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(66556008)(66476007)(66946007)(52116002)(2616005)(6512007)(6486002)(86362001)(38350700002)(38100700002)(26005)(478600001)(1076003)(186003)(6666004)(4744005)(6506007)(316002)(41300700001)(2906002)(8936002)(5660300002)(7416002)(4326008)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6+loaax8o1wvasaL+REMM3yV+NrL5PTNYPu2l8+cTZyfum/4xZX59O2AG6QK?=
 =?us-ascii?Q?oIr43D0gyGXInoIIHjLy0woUSeAm1zCyhbf3m8m/Al04bpsSFEgdrRuCxX0h?=
 =?us-ascii?Q?1L1Gaxqx97o3EGxfWmMfYkOVsZ2b8kOXu64s7srfpOYYL58LvMF/DxlXTZcp?=
 =?us-ascii?Q?S3GJdMjQ8sJWJldhiUyjaSVhWh9UE7QUD06K3TlPAy9RbwBAB+O4veo74F/U?=
 =?us-ascii?Q?mwPzkx17NoXgrb2S9/P7CLCIi9RJyE0wd3iZo1a34oQOd+wkyVN9QuOTi+3r?=
 =?us-ascii?Q?8EYHMllhn5PXjrAsOJ9VwAKrxJ6RFD215KMl87F6SFmsNMXWma2pGsSQUGq8?=
 =?us-ascii?Q?qARTOnSnsczGXUEXOeC5BJAYD6spj/L0qgSWZNGcXy2Vbt3w9vQxi2BY2h4o?=
 =?us-ascii?Q?6qbB7loSHQ2LQUv1pHGyH10UYfe0f6hyXYLvNRV+KKBPq2bhYfRfflLlj0gk?=
 =?us-ascii?Q?YOR1R91NuEKhgyCn4KRZG2Xca2Q5COj9G2AT7Yt1Bg9Xj2cyBfVTEg+cUBNO?=
 =?us-ascii?Q?TABzpSip88BVMOE2tN5h12w7+3SUFlCJgVKq5QUucVnXQlResF4UZ1mkHXhB?=
 =?us-ascii?Q?4rx5IdSRFP56msXFxDkeGhdY3pf8gPm2hLUP1bITTpRYo5BLZri4qLwfcDTH?=
 =?us-ascii?Q?Hb2M2SqZ3T6mPRsG45wZcKSu8xF6liVKjeZeQxPhi2zG20qlZerV+INZnaOw?=
 =?us-ascii?Q?jIbhF6r+9o8OuKNkg5274X78DSclmFzyf5ilLFE8A8rdRqauNO/ro3EAgpbO?=
 =?us-ascii?Q?jUTxkeSv2UB8Sfr1O1S7LHoIahTCStBG71znXYLyJXkRZ7xsWPg7O2phBOM8?=
 =?us-ascii?Q?gEinGNjNuCKWbWm5uHOllWKEhYD8g30ChDTrIpOSaAzDLY3WeMSwKcOCBu2S?=
 =?us-ascii?Q?vk28jfwxc9wmrdc/2pOf6OrP6h11GBc9W55uhxHuhQOQIjqyugSn13lfFL+E?=
 =?us-ascii?Q?R7AbUW9qCz5OZQZb5SchCpEU3HWagYqgIlum06HB2Me8P7OW/ZNligKjhS9j?=
 =?us-ascii?Q?pKUkuMCx3+7dSswURmaHsBx5QHuVSl7Whl2tcn8cWvlaj+vNeOKIKqc/EgeR?=
 =?us-ascii?Q?4lWmjG84COtiMmHk++8KNw8lkxOB7/i7vQ19JCOTUwQNQ0IDUKzVd0Mg1mXF?=
 =?us-ascii?Q?JvCkdfOjYC8xKwf+asEv1USH8xMAszJchrKhPoPwvCL9SJ4WVeUGXji5BmWR?=
 =?us-ascii?Q?Mbj/hwmb2o7m9SzXD5QSxymPcoxLSeSJ7KjbXdXz9V6uaUFGnD6cpVZmq3hv?=
 =?us-ascii?Q?ETOkFdQemKZIRG1ShG4ivwFhDgGE6j3IGwHaZTQ2D1ic2rY6Qf1QHrGL9vxH?=
 =?us-ascii?Q?Btm5Fg3RaPZzYbG5/ezQwPKCXy6JV6TRXP5/8qlrSP9LtsLSKuLFFtNpyDys?=
 =?us-ascii?Q?3Fmsf0reTBN9DEG3h9B7IeFuFB6H6VDFPS+shyzDNV4wBeI76yuqdGRNqxPL?=
 =?us-ascii?Q?Z6qUG0Rc9fgWdjfYQToyK22phUEmR5Nd3hBFzEhP7ZAdf1ZrVgbyf5xKOaah?=
 =?us-ascii?Q?IpHZeoBXCF+3TQS2kiOOFHWB+Qpes45cqtFJ7WcFfA3AuDqh34smb93mGu2x?=
 =?us-ascii?Q?6NoUN3Zkqp2Cw6zRNaPfzOjI58ZWMz5L4lHZmaLJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fce1c0d-8758-4474-1fb1-08db9268c55e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:24:49.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3K4QsyY40xjJTAlKA/x5sofrsTK2ZR6tZEknvcqayCTXfpz+aCg1p4JTl6hkvQfsQNez9Efs6ShdRMiv7qDeEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7917
Message-ID-Hash: T4KJVUT32BXYP7FKC6CXZPOGYUDYGVUR
X-Message-ID-Hash: T4KJVUT32BXYP7FKC6CXZPOGYUDYGVUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4KJVUT32BXYP7FKC6CXZPOGYUDYGVUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This patch series introduces capture-only/playback-only DAI link
properties for simple-card.

Daniel Baluta (2):
  ASoC: simple-card: Introduce playback-only/capture only DAI link flags
  ASoC: dt-bindings: simple-card: Document new DAI flags
    playback-only/capture-only

 .../bindings/sound/simple-card.yaml           |  8 ++++++
 include/sound/simple_card_utils.h             |  5 ++++
 sound/soc/generic/simple-card-utils.c         | 27 +++++++++++++++++++
 sound/soc/generic/simple-card.c               | 10 +++++++
 4 files changed, 50 insertions(+)

-- 
2.25.1

