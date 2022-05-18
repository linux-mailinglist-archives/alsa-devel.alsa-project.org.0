Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF252BB45
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 15:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A80514E;
	Wed, 18 May 2022 14:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A80514E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652878831;
	bh=vc/4BfisUH24Tri2Y11UaMffcd4+cI+dklsu26enZVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mh4fCenBLoKuLPaWd9xa2SDXWCtJgYm99apjl23smAkor/A4dNNXILP4oPD4WESQv
	 Z1yQjHbgccdyHQ22YO9fSIF6H+SOT+6fxoDKZ8LOHH6gwRZ8q7mLxmun5s3PU1R6Ul
	 REdOSq5hZyv9nMGR8IVjuoi8nM+Jv0Fc51kP5Ipg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AEFCF80279;
	Wed, 18 May 2022 14:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F3ACF8023B; Wed, 18 May 2022 14:59:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::700])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EE3BF800F0;
 Wed, 18 May 2022 14:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EE3BF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=vivo0.onmicrosoft.com
 header.i=@vivo0.onmicrosoft.com header.b="C2Fpp1Qt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msQFGqk5fm8b73HydytZTB4TeDkU06/L4DOsL+Rm74D32BIQO8Fyjwuqqwv1LTujOTWBKSeid5jUx948qq8pFcBu3nr2foAun4lBAK9p+k1ARD8Sy+XRyWeaZSNVWxVeYDHX2JwYcnsfjaN9hVMrXbNm1qALkgOuYEXkmlFeBlIUUqnCBcnsuLVaLjweXljcfiDKBa7i+bEbEbiO7jw9AUhz69l4JjljQ3TjOli132Rqjvr/5sb2S2f8a/biFERjWgUWOhgboM0/aErCSxb/X0FD/3T/SRwKfHLTbDkKsPNsWGk2x2G9NldmhpNrMeyJUWVy7NYGgkXmJMmEJxS6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cN+tG7KiWIffiBFA9/zPKliSX4KfaHSClX2aTbie5I=;
 b=gaZWpbr9keaiojicGzaam8HzkqYjDlYbL5uY944AhG/AmO03auQmLy19GnZi4Up0WlXzY5GeGkrA8LWgzXV4wMnEGuMZQRUyejlD33VzflyCXMsPGPoYwJ0b3DnNBgSbBnw9d85rEGBzmHpaw+9oh4rA3mlvZCQejbwqtcH/gQfBcWj4YGW/nTEfIj8DFtokAsrbcU5P1/3GnV2hrrxDGq5Aoh7ptlBd4RVYmLF/hDopdWXRk+4ehulofhNoeMqcv15CYnDcHYXTn47twyg4Rfp/fI9wJZef5XxnMdBKb2M8FHcO6i/z7uW16aLhk7b7zAtf+M3DjWXp5Ir5JJN+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cN+tG7KiWIffiBFA9/zPKliSX4KfaHSClX2aTbie5I=;
 b=C2Fpp1Qt2pgwMURUByOVHOBLqx/b//zidg4al/fJmmrsSHcV/90PV+7pSaZNK86GJnvtkgDEHI/h1RLS6mIxdvA4BKhjMe/3zqWzVJUzJ83plSuKlGJ9/gr6N1D+Abti9XRMNokc2uMmyuQELstzy1sUfSkf+qa32k1Z0b5VpwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2425.apcprd06.prod.outlook.com (2603:1096:4:d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.17; Wed, 18 May 2022 12:59:14 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ccb7:f612:80b2:64d5]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ccb7:f612:80b2:64d5%4]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 12:59:14 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: mediatek: remove duplicate include in mt8195.c
