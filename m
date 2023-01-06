Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37D65FD7A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 351901411C;
	Fri,  6 Jan 2023 10:18:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 351901411C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996780;
	bh=9jlWhmh4lCwYSsNp/IIkwnAItioUsLXJFYDZplZRWgc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uFhBnAyjkmeOWRmzd2Lz3eqLws4Eg4CK7y7Ii5HFzZiRiB9qgsAYQxpfxRpprR11J
	 4j8ikyS2RHZdwq1SE+k5I/xMb3dmbTsNskSXm6rxl9J6aGdOYHfwMMXrYlT0zBIWIc
	 vLDSujoAttsZs97ND2yy4Aafmkq6QZFHI2ACD2Sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D85C1F805B5;
	Fri,  6 Jan 2023 10:16:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A2B6F805AC; Fri,  6 Jan 2023 10:16:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2040.outbound.protection.outlook.com [40.107.129.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F10A7F805A8
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F10A7F805A8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RToJ9lXo4QGrmgkBqDiVQO/wDnNTmaUTpiPDTV/+OUV4O/iY74ZwfcdjBgJ9GIRvLXjdH13EqtQdKPecyhn8l6mwpCuCqcALm7xtfi+jYelF+sRu+CKE0hT/HCpgFudDEfa9q41a9tqA8JZ/LgYYsduKQ9bzhUrlWNB/ld7C7lSNDs7+ghb2dOwiMb1w/56T7iRK6fHbWQWVkIw9TfDFEL0MpV2SjWv0c6sjNpNRPE2CD/Oa+tqbfoiRU/JnVru5OzFDtVTXB7lnmpxrmB5RPVVr2vcSd/3z0uXtBKc4rVdPPYOILLQgpcmxoPYz1oxFyhofjsGWI78HjZmhnzVPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt2RT/WM6MW0rGbGkCu3+VPqq8ny/2ZjWvWnsA2HAAg=;
 b=fELt8ctD8MGi6ZnHI9R4yxP8tiDHVrJMcgjezYNflNC7ktHn7wHWK1r/+M8Q5dyPwKGLNNp0uT20mVvTtTrr2sXN2n/fsCobtwJnIdNZarRDB3hNiH1Rgd4Cx5oW9ud+mAnpR/xDW0h4EBC0x0t5opzgz4eCcEvcdyjBPVBGv3GCc1i00hiJLOR+4c/vo5JBf3KBNQVgOefoyKMM2asFgyaCeJhwV9OQ99UiYx+xABGob3JIzFP9dG7FKc/jISyUjBt3g6mGIANGpPGVoseqjRwZacLs/Drn9oGw2CtlsHRL4kTSsWJFmDbETPbvnNLSu0V3WSXVHEix1UHobVRJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:16:01 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:16:00 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/14] Delete the header file of "linux/version.h"
