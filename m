Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29F965937
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 09:57:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E42B950;
	Fri, 30 Aug 2024 09:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E42B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725004620;
	bh=IWKSC3pDAGk7yBzUnitDGYZL3fnx3ApY4CElOZPiako=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JcVfJ1T7+95NtRgzUZcuuUZ5XdJDGctRZmRPpMqeCQnackz7bt//DMrJ7UVK78/G4
	 G47Gqs+WJfZNcmVpn1QBKdShrTdDuIwcROtmn4Dhnu9r1drWOzmjYcs2Kw7Ak71Rio
	 NxcFeqQMeujaUjrdC984I+pQEmlJW0bWVVArAKnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42341F80600; Fri, 30 Aug 2024 09:56:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBCE8F805E2;
	Fri, 30 Aug 2024 09:56:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEA39F80518; Thu, 29 Aug 2024 09:20:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8008CF80107
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 09:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8008CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=WCBxHr7v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmwNJKsZKKPuxqgwcgjov3tjnmEPZC0gFErG7S4/Sym/i9trw9pMzUW7iyu26opJd0DF82yqXWnVAHpSGr5qfm9PqlLMmXa08xbhyckHNlJthCFX4wzh0dthgt1ZQZl2pxmO3yJGZ816gTa3eoDH/SxeBF0gbf57a6I6ikjWx1QkAacvql5w82qHHoiGkmkVBbRgT0TnAT+IP2Vi2I7Lt/un7RPP0U1dXu9tl58OQXLVrvezyV+yU6EBO4xKrRk/2i5Vbfr3fka5Pi4rJP3D0eLje0oCwlU60Kw8DycY8dCf9JmSkqPCh1lVhO5Wb6fr2yx2SVCFV+3bXD5i8NZ6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0Tztwz7vGOnGQh4vVk71C5hgRJ1H1K201FaQMm3bko=;
 b=C6bx8KyXgGt9gonWzNZ9h0jcvX6q/3m9Y0Rs22ytLNnzmB0rfadPIFJ1SfZsnmh6lF46c+obb3Eb6O/6rO4GLaDvmV4LiwSMfAa7r4Sm4EpQQ/fKRnl5VQ5gvAXk052ZNkjR280uSos0roo090EMXkN0KJR43OK9/89ovXeMRjzgT6ihxoCtqnwQkY9l58a2w/uxw/Kmo50Q3+W6kO2geTOHkoeFHncUNPvai88mE59UT4lndZTvywSFmImBbkpQfNZJyTuYx7rhjbS5xKyzhkK/SkcACEouiRtDVU/i+2l2974tO5lz25d6b45x3lDm2pXO/zyJjwkXFE1nDZEozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0Tztwz7vGOnGQh4vVk71C5hgRJ1H1K201FaQMm3bko=;
 b=WCBxHr7vAFWtJebfFl1CPUkFB6gBGaXdvd2YKHAb6SMqVYjiUyP1xO5fejyY1m+udddLandElxOn3vZ5kp43OGxp5GBO8KrQJpU00RQxcSz2fxHyUH6xQrbvjTMTZa4hsxU9Mgb3eRU1OeZU9PUHw+fZAe/b+n9FJ30jarBOfylcC2JlCpc4BPjLYECKq9SRkh/ywt6ili0FId4nefd1+wYDW4bjBMgP881OcUUKPcusk1iv3x8HzPBudUOSeTb0oNbhOKW6Fiv+L42Nsc2oTnwGmiLU/U2ZCQbbZbjUAFRNKOwoktv9xdDuhO5WBKKYEwW4SYeZcMvbkLjflLZd3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by TYSPR06MB6605.apcprd06.prod.outlook.com (2603:1096:400:47d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 29 Aug
 2024 07:20:27 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:20:26 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yang Ruibin <11162571@vivo.com>
Subject: [PATCH v1] ASoC: codecs: Simplify with dev_err_probe()
Date: Thu, 29 Aug 2024 15:20:16 +0800
Message-Id: <20240829072016.2329466-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|TYSPR06MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fd70e3-a27a-4d50-af62-08dcc7fb0e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rw8gYGOg3mpERmadJv82ZK6os0HEZiHSjZETSamQb91uiMiCgY58iSL/rkOZ?=
 =?us-ascii?Q?HkehPIev8MtZ19D6L4EhmRQafg0AJanS8ad8LfgLBneXbv3SEAxeBFfhIREi?=
 =?us-ascii?Q?mVG3B1R9Lz36DDc6zzbn/0x/CVJIP/P6Jpm1XvxBe/40JoebZcih9VK7U67l?=
 =?us-ascii?Q?kOrJW5zLui5bGUYsEU6SComLZ8+NJjWk7R2IGy3V6SrKnggRwOzcvzEZ/f0Y?=
 =?us-ascii?Q?NGk/ZDXyWcQ7IlVz2YEuyY/RgObymBw1/bepCwm8lFOgQJ/eIouInGRqxYcQ?=
 =?us-ascii?Q?n79tZCwDpWELbSVI+gTVortiFrI3JSUeedHZyQigEXmuphoW12uDEKKw3rkY?=
 =?us-ascii?Q?3hD4fIVNMVZiE6FXQP6dOhOeRI9szXyaQofrcDOhjQNEMlWhOHN3XivZ9dPr?=
 =?us-ascii?Q?f+KuVMSLh53jeR1JMJ662v/qOZtZcwUavYy4Hx1ltrNPJRdY4U1DDhQXrPx8?=
 =?us-ascii?Q?1RyNCeh3badQQ3e9ruBnV4amrqRU95LQ3IeybEuBHlYCGwRQlO9GHlj0ql1i?=
 =?us-ascii?Q?8lusRMYMEtpi1V45SVfJXEbCf5UFtzQbfYH3YhcQKEWa52WqzW1hxldUb4OW?=
 =?us-ascii?Q?Fe3n8Rz9uCAJIpviNV2pRCLSp+Q9ZCY34P+n7OzBzOVUU+WX6q7km/KGkM+g?=
 =?us-ascii?Q?+zMfdNZf9qVU18S/BeMfbJQ4GI6RxMnbZA3ZQtsJrKOwtKWBWJTj+RUCxL5F?=
 =?us-ascii?Q?dN8+5CVxP7s/h1hiTsGcvBrbLaWwucEUl9I+1WcIcdhtW/xJ4VomzXP9rRdU?=
 =?us-ascii?Q?jMfDxegYarownnWTjIPuDvcjF74jrypmPzNE1p77pF6hNSMrWdawuJ749MGb?=
 =?us-ascii?Q?GBTdMzwxUtcR5OHUM/eAVzCWN/H2A67XRW3fH7s4khl7+i2xcQ9B4GvB2ExK?=
 =?us-ascii?Q?UrIkZushA76LLdFekx2NhzVVre9yCuoX1XL8zEpyFoWRQEGNOJePhLf6JHNz?=
 =?us-ascii?Q?MYz5I0vShgigv5xFgP6WGC870G0MO30t68DBtPtcGkqqkA6VwI+LDCIuTsMn?=
 =?us-ascii?Q?pDHfV8E+5ZVTH1ljyACZEwzmvjAFwBGmk1/3t6vyjTzzlHjQAfDrz74cEqEp?=
 =?us-ascii?Q?bi5DeGtNZkEqKeOqygqOImwshyqppQpenHOGwxhZlpAWQ9uVrSszfiMhfiWu?=
 =?us-ascii?Q?urYHmHUo/FzUOGXwnbkAQV38SrWoMsHa9qIoWDZp6ljuQVNGLSSdMEBL0mSP?=
 =?us-ascii?Q?Ee/eaLJty2LzqRxHMYeV7Gkqwa4uFVYFbXxPCY6/J1unLO5h3Dsnn7yQYqLw?=
 =?us-ascii?Q?sUoV0TqAb+CqIXjBVsn3QpiR2LD3GwoqA4P1ffWk639AwktZKtcEDjmogxkw?=
 =?us-ascii?Q?W/4aUOo498n6F5iO7AjW6eNg8z+tXTVgz0j5tZ/2HNSCcUU/cVO1T0uqisPC?=
 =?us-ascii?Q?HBcM83DWCOqThiMfqOy5Dfzo9A3eVgBDsuyLXI/HFm9s09TBfXJNucG46nif?=
 =?us-ascii?Q?KLT1PcQOrr0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6263.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dZ/jIFnYDiSGMOm2NRlENqxo7PeWv4kwgtex6fdx1c+dgtWKhjD2eDKEpQBJ?=
 =?us-ascii?Q?T6c0JaqVyMZM+Ex9HRzZELDv9s7vOT9aN1ccForqIYRCZmZJn7rRw9v/PsKA?=
 =?us-ascii?Q?o0oOM57iHOJjZ5vExf0yLLmGk+QSB7KedrNPALYNIEBs4L4wH0qSVOg016er?=
 =?us-ascii?Q?NIlQ5GfW0RsNBNsb7zv6J2IuPAn5MXto4hd0Ik8UFiPVY1PihZeIWjnlf3qL?=
 =?us-ascii?Q?WWRU3F0DzvU/yw+EmCPyl2tCKEFtqw26Ac2S8RewTq1PDwvUWVlLkWlp7n/T?=
 =?us-ascii?Q?+CiAK2lKBvzWSkBle5OQQ7iJGM0NX8SlN1eetHU4LgE88LmdhpZFmt/SFp/v?=
 =?us-ascii?Q?Juko5wSLulFY7E++ahCGfJonFIhlv4VrCQ0MQHzIN+P//po8b//vprruezpw?=
 =?us-ascii?Q?Kvzf7sE08SQORsD6EIPp0itT1VQggP4ywzqFPmZYzia6dDmnMJGayWjzO9RH?=
 =?us-ascii?Q?Eatr65rgx6IqNhW0p90WD8X3Tf/uPouzMUsJ2rUyWjMpTm7ns4XWvnvPBubO?=
 =?us-ascii?Q?CDd/qFF3SUexXZNbw0QeAfnUib8/GQHwgBl+uZZ7rGr43/4h7wc/GVae/j4j?=
 =?us-ascii?Q?PXZIDRfOA5BI6RdXO336L3OGvZW7+0yUD5viV/CjuWxDA33GgzbfbR9rkx7s?=
 =?us-ascii?Q?fwog7Rn+HDBMjQmff3DW1WMYGbiTKXL0MHbjG5SVWyWrmuNQkGdUpT6EAQlK?=
 =?us-ascii?Q?elh8SmIYjzrlj9USKGyRi/wDN0WMvGjp85r5pwSxvHJBVv8ZbJC3lyi48hAt?=
 =?us-ascii?Q?uyQx5zmpAG0wPUN2tsYzZYpsR+Rt3XoHPqHSoDlWk0G6CIUyQxV8j45KxQyC?=
 =?us-ascii?Q?af/m1PrdN/bwLnexl6f+5AAgaSCSa4h9ZPsb1ji4ojjrI4LEGfmIZZYA65rZ?=
 =?us-ascii?Q?tIAxWH93DJ4qpUZx0DUny0LlLlytaEk1GtXa6js2+6zig3CyCvdj9kD3xAg1?=
 =?us-ascii?Q?uo2r//ftk6ncrioS8JyER17dMSuhr+KRItXPTC+vlTF8QLxcLXKxB3RvgpTs?=
 =?us-ascii?Q?OvTGqjtRdI9Q+qz24N82F5aMf+sJScZb7NHFAqab+1MpOIxpnNe/id5ths6P?=
 =?us-ascii?Q?ObrIsDTturKJqfXO++C4wzQsbxG05kZGVFRhBafCbxk28MkBjOnFnoGxVpVr?=
 =?us-ascii?Q?YLOJsrPTsHQEUExe1JMh6Y5MAxhlNWiigaaW9/KPqoaxGz1Ncg9H/r/SMOAo?=
 =?us-ascii?Q?WYZs4ILADOQDDter1SBTWq806uEI1a7pNwaKnOnPHkfamO4ZQ986/nskuL3y?=
 =?us-ascii?Q?n5DaCQ/LxsPv9vvo4k7UmHScYcryqSDo9aea5aUfZ04ncQOznLOzqwgzAWIw?=
 =?us-ascii?Q?idekB7NutLusE67r1PXnmEf95B6wc6dPKkqWj07Sb7nrmXTVmzyrXMyrz8O+?=
 =?us-ascii?Q?v4LgYdF28+pVPVd1YGhh9nBptHnp1aefLIhwkCRHeKwnPJCXp1aJuTkHAjig?=
 =?us-ascii?Q?sh5QKzggkh1JfBLuVDMr3z1EG0LsfyEg+YR0nyfLf4sh2BRd1lemIQ/7GFun?=
 =?us-ascii?Q?5fnBajZUHjzpZxKp9frsL20Ntn86zmozxaQajdcsnITziru/iRkVjhq3jK7X?=
 =?us-ascii?Q?huiKiXo1xnw5OR/f6RIfwKygq/X0hV64O9tYX3nV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4fd70e3-a27a-4d50-af62-08dcc7fb0e06
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:20:26.8081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nZ1VsDuigsG/eaWrXDEngxf4T5pt9EKpgESq/WH/fMFQI58EESySH+q8Hu4v1sTDVSfROnmvyBB+or4sRBF4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6605
X-MailFrom: yang.ruibin@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W7X7WKHPNNQTDZYHBFVYJNAN24O7C57Q
X-Message-ID-Hash: W7X7WKHPNNQTDZYHBFVYJNAN24O7C57Q
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:55:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7X7WKHPNNQTDZYHBFVYJNAN24O7C57Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Using dev_err_probe() instead of dev_err() in probe() simplifies
the error path and standardizes the format of the error code.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
 sound/soc/codecs/ad1980.c   |  4 ++--
 sound/soc/codecs/adau1701.c | 12 ++++++------
 sound/soc/codecs/ssm2602.c  |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
index 3c1ae13c1..25fd8bc4f 100644
--- a/sound/soc/codecs/ad1980.c
+++ b/sound/soc/codecs/ad1980.c
@@ -239,8 +239,8 @@ static int ad1980_soc_probe(struct snd_soc_component *component)
 	ac97 = snd_soc_new_ac97_component(component, 0, 0);
 	if (IS_ERR(ac97)) {
 		ret = PTR_ERR(ac97);
-		dev_err(component->dev, "Failed to register AC97 component: %d\n", ret);
-		return ret;
+		return dev_err_probe(component->dev, ret,
+			"Failed to register AC97 component: %d\n", ret);
 	}
 
 	regmap = regmap_init_ac97(ac97, &ad1980_regmap_config);
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 8bd6067df..9fe18b22b 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -678,8 +678,8 @@ static int adau1701_probe(struct snd_soc_component *component)
 	ret = regulator_bulk_enable(ARRAY_SIZE(adau1701->supplies),
 				    adau1701->supplies);
 	if (ret < 0) {
-		dev_err(component->dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
+		return dev_err_probe(component->dev, ret,
+			"Failed to enable regulators: %d\n", ret);
 	}
 
 	/*
@@ -799,15 +799,15 @@ static int adau1701_i2c_probe(struct i2c_client *client)
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(adau1701->supplies),
 			adau1701->supplies);
 	if (ret < 0) {
-		dev_err(dev, "Failed to get regulators: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, ret,
+			"Failed to get regulators: %d\n", ret);
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(adau1701->supplies),
 			adau1701->supplies);
 	if (ret < 0) {
-		dev_err(dev, "Failed to enable regulators: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, ret,
+			"Failed to enable regulators: %d\n", ret);
 	}
 
 	adau1701->client = client;
diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index c29324403..727bcccad 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -606,8 +606,8 @@ static int ssm260x_component_probe(struct snd_soc_component *component)
 
 	ret = regmap_write(ssm2602->regmap, SSM2602_RESET, 0);
 	if (ret < 0) {
-		dev_err(component->dev, "Failed to issue reset: %d\n", ret);
-		return ret;
+		return dev_err_probe(component->dev, ret,
+			"Failed to issue reset: %d\n", ret);
 	}
 
 	regmap_register_patch(ssm2602->regmap, ssm2602_patch,
-- 
2.34.1

