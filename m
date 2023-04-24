Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1326EC3B6
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15077EBB;
	Mon, 24 Apr 2023 04:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15077EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303980;
	bh=m+xZfpMXy+lWn0UWWMJCstJ5QTye3AQY4Mqg76ANEvE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R3C29IOjjmtLBKS75s7ftH2JC3wa6HAPhjABfpoySd6o4o5rVxb9XG6/75dJLrFNK
	 rWWCP+ETZTnSOEiwwThoEeKfp/8j4w8bx2d3GN5PHgsG3DkXDNHrjVjc3Mryk29uvm
	 F8Kb14qwF55WUzURscyMfVSF2KP5aVSJNbF1O/nE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A939CF80580;
	Mon, 24 Apr 2023 04:37:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32AC4F8057B; Mon, 24 Apr 2023 04:37:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F088FF8057F
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F088FF8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KjXX7tPQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxPc8MJNYqbzlnweDjTQt5HFkZQSjvcStVzrLiJ8seVNZQWxIBJ22GP9VjVcFSN8TaGs351q3yHwFVYDgKHejVZ9mn3pZMme9+SKBzucy9dNDcBEbr5VrWKRD2US6DdvYKcgA2PxeGF4/gF8b12yjyeIBz7htouVzha46tg0WvH/e7TQgI4DN30vhWsSgw1V6sfmOB9091eRdMMNDdv6dVTX2l+cMXiSbeAOMvddnZ6FfU07ncFZdJCo5HpLscNolZsuRwegvYyxOSV1N8JIZFHDCCo6RIzsGBgjci9j5sGQHGKtzFaXz/NhxE3s78sGpFex8IqLYUT58vSKsTCMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHALLKvRqwVUSarTtmkNf+qljxSSEj2bATVBtvjdR2Y=;
 b=cVlZb34cjfRBrfv1Pk3CiryocaeZeAK44Pj6h8Dvtr1lXX19nb3xCKcjqgamsJOA+/wIVao2GylNTvMUuQlPvfr0Vqmyw4ixDQO04x6QzLw9ykU9mgM27MeIcGNZch92hMKixvkjAYSxWO/gOsOOK7QZi3B6oSv19rSqIzQSeUCMrds7wBp/LudJJlxRiocDA1TYC0+bRXv3y2UP3pP7TBDDR7pmdekhpJnh4/rpTfTFFstb6J5COz/Sam+LpmFcDjgLDvaXCOAG9rZCawimAcOu0Fc1R8fYGysNMFuPBTeFgiXZc2fR6lhhp1ABfn10BQUuF5CDICeA3Rl9OVB08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHALLKvRqwVUSarTtmkNf+qljxSSEj2bATVBtvjdR2Y=;
 b=KjXX7tPQHnzrR3srHbqffDXSJzAarAKtkE1fiKNQdz+ZWPKdijR7kjAi6o0Qapui0kLASrKNeaTB34ybUW9Lph5J1EuSeDZ5r7+EXVsgHuPVGsqLJpeh3WDhbzGO/wuwUahaVLWQHa9yqBktOEQzuXUIwhvon3nlXNrJwjwBBc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:37:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:37:18 +0000
