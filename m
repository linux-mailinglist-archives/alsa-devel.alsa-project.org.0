Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5076685CF1
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47621E9;
	Wed,  1 Feb 2023 03:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47621E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216887;
	bh=7NDdN1rVFmuvWIzVJNVBAgpyW2bPYmoRfPJ6q5V3fLI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YDXFCcwe2rKeQT5dL7q4JhhX3dJcxZio/fKsgCwdFWi3uLn687eyXrH1Jf0MCDiUh
	 Agavi3TcDBqOZugdlFEDuH1Xz0pmZxwzPXD8mvZYBMl0eFk1mv8ABp0Elud+ymR/8r
	 vn1b9Q4R0Gtngp9LwB+UDPWNzxJIXFsXRCGYE79U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5163F80553;
	Wed,  1 Feb 2023 03:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A327FF80551; Wed,  1 Feb 2023 03:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2130.outbound.protection.outlook.com [40.107.255.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B38F8053D
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 02:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B38F8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=A7axuDgN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBeh0XuFiR25Sxo2UJY9v1bX71tEIrl64eHIWvO5VxoAKSgdSH22XH2rInHWpZfMpmLfOQrbTLnAgMV0+lT08j32nX93T+jfYD4Vijs0HPLdvxtip11ndM+3py7WvNanBaWY6vY7pahQd12dAW0WntE2mGJ/y2j46TRi+ZFR58hxAiSxhapOvQ+6OmssEQR+CPzl2ob468gXhl8mBKPlFAuBGEiifoo9dstUi83Cy/M15x7blC0DbG4k6u9H2JnKNZbnr5YaQhXKWlkoZYDshST4Q+JOKhbhkq5mf6UhXev327bYe1yAnjqoj7t69KmBFDce2U1SCs2OEbFPkOxoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+N7r45QFkjT6U2EizS1V9zFr/Y9xai32Ueyo/RFLzFs=;
 b=HvUAYGr01blWtiYWsym5U85WRRmsEYU8sCQDP75KempNveEPt2wQ94viHo+mYPeracPJBxJwCei6d84RZHuRDmwuog/6LjLQvQqGdF+M3QlELr1L7nrZJRXdmwK/BNAErr1ItVaVRTF7Pc1cM4YUp1rA6axMAXacB9Jy1pSRtDmL0VWqsW6VEhAiACaVmbWmi+7AJZnrR4YnBhJ1sDHyCDD1LUfWCz/hqrCo4tf9kvWPvfORyGME+oMSA305L6gEwzfZn84/RwknVPcMkE4xjblBQt3Mg3qu0x1MztRuZdV2/ORplup6/lDyX07gRDSalluS2NO5CZl6oEReymK0eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N7r45QFkjT6U2EizS1V9zFr/Y9xai32Ueyo/RFLzFs=;
 b=A7axuDgNbAw+2PGGGtXZlMxKd6E2E60lB78Lo8Z/zK1VjMgcKx1f/2CJEJ2NsYFboe9LbVZMkjFttPJhQ912Z+B7SCb7otAnEfYAxqBMG94w9FBiJoG6XVcK7/njRpKSab43+cvxNBPl6DCq8wZ2lkyz6WHd3U3aM6MJEHXNAVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10342.jpnprd01.prod.outlook.com (2603:1096:604:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 01:59:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 01:59:53 +0000
Message-ID: <877cx26t7r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/15] ASoC: rsnd: fixup #endif position
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 01:59:52 +0000
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: f9776667-02de-41e6-1272-08db03f80260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZWsQMoRZTyPubS5+aZEeJWKxH5+abZwaEIMW0XhXmP1gH+RN7883cdRx+UqmQg2/VrrfHlckTwGnhbdhTHCk3AiBIf+a4+1oX9YHQX8qMLLwd6svtRnH3JYBXK869NCorgTN2xjHva1uPjL6+2hqW0nerio8bU56o9CgCYD4vL7gHAbQmZ/WR9h5ibwO2fYmtIcSblXwpJQT7uL0hi/WjiLTIts0d2J6B5M9LQHsqYjB2fE5tlodWESgzGTdZAMKpbBG0Jf1kqSVaiaoK7tYUuxZIuXIDQrij5ID8yHh7rtdcF65XBO7wb85Quw1t1nQap7jyOrdCfbswyXvTaZY5Zh9Z7py2iivFamP+CE6ofld9sqaEkPvjdtehbTYCDxx5nH98ZRZXqQpqGaQFMq8ahDIT2EsqTilDiAPf4uc8oCp1CVNTsJAIP3KRaSZrCRDuzKK9sOMnaHjaew2vVPo/cX6pEniAQ6c2A3jnGP6bY7tON1ZSh7dEMcq4AEwBOIvGsVrSXdmAhGb1fwukAJ0l8wmWg0cMZIAhbRJhAFI9Tn/5FqtzaZ7wjfMhO3Tqa5HRuZker88JiWnMKY3iXFRAKuI8KalfdPCEdob68K9gd/O5Kh0S/K2IUgjGxMSmiClJxmZbjzM86K0GrrskWlWuzc7oh0MdWAOjcIc/Hs0RhtcPfCGEaPumVK2c3jPp3Y4MaCCvdqgnUcMryZ//uItw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9BW8E92XRxtgm4H/+Cqvpt5ldMLpRhkeh5O478ZUSO511hLxcSX0U/+1+9kb?=
 =?us-ascii?Q?08zasHWLePTG0iznJDOvp4eEIX17/mRkNyrCYeOHWXUSEJbyie82Sm3UqHlM?=
 =?us-ascii?Q?PxhBcobwuUcA1SLl67uRiNLhREZS+0osu8lBPKBYp4G26g41yCbhaynB+NGz?=
 =?us-ascii?Q?oJ3N0zmev/kcEdK8L/EPi1iYm0wx4Tjwc9aHwMvBHkMzDjtpIggmo3x3GSrL?=
 =?us-ascii?Q?y2rQ2kuY7dezI3ys3NqmfKBZvpsqxYIFWYPQrDsjg3WBln8Vv0h0Yt7jW/vO?=
 =?us-ascii?Q?J5ymqLdY0yUP0ZINJP3W1tVE3GB6NqnMVup3wL88O8j/5zOg1/oETrys17Jg?=
 =?us-ascii?Q?sr3tsAs6AupMQ3Qn+kXulFktF0b4Bef118PWel8xAsI3Uzj0lpewO3zdKYDx?=
 =?us-ascii?Q?A6HemEP8Jf3VIWqC6rhAtzjwVNymdr5tvn5Oda79UfYFCEfxjgYtp1rPsK5N?=
 =?us-ascii?Q?3GKtWFdQjHJYx+z6dDJw/7m+OHEPhzOaSFUMYU99iOV7QTnc1DuRVnXSFNmA?=
 =?us-ascii?Q?pfpEDVBa5Im7MWGpkAaukoQoNPWM9/Ox6WC/lArOhghm8ldb+Ozznrdd4305?=
 =?us-ascii?Q?9EqXhHMPFGPi01OA3FMxq4n6AIPaJ8YYFT55L2hMhq+nQBl8RdScNuOeUBDZ?=
 =?us-ascii?Q?25LjPg56goRMPxMYz8iRSlKinl+5OIO73aFF9/VgBI5AqrjbmnB3TmhxbtIo?=
 =?us-ascii?Q?2L0SJIO1jSU3bljRab6TttBJ9WOI7CErY5QcoSmwXzx6ecO5VIcCVFoLPYIi?=
 =?us-ascii?Q?bwA7rNsiJGEEyqoR/WDhEUG2VMtek0ZdNtXo4ZlqncopiK9PEplBa8oOiQou?=
 =?us-ascii?Q?JFmI0ws/5O1+sgHRYm/aU4c0A5P53IXnw3UR38pm3TE6edTM0cscpOJrwRiV?=
 =?us-ascii?Q?xTOixFo1OaeR4TTopJgUFMm8pzl16cZaEpGyW23+hA3DBNH1htlB0hfmmgSE?=
 =?us-ascii?Q?sJZMbp4HFHULGua0+cjBecRvpkC1A/r+Eoz86xAUMPgLlDf13lAi7DFJ+p4R?=
 =?us-ascii?Q?R0gWvUMqU7ek5lA/DsAEwJR/aSHGnNT6JI6j+g36fGkUOCy6h2aKAhnn0eQw?=
 =?us-ascii?Q?AwkNBA6JSodpIgFpTf0outz43OddVHd0I8GLwcFBej4bGjQdRdkakU2rSnnN?=
 =?us-ascii?Q?GxvVAgDRbrAxE1sTvlsLIAbTbFpkhK5ezf6rbelCWKdHSj3n2p6ZOp1P42Qg?=
 =?us-ascii?Q?2PPutAPSTC89Sz5DXkWi4/9voD0+MFp+iXJf8pLw5WMt86QxsV97OqlCalrr?=
 =?us-ascii?Q?UeAHEPf5dJVo61OvnouXK2SkUgHvhwr5cPivEkDvuco7TXnxE83NHV7Kohhj?=
 =?us-ascii?Q?2iKO/0UxS2POBV1C+jdU5OWshvTNtS24+4fT/scVsyXARa4SuO9ClE2kFy/L?=
 =?us-ascii?Q?Fip5lBSTigE/tgAjmRKRiynSaZhxCCFCZ7YyUp/u+h4z5SENFW1AQqDQXH84?=
 =?us-ascii?Q?i+8SqP9NAXwVm4cep8/NoCUQyA47j+Sp1YxLv1IVXxyTAwWoau/uHbx+DSvV?=
 =?us-ascii?Q?63bcWaF7TANYh5cMA0NV+wgkl+NzPB0Pnv3dzdcqggEl0paX55ZO/OSRGY7g?=
 =?us-ascii?Q?HA7PBBE8nXkigxLBs7MJuOHrTXH/tz5moq1gmlEsgUpXgIW/zZSLqlUD08jj?=
 =?us-ascii?Q?9ZztGexqknouyzyK0MIXDag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9776667-02de-41e6-1272-08db03f80260
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 01:59:53.1242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nboAbgFo3b3ygvuQNqCJ/OXzHxr0U/mbVXZ8wqElCz1IMitocCfhPATCsK/VGdYFh5PNPV9f3B0r2OC22CN0f+rKOjic44hikZtQd2gDnBCI7eJQFca37kU983bEbYML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10342
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit 1f9c82b5ab83ff2 ("ASoC: rsnd: add debugfs support") added
CONFIG_DEBUG_FS related definitions on rsnd.h, but it should be
added inside of RSND_H. This patch fixup it.

Fixes: 1f9c82b5ab83 ("ASoC: rsnd: add debugfs support")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/rsnd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index d9cd190d7e19..f8ef6836ef84 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -901,8 +901,6 @@ void rsnd_mod_make_sure(struct rsnd_mod *mod, enum rsnd_mod_type type);
 	if (!IS_BUILTIN(RSND_DEBUG_NO_DAI_CALL))	\
 		dev_dbg(dev, param)
 
-#endif
-
 #ifdef CONFIG_DEBUG_FS
 int rsnd_debugfs_probe(struct snd_soc_component *component);
 void rsnd_debugfs_reg_show(struct seq_file *m, phys_addr_t _addr,
@@ -913,3 +911,5 @@ void rsnd_debugfs_mod_reg_show(struct seq_file *m, struct rsnd_mod *mod,
 #else
 #define rsnd_debugfs_probe  NULL
 #endif
+
+#endif /* RSND_H */
-- 
2.25.1

