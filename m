Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC4B5F054C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 08:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369741666;
	Fri, 30 Sep 2022 08:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369741666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664520476;
	bh=SpH7HUWjvfHGzXgYO59O4errarcBRav/30g4E750c0o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHQDWe1v/w71ucHOCAavzBonrOo19uJeBwush9Jy+lZLrCVFAKyNppVQnPUGTqV0Z
	 p7zKy3lNaUC7Oj2n6poq38WWqODxBxQs04pwi0jlWw2PRZnwiUvwySwXa2desUsXx9
	 3oEVDn2uMlJ3/TSHjfwYb0xnisSc2bN0qMtKsZII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D679F8054A;
	Fri, 30 Sep 2022 08:46:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AB3AF80551; Fri, 30 Sep 2022 08:46:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA5C0F80542
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 08:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA5C0F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="MNEUHA9+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpIwnx4gDjgZIRrQOypnbUsaDKL8oLQV7oSQgfmPPTeKhpRmzVFCSicNHfI/70hzvLGVBEnwu+K2ncKc+PGRurcbFV3MpiOjZ6n6wK7AGchggkpCqMVnvNp388ChLOzyVD0kJyQ9mFaC+khIXX4o4Wzitg/r/xK/tGeqslsF25wrp8DxjDrVnETgoc9zVwdNOdIz/MXveYbU2lGYeRTjSmRf+tRSJYp7Tyz62BDD4Rcd059rn1t8NIGw7CT4mEH7hJpVFS+mKdFxVK7u/DJxlg+lhVF1oGtpRyp1Cd5BY8VrpSX5CDKf/S5i+pUz5zSndCXIbm5Hc9j6DkzkWoZlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHxRl+PyyXeyleSdme+8llYfXmkco4/2wZZPH9pkCDw=;
 b=YFmN4SJgQys0t45OlncXSRy0Ism+biuQaWjmlZVHqmgf88ohtsZhQuku+krpk8Ts8iKrrd/aAWRplgScsmEVQ7EMUvKQJrDAoTWfr8aRl5oQEN58wkqJ1uCOGDPXon30QDgF2tGOUgUjLJthfY2glsiYErSra526yhgVu0k1+IZjAohy+Fre3lXem8QD7xz/OIwg/pK3snUaObYDWWbdAfplYjZ/0ekCK5inZ6rTgwSAz8N8TgDaLHk7tktHI+FyP2DmooTbEBuQ5ws/3IyyC/s/Qaqa1p2PYhK7EZU84DVA5CTxf6GUcE95b3/qPNx/7YaKqFJlhP3bv/tCzIfLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHxRl+PyyXeyleSdme+8llYfXmkco4/2wZZPH9pkCDw=;
 b=MNEUHA9+6vn5UsL3f1W4vjML5bTtOIzHz4PbUoBluGVW1PPK8jPJvCtsIH6oXXbXScBDj9ynNYkptamDuO2GHh/T0mHznh/5azk2il/bvz/NgzGkZiO2OiJQVyOErR7NfsOGBl5DfsS2BZqdeG8Bhzt9RSnVNB0I6P8sn3gk0pU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:18 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:18 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/7] ASoC: imx-pcm-rpmsg: Multi-channel support for sound
 card based on rpmsg
