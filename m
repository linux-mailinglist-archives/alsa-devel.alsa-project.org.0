Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA0774ECF
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8113DF5;
	Wed,  9 Aug 2023 00:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8113DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535562;
	bh=290o3i+IesnNoqxH2L52RnzXw/of88iCAqN3E52djt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a8lWTFSsFgr5G56asCnK9GN9w4aYm26pMeeKlJ8EoB5j1F/on4Nna30FGO/b3FlNb
	 k6v6h2Sr+PiX+D1lEnGMBTFZkRP1bygJr+cfCnQ0QH2OSXOu2178VHKj6P0JXPJLwm
	 bVB85qNTHld4FR6yM9PFE8moxXpguH3WRtGI3s6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63BE9F805F1; Wed,  9 Aug 2023 00:56:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A118CF80580;
	Wed,  9 Aug 2023 00:56:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDCD1F805F7; Wed,  9 Aug 2023 00:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DA36F805F1
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA36F805F1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ngSOuj7D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0GfXR5W6riUF7v8owPB5YI+SjKD7lT8UGs9QoFmhUDhtxnSHALA7GlVoGtU5uouyz3bf7QG3Pk95i3blOmuPQsFz7YgyZkVFiO6VuOPqROyvyc7+p9D4ptqNpVBubEBJ5+5ZRw0u/Itn+sQvvfty0qxVSZYoXe5yiG5494PuqJbf3UbWDbzrd/EPQain//WY/80OZjUx0pCYljPEV8kvSF6moX4V4H4mgFlEfkIvUvHvfxRKaIYLXAZwam+8aO+B+jzf8bdlwiU4Ear4Et0dWN55XuSFlKXXlwffXIHMWwH2z9UoAaJod5KhCFiMzCiqYVIGLADsa+T/A3eeTbe6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiEw61IUokwy0eH4EakTj2I4VF4NlWxgZJnfg9YVAwU=;
 b=oPxo/RcQFyxYepjECZd2U60oAW4irxHsNWdRhFp22njO7/4FrGuQ4GBJR1GRXm8r034L64M1f/OKVbHy+nYPfpQvgKJtkUSP9aNbk4ON88Tp6nkqIQbwV96btqYic/fySGxzeXhln0I4sLcO6J2QImkJgKyatrVM0MEGvrZj56oCX16ooQ32lf4l3zzLjSCn4XqofXMp/DVVNquUH46APIxn56PVkpvUU2i5ujvyWQ4dGQZmVQTctV6K+6IKfupI4ISNacrOMD/LUrQqZbXcz9NkAvGxvXdnWYasvWqLqv6SI/Bemb207V/Xu3tAkV3mbYliKlhmmexzoWVrAbT9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiEw61IUokwy0eH4EakTj2I4VF4NlWxgZJnfg9YVAwU=;
 b=ngSOuj7DRrzh+l4AyIRy0AoORX1r84/ZRgGhaBnVwfa3AMZCWDwOy0enqBinhdnViHZHsSj6iHI2A7nhM1Wb9PC2JCyboTbQC7w7lhUlwesuqDeh+8ZgDWLjP3bCfOXhspZG9WC66LfCuVDllBAsY8+21CH+BAd+MaRowr3a57U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:12 +0000
