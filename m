Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCC3525B9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 05:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D36A16AD;
	Fri,  2 Apr 2021 05:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D36A16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617334891;
	bh=TIYagRuyFKy0bJ3LuVbr3pyOectwsp8y/AiqL8Ggrxs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UQ+MdZEy1yFofYXqonZWK/kHW1R/d/BJCjHKejXKULgIVFfEf+Up/BCvAJB9B58hi
	 7RfLEMb2DA2s7X0UA4K/30EqCXYk0WHKe5JY3IKt+KM4v8RgZx7/Fv0cJXlRoJm3qw
	 9GxgbzkKCA+aV3ZOCs7IKlS3xNRJFtelFnqN3C9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB741F800F5;
	Fri,  2 Apr 2021 05:40:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C86F801DB; Fri,  2 Apr 2021 05:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E30EF800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 05:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E30EF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="gLqbDIEn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc1GIk6PeS6C2qfw5caxmUwN/qildp33IKV5lUc8LTPig3QpI+80VTgg5Lzknuz+ifFZngM4s0gIuC+vyYsfu3JPHOzDe7bu1vOL4/nJFd2uMHYuUM12opDNQOiS/XXnUKTohQ1ldcv6CDWHi7PoukktkbXrQuvuo02qB3h2NoT8imm5Ghjrx0J6Cz9a8zWNi575X2pMTPiqIgkvUGvjWb4DBXpw97YNXGCpZiA5kM+drtlqKdEzI2NtgsofR1O+qTc1q50AgSBuiA7ckYWxjPvw/zgmHMH1UFDOPKogJ/zxbeEKuqCDk2qb6Iw862X+pPjKuQ2if7yr6B4e2YSz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0dtyvSrR2YsFIgYZFWkvzYvtcp2VPzwQEIisFKEYuw=;
 b=TLDb8k8KW4V75noRrMOfTqKTJHEhsDdyJYVPTZRTVkH5TG1HOcA6KCv/lGKNv7GgbHL3O6GgYOI2U+cjPUtnmFFfouCoJpgWS1Tq3zes1u9C3+gXeazzLfy2MgRpiyvTr/Rzfd9J+HwpwCPPIX6GiuQoKhoHMGpxQjCC+CCs/TVj0ELzl05JyofWdeBbwPgDmSYRODqhRFG+9RKYPujNgAmMrrZ0iCoLS3lMHUwltvTDv21a6weZwxXBFjU/52cuZ132TTOxl0Q4aDbudT6fhieiScLoynO/qYmDJosXylubmhzetJDh1SZl13i2/7WI0+EkpgxAP6IMk07Dch782Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0dtyvSrR2YsFIgYZFWkvzYvtcp2VPzwQEIisFKEYuw=;
 b=gLqbDIEnbejUKMZ/pWii4xHxT0UImptMVe4xsJVD+onRjKxRB+U7N0cId46dfftSFkZbWsW/jrTeuOqA5NC4uSZZ3tb6o2bTqy3tqKHj8exR3vkPeCE8Fm6SVg9j+wEdCCaWe5X1NWll/NccKoRVElbSxUkl3BYwmF3uBbBuG8Q=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 03:39:28 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::cc39:7519:2fa6:cc8b]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::cc39:7519:2fa6:cc8b%3]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 03:39:28 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98390: Add controls for tx path
Date: Fri,  2 Apr 2021 12:36:43 +0900
Message-Id: <20210402033643.12259-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [125.129.66.126]
X-ClientProxiedBy: SL2P216CA0019.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::29) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (125.129.66.126) by
 SL2P216CA0019.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.31 via Frontend Transport; Fri, 2 Apr 2021 03:39:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c06ccd-c84c-418a-3166-08d8f588eaf6
