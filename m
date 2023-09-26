Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C18097AE5E3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99435EF3;
	Tue, 26 Sep 2023 08:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99435EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709802;
	bh=EJLITAjwAz3AJqUhDsBw2K6ODEtqMkKEXDbIzymyydQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P0nkDhojmyFXNCRRU+tEwgsyOpA2qPEX3o/SXngwyV/r2AWGQs3xip7oOoMZ8yVbj
	 2THUs8LA00zZ8UOnk4eCD5TngAtGhGYvRnmF4OYVKC+3epOpR7zOdKJOYOmzxeka4R
	 7e6hA7Ysmpx/L8udYLpGNwh9iuOKWMsX/tT5zecc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B06F8069D; Tue, 26 Sep 2023 08:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D5E2F806A3;
	Tue, 26 Sep 2023 08:24:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EFF6F80578; Tue, 26 Sep 2023 08:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD21CF80553
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD21CF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d0gorcXw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTP+vtl/tnTQ4MnkTzlUo9OZ9hsXxLYD61yWNShwLbqpvQHjbDz9Bf2J/0AggvodV9rDWQYjnwHNflEOnWOi53rzvnmOkqT2Ugw/QvXNNSnQPVKCY6vx47VRFLqVbISA2vvcP+1BDWkhf8U962VBo0aSbN16FcTahUpnZpXSTXOTNpT3r8L0PYhuQSZcaKG3pBDmpKKeT+ybPQKrgLzYhqvainReccnsDQcee7tTmd0eANvR/NPQIevNPhKXeD0BBWFssSg6IMbJIT7CT5qDcmf2G4rDlZSH+Cj0lanP6YnkDMijk/gmr9E3I1uixKMB4A60Ik/0qCRCZCvHe+K/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2iiQGbhY0n3kLizwmrGy2g/WHQXZzaNnK8gMe5he/Q=;
 b=mK86+1NCjhQaSw1ukb0z9JkX9jNob7AMufd7pJSEdTmWkOJBewkR943FQr0oa/ZJEfD83MOR6RWYg40ABlw9/fh+8EQUXANeY2MuHCrxysmQNX7mfKFkoNvUXVCPDY1Hc6pSJQUaN1JHxJPPVs8z29V67niuwNno6v2D33s3hgYO1+fxp2mPBEasUd+A/N1KhpPA6PBjLxPfSBWlyjn8N5+9Bsnpi4t+vAZH4BnjRx9wIOZeDBDj1jU50JxvjotbljEQFbzkLsNbRxS7+waNtTHRFRRxYkgPWr3BfJ4uimLGQYRejqBmP5MbtLiYpeqojhN+ARkVftASMHoTqTxGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2iiQGbhY0n3kLizwmrGy2g/WHQXZzaNnK8gMe5he/Q=;
 b=d0gorcXwU5I3oFT9G+2SGuSeFihLi9tj13vIpYt0UxAND4iVShpGfqVinkuIAORWUg3TU5W8g4EgLJlh0TlEeiNY7bLvWbHiu1KjVSK3kzPzsd++Mjf2Iq1rTKoPlKY3sdxg40svYkl8G/IV0rd1hRmd/9OYo+xe/Gi6F976oE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:52 +0000