Message-ID: <87fs4tb0tw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/39] ASoC: sti: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:11 +0000
X-ClientProxiedBy: TYAPR01CA0015.jpnprd01.prod.outlook.com (2603:1096:404::27)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7c0388-e5da-46c1-fda5-08db9862a97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M4DfK0ammYLhe9hpFpoLm9dHlrsGcKmbA3tgoATJ1V16+lLxBfpmjI+xxZYgtrM9m5eAhWKZng86JU3sp+vkvnITBzmIGiBaGfRvIX/ZdxZVtGxtwzbiL480ZVm4BYhpZjzqvbMdj4/AZl4K87QrdLVxh8uUSOCOkxQjr8Cmcwx4NomhfaLEolhc4+48uMiXGrPhaTE421INmLXL2NpgKjKuxiZqQruhXzfg9aER9Mai68/4DSeWCY1lBpT1DlcXz4SRcK2pE1v1CHShC+Ks47yqveKGvv0uPTc6G/Mn1AoyPxpdxK4Cf1mrdynQ+9wIm/r3Qwnndh7ZIP0CpJSow3ZGVUPwbOFxBAbUFczOlDYgd7fFvzSAaFXQnCskhTykokFOF9u3r1oUMop59fuX7gTPmAPaiuW8WoKiCRfSENtVFU/j5KeuI2CLU/hb/+peSTs9k9c6rN6N+BGWAXd3DqoHyuPpgr3ORJFR3mjYQQfomPMtCY/4q5xkK84tIjWndKFGDep5v+rs5gSWFJ4KR4KBwE+t/8jiyv/YhWLzob4TyQqqS2J6iskzVjhGmea0LTyu945o7yRCCORreqQ8B50Qr7S4BxX3uvl98XnkzFw3mvoX9yX/3R5imkbeY30c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(4744005)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JAN9HF+TtHFKlgsqLbJ7NRp7olUriWtuhRgOygLsFRHu2/4nZ/OnZOVvV1Q/?=
 =?us-ascii?Q?BllVOrpX9+jE5Y38o//jg6OklsT6m8B+nyuCrACVzt2hm+Ctzkx43X+qAA6r?=
 =?us-ascii?Q?V2CMtNQ49k+rY4R0nwbvo5RJ/kFRF50qjH24c07X5DKh0e046QoHHu+mGXZd?=
 =?us-ascii?Q?zcByOvyos19kWRoTio8S7+5BdxDgRWhRjTDdKCrAEjxtoBkeNqbyIA13Rzxq?=
 =?us-ascii?Q?9n7Ak6XjFyg1Oa8FC+GcVraw5Et8NBFVnLJRxFE3guaRqwbFxsBMQ5NBeBmZ?=
 =?us-ascii?Q?VwdTWULUB49Kcv5n/xa5dLkImLL/3Vc/zLh7epPrrigX4FVmE/4aTSBqke8K?=
 =?us-ascii?Q?5EcUQjEajx2FHshjdAzVsc3oVsAbhu5fw2BSlhDb0GAVkGCxXaZkInvh4365?=
 =?us-ascii?Q?bZ6KgUQFXjxYRWq9dJJzak+Q+Z8L0/HJquD+QXxPt2F6n7f3n1AswX0kHhsx?=
 =?us-ascii?Q?KEGNJrQAlUVhnhmQ7e5/+e/X80U2npyqbLoRRfc4Qt/Tp+XNJ8FnBqBKoHWB?=
 =?us-ascii?Q?qJojPDGsAhqy4CViafV0kYAVrlShEQR0IxTUjjlJBZbzepFsq5AI3PmFoDIC?=
 =?us-ascii?Q?391vE4ULDc3p3BKB5hQE3t04zS9FhoNXDARH3hdffLXVV2vCt2ayQ0Z21lIr?=
 =?us-ascii?Q?x6lETpYWawOfxJRRY/njRuZ7HyHlDNUnH9OBwRW1HgUGv+9n4gpcszg9oSIW?=
 =?us-ascii?Q?6+WRx2kiqM5aUHegV0YjquzQBKfcvx83ZWi3GJ9ZbZBszUrH3WOs/2/Gm5Ev?=
 =?us-ascii?Q?ENAabaKfbAUxaZQVIzc44OGTgLdwDFHokm91bAQdVdEsQocj/shp2kcOdXzP?=
 =?us-ascii?Q?l08nUS7XT6Nank2pimInchPGq6cph+3UgmhHrfBgvwZq3FYBCsjDVLFFH5FE?=
 =?us-ascii?Q?Rkzadb96CEScCvUxqX+53ZbPDtYikH0nysvP8K/F/0RBQk0zLoRznajh/8wl?=
 =?us-ascii?Q?pB3A9R9/6zpXvuAuykGPzPoVjUOeym4io1UhHxMGnodlfr0RvTPiz1SGw5AN?=
 =?us-ascii?Q?4VUtYqGjgbvpzUlby2kM3LU//0gPoAeKGADVKrgPAn1TfTBtGecTNl9KTr9r?=
 =?us-ascii?Q?mRmHq8XazSpNjbk4VuA6/CbcfcMdVXsYD2szFN4iZg4am8xlYzYYUc13nMe0?=
 =?us-ascii?Q?bowyHLtpWzoXhch7i/MHV2hmOmIisef8Cy7PzpTBZfBWX2NiuLDUP6R5gNSt?=
 =?us-ascii?Q?ZS6FxEPMDc2qNJaJ7NAOV1YJWIAieEFe10GBeqUtANEjQtIpTV9DBS500wVN?=
 =?us-ascii?Q?sIv17/rbBWS7Ab6kOiqp0LVw4LbnQEu5H1Y/KYMyrGhCcuftA8KDsVikjhA7?=
 =?us-ascii?Q?rVYokv4cJTkIU+7VARdYFVNIjCTR3kWmja4Gyt/hLZ5J8AjvnsgOrNUstju2?=
 =?us-ascii?Q?qW1G07yskuUCL6wFJfsE55aRott6pNdYEvPKRwQl/SQwVDIO9WWri90Oloxh?=
 =?us-ascii?Q?NK8SFRhvxtn6rqn+b6QnrmxGGfX+qKfQJE+YQEDHCvFOCn1HzwfgtKAYfi8Y?=
 =?us-ascii?Q?3nUB3Trz3WlChXHKmCZLYe0sIuEuTegnLaoHvRPLvgsTxpvAqkF94NGAKw/V?=
 =?us-ascii?Q?jclVdVG0CWQbyGnIJDjmLvBaA9Z5I8IDnAOT7bah3yJ5P/8wbe3sZ6j6/PKf?=
 =?us-ascii?Q?rmcx+TX92KA5cbITro4VBsA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e7c0388-e5da-46c1-fda5-08db9862a97b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:12.1540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vsEgAZn9meLNx1+gYaLG/0w1RNsSVj6nrkGGgiDhR7IYtLRHqqwRXiZzKagnkj0J69wLvO99mWjC5sEhnJsgPi8YBum1K6NXjLpEf/ntj5LQiCfCik7c65FMkxVfIDII
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: 3LKJHEOE5VWEVBFXQMZAOTX7D3KA3FJ6
X-Message-ID-Hash: 3LKJHEOE5VWEVBFXQMZAOTX7D3KA3FJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LKJHEOE5VWEVBFXQMZAOTX7D3KA3FJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/sti_uniperif.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index a4d74d1e3c24..2c21a86421e6 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -369,10 +369,14 @@ static int sti_uniperiph_dai_probe(struct snd_soc_dai *dai)
 	return sti_uniperiph_dai_create_ctrl(dai);
 }
 
-static const struct snd_soc_dai_driver sti_uniperiph_dai_template = {
+static const struct snd_soc_dai_ops sti_uniperiph_dai_ops = {
 	.probe = sti_uniperiph_dai_probe,
 };
 
+static const struct snd_soc_dai_driver sti_uniperiph_dai_template = {
+	.ops = &sti_uniperiph_dai_ops,
+};
+
 static const struct snd_soc_component_driver sti_uniperiph_dai_component = {
 	.name = "sti_cpu_dai",
 	.suspend = sti_uniperiph_suspend,
-- 
2.25.1

