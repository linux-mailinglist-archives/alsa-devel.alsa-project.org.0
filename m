Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93FE332075
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 09:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3472017D0;
	Tue,  9 Mar 2021 09:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3472017D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615278325;
	bh=YmZb97VV3o0gDGQKDIbzWeMIRgsZSvyxGFgwVXwoC8c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=STw6lTWtMGd5qGjCD5BODZjFjPJKe9safhb/DAo97XwAB3JkHSvoAMhtPHwnQi1xg
	 htohIk/AG2V9Xk5aQAyYKhf5DVlhtTt8CZODP9BhTgnxOwNQiSUbjyC2Zu5cqxreuZ
	 TpS7kM3mN2TnDQ7/F2mTYHs615HN/vx6ArsFs7Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B628F80166;
	Tue,  9 Mar 2021 09:23:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 250AAF80256; Tue,  9 Mar 2021 09:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7BF2F80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 09:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7BF2F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="NRmsYKZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnsyPskZWofbQn1ZoAO7lu5MhCsi/dvIkeA62AmCoNymv5wdLGk6dgxuvA0ULwdDhJ2k1M5h1Bq2GFj+XFs/Zd9as0b801hKX16GwIO5IBvEaV8fuPmMKKxPOm6awGdumxJ1PUmkNAcOiqUIy9vGqrTdA5nbX4i87pFn6YPZU8ucl7lyoopCaC2nSdONBmg1os20qNaDRBDFu2PB8PLqJbZNJx/ZCoemgVeAUkGX9mOb1yR9VWgSWcECC7bN4v859hVaAeAMbX4+eYwLylI8Gm//ctEHdyNrTA2UunNs/1SG46YcT2TBtVazgnjhDlzjJsOmKjZWEku9f58dLdPDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj1rGFQiV4KGCyb89rcUrHprM1OQD0L+rJgrOnlgv+c=;
 b=Pl/6xKTAjXQX1QpFcqiUEs59b2lCv53BrIazW1ajAOJ5iFMyKoiLvNMii2oDXdFMoK7o+414Q7Qu8ndo03+QB3IWyQmIpPAr/saUmSe0VLbHVRObw9uhHvPS2JB6EBRntaeR0rQdnZp+fAQGccYNogA4caI1IUSiLThNZ2WFojZz/IUQoYrgEfuO3RLC1/18LqNmL+0ZOqD+DuxlcrvaIBQKvwKdhuvyV7y1iCckdgyP4F03WW9Z2QZV643hG5VwtZhywIVlMvLup0+9Vhuuhy33DowTYgnKCygvez2C3tPoPygmx45Opjs+EsoTBMSFC9WE43m3I6zq5x9Fpf2G5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj1rGFQiV4KGCyb89rcUrHprM1OQD0L+rJgrOnlgv+c=;
 b=NRmsYKZnMxcFGdV++fHRmvTZfnQrl+OasjT8jrjXUduw9/Lenmh4J5PoDreD/xSrf3AaNntERXqumj3nUyaNDkgPxHYQYKiaD9YjiD4jFK3BxFWcOHMx+SZXoEh2QSWAudSoDX2sJNu0ZaNLt6Fm0ElBIJdbt5pUDwzB6GZaVgo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VE1PR04MB7423.eurprd04.prod.outlook.com
 (2603:10a6:800:1a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 08:23:42 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::a841:34f0:bc5c:3764]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::a841:34f0:bc5c:3764%2]) with mapi id 15.20.3912.029; Tue, 9 Mar 2021
 08:23:41 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: core: Don't set platform name when of_node is set
