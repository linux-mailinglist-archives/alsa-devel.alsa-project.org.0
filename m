Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7B95AF53
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BB74E;
	Thu, 22 Aug 2024 09:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BB74E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724311923;
	bh=GwoECC5qJvEWTyZZhz/XH56GIum37wu7VOK1nkF8dsA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KTOSCC1GKF02RFWe4Hkqpb04Ob1d/b61lF3xt8FxoeufvONJPpD9HcEGyivfvw1ie
	 38TU4EP/mSlGUcsC7Q6XzBMuJMjhym2cw598mBv8foAWFal69ZBID2Ni1nXCssS//d
	 GebYlYcD3356RHzlhFSmZ6kycE3E9bY2KXKpS3PI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DDE4F805C1; Thu, 22 Aug 2024 09:31:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 562ABF80517;
	Thu, 22 Aug 2024 09:31:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C75D2F80494; Tue, 20 Aug 2024 20:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC888F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 20:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC888F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=WId+URHa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc/3+66IAgb0Liye/AvY3s30abaKlhTaZ7VBvGj1X672XjPbNortqwJtlCs7UuTPa4q4T6/E4K2bAzQHWFjniRNHiIABGNsKpX+osHE9j/8PLDUYmHc1utyvba2zq9xWKney/MI7QvRxMnxgJ38h9bSEO25x1kx5YjKHnI0Ar3c115HOszHkuuuiuizuQo77YePsW3hiB3EE6JwY2Badhi6MnNZRx7EEYXXub/Js8XqIhw8C1zSfIYBckpgCN/LT98gONNDy5SIl/bugxQ0N7foN6QCwtop4yuu9vnkKgmHT2B1hFd1BPrFc7mw1jfSMxcHjS8aQkOyz+szRI0UCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8baORaWDi2nobfRgi0e7MPQuVxpfNLTCo8tOqdZg03o=;
 b=k2c1RFZa69E/tUtWnYL60VAvPG+97HTJuYBrvlhu1TLZzRnKSeX02AeS1Exu3l0Ov+qO1dPF4FRaYINxXfIsK29pQgxhiJb0K7nZEhBD/ArwegLTClGcJ49o1DBqIP+YIypOC2Famm10cBZ/JDtrtqQ1wucFf6gWz8nOrNrvVFvb2j7HyscZzcuQ1YaQLE4cDUIdCj5xT71x3MqVkn3hAsPJbfR+esG+epZesf4BNvO5XGkhU5q63lHpeyymabpteLyQhiX+eypCDy0RmdXqvSpwN4VF53QbNu2WnQu+f/0fF+Q+OzIDB1SaqnSs6rkF2NxmNWBc76XCEhyzvHWAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8baORaWDi2nobfRgi0e7MPQuVxpfNLTCo8tOqdZg03o=;
 b=WId+URHa81Lt5/83406Ulv4iGuB6+PkijiS/E6XdmDWUOk50sBELBWhOSE521cT6k0Fz7HFqb0LQEOkn896f+MT+CpIv+vSIRNkbbHE9ns6hYbl8+BrNY0lYZUFV+IlPn4mCuNBdqFeVMeieuQDk//Di/nezW63FJxmlCZv/iXC0g9zDpgBYm3pZYN9f6qCwkV2Q9CBaHIlvQ1mby0OBAUXXc48Payy3Y/LeRc6LGUVQUHoI7FxFsJgpAje6o7S7iaYAMD/heetoewFvAahR2kH+3kogq4ixy/C+yeSGus3nB3AwiaDjo87TDjFd4H2NhfRwpOfwTUJoUBjgkaLJcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 18:46:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 18:46:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	alsa-devel@alsa-project.org (moderated list:TEXAS INSTRUMENTS AUDIO
 (ASoC/HDA) DRIVERS),
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] ASoC: dt-bindings: Convert tpa6130a2.txt to yaml
Date: Tue, 20 Aug 2024 14:46:03 -0400
Message-Id: <20240820184604.499017-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: a126eeaf-0d79-438d-aa0c-08dcc148623f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CidGbt40IRrPGlfW4dLiDmUuZjUPt7dpFfpvv0Rzrsc9A1yk7TQR9+5npiEP?=
 =?us-ascii?Q?O4qMTDSuxtmjSeFPKcXiN95cchuY91IBWY5DwxG9yTZeqDWHe5NxImk5zg1Z?=
 =?us-ascii?Q?SrTpeFjk+h/4wBWruBJ0JCKQMMf0yUypSsv0fcJbTGNkT43K7t+J7+va8wUk?=
 =?us-ascii?Q?MKdjrJ9HwY4eWmxZyzMgd52rSbfl00A1s5+hMh9u7nPEmza9VyTMZEUQpvRO?=
 =?us-ascii?Q?MC4XVXzS1eFtAIqphQBoyUCYHtMW2ZmD37MNBFpmQM24ZBtSu3NJQCc4xhcp?=
 =?us-ascii?Q?JVpC/feSuht6a7ayI/PVCoO1Yg7KASsSZ4UVwghS8ks/rlMiL/UmCYrJWrLO?=
 =?us-ascii?Q?8HJV8m87Fr0IluSHtzpmguvVYQmgxY9GXaDMn9/TxbLs1dD1Mh54E6JsdoPl?=
 =?us-ascii?Q?XvyXSSjDAn4RLLdlcdZKf3UZe1H3j8iOnSGwMOtfTacain9hDV+TeufNzVTB?=
 =?us-ascii?Q?OALNPbYqb8/8K8+W7PT2GPEPo0CxpZVrShryRJxwPzmoe/4ZMeX1FGwlfGD4?=
 =?us-ascii?Q?0kVriifAGcnJA1NlTGf37JlrGToeEnEZAGFCo/W6Ziuie8bfADyewaK0I5L0?=
 =?us-ascii?Q?VcJ9lQ+lx5I85sbHSGVYZraiQNuM76jhY/DtOK6dOCg6XC0i0MPXF/tJOv0Q?=
 =?us-ascii?Q?J9QaBH4wr3kkjve0g4KwXwd25p5g853YvV4jjmTUZbkQvsyMFL/xCXcHUsVu?=
 =?us-ascii?Q?J1a0BXticgihZQ2aBl7RJfpz8cpbFJFmzjxiYBbAEdDW5GdvGKIb3dgfDbrt?=
 =?us-ascii?Q?VmR/3JezdQc3WddUAb5pp4Ht79qG+OnbU04sIJ6RNO+Htth7kJ+7q572oeGZ?=
 =?us-ascii?Q?eHcJTVYRHKvpwFIR5gA9oIE0dxqK2fdJhFqLGwrZXSIIhYodbKKzST/0s23d?=
 =?us-ascii?Q?fA6hC7t+9f4SAitA2YZcaD8DQ1jQjf7VZkvurp138WU4h1yLbg704pVa/V1Y?=
 =?us-ascii?Q?q+mhOqKODjq/qZEGNbA6t/BHNe3V0hD5hNTkMzEmxbMN4t+uQtzgg2eZrbxU?=
 =?us-ascii?Q?6UlIt9Nj4BjH96MeKKLZtNT1HLYm8WEv39YZiy8zhRsaJeZ/ZUgqioPIFzGp?=
 =?us-ascii?Q?mwp8vkwnUSCMt7Q+X8VR3W7VgxUas+BtPPwO7SSMrX8NXVMw0E1tgG01gnT3?=
 =?us-ascii?Q?JA81yD1O0eydS5o1HP0wXclUhE4kJ+mtJdDN9QEmrZtj2tY+y9gujjhLRTa9?=
 =?us-ascii?Q?GrywqRqTi2RWE1UJ1KtkwFZ5r+rX8yicFM/DbS5jXmE/fi8PoWAdj1JQRTvI?=
 =?us-ascii?Q?cFlX5y+/9CObDEE46WMe3d/e7SGnyqCRHUoMlb4pMe/sxIGJB6ehAY733Y71?=
 =?us-ascii?Q?ZI8Cb5VjDa2dCvijnoQTFuE7QGw2IHW3U4vsmhY7PaEdAZR0zhRLU7+TPMvW?=
 =?us-ascii?Q?3ukciCs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EHTy1Dj7E6V1gEKdbeJWp9jWhjYVw/1O7UV3IvrFtGcQwEi6aJTBci/xSLYo?=
 =?us-ascii?Q?v9UJociEzhuSBnNWcYe64TzCEECt0Igs+QrK5oQD0C4uGeql4QXtyfJz/jp7?=
 =?us-ascii?Q?4WMy14dtdiXur3pPNp6IjJ0VANRVWK39flUAz18k+NdaFJtqMEcZgM42Fgcw?=
 =?us-ascii?Q?LVYQ0U1ba9EimIkS67zO28PTnMXqOHInWXwnmI89yWAMKgr2/wl/z4+lg/Y4?=
 =?us-ascii?Q?TWF5dM2GRrWBZqv+ZVnn9O8oB3L1WYy1Pv7ERFyaTJBkLY0+FTlYvrTN9efA?=
 =?us-ascii?Q?V85PFvX4cVpRFteJZUtnmJzZaXba+Lt7Vo2E6FV+90adYxeiDJMp1CEyr8Y3?=
 =?us-ascii?Q?C6oNh4B/yDhIGZyK7mdQ0zGz0TL6DT7mlNre3lnFiiv62Uwb0Nq16RxPvjVx?=
 =?us-ascii?Q?w8Zgy5pkSjw6atJOgsCY+/IXdo8vBzIFjq0Z3FZOJ2GqpUgJ+B+/Naudp7Iu?=
 =?us-ascii?Q?I/z2d0yIUw64k0k8FvxmwZnQKojS/SxEVHOXJ3sYX6vuzomBdwirAzXLfweI?=
 =?us-ascii?Q?IJCCMpeuoaGnKrNNuAnIx8g4k4uRzBCjbu5bzdO5yg5H3FDRNIwPOPwqvN2Z?=
 =?us-ascii?Q?Mkot4Z4MzxOWP/KHD41/9jIxNlokMJAbg45SovkTPwk3esgHzZYv0SrEX8Ij?=
 =?us-ascii?Q?zadyqy4a3q5YMPkkESWDvahulolJHrueSMYSLXSd2LHGOGTvoa0kXSh/ye9P?=
 =?us-ascii?Q?U0ZVEV4l4eZQiNPyxcdoP7C6qF+DF4o7V9EWuUjtO6KyrSXDWkKgN1+JUaAQ?=
 =?us-ascii?Q?56Dl+s9IhDKx7J178IZHVF2oD/WjS19OPwyq+3IrNWqjyNCopscvyM2+J5R5?=
 =?us-ascii?Q?ai4Zo47LR5uXNd1TU4R3ImKK8l7wCGfWkgh/DgFbG23hszA0pOWsbxQslZwv?=
 =?us-ascii?Q?rjxr9CjUCTgaJy6thWMRnO8h+/PyhZL5J2QRoDsu2q49kxjEd/QrCOxqsknW?=
 =?us-ascii?Q?K7Gu6fxZNKDVOAU53mTckpHSJPVaADZrsYnPnmmb21qtW4ZncbRbBS02UvgG?=
 =?us-ascii?Q?1yNv/n0S3wEBFcKiUSLdR1k9RiGzs2GjghnbfrJsaNeNLVtKxQUt974GYMpy?=
 =?us-ascii?Q?1YcPtlwg32kymyuxIfO6GcbbyQG1mqzcRcY52JgHJ+hhVpncgMDLFQyEmBPA?=
 =?us-ascii?Q?5pYqCrYDk3ngjd8QiE406CMVsFMkOWLAOZaZ6sJ8+cLlg0cYZ/H0HzjsMnVZ?=
 =?us-ascii?Q?vu/0ojLhvTVdBm2zAWLbm5sspC7Wj97EPpiy69i4uz+BW/pgJO85dq01c4J7?=
 =?us-ascii?Q?pZTlh8rfSr+AvHstg7nUAV7N65NmG7Ny5rPsos6MOHckvRoiotP5K4RXVhY3?=
 =?us-ascii?Q?+2iuyNVQ6hSJnTReYoFAsTmOHp4QGU2l/lj0EeyUIQsZOX0EoJLSUogk9q3i?=
 =?us-ascii?Q?yuq5MqaEwbXIe6W/5Q/BCzs80AZ9P2+39HFaWaOu39ACQazUYPCLQlojAPfP?=
 =?us-ascii?Q?B+WIEtoRS/ydZI2gJ7ns7Cffo2VZWmzJmzjaWfjVApDaHe6nTbLrJvKEiWUM?=
 =?us-ascii?Q?AF6ic+XtbO7LrbSJaWsE8EPjy2vHe58fu2hFBAy0Frwnwc0mhUZoFC4WdTnr?=
 =?us-ascii?Q?kB2QCFX28T8GG2wBFXEtRn8T/hJA4T8jWMsQxQ4Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a126eeaf-0d79-438d-aa0c-08dcc148623f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 18:46:21.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vznKQhekkvrPEeTqe2S61eoXw4q9EBC/TKAtCWakVuOH3OuaiSyfJlwpu8kJicrvnKV931JprbOVkm+i699vDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
