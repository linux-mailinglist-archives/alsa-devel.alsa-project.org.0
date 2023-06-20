Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4E736177
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11712BC0;
	Tue, 20 Jun 2023 04:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11712BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227497;
	bh=9BKBGulGCbOYGXJkWSrEg+iBVboURmSwiobyw+YvO24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/xn2ZsUgrQX30jAyDkI0hkRBgdoARYVdDuHFU0PNNXeUlrb5p3Di9Q7I8kKh/PQA
	 ozQ4MLWTCw+gwviFFcaO/0lk8FMRw2/kyl0nHWRBcySP1BiLmctE92aux5ut9xUVf/
	 1WgxiMmKl++Tc1pyBOra2IUkcXjAe2O02BBJKHTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B993F805F1; Tue, 20 Jun 2023 04:15:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D2F2F805E8;
	Tue, 20 Jun 2023 04:15:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90844F805E8; Tue, 20 Jun 2023 04:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82F78F805D2
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F78F805D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TXzHgJo/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hh/98y878wjz/Ni4PeY/EveFGLUJrNln08sz2WUmAfc4YdodiReYxaolUTy17hFuAR0ioEvxsi3eABk7R/B4zPofwZ0uOhgyw6SJl8Y35f9hDWrm2P9+OGvPl0+MiBr61JSMuwBrez+QejEBLHD5RyMKvcCc+A5cJIWwiWkqpWpw7sryvHvOu0TeRSBtZ8qcx+fU7J28eKnVvFsdmmOm1I5c5dULAGjmecZJbDatipcdspy0/K4XUbOnTj6irLnGlV/LONdmKyG886lSrrnWhEqfTDdrZACgdKYe6OaAOxxan6HpNPEjRPv2BSGKuUohWMG8s2MmV9UmT0+Q/k9sHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnLyVEW3ooA8MXrJUDwj5IFHjcFfz63prbt5eTdwE10=;
 b=gr/BzhPjg1hlhJ2K3Gut6OWKwBpZ/lzcWNYsdnHVC3+Zd172z7L/CFzPTqOUfR6r4ZCNQqA2JlqOV0gfWw0Ngc2SY2RwV2gLPgCJfZZdPNeuAAHMYSIbm4Fmuq0N2HmBmqR4rQ1ZZfIrCd2w8VXS7oJz3iERE6ddq1lZfQEjAXT9CeqXScyslIvv5RTmv3y67whD6VpyXluyCwN2vUgxmgqJtGh2yNojbByeWfAXYdHTzUunxcMG48JTQOo3xyzlT5XT8TTW7E9vjlYJ5kxBNFUE/kixfKGJWGouVNZ01zu+4PlH5Qc8ct/th/nO2Kk6u86mgX2FzfrWaSIY3sQgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnLyVEW3ooA8MXrJUDwj5IFHjcFfz63prbt5eTdwE10=;
 b=TXzHgJo/YPWFaVIjtLoFfriTRkgwWuQSU7apZpxrNhyWU+0OQ00T7jnPtVLKUmEjdmXfNFjvBusvLyiUO2xgXpC/DZDifD+SfvmqvEHKCN6gXF5J6N9TH1GL/NiQZFoZr5lXZYUoZNwl7LjnAd0obC2w85GaS556PwA6MOKDp3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10965.jpnprd01.prod.outlook.com (2603:1096:400:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:51 +0000
Message-ID: <87fs6mdgmc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v3 9/9] ASoC: simple-card.c: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:51 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10965:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e5d910-97e3-4ae0-7f4f-08db7134218e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+2tG0AiBcfmVod3mJv4eNeQrRseJ+gAkZTpIpzlXOuQ/Ma8U2jo+XTrOEd+qaiNaNeYwSqZvLIAruQPUbN96JtHnnmnHHLeeBobCuVRrrnK/FbPn+6RD0oDLPTdAHS7aqgwqZRnKR4nxJ7vej1nGXHEpbf+vkuagybDVJDcM3RNLXgZwQV5s0Rw9y1mFWVx/XGpDIGIKZohpq9uUoNgPeN2q36lQhCAdobNQlDJDWXIAcckOlL54r6aRWrT2rMN4/aemefFKKxpKEKT9w8PSyxLkATswgm309DnVOH7al1ufuQx9j2IqybxsVDlCNL5MfFttwHF4rrVkvZT/a2SDZmGxBCcNnqF73ckx9peODeZM6AagNVcZ1jheeToChRMzazgJitk1EDMfLkcD0c/J1xbVv+xQq3bRDJQuHPWj0bGdh19eNHCEDNwil4gNYxzTQ7+f4cLd2RG35OvSWpgxtPpxmBzk3ILMNR3MLKUJoC4iwcXr7nAtAo/7wLFaJWLpJPXs+C+3v9EwTKS0+v33nwKXnR82xcL7P9JcGM+Uv6Rp50aVm8oBJRJcFO8AoqXNfXXmwv7yUibKz/A6bsRp3gZq1K2bS9qxeKIDaCM4GgNlcFnn6iPIyDsLHaVBU277
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(83380400001)(2906002)(66946007)(66476007)(2616005)(86362001)(41300700001)(5660300002)(66556008)(316002)(4326008)(6512007)(6506007)(26005)(186003)(52116002)(8676002)(8936002)(36756003)(478600001)(6486002)(38350700002)(110136005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?num6xQzbDCWlNCMFquXn4KnRLOfJ0mESf71yUFWYQK41EJYN3dG0+P9MhLsu?=
 =?us-ascii?Q?Ia+87nLx9RZtKJqCSiiatXwwiaYivCypBnN+LEO47mBhFjtH8mGJ9RBVeSep?=
 =?us-ascii?Q?X1pG8qpLM3ff9bTImYtDMm1Lg58hQEu3Fa+ZPaZ1a2ifPnTT1St0ph7fmUdf?=
 =?us-ascii?Q?Yst36Obc1cKsQ9rT6UgMsP/qnAmpXiL+2wAoo9GTwAdpJtv0+/tgtr2/ydj1?=
 =?us-ascii?Q?exDKAw9Qc72MP322xWm/gAZxve+TQ7aOaVnpIk04UaxfcXFJACNWvOclIKwo?=
 =?us-ascii?Q?iIszeravFScHrAqgkGmLaJSq6XIGfKxmOIRAl6ewzmy7QtjxYZHYXqdnUgXP?=
 =?us-ascii?Q?Mrd2ewKIUwDJfuagBaWMZWFXAmx7jFxo5HVR8UaFdjtUuLZQHJpDp1TrV0DQ?=
 =?us-ascii?Q?mAFYWH74c/JDecagI9QxRujDz5Z7NBvLh5Q8e5GWevYS9lYmii9vCfrdfGVm?=
 =?us-ascii?Q?fK761Ko7IxXyf6KGx4CeuhN1YSfc5f4yJ1Xe2djY85Upe2yI1j3ILXUpGLJO?=
 =?us-ascii?Q?KRIlvCk2GX2ws7IfCCC34dFOH8uf0eDKxHt1w1maChbmHaf/h27WLOtrNop1?=
 =?us-ascii?Q?Bvjwx8XoaepL00OG+lwTEKvK7IutCQsbwp3cAJi1R0/JvfSEpv3hkkPztzqA?=
 =?us-ascii?Q?JqvAvh4Bj/mvmi4LalDRqFvFI5bVH2VUQmQTTsJTopcZumy/1omRciOXq1qd?=
 =?us-ascii?Q?ZLNm0+QbXhX1lWe0ePN1zNKLygUPrfjhudCU51+R9mHZ6Ik0S5zR8WQdSwwq?=
 =?us-ascii?Q?ZBaXeRxqrdTfQGQcT+X/MjcVymQ+2JUIwsVBjzsfg5VuqsdhKIERcOA1e0R2?=
 =?us-ascii?Q?SJ3+pkWITMzRX5ziwZbqKVsc+2yTL4IaWAHK07hjHKWx0EDNiZyuoPzt0Q4j?=
 =?us-ascii?Q?jz8e2zM1pjVpv7m01tfWTP962AoUTjQjioVdNLhCiTzb6MDTbdJMmrSuMP+Y?=
 =?us-ascii?Q?ItNceU9LuaeRLaFRcqTMFwFJV9m+6+cLToYS1Ca987d7UIzcPcpeR+YtRgqF?=
 =?us-ascii?Q?IAUz7X5WCeEpoeO1H8Q7djvrEzSy7REgTnaB574qoXyJHvnhEGtKiNyJiFEo?=
 =?us-ascii?Q?gZJ2VOCDJ/ZM72uY3Xgn4hrEStEmntN4bgF6YLbfTfGsijVyyl0/tBQis5Mt?=
 =?us-ascii?Q?PauLkkJiA4f0SKc0KKrRYPVjfdojJBBNYzHghw/ahSDdslqBzgmUW3WwxKFj?=
 =?us-ascii?Q?JTk+tUXYJtS7awQBPD6TWtRZjxu8uwYwjpG+DfLOzOV9/MtAQ0R/SnMWNE6H?=
 =?us-ascii?Q?V0qfQObmalIGzuvgdfliOPjkKE/llxHvrfOvyJ9UNpD0mWp86M2/ftOFJnPG?=
 =?us-ascii?Q?pqlAMz+4mkn7rKzh+N2u0mCyJfbxD+OZ9zWnfRigHqzM/+WuZGLh5LqtziXM?=
 =?us-ascii?Q?5+itRTP/sbD7lhohFWl1wnY6B9y7w4OW9gSnW/QP5wk+8W1VF5dWFU5S386I?=
 =?us-ascii?Q?S39Vw3LNuRaC6F6XoHH+9EtGmoY7P+HSEdw6ahvZkARPbH5cPk5gq7sF1wck?=
 =?us-ascii?Q?MgoOiD6C8SeOkGvfdZn47PXb+d9iAu6dIh2l06g4Ccc4YswhWwhwiISWz+JP?=
 =?us-ascii?Q?grE4N62d+oIggJAsexNQrfeXrB/HEuUfQfMeV+IunPvaP0fx6X4zE6Zzl1o9?=
 =?us-ascii?Q?0X1VbKQwm9vE97S77rCG75A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5e5d910-97e3-4ae0-7f4f-08db7134218e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:51.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LGaJLgvVY/kpdVBUoVBdJNQMg4D+YN9g2xGyIRFGbB/suAQzoiU3fkUeWLJ8QHIicTOOoXvGuQ3KTUTuWYo8DD+bFSItR0DU3g9FpT7MEEQ6LVNwlTpqteMZQ6cMyr9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10965
Message-ID-Hash: LYZ5IGVMHVHLUTQZPCSTGUJ6436EHR52
X-Message-ID-Hash: LYZ5IGVMHVHLUTQZPCSTGUJ6436EHR52
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYZ5IGVMHVHLUTQZPCSTGUJ6436EHR52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 4 +---
 sound/soc/generic/simple-card.c       | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3af056026fa2..3019626b0592 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1103,14 +1103,12 @@ int asoc_graph_parse_dai(struct device_node *ep,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
+	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0) {
 		of_node_put(node);
 		return ret;
 	}
 
-	dlc->of_node = node;
-
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5b59198a0384..0745bf6a09aa 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -89,12 +89,10 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name, 0);
+	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0)
 		return ret;
 
-	dlc->of_node = args.np;
-
 	if (is_single_link)
 		*is_single_link = !args.args_count;
 
-- 
2.25.1

