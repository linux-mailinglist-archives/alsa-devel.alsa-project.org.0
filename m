Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8567AE605
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394BBE97;
	Tue, 26 Sep 2023 08:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394BBE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710109;
	bh=FdpCWL+im6TX/sY4XQqTF86K2uZVHiqJh9vFjvdf20Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZcnOrLCgSVY9RrYwPYU4AAyjQ4TK1eDJeVxtbwUP3ut0f+hlvVgMef21IQf1nHxcd
	 8Y6vndJJtsJxn12KdClAPLgW2BNYhoI9HoRdD6FLo5w6jgRr8/0nt6oEK5wt77obuX
	 +W8xjV3kCfe9bGuYtRT18ssfMNUxA4jx5VBOqWN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2659CF8061F; Tue, 26 Sep 2023 08:26:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C87AF80730;
	Tue, 26 Sep 2023 08:26:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D72F80733; Tue, 26 Sep 2023 08:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0062F8060E
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0062F8060E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Q4lnU1uo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pd7KGtYobmRChW3XFr1+YV09xnPKkkDQjJRiT9bAsFpxU7UMwhYpSMXIu3v+iQonW/gLn7CmgF2T8KwU4Nh6oajp2G3ahOAyFka6ceMmyOX1Rwffa/5ufZ1IYmi6XJbwEZ62d152ir4au+9pCxcwhJ6Pj1n9Fazeg2OVGSj8nDHwM3sRiOmWbrwinFzfV1wVQGta6a7nWCX0MnL1JnG+D4cuRHJdmYIGMXGaCIlHazzkLPVlvqVhqvvg2zw2oUhO3CAHYF+V6CTU91oJMBnah3s1X6TeCVS4EUidxMcu3o24ZVDMsYhc5Mbm96fk9Qz5+IwseVu2ySFD/xlmy9O/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jClkt+zHhFQCVSwQfYD4pvEeTztv9ljh6OECMrx8P58=;
 b=fsrJH+eC2gcWGCe6RpNNTaKUbZj64s3a50l5/x7KJfi3mp5KGRqgkoY/behOL+Ozn3i1iS5Nv4en4KmhdzaoHrERp5ZwYiLc0mLm+MvfTbUxupzPI2V8GQVQXPU4Cys63tuN0I+NMSl5DFETIhtqxXRwXvLnc9vBRJRObEmf/SePfOL8T18ewU7sfdUauExI7dJQ+roAy8O0kWYw+WvbX6yETe9Q3Dn8Y7BWv2+ZaICPQ0EsXmER3rJOen9RS/PXiUDoxGzyza6DVohYZwFFzkoEHSrKbXDRsp1BdP1yGPmK/xW8GCCnIRbMt7NWoHOLGoQACT9GVvaAJ9f3XF+S8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jClkt+zHhFQCVSwQfYD4pvEeTztv9ljh6OECMrx8P58=;
 b=Q4lnU1uoZnv5PDUSWgCLCnQccuV+6JVHsuVbUALM/aghh93g97N0VcmnZTbIVzuKs4HbFg5aBWGjG6EKaYKu4U9IPB93C4wAbsJQDF9I3RDw8/6BuJzEVHYKyO1kVmV1reekmf0LQd65ie81rX2AsXYJVmWbReh0c7ax3KNGfkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:35 +0000
