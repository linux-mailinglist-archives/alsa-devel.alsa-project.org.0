Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BD3485BED
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 23:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281011ABB;
	Wed,  5 Jan 2022 23:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281011ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641423316;
	bh=3kKvh22MCThEOLdCD/Pqzv4d4WChZ8gHm1iq2aBqRQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LyjLCgEObZ0C/SjGO/z+qwXVgOv7pJdFC+5Svss3/9X53SprLOwqwyEX+iIK3Vfqb
	 Cxyi/cLRD7TKnfZC0aGiRha/y2qZ9qULk+OPdVFRxt51HZs3zjR1W+EmX2rqvtXSxC
	 0HuVObgEc/Kb/9w/lkV1srHyxBi7XBUHykDK+JKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C36D5F80524;
	Wed,  5 Jan 2022 23:52:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69CBEF8051D; Wed,  5 Jan 2022 23:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A7EEF800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 23:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A7EEF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="sWaWwtPy"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205D3T0N019799;
 Wed, 5 Jan 2022 17:52:24 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dc72w9gcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 17:52:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVLC2wrvRHhuJsK/o/mdCD9XV4DpNjIQU+1SCRvhC+FVSymGzZoOh6JFyDHUEZ/VxSX0PLBvQtcVLCQwznJmnm4v9fUFnbE3ZF+TyqBA6yC5bq/ptXHDPboKLu2IUcZRMMiv7tk4RrSf0gdh4YPJqpUj067wEH94yxHYniieS/dUyTFODmvkhpjJIRScgSQ+y+Q9eetJMfMcuk55iv0TSvlCB1jCzQYhDY+2etYeQKSsJ9FUPF7/gnh0QgE6W1OOwqcsa0BOqeIuzGixZ4e8gHKTsgtm2vxVHUZFKBW/pkpphuHC67wvog4vCwZK6LglUMJHE/YyGroaFQo8USjGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1b8wmatKzzCjGEPPM/mnK84tw9++aSItra6VC2jDg0=;
 b=kA7b9q2YAwMf2sb/JOOqkgMbwmh9VzAP0wU4IbjW5bQ6y4HhtZ1FM08v5zkULekL42BAAaucaiqAV9NY4YTPrymjeD/cey3KYLSBpLj3VRSxvnuH5sYXP2Qo5xjLYSrpE17Y76WSWQ+seVf+UtGlrQmCHEie6gJrPPsamyawPxg+PYBBOb7Sen42il7S/ovg+KakqEKmBz2i68w/aNoBj5PfxUUqAH8Tuu0E2hR4e+bTVkiCkXJ5eIlqNaVjcju3a0bU/18MA51PZSaUX+dmDj5KSEFVsEXorNzQYnbSRCL8AEBKH4FZzW7sL/rgUVgh1hwXb6Tz9/yNaYsTx1G7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1b8wmatKzzCjGEPPM/mnK84tw9++aSItra6VC2jDg0=;
 b=sWaWwtPythdudvdDk511TRwbALqs1mLPzm7fsft+aa3vCe5yUvfqzWvP0pnxq1yP6XzbbjTIlPbYZqel+/htietbsDUwLnHMgv/2BZiv1vHxOcLHwq8FHZyzFACmhHWn1DyVKwgWdwvDu9SRAVqsw2uWjZO2cQzp4S3JS6SRRdU=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 22:52:23 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 22:52:23 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: simple-card-utils: Set sysclk on all components