Date: Tue,  9 Mar 2021 10:23:28 +0200
Message-Id: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.127.155.38]
X-ClientProxiedBy: AM0PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:208:122::16) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.127.155.38) by
 AM0PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:208:122::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 08:23:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f50c875-f527-4f74-ab76-08d8e2d4a5b6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7423:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7423CD47373D0ED06042ED40B8929@VE1PR04MB7423.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Knu4qAWH+wubBJtC1/RiAysROB6w+fjQGwH/nmEjAnaPSMtWrfViMTMvftmWZkADOf575Fi7W4GxVB0LluXEOBPUzwtOjJ0OYxDnB5vaah1f1/TmO8cyQzHz/wRrRVV68oTK2CFhVFXpP7QNU3VHlCaGaeh49rkD4erXS946BB1kIViJ/0aJ7JYI9NRKk59dWC8A0kZ1Qfg8aF16AF5UGHjyYlJ3yPA7MPw82dsiUlETu2EzegvwjBih6EglgeStQIQoGbNV0hSUeMI+JfpJGwz7l1eRQtWOjf7pQw4m5zDqbOTEyePnc+WnH99jRBHBkLpdUAd97d+r1brMaZ8du1KIBNuRortbYHIpK9NooSjYMgeJIa9QnduNYeVF4iBlCaNH48UXPG9rjiqJlvtphdg9Bsy+HXjAAZtKaNKRLyyl5gEgIxCzcKMrkIsXNx3h2kB581VD1gnXFY6sWpjbV5hqohm9KfOzIGRdK5Y06RIZGkHejJVvgjF5XVS0Sx/o0bYKQWG7KGpI86g/BXImzCSt1vsm1fOxj0/cdLIMDcDqWDsVG36MXr63DckatgZR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(44832011)(1076003)(2616005)(16526019)(186003)(4744005)(5660300002)(6512007)(2906002)(26005)(6666004)(956004)(478600001)(69590400012)(6486002)(66946007)(66476007)(66556008)(4326008)(8676002)(6506007)(8936002)(83380400001)(86362001)(52116002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SO8xF0OoCpPv1lNhTPlWlxOERax3BdKTaj1Qb6DRoMdYNgRQAnqf0bWnlstK?=
 =?us-ascii?Q?gK0RPxX2svlI4xTiUmlHsvrkRqPNSEIWSwGzkNIcxTWp1mYeNT8Qnp6TMXfI?=
 =?us-ascii?Q?WSC5sUaF1yr8TtQ9RkOOiQnqaCxQf+H5wV7JK5gx98Kq7TUb3/PFBDyg176N?=
 =?us-ascii?Q?gwtaIO8i11amfvgfSsHyqz0/fhyXbwl1PQH+PphWsv/8FqRTfm8axTlj78mj?=
 =?us-ascii?Q?zMtwUiRs7z/kIlWWCZTxfoi18bOpObAr6RsWDG2sQ3Vx23uukYHHT4zmTh0/?=
 =?us-ascii?Q?YF/71UMs1N+aTTsc/0oHwoTiTeRZWfJSY0uoRF7Qi6wlSrmNpid2vb4YoJ2S?=
 =?us-ascii?Q?VeYKmOqJUaY38tYvGDchclYdMa7LQPPlfLGBWLR+30l/wObJ6ypYZ9uR4Sl1?=
 =?us-ascii?Q?knmcdus9CMc64KpvoME301ED3G4x88JLofMB55Dv0LVNJYtJZLPDcH6VjrcX?=
 =?us-ascii?Q?lUpPuoNaqDdRL4Mc/oQM34irlb94iB3tqG9XXv4UwBribF3OAt3U/59d69M0?=
 =?us-ascii?Q?GlLg36KM0Tqh5WiF0L96C/tAMeGahKfwkwf5hCdLeik8LaEWfHMNQJcp+w+G?=
 =?us-ascii?Q?NvsxPfLgKoG5WXuTewcODmVu48grJjUGOV99VnH/6VdSYO+/EHWnTgYbZlDu?=
 =?us-ascii?Q?UN5RtiVxd34OrRjEHvXHI5VH1Ko+UbxX+nUF3Dpr6AaC97/hQB9x+Wbn4LAL?=
 =?us-ascii?Q?vC1rEg2o1PradEsxCVOsnsRDfm2hSJl5fruVo2QoJytdNKvZD8+c+9HFwqKl?=
 =?us-ascii?Q?8DGAZu1ZYroOZ3qdhofEbVoFmfmjx3OZ5m3zj/g3ZxgFMUiOLZQR8Xn/YLB/?=
 =?us-ascii?Q?3TT62EaqsXuzHKo3moYbu19AH1BHlD5p/oiKv8GwuVUI/p/ozPcFej5oiHwH?=
 =?us-ascii?Q?/FCURhLf0yWgq3w0omiRGtn54JuAl/vCbi/92wZIQw5lsW7AdoEpLRuL9hiu?=
 =?us-ascii?Q?U2dS1dENzqpCA+bonxQvyToXdeVrb9OBYPavSEoDeaIcld31H6RR3gX1lrT0?=
 =?us-ascii?Q?g+yLVoJxQb7B0oZrqaDM+/qxAoNm3P+wm2N4vnRTrOYyUskC4qsGCi0eWtIQ?=
 =?us-ascii?Q?WxK4IJSvS0bxOvJCRB0bSRM6nDtKBoRJ/UdnjR5kCx/37hbjX2YYgGES4UJc?=
 =?us-ascii?Q?dRBjYVGnmmf704+u/5+20Kopr5EZBmV1MtJshsd8fRsz0l6ODxxRjU0mKZyv?=
 =?us-ascii?Q?3VOyi5vzvbpdOt08moL6cbw9WPraPgvbKEefF3NOimZIqTLLnW5+g6crBmEn?=
 =?us-ascii?Q?8sNm4vL7V4yfShxGjW10vj8zLIvWhPAOTURGBFGN5Jc0KZ4Rd+caSTPQ74Fj?=
 =?us-ascii?Q?y7W4w00aGsXUxW7VLWCzi/8d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f50c875-f527-4f74-ab76-08d8e2d4a5b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 08:23:41.6220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTWupmlAZZzwu0HbRGEQ97LaOstVYSG9XZkvIvEVuUznz5T/c5uB0xZQ2S/Rh3++dxdq7j150jb/nbn3jNsG5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7423
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 shengjiu.wang@nxp.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, linux-imx@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>
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

Platform may be specified by either name or OF node but not
both.

For OF node platforms (e.g i.MX) we end up with both platform name
and of_node set and sound card registration will fail with the error:

  asoc-simple-card sof-sound-wm8960: ASoC: Neither/both
  platform name/of_node are set for sai1-wm8960-hifi

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/soc-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 16ba54eb8164..76ab42fa9461 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1660,7 +1660,9 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dev_err(card->dev, "init platform error");
 				continue;
 			}
-			dai_link->platforms->name = component->name;
+
+			if (!dai_link->platforms->of_node)
+				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
 			if (!dai_link->no_pcm) {
-- 
2.27.0

