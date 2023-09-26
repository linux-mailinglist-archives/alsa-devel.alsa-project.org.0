Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE257AE5FE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38611507;
	Tue, 26 Sep 2023 08:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38611507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710038;
	bh=UmL0d15pmKbeIEY0h7HB9FrbhgKuBH98lI8+c5/E5p0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lwnnIXeKewfj2BW1O81ovJm6bMSxjPNPWT84QbqdxFAkGQ7v5jjZizWu9pJMpP6XI
	 1kakRxxvOJRlPyUuOEAjDIFdmXa0WU6IxtQbIC3JTY6widrS1nT/2VK/QHsZW6IRef
	 XdCjZ4FnIS6vY/8C7wBidI5tcOUCDOimNaUk0TJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30EC8F8060A; Tue, 26 Sep 2023 08:26:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2064F805C1;
	Tue, 26 Sep 2023 08:26:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83229F805C1; Tue, 26 Sep 2023 08:26:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46377F805C1
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46377F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oAoCaI+u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USyP6UIf6XJ7UNu1KsWBhnY2opWqoE8mwYeGIVN77B+k5IP14u959SKQGvxlgCAyVzImR8a9/Jl0qmERvJXhKaXg+vM/LQh1YSURUGsZEQPsPZm7AF4KYrG63mR0cAONBiVCa6/IJDPqwh/D63X/Qd194H7J3c3EB6B/bbMQb6IZBUJlcOBF1SIQOKTZw/Rdyb3Fe3LNw7CbpQAQKtO5NwS7aPh2Vc4ndBYV3iGrDfxRk7ZP56ZvEZ09erUKeKSkF3CUSLw4AKZuovURjmRNlQWPTFYkkJ7aqIXAU8jKGRNyP3IYvOsn5NNn6Nd0bXPlQZTjM9LTKTOXsy6Hl4bh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JibD+hsLPTTmAcd22km7l1WZZtu39vsdXurD+thjpAM=;
 b=iKOk9o4PxWrzq9Uv6D0efXsDpAV464CYF4A/wkJHHNtXB55PrSRRqmkZq9N6ZjPMNJb97668X8+brwnuhVacqzAXFKp6cAywV3BnRExOPXJ1yjGr1ixLX/nj1HWkwc7qhr1aDZWsBNNDPfDLOUJbk2dZzdZHTtNL+pvwIhBSeWA1cUu4c+HJkyuvf/lmBDdxrs0OuhqNEef2E1sUtJou9XndZUY3SK7V5ghpPnnQTcEQ1mcxMKH7rqCVT0p8Q/SCk4A62MsnJ3OLTM398EVVbg8ilGIDGCkPvUA/xYyWermLRWuiS4BLA8+cHwdvOZJ/kfY6Nd29hWTRMkiZgZ7X6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JibD+hsLPTTmAcd22km7l1WZZtu39vsdXurD+thjpAM=;
 b=oAoCaI+uNOSV4D4uinYc1BxmS5SPUe71gjqlbCIvVkrsDVUsrzYuq1RwPowBMghgada9lQu/vEZUarsZwZB9dF/fuwTKt7xq/BnL7slZGAbZyg2vD/GZqpDqOphLHH+B33ujdpvL9HgnXj9h/pd4mtRXVyXcnf+xpH6l3MGnl+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB8000.jpnprd01.prod.outlook.com (2603:1096:400:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:08 +0000
Message-ID: <87lectfo1s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 45/54] ASoC: soc-pcm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:07 +0000
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 37db167d-c4c3-41cb-4134-08dbbe597815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vk3EqTqoxedWxJnCE9mv7SOoGNNPCxLNt/MAMkPlVVtg8obex5sTaWoTk4UEo6zFTTGx6BCXVvJQZ3GHj4yNU79Y4FEKekThKFDepFjeN7BDJgDchF8QX/vL1BCE891Coh7cXOrPqE41Ii9/jmqF+/bIh/Qer0j5gZRZp0bfrRrCXYw0n99sxGIMW4pB1nyOkn+meaJqt+nxTA8LRYFyGE4tqDZ5IdmK0CAxhaSlMlJYMXjCSsgHeJQxEe888/V1fpTjc9lSRMtJH2QyV3BTKPhcusxX3m2no/Ymh3+OBaR5ucT4tKf73mj5dA41OBIr6vNrn8uvidsNzDLHbOJWkmTJvanQbp/ER0XMSGWmmVgSbyLy9NWyfnUWa3uFX/RQHoJg6xvNt9NHeK37brzkGTsSMgangpK4QOvOko1tzoqEy+/Ktk7e9p1Hlm9WKdr0kA5Kg4eoSZiDeWSQ/QuakiVfAya55i0C/4j9qOhxlDvN9ia/PePcAK/NwNwhB/1AfVNlcJBg0ln/VP8Sbrva+ceA2s454MSqsdRsdth5HaH+ClYppdW/KwU66BLf1hsVwxqsve+LNYoqn/OVe6xIH3hiLGjPWf00VK5j1lFvOxsN6AD78c32A265nINkahWuXRXZ3gndrKb4S+onUKJ01w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(5660300002)(83380400001)(2906002)(316002)(41300700001)(30864003)(8936002)(8676002)(36756003)(4326008)(2616005)(66476007)(66556008)(66946007)(6486002)(110136005)(52116002)(6512007)(6506007)(86362001)(26005)(38100700002)(38350700002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qjv4wDG3j/FxvYRlsyIrgXVdoa14MhDtbk7LQsrIjDlkHH297AbcCn9r/i+L?=
 =?us-ascii?Q?QePdq74J5c+mJ5x/NhslewAhd7fTTsFbncIaow/mcBuGSi4qgkiKjAqyIGEE?=
 =?us-ascii?Q?uUxslmDriN4piW7vsmK07NM9qgfue0KiwnARo2lTYtwNxAhcZgRVpwgn1U4X?=
 =?us-ascii?Q?FRj0eRD4+7Vqr4Bd+pUPQikEX+yaycyClHWhtHcxYJGwCvLab+yTs/TQNLK7?=
 =?us-ascii?Q?xrfPWtYOsmpWKh47Q12XHF4Oo+G0wBPlC9SPUikSqvsTw3alzu+R7BLyFea1?=
 =?us-ascii?Q?BnYaqwdikHX5cvs1ELlVSFyr1/me47ACaGJbPHhYmUKINRKRWZpb4vWgj0wx?=
 =?us-ascii?Q?sR9cer8nSLiTl5AnOPGMjwiAzd/dcbSM4YSTG0CgsvtMJ9PxiuK1JKMuUyKg?=
 =?us-ascii?Q?z4kHTF9q05HOBa5MYFMHMVxLGugAFjlxiMmce/pCwXD4aSeGCz21Vgg8ugGg?=
 =?us-ascii?Q?thsDTV63g71/j9iMsG0FazA29fwJgRMmULGQCbMh0NYY3CxDtNPadWBv6hor?=
 =?us-ascii?Q?WO3KLASByz/xEiRHl9pf7WQvct7EthBQOvT0LVRlWCsxskKaPp1c/PwIkge6?=
 =?us-ascii?Q?yUTbzHCUbWewo0uTpeFHS7IPtnoRe3/yDGta5Mct47/pCRU6WUGvNT0E7E62?=
 =?us-ascii?Q?Hf2lEXBpTbcbwiekOzJYqGJdwpL/I9x/T6FdZ5GLSvQUw2gGbXaFi1MUrcUF?=
 =?us-ascii?Q?8hJN99rre3rorSGeA+YUWkAFy7efZXJmlgfAMPIlTCDcD3/1MS1irg7EgjKJ?=
 =?us-ascii?Q?uKj6H8VKzzbvI0/HpY3aBKLVJ9uuw5d4EIT1Y+1s9EE26/cyYsUORIPbvpiu?=
 =?us-ascii?Q?IHM5iKOyMVcMORnjWt5CR7YE7Zt2pL+Vqh8Xpf159e5fUhg9mBbMWBvHM0II?=
 =?us-ascii?Q?x8y3U8hIhP2qalJnlMwk/YuTcX3r11rV7GOPNLY5ATdJd/DGKO8gV1jC6JUt?=
 =?us-ascii?Q?XK5176LOSnTWfE/nFX7UXh6mAPxpZi21Cw7ZZjWbhOZ0whdq4M5a/HCA1Y1D?=
 =?us-ascii?Q?b86HugBXPv7H0BepjW3vVibs8w9hkQpYrIMTP6LYDJth9GJ/yQZ16IlZSFMI?=
 =?us-ascii?Q?7CQlTnR3CT/kWBCEuGN95TWCIaHitmIbTjY6kfOu5VMwRLHUNF5MS2ke8kMo?=
 =?us-ascii?Q?L9k9hGaoV1XhGgaDaF9gjSfaaiSdLDGLu0ffl+aBvjDPhMBIUkOWfpGsiep/?=
 =?us-ascii?Q?1pKmnYtSJFYjc7wt1fG05jg1VABoTPA7vzz8gbodZUnTSWGiB748EvV7S5PP?=
 =?us-ascii?Q?jftO22q8BrMFPNmBq5LEqXsALvwcOsQNiGDQBEewl1xnMqO3ffw5ykwmTTTa?=
 =?us-ascii?Q?F3UqVd01sjjUTQ48m+L0LJhqTBvWr7ygMMuudO3T0TfVi+8yZ9Hhuetlps2d?=
 =?us-ascii?Q?ZOgfL29vjiy70erPxLJ4cIZGkfv6rQbgen9Y9HQc0emLfcVRGSiTnbFiNutI?=
 =?us-ascii?Q?uzNa5Tu7se08QnGQz2kIUAhx433d54hWBqvZ39p02ovyUf801mHEkP/WgCE4?=
 =?us-ascii?Q?GERoTr2QCI1MNWNBZUPGiExqnaa/lR4udwMYqU76UbRh5U4rXWYmlA1Q7Lkj?=
 =?us-ascii?Q?MniWNxfCjWk5vh550BfEQd1eLtFMb33Dsu0JB4GDfOak3Hs/K/dtGoHxWJA9?=
 =?us-ascii?Q?pB4vd7ujDbK65suaNYRkAls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37db167d-c4c3-41cb-4134-08dbbe597815
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:08.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2K/6oLeipeSwPK7ysWjV2FvI3NTXn+m4+N8KAJVH7vza4ktgDYXO/hnvuWxERC4OMdr2DmdvVNbbSR5uuNr28NdYWwVzr2J7kdkR1fuSLe190KGeS4WDL8eMxS5ekJzz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8000
Message-ID-Hash: PBTBSBNG6KH6TPVLKMIPVVXANV3OXP2A
X-Message-ID-Hash: PBTBSBNG6KH6TPVLKMIPVVXANV3OXP2A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBTBSBNG6KH6TPVLKMIPVVXANV3OXP2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 90 ++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 54704250c0a2..b63019c66224 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -71,11 +71,11 @@ static inline void snd_soc_dpcm_stream_unlock_irq(struct snd_soc_pcm_runtime *rt
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
 {
-	return (rtd)->dai_link->num_cpus == 1 ? asoc_rtd_to_cpu(rtd, 0)->name : "multicpu";
+	return (rtd)->dai_link->num_cpus == 1 ? snd_soc_rtd_to_cpu(rtd, 0)->name : "multicpu";
 }
 static inline const char *soc_codec_dai_name(struct snd_soc_pcm_runtime *rtd)
 {
-	return (rtd)->dai_link->num_codecs == 1 ? asoc_rtd_to_codec(rtd, 0)->name : "multicodec";
+	return (rtd)->dai_link->num_codecs == 1 ? snd_soc_rtd_to_codec(rtd, 0)->name : "multicodec";
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -184,7 +184,7 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 
 	snd_soc_dpcm_mutex_lock(fe);
 	for_each_pcm_streams(stream)
-		if (snd_soc_dai_stream_valid(asoc_rtd_to_cpu(fe, 0), stream))
+		if (snd_soc_dai_stream_valid(snd_soc_rtd_to_cpu(fe, 0), stream))
 			offset += dpcm_show_state(fe, stream,
 						  buf + offset,
 						  out_count - offset);
@@ -386,7 +386,7 @@ static void soc_pcm_set_dai_params(struct snd_soc_dai *dai,
 static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *soc_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	if (!snd_soc_dai_active(soc_dai))
@@ -419,7 +419,7 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai d;
 	struct snd_soc_dai *dai;
 	struct snd_soc_dai *cpu_dai;
@@ -452,7 +452,7 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 
 static void soc_pcm_update_symmetry(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *link = rtd->dai_link;
 	struct snd_soc_dai *dai;
 	unsigned int symmetry, i;
@@ -473,7 +473,7 @@ static void soc_pcm_update_symmetry(struct snd_pcm_substream *substream)
 
 static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	if (!bits)
@@ -487,7 +487,7 @@ static void soc_pcm_set_msb(struct snd_pcm_substream *substream, int bits)
 
 static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int stream = substream->stream;
@@ -636,7 +636,7 @@ EXPORT_SYMBOL_GPL(snd_soc_runtime_calc_hw);
 static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_hardware *hw = &substream->runtime->hw;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	u64 formats = hw->formats;
 
 	/*
@@ -652,7 +652,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 
 static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
@@ -672,7 +672,7 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 				    int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
@@ -738,7 +738,7 @@ static int __soc_pcm_close(struct snd_soc_pcm_runtime *rtd,
 /* PCM close ops for non-DPCM streams */
 static int soc_pcm_close(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	snd_soc_dpcm_mutex_lock(rtd);
 	__soc_pcm_close(rtd, substream);
@@ -748,7 +748,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 static int soc_hw_sanity_check(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_hardware *hw = &substream->runtime->hw;
 	const char *name_cpu = soc_cpu_dai_name(rtd);
 	const char *name_codec = soc_codec_dai_name(rtd);
@@ -854,7 +854,7 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 /* PCM open ops for non-DPCM streams */
 static int soc_pcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -908,7 +908,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 /* PCM prepare ops for non-DPCM streams */
 static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -965,7 +965,7 @@ static int __soc_pcm_hw_free(struct snd_soc_pcm_runtime *rtd,
 /* hw_free PCM ops for non-DPCM streams */
 static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -1085,7 +1085,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -1110,7 +1110,7 @@ static int (* const trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream,
 
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
 	int ret = 0, r = 0, i;
 	int rollback = 0;
@@ -1397,7 +1397,7 @@ EXPORT_SYMBOL_GPL(dpcm_end_walk_at_be);
 int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	int stream, struct snd_soc_dapm_widget_list **list)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	int paths;
 
 	if (fe->dai_link->num_cpus > 1) {
@@ -1670,7 +1670,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 
 static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dai *dai;
@@ -1704,7 +1704,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 
 static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dpcm *dpcm;
@@ -1741,7 +1741,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 
 static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dpcm *dpcm;
@@ -1780,7 +1780,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 		 */
 		if (be->dai_link->num_codecs == 1) {
 			struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
-				asoc_rtd_to_codec(be, 0), stream);
+				snd_soc_rtd_to_codec(be, 0), stream);
 
 			soc_pcm_hw_update_chan(hw, codec_stream);
 		}
@@ -1789,7 +1789,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 
 static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_dpcm *dpcm;
@@ -1828,7 +1828,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 			       int stream)
 {
 	struct snd_soc_dpcm *dpcm;
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	struct snd_soc_dai *fe_cpu_dai;
 	int err = 0;
 	int i;
@@ -1855,7 +1855,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 		if (!be_substream)
 			continue;
 
-		rtd = asoc_substream_to_rtd(be_substream);
+		rtd = snd_soc_substream_to_rtd(be_substream);
 		if (rtd->dai_link->be_hw_params_fixup)
 			continue;
 
@@ -1874,7 +1874,7 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
 
 static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	int stream = fe_substream->stream, ret = 0;
 
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);
@@ -1911,7 +1911,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 
 static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	snd_soc_dpcm_mutex_assert_held(fe);
@@ -1977,7 +1977,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 
 static int dpcm_fe_dai_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2080,7 +2080,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int ret, stream = substream->stream;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2283,7 +2283,7 @@ EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
 static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 				  int cmd, bool fe_first)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	/* call trigger on the frontend before the backend. */
@@ -2314,7 +2314,7 @@ static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 
 static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 	int ret = 0;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
@@ -2401,7 +2401,7 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 
 static int dpcm_fe_dai_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
 	/* if FE's runtime_update is already set, we're in race;
@@ -2455,7 +2455,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 
 static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream, ret = 0;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2632,7 +2632,7 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	}
 
 	/* only check active links */
-	if (!snd_soc_dai_active(asoc_rtd_to_cpu(fe, 0)))
+	if (!snd_soc_dai_active(snd_soc_rtd_to_cpu(fe, 0)))
 		return 0;
 
 	/* DAPM sync will call this to update DSP paths */
@@ -2642,13 +2642,13 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	for_each_pcm_streams(stream) {
 
 		/* skip if FE doesn't have playback/capture capability */
-		if (!snd_soc_dai_stream_valid(asoc_rtd_to_cpu(fe, 0),   stream) ||
-		    !snd_soc_dai_stream_valid(asoc_rtd_to_codec(fe, 0), stream))
+		if (!snd_soc_dai_stream_valid(snd_soc_rtd_to_cpu(fe, 0),   stream) ||
+		    !snd_soc_dai_stream_valid(snd_soc_rtd_to_codec(fe, 0), stream))
 			continue;
 
 		/* skip if FE isn't currently playing/capturing */
-		if (!snd_soc_dai_stream_active(asoc_rtd_to_cpu(fe, 0), stream) ||
-		    !snd_soc_dai_stream_active(asoc_rtd_to_codec(fe, 0), stream))
+		if (!snd_soc_dai_stream_active(snd_soc_rtd_to_cpu(fe, 0), stream) ||
+		    !snd_soc_dai_stream_active(snd_soc_rtd_to_codec(fe, 0), stream))
 			continue;
 
 		paths = dpcm_path_get(fe, stream, &list);
@@ -2706,7 +2706,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
 
 static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	struct snd_soc_dpcm *dpcm;
 	int stream = fe_substream->stream;
 
@@ -2721,7 +2721,7 @@ static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 
 static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(fe);
@@ -2735,7 +2735,7 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
 
 static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 {
-	struct snd_soc_pcm_runtime *fe = asoc_substream_to_rtd(fe_substream);
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(fe_substream);
 	struct snd_soc_dapm_widget_list *list;
 	int ret;
 	int stream = fe_substream->stream;
@@ -2819,9 +2819,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (dai_link->num_cpus == 1) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = asoc_rtd_to_cpu(rtd, i);
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
 			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
 				int cpu_id;
 
@@ -2832,7 +2832,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				}
 
 				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = asoc_rtd_to_cpu(rtd, cpu_id);
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
 			} else {
 				dev_err(rtd->card->dev,
 					"%s codec number %d < cpu number %d is not supported\n",
-- 
2.25.1

