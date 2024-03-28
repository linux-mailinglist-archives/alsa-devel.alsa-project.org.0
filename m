Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC998812F4
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:08:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE4F2BED;
	Wed, 20 Mar 2024 15:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE4F2BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943709;
	bh=ONzqAvwUNfaFMlHkphyJmlrYxFn5CyBnXWfv0cM9OSk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cHmu46NJAaCnHjDuYyllRcEKk4Wpif3449ADShnxiC4v5R7FexFlMOYHGV3BvkEUL
	 e2Xzvo50K707eKKSpmjMobJTMaXzQMgv6vJxaaEmlJbJMU6rFxZF0yOE5hOlHzqH/g
	 agmQGbVokCuGQ1e0cn7YAGMKcXZ1qTrg4dGnv04o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B32F805F3; Wed, 20 Mar 2024 15:01:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF97F897F5;
	Wed, 20 Mar 2024 15:01:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37083F8055B; Wed, 20 Mar 2024 10:03:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2070f.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4420:2::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC14FF80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 10:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC14FF80088
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ9nkn6dozFZq7FHwg1dCf2WXPJaBvV0578N2+yphM2lkDlzsOWyO1QHDVt0epStSsMGhjnf/Xmxqp/Q7jEUoKUuFoVy/eRsA43uBzgvOcrOMDVjbzN8MDNnTfwtGjiKWsyiF+OaGYHoUFTle1AXucW4QVdj9C5IcTmmlg3CjZLFSiXKmivhMGrxxctgBpzui7Dou4w7xvc83bOslHeGf2zMClrJybYAeq1K/rD5+7uvpNaEDwaEDjY/s8ovdH3esV3VMW/7nZAls87ijFn1VF4MfZkBeCr9FcifmTl22EINy5O2npKhMEvlmkpgWtEbsdVU/xFkoqVY3cOkBNKpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPXS35Mgmsq0Yo7y/ZoWP0MHJubZp52kjY+EfrHIIT4=;
 b=lZcfr9zvqJbUu1CDemJStMsCJXLKKzshkXF1qbp8LdlHL7yjr4OqjZgZOSzVcMpcCxiq3AiVyF0I6qCeo6x+8vng11dWBjYllv50plw7iGsFKFhZOg0la08LFsjzXnrhk5uz9X47z1kUJ5AqD/993fIFMRkL7dS/FL7trKJgiw6II8Z2/ZMNzESMzjuP55OvApNfymKhnSAEP6TiHgWbNXwSXi23zVvHcYe8GwxcQiuDDP5vUzLEkErFU/rNC6TeM4yhr4FvWpBma5bCuHzlFhtsR1+k/butxU9246XuKuQDE1vW11aUmBbEBjeb2WAimScshmjrZAcFIqKE++ePdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1116.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Wed, 20 Mar
 2024 09:02:46 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::7d98:f313:525d:fea6]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::7d98:f313:525d:fea6%6])
 with mapi id 15.20.7386.022; Wed, 20 Mar 2024 09:02:46 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 0/2] Add Cadence I2S-MC controller driver
