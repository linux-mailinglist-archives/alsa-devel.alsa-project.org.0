Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D12940415
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:06:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88444E68;
	Tue, 30 Jul 2024 04:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88444E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305183;
	bh=ItlrmaVSF8h+bK3t8+bNA5L9DzMHT07P07mxL0DJ/Zg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uV/Wu7mKR33zhJt5/XhdI/4FJz+D/oJA+Z1Sy+CpIYSLadb7BV07y+QGJvzLZjCN0
	 xW8aK8xLzi4UcszwhLQyE0aRS1tB48OyLpHzFU5QaeyvyDmTMQJxDyzKcfouQhwBnE
	 wsi8XdGe1WR1+VlVSPGz4xVoGKPWBHzpImjggH2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2D93F80601; Tue, 30 Jul 2024 04:05:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 356E0F80610;
	Tue, 30 Jul 2024 04:05:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5226F805F5; Tue, 30 Jul 2024 04:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1867F805E0
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1867F805E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZrJkmGLc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgcLUefrIOSjKCXEGqTFoc2gkOBTy5IwiCin0Hl74igE01ND98C+jcmHVVKYWmC7JIepgDyqUeVvLemle8mZeuLvr3arwL9x30hS2vllWwgUS0SEQjmGwk7gaSECJkXj7azUm9Dv/MlRpD2qL72DUn9491j8TvkBjIMw15X1xVt1sT85gYKVzHs7uZ1H3Xsb7H6aYZUYuRVO4/SZ3lfWK74iwY+mDNZyGHPpLoy9lBHAMzQQukNwVhR/rtwSeS18akhwhuG7ROLW+usLsYqJrMiz/hpg0gZyh/fNZGh09vd5oOiS9PrU/PUotGQ2VOp2Ilj/vYdfAYxa3mLGVku60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6/2eaG+aAmbkmyPQdki408I/QkxeMaQstss7B6Nwkk=;
 b=OcIYT9COaisyfLb8LC0uPuKv81wfWylPv9sgovF3kCvrquCl70NHrt2LghzvrsRHdaoNaXx6tNpOp3N2WWOIXwRmLGB3MbIa9r4v95/nL2axAbOIekFx2DvCK1T/g1XvVcgzc2RtMeUqPyW8BBlP1vwzXESarf0NHfixbV0wZ1m102J7IrUQr3861R1f21kcVe7Pug8y7GM+SyoE0Dle1gvdPFG8mwFTPjakHQ0ZODGlt5tcu7wHR33qC0kAGQ0CukryaalrNQ8Zzk8Xx4eMmYx0iibhicr4DEdk3cy3KdD/2qYMwFYyjQ8jZ3qeCYoKp3PJpA4hqKpMd/g6jotdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6/2eaG+aAmbkmyPQdki408I/QkxeMaQstss7B6Nwkk=;
 b=ZrJkmGLc6e12FmgX96IQJL+6n/fAV/quesWUqBloSwFNQ+vA/H+oXnZq/gNapDhc/jYNWH5bbOE45glz0XX3hAQU3vqbKlZT+VO3MuGWPGVy6cGTNmAppzjpE2n+COna4eQEM4oLyal3DpfdUXsCt6HRRI91mEniIwEocypu+yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9786.jpnprd01.prod.outlook.com
 (2603:1096:604:1ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:05:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:13 +0000
Message-ID: <87sevrk52f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/12] ALSA: trace: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:12 +0000
X-ClientProxiedBy: TYAPR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa7d64d-4f09-47d1-0dcf-08dcb03c0bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WPTONLgQj27XtvuCMI9xUvtp4BBitcELhImnf5K5SjY3hXgQUWkFenbLQ8bG?=
 =?us-ascii?Q?KmHcOWo0y0tGgwCh/nl4gDaVY/iLaUFJkuaDRHKRP/yQ+6NlSAF/0vy9HnIa?=
 =?us-ascii?Q?JJgPrpXXiixG51+lc1m5e7REGzwvZ74ki/ENMq++5PwiXX17Q8nOd0fC+sQd?=
 =?us-ascii?Q?UdOXOEfJlvKou2+gO6J+5CYS8/nURBWDqFnuy3dU+m1NbUlt59oK0Ej6QxlI?=
 =?us-ascii?Q?UhK5zSTZjwjYVk6L+5ZEio1VgurYGRgygSzKpbbDY+ufkrO7Yn6V0BYm5ygB?=
 =?us-ascii?Q?IgzbpQ33CvIY4g8sdCUEyZXhbwmuCg2ZnX+YOOXRUy3Fw5zshtajyXvFOri6?=
 =?us-ascii?Q?pyDORvSKZT53tSYNtSyNboONBRFokhwRTOQXxIccz5k5+sqD5iC9a5vAcr3L?=
 =?us-ascii?Q?pmqH4duPm+3mP9ECP6Et2/Y5isqSAE4YGjBOGZynagOoWs2FHWI5WW3k1wsv?=
 =?us-ascii?Q?PEqy/4jMief85MiDgXoXg2bffPvX8Oe65MVZ6pAdcaKiUQ0tBt3zdG5OR5hh?=
 =?us-ascii?Q?2A0PYPw94CK0aWECctRLp9boSWBbRv1kfNVBqSF9Qo7BzyQjh8gE4+okopyQ?=
 =?us-ascii?Q?dFtXmdCOMmKIh9qUonmPFbFwiM0sBAAk4JD33j4ySYEx/MngSqAYMuf5uNzH?=
 =?us-ascii?Q?iABECvCtM3NNSut9f1MvWk7H2qBblaCorDbxIHbmOqkQlauGqvmtOmcrHTOo?=
 =?us-ascii?Q?97nJrCPwVWh/RzjI0GHU5juqkq3Ca5KIUZqhICkJLWZuMoe8xufszKHTR4Rg?=
 =?us-ascii?Q?JWNUMRmqoUa7DJloGL78V1yAjHwZUo6SpH70ICAqO1l3kYtc25hc0vZnTwjl?=
 =?us-ascii?Q?FrQL3Mqc1Mr8wV2mOtH60opVooW965MyeKs/UXfEqfIB+QsR+z2co4HbwwSk?=
 =?us-ascii?Q?S3+43KVY/vWjBe+n/wDgBxpGnCYon5LLEm8F7siAZqw5Ghj1imu2r1Oz5ew0?=
 =?us-ascii?Q?vSxDDJmpxCPURBHTCY3oHVbp1f/HY36oXZ54S6VtLFzfV6/1f53fQ7i6WbZl?=
 =?us-ascii?Q?Y7/WKcWOkFSryepW7Z4pd71jK2xKQ3AkMvyabemaWdx3iD4GZTFWk7pXFRMF?=
 =?us-ascii?Q?GUHV1K4lVuCq0fqS1jMeJu9DShJoBpIiBZn1Qllr8nWeXRx7A+h8zl78EDxw?=
 =?us-ascii?Q?W8PzGXT4n5G3FTQFKuTHXsqaluhYtEtGe8WQck5kW/dtmsLry7oN56k0wKTz?=
 =?us-ascii?Q?pJZust18Mw8LmVc5Lw067k+bTGj8fAbL9wR88lvyal4vCV6lE47/cOAzvoCe?=
 =?us-ascii?Q?JfN9c3E1IFRkPNtdqNuF48Klh/lPb/R94S7ejkkqWaLJJSZL8NB123IrewW2?=
 =?us-ascii?Q?CrD0L9UCf9Ruz8251pTAI88gsIh9qpDXnkJj9+525M311EaB3/KvztCDtDRt?=
 =?us-ascii?Q?/UArcnGy32rtu7jn5JbLcgEpcnVwyhPR8K5kFW0MXrGzSzad1w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LDP398mZlEsFSCvF7tjpYZKj1xhzje3YqKxHRG6M4DtNog2Sjj1GBPxkGM01?=
 =?us-ascii?Q?AfIgc9G90xDQbbaq3CqKIO+d1TuZIZW/EqgX8Tm/gLcNWJKzBe9o0uF+Ez1D?=
 =?us-ascii?Q?Y0IIKzG1xvqF4lfAWw2FkM/6qFsoq5l6htBfXR3HIJa6/O2SyoDoxeV/XzuP?=
 =?us-ascii?Q?Xj+K99rQXoaBuSSDAAo10OI2hGNi0b/U4pNeeuQMinvWvigy1P61NIMDgDU9?=
 =?us-ascii?Q?wB9CvJI+kWa/qYvWn8v1AJw/QaMM9fm80gCze6hMqprkaa55RHKXiv448EI6?=
 =?us-ascii?Q?caZP+apBwYWCE0o5p6YUEIvm/Ok3r3yShW/ZvbSTTfGziUcUJ/wT0mUwwS4b?=
 =?us-ascii?Q?P7KdOhOs7so3O/iVzzI6B/h/gDo5H9hBmLzq3R2llMl/vliZx9YLy+/rWiB/?=
 =?us-ascii?Q?mgftS03EyHtJfj0/sW81L6Cn52tliMMWBpEjIPfWWXKjGd0QLMqVGbEcO2kj?=
 =?us-ascii?Q?/eujkmfDsxtLBCJRcmP2pZ1NYAbEHkUSuMimVIP4uShFokc5Qjh3LJK2oby0?=
 =?us-ascii?Q?Ue/49pNXf8XSuWHX0rDKiD5cPUgvRnvUbRiYJUxe3AGbbalTqebEoMn1Qge3?=
 =?us-ascii?Q?LHocYvULMI2fnS92IwIdC12DwTlLix0pFanTkliMeYXvhEte/hok0MUQEgtg?=
 =?us-ascii?Q?vQShjrLURSyWZ0pyjvHp4czFRPop59s2ozKGQ3gBvvB+Nygr21T42HKjsDce?=
 =?us-ascii?Q?pQRzp09yOjOyL/bwnIVhNAevY4+avRfDOjc21OJs+Ku+9Mg2fqmXKIZUm4Vn?=
 =?us-ascii?Q?NMQeXLsp5J/nx7xT7u1B09eowWtdfyM4XQIVYZLPRQA7FvNjf0ZHfGvSr4je?=
 =?us-ascii?Q?Hps3SlJiFoLKf8Sm23e5Eqouc5/JXf+HKB6+MVhRzFlzwkRSc+jA+2GNlcNC?=
 =?us-ascii?Q?3jyNlVpg7YDioo+ZZGUMQ1QiZ2QgtJX43JcFJIP3QhHGxz+cAvKkNGuuoz0G?=
 =?us-ascii?Q?OUz6VgavoDoty7c1JlaMYKnHc7OO3htPH/Zle8hNQ7gIfJdnDFM+oOwO8O5S?=
 =?us-ascii?Q?KJA0tOLCbC5vR1umczvVnxYrFEJQPGZFeVAVW6jRUR8mTqEIXjlCXQUVuaSz?=
 =?us-ascii?Q?rs+QqB7NC43HJsjYuDGVG8C1yLM0bVU0p4z/h/8tZAa4XX4GxLRelMmUVERv?=
 =?us-ascii?Q?qG6DtBpyJNEJYaAQIaDWcUrN4zEe7rDgf9dr2XyK01m0enTzMn+GRksnv26S?=
 =?us-ascii?Q?KTI6sUFCkWLlN39cwdSnJl16ITqSOwu5OW7XH7VZ3yopYziwktHlP96S12kD?=
 =?us-ascii?Q?gmpCmbM/4+UDBi6/lJT8dMLKaYUHBMDjiZd5/ve6pGAkAQomRoWZug0o0+lN?=
 =?us-ascii?Q?Guge7Kh+3vyYYTEcS5qI8W8WL/kUY4cHQjYUBbaGyAD/2DHbVNvrLd9m9fpG?=
 =?us-ascii?Q?LQLJ25VyQ/sUl3PwBiFXnEwFj5C1SX37hdX6/qb6m+jyKPn+9xejgI3Q8/fl?=
 =?us-ascii?Q?UQPghwlhN59E4C/xQLt0f0VGYan43Iaoqt5YSeaBU0hBYEScpjMus1rUFkMa?=
 =?us-ascii?Q?B/IF84+VD03wtFpmrqa2Mc+H9qVbmmj5iTVooXTQnsQy23lK++eOOSeRRGHP?=
 =?us-ascii?Q?itY/3wgdoHCPn64bsNB88YNTnZLrctWrvS6P7lse2GWZzxSh+3AX+StVqB/L?=
 =?us-ascii?Q?EuP3U6w2EgGkDAfl7fDSImw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7aa7d64d-4f09-47d1-0dcf-08dcb03c0bef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:12.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fo5HPoyx7OWvx6JpqCTyFQHeHmaMAzItP05FKcF7VBw7Xq4L7S3Wilw7LN0FIkfTEdzlOIpEpc6Hg6JOvP5mn/nLJUkpNNMz/h0Ai1l+z30ahLfglT6bSkE/3QXEuB72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9786
