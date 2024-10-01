Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DA98B1DA
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5EDB60;
	Tue,  1 Oct 2024 03:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5EDB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727746908;
	bh=khzQb5e8ifCYQxzhe56YOoeuhKHe1EpBSyA4zP/sAkU=;
	h=To:Cc:Subject:From:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QgFbvlOOUpA0zIL91YWEyqab5Sq4ZeZOIe70PsdXTG+91IwKAYt+KAMKC+3Iq6vOb
	 qzHLVjs72O8Mgljb//psghzVrENg5IJQiK5FpaklfJ6gsqualapUkpJCuOqGMSwN1I
	 Pg7ZsoMqSK4ONrpZ6xgMXyoWeRjdeKnJ8m2twXeA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17CFDF8059F; Tue,  1 Oct 2024 03:41:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CFBEF805B1;
	Tue,  1 Oct 2024 03:41:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE66F80517; Tue,  1 Oct 2024 03:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80227F80007
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80227F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AARvETTR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzEfDHKurn5jHoOCNzOzaUPZihIxCm1csJVl+Vszi8CRaLG6bcRuRIz9t5El144ShTgTIiM4tmlsHeZZNgWKT3S9INiGo1Ib7QutrlXOF6JK3W4zRbukvXezGnqEcNB0G8AmcbSGcVa3EEPQuCYSH7QRiyehrUTstUSc4C6D0rGZkSQ49YAPsB0muC8RP4DeErodU6PNz/yDhAI/dxLgF29Pll/ahT+z3ZPsEGGxTUg5fCFLtBJjIkoRlKTxkY0LYlXF1Gm24CPuw0MWhWtJKgnLeCbWnrD+2glqQwD3+VOBXmj4qhXf0Y1S159167lq0uO4RWWjtMTjYDUN31nTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIEoem3NtdAHyfap+NLD17vSjnKAZJwu3LrDV35ZheI=;
 b=WXOWFigI2bZUeJ6uAJvC3JioYm6OGfbBh14v9WkgaZwDoselxF9VBr2wCoFO2/wovFH0AaUuartohwlC2P9kVdK6nIl8Hgz6NbGnw+vmGDGVgwPi3e8HRwx5slSQ5470cSsNIHnD7Y9xOpTX9WqZwZTViKDp6A8eF9Q6+1bLli/rOryEQugodrMbkrmKxa8bBgJlQXT6KrpK26eT0AfQM4FdRanTlKV/Sqy1GMvDXw4XXcKal0ruoniB4cYvuZhGgOtQ8rzSlkZtxjL24gk9+2JeP/gj1Sjj8/553KZ/bsm93YdRSTMhuq0mzKm8ZUgJg7jHGJenr6O+dceeIcNB5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIEoem3NtdAHyfap+NLD17vSjnKAZJwu3LrDV35ZheI=;
 b=AARvETTRIwYMmZjvcVVeiOdsMLbuCzb9WBwbBpEDDN/2cx7OEWtfT5Upg284c9Y1Ci/et6hbxdFPddOtfD9zwAlIFO/GqtnYfBftbennFhWenwfx0l+Hi/mzBoQ3+XM0RGwePSC8cIivWT/gvn5IZ5JfwkzGMc/ROLQTOGN4398=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13482.jpnprd01.prod.outlook.com
 (2603:1096:604:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:01 +0000
Message-ID: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH v3 00/13] ASoC: remove dpcm_xxx flags
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:01 +0000
X-ClientProxiedBy: TYAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:404:15::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: e995f1d7-a58a-4b28-ac44-08dce1ba1ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xFfB2zJq5fpt0X95s7Dl56XBZ1/SJO729Bcfl/dzZsq+/cOaONgKj2HOI4s4?=
 =?us-ascii?Q?mS/jtPhTM58f3vfq7fjeiEGgM7pinC/DAvVel3glm3K19xgcgWiuPrn87Kef?=
 =?us-ascii?Q?nrLsp8g1o6jcUNwtW66Xmkh1cfI4vQsvpYTLWPTDKX1z8Xo4p9NCrVcQ0W5m?=
 =?us-ascii?Q?WuM/WZD9rVqodQiobjSCRg7MAitd+eanneUMwDkyANlpU6a+ZvJAP/FJJHDW?=
 =?us-ascii?Q?SfRvA8EVEg8bjHktclLNaP31ZWmvZG+8Ul88WoDhkqLO1NRRmR8QzPXDYVyK?=
 =?us-ascii?Q?e3TlMGWgsfypz0UPI/YJ2YrPcvF2CY62k4oMfI7YgC+Km9dfaOn9tjcTSLoA?=
 =?us-ascii?Q?yHXLnOxTRG0hjAYKSxmM8ZYUMTxiGBazW/u3H+Se1EB++71LkHaypUliQNHH?=
 =?us-ascii?Q?TxvOhwnsodBsaxrONSB4qF8hixrDf9dgCrCv9zRCVU+v4thrwmDR31MP4k/h?=
 =?us-ascii?Q?7OccWe1pRsNA5s+CP1zFlC8siUosyHiIoOfD2fxPsP7LepZgmHBKzWsmWLJm?=
 =?us-ascii?Q?FKWxiZOuJ31nZlaNbaegdTqPCMfjl0veJb0Fjr1Lek4aekTkT+Uclj9t5ZO5?=
 =?us-ascii?Q?D64r+PgHUxlYEkwdzpnkOIuGmyPkmeUlRBS2TEJP5DWp+WoMMT+G9ujsxsll?=
 =?us-ascii?Q?WdXv3lz80AahJr9/YdpRq0XKSkVpdcDKP8ckDivabeEDo51E60nImUIn7DTm?=
 =?us-ascii?Q?ubY2v31piNwQYnjp0mo9RVLTN9nOIuKr/yFLFAgEcyqttx2T5I3+cBmsq3F+?=
 =?us-ascii?Q?h568ZcCXGRWUQO3AFPBPP5dWl6oUEl8AUXqiqqZcDlnEAUXlJ7eqVw7k+dgV?=
 =?us-ascii?Q?c2EKpGbec1IB4x1V1ueQ7yvtiiIsJQF8GqWKZb6ieVVbSNz6vn/Yj7a2P+Rf?=
 =?us-ascii?Q?JbkS06KR4owzbujHdmiZ/SDuI7C2+EU6AJUiLxnD9RYX8Avdzjfa4GYXN96Z?=
 =?us-ascii?Q?m3fGhL+Tu0TSL2z8CyTk4MgvcHMwcp0sJ1P8x9Ao/27BH1SUCFAnNdC5uZdA?=
 =?us-ascii?Q?pnqZtmBBJCN5p0ex8xWSV8wiQaoEta9B0XcyyDLm25ojy0exfe14X9+BU69s?=
 =?us-ascii?Q?8AqohbcYsFngsY9DoXzo3yOs48hQ9E4dk/ookePuKZ83deGABB7DxNFuFrmU?=
 =?us-ascii?Q?OZiWDBLlk2jGwEuq8yqMM/5Vph6rcqjAW+OKzRn975TdqjvKJ+2F1hnT1QLz?=
 =?us-ascii?Q?pFpCyvDmZCnp6008qqGS/q4ejDev1lovPqo+AAVRg5JKadlRlKjMmfnKj4Ti?=
 =?us-ascii?Q?O0fjicjD205z9u2Pi/k1qco1NGxOJqw7t0tY827KrsYV98OMtbxl/m94LKEh?=
 =?us-ascii?Q?eMnKL5l1e7TsH8K65qb3R+7s+8zQ72Jg7ebet2L5WIN8qg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MtWKXHc/81B2e2fJuwJwRPWvE5x+Q/+RCamMJ3Cfozjgps8dafqxXCPU45+D?=
 =?us-ascii?Q?HY7b5UQPKYMbYn43dnaQm8Tld5YHdkybD2S2/31pd8OzwUooTwxuWghNSWsg?=
 =?us-ascii?Q?rVelpe++UzN4njlFA3ZqxzwwGyWBEpKwoSw3wH5fRXR78GTlYs3jf/E3vpMR?=
 =?us-ascii?Q?s2USDw3PJi7DjC2F2gf5G8EZPXAhZnLj4JvnnoxEM4eHjgeWq2f//u81lgkA?=
 =?us-ascii?Q?rkTOl7XvR7ZxK0CX/UCNMaeoOWZ2A7RUSPRbkthlF1vWlolDTlMw3mI/nseG?=
 =?us-ascii?Q?ODeV09ELLHis0A7LgN/fDsl1CG/NkPKYumTmqigW+jKcOPdWTeU0yTIqAdQY?=
 =?us-ascii?Q?02uXvXfVvLnIJlcrrF5fDEglkjwhQQVityXd4FEveq4LBVLVa6+oon32NuTS?=
 =?us-ascii?Q?r6AUb8pvgpFG7Bk1BE82V6SMz8wxoK6lcDnMO2EAeijo2IRw7Sa8PQZewKJC?=
 =?us-ascii?Q?aZkrb1nPi+irKVyvtoefBR+5CR9G4hrZ50sjcT42ecYWf4M4CrSUafUou4hT?=
 =?us-ascii?Q?b7YC2bFGRtudr8jV4llK70FXsRlPtPByOTVucYeha4vx2OzXkoEcB8epWRrg?=
 =?us-ascii?Q?t0cy/jbYrdcH63j8Rai0evYBsvl4u5Bh/Z6Hrjhhn9RKjPq4WmoC+AXO0B2d?=
 =?us-ascii?Q?W3hs7Yzqin3PD84n9+tgGHglq2YwvA/RnR4kcfraQdyVrXytP4NuX0Kz1Qb+?=
 =?us-ascii?Q?ccvKqOLrR1iedf8k6tIZ/SHpoyY5UuIix6gpihsIchCQ2vBecamO5JyYTEcV?=
 =?us-ascii?Q?mNJhhKY9eEckjVF96Rr26Pqp5JVwwxzh4TatexE0kJ3RHeZ9qLcvpI70LjZo?=
 =?us-ascii?Q?LRSZrRoZm1RP64caBXriM9jECg5elgqq81LOpEOfUjIDmMSiKnUgfyXZWLTg?=
 =?us-ascii?Q?Fy9RYKEfaZ0CRhuRV8fooGbz1wyGo3NG+CCkwdDVJuEdmkeU6jZIgxsis5tF?=
 =?us-ascii?Q?gGqyvCW93B4BEo08UUB1WYvtDI/lRwCVy/vKs5B6WQpt/rKhry46gNQOPUGJ?=
 =?us-ascii?Q?riymjwUhp6GFv1WDyUObcMM96cxV9uUFu6JmWsKaWi4L4Iy6QYT9RBeCh6VF?=
 =?us-ascii?Q?cuEKE0aGzPVQ8TdYZ9Z4UBOkjceYrPS81X4i261tHZw6qti1Won5jbDSUv8R?=
 =?us-ascii?Q?wb3vGeoRLmyvjd7fOFj0uSr+mkIfnqy6T8XaFdrNem3qSS2r81Tt51phfDr6?=
 =?us-ascii?Q?78VuH/88n8wz5z78tIQsK/BJv+WK2Zo29YvyipE7ekR98gbuTNyLym08Ggj1?=
 =?us-ascii?Q?uNWXLXKwR6lMcuhv4Aj6e188QcePl8wRoOU8TnqTwi5gBoM97pkQEqbsQ+VG?=
 =?us-ascii?Q?7q7tOikTLnpmJp0wxyi1YhcAnqab0kfnYaiA1zSc54Dojc4BtOHE1IFmMDnZ?=
 =?us-ascii?Q?32x96d5N5AUB8ZTuTrBLZoQe8aWqfEs5ngShWiMaGsk+pFeOAvCXE2OHmhkv?=
 =?us-ascii?Q?HdgoHG0ywgdEe5mvn61qvdu2YM5zyIeXcXT71/K29hHkdE/53R7JC9BOZodF?=
 =?us-ascii?Q?z4XZ4hMUMvFl4Fbf0h/YyPDLmFJYKu0xC2QfKCZ86bxiKo2hTdqlW5bSpS7S?=
 =?us-ascii?Q?nWDpVGsbTyPI7xtZK/f15/iF1OZKCdwXp1T4slXGSH7aq1jbxyZWkbq86Rkm?=
 =?us-ascii?Q?6HnfzTLcN2lX1s+ZOPiBCJw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e995f1d7-a58a-4b28-ac44-08dce1ba1ae0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:01.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MkFq5Zs6RTFRKD1+9e+qvdPZtB9GKzEcIXpzF23rZ5k8O7apfiEGFXdfrXdI8Pl5hdUEqBFqnkqku06I8L67ddYXLFEFcHdCJ+1zPaNDvA1FoEd5JGZlxQZNPPzHTBwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