Date: Wed, 20 Mar 2024 17:02:37 +0800
Message-Id: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1116:EE_
X-MS-Office365-Filtering-Correlation-Id: 4880d82b-ddce-4107-5766-08dc48bc82bd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wB/gredxukOF+eKXUIp/D1rHvhb3oPVCyVtxNX6zROZffhVTnW/gbjBFsejWLUwsAjbNdiFp0gMwgU7KBUinLOM1cbpHetnZGoQpKho4+9zVDgP3Do/vGoxU/nJno0wh4LtVbQcBgOAoIrSH1Iddj28rfvMHHgWjkiWz/bkZWH0UNHxkvFYGwX620QsMLwcnOi31XYmJ0guWSVxNguPx+14bsnFHtRabdn+cV9/sqCi84hr7jHMU1ArxiOWyW1cK7uMpVOxSlnZpotBwVXHa2KtCyjdQbjpOBjjg3pSGVZk6NDPYLdAerRAEVrieSWK5+ucpvylYEBryOILQmdlYRi4mMxyEsUgwAjEKSOyiy5aAAUzA5tbkqIrxHAiEVgzkC8cbsgoMBDthRbj0dcGfpoQ0/+POtcqbu0qhepB1XHFVXYFZ9wuiuPfKy/DI07uMtj9DveIc+rMv3aD+gB7S5CbYFQJnvmCx4RJJvxoCkrZtOFnzuaqk/CkqkOeqbPX21rprlpiGpZG/255V3j0pQa0XgHxkfwtxIYcNfekFAfujMJka0OFgFGZ+i7RxYAKDayf5HdRhdqtIoRIdJyqJy5qozOWBH4vHXOy5zxpnJVcmILrufdTZvEhFrHfXIH4e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(52116005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hOThtqOTbUB4O4tDvWLlgruKZk7nLUaeQoybVrsL3otlJhqPceXbnw+L6oAt?=
 =?us-ascii?Q?8lAG/2oq5Vu9Nlu/r+HZWT6WAgwIHfB/ruK0LX/v7EBiCkkE9wFyS6PqPVI4?=
 =?us-ascii?Q?A3L9dkDHSRq9HF5MraS3nXdK6v/1slrbo6tqBZspyaig4C7zdTa+joTsJDn/?=
 =?us-ascii?Q?yvaInZCutJOahygtaAioRXpjaqY/F1V1qN7G4PI0yzZwUXEqUS0bRmTz0eWY?=
 =?us-ascii?Q?oKnBqkIkIq6OYGJDmC5lAQ6CoVku9G/lzLTjohPDEBgU6uW+XriY8Tpd2Kqp?=
 =?us-ascii?Q?f7m8UyOEjXbPzGLFBxJl/kKcnLpUOTOPDs6LdDBUp3hikxBv5Ah9PrZyDOC0?=
 =?us-ascii?Q?O+b7cDcCvEkWi9OL4XWjuGC4cAOf12NetjeD/LpG8oVEWEGElANBknf4Xmos?=
 =?us-ascii?Q?CCGkmaI9sNbwm5fTSV/u0M49PXoK7MYqz0KBZZii3J7MB7qjLZkcmPU9DSZb?=
 =?us-ascii?Q?90aMqGaxYdRvyFg/HR6SaKzGN+2o4EJSJRSfqBjHxLBGfLna6w74KW7u7kWt?=
 =?us-ascii?Q?3eJup0yWFGBWu8VCbu6EsaI2KB6end+LfTugdDbPjFreoua9W2gh2Ckhmh4E?=
 =?us-ascii?Q?ufI0i5UkeUJaVhUecnxd2bHDex2teiirYuaEcTy4obQIVrreWFqx4U5jn4eP?=
 =?us-ascii?Q?61nLWKqQHkfqyEae5Sbg7S8WOsthOYS1VR39+/KVPj5RpxtMnsbdrixhxGBH?=
 =?us-ascii?Q?jukzfWz9XH7GUGYI32w8/3FddpqCXQ6gsHOShF3vf5eyJQHcxLdTn/jOd3eR?=
 =?us-ascii?Q?GFCgF1KqZqMcCIGOkgX8JP4cDowKv6hWJZYYN5/U6B/GE1a4j+Beqbl/DgqC?=
 =?us-ascii?Q?m9dZi19XSNRKWMP1LOViG4l/jzdQObAD+OZil2RJK6nioB55jfDLJe6X6AK0?=
 =?us-ascii?Q?Jp+njYXoTqhoh+OWVaW9elKJiElEcq0Z9GidgVmwEVhaAAkgjBQq3xd6BryQ?=
 =?us-ascii?Q?VSdj/q0DtJgbGJkJIn2CJ1gjPN5KqoFPa+C64ZZjYX/rGhpTtfEo+W3lDbrH?=
 =?us-ascii?Q?nCt1HtmIpmwYN+xWWbppjRbl58+bLFtov3ZNGEEFnSXyEvPuHrIHBbMrpXHD?=
 =?us-ascii?Q?r5WihLBWz8dP3kZjdPuX7610DH+wMBTiC5tGmQc8sLhbRoU8SiddclVUayIa?=
 =?us-ascii?Q?rYyEKSWeeqAi5d72C+kwG3Dc3cbc5OSltQ3gV5EgUV3NrbQ0awHMJUFAmtSP?=
 =?us-ascii?Q?iHh58Z/wWcLjlBdYqfULFka7A9Q08MWvCiuqyn/L41EX0BIBwHAiRgaQcs3s?=
 =?us-ascii?Q?DF8oHAh8SZtP7J5vpYr1B5yQMTqS0XxnLg+DFxLzRC0j2Uj4T8LvxxhmX2x5?=
 =?us-ascii?Q?XH45gJnXQzFJ+sX/h2IeAunKSdupIK4qK2AyVYSFTG74jP4iJGZ0j2JrOd0S?=
 =?us-ascii?Q?VzCGAGdavdbCJsCoHjJ1wY05Ol90CHvKMbe1F1vlp5epMRo1LlAzl2hYL4n1?=
 =?us-ascii?Q?TzHZnc/w/PXhPVq24VZSqzZ3j+rQH3p16033hTmhZv6iXSRh2zaFvi6ltGLJ?=
 =?us-ascii?Q?EWVBD9KZ3YkC+KR9dZGxWxVaA4ispuP1YMy+0P1U+4MnBbieVTom9aLqskn+?=
 =?us-ascii?Q?xspJQBMpucKaPuiJf+XWb8xVONVrg2+YjVOT+mrHa/b0E+FoNVumsKWftvoo?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4880d82b-ddce-4107-5766-08dc48bc82bd
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 09:02:46.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5WDgEM7oB22GgPtZRcgL/Hw0JLUaCChE/OoBB2qMFiuoP44JyrY7Py8l/WJ/c/HWHUj85GUUMUjqSH0xLBySE1VQv/uUBXRyJsZ/4ITJ83E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1116
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GGQXY4LAJQGJLNB2CGHLHZYHJZNWFADO
X-Message-ID-Hash: GGQXY4LAJQGJLNB2CGHLHZYHJZNWFADO
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGQXY4LAJQGJLNB2CGHLHZYHJZNWFADO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cadence Multi-channel I2S (I2S-MC) Controller implements a function of
the multi-channel (up to 8-channel) bus. Each stereo channel combines
functions of a transmitter and a receiver, and can switch freely between
them. Each channel has independent gating, clock and interruption control.
It also support some of these channels are used as playback and others can 
also be used as record in the same time.

Four I2S controllers are used on the StarFive JH8100 SoC. Two of the I2S 
controllers use two stereo channels, one of them use four channels, and 
one use eight. It had tested on the fpga with WM8960 and PDM.

Changes since v1:
- Added new compatible for StarFive JH8100 SoC and a special property to
  be got as the max channels number in the bindings.
- Dropped the useless '|' in the bindings.
- Moved the drivers to a new folder named 'cdns' and modified the name
  of functions.

v1: https://lore.kernel.org/all/20231221033223.73201-1-xingyu.wu@starfivetech.com/

Xingyu Wu (2):
  ASoC: dt-bindings: Add bindings for Cadence I2S-MC controller
  ASoC: cdns: Add drivers of Cadence Multi-Channel I2S Controller

 .../bindings/sound/cdns,i2s-mc.yaml           | 110 +++
 MAINTAINERS                                   |   6 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/cdns/Kconfig                        |  18 +
 sound/soc/cdns/Makefile                       |   3 +
 sound/soc/cdns/cdns-i2s-mc-pcm.c              | 262 +++++++
 sound/soc/cdns/cdns-i2s-mc.c                  | 724 ++++++++++++++++++
 sound/soc/cdns/cdns-i2s-mc.h                  | 157 ++++
 9 files changed, 1282 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,i2s-mc.yaml
 create mode 100644 sound/soc/cdns/Kconfig
 create mode 100644 sound/soc/cdns/Makefile
 create mode 100644 sound/soc/cdns/cdns-i2s-mc-pcm.c
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.h

-- 
2.25.1