Message-ID: <87fs31fo11.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 49/54] ASoC: soc-utils: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:34 +0000
X-ClientProxiedBy: TYCP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 470397d9-a835-4a97-ed16-08dbbe598835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wj3sK5krCPdBHjw9LRbT8K4QOkILQhBVYeWDPy3u0Df/W6+UckW/3cCrbd08h95mK0vO4i2ui28bbZl6aWqKkZgHPq7p0V1eiCtlokCpfBreKSwoZCxi5caMEsEEIc/HwQf2FQT0XOSPfEw69Mv+egRXbVv1dC+TLMmvduRoZK4hdQpAgg9T9KCgTev4Vv9tgpxtLeezo3ehu9hESPdczhAClaltv648FzXhGRLsgTyHnOWdzxXuRMm7Qm7YlByICwyEUuMP0KRtEg4hGa4I4zX6+Qjsc6UdQL0m3lWIxzNEBnUckPNz0EZ6hupiLo+PjO3ZI+ewt13zonHe35wRki8Tdiu7tQkbHq37Ist7G+abJENSB2xLHvfkkxzkPKy832pFupAcSDsKnHi/Kk+BFHGQzPxqcWCbgz33vEzqkPw59tuNWR7OjdGuBmgvje3zcfOVGqiPijGhYV0fy73VtbvAol5eKTh51LXdaLDBbWLEf5swK3gb1iXfmjLH+WEdYxI6LjAqRHRLMsOgA2/dGmpqIKJViZHbI76RB01SsFFxfCsBLEnYYp6+00RRYz3W4Zn5iP/UiXrafIX1dqKNYn8tc/gz0F5u+qC9cO3xxPNOhqx8ieJ+ljbJCw0GofxocNA9bLp7sX/fJ0ts/MRgpA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(4744005)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cELCToblYw2PV5nj7zccLyQ+aC2js7MC3k9D9sjr5Z+nRzbHMiClvWPlPZ3T?=
 =?us-ascii?Q?qmX+1rFTlbFITJSQhLqqLSnkyXbAUSrBiYSEayjqtQwIzrJZUwdZ4hrO6b/9?=
 =?us-ascii?Q?0rXaedBtpo4vKXd5KLZZLoY1Rgu31qvNUA2VFewWAs0Ud5a9HMRrpXo7ZWhS?=
 =?us-ascii?Q?14rIsO/XOX18dmcM7td/WowmlI/7SaYHf/m56zkrtklKGOdnRth5dBzeWD2z?=
 =?us-ascii?Q?XQq7wVtyS20d4NxhIfRxpJ0SQex2XUktRn1KZZOnTH87oUK9g/7B76UweUPv?=
 =?us-ascii?Q?aTrVdJ5rsrC89Y9+Mhcu6HB6d3Y9fRr4k68nfvPfli+8iGX7gUMnTupKwQdz?=
 =?us-ascii?Q?yxALUP8nO++udeUJkmRZA4DCXPUtNEzi3pKf3BzDHN6MZFsBOZu3q67b5L+l?=
 =?us-ascii?Q?FiYxEgHBI2DcQCPN/Lm1nX864BktL8gzODvyQHoQ2SJAeQBN6HJRQ9I8mKnk?=
 =?us-ascii?Q?aNci/RtlErB+ATG7cp0kU8i0R2ubOBDgcq8pBaJowiQoTpFIJhlbFulHVfqS?=
 =?us-ascii?Q?NQAMfeFf6GrHkHEp9SNwm/ALxbjssg0U/EPpdpuDEWK/gbvUAdYuexRAaj+d?=
 =?us-ascii?Q?V641f8k+dzr7x/nfTr7t9/c1QBbApz/4lKCp+RnHPyVV852QT3ezUA2Grgus?=
 =?us-ascii?Q?0yPLqTJX6AtUWCcuf9FUEY0K1gbWhPQ/121BflCAiQN+HA8KLUQVtwI9Hggh?=
 =?us-ascii?Q?PKW/vGWnfVP1uyOk3e47Fb61EXGKq7X1XuQI8Nt/WpYdoxv7Mkq1ukI0CQR2?=
 =?us-ascii?Q?tIg0cR+O3McM0E+iRJbPSa79IpQU/314vWTzG9o/7XL2LFeYwKqhMwwyJQ/v?=
 =?us-ascii?Q?y5/pJFpVaLKJOv/6a/HATg4WLFWVMnznnKaXxij3UdPie61Ossm8saJdEIF3?=
 =?us-ascii?Q?DmJ4dv33hTpcpR3VQqxQc9QpxXYo64y+45atwW0pchnb6AJ8LBwEN7eyFlnd?=
 =?us-ascii?Q?9zQ6MsaQiatXnmWehHS81TiEDNKAc2d0LZtMCitmkRWEIdvfoyiwsTVyEV92?=
 =?us-ascii?Q?ZO8sAjj0DariRiwNCri+FaMMFsRlxJG+8Fd9bsvodZcT0Md+d/MEZOUfxQor?=
 =?us-ascii?Q?ONXez5Iv0WOTxA1pOmZm7+BES1zS5u3/WX72Ts8R6yqSP7i4xxxB7cXIYAsS?=
 =?us-ascii?Q?/6AgnUW5eYYXVRip543/78nPkHGidpX3RaZRzdZ5dGWhWo3Gn6r5KRpX3rr+?=
 =?us-ascii?Q?TruWdPwsrFgYh55MWyVd/CEywbCzluJCpYpDgzleX7nh/T1Emd2YHg2YCceE?=
 =?us-ascii?Q?hFTm5TDLCrB7bdnemm7HuLwonMeh26PAVMXcJVy5ch0w7QtJV4YjDgM/R768?=
 =?us-ascii?Q?c4jtWLb0aTreZqpGNDex6OjSMdaPnO6KSUMNt99X3wm0W8jcS7EyFFrwaQdG?=
 =?us-ascii?Q?43IiK+MWObkbWMNhClw82qrjoncsGi+752uxgtCSwh+g0P6WcxiAvK1XnoCi?=
 =?us-ascii?Q?0SqKofQ3H411VJNHVWVX/37vIAhqKfm+ofizip/OHjLh2UzR99v+GXoWPmMK?=
 =?us-ascii?Q?7BRA8OLDf1/iejf4XtdUPpbEiqfmHaVVaDRX+QdgrbRYMZSClxV7vEn2yZUw?=
 =?us-ascii?Q?KAbZpXdKmfZG2iEgymx2btx21adnjEXqXiX7sYMBSoSc3JWuk0rf0lVkkcyI?=
 =?us-ascii?Q?PBdLSJRe6cx5GxjuDDzqjIU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 470397d9-a835-4a97-ed16-08dbbe598835
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:35.0490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qljeb4DNiDC+pzcKEPVjjwISH8mx/JP8+yBgaSG4eyda4HWcjfbgTzfHUzBRpPI6M/YpXL32Ue2jzwrNjsoFULZpx+yoyytfL1ZUxWrx9jsXGPsdU/nF+YGM26ibhN9y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: 5KYE2CUOIN2B3XTZMBICOUJ3NVX4JAC3
X-Message-ID-Hash: 5KYE2CUOIN2B3XTZMBICOUJ3NVX4JAC3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KYE2CUOIN2B3XTZMBICOUJ3NVX4JAC3/>
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
 sound/soc/soc-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 941ba0639a4e..d05e712c9518 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -115,7 +115,7 @@ static const struct snd_soc_component_driver dummy_platform;
 static int dummy_dma_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int i;
 
 	/*
-- 
2.25.1

