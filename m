Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12276C1AC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8477D14E;
	Wed,  2 Aug 2023 02:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8477D14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937660;
	bh=zvABlKNkKAn+3GkNQt79enRKY8aiXPBueZlkaF1xPaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LPtd0OsL3aTuO1ALOwo1bTNoBsYaeYKl3hzWiBwKj4GLMj2Kc3s2llFkIOxXOYwgC
	 pJVPVMNaPG+MZKJgrMHVZpt6PScgUKOSOGLoe8JrgUhP98+L2jBj4altA/oQ2vtxLQ
	 3YaNDsA1hxPjEFEfP6hVDxKVOyMt9vpVMFvBIEKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1B5CF8053B; Wed,  2 Aug 2023 02:52:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFEAF8055C;
	Wed,  2 Aug 2023 02:52:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE46CF80563; Wed,  2 Aug 2023 02:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AACAF80557
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AACAF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lqPEgKro
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfJfD3x/cmetHldgpYR4ARy3E/SvU74pZBVcEDNDU3eo/GUupdW7roYtmhhuWJp+NuYfmW8mIDf3XnByCYXwQrJQe/1ytNiI8LKWa4koPK2eQZ1mnPuFbIGprNIR2eAM1fvbjuCwKrpAvNdaOxuTwMb18sdKCmpT6n5K0GOPYB8q2tq+68nsXb3MilxW72JzsEu0O+sCd4RKkYg++j6x5pTYfFiJugtZVVQFwFF/fvydAQuYK19BRiXQQJpJ7kpysuCA6vYfjRWmQuayNh0ECSExuAwz9k2HKO+fp7bSHLK3HqJvEII4kh8H6DpWh7lZ+v1kcGGSewhiMk6Kxmzalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0c7lHnGvCfbI0XLzeoMVI8lCSHBAr8nJg5RdCsRmdjY=;
 b=LqkutpVL13YD0QTLiBJmSZ9+Zpov1v9Cs0uwixN4l+E0MIgNKW4pAeZFJg9pnoq8sIdPV5OIV20XLLQABYECX2KGXDCW0Fs2nElyfksfRKAm8VTe7rKh/seFC118/S0o4MiRUiwbIkvJX11ZuFidOoHLY8iOyy1cjwzy7GNRVPR2YaUjPyOAUbVeIgDTEasRJz/ETsYTa2DTQJTTJeNT9vmN2LHU2qD1S/W3oIGTpmYhknyDG9VViS6nafb4E/hEE0Mbn8OuVQQHF0sw8bgGFnnu+sY/D31H5+sy/s8rt9ljXbXQ4nb696FGFPl5J0r5EYqcYHZAVovn2E2tHnhgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0c7lHnGvCfbI0XLzeoMVI8lCSHBAr8nJg5RdCsRmdjY=;
 b=lqPEgKroPEMrSYn/LIyPmHngJio1hGeDpJErv19z+5dxd6qHPxEaiLP1dX6m6V6ZyHITPPSg2QLoTHKvoLJil1mbtz/p+mFbOjZ4ppcFUjk7Lr/yxHmQmmUoYjIuF7nA1xaGzYfjMj4mp7QJV7oxdtKYtZhsenND5hbJsUlpcNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:52:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:52:38 +0000
