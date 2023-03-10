Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1A6B367A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 07:17:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE791756;
	Fri, 10 Mar 2023 07:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE791756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678429053;
	bh=mqW36VC/fypionQ2dYGLOdxe5CaViIKAffJozvpRv5I=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IWB7yFYmTS/0ZabhzSO6Xu5YgG21++An/qZxpsV7BNqFWfYr6l530k8ox+wOuShll
	 DKUqPPR5jRuPjn0T8ydwdgdbue0uZewgfeNRzIYYkcYxgkLJeQ4+O3rgmcvtyYeg3G
	 mRwrDkcXgs7h22gzOrtmLrResFQU3DJPjP6G7YXM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B660F8007E;
	Fri, 10 Mar 2023 07:16:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C963F80431; Fri, 10 Mar 2023 07:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB13AF8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 07:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB13AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UU2Kj3f8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipj8hz5ZztMhuwQ4f5vmMtwuawD4XVqX+RQz6mIFYJc17mQWTH5vJb3QjVX56gpTvxuav/As6hTer3chhrU5M/gbX8tGci2pmmS2J4ZUdzmzx6nEeFa+sQu3GJkyeXp0HDx7hQUpxRFAAlYU0ayZbC0dlR8JvRdBxSao+X6h+1PNxZIkcl92d1pPrP4ZogSIfmsIS0O04PHUWx5zxRrF/YkxcCCKadEVaM7H/g2iETXhIKfWSDpU8s9t23z6aFSB/cvEkgkw9WjvNQoSpk/Uxdvot1WTNFzCehOjYCslIxdquDf7bCr2Dew7zNRUrE03fz4g9TLs2oWmeXppZXqFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCDqd11+jFDOlmV2Rpy+kTqVtNvPgWZxAcd85GjsBvo=;
 b=iyHI7vo9m+DWuD/oNm1GAF2RsO1AI/BfOeFTtdgXG4h5BDz2uwR3N7BWxJotSazKcVgv7QORvUsZiEn4ZGByVHMxBL9tuzNOvDL7u70tuIxxUlP9DRU69j3BBVrMqait/lOvLg3/H37JQsGz8GTUy4i3mdczEICes8jxU9XTxaqvD+bD/h9ZV6mWj1N7aMrXi0WAXzfFA2o6YHK2BA/TwIEQx+jOo7KqGW129kl0g6yNuj2ki7wQnhF9HRcZhpL6Tk2PqexNwvRBWtC16VdqPWpqSJxxSrmZRpRf4wvtQvyW0AaCI62LFgxkX8yrv3k81AMojnl8ncEGycBIffqX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCDqd11+jFDOlmV2Rpy+kTqVtNvPgWZxAcd85GjsBvo=;
 b=UU2Kj3f8YcycNGMzthA/aLDADdBvpyJmt8CQN9x+ymPAOAObis/lRcrDG2QyXJxngczkSfznFRfwMjHigTD4uOEGDIh1pJ19c4DjsekibGIzA29R/acb5plzv+2LlBqZxODSzHg+ixf5gpiIznNGthizftYiYUxsxWlAU4Wc2z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8251.jpnprd01.prod.outlook.com (2603:1096:400:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:16:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:16:15 +0000
Message-ID: <87bkl12ksw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] ASoC: soc-dai.c: add missing flag check at
 snd_soc_pcm_dai_probe()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Mar 2023 06:16:15 +0000