Message-ID: <874jjhh2q1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Hal Feng <hal.feng@starfivetech.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 32/54] ASoC: starfive: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:51 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 3343e809-de34-43ec-5e25-08dbbe59270b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LKTnSUNzE+VRnSZ5nZBAx98yC1JUCgmqqqHmqsiMb7VFEeNkVSh6ablVWKP0svhyFMzM67Yt8XSF1csdaLrKKQrtQ70zL05QDUR6SSepCIy5cue+4toX6cb7rHhk430fvF5MF5LWu53hjGOuiBT92WBdTmTP/3Sp/rEP6O1ZrkOmWxBqvl+QlXqdgWm2EkLtQKkdo91Vu8fSoXsocuy6ZhMDd6dhw9blSg/H/Lvubfr3jKMwVnXXQ2W3gDTZ0mdAzXtfaR2qgjsXHLRs6FVvG7GYQyvuPqcQOZy3SP/FHZ6bNJFhmOym/SDsPsz+sqgMmI2YccJ1HaYSXV7/mGb3GxA0bq5WFxnXjKSYPmYzmTb90eEmVSyY/12cQen3GaTmVBp57sqwE+seU9IQd/822/oJR9F1QXDykVWQxZM+NkxAHHxNjvNXFBpmncPUXQKmpintXqS0lChoBnvqpQeXuFZ1e9xn9eTjOi2O9x8ykmVpXiZFcKZEV0Wz1qpjYYIYiuDzO/8RwcUD/H4YwmJTSvjcQYnab2DLXRg5vSvjn4e71Fg9hyvdCV2BmkhD4PMJQpPzykwzph93H4tVcEzo/5QQSggmT+e6XcyhuBPBGbJqpNOOFl8F7s/Cn905HQM/G+9sMrhqfPB2PonK7SItIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P2Dgv99LcQEnN6TcKloqb7mvWXZ0IPszMrF80qAZ1FcJ6Nk6DhRKegtC0OVm?=
 =?us-ascii?Q?pu2F1lakMsST9ydQHBo5ygtD9WeAjoMWcXUSitgmujWu+m1SOKtzxa4VGmBP?=
 =?us-ascii?Q?KBphPO9eHxLxf44GcE4Dk19aBEWB7ctAjiXLjmWEo37VB6ZvGtBlBn4g05eE?=
 =?us-ascii?Q?qEErwsRjmjyGoBgWHIkTZlAfUSsvOkGjLNqmSfee8rZLlcoLcbh4rALmCZeB?=
 =?us-ascii?Q?tAKPuXl86CjVBvAAp4fpgEQXeDNbrbTnU92+Y8HE80G7sOfeTr0PVJ5UycCI?=
 =?us-ascii?Q?2YNfkz0l/L1OTbH8pbVSGl/u26AhO2w/+Xj3vOU/Lcr0tc7j3a4r/HzfrFQj?=
 =?us-ascii?Q?iJSc/WDU0b2BTX4KvJ+OFn1KrPi6/Uvh57C59BEN2JmKeBzYHSbljyJW2lOd?=
 =?us-ascii?Q?70EsnVKhWsPEjfx9bjbQYaXBzB68sjIhmfDkvrs6Ll6USQ4uTesUMHoICOmZ?=
 =?us-ascii?Q?XOER9VKpl+N2shEcU+t9GzWYCtCONHjJVjIsqkdHLTQaKu+EHs75S205XzEo?=
 =?us-ascii?Q?LySvXDK/wr0m2b45DWYJlOOdBpltEZRCIkta3NChhEMAa6xwjGVovovN8zpb?=
 =?us-ascii?Q?/n1mQGWTvYR24PRCctDHxrYY34v8V82OC9hHgL/ML3WfKuGoL8KuUs6w5tcK?=
 =?us-ascii?Q?j0SmCkEz7ofJn9Ob1FUNI+Yo295gFD2WrCTSqLTwXDiEc/0kVmQ3xbk4E+dY?=
 =?us-ascii?Q?DDzXP78XJjw2cbIQ2yZo6ilhf51VyKoijyZ8+TPqvZiGRDf2hyOW2MkrgWIW?=
 =?us-ascii?Q?pSxlomEqkX1/vp19ZOCfS6HKOvKaMhVancSTie7pOg2P0IypPlOH3Pcxdk2b?=
 =?us-ascii?Q?kc1rsUTSzdBMTg8Q3UPkcpQguBB8y6Rn9R02+8MLOEDmpmP44QRccJc1SEyP?=
 =?us-ascii?Q?c1houkarDMvg1k6LDvqWNOtHKXG8teOG/f5w6X/4G0dXbX7u3NRtZfrcOLzp?=
 =?us-ascii?Q?qg9Gk0yApq8rNv3YGx+vUH03/e29nzjheRn1wNrWyvO4uQS07DZ4wpWJNxrf?=
 =?us-ascii?Q?qOFMEVTo9Dsfgl7lhgV7AxVA1g/wBQwzAjlEz3UhwJoil9bquR0t4r9Sy7xY?=
 =?us-ascii?Q?bZBncCYvoIDfS13tkjrgh4UhqcseEsxcvFESXdiujGdxxXnW22n0brzXMQgI?=
 =?us-ascii?Q?0Y1WF3ekQdvEvonOIhdIsmATNOPgld6Obkvl276tgJSuNOvZq38jmgBfV40L?=
 =?us-ascii?Q?O8udC8NpIx93522Yzwdbf7fk/YXSFK6L2eKr6ZGIMR8niAVzuOWOS099mcLh?=
 =?us-ascii?Q?aq/hw3MuK4tmezL2Glgdx2Hdjkx+gljdvV9Vms+Cl8IGx3mcpNXoLt8KjIMT?=
 =?us-ascii?Q?E/wyXa3cjQC6C2fwC065/Q5V8yMkBTImXyJ4mdw1gH/IrthATsqqJ/oxgN+y?=
 =?us-ascii?Q?3e76qCK1qL/Rj0Gfpy6PIQEzYvwGSjToUrPzYxSuXHfdXxtx+QqUZBpXo1BD?=
 =?us-ascii?Q?Y5YyctZCl5dI5LU3JgrMmlkH4KHgZW51KwMO5t8ivWhsn/guDfFrQZ18Owp1?=
 =?us-ascii?Q?XQu5V4os2N6KkaMS1cD/3Py5pqMvkQIGsLhH1KkBAFVF0JeBGV0CnQjnpOi+?=
 =?us-ascii?Q?YXKac4BtDNanSqxN+qJDdSmXWFPDUIKBL2b9jpJd52oGh/++9tGFXB9mAcyN?=
 =?us-ascii?Q?Ue+HlTSHXo7YD0H/FDCHUYg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3343e809-de34-43ec-5e25-08dbbe59270b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:52.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tXMHson6lYzHpDfstXOMaUnu+w5exwcqfCQ/owWhx7+s3AEj2EJYhUPkny86uptBvy95f6A8C9in4CalJUIdcriJLurWEByiqRcf4QD8JcuiyqUPb+YF6Fwv+XO5lvn5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: 35EKGO5KSHT4F5K23K6RWVZ4J4TPIP4F
X-Message-ID-Hash: 35EKGO5KSHT4F5K23K6RWVZ4J4TPIP4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35EKGO5KSHT4F5K23K6RWVZ4J4TPIP4F/>
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
 sound/soc/starfive/jh7110_pwmdac.c | 2 +-
 sound/soc/starfive/jh7110_tdm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/starfive/jh7110_pwmdac.c b/sound/soc/starfive/jh7110_pwmdac.c
index 391544fe8568..65ee3e339494 100644
--- a/sound/soc/starfive/jh7110_pwmdac.c
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -213,7 +213,7 @@ static void jh7110_pwmdac_stop(struct jh7110_pwmdac_dev *dev)
 static int jh7110_pwmdac_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
 	dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 8c117794b028..1e0ff6720747 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -325,7 +325,7 @@ static const struct snd_soc_component_driver jh7110_tdm_component = {
 static int jh7110_tdm_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
 	dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
-- 
2.25.1

