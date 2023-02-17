Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7D69A30F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 01:45:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52DE9ECE;
	Fri, 17 Feb 2023 01:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52DE9ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676594733;
	bh=jTXPAknLjSIZMIo+s17Q0cg7WsxT1avk1QWUZBWjr0Q=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TZFjn0UgtFhm624sGMgSjdom40WOe+KlPM7uKt54q14Vv4aKvHCLyRLf7Rn4TpzHD
	 MCQwrd2R6FqiWPF5hOwT5tpNLGn/COTv9xJb2n49WcW2h9xtSkiLCDFQE9/5QwwSLA
	 jTkSD3glaYDKVfkYFszYoc7Pv5FLCP3rXY58Zcok=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0DAF800E4;
	Fri, 17 Feb 2023 01:44:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5913F80171; Fri, 17 Feb 2023 01:44:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feac::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E349F800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 01:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E349F800AA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt7N0UYblMiTElkQedwukks6vDRx1rw9Dv8g1M2DwbbU3ofF9rccT8bfXnB5sEBNr7VYxK+PM1AxH19nCXxth0BKviJWm752ASrVNiFal+YRb5MOJv3tZvo8a4OWKiUzzdJKGs3ydN0gUW7wkizYUKj9qgSJlcfSSN2uWh9eyRt4/c5njUkFN51a0+2b+nIG+tv1CKxK6C78dkacBVRBlNcwqiuSQ3rCiaY+ba560Cr6rGHYJmJnfVkJOG523fuJ6kr+V3Fq/jlxr59/eS30QbQrxh1Zh1rd0zFCRJ3t8vNv+hw6Tsn9NDSv7bO/7VJgiRFwAItnfklNZpITyHKM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRCSBwddJU6Jvlgakep2UAfyLgkwwzJ/ZSqBJjhd4OM=;
 b=WXJRWuLFet1hb/R27nLh6s2kPOihIGv/Kc62N4a4SUcsLNTDGly3Vxrb0OIoxXMPOpph56W1AM6mdwXXJMIZcgoaTCoFE07+VRw2aOHgq9lO3Jsvu6of8m9K+PI+BZ05qeDmrrBVaW0s0oTxMkV4clMB9PNC8bWBGl9fLNLzbBKCOUES8DkOOszVz47ZBQbs8gLvjQ8Gbh58dSNOFfS1kim9ulC60WzHHQwqeSmaUXM3K5cBHvTZVfngHPwd+fdZ7Tug96JvBSAm4M75jTmg1jP+a5xuY9QXpq7htxRxvYN7YwHYBV0zTIcEzQ0UR97IgLnrUhLZg3qX7DINzcuOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from PS2P216MB0068.KORP216.PROD.OUTLOOK.COM (2603:1096:300:29::17)
 by SL2P216MB0330.KORP216.PROD.OUTLOOK.COM (2603:1096:100:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 00:44:21 +0000
Received: from PS2P216MB0068.KORP216.PROD.OUTLOOK.COM
 ([fe80::c20b:f85c:4ccb:b645]) by PS2P216MB0068.KORP216.PROD.OUTLOOK.COM
 ([fe80::c20b:f85c:4ccb:b645%9]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 00:44:21 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: SMA1303: Change the value for right output
Date: Fri, 17 Feb 2023 00:44:03 +0000
Message-Id: <20230217004403.10220-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:100:2d::16) To PS2P216MB0068.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB0068:EE_|SL2P216MB0330:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bd6d9e-f59f-465d-968c-08db10801be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k4FkSHr+KVVusGtHpzqCM/27rGyBc/hYMmLTQyF1YH+Gh6AdtGG1ireJ7jJGAaaF+/6uNOdwbTWO8VfInsjVwBi0Vue0aNaiK4y4xoJcurMoWEnqMANYD0zuh1/+7l5ppEK7OUpSzR5mJf999Vo/9VGKmR3OF21WpGj+rye/flO5GTnWBI6OPU5HgFv1XDnm49pehUVzR1poTlSe6tNWsN/M5PyK+Dxw7h7i3YcwgpGJT9Xf9lKsZeVQuW3tEFJ3k8Y9+x90UDt2C1sGF3RK1lFIOEMOe/g12rw+euInDJgpt3OHHD7YBqHF3iIRVhfBdHdqmamQ0c2rbBu5pYIP3w83s95O6h6AH8ZU9GREHmGorwIdqWr8+tLXXJS4BsXSA2UFq4zFds2A08Il4wYKjvuZk3Rcmyd9SBqfpcnWP5NosjwiA8hc1aNIS2vw35DoCiWpEHd7uaUtUy5vXkI5eSBNov8Qe/25aT8S/UUtCNjvCxhDu2alkAWBwk9TLIFX83NInUvWjKSuzbD4smtP9Hpi925Yy+TWO00XeinlEGANrnW40eX0l/dICU/T9tf0myILlV2ACxFfx3s0WUDtuKMneja1OZyDi8h7NWCN3YXhzLLxj5cXUg51w4u6DHGhR83UeTu6l/xgjaAmmDi+ai4Iu83zIbkXwRhDtNvf1RUnnFk2FXB5PmptCywrnrbPO4/QVoihraWze+uDwZYQaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB0068.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(39840400004)(396003)(376002)(346002)(136003)(451199018)(2906002)(83380400001)(36756003)(5660300002)(44832011)(4744005)(8936002)(41300700001)(4326008)(8676002)(66476007)(66946007)(110136005)(316002)(38350700002)(38100700002)(86362001)(66556008)(26005)(2616005)(186003)(6666004)(52116002)(6512007)(6506007)(1076003)(6486002)(107886003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hh53wrYORGxPO7PE+H+BLkT88dYfHwNz70WVpytYzAUTKGWwFMyADn/CWgDB?=
 =?us-ascii?Q?NmJEqumA9liXsDL9h3oZgfSq7VAstO3e1x16B1ATk1IhyVvm9dbrov4H2Jw2?=
 =?us-ascii?Q?HTd5AB1HVnyQBKeUWp88tYajxrnyC8CywbA6WLyX/ri4Xm6XGVVQiH8t39fm?=
 =?us-ascii?Q?LUF4A/agkVVpXsLR9n2Odyz8Jr7SjKnSTFeJ91Wg7wVEwNlE+GrcXXc790Jr?=
 =?us-ascii?Q?e3RzAAtNKI4SQWYvjEtJxOgQqboaYteAQ1bmka5YPQUCPvRE2Mx3v0MFDgA9?=
 =?us-ascii?Q?jfElpWWKNSPhkZXFieFLQwSWV6nRXEO7ENfY/5lAHkbwwkAg8VbFIDLzbAPv?=
 =?us-ascii?Q?X4NF2/g3zix29WoDVdYcASpMcdczX5RDR3h8pKIMla90ngJV9ee4QXtEM3+M?=
 =?us-ascii?Q?ItsEzN1NYlX/0oHMM/tbhy9L631pbEK8nRLAhpDXYgunH4pb/cAkvuftvtTa?=
 =?us-ascii?Q?jsto5MzUiMpeWj538EP4AYYsgk61QH8BRsuTHUpj9rVoJzGnZGyzlBOqdm3j?=
 =?us-ascii?Q?hySftfJnmkqNLhoFw/Pkpi+ZnIbAOWnHxE8QYIdU78PJaN4VuB16P69u7CSV?=
 =?us-ascii?Q?eXa3aR9LaM3Lidw2Vw0ziY+pCaiuSIlQV77RdcfBC8+Fjx8wVCwsXGXR9GJI?=
 =?us-ascii?Q?FlGEvBFB/JcZWEnkfTH5LcYHvJLu1QIyUtaxi+lXjBV/dNu6H8M/UO9RqYIY?=
 =?us-ascii?Q?fYmTjbdXZJnmpUolcJMAH7stfSl7zLKWyb8Sm4lo8zAENLs0EFxQLSKiYzGV?=
 =?us-ascii?Q?LvWkhvso+/A1Ftf1ZneRYOXhH+3SuCfiHZ7Df7zmQdLGs6akEH3dBoNuuVPe?=
 =?us-ascii?Q?oMIGNSY/xt0sFb7WBtzat+AUBdkYwx69hBdVZ1mSZHeU8epBSVDs0f2IskzN?=
 =?us-ascii?Q?1/XvKRWZT9YkDgVfDl3W3i6OQQmDEqY/P27H62qYfxk5nvva2prZOPXYOE6j?=
 =?us-ascii?Q?JukLy1/qiPaBw91YUqrfyJ0aGWDRFnWfhqHVxU+appm/x4LKAeDpEWe+R87I?=
 =?us-ascii?Q?LWdJX87VCNPetLVtWUVHYyWwgEV2VDj/p8raiijtjRsXIdfCXJSC4KEBO4qR?=
 =?us-ascii?Q?/CxMVwNFvfucdXeI88NbsXf9ippkt4srueXRQEuMwyCeHjuqa33CrW5QCtVx?=
 =?us-ascii?Q?ZBnfpjpJwsZKxSk/FMIxTmZwm4xLHsD3twqsbJ5qESFpfrr4yqFakaDsTCpU?=
 =?us-ascii?Q?RfXxSm1to5Nspt91FEr3wric6m4NeL4LlbrfhWf39nsSJPtKzg6Zx8XVYL3Z?=
 =?us-ascii?Q?JiN8IOhixo7vt84hHFqyjWRo7BPeYJSHzCcsbESSc7MHTfWRTsKVpK4Sg+lM?=
 =?us-ascii?Q?yS8vag+M7PUpsvOpqYHtIy5kcAIUZw6ALJkqu8AC4Q+Tkk3MFRdkE5Wli0Rr?=
 =?us-ascii?Q?JgC1rKRWuEI032Hr0fjB2JgWbmUeM0v7vtvZIsnRWNmpcm6HK3Qnn3f10yAu?=
 =?us-ascii?Q?jE0degb7bUOVJjHjfJMkm34d9EN63qleQsReIxYAXLVW7vjHx6DnxPxskKLs?=
 =?us-ascii?Q?7q60jUBcqioDWDszdr/4MVowCtdE31SWeAsNNGeCxPljxvPOgmZqTgdsrDTw?=
 =?us-ascii?Q?JxPeoz3vVYioj6kx2681HyFaMa0t1CSmKY8rnpN/lFRtTrtyJi0Y+TokKpnJ?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2bd6d9e-f59f-465d-968c-08db10801be2
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB0068.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 00:44:21.4156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4f23ddYnkbs3GI/+hCLMNNwpdcQ6tM0q8IZuEC+Be44Pqdv27Ik1rh2/P719r7zBuirbx7BUwJg+xxvVKJPy4YGJFao294MasyrQKmhiR8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0330
Message-ID-Hash: 74JEXZ4K2UV4BAB7POYHR6IE5UDXKNJQ
X-Message-ID-Hash: 74JEXZ4K2UV4BAB7POYHR6IE5UDXKNJQ
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Kiseok Jo <kiseok.jo@irondevice.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74JEXZ4K2UV4BAB7POYHR6IE5UDXKNJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This device can output mono, left or right.
LR data should be swapped to output right data.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 727c01facf52..fa4b0a60f8a9 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -569,7 +569,7 @@ static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_11_SYSTEM_CTRL2,
 					SMA1303_LR_DATA_SW_MASK,
-					SMA1303_LR_DATA_SW_NORMAL,
+					SMA1303_LR_DATA_SW_SWAP,
 					&temp);
 			if (temp == true)
 				change = true;

base-commit: ab2932214588224b11102e40ba2e78a6f099b8ef
-- 
2.20.1

