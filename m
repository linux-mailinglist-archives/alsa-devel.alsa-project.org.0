Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C695E76C1B9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:56:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBC7851;
	Wed,  2 Aug 2023 02:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBC7851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937785;
	bh=Ef0aDKg/CPuVOMnydOcMEZQJwjmNXMu1TwF1O1t4uKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j2Chqz3hS+xxrJSSs0et2W94O9A2dmNCM4QknrjDTsmsv584dl03dCvNzgh8IAmMK
	 YLETmeIjFJO2QrzXe2b/5DebHUrqBTkURrPgkGcVhny9lPukIO0rH7hw02ay2M7hVn
	 oDoawoqUkSSkR8luPw7e38rqK49nyjNLWcIbAPYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD262F805D7; Wed,  2 Aug 2023 02:53:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D0FAF805CB;
	Wed,  2 Aug 2023 02:53:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D33F80568; Wed,  2 Aug 2023 02:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7339DF80568
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7339DF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ernGb0j0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhkXqS/AK9HmR8WkuCiEaT5NukolQiAHOVbDToD+KjWkKlbkYxtutrc4xaqFXhYyW0OvU86Ssv29HaNBvPvi+cI/OVBRjfCm78AWKrP4/b3Bks5lVO4Wth3Q5atCKBrWECrumvxy/z760j3Fa0m+vCOkyoHJ1KSXNLK+7Zeoyg8O8wDyQ1APCg7bOOkK9gAmb8XH2M7rauaGsUbQhscNwHze/PsZ+tLAT905mHUx0Yo6a6TNKyv1ZGUwHsDGtmiKMnKtV++lWHw3WAj2mnyVjN4f5+uPbdtsAA0jkMcVw3mstsccC4i0GAe71LR37LYro8v48gHf0+Ee65ytv9vMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDRhyYVMPokhTjxNvUj45xw6yAEhct9O/EROsCyy9D8=;
 b=Ljy85DMg7hmiTOnLqdMSoMRwoYKzK4d3lPOgNsBkG8T1pmjWb0guMS6+Glj0kRhtXfVDappbAK3JNzYXFnkthPhw+Mq+J7clxZ+wFNiqkHDTtjCCc8oTN1oDBqvLG9bTcgKFsVM6HK3FPr7QcJ5lTb/nEA5DOIrls5KxSsK0B5MVpuGq+1i3Fv/iUxttvM0hE3cWCR95f1wxI7oToTSzpzMlmRjdNuroOUGraSZvSbam60JvyTCQo8A9BaXxurZ2qdLv2SCObHkMCyq8UlJZnXb51dcGMpduIZWakbP9O61fmf79KRh9BG7wmehotC4wI5EJkSP6cxXvirmH6GRyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDRhyYVMPokhTjxNvUj45xw6yAEhct9O/EROsCyy9D8=;
 b=ernGb0j0vjuM1K6vROeDeI+1VX2jMOTyg1KYo8NTEGQqVsiLoEXWd9QTupHs25+dXA/97aynsI4kjXX/Fy1a4vbvAXkoY8Zd8T5rWb2LvP8Vlg58HWdhOeFGVNhaO9H3wxg9FOuVy+evmAMnqUNj0uKOXUz9rt/nhFFGXI24T+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:53:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:53:45 +0000