Date: Wed, 18 May 2022 20:58:57 +0800
Message-Id: <20220518125902.13407-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dfd6e8-c82d-43b2-ea84-08da38ce351e
X-MS-TrafficTypeDiagnostic: SG2PR06MB2425:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB2425AAC0FFAD767D77F00946ABD19@SG2PR06MB2425.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXLZXvJ902TBwLDdnn17Rkf4FezaX0iR18DiMGDQ9iHdyWxPIMzjZU8oZ4T3H5vjukp/0qRhpCfK0JUuZVCzshAcuovJ59DplmDYgYX78clXR13z3iqVKKvK51U7MNikA7NO9CEMD5FlHgx3Z0q8oxsf15CJiBt1yF2cJusl8ffc0t5HTHxw94FPI52JOhnuGvw7ftB/yKyhyPw6MGAv7IheaJNi+pYdP2GsnwuWuHjcwNys0gyaWNOH/IaHO5VtElupEWqJiVDfkwbhj7qIKoVKP0W8QrDapSG/PMoN2nDTprT3ztqn3/eFOXtEYbn0AmKgoShA4q8b3PPN8ccUFWgBxbNG5xhw2NUa6WcI41TRA0DHGBl8CUZtkZ0HaUtXlcg/5fvBPf0MU6zQNgbVqOl/oyYnh2R7mkM6PInWz8R24K+bq65GnEewoHnyy1Pn0SLYtz2FBwvPf+GaprDuJOT0WgDCXB0HZCRPrGwWAvnMOdDkq/PZsJgFCjyHz3unG5wHdli1+b/ZitVUDy7SjTYV9ybKABQpnxfe0K+GEPW94mTjNsidATp6ItkWSWgcF8ZANHOvgGpZUSZ8KEhkydFJkmnAqCnIEUxXaRBd7JRP/oYrA4rmOJ9zWfddT0rfVuK2j2YXhf9t9OGasgx03bXLiRL1tch5Lxa/7g5836f2W+AfcwS8+iC9ZAerdNUfJjO/ZYmbHxaLrzgXQ6UcBd1QrY1qcGsCDOQLp2jKep4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(7416002)(83380400001)(316002)(4744005)(66946007)(8676002)(508600001)(36756003)(5660300002)(186003)(66556008)(66476007)(6506007)(38350700002)(921005)(26005)(4326008)(86362001)(6666004)(6512007)(110136005)(52116002)(2906002)(1076003)(2616005)(6486002)(38100700002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MnLzxgCgKKyuBNNl/V0B2JzIrn0CWBD+CpJGNNVUnFvln27H3Lq5LxiD2sT5?=
 =?us-ascii?Q?KPEKMrafSWgS2OiGqEUrX7Xzh7QHPs/VkqAGJt+czQGvnTL5/bFlQwncBSQH?=
 =?us-ascii?Q?PaQ3sYWaG2Z5xgHF0Z6ZJB+oyGufnQ29IVx/j2dEPchmrCaXPKw6yS5OdVxO?=
 =?us-ascii?Q?uCcZGakeJyf3uEz7OHmx9aSGXIPsurOcY7yPcJishJk8P6nfnHBftTIfMYX3?=
 =?us-ascii?Q?88gC5yt2RbI71ZlmrlqOHnAle6bCAkD41aHldzN93MhUobbDqlYmfxPZFHMs?=
 =?us-ascii?Q?KeK/V66g+wUqspYeIFRysodP7MN4oEIglGC0JU+NIFbfB1ADvqAwYWNXXe3g?=
 =?us-ascii?Q?l0ojpQx83XM4PAYIsGrChRmI2UL4vFVaTVJaX0lAd+3xXI8Fji1XQ5pmCBV2?=
 =?us-ascii?Q?KWfyHxQq0sCkFomHmPsfFnmOCf0Z4NePErx+zQNDjKTFuiYM10P8rzVQk30S?=
 =?us-ascii?Q?B68S21jkfw8liWEQm7tLp2rgHj6B82sFNIFsHh5AnPJ7BPJJWyr81XBFzDSk?=
 =?us-ascii?Q?sPdnixie/9gNxKyQ86Z81hsQFUQ2/sxaXMXBlEKwU5Q1CzmGudX34kPxDVN0?=
 =?us-ascii?Q?Jj3/MgsG/c1QBF94T0p8uWXfbqVZr9oHp8VsAN/kJUmi4zHW+WGOPBSdUYVH?=
 =?us-ascii?Q?TfNKGuo0qVKAl/ppR8EX9xlfrP3pUceFv28Ti2pVjpjOyD5kShwNZUJfWG07?=
 =?us-ascii?Q?SYTfzrgEEqMpEd+KiG9AUUAIdxawhAzvOAd4t1IjGazKjsC1xl1KE8ebrqZa?=
 =?us-ascii?Q?SUnpQ4irli3qXG8mVXjDqrZGm2HMSLP7LPAc3OwDL4lDACgRAmBmfAgYNfGE?=
 =?us-ascii?Q?exp2WK8B3kx7jiSspSpfCHX40hAu3rx7sRWG8cItJNvrKb6DfbQ79wLFr7rF?=
 =?us-ascii?Q?Ou8+TSiLBI038D9S/3jnkmip3Nx51Ud54Jr0POacTUMoMDTZ9lcCvyL77RJI?=
 =?us-ascii?Q?TD1t3YMWDNNgbsjBFxdcHWinOhSaFeKMgtnBuVHEO1L6alz3KQs8GgIhTc1p?=
 =?us-ascii?Q?owB0WJ/qBP0ZHyq3bXu+fhI+JOR/RpBRQkCCqN/Tk33e7mTwkp+ARMQPatNF?=
 =?us-ascii?Q?oShQbPmpptakCm1zx6bgkuHGXHh+FUnTDqpMiuRNMNIkcj33SZm4ppjWYE9E?=
 =?us-ascii?Q?PP2jVPUADH/gRmK9ygHyifR4phMtCVrLA7Qq0CFsnfNWqULX/D+Gw84OfvpO?=
 =?us-ascii?Q?CEOvRm7rcm9dcOu3PRmGxFge5VFUBSIDGf9Uc04gospBErR0VBcIculC90m9?=
 =?us-ascii?Q?oC/9hHS8QzUA+IlR/Dfm2Q9NLmmJBNFYz+ogbkiTqmBX6zNMVivArMG/WIlk?=
 =?us-ascii?Q?QTDUkcWTeJQ1Bb91PT2vi93y8AF+GEE33RFyOKHj6FWS7FPkjGJQ6NwxIu2A?=
 =?us-ascii?Q?y0t6x4z593xbkXEQmrx9zSogXnGwJCfSpie4rvbBYijMOGAiNy9ic8/Jvs9f?=
 =?us-ascii?Q?lDM8oXdgE82mYieNod+Vw9iGdFuIcV7KPfqgm9oKEm1kg+aI8uoPQxdoVkw/?=
 =?us-ascii?Q?QA5o8ru1BduyH1dTRZPJ/Br492ON3IG95N0I7kKP76bQDS4K2i4lF5IctiUr?=
 =?us-ascii?Q?86hG4Prt/26fBOhJhzRKyZHWy2N04zN/kfhUvYqWc3YMYoBH3npnGgOHuLsc?=
 =?us-ascii?Q?klq9GiIn7ryzphs1l4q/2jeWdt+ZVPYGNEfRPPcgV6N/yoI5v1sl8tsNCnMV?=
 =?us-ascii?Q?Avds55O8e69Ux/5D8TEn2cRve+QrTs8vOjbASrewWxFsDtqbN7cN0yjnmG8a?=
 =?us-ascii?Q?HQYG0ipZ1Q=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dfd6e8-c82d-43b2-ea84-08da38ce351e
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:59:13.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzbsw6AeUc2GS7XvtCAi2Q861pci+HNQJPZkrSeBJU/F4tMeGOXokGAheh6Ok37+wktRhLyTWjBv89XysjOgEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2425
Cc: Wan Jiabing <wanjiabing@vivo.com>
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

Fix following checkincludes.pl warning:
sound/soc/sof/mediatek/mt8195/mt8195.c: linux/of_platform.h is included more than once.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index f4b24afb6f75..7278132300e0 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/io.h>
-#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-- 
2.36.1