Message-ID-Hash: QXATFXHGQLK4J2JKBAPZH7KGRVFODJYD
X-Message-ID-Hash: QXATFXHGQLK4J2JKBAPZH7KGRVFODJYD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXATFXHGQLK4J2JKBAPZH7KGRVFODJYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/trace/events/asoc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/trace/events/asoc.h b/include/trace/events/asoc.h
index 202fc3680c366..6696dbcc2b96d 100644
--- a/include/trace/events/asoc.h
+++ b/include/trace/events/asoc.h
@@ -8,6 +8,7 @@
 #include <linux/ktime.h>
 #include <linux/tracepoint.h>
 #include <sound/jack.h>
+#include <sound/pcm.h>
 
 #define DAPM_DIRECT "(direct)"
 #define DAPM_ARROW(dir) (((dir) == SND_SOC_DAPM_DIR_OUT) ? "->" : "<-")
@@ -212,7 +213,7 @@ TRACE_EVENT(snd_soc_dapm_connected,
 	),
 
 	TP_printk("%s: found %d paths",
-		__entry->stream ? "capture" : "playback", __entry->paths)
+		  snd_pcm_direction_name(__entry->stream), __entry->paths)
 );
 
 TRACE_EVENT(snd_soc_jack_irq,
-- 
2.43.0