X-MailFrom: frank.li@nxp.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5GASRP5QP3H5OD2TZLQFXG4K322IW6XT
X-Message-ID-Hash: 5GASRP5QP3H5OD2TZLQFXG4K322IW6XT
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:28:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GASRP5QP3H5OD2TZLQFXG4K322IW6XT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert binding doc tpa6130a2.txt to yaml format.
Additional change:
  - add ref to dai-common.yaml
  - add i2c node in example

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a20000/amp@60:
	failed to match any schema with compatible: ['ti,tpa6130a2']

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- fix MAINTAINERS
---
 .../bindings/sound/ti,tpa6130a2.yaml          | 55 +++++++++++++++++++
 .../devicetree/bindings/sound/tpa6130a2.txt   | 27 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 56 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tpa6130a2.txt

diff --git a/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
new file mode 100644
index 0000000000000..a42bf9bde6940
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tpa6130a2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - tpa6130a2 Codec module
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description:
+  Stereo, analog input headphone amplifier
+
+properties:
+  compatible:
+    enum:
+      - ti,tpa6130a2
+      - ti,tpa6140a2
+
+  reg:
+    maxItems: 1
+
+  Vdd-supply:
+    description: power supply regulator
+
+  power-gpio:
+    description: gpio pin to power the device
+
+required:
+  - compatible
+  - reg
+  - Vdd-supply
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@60 {
+            compatible = "ti,tpa6130a2";
+            reg = <0x60>;
+            Vdd-supply = <&vmmc2>;
+            power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
+       };
+    };
+
diff --git a/Documentation/devicetree/bindings/sound/tpa6130a2.txt b/Documentation/devicetree/bindings/sound/tpa6130a2.txt
deleted file mode 100644
index 6dfa740e4b2d8..0000000000000
--- a/Documentation/devicetree/bindings/sound/tpa6130a2.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Texas Instruments - tpa6130a2 Codec module
-
-The tpa6130a2 serial control bus communicates through I2C protocols
-
-Required properties:
-
-- compatible - "string" - One of:
-    "ti,tpa6130a2" - TPA6130A2
-    "ti,tpa6140a2" - TPA6140A2
-
-
-- reg - <int> -  I2C slave address
-
-- Vdd-supply - <phandle> - power supply regulator
-
-Optional properties:
-
-- power-gpio - gpio pin to power the device
-
-Example:
-
-tpa6130a2: tpa6130a2@60 {
-	compatible = "ti,tpa6130a2";
-	reg = <0x60>;
-	Vdd-supply = <&vmmc2>;
-	power-gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 118d9cf64e9cb..4ced49519930b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22713,12 +22713,12 @@ F:	Documentation/devicetree/bindings/sound/tas2552.txt
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
 F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
-F:	Documentation/devicetree/bindings/sound/tpa6130a2.txt
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	include/sound/tpa6130a2-plat.h
-- 
2.34.1

