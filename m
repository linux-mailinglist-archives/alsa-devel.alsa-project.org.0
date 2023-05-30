Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32C7152A9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60858847;
	Tue, 30 May 2023 02:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60858847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407911;
	bh=jVO+YGsbwRnAzy9jREUYpNMZuswwebg6ihl8fGfpDtQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gNpHD0OQiXtVZ1eSYKVK6WZHeefBpJSAYBoJqhPojV4qTo1+sGMZj8ZHvIsM7JeTg
	 NtRJenjTYUhGByjMT+eydB7WtOyuEJCZDiaqwQ7tzHNN853KPz7jolB6QD1pTIeAkB
	 PdSVc2imGyjg2jq/2RlgqVpy00NvdQc2MsNIahX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC50FF80587; Tue, 30 May 2023 02:50:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C850F80570;
	Tue, 30 May 2023 02:50:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E35FF80564; Tue, 30 May 2023 02:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61854F804FC
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61854F804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QkvyvgDw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edWYGJkSHo+6XZgftKw9SFOlZ2Y0PWpT+/Kpd6Ay+fnu2bB5kj1x5feZxPGFY8jtmNBzLobKdWSdZLcezYo4rE3Sg29S0DqVXEAqnnyO2/ZiqcLVBSczIV+NFwac/zuLhOk1dX+vQcD/Cfg4K9eayFIJvxahPZVcS5CiUDMQnjIphRc95ZnTeVeWHBOylCry8T8WkLu2iYlAgmak8/s4rMu/sb1y0Hve9DiPmukPJOMyKlv+QQsZZwd78qrQD9WMZOBctq6bV8YKd8CX3CUkxbRU6WnOD3PB7HpJ6j8Iz0fdyJGu74DuBiZDItz7jSHC6ppqyY1aXeB5//6/7BHMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmQ6mb3JrwoxbGRKGzZ43ikrzMM7iiARHn29Pvf66OE=;
 b=ROnke0K+C3D4w1/JubTrpIVWzg7T3C/b+/lJ7Xh/ob5rJYHlvzqIGm66XGdOagLRJvkYK3/FmNXOaSzKG9Vu+LpUyzJ2dwBTyjmn5sInzJiGZS9ukX5/7DDd4dogjVPbjfVbfuR+eF1vN1EMkaQXWmyKIOQnqFMBb5iJmfpDX8RB29lyj8SJc7T5XT1+fVs71yiT5z17cnHX1HA7qmAdWpC1LW21z/fmplyR5QRbPvRSK32G/5X2un3D0CnJsi/YCmcmRIguLwOzvtSlymf8lnVuFRIfBA/OPCNAs30dU9ZQ14MCZRbhQl1dhQHaQ9V9jwUXZTBf1FM0TRpYogWR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmQ6mb3JrwoxbGRKGzZ43ikrzMM7iiARHn29Pvf66OE=;
 b=QkvyvgDwfoQ5oYtg9e57ZbL/PhY3W2VxKsa1GMQEzYhU8w0e2yo52DRYYnGA5vtCaNbJgl5Z6NzpSNzb4lHNTK2HCLiNcpwuNY7ISgsypGNp+p2zmw9E7veyjX8FK/MSnctuNi54cUBBERFvp4Wse+AbKTY+s7XYqvhPuSASBtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11502.jpnprd01.prod.outlook.com (2603:1096:604:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:49:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:49:56 +0000
Message-ID: <87v8gazlqk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 May 2023 00:49:56 +0000
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c592c3-580c-4686-ac22-08db60a7c9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0Iw/CtopfgrlXq5Vrk22Zh4iXC7tH3UjGMS5V7tazQBy9XMT4Pe6sCcWciVrQMIBZrUA5kw0otr8OeAIAU3C0NKYKtX5uafUjsCxxvulyqEX6F8dQxiY+OprXXuUEP/gv84qXyvmjYH15ope66hsliHU3/IgNdNZeONzH6QHDpX2TKCiltIb3caIgZo8okrbR7upADkU5bc8C1QDC/8tG0W3+gW5a767W6nxDAFolPPcWnvbaerMngU6WW1QEqzxU2Lk+2N8DUk0Evdu62WtemwRIA5tNStTeubhXieA4zrI+YVwxyOTz/aa3vG/wxiyF5tARSsSaf0mosUo6kU1wmiWU4o94HzTjUREovf4iLrC8dQuiK3IxmkOr0LnaEsJyy99/8CUl4oVrNP8z4hFNzRXXPdXwkq8ImcYBhV+jhUnCwZ0RRKrBdLIeVf54u6v9+ZsMVLDXiIDPDIbYtogSy+szRY2M2ZDo/F9YlBwdzJDTINt1dzdJs/JtpZ2M9csF1m8MCJbFFtt6bYbFJNQTYLq3CxjUoaYwJxj6HP7/l5fKmDzhT0WHhwXAUvYpWV25gNH39C987vG+O6ioTA6otFnjZ25dBqXXTgWW/zRxtqQ4b/3fcBCIzE+vKobzsI9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(26005)(6512007)(6486002)(52116002)(478600001)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?e8Cy90ZrFzuX83G2vlDADCjbLq431Ztv1SOADAFHfvgw45QrHc4ospeZ8b?=
 =?iso-8859-2?Q?EISKnPzkyDCf+eUMRxZieMI4zQUexwVSy4He0zB2mzcVOSbQ9iRTK1qS1h?=
 =?iso-8859-2?Q?UbV5JLaR/DFTM7cGmxiJJ/Z7QkGzmqSDOv2uk1Xy+iTznIyeUq4eZIBMIC?=
 =?iso-8859-2?Q?0D6WGwBue4VvExIqYced5Z1R2SI/Zugfa0zzJXY0Gs8JKAXyQrSXXvFdWc?=
 =?iso-8859-2?Q?I7va1UcoQ+7akIuZ1I439W+58+XOCelfOpIynk+/ZvE3Aw+C5p8fKNFni1?=
 =?iso-8859-2?Q?3bBYQYrKdBi96NMgcINqm/U1CB/xWlgGbj/HpO7Z1O+JrG8jmmtQe4A/w2?=
 =?iso-8859-2?Q?M0FwffAY7hhf9UHz96kQL0oooldH2K9zBXmKLhdvUj6YE9gKbQRoveDBWZ?=
 =?iso-8859-2?Q?7ofQrrrNTUHn8ZaH8UeBmWc/grfS9tcK8KM/A7UrZkJSuyLCHBH+6ABLmf?=
 =?iso-8859-2?Q?biiC4l9Bl6I6HySqxN8wwt6wRatZwrJ0pNGWtVDuh02RN+68mQ4YvhwXcC?=
 =?iso-8859-2?Q?Ht6IafGgwcPe65XCs+8Qk7dFapWiYNYyAYD7n3Xnw0Vnly/LYLr9LkIb7k?=
 =?iso-8859-2?Q?t1QZKGZQ4iN3aW8TDyu7iXOao7ytbwX3I3O3aKqH85vUewYmS0UyqjbUtr?=
 =?iso-8859-2?Q?nh3gxvLmduuTGGB6whZSzESghG2PW0iKrl6KhmMcew/jBjTE8U0v4NvejY?=
 =?iso-8859-2?Q?VUdRvES8EoZteal7A7nWri6tWRHfEj1Bs4Z5bNQCzdUVQnVvQpxLfhsWVH?=
 =?iso-8859-2?Q?0PhTrD7OZVSmbhWKx6maNXqEEEtgbZYA53cmYjTL+C9bNQkxcEwrKtekZ2?=
 =?iso-8859-2?Q?fF5/c3LWgkIXX8br5gol/ZkGSt4C6/l5fuLE9inic5czqEkuoMmckddBUG?=
 =?iso-8859-2?Q?D8cvAx4qrCBRrUPqvB7RxyA6v54ip/QfAYqT4KDIOzCO/qW6GWXJknIniy?=
 =?iso-8859-2?Q?nnmkVLXLBamXYp9VaBkhUyqH3O/F7QAWFiKKK7GwNlQNcgToxw+2IaJWJ9?=
 =?iso-8859-2?Q?npihllrHkQCW7zegIRB4yFAU56w4NicxAKE9JL1WcF5fIdyw7k0loiUOSZ?=
 =?iso-8859-2?Q?+TB5mCCNbsdMgPuxXcsmTqZxnPCSrZ7O3zKW3yLD7PCPc2M+wt2kKh8PMV?=
 =?iso-8859-2?Q?Uct1kVTtH0KevhG66GXl6ZGq69Y9pwRwA8fN+pUmfyj0Ilrwzfg9X24fvX?=
 =?iso-8859-2?Q?R+2MPUzA/XWDYWhwdtq2BWTqXF8OolNBkmt4GNpV5EFXBQiNrnxc+FyDJc?=
 =?iso-8859-2?Q?ok+ze9qybokgtmmDcz1UnmJMenIMuHRBin/NTlSxYMRcBv+MSDw0GaOM9m?=
 =?iso-8859-2?Q?qENmDgKIwAqmQDEroy//C+ekegQ+q0pDmR3cM4aGHiAV0stbOKw86P8bkl?=
 =?iso-8859-2?Q?RRai9nWxFT65g8RYWz79/uDzqCwUDzre72vWB+SmhSRRTIE7mEWD4SPEr0?=
 =?iso-8859-2?Q?3ZJO6Yib+YVsQRor4hLfoAA/Iq5BIkRfrP72/sHfI7N9NGOlcsTh48lLLb?=
 =?iso-8859-2?Q?kynqBOrW/V3SpioyHMaEnXk+WVDFzTNthHRk6lgwmSaFh/A0rXzKTgliGS?=
 =?iso-8859-2?Q?GqETUqznNgY+6zUugSsRejagtJ/n24ex8RxA7FThhvjBQV8VaO+T9O6ops?=
 =?iso-8859-2?Q?GE7Qf+T5PBP1z19cxkwPxEPgQeld9JxkiYzpeZsCEQ9ILkffMzVyaztmnH?=
 =?iso-8859-2?Q?g5fhvKY/WQk1khLBs0I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48c592c3-580c-4686-ac22-08db60a7c9b9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:49:56.4551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fX7K7DNOzr1ORmCAhwj8yS8aUENI75JCjBBrbiGEw10fVNStfhS7okFttxFMLNPnksrIYsiMQp4q4mAvC/JbdpwzBWAcQAGgyq860RjlwoMhhdRfGJppV9+dx+lB6XIl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11502
Message-ID-Hash: 5BGHVZUPI3NRNDRU3YZOWJOBTUGM5SXS
X-Message-ID-Hash: 5BGHVZUPI3NRNDRU3YZOWJOBTUGM5SXS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BGHVZUPI3NRNDRU3YZOWJOBTUGM5SXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) checks dai_link status, and indicate error
if it was not matching (B).

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic && dai_link->num_cpus > 1) {
 |			dev_err(rtd->dev,
(B)				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 |			return -EINVAL;
 v		}
		...
	}

We can use 100 char for 1 line today. This patch cleanup error code line.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index db3fbe1af2ce..47da3be0ff46 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2736,8 +2736,7 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 	int i;
=20
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
-		dev_err(rtd->dev,
-			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
+		dev_err(rtd->dev, "DPCM doesn't support Multi CPU for Front-Ends yet\n")=
;
 		return -EINVAL;
 	}
=20
--=20
2.25.1

