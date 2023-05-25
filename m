Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEE0710522
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FFC8839;
	Thu, 25 May 2023 07:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FFC8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684991018;
	bh=YOfXMtp4Xd7w7VTZDZzK8IKEFvxuS4daQh2h/u3zUAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tnOFWVLocf/Z0tACV6QJqt0zTg1uNZIfkkg6YHhuLQCEbNblPeNzPfdShJKD7CXxR
	 5TudKFQALMljfHSgFqy327pT4cELzC30Pli81kkd9Ry1CAFgiGDBf19n/lwh4+tWem
	 oh6IGfQ9Ve+F1SgNFrfTeAdr5Gycq7zi1zflVVRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 326BAF806A6; Thu, 25 May 2023 03:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECBA9F806A5;
	Thu, 25 May 2023 03:21:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F14FF806A7; Thu, 25 May 2023 03:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD533F80694
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD533F80694
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BjEHIixb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTtIl5IbpAMj1la0VJVr3kkyydruV6hEKGOEtQVgd3TREcOeNvR4PhtLFETu+ktYWt95GX09C/x0cTvFMtKmFoi07zqtgRIBMb5JrTTRmapGFnUPK+Y4ZPsvUTVkrDC6sOHzt7Bn2Oxv56/fG+DRF97xaMrVafEF9x8Odd5L3YP4CLKrshtxbeRbZEfR+YH9IrNAildfFtui/+XaNml1WMm0U7r0GntLGdFfyeOY36lrWmtck7rrpVII43Miffzj3gpwdb3PKP0bsFVKTxDlmQy+YUkxKA5FtzOUqYIOkIy3ZNvovHS3I2PtmzPZUg6KSCjn1UysmtBYprXW1hq8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0MBxES8G7KqJnqvndkCwJeuWMPog7wEcaBC84kjtAg=;
 b=V5BFLEjKCh0gMk8B2yOpKUQU6XOp3JoqrNbakFS+4tzMbMm+Ua6RLtgwfB9jeEoYK3A5MaiCMqsRjenaLrs78t8zpP56ZUD6d17Vdz48SXOZurek+/DTun6Ygt8ObVqoqtnyxAekj8TWLja5Y/oeL/LgLlBf+SNuLF8RmxqYHILqgh9XkH4yh8HBm3dW69MtuSr8hQBono4mfvvlxf9emQ6h7dWAMu19lqz9SbZKsTQ1HnKW3aoJFzZoznvZq2tLqBPHjAsbN5oVngEU53iLDGET4lXWEry9glaXseKwmrGR2tCy/bULfMr669Z9ZKj2XwwU71HBJg05lTpzRJDokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0MBxES8G7KqJnqvndkCwJeuWMPog7wEcaBC84kjtAg=;
 b=BjEHIixb95MWDohP6V3LCx6SbMsq/kZn25qy4gLIIbBJUJpphz6TvSqkyJu/5EVDrfLexBZM+r17iBeJI0ehT9Chiczo92GO4N77AyoQx70qD/PbsfbKmL87bfEmXyWy1ErFHZAOy4DdoPsz98aEtjjvYG5X3uMz71G1KrhRYZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9477.jpnprd01.prod.outlook.com (2603:1096:400:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Thu, 25 May
 2023 01:21:27 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:21:27 +0000
Message-ID: <877csxgq95.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 16/21] ASoC: soc-dai.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:21:26 +0000
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ec425a-2fd2-4b61-db41-08db5cbe5c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SZNbAQSAbjU8hx2s8RKa7lnUn32X+W7ubFW182rlkuJMf5/QmDgDn3XjQpPpuTmBgNGf4FIk5eAohaDUWF6FS1iNXJQGKv4/5F650vuGs3SJe8/OZk34nNCFgpltzSDcKlCFfYFU3NT5pYFtfP6lkrHSWfvkNDsjZbq20WUjDMaYgPr05KJaVE1Xdg0ZgnykX5Ch+m4A4/YLq9O1cN6cLkeozIrobdgOc34iwbvtHvNXftekRmYxkVqEcVX/zEAAfeydWJ09eM8nnnYOmFqu/9sytJcXql4CQyEenhea3UyUZw/f/5D4RuZEy51YALkkHeQqtkZaMRsCZT7YBjXSY+VXnLisjgBas3OZPKoUhgpm8JrIaWglqRaZzl1Ah6MRbEFuZLppQQgCCciF1rxl75/EdNprueW6iTkicQEGxx2N3J/LLSxwQNyYPzL5q4o0mjFGiTxBh0h3DJicVPF8z4Sb4KbvixMS1cyToKCoNyF889AR2M4gj0XhWe6LoT4rh5JwZVENYZvDjqLfiEp505j3kzTQji8CTM/C7Z1gVkOjywH+VFT/KdGjj69Lsbya72IrHMKVS7eGCP1bzuP/SwII0w+M3CHW2B5dmRjm5Ips5CwY55bnU6Zor6AJyCsj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(38100700002)(38350700002)(6486002)(2906002)(66946007)(66476007)(4326008)(8936002)(8676002)(41300700001)(66556008)(316002)(36756003)(5660300002)(478600001)(2616005)(52116002)(110136005)(186003)(6512007)(83380400001)(86362001)(26005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fk8PNJOKjBxvKprcbF+WfQNBXmJ208tqxfi+j01I5kTSQgf2QEJ4tGBcg3AI?=
 =?us-ascii?Q?tWIBQ2SPCnSnoKPw9RJEin4GCez66+CkOHct8BCzX7ggVu2HS024Xhgv0EEU?=
 =?us-ascii?Q?LFWJcu/W//JZd/c4MYe4lO3iP8zviXhU6XsMIsHVpI1Nrr9UOYSMKuWVKHQ3?=
 =?us-ascii?Q?lRTsAk6RzzNLIKOMHXtFHZ0tbcRCPmyHftwRVMYlSxVlbB25Xbo3vxN/E2VZ?=
 =?us-ascii?Q?+Dnm0FnVcIKAz3pdXjQ3cYBXGmzj2WDDGU7a+3kY4xm2G7F5pZwo1q0+uLYZ?=
 =?us-ascii?Q?9jKsrwDMEtSXJRjaohs3goOaUQ7hIoZwuWomkRQk4JbQcE7IHAnPCFbdWI20?=
 =?us-ascii?Q?Khz6K2IATqbHwpKvklTRxFlZuIqKgxjkgRdfhdeBS2Vk6fDH+eKakwAa1ADJ?=
 =?us-ascii?Q?vJ3xzt+Dg6rDj/CR5tH46zf0q1Uf979z2/cGhuuXZL+rqDhpElopTOQRQvsW?=
 =?us-ascii?Q?XrK8Pj/cqo0EOS2YDWSeAESiDruriHbXUuBOELMkW+dS+0u/xvObcJkcd0vY?=
 =?us-ascii?Q?8zZCK/MjHg9T2T/SdxyYz0lRKw2cAi8ugdRZDmpHdo2VRjsU5Aa4MiBkYiP9?=
 =?us-ascii?Q?cgPwQPnSajM3rPT6TtfcuypO5E1tvyk3NY18214e9C6kmOR8JdYbXp1KpOHi?=
 =?us-ascii?Q?vSMoLWeXDpWN8qcnnhGTB4fYdFJxMB/APpZyoI5X3XmHO9tdS7zXTIxpKQIN?=
 =?us-ascii?Q?8a9OPpQLQVXaMl09hU6zr8WX/F6EI2d0KoPfbgEt5QxJBdLNeCjrjksnnsqD?=
 =?us-ascii?Q?XB0S1iK7KyYXWami7PbD7jtMqqgSvSLNTTXAKJnW7vUr66/CHau3WwYRSQGn?=
 =?us-ascii?Q?DNR12fWd2b+P5MDotHara1JMAXI+l5gHGaweR+HGaYDdL7aD5E9iODVSkOFL?=
 =?us-ascii?Q?K0URfCh/4xJ2hGKRjF+ewrwbGse5xstVSw80tlR1At9XXJq7NURWGGoHexEU?=
 =?us-ascii?Q?s8VLFl3Iu809Ai4n52ghmel8lhNQEeGoIqWLelkf9i83Xh6mIv7cpWStKz2k?=
 =?us-ascii?Q?FM0RBolf2Rbb+S5XYZG3u92h5cfjU7Owq74v0nPgBYxtm84sIRqDsJRpYFZi?=
 =?us-ascii?Q?TlTn1dC477M92fHZPn/9URSeNuKkeEcZm8BM9ZHyxCYRcjwiY2PPr+W33e9T?=
 =?us-ascii?Q?cSXRMA8TUDMg5n6WW0Kb0PrROGeJ2lH7OcpTx/wdo6u8u7nSgN/Dmnl+nL0x?=
 =?us-ascii?Q?twbboSvgZyWOecoiMAMHQ/WSjjL81NeMXtDgsOzF7Ij8NuO7Sn/sZURCyFu6?=
 =?us-ascii?Q?A31ImgiSvJRK4MJKSUkWV/fzafuiYUQiFuBXsHVtzPVHNunfykI4hQPJoTtu?=
 =?us-ascii?Q?0wph0VaLUyW04rop1iMaoHGYNCJVx9NPMJBEmge5KWOxG9xx8EECB0G1z4Mv?=
 =?us-ascii?Q?dGcoO7Rqy+Ckm9PVEmJ/UBnzpLW01iyqManvmFPgGPnaCU8gYhPd/HZ6WN9g?=
 =?us-ascii?Q?ZaVcotbGRvPDggmlmbgLdp+sQss9wyZ4Q9bxsDXniWcU9w9cC0tA9xESeCzG?=
 =?us-ascii?Q?g17HCZln5wBBbV1+71x6HEwkRT+Rv2NBqmZkgaCPb3i1S5s3TUgS5NjQalnb?=
 =?us-ascii?Q?oBKdlOopuWAY/muZTE+rfREuwOL+Z5V7z/cnmKVWzA5s9Ek1kSz0et27GqHj?=
 =?us-ascii?Q?lxBx8dmtR30mPC892AVbYTE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32ec425a-2fd2-4b61-db41-08db5cbe5c69
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:21:27.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZF2UQMdqFhTKXfVvAgVi07q+JlzkViOHpNpfsmrVSokkPoYMSonLR0O1KP1KBi0QpC6b3QFQ/sCGCqN+yeK0ZX5RvC3oMAgRXYhFSH1+v9InvCW7A8KQCI8PHWHjIzZY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9477
Message-ID-Hash: 5SOWKAFFYY6HOPHTMQQYSSEFZDYIK4O7
X-Message-ID-Hash: 5SOWKAFFYY6HOPHTMQQYSSEFZDYIK4O7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SOWKAFFYY6HOPHTMQQYSSEFZDYIK4O7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 02dd64dea179..138f71ceab3c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -505,8 +505,10 @@ void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
 		supported[direction] = supported_cpu && supported_codec;
 	}
 
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
+	dai_link->playback_only = supported[SNDRV_PCM_STREAM_PLAYBACK] &&
+				 !supported[SNDRV_PCM_STREAM_CAPTURE];
+	dai_link->capture_only  = supported[SNDRV_PCM_STREAM_CAPTURE] &&
+				 !supported[SNDRV_PCM_STREAM_PLAYBACK];
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
 
-- 
2.25.1

