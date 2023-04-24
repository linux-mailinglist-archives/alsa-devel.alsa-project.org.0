Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF66EC3A7
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:37:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E7C9EA8;
	Mon, 24 Apr 2023 04:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E7C9EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303856;
	bh=OI4Eo6bdd0W7FF54rrbfPVGQl0riK+lYu76rfvJhPdw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XtZJcYKi7Ba1VBPb7aI699BlovsJEimjUHiL7w1Wo+IVRxGiyJ1MwCvk+GNd+Cb7T
	 34LvOM31c3PXN/3RGgvZJiAX9YJ2gaWRmeblRDL824d6lsUA2LyGGaH1qMxsVayhlC
	 fbPC4GfTDYeqS6s7Nw+xo1Rj7hgVHspn9x3m1Xck=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA17F8053D;
	Mon, 24 Apr 2023 04:36:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC92AF80549; Mon, 24 Apr 2023 04:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A179F8018A
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A179F8018A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bsvVnuWZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWoRceTs0t3dF2XT3i7kTj8a/DcZYvbLWGvPKHzG/kSVlVdyfVmIx8tMy7RbfbzqWCPgQ/DTmvoK1+ZnHTcmypMVSc2QoRDvSjAS8cpAoklGVLdkV+LuOcbGrCWbcbIEjrPOu75ZN3ErSI/kTm+E8G2qHQoZW5oeYYBxlbTcnRKYMSyqyPGgZTM6qyEmpzf3+BVHTYRltOeFd2HO8OnG6tUoCxnKXdneWoSVIGxUHucB//XucmXPz15U1Rao3qxyeyNXuY95x90PsDSGy9pAi0DhCjpZxj1CFgwzEHT7bEvGp5ADhTL7iGTqYRn6D682K+R2KjNXx0ateAsVUljayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFEzoj5ylnZBAK153WCPR5FsZ1MSB/ZXoMC5zaEaTVY=;
 b=UzgMhSCCBmsSoAVOi2Rier4k4gKrq+j8v3sJ27ATpsQZqXr47KKI7H7mFOjbSKfrrWCtblY8tekZQKfLt6q4+6eA0Jo8bxfihlBsTbdhEWgid1BnQgZBzdZQeteov0MoZUzkgF7dVxxr9RR/Ol0LdyDWQdAUKqaOSqu8ui4rYRPqQuA8sNLz85+sKcCizpbyEt+E2de1VIpQQ6/lssPV6N7VEdAMDdudiIFIzlMkxCXqI+7+VXZvQuoHy8PeOCcg1+otbAmJX48bX+CJhdRMk4vU22g05RnGUjRqpXOAvt0INPsYq43ydF0W1QQCU3Zx56wch7JSw45PaXKsQ0QBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFEzoj5ylnZBAK153WCPR5FsZ1MSB/ZXoMC5zaEaTVY=;
 b=bsvVnuWZUFR1/OiH+6Y/ZxWWaMhz56DZUp732ZBfKnTSay///CJ70pLKXy1hN/KfIVysMY6EmjecAP2qy7+OInWdyDX89/m+lQ0PcFnuZ0S3gm59gmXj5/sa0VHuWszmx/CI5MepLHKRE5wcyCOsAqgB8+BSD3pwyth2ffVWP5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5681.jpnprd01.prod.outlook.com (2603:1096:604:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:30 +0000