X-ClientProxiedBy: TYAPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa11353-94d1-477d-a06b-08db212ef493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ELz4JE7A+k2t/JYL3PpjePaSiTP1yQsnpV9mO/32Q1KbouRn2o7rYZr0cGwfAHzH4zFjIZ8lCTFKE5fqwPS1qy4ctG5+Gopma65rxL/qtm9Y6wGxyVZsAjRd2tou2qf7MAmhr4evubJIuxmtaacb11QJj6UPzZyhz+5UY6riTAuSHkS9vHrd/et/HsMeBzvlW82FXT8HGwO2spmmQogQBQ+C7dmzyGdxAzERzKK4101OQoqaMgGjEKHE1N3b2in4OEZuI+EPTrR8yU6V3X5tnDOeo98CI33+4b7pfEe6ZqBnTWY7UQ+LlAiyjMl0kxj4aGHxisKEnR2R040bGKCAD8ZLoFrfsdDgNfttHO3CtklFYvfZ5ic0lSp7xooxqlBEggWyfT/o2OR5KpHIrlJwPRzo40AphNRWEiNGybLvRvqgDhrMaq0cdiycAQRPuVLnVoCHo06l2+aGrH42COmsfSKduJ4rdvH4/uXGkiAOf41UThDB5t2LLOrdSDvEnIpdDLl0V8Hh2PCMuNzaHIkVCAXHoq/rr6rENlrEn/NjHyxvDXS7ZVna+kxPApW/guXptfPHfhgYAg/XZrNnajAlo9kPgk3Q8W4JUyg/oUzvgPEV0MYHoglJ+KMrL8sCg0ZiO8RV7xab8qviKzNFKNg/gF3Rw2iAWNtP/6Ge/6szboATV7JcQMxnXgzokH6gAgAJw2+cQWPZJk/FNEDKn5s1Gw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(8676002)(6916009)(66556008)(66946007)(4326008)(41300700001)(66476007)(316002)(5660300002)(52116002)(2906002)(6506007)(6512007)(6486002)(2616005)(186003)(26005)(8936002)(86362001)(36756003)(83380400001)(478600001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q0xL1KTYanpcOUPPPCSdDY1LZcXlFoZJMYOzP4vqDs3YWM7L1mm3aNJqN3aB?=
 =?us-ascii?Q?Amqgv/fxX03Ce2a9Ohs/Hd3D0va8J0RiWmX3mp4yhQI0ddr6nb6HwhnSkwH9?=
 =?us-ascii?Q?nkEUmkur3ttTFhXDtjAlVH1vhq6EgtQg/GDEVCGeV9+H8EPthkkQHnZ62sFL?=
 =?us-ascii?Q?YUErxa6pzvtq4syDjdQxUcjJSoZneGlnhhIWbq3HP2izrXxQTYU0JgUWvhiQ?=
 =?us-ascii?Q?bkHoR+W5frx9AcDr+L81CWwUz6Xp5HlkWfBHk46ncZfDUpCJx7I0h/nNhvA4?=
 =?us-ascii?Q?BoOD+rjfMhK78ZoCoxdyWvDPplmXx9b/Rnt4yakJua0l8P59eKMRARKAuasX?=
 =?us-ascii?Q?3zrVCIwj4wkWWCYm5UoJLVxoATaKWIAtAhzMEnYOSg5/AHY9Hki+TbjiGuYB?=
 =?us-ascii?Q?/kOG2bdABvz6mT3GO/u8daGv7jZwwF41YJwKVBoKT3aDmM+cAdgW0qmxODxI?=
 =?us-ascii?Q?+a0WG7o9xrrdt8IIHzOWKNQ77aPbktnBRuKBdSyPPKU/QoxBOFmDkc2s6aTI?=
 =?us-ascii?Q?6l3Xxt/hYDIFcgxC3jGlA8GO6oLlN/W7wWoDZxdaHuJ4lyynPzUL/OxW4wZY?=
 =?us-ascii?Q?KfpBWq3W+gMGb0rfbnync7AXXVQQQnkDYySTsc8oyB4E/KQKtRArTIBqbOVR?=
 =?us-ascii?Q?9l8w/e5d4MqtYFlG5Vr7YI7YEsEWlgNT7r5zwYPxFhv42ql6h0CNrHMtynXQ?=
 =?us-ascii?Q?+PUW3200/H21+bt/Dj83ocGNJGFZTShHmdQXV0pfDagddpT4WUzU6CmXjLcI?=
 =?us-ascii?Q?6spFkQwUrSp5gE42gtlMr7hWQ7lrn6Y7ho6qbC5OpMOsw8JCIjS/NWiE6+sE?=
 =?us-ascii?Q?irlpjfUVGW89x6zIoOBEMluHYdHJhkKgsW3hMA7bsCOjwqibIReQHkCfbMc+?=
 =?us-ascii?Q?JRinCtXS6E2+nlSSBv11VhMJNv0ldlQgp+Iw21oVbobOjUl8tLRPHQ7NEE1b?=
 =?us-ascii?Q?yYYLDDF4vD37ThFKrUs+JW08JXe2JPMv5ipXPUp80h6s5YjntIndcRGl8dA+?=
 =?us-ascii?Q?QazHWfwJA6J1jL+KhtbGdaRdFd6v5BpfhYh7Vkj+TzjnYIy/H4PkZ1psZe1X?=
 =?us-ascii?Q?XpnJyZytVdXbgHJs6zQm79LCCzhtGJ9mE4iidGC+qcz2oxu5CGJHrtR3MiU6?=
 =?us-ascii?Q?UMHKZ0MatGA77AysW7auJVfnW2NYLRyEYskQpoR1Pea5K4Wolc64xF3HQBGs?=
 =?us-ascii?Q?jqCv4qnMmlYj2/sBsHBXmQoHDFFuFt0632eqjFmT0R/ECxB/o0S+CVPhctDf?=
 =?us-ascii?Q?WwtmmZ9dxcGD6ElyesR+1GAxF0ZfYNQBmogC2yE8VtfFQTm/lmI8388Lzh/+?=
 =?us-ascii?Q?ojX/Qw+Zeds7IrgHKqlyNoqweolvjFFCXsmTTfRwrou3NcfBMW8b5hs7IUhz?=
 =?us-ascii?Q?Whl9QSPw3EqTHtyVs93cFcQ/HetvUJb/iGWlYWT5DBbX7ZaAh/bzsc/nQWzc?=
 =?us-ascii?Q?ASrKkpU08mmQYCbD/RfSbRpypN5gEfmBYdhxrBhpf2S8zmJIKb8o0XReGDYv?=
 =?us-ascii?Q?ovBeMiP2i1GPQcAcsuxrpN4KE2bomQ0ArAmXd3dpCa8RDBeafIdBIbyk13of?=
 =?us-ascii?Q?Ob4pygcehBOrQXXC9NlhkKN7DJVuSYmTLLnhWEoR2XjtJEa6m3cD3GcHdF9/?=
 =?us-ascii?Q?+9qo76NOS6jRa0DKCIzbAns=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfa11353-94d1-477d-a06b-08db212ef493
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:16:15.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vG3Aa2m+MlhFF5MAEkxgXhL0Wa3pbLzS9Ux/RwdfAukPHlXopLbS8AWtFIyG1Wl0wa0WzSlEibDa8d5dpa1BX0A2qNQMtfWF4/yaOlVrJorM2KNFtT83Pfy8cTxzkWg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8251
Message-ID-Hash: 2LYDFQRMQDPS5GJTS6IMVXKZWUSHDBGV
X-Message-ID-Hash: 2LYDFQRMQDPS5GJTS6IMVXKZWUSHDBGV
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LYDFQRMQDPS5GJTS6IMVXKZWUSHDBGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai->probed is used at snd_soc_pcm_dai_probe/remove(),
and used to call real remove() function only when it was probed.

	int snd_soc_pcm_dai_probe(...)
	{
		...
		for_each_rtd_dais(rtd, i, dai) {
			...

			if (dai->driver->probe) {
(A)				int ret = dai->driver->probe(dai);

				if (ret < 0)
					return soc_dai_ret(dai, ret);
			}

=>			dai->probed = 1;
		}
		...
	}

	int snd_soc_pcm_dai_remove(...)
	{
		...
		for_each_rtd_dais(rtd, i, dai) {
			...
=>			if (dai->probed &&
			    ...) {
				...
			}

=>			dai->probed = 0;
		}
		...
	}

But on probe() case, we need to check dai->probed before calling
real probe() function at (A), otherwise real probe() might be called
multi times (but real remove() will be called only once).
This patch checks it at probe().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 0119afbd01fc..02dd64dea179 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -542,6 +542,9 @@ int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order)
 		if (dai->driver->probe_order != order)
 			continue;
 
+		if (dai->probed)
+			continue;
+
 		if (dai->driver->probe) {
 			int ret = dai->driver->probe(dai);
 
-- 
2.25.1