Date: Fri,  6 Jan 2023 18:15:40 +0900
Message-Id: <20230106091543.2440-12-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: b29ab964-d9d6-4d9c-93da-08daefc6a0bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMu5E6YQmNfNWfaiacn2eF8w5cscme+mAonMuA1O9tQ3IYjzBIWRXtgna0nhJwlsy6poS0ntA6pMDHGSBFTIhZbBbYXwjDb1Q8uQXG11GM3cjfGBiw70/bzGS6C/tt7QovDm63ohrprypgC5mMEJYaNM2pa0oe02IFcJbtFAXFS+2sE52M/EHMgQyyrJUTohLtM64hrA8e9df+cGE6/lSf8BIlBIQjA8twk4X2clxBlA8kW7PLTpQy55jy4f8WECVu9Qh/s0nLLcZI312v2e6lxLDDzZ28NATP22LIPYXx4zvEv596F3105NkGpb56S4A6/Yp9fuA/rFmLNEMvyeCPSkWnVIJaadFwQBGWFYJrQ1NHlrpqjMcwZMFBs2uulCNzk2NSKaUQNkkZ2plrx0WFIz5XD7CFvP6mSlaLe2UOOcaNXgIas6XD+fJLYj+9pLYWBCeJiXOR58pSSRjt+b3gA6xmutKkPQ40Jt+Z2OQ4zO25gMt+YvuvSaT129iW5tntkAXtOzmCWBZRTL/R83/y4FbcBkhW2wdcE40Y1ruY0O52BqM557Rc8RFvEeaCciThyaVC5Jxq0mVkujy5fj/D2lW3OEjxCExQFJfy+PMgedXwbRyw4wbDnoYsxE0sqPIjyN16GgoOIpONq75AUTLsZ+XQterQAEy8qwjT3MipjyC255p28+RwXTE0JZx0Fp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(4744005)(8936002)(2906002)(5660300002)(44832011)(8676002)(41300700001)(4326008)(54906003)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4++UD6RKBfH4YjzGpASLhRcq+ygrtOwYHjGXaUbR78pZ1EWvQBFb0CMGfPF8?=
 =?us-ascii?Q?1SRb9NuaVmXXiR/LkUcuPZa2EEV6i6OR1Ui651mV3aka4+9k0rexKX+0crYy?=
 =?us-ascii?Q?dwllqITsCGXkG6bxOeRzTp8VSXFUI3be06aB1ZpZjv0Qja9W4GvZyOpFGR5j?=
 =?us-ascii?Q?mCYFCUF+4d8jsI/SgzaC5niwzDBtLjWJdWWjssbb7aJfSUdV3v+R4iTRXl/b?=
 =?us-ascii?Q?6SeUTTajqEGGmJXUEIn8HEwQ0Ro5jRvrZ8MG1BzYoJ5q6QGf95oLEg3Ikvnt?=
 =?us-ascii?Q?tUJk+lO612P4wgPRYPuumnx1F4G8j5aAbV7dLfVQfyjzZ9uVNqQLWDyZGKFH?=
 =?us-ascii?Q?PwTq8AhQVnrdENIQPfFn9TK4O/AEd1Z+E/y7MBFzgH982U7Q9pLmhLuILPF/?=
 =?us-ascii?Q?tphFQAPRa3hZkcEww0VjKwB97kco5hzUCZZQXoDA+0G54bigufvilYAUUy5/?=
 =?us-ascii?Q?MfUw+DmnBqaVeTTjbKCfiaINBsCA96spY0Q3sk0m9ufc8eJLYm1FZGQsPowu?=
 =?us-ascii?Q?697wdyVXMSUaZpN/Z5MGE9ZAGat3J/KA6AcfrDmZRPmTCBpG6PEuwfuYzDpZ?=
 =?us-ascii?Q?1AJtikZHPiuZennIW1lO1eLSnmySRwSzJKKoOZi9kHl8T+eBUxYjjDWnEDPT?=
 =?us-ascii?Q?XKy7bhSF6A5bK16AB1SaIAELjUdviz3oEXL9UzM3EQDGKTtLu5XGcSpsK3CR?=
 =?us-ascii?Q?CXJDRkMzeyaOFKaZIKDoiN/Q/kL3AtytefGHVSAu5TjdQT3L2+kbBPzr5xCF?=
 =?us-ascii?Q?ic/qR/JY9QrC8yvuuqUmiysXZ9ARfFQCLa6pierDO1b8l06M/sz2k5jE057k?=
 =?us-ascii?Q?zE2G2rfPyYsu8ZO3dM+hCYo9DH05km8GVATKHoBv1mnsbhV+kyd+x227dlap?=
 =?us-ascii?Q?R2Z/fjszj6bLvxTP+in9A4Ol4iZel9spkaY/RYcpbTxD2IC/47yGTXfs602F?=
 =?us-ascii?Q?iq6/lJZvMiGd3mY/P1cHRb+0V2FIprjOl4+OtW2X+HqPTYBDYcifeFbJnCtT?=
 =?us-ascii?Q?L4HFY+gWRUmNyqdRknjMqjNBE1Cs6ml53g9zPcaebKhLHLfO7ktbELuH3nim?=
 =?us-ascii?Q?YK2pmUG+SDiyDgMcYTA27uFJkxLdpO8eQNrgMhQcpWC946x06sVGcNDsOpru?=
 =?us-ascii?Q?5mSIEkFUOfFbndnb1loM20n1Ln5zv4uvD3sYefbz5Bfwo1TyPpcRXJN+8fo3?=
 =?us-ascii?Q?5YPY66UJoU/Oham8bEynj/qRLA3ZYVkopZACmA1NK54hY+FrV925iO7Ofe6v?=
 =?us-ascii?Q?jNvO5yQjbsB0QjHOqlxTF5HG4uBbeUocL7RE6Hj71il61zO/yooK36pI48a1?=
 =?us-ascii?Q?IHp38uz42jILHnyhLGNE4YAAkYnILzfI1U022gCNwkb5IkNNT8Ehs11KHbev?=
 =?us-ascii?Q?fUn/lii9mrjExKDuZHCSF9Ib3YlITERBwl5fvMMBnmmuwu1XIAR2Kz/e34sE?=
 =?us-ascii?Q?T4bHorioeAEW5KG8owfP/+/TS0wUSRXwuZLsoreQarBc/Z/gNRK67Q5L2WYv?=
 =?us-ascii?Q?99aE9ISNdUj6kZn8rI7YN+5mlkVvw0rzpGNg3SlTLf0qCMFhRabbJFAOESfZ?=
 =?us-ascii?Q?kViGXWuFTj5T2yGLWTiO4PUMpAGKdrwwCiLAXrlqZp7XpNOFHgIdVn+qv2kH?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29ab964-d9d6-4d9c-93da-08daefc6a0bf
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:16:00.9256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOMXMRA8tuXAjAYOJMA8MnN2WO+IRbZa+oYLDhKpU1XWFr1/MnQZkucDMi/p+9CmwM3aUNH/7LUz+ZWdI3WiUAS1HmhDc8t3hpZVfdGPH4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>, kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/codecs/sma1303.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 0b4ca935ae9f..ea4356233c2f 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -15,7 +15,6 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
-#include <linux/version.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-- 
2.30.2

