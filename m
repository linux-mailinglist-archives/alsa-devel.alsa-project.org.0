Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B69739403C4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8AF485D;
	Tue, 30 Jul 2024 03:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8AF485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722303101;
	bh=ymYiAa/U+QKh8DZuVGShIumI/lGYEXxkMOpLR+UL9kI=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ICoGYxGkyZoGV+e6p1F+W9o2qSPU8+WB/eH2B2Vp8fIpqewZo8yxoxyMvZkIsrLNX
	 eUaRp2m0zOW8eJGJtN2WXZWPrXrEXEXj4FBtrPwBUOangRkZsdRjtrSgW5MhNepFO9
	 O/4koDUDHmmIV25sRrIcjWKSIIBl0q4j8AJe3RE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B85B9F805B6; Tue, 30 Jul 2024 03:31:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2996DF805A8;
	Tue, 30 Jul 2024 03:31:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC7B3F802DB; Tue, 30 Jul 2024 03:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94F08F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F08F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kC/QPT0b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/dBcvRLO2tg8TbIIBrGM6CZy3JCyQWTIe3C+svNEMDsm4J5qhbb3tQDDhe/lschBksE3sxtrQYlWg7GaMOlKknEnlKF31uONF490vp+RDlrJqEHuO0sUFMxh9rXa4cy2mFBn+OPT9+kV55ITDigJfAoRp+gz/Ha05CVSNZLwVTWsS8d8/M+nI7/8e0qd3YMn8TIBGlBSVF6yrBaDcrVqE3+2zFKmw2IzpEldRa6dbWGZLC+KCFhh49UpsRSdMxYQIM+tjp7QJJjAD5SMFDUPCk+Xy5k320Hw2Iw7kONdMyGgAmZt9/YajUUDbGEyldov+9b3HW1yRYP6uCZG0Nq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9+sV3R/kZqDNzs9Sv3bj53qletkhgFjg3IjC6JFmao=;
 b=M4KiekLhRmO+xyZ/FYoXrrHLPrQFza9jEZIVb6mGOE654kkDMac6QIC52Uiu1w1E0Q/P3wloI7sb9bZnyoUU5YttDf/LMO9JNV3z25IOK7l68MtctzE8/mPCAcJSYMMolAUMTVGdIY0KW2jw4DxLOt8jXsQSmpKeaX1Yer7TuF8VT0zGXp6ASZ821RxiFGlJTHyfSCivPL+y7FWwGHmJK3F4Hi5OvSXfgW9DqlHUD015T7h8V8aXFs9i/2hqoDxekBUqBLIKhYkVuAk4P6NxIgE9ymTbLWkQGguRfqrMkhqADCF1ROnddNTfQ6q6gfMLt8WpRohTm4cDlYszEceySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9+sV3R/kZqDNzs9Sv3bj53qletkhgFjg3IjC6JFmao=;
 b=kC/QPT0by+FBK5zJ0u8p8FJ0kYgtXnv5/gUH9INT5yTLz5mF/6O0wKRgYCY6QStgpqH8ZATcoxie1BqmgHSzpfjvcvLkdL8C3uF4pzquooAaDkhTKymRTXjcgiyz7vPjEodAuFFY7yOUe/ZmAqi6Yc6FXCedX74YwZ9ufaUa2q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6494.jpnprd01.prod.outlook.com
 (2603:1096:400:9a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 01:30:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:30:51 +0000
Message-ID: <875xsnll85.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm: remove snd_soc_dpcm_stream_{lock/unlock}_irq()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:30:51 +0000
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf15ea9-cd0a-4e87-e779-08dcb0373f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BXc1qH1lMY244vjLnaQIj1AQVRgkKnuiaXwwzsq167Lb+lCS7gi1bjisSBbo?=
 =?us-ascii?Q?x3c2s+hLVYxV5RAyKOKcGApBgGPKSJSo0XqrGS3IxrbRdGVgIYOrDfEVboOg?=
 =?us-ascii?Q?r6Brz2e36wk/D8GTy48JbEuB8IodcZ/REEtdVztCwLc6hrMmZRBYkBeu4JiI?=
 =?us-ascii?Q?S7EOj+EOY+tHxgfmk4yD2+CBXxsbRACywhM2jjGZMQud4FmoaHregloOEHpN?=
 =?us-ascii?Q?tv9BASoH6Ha9ickYhTM6QhYHjs4Qbhj1/uakmPkiLS+GKVWKs7DwTZhEc1a0?=
 =?us-ascii?Q?uvCi2zV/DkQmOWf2Ef4CtHPQns9jFF4kdtqiCCsKafRKMy/wG2SA0orojJH1?=
 =?us-ascii?Q?yjpy2omCUg4Ukfah+98Avb5f2b5WyeR+Dk9KmSSeJ9E7T8nykE2WYG7ijipJ?=
 =?us-ascii?Q?g7dNUHD63c7TenWVLjvyxZUugFVlmBX+4cvLaiLzT9n+d4aVCD13wf1HW3j+?=
 =?us-ascii?Q?zKE40XNVtbb8c6uPBNd/r+rZBuNhno4Ba8s23P6eCEpSud7cxtxd2HjRfS+C?=
 =?us-ascii?Q?n5EGo/0jvP0LOt9H8NqoN2505RdApxjMPUuUGFwnQCFT86XSbvHuZY1LOyUA?=
 =?us-ascii?Q?Fl0aYu5q0lLbaisede5CHYk+GVE2oKLFCE1lgAdek3LHtVSSyp6P5ZfojQhi?=
 =?us-ascii?Q?KYck0nT8EW+Vv6A/qX34qothEUQq0O7g5dXYqpko2tpGMfUWL+7UXsQEmJU6?=
 =?us-ascii?Q?VIlQsed1pZPblvzso2RmVf2sFaLNqZL5m/6EL4VOJMfNezKzh3NYRbXHFEE7?=
 =?us-ascii?Q?DWa+gz/A2MTyHwO5/TCWgWf2310gedyRblXIfBolwrOFexWLZIZ3b2Yc6YqA?=
 =?us-ascii?Q?SwdXphKSq+S5hEL8QgjacP/at6Svq03EfFlwcT9MrYSKG65Ce6x/a5PXURRy?=
 =?us-ascii?Q?oSJ/i+s4whA6YBEvnAkYO8NaE8nLL4SN6H0btzE1XpvBnD5fflnErsQv5yLY?=
 =?us-ascii?Q?2T7yPPAuNYCL8Wso3/ReFiCMDVGvSjJedLuwXHVH0N2qkzRuzRvDX6Yqb6mK?=
 =?us-ascii?Q?LXC7HfnmnzDewXCSHEIa11KWoydAZHow8GDwN3oY38Rn+5h0xK48O0tbsvuI?=
 =?us-ascii?Q?SNd1xXk1K0BxJ0x+fP0YctH7kEYaYEf8veEGWJoYtogU6Sz0Ks5pBIG/Jf38?=
 =?us-ascii?Q?xNEnq5cU3h602eTVyyxJPVDmj1rqzxTrp5RgN1oexfNB/azyBAuVm6+hSPFo?=
 =?us-ascii?Q?cG3bAPunUCgbnykqo2gIYP3JYJwqtTMk8hjdlbveptw9d8yS0nogF0I8tWRX?=
 =?us-ascii?Q?6eYruNJHquLMRlhSsKLOru/6qguWwyKO3vQkzebaPZDKsaKMsnvsbkwp4DQo?=
 =?us-ascii?Q?yhlGRJvvUsDVmG7gWzV61ZR2Cni9MFT7zrrZx4/UkujHwSvqRsxFr8MCqjqb?=
 =?us-ascii?Q?SFum1VvZjQztLlQI0G+b1gL/sV++zNnryWhrNlnDFwwjcT1SkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eWa0wshm178/PszYTDjTGsuYenMQIPrEu0l3xvQojzq9RTUny4JxCIxS5owf?=
 =?us-ascii?Q?IuUtXxZoqyGVKNnCMVXAe88ZwhyzZOGl44MW0VdKOLUZMSU9AyCBg+2SKyhA?=
 =?us-ascii?Q?7ak4p38JGMg3V9G8oqVjV13x7JCfN4qy9ElvQpLZqiUEsIZFFHpkgQDZ3S3g?=
 =?us-ascii?Q?RLmjm2R7Ats+zbjFXZralDywu1kZ/eLWNqUrKQqat8kCVW15JBVT5Gh/CCv+?=
 =?us-ascii?Q?Zatah4hL0+PiLI8dXQ2KL9pAbDSGpq1TCFmRbDbwELKZsxnDS0H3NJBurhjK?=
 =?us-ascii?Q?2HgaeM4B6fW4IYCvUwunuPRJDWpet0IDzMPG50W4pcGk9PqlBnY4z1gIZJAC?=
 =?us-ascii?Q?15bbnKKhcL8/MMHSRVYFqCzl5sHX/YchBAYW2tV4f6Lme8iZvivygAAYQ5LK?=
 =?us-ascii?Q?NNls22xtdUvFeB+FdowySAdX5si2eMoLtBiKQ+XznVc2HkBMftLUGxCZ3Bbq?=
 =?us-ascii?Q?kHqBu2yPelvWahM1MagzsXInHQLb6BtKxj0TL6lYgOgH3ZqM2nsxY3juR2mp?=
 =?us-ascii?Q?RgkL3tT38fvirGjNnD1RlFfLD3pvCK33WT25g71R5QenLdyAh8zJAg3xBYDp?=
 =?us-ascii?Q?m7miELOQ8bCnYTeHJcVBPrhoAEjfJiQ/xM1q8vJiV3Gr7/s6EPLS2YoJ5D0I?=
 =?us-ascii?Q?u4PF5wxKWM6GsiZ1LcbL3sUSuWBhCOKN3b/dFrOM75Yl9ME3M9/Ok1EinY2r?=
 =?us-ascii?Q?YsFsGTeDm2YzS4xBSoiFvpyypZ4rPomO0FpEjCxDak8ZnzVKUJXXkIlFt7bF?=
 =?us-ascii?Q?00RpMjnpuvErG7y53vXwAcrz6C0fCM2+sT42c9SEV1VMeyojGbGl3pv8PmhN?=
 =?us-ascii?Q?v1P//2FJkAvVYFfvC8rglrRfdqlStaXnFjpyAy7s1XkG1Rj7yl664RU6jbOU?=
 =?us-ascii?Q?Hl79e5LZvENzzivWigmTQbpLI7PScB0CYKOLNooxeZPO5TCY0L3+h/p6iRGc?=
 =?us-ascii?Q?mRE1yAmJB5z6K3RPLQqJriPhPxQ9R8+NWKylkqy2BHcCo9MVBIPjv9EdDNhK?=
 =?us-ascii?Q?ceHQdKQzvkuzoSemuYV1vJKxhoBmuP2M3EtU/f4Y0UfgCvzJFItCO6MFNj+u?=
 =?us-ascii?Q?M/dg0wI2GcYN+TYRMX2aE50SjMjMo08LlLGWDxz0pHX4bMxKLoTyAjlPGLL1?=
 =?us-ascii?Q?D04RqZ7VDtUxk0SeWZHkBcW5MSkhyfQKGz4acX7ekowTlzcRnyhoS8haIeNb?=
 =?us-ascii?Q?mxnxxFfqPi3/QQhaAPj0pusbtVtcSwafegpwArXsOpKpajhLgsY+GH5IRQAb?=
 =?us-ascii?Q?psFiYo2N6aeYl4dJzv8XVipRaXKYfMy122feDNClkBNUgEbW0kPLzjtnkugd?=
 =?us-ascii?Q?XT4IZz5CuKbVoujiGu5KAZ1bzJEyxFy5CtQ18OBybZ6JTRui9Q13IHltpFjb?=
 =?us-ascii?Q?bVNIZm0QiwNpKyp4CDf5ISCy9qNwL2NIzdPjMXIH/XugyO7V+EZpAzQfYvfJ?=
 =?us-ascii?Q?1VuQx5J8Nyn13lawJtwwqrVEW+sn7/Qes8h6eKWLV0IxDMw20lnv0Jgfh5d0?=
 =?us-ascii?Q?qtetnU9M5tGYgWSnxcc2RDJMPP/vrAooow92a7w8aOZgqCNqPzzmVjfch4QX?=
 =?us-ascii?Q?bBAQphQ1pajJnwC641UnxxYqn9KxO3PwcX367NMpTIHgF7EbBZOSdEE0Typ0?=
 =?us-ascii?Q?ttNLZ5OBseQpGzcHNjpCASE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eaf15ea9-cd0a-4e87-e779-08dcb0373f51
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:30:51.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L5zjNa7vp0CuiEDjiVcA480pyT1V6a6bJPUSOSEBl2riTd2TQ7nUlxjBvDH83tMSIPLmJI/JhBz/alZwcJex5syTJI0NzLn6rOwt0U1q9DHYp4gERTmyMX4WGE96kQ7J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6494
Message-ID-Hash: FEP4VGFCZSSNPCSRTRUACKFDX7CA4TTT
X-Message-ID-Hash: FEP4VGFCZSSNPCSRTRUACKFDX7CA4TTT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEP4VGFCZSSNPCSRTRUACKFDX7CA4TTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-pcm.c has snd_soc_dpcm_stream_{lock/unlock}_irq() helper function,
but it is almost nothing help. It just makes a code complex.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index bad823718ae47..58381801e41d4 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,21 +49,9 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
-static inline void snd_soc_dpcm_stream_lock_irq(struct snd_soc_pcm_runtime *rtd,
-						int stream)
-{
-	snd_pcm_stream_lock_irq(snd_soc_dpcm_get_substream(rtd, stream));
-}
-
 #define snd_soc_dpcm_stream_lock_irqsave_nested(rtd, stream, flags) \
 	snd_pcm_stream_lock_irqsave_nested(snd_soc_dpcm_get_substream(rtd, stream), flags)
 
-static inline void snd_soc_dpcm_stream_unlock_irq(struct snd_soc_pcm_runtime *rtd,
-						  int stream)
-{
-	snd_pcm_stream_unlock_irq(snd_soc_dpcm_get_substream(rtd, stream));
-}
-
 #define snd_soc_dpcm_stream_unlock_irqrestore(rtd, stream, flags) \
 	snd_pcm_stream_unlock_irqrestore(snd_soc_dpcm_get_substream(rtd, stream), flags)
 
@@ -260,14 +248,14 @@ static void dpcm_set_fe_update_state(struct snd_soc_pcm_runtime *fe,
 	struct snd_pcm_substream *substream =
 		snd_soc_dpcm_get_substream(fe, stream);
 
-	snd_soc_dpcm_stream_lock_irq(fe, stream);
+	snd_pcm_stream_lock_irq(substream);
 	if (state == SND_SOC_DPCM_UPDATE_NO && fe->dpcm[stream].trigger_pending) {
 		dpcm_fe_dai_do_trigger(substream,
 				       fe->dpcm[stream].trigger_pending - 1);
 		fe->dpcm[stream].trigger_pending = 0;
 	}
 	fe->dpcm[stream].runtime_update = state;
-	snd_soc_dpcm_stream_unlock_irq(fe, stream);
+	snd_pcm_stream_unlock_irq(substream);
 }
 
 static void dpcm_set_be_update_state(struct snd_soc_pcm_runtime *be,
@@ -1272,10 +1260,10 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	dpcm->be = be;
 	dpcm->fe = fe;
 	dpcm->state = SND_SOC_DPCM_LINK_STATE_NEW;
-	snd_soc_dpcm_stream_lock_irq(fe, stream);
+	snd_pcm_stream_lock_irq(fe_substream);
 	list_add(&dpcm->list_be, &fe->dpcm[stream].be_clients);
 	list_add(&dpcm->list_fe, &be->dpcm[stream].fe_clients);
-	snd_soc_dpcm_stream_unlock_irq(fe, stream);
+	snd_pcm_stream_unlock_irq(fe_substream);
 
 	dev_dbg(fe->dev, "connected new DPCM %s path %s %s %s\n",
 			stream ? "capture" : "playback",  fe->dai_link->name,
@@ -1320,11 +1308,12 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_dpcm *dpcm, *d;
+	struct snd_pcm_substream *substream = snd_soc_dpcm_get_substream(fe, stream);
 	LIST_HEAD(deleted_dpcms);
 
 	snd_soc_dpcm_mutex_assert_held(fe);
 
-	snd_soc_dpcm_stream_lock_irq(fe, stream);
+	snd_pcm_stream_lock_irq(substream);
 	for_each_dpcm_be_safe(fe, stream, dpcm, d) {
 		dev_dbg(fe->dev, "ASoC: BE %s disconnect check for %s\n",
 				stream ? "capture" : "playback",
@@ -1343,7 +1332,7 @@ void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream)
 		list_del(&dpcm->list_be);
 		list_move(&dpcm->list_fe, &deleted_dpcms);
 	}
-	snd_soc_dpcm_stream_unlock_irq(fe, stream);
+	snd_pcm_stream_unlock_irq(substream);
 
 	while (!list_empty(&deleted_dpcms)) {
 		dpcm = list_first_entry(&deleted_dpcms, struct snd_soc_dpcm,
-- 
2.43.0