Message-ID-Hash: OAZBNHXWQM7PEPITSGINS6MICQWRODC6
X-Message-ID-Hash: OAZBNHXWQM7PEPITSGINS6MICQWRODC6
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAZBNHXWQM7PEPITSGINS6MICQWRODC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is v3 patch-set

Now, we don't need to use dpcm_playback/capture flags for DPCM since v6.11,
and thus we can use playback/capture_only flags instead too for DPCM,
which is same as non-DPCM.

Let's remove dpcm_playback/capture flags, and use playback/capture_only flags
instead.

[Before]			[After]
	dpcm_playback = 1;	/* no setting is needed */
	dpcm_capture  = 1;

	dpcm_playback = 1;	playback_only = 1;
	dpcm_capture  = 0;

	dpcm_playback = 0;	capture_only = 1;
	dpcm_capture  = 1;

And then, because no-one uses dpcm_xxx flags, we don't need to have the code
for both DPCM and non-DPCM. These can be handled by same code.

This patch-set is based on latest linus/master branch.

v2 -> v3
	- tidyup Intel files

v1 -> v2
	- rebased on v6.12-rc1
	- tidyup flag handling for sof

Link: https://lore.kernel.org/r/87r091lwhg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87r0979uhx.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (13):
  ASoC: amd: remove dpcm_xxx flags
  ASoC: fsl: remove dpcm_xxx flags
  ASoC: sof: remove dpcm_xxx flags
  ASoC: intel: remove dpcm_xxx flags
  ASoC: samsung: remove dpcm_xxx flags
  ASoC: mediatek: remove dpcm_xxx flags
  ASoC: soc-core: remove dpcm_xxx flags
  ASoC: soc-compress: remove dpcm_xxx flags
  ASoC: soc-topology: remove dpcm_xxx flags
  ASoC: intel: boards: remove dpcm_xxx flags
  ASoC: soc-pcm: remove dpcm_xxx flags
  ASoC: doc: remove dpcm_xxx flags
  ASoC: soc-pcm: merge DPCM and non-DPCM validation check

 Documentation/sound/soc/dpcm.rst              | 11 +--
 include/sound/soc.h                           |  5 -
 sound/soc/amd/acp-da7219-max98357a.c          | 20 ++--
 sound/soc/amd/acp-es8336.c                    |  2 -
 sound/soc/amd/acp/acp-mach-common.c           | 24 ++---
 sound/soc/amd/acp3x-rt5682-max9836.c          |  6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |  6 --
 sound/soc/fsl/fsl-asoc-card.c                 | 24 ++---
 sound/soc/fsl/imx-audmix.c                    | 18 ++--
 sound/soc/fsl/imx-card.c                      |  4 +-
 sound/soc/intel/avs/boards/da7219.c           |  2 -
 sound/soc/intel/avs/boards/dmic.c             |  4 +-
 sound/soc/intel/avs/boards/es8336.c           |  2 -
 sound/soc/intel/avs/boards/hdaudio.c          |  4 -
 sound/soc/intel/avs/boards/i2s_test.c         |  2 -
 sound/soc/intel/avs/boards/max98357a.c        |  2 +-
 sound/soc/intel/avs/boards/max98373.c         |  2 -
 sound/soc/intel/avs/boards/max98927.c         |  2 -
 sound/soc/intel/avs/boards/nau8825.c          |  2 -
 sound/soc/intel/avs/boards/rt274.c            |  2 -
 sound/soc/intel/avs/boards/rt286.c            |  2 -
 sound/soc/intel/avs/boards/rt298.c            |  2 -
 sound/soc/intel/avs/boards/rt5514.c           |  2 +-
 sound/soc/intel/avs/boards/rt5663.c           |  2 -
 sound/soc/intel/avs/boards/rt5682.c           |  2 -
 sound/soc/intel/avs/boards/ssm4567.c          |  2 -
 sound/soc/intel/boards/bdw-rt5650.c           |  4 -
 sound/soc/intel/boards/bdw-rt5677.c           |  4 -
 sound/soc/intel/boards/bdw_rt286.c            | 10 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +-
 sound/soc/intel/boards/ehl_rt5660.c           | 14 ++-
 sound/soc/intel/boards/hsw_rt5640.c           | 10 +-
 sound/soc/intel/boards/sof_board_helpers.c    | 15 +--
 sound/soc/intel/boards/sof_es8336.c           |  8 +-
 sound/soc/intel/boards/sof_pcm512x.c          |  9 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    | 20 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     | 24 ++---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c     |  6 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    | 10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     | 10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 34 +++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 34 +++----
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     | 86 +++++++----------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 58 ++++++------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 78 +++++++---------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 60 ++++++------
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     | 14 +--
 sound/soc/samsung/odroid.c                    | 10 +-
 sound/soc/soc-compress.c                      | 15 ++-
 sound/soc/soc-core.c                          | 20 +---
 sound/soc/soc-pcm.c                           | 93 +++++++------------
 sound/soc/soc-topology-test.c                 |  2 -
 sound/soc/soc-topology.c                      |  4 +-
 sound/soc/sof/nocodec.c                       |  7 +-
 68 files changed, 318 insertions(+), 583 deletions(-)

-- 
2.43.0

