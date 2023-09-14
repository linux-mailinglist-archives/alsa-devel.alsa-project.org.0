Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7477A117F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 01:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A3D886;
	Fri, 15 Sep 2023 01:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A3D886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694733224;
	bh=fCs4o7t5s3ZZCmSUzHUO1nwgOFLTgbF5Yust9OqZMEw=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tn0NBtmyTtjTY9POgKj/Q1hYy97hfk3QJVpAsK6TGwHiN8jm5cDRf420XhOy3n0bl
	 TxtcEuMMx0477A/rP61WXwQgLltPAs4O3HfYcPfdjrgCHcmP5lM0rzJPvfTmW7m2MR
	 PSpK3jfS22o813Hcp4yGo6ujUI5cabSo2muThoxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E312F80431; Fri, 15 Sep 2023 01:12:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D80BF80246;
	Fri, 15 Sep 2023 01:12:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 279BCF80425; Fri, 15 Sep 2023 01:12:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA302F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 01:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA302F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DqtOnB6n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK1BWip7GNavDTpSpUKTl6w1hT59oNnwbrpUICY46gtUEXao5kJLRfCbeg9BKy8x8TVPLlgaPEPWTPbmiU2QihvXggozwrHTPHEakilWt5kwIM/suEj7onRIV2jrxRVugNUc2pA2ZAEv6E5UWkfwfI7rzy8aYJ0LHpQzX914IbXw4RM0BOIIEoIqwGEzm98PeATATFRKAHLy3cS7Y0Lc0gThZp+6Qz6F9ds7PncpRt3UzDvIRSU3i1VwowwVAaAJdgD7tw4/hcEDu6cAFoh4RbUpDjaONFaAP5T6T5mI7PbJM1pxS/yp9H4lZgg5zvH3ZGJ3gL3LVOnNkYshMWKIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHP6D6rucNMQwlUo+BptuXIKWUIu6T4JEMC4X2QYUt8=;
 b=lIz9O90yyypogzLlcx29Z2Y7de8YKmt9CCk+SDmoN2vlPIDXpyxTioAjdTlAUkbk0seh/P1VHsGQ1NycX2hbJ7U+7sOc6+zgBxeHZsessLh44dYoNqi9G5+htrualE6fPnvTQr2w35c933grnQ9kC0dzgOFmZawX55mB3az6PsyGf2EICplmiR7NvnChQFGa4WDQ+ihUtbxK/Q7/fDUcCLrwmQXvUSfnu58W8j3IHm9mJ2n+JQwvw99crkH3qichavg0TXTFQZqhoU4IdIlIJIx+HAFHC3f0OA220ljdquP5iK3XQxWQsWvjam4BPFnqbquae/9mQli4nLM39yNOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHP6D6rucNMQwlUo+BptuXIKWUIu6T4JEMC4X2QYUt8=;
 b=DqtOnB6nsME2k26SGFMza6qLUoJcrCx1CDxuFc4AyVrN4A7ZF9s0y9glXKzo4HEqBC3ROTiTSP8D7v8+7KfRr255WjZTNfY+ImAuj5Jb/YDPAaTXlVC4sSIa8EtZ7cSr5nbwwFPNiWgSF6Xj6hD1NmBHWJGhI3iOn+h6EIcB26E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8833.jpnprd01.prod.outlook.com (2603:1096:400:18f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 14 Sep
 2023 23:12:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.021; Thu, 14 Sep 2023
 23:12:35 +0000
Message-ID: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup() error
 handling
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Robert Hancock <robert.hancock@calian.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 Sep 2023 23:12:34 +0000
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: cbec32d3-c438-45d1-98f7-08dbb57814ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IWPmuF6pvjq0Y5yOqcMGXIu8utfv8MwB4ZKJnP+gNmVyvtXa8nBnxa7iTuedniXn+1kmUQapyoOwh1VygvB15ZGfNetsFWAcQvxztDpwKqCseM3yjB4+HSNKVeYXry71MvnddvkLaUGHlbNbT3/1CbfrJ/LCR2T5G84jARdgtWED9GLzORAAuF8iA+aLStu/STAW82hOnW7oBoRzlW31UZJmEFgfplSqKqMOeAnW9qhLaja+ny4oD+QNMHPb7xXGp02+y6GvoQpP4Ntlffm010nIIFoAKNmOVOZbtz4xmPSDMhZibeF+qAcpL4xKGsfjmukuBP2bcUSu0ZcLGd9D+yZeg5ZzWtBqHZxu5cabaW6o6HrKDcFWkYu4WtJmg5JmcNElm+Nh6eOsBpW1e/mTsu6lzvEJPVE+rsc278LGw8x0nGG0wC6Y2Vno8ICOWrB9gffL16OSHZtlsykEedq9hsHuTQe5b27MMnVpJQTIvBJp6VU9enAFrx8B+STB14Hu1ig6YdlF59izY1vMGElm4XlVmBpkgj9+oNma263MV2EkLu3mPGXdGDWf5vHnqPpBaU56lVgN5x4ck1np3ofuOVUIMJZWegUl2bPOsJbOV9Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199024)(186009)(1800799009)(36756003)(38350700002)(38100700002)(86362001)(6512007)(478600001)(966005)(2906002)(8676002)(8936002)(4326008)(41300700001)(5660300002)(52116002)(83380400001)(6486002)(6506007)(316002)(6916009)(66476007)(66556008)(66946007)(2616005)(54906003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7tA9lkJzSHRWEH3Qb7jT4uQ8bGdq3DHTjRbFpHvx8DgzhtJ9gDcshsNwKkq8?=
 =?us-ascii?Q?KR6MjNhbH54x8VuhS65psxb0MN7GJVxiCb1SRddIg1WhVWa4UoWyFBTr9fR1?=
 =?us-ascii?Q?04Nsm89uybBLtmXjh8U3NqM+vmpVpE03vVTEp6hzj6OMNlnnt4vzg54VL6NN?=
 =?us-ascii?Q?+ZBrSapniB0zFMVUlkwaVWn4UixjlJR3VmQGSd5nQt57BwCc1YGm4jDEkRPm?=
 =?us-ascii?Q?qQmhyoQddhPbRr0bsTGglKeO29kZa5OnLw6u7ZhnT2GgUgZh78XOV1TRoDdf?=
 =?us-ascii?Q?lccPDv2Bm8Yakzwk3kSP5eo+pCPcRzvRywL8Ly3zkFDAraCr0dZdsNsEDa3q?=
 =?us-ascii?Q?j0lXbP9+FbXjlSlExvRpvyGr2zinkNx+LfdVEAv4ehhmxUVNV2wAV5AVikJS?=
 =?us-ascii?Q?N8oLuATcTXQ3nhTGPS5ALGLgzxzgw7VVoxIrGurLeHGpX9WfETAmzJ474kQE?=
 =?us-ascii?Q?ZhnC/YXQUdY7NR5chfz5Z7KAcUOidml2M33CIBqL/hXc5Ilh2ETz2jwqmoz7?=
 =?us-ascii?Q?C7aeZdLTSFz5SMzBmTvfcHFmF7kYVPNMsbEEziUlahuK/7fIR8gIqcKKSBMx?=
 =?us-ascii?Q?J8qaomzPYdE+jVM+2VaOStOnUCUwh2JlW124f3XQdJVP6xB48fCSmwSYTKZJ?=
 =?us-ascii?Q?8QBgxP6bmBvMXi+pWrda7RbxPrt3yG+gzuyj4Bb8/0dZ0J0AFY+AXDzuzpxS?=
 =?us-ascii?Q?xSO+HXM4/YRHM54oWSBKUquP+AuOW7z2p3xq7EcF70YlyLYXQRme11uSHYOe?=
 =?us-ascii?Q?HtHkCQq9bAJdUQXudnn2e8kbw62/JzX5d4v7oXBqC26dVQevfCDvlDZoUVYq?=
 =?us-ascii?Q?NCJWN/DxLNZX4mhPhtFx28ucMGTGdzIWsEcE4KbtD5AylXTL3xjp0+/o3q+y?=
 =?us-ascii?Q?Q63Dsi29bvoWDcSJKJpr8BFAWDfyA+Zj3EJuwHbGmImVLwnMcHmwjkPG+NvY?=
 =?us-ascii?Q?bJEC24WEa0pptuaNUHxbhGdVIFEbFwHeSMZ8yvm/VC4rXOizKUQ03P8eshMQ?=
 =?us-ascii?Q?DoGIUJCeiUA1TxZYfEo/2qNJSxyCPucr/qtMFC9rjaPKirW8tFLTlei/kHBL?=
 =?us-ascii?Q?YPLu6JzX/IDZUPv1k4TNy5b7nnU7th//8XEFl7pvnr1sxR9n6n3yBJGC77c0?=
 =?us-ascii?Q?CXxqC2X2hUAj5VMEAwds2CnamCBQ6aHmVUbeIRnAUCG2NImngsti5bfZtak6?=
 =?us-ascii?Q?W2OxJ+abcCgWAQsx9gp32e9OUyicNoYGRv8AywzuvTU/7bkf+5KYJMq41y1S?=
 =?us-ascii?Q?r5DeherqhMIlNLgPPqvrIPFbPNRxrS7IlF2ds8N94K6MHCZxmAUyPNI2Eyyy?=
 =?us-ascii?Q?sxKsTY7J6tS/A1WpqcGeRGHJFdF70Mh/FNORJhJHwXBgn9NHiDGhLExJgK+6?=
 =?us-ascii?Q?JUA4b6oJFrKK2m3P/6LprH/lsrzU6moDtxxNluyH+Kshew84Z6Cm0aLBsX//?=
 =?us-ascii?Q?TDsRNS/wNeR3qGHDtnngzCGhBBUofwJriMfgP4ofZQZgtbaAch52tGDufA5z?=
 =?us-ascii?Q?AFkm9AH66b40Strs0nVlx2bbVNx4yGf9VOF3tJIVZ98+U0B74Kke+tXDgTba?=
 =?us-ascii?Q?c7/TYDZaRbwmfTLtQOVlBBA8O9GqOjIsplxfCxYAbYQ5FTq5mRF4c6M1R2V3?=
 =?us-ascii?Q?lQHxODJ5u2D2EvInkhEJV74=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbec32d3-c438-45d1-98f7-08dbb57814ad
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 23:12:35.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HMtcPBhoFmDJTnBpGdfdgji8I66e5p+YOfDgK0BFLDpJtVINHsmrp3dwhoXcLknICy5gwQhQF1Nxta4Vcd1CjKK5hJjJqQAL65OOzX026IvME14BEn9nt2KF7jFjUTq7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8833
Message-ID-Hash: HSE2ZFON7FSAJGJIXD7V43JQCHVWU5IW
X-Message-ID-Hash: HSE2ZFON7FSAJGJIXD7V43JQCHVWU5IW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSE2ZFON7FSAJGJIXD7V43JQCHVWU5IW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It should use "goto" instead of "return"

Fixes: 5ca2ab459817 ("ASoC: simple-card-utils: Add new system-clock-fixed flag")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/202309141205.ITZeDJxV-lkp@intel.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
I have mentioned that different point when reply,
but Dan's report was correct.

 sound/soc/generic/simple-card-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 36ce3a4343f9..348fe6f8a537 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -310,7 +310,7 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 		if (fixed_sysclk % props->mclk_fs) {
 			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
 				fixed_sysclk, props->mclk_fs);
-			return -EINVAL;
+			goto codec_err;
 		}
 		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
 			fixed_rate, fixed_rate);
-- 
2.25.1

