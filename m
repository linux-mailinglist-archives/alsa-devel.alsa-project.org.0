Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75850417DB1
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Sep 2021 00:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020621658;
	Sat, 25 Sep 2021 00:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020621658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632521728;
	bh=DweGxCqE3ftyw1kD+xWaH/RqaBW5KDxiWuvuO/mkDKQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vfHx0VJcnW4zsEmV9WKB2RSUbDvA2b94hGlPuZIDy/7IayYinAfsTdBKNWy/eG2w+
	 xRQg1cks1pVDZtHGz/l7kVkJvXL4SuBfe/gsNbSMq1Qwcnp2JqDTHPRc+N0vEjWEbZ
	 0qCXGkO6OCD1WK4wa1GcfcIEQr47YT+9+4LdRMAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF03F80246;
	Sat, 25 Sep 2021 00:14:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08759F802A0; Sat, 25 Sep 2021 00:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2098.outbound.protection.outlook.com [40.107.95.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96B6BF800BC
 for <alsa-devel@alsa-project.org>; Sat, 25 Sep 2021 00:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B6BF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="aX7S7G1q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix3kgPvpppZMWNC5Bepgave1pvq14h3wqFWFdr/W09ljHeXZGk66kkwPnhhNyP1QYwExPAeQwx6ULTDqOw/jjswc56WMcxQ9Uzb7lj3/nb+ED12IzrlXy5tYyLRENTix8VK+KXurPMQ+GB0p5XBB4PCt2EddoIpa33DeWPN2ChFcU/9ogbZLDIooNq4/EG3DUxLb0LzXZeiP/ozo9mTCGvhNAklzsDXkRLsK2gBf4rTxavAHBIxfvWRK0hycldGadOHjdpTk8f6RekyeXaZ3Rl8AfGB/2KLbaIP7E/prZJg4PhKCPtXig+DZeLfOcDZc5puV4FBWlRRoGqYZHjsM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xkHZBvJC40c0Fbav3wzpkR6tiSBp7610yCdhQgSXPcI=;
 b=Eck3EF1qdVsiGKp5Pytgs3wB2xaJ3aqHuRSd3szHflmZTSmbTOGhikIhypkg8s4Ilj0wiEI1qCN6EGz4qaZpRwnvfV/eD+t8xlq9tYLfLPXouujFJmzlA8H0qUPjH1NlmyK9kIB9kb2LrBkRw03SQj8Imb99heU0UyXvB3XoJMFRtK6QscWRvPMlJWDISlZS7bAGK5Xbx6U7ABCIEh24j+jJwlUIOY2aSfDkCoxh18vjEtWDhaTAJTivghUhxJf1x25fbAH05+UtW/U6Q4NcibiPfmUkeHjkAx3ASGDPbnZUnAf4swUdW78IeWmy1ya88ynSwCvKgNQc06D4CEQXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkHZBvJC40c0Fbav3wzpkR6tiSBp7610yCdhQgSXPcI=;
 b=aX7S7G1qOkxo88FWuA/DXIldnuyOuhGI56RmBhQ6ws+S0qEPGWJyWpawcNTOxvrggAHeqh+gCC7F+OzFAYDzV5gPugWteoz29BhuaUvnx8Lc3lFpqQupjdSFnmtq+CPFxJEUHO71oMlz68vMQ+v9V3vf651WB0VrIXrw0wjfzKQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 by SJ0PR11MB5646.namprd11.prod.outlook.com (2603:10b6:a03:303::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 22:13:58 +0000
Received: from SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178]) by SJ0PR11MB5661.namprd11.prod.outlook.com
 ([fe80::31bb:4f91:1eb5:7178%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 22:13:58 +0000
From: Ryan Lee <ryans.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: max98373: Mark cache dirty before entering sleep
Date: Fri, 24 Sep 2021 15:13:05 -0700
Message-Id: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To SJ0PR11MB5661.namprd11.prod.outlook.com
 (2603:10b6:a03:3b9::5)
MIME-Version: 1.0
Received: from localhost.localdomain (73.189.52.211) by
 BYAPR03CA0012.namprd03.prod.outlook.com (2603:10b6:a02:a8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 22:13:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71c82b00-ce46-4ff0-7324-08d97fa89aeb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR11MB564614D11D6C73852521EEFEE7A49@SJ0PR11MB5646.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:134;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UTWASrYUdORacDtJhhq5dN4XWrVnOPzSZkX/5cmXP6gtXQ0TL0FvvU6dHMvTh7GKS2LP+yUPMDrXH3vJ3TMe3w02M8b7UERpVAy4P2m35fwKiSr6G8BF+BYVkC9Kxsdtqj/eHg+9bbM/SZrCYHoOqOu0g8e5hCAK0R32e5F0jAxiRAiW3ijoRx0sCgIyld+RfA5yPxMwXbA9z7wQNwZ1Q+UVg7yfvQRcHft4ZNhSqk0p3z2cxZMPrbIHOS/DisiNqpWKtrDqxkP5B7eB41b0ZXiGuwjrhYI1by6C8v1i6u3hNN7qW4pOZk1LHa6CszfTTluk1KFpIkl5wZVS3CaDsLFNhH0THrOpmIsKOcTk0Y72GtQ70nTIeCaSU1lTtH+uDNNRhSm7uOWLxBl81oUOxyttBaek53pvpu8ojQa1ldo8ftkniEE+UratfvY6WnAnK1cJrY7i80KQHG+eNI5veijB7gXvjW6Nll4b1qsYIDt5dMmJUmY07eoLOo62WZkLLx3aFbwnVvkJqlI2IFNN61XImZU4+E4nzIF1Uh6fKRG0JZX50WP/iXLJJE0ROvOGt7lF9D8md5rIgRgzRlyC5Vv/Jt0XFk3kORuQrA41SicmHXUek0DbgOmmiumi4j88c0kzLYFp349UD5s4QXkHRaT2QNhQFbX4N+sqNNjCUxgmrGprguNNUeePJNzcoKeH84HFE171IEeEjrBZVhV8Ml6JqrEHiiscK5vd6SLoIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(956004)(6486002)(26005)(1076003)(6506007)(2616005)(36756003)(5660300002)(6666004)(4326008)(508600001)(6512007)(52116002)(38100700002)(107886003)(66556008)(66946007)(66476007)(2906002)(316002)(83380400001)(186003)(4744005)(8936002)(86362001)(7416002)(38350700002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rb+yh17rphPd6c9Fvzc9yPfvBabrR8UD8UhcF+TiU7D0tekM9urpnVTqdEAt?=
 =?us-ascii?Q?C3MfSr75l+sp5hQ2pw+HopCse7NWtEItUJZ0BVZbLMj2ZPNTZ2a41jvtDbCB?=
 =?us-ascii?Q?BrZMxj7OE4u+z6+q9TbaPAlm+1nD5MRH1P1o1fwmi/mn8zpnJc/zSIOy1sPU?=
 =?us-ascii?Q?hL6CbzhSadGMqRnpzibeOMVWwa/ddqBTUleeQphopejcEHiypbZUTu761iPg?=
 =?us-ascii?Q?pSc4I6LXbzV9ZqCRf9hqvGEj5BMMZJIqAzUI7mhYiL1K7JyZfnj0JgcHNiO8?=
 =?us-ascii?Q?jH5OCRiBOhnL9h8CGR3mX7lznk0eWbKjK/lhB3+VFMljhnQ4glfHoD2He9h3?=
 =?us-ascii?Q?OV0AUmg/1jb1eJ+BJzVjIGhH9RlGW1Iw9aXULxswp3K9tRCsDjrd8qZPrK17?=
 =?us-ascii?Q?IqS+4nAWLqzQIJe4CqQno9Zpsvzn9ICFZSsTxOsZsuAOF55h3TgWr3C89mGI?=
 =?us-ascii?Q?CaiPfIy3Lg6IEz3IBWIeE++Ol1oa6S+vzVcdu7Jaqx9WuPP8nNxj3dOAaVIt?=
 =?us-ascii?Q?wFhk8L3ADeTuc42G1PQOguQaIWwaD4yi+V0pTJ+jj3u2iz+y6TusI+QnKyI1?=
 =?us-ascii?Q?6fUQq4H7SUP8Iy/UUEjGoLHIZqX7cglQBuFvKHZPQwA2IGOVaaX2PuzOrEFD?=
 =?us-ascii?Q?4UCdpDYrFzF1hMFJTR4FjP6xT/OetEEfXbiuI4uUegugIp080H8N/jFjt0Z6?=
 =?us-ascii?Q?BKpyIojt/xdwYrTFTCuEn11iC3Q7jYEXkFhjNT7gEVNCplTlBl9TQn0K0yqC?=
 =?us-ascii?Q?cslg0gZ4R5b09joyp144M8eEkpiHikPFcxeS7FXN0IivtWPsra9LBpGP618d?=
 =?us-ascii?Q?K4Ek3zGseDLpAb2fPrOL93yQp9/vr/IeeX/FDjOvyakdBux1MoiqQMYu+wO0?=
 =?us-ascii?Q?TCHuTEKJwAUMuuwxYV+x3tsTvcKtagcyTD9BQ84mbTXB659JsUzwXsg01A/E?=
 =?us-ascii?Q?1i9d2MpDpA+OSWrQFS8oo078xJfcRhSCK46j4986ujmqsMc8Cz3aFsTFGjtT?=
 =?us-ascii?Q?E8wH/jewJTAprNsE9fpI8C5x/xfaInMn2Z0srkc5h9iRuI/s1oy032NH7uic?=
 =?us-ascii?Q?utNnwRHyTmiy6ejYgbcrnknZIpUZI3eoKw3OHp1QzwThCWigiRX7b0tVEkUu?=
 =?us-ascii?Q?SMcXNuUDdnPmkCWm5WLY0nLUzpUEIYH/Doioa7dG4pFJnKaUEQVjQ77PXBV7?=
 =?us-ascii?Q?HJVtUgGjtU+9FeWYDTjG0OZo8EHkK7ttwooROqfJHG4J5YHpJF7rY7wDNjLy?=
 =?us-ascii?Q?10a5nB+X1MRe9BSBAZebsoB4Xy7HgGQMPrfrnS/S2Hf/4XIXj3yvYPe2SFU7?=
 =?us-ascii?Q?gfrqck8aad1Zx0C58T1nbC2b?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c82b00-ce46-4ff0-7324-08d97fa89aeb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 22:13:58.1245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sosKzA/SEcMFGsamjw6h73qLf4cvPtpqwuq5o+icb+1i26jmavoJ1v50GzpZfkZYANX+T5L334Ff92eYGradeQZD3CKZTr5tQoAHI9Tjk0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5646
Cc: sathya.prakash.m.r@intel.com, ryan.lee.maxim@gmail.com,
 Ryan Lee <ryans.lee@maximintegrated.com>
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

Amp lose its register values in case amp power loss or
'ForceReset' over Soundwire SCP_ctrl register(0x0044) or
HW_RESET pin control during the audio suspend and resume.
Mark cache dirty before audio suspension to restore
existing values when audio resume.

Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
---
 sound/soc/codecs/max98373-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index dc520effc61c..a7e4a6e880b0 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -259,6 +259,7 @@ static __maybe_unused int max98373_suspend(struct device *dev)
 		regmap_read(max98373->regmap, max98373->cache[i].reg, &max98373->cache[i].val);
 
 	regcache_cache_only(max98373->regmap, true);
+	regcache_mark_dirty(max98373->regmap);
 
 	return 0;
 }
-- 
2.17.1