Date: Wed,  5 Jan 2022 16:51:46 -0600
Message-Id: <20220105225146.3517039-6-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105225146.3517039-1-robert.hancock@calian.com>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:610:77::34) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4f69109-f86b-4c1c-6a9a-08d9d09e099d
X-MS-TrafficTypeDiagnostic: YT2PR01MB5120:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB5120C31EB708268BA2BC23F0EC4B9@YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEpyiA2Q0R/tziGMpnQ1uaf4Dt9PyWR0NIUzt/bGlYiElkG/aI3ydu0MdYws1cDamIS7zyFouOCaVt8TRKCcndAh9riWZqQNHLroW7RxL13RmftY6LgB5es1IZ0tGN+i6ejU74Szg5tL9vN5fqw0MbYuF29xmZV61l+MM48ECxFrv59TGWVHp6JxNttIls/ZY/KMPi5wjjSTBdpQY1XK/Laa/u5Rf36+0Te2rYcnDSok2TyjD6BcJ+RJIVXk1YrFAMBNSlfncW9kXOp7ABRXhB+3B8DZDYyy8XPDPKTg6+tRUh0tLLY/Vr9Vd9HT4FZmantNyqUBUPIAN/km2ltonHsX5K5dIsxfH+7IlBc/VjdGEqFVSveRi3irk/VJthNk0LT0PalQJdN50NVDAYEWpi6UG5TAo4LA8Zi7WoTwrsioebZ4Bol4dTCapHFP2tBDRKy8WldWfGBHFfcRE9Nkp3mwjXb+KKLgMXmU44nl+sxb7VvlrSHtBm5IYxm2uYpWvlyNxCZnk/ayzD185zJkwGeC0XczshmLq66Aq+M49N8/z8hE8fKbariXzDrcHqGoa5FSHW+m/oGF4w4PB6k2yxbnGry4hfjoEbdgHDDOIS77ELD9zbejehBP/xDy3Tsm2Z+vgG7s4oSqD60tgpk13FYRFQEBaoxjNamgd9HaNf5BGgS28/YxwyApW+1nXEb6u0QTVYXUgsdFZ33Gfb474A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(4326008)(508600001)(6916009)(2616005)(5660300002)(52116002)(1076003)(36756003)(83380400001)(86362001)(66946007)(66556008)(66476007)(6486002)(6512007)(44832011)(38100700002)(38350700002)(6506007)(6666004)(186003)(26005)(316002)(8936002)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kx6aSzY0peZilaOpLv6QzQUBdpWvu/EdNRM6jLnZGvNy0lVF0Piy5AxyUXxf?=
 =?us-ascii?Q?KZV1vJejlD3LuoMwBB2nvZUaeNn5HzcZBZ1raE/XAP7HvhqWUJiGkYABVtYm?=
 =?us-ascii?Q?YufFfYvWmfvFcfN3hgbmKCc/Rc0N9JZjkaIQ50equhzBfsvmcvEpkdrOIOeF?=
 =?us-ascii?Q?+B9BV6j1WY8QjtWhDxDr8jgUqPSFWkFRTWAkIZtoRiBw3y5UtXUxAy3G7RgF?=
 =?us-ascii?Q?u+RUGaEt0mBxjKQkYqJDmdLDK6X/R5UU3+uYvX19+m2AhHGvNmKPM/p7eZwQ?=
 =?us-ascii?Q?gofb1hXuBL+paVS6fpN0/2vtZZsi42LOJr2p3Fydhsuw2pOIPGUz4nraK/+M?=
 =?us-ascii?Q?QZbJIOrg6Vis6Y9SlEmeC8qtl4+df55RmBqI350G9U462E5q8v55jPmu2x8t?=
 =?us-ascii?Q?QuaQTWhmyMXrgdTLoSbStVafZWM5n63OHHlV1cN56pfND4fZRDmAvUaj77AM?=
 =?us-ascii?Q?g88rBBScs9zrk/rAWoLZetLceJgv8QnCJv1/pIia8nIr4BNFsaM+PDf43/V0?=
 =?us-ascii?Q?bOeKTAeRQv65JhCWTiVCurYBtxDBl56Ol30lNTt6zsqRjlKBlvpiGnvcAg+0?=
 =?us-ascii?Q?//wJlwUnBsAnsvWQQB8qeUOkAaqsxMNpTcrfgXRBGbdKBJZ48wWmdExF6xNz?=
 =?us-ascii?Q?h6pYTaOb+MDazyaExY9vQOJB0Wa7OavoEJpUEgdMv0RImN6udGY5P5NQpyyP?=
 =?us-ascii?Q?cV/OAZYjkfcCeAcw9HXJvTh0Me/KJnjqiQbYlMbb9gvh/91m38bc2R6qO5R1?=
 =?us-ascii?Q?FnKnGFpMHMVFpO5ubpinK9zbCNcJnUF27zb2WAuzQ8xV4AyYHbnfiKSKip+7?=
 =?us-ascii?Q?2sFZLsThvjCjd+XblGDgjCzpoGWK+osk+fwiDMKYjneR3mvjnFGn6uxddpjy?=
 =?us-ascii?Q?+3XE9fMsJyUFjsqKXceobiu7tAyzYXPQPGD1RAl/Vi2aOwBnq89MPFKXYVnX?=
 =?us-ascii?Q?bYwg9LbNL5y0zQYraZV+izscidQZAZhuwxA7MtNc3/YbgGbxcreSZQfZIdEH?=
 =?us-ascii?Q?K9UUIFcr72qFfEypWhgEwyGIXOB4ih6ZkEj3BvKBEXiBFsmw1bz6/K7eM47D?=
 =?us-ascii?Q?OTMBIv3UIpD8lVRPSm2uZvC0m2au76689ux+ZTVOmfQOkNYqMJi5lAc42wIC?=
 =?us-ascii?Q?2t5dX4Ng9ZNvfrxeLlveh4saKfcSx2DP9jy/H6lsT1c3npn8Wzqmee4Tk2Gq?=
 =?us-ascii?Q?oY5tUWW+etpgW61JAFGQk11haCMugorP024bXBkWAJo02YhBD0SRs+aT9NFB?=
 =?us-ascii?Q?Mw2pNrU3wowkQC5ypBsb3uQSc82F85JQcsyqFZuKnM3VCG84IM95RXPCu51e?=
 =?us-ascii?Q?GKpzITnkCMKzkz/rGV9YcTdWyWjZrbmDzVk1SGwkKwM4BFw3Kxuf2W+pUZGK?=
 =?us-ascii?Q?rZw4TdmYy+zv5H7rzQYZ4FJ7Pn97vcN9vsbm4V5aiJej0DSeYqbNQEwX/sWk?=
 =?us-ascii?Q?rm3Sbueyc9KPXE6VPFdpUpS0UckchPhmkBXQnOJHn2+TNR94zfHUFo5Az2/x?=
 =?us-ascii?Q?boai39urDDE/FPZMk3KYbUjtKAf0MSkgN9IK2oT4qjEmz/17BWgdkMfop44W?=
 =?us-ascii?Q?yjFV7wXKc/asbnsD2V05VtVDSjW/YFh4VRMAp3flpNTP2cdne5CE057Ztu8D?=
 =?us-ascii?Q?2+ahih2dJrpptyFawpVtq4kBNOrcrRgpj3SBOtqTeirZJHPjLx8/JakvbOxu?=
 =?us-ascii?Q?v/V4lDtXFaVtbqaZXa2jQS1lfRM=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f69109-f86b-4c1c-6a9a-08d9d09e099d
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:52:23.5909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kkeOz6VUZrgkL9j+OWB+AyzqVSdKLjT66IMgVvNGfhsz7NV+4/ubGSjq/KA0AuohDemG57y2u4ZP5nWusLnQzbQfxQnVPujyYPNRWA6BDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5120
X-Proofpoint-GUID: szf1Vgn_2oITyD59hBSn2ZZBJrPZIp0p
X-Proofpoint-ORIG-GUID: szf1Vgn_2oITyD59hBSn2ZZBJrPZIp0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=905 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050144
Cc: kuninori.morimoto.gx@renesas.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com,
 Robert Hancock <robert.hancock@calian.com>, broonie@kernel.org
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