Date: Fri, 30 Sep 2022 14:44:38 +0800
Message-Id: <20220930064441.2548505-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930064441.2548505-1-chancel.liu@nxp.com>
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: bea7b867-1b27-439c-e450-08daa2af7a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7f6tnQvbhwY2xYf2bYFTHlpe8/kxN4vVV8nXi0pi3wOH4tq53916hV4RlZY63/aQoiITXAgIOwAu8HTamxVLW89JWv2EIMUr2WQfMC/SjmR1C/G8UXyu5pYwBnPB9Tsl1sWf3sRY4eXcJCAvXgc2H0jVNVnGMkhMI6XYGSVwSXsUbl+tFnkxhKfxgE72CiJQI2CCisrNBMkjM0HzAFPdUi01KTR9/uodIw3Y0Tuk5a86DDyaGqMMAsG8+sCGkb1bNaj8I/pgVIcSa5rWXwnqNjVMAJz6hhdKmGGXMWJx/e8klfdK+KZah4ukJOS9NYoTV3lYbJPZoXSJLMf7Ei3bIeqKzRmCucQZwos63AmHh+aXFW3zSTebguJ5RM5vndd9/CdmI+Lo6+pgN5MgCLkfJQqY8pm8XsoC1CrWfi4nE0pRn5j/VK2jXNMlzVI/fpyE7DpNu1IwbKbYRDGa4HNHh5R8/8oy9IpxZz04gEDwKylMOInOdYFERMWVhbA2I+Xc4/pmRe1SIMIoCoGH5FFpUJ8zMySGEVeSODBLlWyrXn1Q1xZ5w9nZP9dkkVXveYqOuF9o7E3GHxwRBUgOfO0QLb0+HIWqGBm4VL3SD6rFBCKAucKtZLKsUoqGXBVNpD7xx7cXAVDBkRNDZi6gJfpge4B/aEC8P+DfQ3K7uFi1oZsGZm52szW6xpyxNFi3x/mfzfnwbM29vjfpb28Ztn1s/2t8h6rPMndwqZ0BB5JnZkdVfV1zXNMQOk2erFpvYdJv9jJPuNB1Oh7d5V9fcJtml4mSVoIZhCPZ8UQaQeK7jEYiAj/lv7hfaPkV8BcEGOb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4222.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(4744005)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002)(17423001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?beEZi3PR9Fk30CONFBCBld9MydSrQAHZWq9QwtzTrHoJ1Yry9oI864LKHSP7?=
 =?us-ascii?Q?fsYuN4nuOCgatHmFkebdvrECncGE0O8sTS51CMzTPLpXJvbXs2lAukAbdvC+?=
 =?us-ascii?Q?VhDv1jprOytJazp07JimVQwSO/K6Mp5mWSNLZXW6QgvNog2v/1l5r3LCQjoW?=
 =?us-ascii?Q?LxVRqeBzcJV/Bc7jajmB2WINw7FpFO2rYwk5lXhte/hdRv66dIab7czu790o?=
 =?us-ascii?Q?P9aEmxEe7CvrrRr5QmAAI5ezuq30iGZJvuIdu8+FswiPJbo6j1OeTbTDu/sC?=
 =?us-ascii?Q?Rv5Pv2ifKWjqjpNZRtjphDRMdUlNEtLxzO4vV7HHVT7eqoAxKFBa1VtnNfKq?=
 =?us-ascii?Q?UMVTIa/RmwrO6VUCAo8vV+16xnprIV8swHBsYwQzDiQrgb128QFLTeA5NzfD?=
 =?us-ascii?Q?8f7ehiIWtniI7OvDVBQSSi5WH0uuGbIyswgOdDabf2PNP8wRhfxqgrEuSKS3?=
 =?us-ascii?Q?8J5IDkvrv7bYDA0bhQTPgDPAWElwvbr4I2xseQ22AcduT+iQgCyZ5nrgIUOP?=
 =?us-ascii?Q?fwJ8F1NfeMEcc/P2H/iXqvq+UrxIIw609HqMJPaQfTFT843aJv0hSsL1vQgP?=
 =?us-ascii?Q?eoEj+cIvq/2DNrAGKoRbkXEvQ9348sEXUt2BsTmyLFuC7sL5jd1wXHPBOsMt?=
 =?us-ascii?Q?36ziKGms3pPKHX9QGdEaRhhLjWeWJP1kdwHt+oEa8TjoGd/r96nD8ljJOCpR?=
 =?us-ascii?Q?lH3hgAWQHEVB1YKfiAg9dNO/phlneSpeOs+LR38awSrJOnhS+9wCxdnk23HJ?=
 =?us-ascii?Q?fDF5oLckXd/RuDwwWFRR32MqTJ1rCiNXcjUrsO0qQQhgGKUe7kjHtpWldtrz?=
 =?us-ascii?Q?RqiJ/Oj291CrGyMBeV7VoOg4yPvaIsGaEcA5wMW0jvWxja/yzhIF16AbfFHb?=
 =?us-ascii?Q?D7clbTSHzNdB/hI+HrAhYHS2Ket6EtNicGnx3j8NvycWA12FZkrAyQ19DBFj?=
 =?us-ascii?Q?upbVeo1TqIdUSK/32ZsbS7bjzHg1eJiKoQxem9z9LF9LS236ha90exvdut+K?=
 =?us-ascii?Q?wepgJgwGu6kr20KVV1KovNpIfUqorH0KIOqfUEXjYmr2MmE7u1A5nOs303F5?=
 =?us-ascii?Q?ngP7tN28f8WjRK1KDAo9zwvvKtfmGpRjwHDO7L7s95Zn0hih7d0Dv8aHAXPK?=
 =?us-ascii?Q?vrT9Bl2XYB4zIU0CqqYXLNyjQpwB34phTWV4XFmTJYLsTbLXsZ5FNi61/jZ0?=
 =?us-ascii?Q?dj9wvULWHLnRPKGD/Mm/XIKLaPcGqjen/BaMZO1pToxiGjCfyeVQ0pYIU8WK?=
 =?us-ascii?Q?46r1j57OAjdvTSHlgvnexPC811y/f6otxS5ZaixlNAIi6Gtk7fCcPdNE/vB5?=
 =?us-ascii?Q?2zjX4UzuliW83g6w8NSEiNkqKeHvWNElUfxsmvYWc1BgDaGM5K4rzfUJGBBT?=
 =?us-ascii?Q?luS+eznhLYR+FOyJbZ0wHokK0ZVKl53vM7wCZCxvkOqnec9kmFZaTZQ1hn+y?=
 =?us-ascii?Q?F12if5yZNfefT4AyRBLCFwyHNNFIOG0Oh/rK1AGSsHl2e9Q4Mo0qaRAmPqMG?=
 =?us-ascii?Q?Repq3PvAkQ4qyTx1I3hHL+tkHI6eq6tPf0pyNlskKYx2QKgVlFYYRTs0q4aM?=
 =?us-ascii?Q?QD4jn4/V3fyus/9GX08Y+b80wclKBdryG5MqEdhe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea7b867-1b27-439c-e450-08daa2af7a32
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:18.2759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0f49VcUBP8oNiWjnFU5fwnsH4wqSLdCem5qsV0fCpIYaU91grcRGAmXh5N7l7+hyyF4/x0tpIf/nkBCbf3ouIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
Cc: Chancel Liu <chancel.liu@nxp.com>
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

Some sound card based on rpmsg may support multi-channel. The number of
channels can be sent to Cortex-M in rpmsg for process.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 3157cd5a837e..2f310994f7ee 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 		msg->s_msg.param.channels = RPMSG_CH_STEREO;
 		break;
 	default:
-		ret = -EINVAL;
+		msg->s_msg.param.channels = params_channels(params);
 		break;
 	}
 
-- 
2.25.1