Message-ID: <87v8hmypia.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/13] ASoC: intel: skylake: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:37:17 +0000
X-ClientProxiedBy: TYCP286CA0226.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: b308eef6-ca76-43fb-11c2-08db446cd27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HmZa5HP3h1sog8ay6lRvEw7cltei66MLFpu2s8hS3fmnIGe6SbjfkoyRgAt2b5zO6v9nz5W7KZHCKxA/4owPvIqrc3YaS5MPLJiSCsncIlJviYIJhrCCoTBs5YGlZS/b612CJwnjSnxRUU7O6nb39o3PYPAKSRnQOKXnA1E4MwfnAR77YeLMw/gEafRKP7CESCtUr6fcF3XCEXDbbWAbV8fNwIxaaocWOcVDRsQjMK2LLaGzt1zUeuWUXuKxOFnAPcAF2+4/jG2UGOdgOhe4TulJBLu1/6vMuA5T/TSh47jXxFg/PRIJgV/FI5y1h5ra6lZM4iSlb3FunJkd6Xr1uwXPUN5lIyAV5EcPZ7KZT+FTza2hWzywJmsprBxJOQdFjLNDh3byVC/+vgGKcGO0kzSrn+BK+AGbaC8eAy22Mm4+Eiig5HSDHffgkPXTbIA33P5lPVVQMCxtMrt/B67jaYODpivSGLOWa74xBoNDGfAmqFc5OAxud02Wuu3sCkwl6QUV5ovVkOQBZBs85qd2nFp7JVP16v9NUlk6nnYktnPgjPRKz2RAXoy0hqwDAx5Y/2bcfGmklFk952aGOiZEcX1y38K5g2qpVdHuiHZ2o3WwdcWjABL2phxf/cmI4RXqdvx+1/wA/7iTZQJv+CGXsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(7416002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(921005)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u0erFpvFUBQQZKQHJpTbdLe1a0LcLMbJLkDdBrnGMQTy1mOMuWtK/TmcLGRq?=
 =?us-ascii?Q?Wjn6USiK/E5z1dEAkwlku7h7DumSq13V6ZCQ96accWo9wQluPY7TQ92nDDcB?=
 =?us-ascii?Q?fkB00pAklHLMVSygDr7Ix5FmrRpfbBa9FMBbCvEUKX1IYGbdm5ISRSL08YaS?=
 =?us-ascii?Q?49eu+BPHuZMNDGcKbK2cYxLY5xvkrlOWhcD9C6ZtjHFWqF7Y0svv1TxykZ24?=
 =?us-ascii?Q?9opDyJET6BUD+XuSHOk1GltM74sHQUYAcwteVY4bym2+LgvpO+su5n2SzQ57?=
 =?us-ascii?Q?bLATHthUUY4Chfaao8kaMNdVLOnI8Cp1DIJCAcKmxxJGZOZbIuZ2j0hRvBoF?=
 =?us-ascii?Q?c5vCdBcRVvYOEZKffZmL3EtRfGGYFZg7bJMDXboaZOb3dHud+rwpmwLS+eAA?=
 =?us-ascii?Q?B5GRrgOMMOkqXD1TnO9I9F423cls6z4lvXQsmBzngMi4pZGRzZT0rXZgJ/2g?=
 =?us-ascii?Q?KKe4USEIMBh0WDjCcC88bufnVhp8ORW8Po/wfMIrv1b9sp/1WQezyLjZCCJ/?=
 =?us-ascii?Q?3frZAPEW3JzV5KZPCcRnblfjU8hQLlRvb/ZFHGQyM0xZpU0yfBH5b6IZm3tw?=
 =?us-ascii?Q?5rzJRcQ0V+nIksc+fZSdv5/uqIxNyAtuICP8CwN+Zb9oYMMhIV8G0OuFGrFW?=
 =?us-ascii?Q?scy+pqZM8eu3Nt9jh5F41fCAOhmx6f47GaoFqjyTzWD1AEaMRw4u4guWC7Ql?=
 =?us-ascii?Q?qt3JH1gdN/YnkmjVRuZ4Z8KzYiR7HCqIbGB4xNwtk80knKR5GiCbK/fn/bEJ?=
 =?us-ascii?Q?KTpXq7Xx0woLrQC0Nflawe/giCwAlFL5QvyTVlEqMNp4lFy4kMmtE6RoRQ5m?=
 =?us-ascii?Q?KMD4ImXZFnd4qDj4XHVtTLnzVJEtlxsynpkmPMGY83raiDGxIihXVZyb4fev?=
 =?us-ascii?Q?I8VGeCPjfo9mQ31ngb9Fy+Q4GagI9OuYAZ0F3K60TpixqS6SEfjw3Qy+yJQF?=
 =?us-ascii?Q?9XR5ofMyB9TIano4ct14qvzMaGFjhsbUE31alVgkKMnjHlrBoPqvrRS4WX6S?=
 =?us-ascii?Q?JOth+5jubkiDMc7wzvNz7LK9fgr1fUx/t0niPIHrvyabE4WRok4Oij/BMWvr?=
 =?us-ascii?Q?enMKSzU8jtBxW4ISBVYAvRULlhZRASPQ7hRokz16CAn/jEDaGn/9oHgPSlCY?=
 =?us-ascii?Q?IwGyzG3zxGcYHOcAiDJNg5rKmHfOwMMEdKgUqmU9y1lqkBKRmg5kYpOQgyJU?=
 =?us-ascii?Q?+9jOgFJq9KreU9zfVWXTByniNavwFXOAp0ls7vAMNn49zcKYQwm75t/X2Bwl?=
 =?us-ascii?Q?XALvZ5M8dkRMsOazlekanRTUZiCc2p3MlXyZ53F7rLeWub373w+cxXFWOepB?=
 =?us-ascii?Q?WHifpjPQbAkJjpQCoAH8TnAcCqSb8nCeXWne6zEZ/OTLSaMfcpw/2YL/2ROz?=
 =?us-ascii?Q?F+iJIDBkJxss7JGMBq1MKjHISPqP9YWvO4PbRd7QWP+pC4zER9MHMdqw7IQ7?=
 =?us-ascii?Q?if12cS7RLSec+46sUKNNLCGlKnkbJph8nAHnbN0gZ6onMFyjrlz51TpCvKKf?=
 =?us-ascii?Q?r8QTYPx45eVZdgDH5Ug4SHI0bgz9tKGVVwjyz/ZNVB/NwSqJDiOrDJwC+S2l?=
 =?us-ascii?Q?unFjXUgtODp071nF2dIZGJIjwuAvniVUjlQBy8ukA80+2/X9T3nHWBIMU0Hx?=
 =?us-ascii?Q?DunOvvHRW1POIe2KrSgZHqk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b308eef6-ca76-43fb-11c2-08db446cd27b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:37:18.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lFrWhUPiRLM9fQAkfJ71eeewKKV71lNpCDE64/wXhZ8MwsGHk9sG5/zqix8GCYA9ehUX+tsxc2LdFxjiV582SYDZ1eeOkalmUD4AjYFpalE6UH0rcpmup/UBHpsDa38M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
Message-ID-Hash: WCFXO3IHL6ALF6FDCPYWXJGCMJGZE3WC
X-Message-ID-Hash: WCFXO3IHL6ALF6FDCPYWXJGCMJGZE3WC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCFXO3IHL6ALF6FDCPYWXJGCMJGZE3WC/>
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
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 879ebba52832..a06e05154ae1 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -61,9 +61,6 @@ static const struct snd_soc_dapm_route skl_hda_map[] = {
 	{ "Alt Analog CPU Capture", NULL, "Alt Analog Codec Capture" },
 };
 
-SND_SOC_DAILINK_DEF(dummy_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")));
-
 static int skl_hda_card_late_probe(struct snd_soc_card *card)
 {
 	return skl_hda_hdmi_jack_init(card);
@@ -158,9 +155,8 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
 		if (!ctx->idisp_codec) {
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
-				skl_hda_be_dai_links[i].codecs = dummy_codec;
-				skl_hda_be_dai_links[i].num_codecs =
-					ARRAY_SIZE(dummy_codec);
+				skl_hda_be_dai_links[i].codecs = &asoc_dummy_dlc;
+				skl_hda_be_dai_links[i].num_codecs = 1;
 			}
 		}
 	}
-- 
2.25.1