Message-ID: <875y5yuuy2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Uwe" <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/38] ASoC: adi: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:52:38 +0000
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4014af-8e4e-4cb7-9950-08db92f2c4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XQscpUFtco7Ii0HlHCqlgX4S0aPbLO60EF7P8kg7I6wmvt7hfTCeUuXjr5Lx0zE/0T8D0DJm68POw1WsWWHnxii9oGWPmll8TZVgggFs6Fw5bRWwdEkpFy0PVrq9ZygQ2Z47JBsD+3b/Peq4dlWbhyRDBRHojn8pAc/ZSAuF07Nx+VGHZWWUZM/TUqTzj9JrH5ykcGKRdwi917rmtjujBeE2kxpi30+ZmyW/vyn4xNmlDd9J1tUnK6K+UL0kvVW93EqxhOjlhQUXX9FPWh2mzCkGIQDVhpBMwjvPfcXBlB/cNXZk8qtBLhmlOZnfUl553Ca9nA9ySbpB8GBUEZZsFrltWhNQrxJnIy1A6mMEgN5RzwS+/r2muff+9ldqWxagtadCjVvzBAJ3rVX3vaj+Zp3hSfqVT1V7IkyI3YZtXZ+eB5Fd4HWPWEhYFKeEM89JuEF75cPOMSgCPq1CcRmXQwgYwzUL91cdhkMsIu7CEzK1P0HxPPSCJiI7Y//lPbeWF4YGQ0dMXbrCnUiCMjyWBpTvfe2A043IMG/6T8heB7bjB179LptJcOzfZeKUsCBuDdxIjIxmAPIONkiEPgKica+MbBxA2dSw85EL/A5xtiG4mEQOljsXAjCmMePEbSFf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(4744005)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hZNVZqdnvbrPuJhiWQqaEy9wuHK+e6QzRJoh48bwk6cEyRaeZUBhP4KCDKFw?=
 =?us-ascii?Q?3ku8fJGJeUxQb09rpeL1kvaCss1tCg0oO/2LoND/O/G4B3qv4LmZ8H+irnLi?=
 =?us-ascii?Q?ew3th6BQkzPWZRwH2x19J0JMG7jEl23Ki8pA6KK17ruy+ShZGP9K/dVlWqyh?=
 =?us-ascii?Q?OhNQhhJfsj+mrc1AYwkaTU7X26PJ4849xnftvgRnQwZ48Kv+WT60MM0vv3Af?=
 =?us-ascii?Q?UtjJ4V6KzASYZ3WIL3rQkZy6t+MoG2Es4YCJwMIUJ48W+RPlSnTsUeX0vAdV?=
 =?us-ascii?Q?V4ujedkYG2xvLyFPO0VPq4K0jjhHDMiCOQoiLRAqNNiyd3JbaqqdHx9P5PKl?=
 =?us-ascii?Q?tsUrhoR8sYREHX9ax2YbGau/eyii2/20jInrfEaqU3JLhb9BgQH/YluoDDS1?=
 =?us-ascii?Q?Y/cLv7xCNrcLGvasrU7EYGD6xsenCFVQZDXPyUfe6fQzqysK6le5zNhFaj1M?=
 =?us-ascii?Q?rZ8A4r4kgrmDr4Vj7BKJGOMZ/IY0EDe6W1FyLb8XCdlSdOS0UxxLQqrZSG0S?=
 =?us-ascii?Q?No5dAJuDLlfTkx941jcP7CedNakRfCtAQ8YWPae2WBGBmZK+MrIAbRrekLem?=
 =?us-ascii?Q?1QX+iNnSEaHn776593CRQz5EpCXIvsAH695VfpzhVYz61rdlZFipyAg/kuwh?=
 =?us-ascii?Q?aeJSNu8ZujBaDhJk/5cv65Gp5o/Alj+aVwVwnWL6WURwUWtYtT6ySbQ2xKDx?=
 =?us-ascii?Q?5+QyaO0adgHgQNnHcPHOk13S8934tKgqtJdEBhbolOFAYwg9zMu2KwUIicV/?=
 =?us-ascii?Q?znHFUk6lOpEkElLQCqxkjF53AUORdPoH1otYI5wObCGXq6+mVHJRVuoH4EEw?=
 =?us-ascii?Q?HbJihNXqNR1tfBkUG6e/UQOmnWe7ksH2rDoZfPF1aG3wbfFx5S/yb1Yr1D8a?=
 =?us-ascii?Q?aTC9d5v9cYHlsnq+2KoYuaY6DZIifvkngkiwiCSMOWx7f+RfVV2nNRk5M5Ib?=
 =?us-ascii?Q?U3UREU6h5LkWC2QzKmWH/gCXbE6inJWjMIua2cjqlPB5/sDj8Y5Xjo4RhQIe?=
 =?us-ascii?Q?Xf2tQAzjePuuid0G8xIxAk5ys3suCFJUREfGR1UuINxKppbr7lPOOz6mE7In?=
 =?us-ascii?Q?ltnSW11LsN8bOKOhmKg55SZpfjCVHSJuo1Vcsb1uiFNvxcvJKmkkfZUeXn2B?=
 =?us-ascii?Q?kJlB8GM1bQXh53++F+zqH5sZhvxvA5opLKaLo1sEiutxQjiVVP7ark20yXh3?=
 =?us-ascii?Q?uQBArCUTuFLxO7T1tUPxiTCMMU9mR/SbKM82zxpTtvALc1+CQgn5BNgB46Uw?=
 =?us-ascii?Q?63FWy3rUSMRfaEzWuuvjr3Wulcmh9bSx6F3iivdaHU99HhUxb9PKs+qCOUCm?=
 =?us-ascii?Q?DirSY+vdVw2EyZWKiQRrtfslJ/1Lr/jqg8TWPaSYX+gV9HzYEwCG7zNQGRoO?=
 =?us-ascii?Q?9IMDKgUNKJiGDNqLvZOpbo1VMOnDlvxLMiBf+8cXEkogv2eL5hA+c+f9mglH?=
 =?us-ascii?Q?BX4DgQExfvFN4XluJGUOuFYQ+3L+WDMEHLHUa6Haj7FPifdTbhNkrR4bbg4v?=
 =?us-ascii?Q?JCKFVHdUU89ZpJyuh1sp9cwot6RbXBGZ1FSlUW5Sy5Q/VH/z7vc6Msk/Z1W5?=
 =?us-ascii?Q?vJowDqqDxVWCOVYek1rCsx2ZuBT7zx3VkPjKy2U6wHR9vzO1LNmzGd+8l/rY?=
 =?us-ascii?Q?LqpGbxOIgFFLpzilMNSb6YA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf4014af-8e4e-4cb7-9950-08db92f2c4cf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:52:38.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P44JpSN0ItLGL/joLURbLH8IojcWn/RWjA4hWDDIIdadf9VbHYEilBRpfRXnpn0l4fMc2uTztK1yvByKe+dT3EzEvK7VEeUAQdsAiuUiiVIO64x+JqZq5XcwttzoVcZm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: 6YIKFEL2PYJAZTIWWQHJFYYW7W5TLOGS
X-Message-ID-Hash: 6YIKFEL2PYJAZTIWWQHJFYYW7W5TLOGS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YIKFEL2PYJAZTIWWQHJFYYW7W5TLOGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/adi/axi-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index d5b6f5187f8e..7b2563075743 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -147,6 +147,7 @@ static int axi_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops axi_i2s_dai_ops = {
+	.probe = axi_i2s_dai_probe,
 	.startup = axi_i2s_startup,
 	.shutdown = axi_i2s_shutdown,
 	.trigger = axi_i2s_trigger,
@@ -154,7 +155,6 @@ static const struct snd_soc_dai_ops axi_i2s_dai_ops = {
 };
 
 static struct snd_soc_dai_driver axi_i2s_dai = {
-	.probe = axi_i2s_dai_probe,
 	.ops = &axi_i2s_dai_ops,
 	.symmetric_rate = 1,
 };
-- 
2.25.1