X-MS-TrafficTypeDiagnostic: CO1PR11MB5060:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR11MB5060596EB45F6EF483ACDF43927A9@CO1PR11MB5060.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ngv8NvCgG419PVWxobU1k9d2+tOB1l4xMoCxzs4A8aRiVozw8W0CO0DCyyhrYp++9U8iTNScl1wrTmKaP+6JvGAgIQRarmqSUF8Jt6DMGfp5k27Yo8OFVNZtTKvg4aZKgeyRvlDw/N0Abk3ihIYCMcus1XjmVJhL1UkQ6RzcuseJI3Qt9ppQnf1QwesY7/IfDTwQlU6pAiZXvR/pb7GlyVKJO/RHdVrxAIb2JvWKPk5psfA8zSBJlLyfyx/qCzBUF/PV1k8DJFdbb3+R7ItCi5tl1qI3mcBHN+VfGxUS9sjQRiA4mM355r8nZTHmqkMpWA/f2xLDOa1AX8gfx7iulFaRamg6fDUdxRiyIAI52qchyBgti2Qxoq9HmZRSbYPW6t9G8y0eKt3vRoX5NX9YDi6S0J3laqWSbHSSzG24rLm4IU6PeS3X2jKNsltBI7tFwutuY31gKMqsT1YffZLnpdoc8qFlfgkRXLHshnr9OLHkogO89zP5a0Yv1pzbBZ2Mh470Onn+Cn1NWcix+c+qtYb1Z/919Ayof/G8S9fsHMUFVwwNAhkzrDhMiGADmrx+9euCXM+5Dhx27LADVM2mpl8fFwtSnMUPdODl8/cjJm23oiAHzknYb4qNfvGzYFXK6D+uf1fzAA5elrAXMqdkzMmdYPfe0Z3gvd9ESirBTmI6C7F8MOtBTMmh7ZggCOP7RQjJgKvr2RuKia8Nb4Fvwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(36756003)(66946007)(52116002)(6486002)(66476007)(38100700001)(66556008)(6512007)(83380400001)(7416002)(6506007)(478600001)(86362001)(956004)(8676002)(5660300002)(2616005)(1076003)(8936002)(4744005)(2906002)(4326008)(6666004)(26005)(69590400012)(186003)(921005)(316002)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4B8AwTM01P7cQBfwW4KeOqDr6kArECioRB/TGeCWCoFA8/Ryw938U6BT03l0?=
 =?us-ascii?Q?JEkg8nE2YSnRRhmXhc0oAHkAk3Af6adjgHdIs/PcLQHREbO7oYfpfINhHoBy?=
 =?us-ascii?Q?mGqrIgXiES8ZYQxZ8ZCbltQpuHSQ/IG6Ltoh+rM8uib3+B6RQ83mSR9D7QKK?=
 =?us-ascii?Q?CXahtaMNtZulvIXBa9PKTQzsicF+t9cvMbsdAgp5Q1cDStmCZPXfgY/Xf3wl?=
 =?us-ascii?Q?zJuiaSkAEpOQ5G8QGl+dzZR13M6F1ElcfV1k4r4LKwjciUFyOPQmLF5SneRc?=
 =?us-ascii?Q?zFqri6R+ZNc9HXcoSLkV9sHrsO2fMQocGE3Su8IrpMb/rtJMWlr9zUWWiT2I?=
 =?us-ascii?Q?KLZh1rCHryDsQYQWtLqBoBvY6ej5FpPtCwzQX92a4VLRJqdpI4Zlkxv6ZXgm?=
 =?us-ascii?Q?VTJ7yrMpw9+pj+2LNBi7y6oiuR3nbl7lgVFsHrD0yriKOurKrDMCv/duZoZo?=
 =?us-ascii?Q?uAFbP/gnC7kgho8ea/0DK6kFVO8Or7jVKvKNd4IwC9orqUq3iqquxW698lQ0?=
 =?us-ascii?Q?ZC2M2HWjLqalTFGqh+sK6qAEtc7fWYcG+r8lFbuQ/JKrEl8cgE53ZPKEfhG/?=
 =?us-ascii?Q?V/By4u6gP5BAVoOe5QeOq2Uw69ZF9uDhAFQNv3H4y5jlA1Z57ix9fiP5hjBi?=
 =?us-ascii?Q?hCuXGhh9jAtzClEcoYbsornYXXZzQUmdAwCjZfsrk5KXYLZnmsu+9N4zHXps?=
 =?us-ascii?Q?29c6a5BCQGr1xbqGx3aChIU1IIK2CAzR1VMQoDYEi0j5XZPopg/fjsbdTTdV?=
 =?us-ascii?Q?OIG64Y742IoQBaNYhHh7dpJ1DU5tM9J8hy1GmO8sMuod562NUSMb9gltKG42?=
 =?us-ascii?Q?w3lFaTAu7XZd+6yrwjlXfCLpalDio3A39l1y7xqNdh+bwveGl8yESjeUcxfm?=
 =?us-ascii?Q?aKIvYL7u6Yn3V1Rr2ZnLuVQ+CS2AxwOwz1br2JYOAWKcv5SEcOmrAvxnvox2?=
 =?us-ascii?Q?irTNF6g9pt1Rcp5MsQkFKdvtBKuqXBivY9LdVcOS655x5TJ2yCBHGtdixTBI?=
 =?us-ascii?Q?Bjcb+z8P+aKCWfMCgAQa1oQJzjuizzAVqbxX6Sj0HPgZNAqaJaVjRUF/aM0c?=
 =?us-ascii?Q?p2DSbIP75WfrBit/1oOpzVgwXIPuQ3va8LTgkJkQggkGIDqEL+L6OPm+aHGq?=
 =?us-ascii?Q?qquagzm9kz8I4fID3wIzIAhp6f0hcwyuOJn1VWUzYNkaJVoW1JJSx+1GcntC?=
 =?us-ascii?Q?dhapL9E6Vn9VnCbdyqHGfimmTw7jb/sTe3zPTfbP+ezpMv4Nr7AJGcvwH/ad?=
 =?us-ascii?Q?Jvcpc57CDkzNbyt9Wqw78UJkGfXCQEVpFVKs8fw1A7CHvYoxD/BhDCvNrUvh?=
 =?us-ascii?Q?4uHvB3i2CUPz5U++Nh6nn+qw?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c06ccd-c84c-418a-3166-08d8f588eaf6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 03:39:28.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydQYGcVf5tj98E1hDReTRprMYdlGLyQzDiwbbJ2yMsdK1a0cKHmvgqCPF4IRmiu49YkRu/k/DcVFJWmZPVp7fF/Md/ersDa56dOunPW90vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
Cc: ryan.lee.maxim@gmail.com, steves.lee.maxim@gmail.com
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

 Add controls for tx source.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index bb736c44e68a..163093959da8 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -656,6 +656,12 @@ static const struct snd_kcontrol_new max98390_snd_controls[] = {
 		MAX98390_AMP_DSP_CFG_RMP_DN_SHIFT, 1, 0),
 	SOC_SINGLE("Boost Clock Phase", MAX98390_BOOST_CTRL3,
 		MAX98390_BOOST_CLK_PHASE_CFG_SHIFT, 3, 0),
+	SOC_SINGLE("Tx Enable Selection", MAX98390_PCM_TX_EN_A,
+		0, 255, 0),
+	SOC_SINGLE("Tx Hiz Selection", MAX98390_PCM_TX_HIZ_CTRL_A,
+		0, 255, 0),
+	SOC_SINGLE("Tx Source Selection", MAX98390_PCM_CH_SRC_2,
+		0, 255, 0),
 	SOC_ENUM("Boost Output Voltage", max98390_boost_voltage),
 	SOC_ENUM("Current Limit", max98390_current_limit),
 	SOC_SINGLE_EXT("DSM Rdc", SND_SOC_NOPM, 0, 0xffffff, 0,
-- 
2.17.1