Message-ID: <87tttitgbr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Jyri Sarha <jyri.sarha@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH 11/38] ASoC: sof: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:53:45 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5954bd-40b8-4e49-86fe-08db92f2ecbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZc1aehlTJ5N+Ik/M9rGgtOxrWZL7rMBmxKEkKeNhR/MvWOrahJFKFbGixHINPaMHygxj/WmSOlM+f7VZvc6X3v1zLF2sY3MVRNmW1WucaywLZt9atWumHSw30O0JoMx8grk7JIx4+wVmKv/viHA9vw3CLeTf/2NGptSvfgChQWbpRMrTUsb1wA8R+Kua6rwVKhIkwVMhgQ5gAOBGj7o2bZF3b6NHFEsF9uvupjPbMtmLmKREthwwuwI1G0U4Bos83YeHmFRyMIdPSdUqSrC3+89TngFQTTCX12eofFfcFEcWHLRTYr3LZ571rQOtm5IibUAqJRNEL9pVkFY9jVTyfD2qdWgGEhhUMKLoEzFq33MGpjSE4tzzlCmIBQFg9qfKz3x1ijiyN8fz7/gc2PIHlrnUBpk4HZTCX4+1k7iELaBbK/OJqshm4KKPLdmSTxrE/gbIhMcZeBKWKtPWCQ30t3dZ3ZF0iznyqIXG25bRpjFhUvzBPv92zbIUC9jocZj2/pxSkTrxwZVYSqj6JYJwZ5mE//nYURfMgZsWb+hYZUFAmSZy/XuwNREGZvDtIUmD5ZvOIJjQaqdz70CtI3ZYz662NkxcLn83zhzl8nTw/SiJuBdzLbEPUE7d4WE4ql2XS03eWlye8aOT7tp1//jFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(7416002)(26005)(4744005)(86362001)(36756003)(41300700001)(38100700002)(921005)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qAOYpt6qznmg8YvILh1vwvfusz+fLskTMDpBPbyIzb6OGo9RDF0dPRf0U0JH?=
 =?us-ascii?Q?33yBoztleuZIvCY7NP3OTwOpnyeSWd2ngMTUxFEAJ7hsH6+jrL9CryyT4Glh?=
 =?us-ascii?Q?Lg6LUK26k1bgzmW4gP0G06wXhkEpGeyq7C4oikEO8ikxcex+l5GmvdcHTo3d?=
 =?us-ascii?Q?IybScasRY73eS6USUclEW08VJnpyGppYr40QlLXqFwpIT6T2oAhwVljbHzim?=
 =?us-ascii?Q?/UC0twpZV8SnK81+15O8mUkiWgUhP32AHrNtkdZofLJiAh2QPM+LuTgAj81E?=
 =?us-ascii?Q?PKf7HzYMsXKYAdTNhoJ6S2BXkLMYOcFzRLsaMIMp7pYR5bw6jjo9aLl20BFl?=
 =?us-ascii?Q?2sCY57J8V3+7V+bmj57rnDjRVQEaCvMp5e2IhVoUOv1YHNUPQBWXh/eAG6eY?=
 =?us-ascii?Q?fHj9uI/5TWjxoiHekIk30XxUHXIRmVx3hXiKosdqbavbhAm7pv6VIlniKeoF?=
 =?us-ascii?Q?k3e0KBqvQ96SW7J5d71nMcw5lRbgH1wYR6quTY57z+Zcj9WL1AQw1jwGpYXw?=
 =?us-ascii?Q?mO1k4mLcdSRsgyToI4JGHUgGRPA7+SfehRM9Gmr0H5ZWS20/2hcgHukpI0Ma?=
 =?us-ascii?Q?P0ezNlwwALsyGf54uuhXHmVLhOZlAmW5yGI5fbZa+By3J73vID58PQmfTZxd?=
 =?us-ascii?Q?/cykkFCOoSdCs6/O+OdVBo2wZBvQuQ2xucLJKdpdn6iUd238qzgYY/ygu28o?=
 =?us-ascii?Q?tcD6Mxv1IKAyhOMP9h44xCm9vRai/ndoue5XPoSOH5yKMAOv0gz7HtOdq3aM?=
 =?us-ascii?Q?OSO6y3Dzk3j8AqA0TdWEeRBxM4PTbISCG56f2bEEqYDtx8Xq8DsxR/rN1Qoq?=
 =?us-ascii?Q?xZtGRbsMotPWYikPUhYyaF5GTtri8AgNfPuiOuLPFFbkNSBm+U7iyTyoUX7x?=
 =?us-ascii?Q?04LB6hn8ZDPWTRjxUVV799EvHVU9nCIDfBEO20Y09mvuPUymFAC5rFU1QNKj?=
 =?us-ascii?Q?QJcRmLz3Eb1EXBJ/XVs2kCXqSKLSl40fhV7IlsPiNvYePSykZfVXEdpbXtCX?=
 =?us-ascii?Q?Wnn+ilYga/WGorgfTgJ8Xoe8y3vFOuANK83jWJ9hoUTSZHQNciu40bjBNmuS?=
 =?us-ascii?Q?iax+UQ0HOnNOPrk9JPN8iKvoET6NS6jYxI8Hh0paRqXTkAnWQFhYmibaotw0?=
 =?us-ascii?Q?tbnHB5xnGwwZ3haa0imgkwift37ZGPxXZre8JjAVNRJ+yPIlVQyBW1tQo6WS?=
 =?us-ascii?Q?WRhK2uXlZVYAyZuJBucbBQW+M5CdUmHSAZt52gIiyfXFnuHj8SW0iom5J3NF?=
 =?us-ascii?Q?ct72nDdn55AJRYgZh5Iq9xP9LjOYnLK1HtGj3ohLddZwiLqAiCC0yEsfz7hh?=
 =?us-ascii?Q?g/pE4YX+0g+hobuKHNcayu154RFlXTCrpq3/j1PWV8FhSe5M1bkpMLy/oIBk?=
 =?us-ascii?Q?PSu/IPH826YRvVnzZOcdq2JzlekZBzmioALDjS6LQh1aXDIYwtgacHXcmUkn?=
 =?us-ascii?Q?q3TALFEFX73nR9vYP34iko7T11MS++8tHXRWoSQaCkNw2JvJrQpVGDd0ungQ?=
 =?us-ascii?Q?1rNLe5CI5YIsWi3MZMiSxkLQ1b0+ifE6HSGe9vd6FSTfa8P0/ZIRA/wGDFo3?=
 =?us-ascii?Q?x+aPDmImbEfLL6Yqhk4B2B5GY2YgQOdOClENu4XyR2JlVXBdc/HP9reZgl52?=
 =?us-ascii?Q?FQkMEChdmLM8jr/KUFX/zrA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f5954bd-40b8-4e49-86fe-08db92f2ecbf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:53:45.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Bg/MZvpcPb9MaCgxLscFJuTCcAI+qoaxnpOVjJuyLsmjUJsaK9MWekpASz0cA+KDOL0fVCya3iHNWREGycNY9wi8Qab4FyaEct1BLZj1JPeD9WDMeaHjP18E0VC58zOE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: T6AY7AFCFEHNKBRARMBAPAEFQJLQSUJ3
X-Message-ID-Hash: T6AY7AFCFEHNKBRARMBAPAEFQJLQSUJ3
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6AY7AFCFEHNKBRARMBAPAEFQJLQSUJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/sof-client-probes.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 5530b5d793d0..740b637822db 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -354,10 +354,14 @@ static const struct file_operations sof_probes_points_remove_fops = {
 	.owner = THIS_MODULE,
 };
 
+static const struct snd_soc_dai_ops sof_probes_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver sof_probes_dai_drv[] = {
 {
 	.name = "Probe Extraction CPU DAI",
-	.compress_new = snd_soc_new_compress,
+	.ops  = &sof_probes_dai_ops,
 	.cops = &sof_probes_compr_ops,
 	.capture = {
 		.stream_name = "Probe Extraction",
-- 
2.25.1