Message-ID: <875y9m0zwz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/13] ASoC: amd: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:36:28 +0000
X-ClientProxiedBy: TYBP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: a48e1fa7-4739-4165-914d-08db446cb515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1YbP1qioHjCN0pBygNjmbFZ1//M9rOEaz6nabnXBDnhJ4OiK/F4m3tMGFFNV1YlZsBquB4s45Vyxk9HYG8zu/MWMHD+SZiLIEeop/jtdZqoAKfiLc5JPNmKgR03pLiNHAT6E+ZzUh72UDlK8KR6D7QxoWI+zoWcEEDrO/If5xL17TRuWTskJZLi5UyjZl3DBdxqym0kSTu276z/kEaBtE24T8qG2YOvgFzLEc+1oaYynGK+8+3Bg5CGZ9ClAF1YIOXSq80KqQuBrYPQjYxlxV7NZTWpDcsvJ+72orHtCe5jEOtw/rGHuWNZwEdoVV9m3RSPBkvFekhqn6G3VBz+e5u+FeXa++GB8BDlwWLORChwO/ipYWdHMfFwHANfhGdHk52AFbCHRmXq+troLWsMYhS0uZ2/SuBHLNpvMuoDDkFOY6iRJwZqeZx/fBF7LOyrIl2g6wbZ9sOPqtlpdZQu7NfGfnhiEJbdjP3CUDPLqeFdxSvqjZiPt68XVxmr6fZIIuMowiJmx18r39bHqGKCGKVeQSdu9V/VpRLmCcBayihWHFFOKBIqlm3AuL5Hi/o9H7LYnJr7jM7cnIhmGB//1b8kfzZ8/0hVccj4fYNzpK4i1Q/dQDkMen7I5uk5HBq+5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(110136005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?19iB3qr9Gir62TEkY2oS2mX2rfE6Z6PN7q1pUBSme2mTbWgue3p9gMLAaumc?=
 =?us-ascii?Q?qwssN/rKDhe753T0TthsS51BqIJY8Lq2YG43O53Gy4X6e3evwgkoo+IqmOIx?=
 =?us-ascii?Q?BsCzryWmk7cE+/2jJmWSJURP0wN4QffIDL9fbNZFR8f9qS3LvDBvTZ/QxCAx?=
 =?us-ascii?Q?3NsZXnYqp5aONnOKdrj3SsxEVvvORxzwyFG7CpvUMdGTosoOmb6QDp4toCMD?=
 =?us-ascii?Q?FU2MGjWl1NTxt/HOYeYNPgISTsDsooEFOdIONwjcASahVtSxTLStSSYsD0Ru?=
 =?us-ascii?Q?6N0HOXWmErHfHa/LXGiUqqJ0Q1Txxr/jgQhkEleBPygRHybm9TyV7gmRdmTw?=
 =?us-ascii?Q?+FwSUdRdaNm2ikuz16Hi/9UdbuLZBoJNYF4aonaDHA+j82cbRgrmm+mARKKs?=
 =?us-ascii?Q?Wo6pRRoLPrsYRT2AGhi10mvblvqIlpYbFvymC3u6rRMllCNBt1X1opDPKbka?=
 =?us-ascii?Q?xDQv/OAq0kWRi8Fox47jAwJaShxagvLhDRBlF2lvcADnRqxAA3r6FSDCq+Ej?=
 =?us-ascii?Q?wl9XMILSE8lDZWStK40l6ACI11MVc8hy8iDRQaT/dk9iL0E0UN88QO+GyPRA?=
 =?us-ascii?Q?+awyr7cJLuUFPMsl0AFRT4UfvSxGHHXUKSWEnn8/zU3rZg1qAu7LbMzkhAk4?=
 =?us-ascii?Q?0lNoOANU1kB55NaHz8SewG926n7/2h4LPYXF/hy6DcoSymny5Gs7DPNMtObL?=
 =?us-ascii?Q?mJsOrqFVKf/kCgdSUPK2u6d1M61NpDky5av0GBbYeCkwaJPovPK7axEFtCQs?=
 =?us-ascii?Q?hgsNjhZwTYodSPIe7aU0+7a/PzA5/C9Rb8t4iBst7rDgw8xKF/gKNX4NCpoM?=
 =?us-ascii?Q?enx7FRsXHJjGGBXMkvudsZATghWC7csDwdFBnx1cO77HieugeYLgTlQMbBpM?=
 =?us-ascii?Q?W0iyV9xH4hwFurAUOUjjxpPC5kY4C3Zu0mgoUNdnd9rLhHc3q86XizbuMnqF?=
 =?us-ascii?Q?gyoTm1DQl/SkKw9f9MQ/QuzsV0suHc2JJEiN4VxlktjyEmYsqKuqFiqOzE5M?=
 =?us-ascii?Q?NiHOY+wYQhvjBpxQuwsfgmouqPWIzrzIrs+Njk3kFEWna2mhnxhDTufNma33?=
 =?us-ascii?Q?BeRPO4IK0GSh+fHM9B8LmtdaEBjkvluGoQOs/pv2NZPX0LVRwjmciBJKAqCC?=
 =?us-ascii?Q?ivBYwIVWgjG0GyRGHlLt7Cfmmoa6w5MR0pdSLeBNWbKw1BEQcbL3V6Xmlqsq?=
 =?us-ascii?Q?vwV5ghtVxMaiiZD/VjSecFUIC24XjX7DDsO2T+IRd81ZfgCc9P1okb45OABx?=
 =?us-ascii?Q?8bjvhxdTiFy11g4/GeVwsfWSuxEjtwzZgT52CVOAvQH4LEVnvsO93hyO0Wtv?=
 =?us-ascii?Q?yqED9cjSOezEI0G9gi82DkHuV/Q6N/6I2nLB+YAR1+JkJbjXBU45s3VncfhS?=
 =?us-ascii?Q?KViIXR5bXPrH4GOhR/d76C9rxOY6i47mEleTlSNIVlxluKlf3wy8QzdNxcqU?=
 =?us-ascii?Q?udLF6wPWPMROsdKLT2T7W24riajDapCu3VLRXa0NJ54Y8li52mKW+ksNY37y?=
 =?us-ascii?Q?kRKKrOY/aHwK8sdpqIQQ29XMYjjKKifBnCftbqscuL50jS+nsRpMz4BC0w8u?=
 =?us-ascii?Q?UUG5CcFlnNAkFIvNIA6kedu05nm1wtr/jmnsDsQLAWi1SKHtVn92kcqUvkgX?=
 =?us-ascii?Q?4yRMmwpe5fwtkFui58gsp20=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a48e1fa7-4739-4165-914d-08db446cb515
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:30.3248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HUJyOCan+6dYahGYkbJNNtgILcwHtPJboZTjxu4uYDuuAGEaMqS4NvqNdZ9KqFO8thoxg7oeaFMT9VI6H5OMfm7Xk83FBjDZNRnCHf70cPaBzHWUFYnLkSKGYwPIstfR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5681
Message-ID-Hash: TWLAFJBHZLMNBD5IQVNVO6ACJYIMFVUZ
X-Message-ID-Hash: TWLAFJBHZLMNBD5IQVNVO6ACJYIMFVUZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWLAFJBHZLMNBD5IQVNVO6ACJYIMFVUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 43 ++++++++++++-----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index b4dcce4fbae9..6da17140beea 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -795,13 +795,6 @@ SND_SOC_DAILINK_DEF(dmic_codec,
 		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
 
 /* Declare ACP CPU components */
-static struct snd_soc_dai_link_component dummy_codec[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		 .name = "acp_asoc_renoir.0",
@@ -912,8 +905,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
 			links[i].codecs = rt5682;
@@ -943,8 +936,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
 			links[i].codecs = nau8825;
@@ -973,8 +966,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
 			links[i].codecs = rt1019;
@@ -1005,8 +998,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
 			links[i].codecs = max98360a;
@@ -1076,8 +1069,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
 			links[i].codecs = rt5682;
@@ -1110,8 +1103,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
 			links[i].codecs = nau8825;
@@ -1138,8 +1131,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
 			links[i].codecs = rt1019;
@@ -1173,8 +1166,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
 			links[i].codecs = max98360a;
@@ -1201,8 +1194,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_codecs = ARRAY_SIZE(dmic_codec);
 		} else {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		links[i].cpus = pdm_dmic;
 		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
-- 
2.25.1

