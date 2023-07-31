Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAA76A4CE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 01:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A624D6C0;
	Tue,  1 Aug 2023 01:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A624D6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690845913;
	bh=qiIM6VsJFYT/i/bQ/NgKIDcaQTZNMCiM2PosWBSGo4k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HXluvDOwt873R9/DSRY+qS5HfPMGM4oNTIq0oDzZDAQWW5zmr4hqrnXctqg7k7NVt
	 L45yJS6DKkVbngP3N0xgA7CTEQRA8XFIB7Gn5BcErkg85cih+oeeBtU9f5yzbATCrx
	 thLcasMyBOf1jB1d+XsnpLcaN+6OHYIlyMVlN2Ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111EAF801D5; Tue,  1 Aug 2023 01:24:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84499F8016D;
	Tue,  1 Aug 2023 01:24:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D9EF801D5; Tue,  1 Aug 2023 01:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CBD8F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 01:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBD8F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P1/P5RNN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9n3dUXrofR5tErZD4Ww9upKjx/OYCD4mRvCfYtSFn5Wf+pdsxCT6rTFHIctH1iJjzGxtZNBLfdMBXXGJ/v5Fuw9cEu87WmNNi/7LLUwsLb9pDkJXQQ02xeiZsJgpIpkkOvMsTBlqTS7XkZJEh4TzMzBa8w2pF63MnRxS7hc8AgG+HeFmVCH9/9rmBSjLl7n3nTdlZtGwlzq/SUPxVLBhaeyhrXR64I6FHQ2IHzm1F9v15hFSezEr2yxpXJsSU1eb/8qhCmPDaYSaIH+W2nSYdTXJqmTBHv8dmgvzx49Na5t4+Yfg1BEVKGW3I6qCwOj594j4B/nzxTHWP2RD74k5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS5CK9L9bV84g70wj3WyZSEJnA9vSy9YSTOBV0UP3kk=;
 b=Rfs02GkJOAEZrioExwh8GWmR1YdRGlMfUrtEkoxUM+IarP9faJzHtj3J2rSMXCs0bSScvkI+9wFlszTJijF7qwEqEVIvOBUmLvocz07O/VjsSgtqDh7rXZr7QMGzKviwVrDWMg2SBTigrLD/Ad18dpdkyHovPVkREgadUQk7QZGYBUu6k248JCgXrCjwHGBNCmIW5woFzN1h7J/8VLv7S04tzjLmZ95O6M3tAlWy6kSGP+Pu3VBePxZ1LtbAmeEsgPVxDzq08quYfmH8t4BdKfneZzlAuJG8KPHI6lvotz3nTP0h9PAmkwlSpCAgX/HmPaiPflz/KO52Wr0CvehgRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS5CK9L9bV84g70wj3WyZSEJnA9vSy9YSTOBV0UP3kk=;
 b=P1/P5RNNMdDz+jmc0ox4cPcn7ZrtybPGuBgEO5SiNkFAlCFDG0NXZTIyYDW6dt+eND2vJ+Sggo9nin4YTqZGBtgP8Uo6uwuiyw0spt0bsVC4abYvrIEcqrIqzITZUxz7+YLE8rNtf8h+9ZDWTumrORswNMeDgPj2XPynXXCCDNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9967.jpnprd01.prod.outlook.com (2603:1096:400:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 23:23:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:23:59 +0000
Message-ID: <87v8dzpsvm.wl-kuninori.morimoto.gx@renesas.com>
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
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: intel: use devm_snd_soc_register_dai()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Jul 2023 23:23:58 +0000
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c9e86f-5daa-4eef-cb9f-08db921d37e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x3/tLsaZY9ow/mQomxSWqPMW5nuXHiGt0un+77fWFU0mMnjU5H/mJ55OoUbZr+FFERVyt7mzBiB9/lqDtdCzxM5Tw5LxS42SbRKeheeUZpvoluOEC/owWbfcEJmG0mE3qvDDzHUi0XFyn3JtxpHIHVUjkHQqqS8rZof9wA2tKNvrcpY8bzLCf+GlO73skHwCu7E5WlkMxm+ubpLcLv75SzEAeRa3FdtKfGEXOLUMcIcPTFeREx5f+QaWFikZ+lrLM89JrKrliw7GxG19vGZrAnEdYdzw89uRfLgtWiMSst/DX1edT6YhTFhwDavwMpcKdud6NJ/q+IqwUI7T6EG5ANqUaH+jAgxxfCoXj37k6cfXFXbs11kqU0jLSWDjTVCTzbFl9WK5Y3MEvUxGicr1SarOY0UEc4Wr6RuW6fPq+9XVzZBDEdquthxqJ/voC0+hQT1BcTaZJ+8uv3gYcCJQcmRUhHFP27cTwN80r43v/gzvKbHlWtSZeeitZTjIamyYteD0JB5qeJ5F5v3vFAwP5gOwvOCk4SqRpXIRSherO0KBXqJyIDhM0/dNL3HaUnShNGOL0VNs1tPKdWY1bPUtLg+5IPkWd/k3AxQm6+p1L/2NdHfIPAe3YUYS5IJXzTNF1JSGdrU8RUbkGqs02zIqTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(5660300002)(66946007)(66476007)(66556008)(7416002)(2906002)(4744005)(4326008)(316002)(110136005)(41300700001)(2616005)(478600001)(52116002)(6486002)(8936002)(26005)(8676002)(6506007)(186003)(83380400001)(38100700002)(38350700002)(921005)(6512007)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hW5UTtQgDqgPeUGWSkk26UGa59hvuAK9Q9xKH24m1z4D/BFslX4j9LUpRFjg?=
 =?us-ascii?Q?j+IIOtoArREMh8W9bjsHQ+9Hu4Wvy7PQucsSfH/Xg2Qq73ibZsOsTvi0x30u?=
 =?us-ascii?Q?9FvxCXTyFJULhXhA+KkV4U17ZBDWecuD2n3Oz+eXmaP3KSNgezoZAWXI6Hsi?=
 =?us-ascii?Q?xexfjzUihziBaXAle1QxrGNp+uz+iAhz9RFC1n1znKaYwyftlDBPHKQf1shd?=
 =?us-ascii?Q?t23uTKd7Wb9Uqo5Znua1q5GfJzLkH5LnnEhe8H8UQlmO9B+hA9/V6qcTigel?=
 =?us-ascii?Q?SNjT6mA+iFrXK+flWvlzDjGYddMaQjG2NnXrbAdL8vkH3NOhMPYQQCLQu8pU?=
 =?us-ascii?Q?nDgI5tQ1PbHteEIvTPkFQQhGmCuFAsn3x0/IXjcGjXVZwA/5b2iJ614h3XY2?=
 =?us-ascii?Q?UN/Mrfa9cbgdTbWWOLegi3aqB/iGzbjZc6BxP6oOA4RXTve6U0RuOKriYPIf?=
 =?us-ascii?Q?uUurXZoU5jhKw3oS8fET8S/eSI3JC+TDlR0R2d2yWbV3BpjlbTWlB635O0ZR?=
 =?us-ascii?Q?gZ4sRMPSpQhBmcq2TnVny5kIq8gw3fPAGu7mkfIvSYQ3J+gai7c7vIRA30dA?=
 =?us-ascii?Q?9apxExo+btZ7OxKuULL0nnBP6HPfeWszV2x4dLYWJPDfvXaTW+6jhFuG3FFD?=
 =?us-ascii?Q?vE5nSB3zK2otJLx+mjL6Y2q5aiwfonD1JIUDkPOCh0qw/nny82wP8JfjmArK?=
 =?us-ascii?Q?UGxzpDj9qkBpaYCBBFl8GFqecGP7t3Z0iSXwNLJ3csZaJ1zIsk0zymFGqQQK?=
 =?us-ascii?Q?fFKeK79NhKfEJ01LMyPp+t50cMKwdFtXwd5yFaH0e8xKV/5gSjVFS5sRzUDX?=
 =?us-ascii?Q?7ziWgpsVY5DWrQYZjr203sEp+yQ6qKai0QGn2vrwRx6i8pVcqoLtFfQP2GHE?=
 =?us-ascii?Q?FpjGt3cudd3uRiS/jOvYkuvqCCAVhdDb9w32sA6hkhOGcMQJx6ouctdT502X?=
 =?us-ascii?Q?8qsTLRbkkEpB2vJNciDiFOlYDQUbzCKo6dBrWUc61EVyLxIYJXaZ6nQzxZtg?=
 =?us-ascii?Q?KJGXrzgXHMxSbU5pCd07GC+RlbcMsiD6torTdXj+GUuvDY80EYRQVDDUmINV?=
 =?us-ascii?Q?uHSwbXwVjSGKu+aTqDUhYIpdhVS8OmvzAE4H/MUPvTvpC9W77odfA0EMrcq9?=
 =?us-ascii?Q?fas/kytJNUrBzTj7EvVPGdSaJ9RvXb6Bfj3VCKpgjoQIVYAn7iFI6/npAsF5?=
 =?us-ascii?Q?zM0sC90RpkzIhiXM2FZ6C0tYL15q/Y/yE9d4UZVQ8o4zfvKFTHdTS0Xmu5kt?=
 =?us-ascii?Q?sHPamW7KGBgsMid42u5nlGuB4ZgEKE7sXVGbzCoNzOxYVeofbsHFigRk452x?=
 =?us-ascii?Q?S30k3KU+WQ8qfvbD936CPv7n/TygS3dGGPTCGUZ3YREGqCeHyLTeYSCDuRWb?=
 =?us-ascii?Q?R5XImaJ1wJtop65HbRyi/82BkEpAArNkDtWnqjMXvykDX1qZQzxkLSh2n2MQ?=
 =?us-ascii?Q?KKgud3dSy36NcJI3j7YZlnl3+XdCaN0VfjliTJEPx3UfgEnTkUoPcdnC/MsZ?=
 =?us-ascii?Q?LzW8OZFRZKE/BhN9dIj/saZcCQs9Mxhrj88Oe793PxZL+85Is/HU5RLsLsaw?=
 =?us-ascii?Q?TOlpvjZnLpVRZQBWkXwEAUJ2FewznDtQHDYgpe20DB+ul4yNtqrlLbbEGWEr?=
 =?us-ascii?Q?36mzQbn1D0m00TigO5qX8+0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6c9e86f-5daa-4eef-cb9f-08db921d37e0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:23:59.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cLpf6yltxwqTd++8z9MgIyc6Pt2mKOWaSi+Nl1Owb9m2gPHVTkyPC4EKAYwh3waTjxk2qdBucO1h+2ViNtU62m9My7XzKCE4zJ8IyulozgESh2mWqbVk79ZF89ghaing
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9967
Message-ID-Hash: 33TFTISSNM47GJP7ZDOKX2AV47SUX25F
X-Message-ID-Hash: 33TFTISSNM47GJP7ZDOKX2AV47SUX25F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33TFTISSNM47GJP7ZDOKX2AV47SUX25F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is still using snd_soc_{un}register_dai() manually.
Let's use devm_snd_soc_register_dai().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/pcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 1fbb2c2fadb5..dd03db31c2d8 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1309,8 +1309,6 @@ static void avs_component_hda_unregister_dais(struct snd_soc_component *componen
 
 		for_each_pcm_streams(stream)
 			snd_soc_dapm_free_widget(snd_soc_dai_get_widget(dai, stream));
-
-		snd_soc_unregister_dai(dai);
 	}
 }
 
@@ -1375,7 +1373,7 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 			}
 		}
 
-		dai = snd_soc_register_dai(component, &dais[i], false);
+		dai = devm_snd_soc_register_dai(component->dev, component, &dais[i], false);
 		if (!dai) {
 			dev_err(component->dev, "register dai for %s failed\n",
 				pcm->name);
-- 
2.25.1

