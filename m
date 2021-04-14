Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375335F154
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 12:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAAF16EE;
	Wed, 14 Apr 2021 12:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAAF16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618395253;
	bh=IFoiXAfhradtN6PEcbAsfimedyOWmrcNE7zudXytdCo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TZk9HNIecUH894cpKbwCOIDXfAGwSyEPUCOXs6RHG6w2GHk779Fcv9YJDqJtvWVXY
	 9lDdD2b/L6zglm63PqAnyFfLt2R/jqi1Qvx2obqEc1KDZztor3vsUcNrr1Ypj18JB0
	 2d61eFrgCuU0bGh85480qCSslX6+AnO/iC+elJ98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77721F80271;
	Wed, 14 Apr 2021 12:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8088F80269; Wed, 14 Apr 2021 12:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5766FF800EB
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 12:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5766FF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iVkrljCp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMCk+qZn5rM9yFl85COM0J6hm5Ijwg2QHVaaOioxEWeXe8wT5dS8vpTX2RdyYnIQsFGR9lLiF2c0z+uSlDb1rXdQHrIffbt+7mUoYwkNd9r8xuGeBE8C7Qa7VRIMYhZUsaJKQDNRADFHqOwkP5sQbcAcke618r2CTPssYBqdLIW2iuQFVlMLKUnRRP2z8tL3uXWQaw+1fZ4huLR17njwWeKGjmDkcYIajTLiWfezpbkLULwuexOOKB74XqVfN+Uoiup5PpspccKgeU5LHJyp7UN/5aTqRb/Pe9AWo1xqqlnXDJL2MUkFVyjhkLL3887uzqtu0ntbsNvsms/8Rk7hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3kAqYUEq4uyGtXIjIk9j0olUm4392hcOUA5iNdKVBQ=;
 b=PhcaU81m5oCBQVG3EBiIgDhMvO3NY6l1xIalslG6RqCE/MxTHNiBeV8uBTKjtKg/MoieK9oXIiYasS6wJ//svwEcWJRZ6P32f+1jt3vLpQM7Bayj+y7u7c31iYSy3iCQHHksTBqqSvNyxMXBVHhKOvm4cFmdI2FBO7RFaapLynJs1yACkoaRHvavd2G0EiS5SnXzx7VkBs33MXjPp5IA5P5jzc6+98YnH7Vg0y4XbUsax2zfT7oCPU5SCSNnv9votamCq0heuQOpyWYAm/Zx9X3+HlAMPwQPUfDxFmT9R1G6E34eLqiW+erXAsmYakZPq6jxZtyjPBHOl+AorhS5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3kAqYUEq4uyGtXIjIk9j0olUm4392hcOUA5iNdKVBQ=;
 b=iVkrljCp2O7eZjf+li5GT4SqLV82gBX9PuqzLwTb0Zu37KWLGXpje0FOXv9ZGSqB1a5toAn4biBk9URDEw7TfjIcquRziWozioIcaZ3tHP+JMyUtakMMmsvRSjofmwpUMMExxlS4wNJnRs0U0hbUnyLiINEJoSdqyV0bqSds+RE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VE1PR04MB6736.eurprd04.prod.outlook.com
 (2603:10a6:803:128::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 10:12:26 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::a841:34f0:bc5c:3764]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::a841:34f0:bc5c:3764%2]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 10:12:26 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [RESEND PATCH v2] ASoC: core: Don't set platform name when of_node is
 set