If an mclk-fs value was provided in the device tree configuration, the
calculated MCLK was fed into the downstream codec DAI and CPU DAI,
however set_sysclk was not being called on the platform device. Some
platform devices such as the Xilinx Audio Formatter need to know the MCLK
as well.

Call snd_soc_component_set_sysclk on each component in the stream to set
the proper sysclk value in addition to the existing call of
snd_soc_dai_set_sysclk on the codec DAI and CPU DAI. This may end up
resulting in redundant calls if one of the snd_soc_dai_set_sysclk calls
ends up calling snd_soc_component_set_sysclk itself, but that isn't
expected to cause any significant harm.

Fixes: f48dcbb6d47d ("ASoC: simple-card-utils: share asoc_simple_hw_param()")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/generic/simple-card-utils.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a81323d1691d..8345a750b183 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -275,6 +275,7 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 		mclk_fs = props->mclk_fs;
 
 	if (mclk_fs) {
+		struct snd_soc_component *component;
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
@@ -287,6 +288,16 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 			if (ret < 0)
 				return ret;
 		}
+		/* Ensure sysclk is set on all components in case any
+		 * (such as platform components) are missed by calls to
+		 * snd_soc_dai_set_sysclk.
+		 */
+		for_each_rtd_components(rtd, i, component) {
+			ret = snd_soc_component_set_sysclk(component, 0, 0,
+							   mclk, SND_SOC_CLOCK_IN);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
 		for_each_rtd_codec_dais(rtd, i, sdai) {
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, SND_SOC_CLOCK_IN);
 			if (ret && ret != -ENOTSUPP)
-- 
2.31.1