Date: Wed, 14 Apr 2021 13:12:12 +0300
Message-Id: <20210414101212.65573-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f08:5400:2300:4f6d:6fd7:e19d:212]
X-ClientProxiedBy: VI1PR0302CA0005.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::15) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5400:2300:4f6d:6fd7:e19d:212)
 by VI1PR0302CA0005.eurprd03.prod.outlook.com (2603:10a6:800:e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 10:12:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f196d1-713e-4189-63e7-08d8ff2dcd7d
X-MS-TrafficTypeDiagnostic: VE1PR04MB6736:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB67361EB5A683DDB73B924C60B84E9@VE1PR04MB6736.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ib6eeIda/wO0NkVD4A4120X2IzFXbZrD4NQPcV5rk/G5Ne4yENCEBAFwWDlu67fq4//BwYsfPngNvuYJ93ieuBF33SwOOrB15IsDJdNB5uUtnSzO9aJUkjCYRiKwelXNqeA67DMu8SCDGgzwMAKt4wLCkzQ8pf/wiKPYZ8YAfq7hT2IQqNIgyoyIKiQb/omnp/007gxs7OZ6rOdiyeo3T1H1eC1Gph1KL5XXuMlIsgkWFIurlErlAu7FEWfVVGagKWmzEpF2TQ62NDKX39tch8LAh5S72affb7KY15RHp3MnDPGU2av79j7rDFqkRWq1NDtJkhYjSdkDLRjQ9gzEInla7IsW7TVq3wk1KEyyTVqEEAVgO92kkrMS2/eRH7wzQPOE+0a2DsEfaG/3Bl/eLlzs1TFTCTYvNFT9PJQvYZAisnzJux8uZZEPtRe5qTcyhmYLz0FM1CAAczMItbZMHugjCjwWrZSNPEu2ut/5uE5TGr1Pf4bArfoMu8FCuPvnXs10td6+GQ15/plkG1k35kNR/seZ44R3vT9LahptZSBaZeC6qC3hGaOIbxJbhqYAekJ3g1ukYtiGRugwwMKOVfaEDQCVQtGT94f9z5SHTkITcQp474kWfOyyii3hl4bTOunDmjionmi4EdUPPdOO/+z3Og5VAUj7PkiIpYJeYC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(6666004)(6512007)(8936002)(186003)(478600001)(16526019)(83380400001)(4326008)(6506007)(1076003)(5660300002)(86362001)(316002)(69590400012)(66476007)(6486002)(66556008)(2616005)(44832011)(2906002)(52116002)(38100700002)(8676002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sBV+HXhNxtYcPPWf9osZqPTcUuVDj/3dLC/RTxTqqYjmFnH153GfLuG3F03E?=
 =?us-ascii?Q?/CIAUB8gQE0fIuMhTfwC10ff1udkSv/cAwYGWOci0oP2i0B940WivR/cEmz+?=
 =?us-ascii?Q?P2fOPtFySLzQCzvavGXX4dJqM1Nro5KAhBhT0JzHT+V+/tVifQcM2pO+ZSrt?=
 =?us-ascii?Q?9RTDzD2pUWRVZHaSpftR4qsG/a3qsULlO3qd3ILpx5C7c+AmgJHUOBR0rq6Y?=
 =?us-ascii?Q?rvwBhSGl+fsmEgcwLcJBUHr3qvlGtMFIJ37JpTVHl9wXVFza1K1c0E4dSo1h?=
 =?us-ascii?Q?AkemOusk+/zpGTFoTKmGF8B527laZXZRehkR+/kN2LtgZkZ1uQ6eHrlFW33s?=
 =?us-ascii?Q?aV+6HhwXYdPgoGTs5AzsnLgb2gqbZepI5Feih2IPfRG4ELgdvzbTp/bN2cZ6?=
 =?us-ascii?Q?BkiOP52otsgeAXiVlSVTmNpzAWGBTnSqO4SZNtEUXjEcUrhnzwbAwMgBdT5a?=
 =?us-ascii?Q?48SYEdwFmYedeC/8zHSe+0bmXx4mdzGbn4V2NFuAmX+OSJ0yHsQEagdTWanx?=
 =?us-ascii?Q?1VE5eEyJJuJqsMpsHjsFFu5oaPCLr/XRq3X/mWyLL1CJEJ3wF2WnFo3EjLyo?=
 =?us-ascii?Q?vfxng+AYudn/90S1njcbiFwu93HaNzlQcYXSmkPsy/bF5drjv0ItyPtf55cd?=
 =?us-ascii?Q?ojEOlF51HJqXbMoD6KKq6hMP3RsTe2afd5FyzXg7iJh10zi+SMLnRNj5mVkI?=
 =?us-ascii?Q?cY+uAMSlhXtJw4SWwwwv7OIJsp7unBganweBXtcT7mFWidjL824jAmiIoQ52?=
 =?us-ascii?Q?LfTQK+2phdoiRtUWq8G+rjmrgFCx4wY849CIIZUtdEv/SgqHZWrri3xelQCU?=
 =?us-ascii?Q?12xRJjkvZWrU1Tu8nPi7PWVj1MLcP+JeupvyivIjYxPzDcAvSvElgzeBUpFa?=
 =?us-ascii?Q?++LWgh7YmN9rgamnZNCB3yFLrJWe4Im9XUjxvAk1SNRGHE1wWvnAaMMwWyph?=
 =?us-ascii?Q?xMUifjQcziondqMvPHtRFKsKagAlnLz2XYzUCsovUJRwA9iiQc4HfxIlq4yb?=
 =?us-ascii?Q?JUA9+N8DhPToA0vGywEImZHJ94A7j+VB6wxSlnBGrweg5LEseuHgb2lt6kr7?=
 =?us-ascii?Q?6dy6lpx5UrtRsH2ZeLLhpbL4cyyhWAM3niz7MtBGrYPYJkA3XF7KTGimSJGj?=
 =?us-ascii?Q?ZEgEUVaKvcyt7yU6Da40pKIv6dTVtzIAhHjTJKgkwg8pqcEZeDo7s6nRb9+z?=
 =?us-ascii?Q?x79Z2HBsSJSr+zmsyxnrDf7AJNuTvqU010kyP8e94h2XJhtb5IV7UFl7xDJS?=
 =?us-ascii?Q?wQ+Hrvy9tUgKY5H+x13b2KPEqXxTrac3Iz4peM1SjMxJvqMwegt4IHlYm8OF?=
 =?us-ascii?Q?RXn+xp58cL27Xq6c3BvNGn2n1QPnUpHZL+zoV7RZGZZ72XN1dQZeMGX25CWS?=
 =?us-ascii?Q?AKhCqn/iQq2IGr50oisv/nE/YGyA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f196d1-713e-4189-63e7-08d8ff2dcd7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:12:26.1782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3swDEB/KXOzVE6VyRUV5StbWz57nApXyVAqU+fvEt2iJs1fjtnBn4QIupTtFSHKo+GkVUZ/4uZZzYa+yMw8ZcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6736
Cc: lgirdwood@gmail.com, shengjiu.wang@nxp.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, linux-imx@nxp.com, daniel.baluta@nxp.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

A DAI link has 3 components:
	* CPU
	* platform
	* codec(s)

A component is specified via:
	* name
	* of_node
	* dai_name

In order to avoid confusion when building a sound card we disallow
matching by both name and of_node (1).

soc_check_tplg_fes allows overriding certain BE links by overriding
BE link name. This doesn't work well if BE link was specified via DT,
because we end up with a link with both name and of_node specified
which is conflicting with (1).

In order to fix this we need to:
	* override of_node if component was specified via DT
	* override name, otherwise.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/soc-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 522bae73640a..7a1c011a7fe0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1648,7 +1648,11 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dev_err(card->dev, "init platform error");
 				continue;
 			}
-			dai_link->platforms->name = component->name;
+
+			if (component->dev->of_node)
+				dai_link->platforms->of_node = component->dev->of_node;
+			else
+				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
 			if (!dai_link->no_pcm) {
-- 
2.27.0

