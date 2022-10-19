Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2FD60372A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE03A847;
	Wed, 19 Oct 2022 02:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE03A847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139834;
	bh=S3VnA6HFyhCb4pm7gl3u8l4JRYPS+WACkvOsQ2Q6eps=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hufm9ZU5sQrFih/y70t0lr2MfSHV4NgnGZecrNto9r8DNZwStSIuUIA5yt7zGgMux
	 GykJ3AiJTOpILZkrhbT4ENNasj5+c8xCj7kVmpDWrpvMs9AwW/jAsWDYjZbSICe6WM
	 JqLKyDa2TLnv/HBgKitp2UimVtabfCJ+ZS0dktSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E6CBF804D0;
	Wed, 19 Oct 2022 02:36:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A2EF800E5; Wed, 19 Oct 2022 02:36:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0CFF804C1
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0CFF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="DNtECTSb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcCOYCbLff3tZtFADkp8MOPn6fevg+kRN+Loj22l5I0s7foIgIbiO9OviJFh4QxsLGqQx/BuijlYt9TzAlZPgvmLXb3oIax5pC8a+4ps1TsvWYAm8/QKQAAXAUV5trq2m3U3Wcd6hQMr8qlc5Sxb9DpRc2OPLGWM+kbASmWDIdgKHPp0jKAl4+/caxZ7tH3/lU2ajFVm6Ui+XfKXyUFAvSC48b4dMEWFqzOLetbYI3geh/ThH9gGWvgeEf7JAlgtXBfjuKX3YK6xzENLAuEfT8mmZ8UI0umUoMbfK8/8+lzT1t1Eo2GGt+Ob1kMxYUZEOP5qRHfmu8UG4ELgWvxwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hVES2iAtj+Ki3Uwufdq4G5tHRiKssq2SKKEWfnNUn4=;
 b=FhnBgctGGlHx4/E7OikXGQEKB3OE3JKH5u85sDXa7OVST+y9yF2v6Xe5OTOA/7LHzhpU0Xfd/Ie3mEBEGk8TblmefdJfwsOM904nm3hE2jlnHZcacMbQM9WlAXrVjVteqfWkKIuR31FKVa26l/IptJkyu3ZcskpC/IedjVx7WCOew2ojkxajhujd+8nMNohYC/u4iCykdTRvtDJRdT+su5gR+sZRPY1se8eBdf4nIj1jn79fs6iJP6ec5lxEsyuqao/QfUhsHF62STojmCAkvmdd0Xwph1R6Mf6UJt/CbQrEGncAdDKu7OeYpaY876oCeMZ9lSmAuZ/3T6HQfbVczQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hVES2iAtj+Ki3Uwufdq4G5tHRiKssq2SKKEWfnNUn4=;
 b=DNtECTSbKcsvu+ls6AGldZgyoMiEkLGMS4L3QmjI5ndta6vGgPZgRZ5gCUwQE1tfynbXkY4lbSs1FVTkuMDZeGkptnLLKvkNpCtN2P6y4qNLmxT9IFohez3hfffqYEtm4Sb1W2bejQU9JLyPt1ZT7icUE3JAbs+oUFJ1ZZbzYUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB8229.jpnprd01.prod.outlook.com (2603:1096:400:111::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 00:36:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:36:06 +0000
Message-ID: <878rlctzt5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/11] ASoC: soc-dapm.c: tidyup error handling on
 snd_soc_dapm_add_route()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:36:06 +0000
X-ClientProxiedBy: TYAPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c65e79-7c79-418d-11d1-08dab169e8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwg7a/7rfUFhAlrpuw0x5T8OaUC1mEbW9ptpmdDqnmj6smL/XB44oZ95hG4vlVLJh0xY2FqkRp9ws8mrAcWfJIvCFsUuZ2BUW/M0L5zZC70mdyvBFi9rMLRgVcpD4gM1841yYoPZin2VPWgUNJvUSxnWlZ958w4P5XPXP/KLJPQNKjKaH8L/KT53d0j2frswTTz4MPFLDmlW3oU+OkX5uxDZusxhDj2ym74emlV9tYQBpWFEY62sW1Qu0F/tgWk+ZBA3bLswDc5luobtxZBwCMLg3Sz+coXKYH9uhiI4dwx9j4QnSu7f4kD/epz5ZoT96mhApAgmV78dW3LtH8pBN0SgOEdR3GxaYuxMoM9ASwA9Lxa5fjNniyGbfGfvE7PNwjefw3otjqbwhT+MXzHV5oHOHcbQr/Tve0GGUuJlQhwA50oBqrYvQWBzsv6v6raCInQsdz7SnNQhePGR1njfyqUq5BtO0/BdvfZfddRBrycP9DrXA7xviPzqu+X2NyMWCc73FUp34ClsRjFbIwMSH9pOYjqAEbCHmL65aBO4DdXh+mp/4v6CTX3CjozYivXErW9/FbNWuig14MzWN2UCxGgk3sffUNwSEXN2YWb+hTktzf0qPnb3ddcwifMN3yVTOBWFUYcntS2igViG6ZSdKIMqeRMtu/gk4DLzpP+svaiuHZupK+jTevRWUHrE75sMeniS0gNWWsdzKGfkerm43weqGEDPExl8ZkzJB3B5o8uj14rXNV8y/YX8rvqbwb0V7M4mT1kAZRKCBvCaN2YAoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(86362001)(36756003)(38350700002)(38100700002)(2906002)(186003)(5660300002)(6512007)(2616005)(478600001)(83380400001)(52116002)(26005)(4326008)(6486002)(6916009)(66556008)(316002)(66476007)(66946007)(6506007)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nrRBW6/K6uzUNs0IFpvz+x1rLQTKubav/kb72lcEJisTptRpFigKFropFkXF?=
 =?us-ascii?Q?ibl7Prpc3jAxwQxCOJAzfZkDy4VlFxEuU8d/xaDZ22vCITTaDuQCt7vYsmsk?=
 =?us-ascii?Q?yRbohau5GiYY2DqqD77BwXnU1Pu8Ic/XaKB7+M87pkjQb8EGIAJnY/74M8Nm?=
 =?us-ascii?Q?kECJGUGTOQ+YwYE3S8UiMeFg6UNUHmuRU17Qw3cganrTytnKahlD7weNPGFn?=
 =?us-ascii?Q?j5h8jC9/MVUknC5L1bkBOTZHQFEZT0TpfmTrprA9OubZ03OJOE34AapepzHH?=
 =?us-ascii?Q?FWgYRJ/6lHuM+4X8m4iPhRuOgAGocCDrpwXEti1Eposbbl7tIzRSxuVB8jlk?=
 =?us-ascii?Q?7EiDNGWjppugPG++564cXPWZnk/LFAEPjJAkI8Np2KMNxMAFIb7dDEKCqVbF?=
 =?us-ascii?Q?OuAbiM446X/bDLPjUh3qVK1RXvz0piPp+jcIHicPHnQlVQ2gb4E3ekkYFDri?=
 =?us-ascii?Q?90Aaew/Sp/H3vzph5dcyHE6f5f9ieYeKb8t/CsWCc+Vvpwa6kWiuvBVPQjUN?=
 =?us-ascii?Q?85rtAgfyDNOhLaEv1uGL0sA+z48QSmVlvE4niKItNckEysgRE+PfdYIoxBki?=
 =?us-ascii?Q?d6fYN0WT/9x9y/SmBcSzLhLoaFiJFNh5/ZHH1uTKDdCPs4vnxrg+R/wyuEKz?=
 =?us-ascii?Q?wJOEJb346GWFpLKMAe0QlhtMPV+Jj64gCDQW3ioNKW4qM0tMXzhJq+o2pUwA?=
 =?us-ascii?Q?aV8ancE4jC0I54hwmbBHJUiekU5IWM6V/Dp6oVcEFAhHdIrHmF5yHLU3TV+J?=
 =?us-ascii?Q?MOqcggCchiJvDrSoTfqdyYrlIVdmW2J3/f4zrMdVr4Qzr2lvzjzlwEFO+nSe?=
 =?us-ascii?Q?Tkd9ypTdA5PeVzx7aslUZ7Lpt8pR9CE5LQb/LSF+6xh9ibsUxD4Zw3+RsHoX?=
 =?us-ascii?Q?QMxsKHEe+KBp2dv3CeVL1wXM6uHyLHr+A1Io3par1EiIyG0ufBn83ieTVq1/?=
 =?us-ascii?Q?un2STMWGrybh5Gtds7A/cMJh+9nn/dN21KrtgsDULB7pUsSTku8a70Wij6js?=
 =?us-ascii?Q?UPGpWjJP8TtQT0RadA3NJNix8I4vvp2grFoOS5uOHnEk5UU93c7peGU8Evda?=
 =?us-ascii?Q?xPkD/Zg9HrhHkbgb/XfCC+QTC1XdK7dKl7xLlpK9PVZX8DMc1tN5Zl/PE4++?=
 =?us-ascii?Q?HFr3slf3T32H+2pCuKRdsm/otr055HuCEll2CJb7Z/kG+QCPizdaZwv2PN/I?=
 =?us-ascii?Q?jGjeyxQKSQTsK2nHkhdeKnKDJG8GG15wJDsBBtA0LqdR6t9rl7dWsJpltih3?=
 =?us-ascii?Q?Q5fxW4cmLIwtXfQ+D7D5eQo2ylp3XpFwij/vV5tN3sqAqVn+6lqjKADrjlae?=
 =?us-ascii?Q?usoS8zuFrB2ffoeQB2g3exWmTAuqIfjdNdJ/+GZPDwP6WnuV4CxFzmKvPPVj?=
 =?us-ascii?Q?vuFtCtll2+3iafypmEzDv6bWHQlbvWox4FBGngPf5hXYV24/VVBD2RJ3inRp?=
 =?us-ascii?Q?hrWr0WVlSVnH7VT21i65g0Bhuk2SEuVjulY37EanVceATFMGRRabFCZCHcE3?=
 =?us-ascii?Q?sGbIfM9YhxQIm+zD4SrvYDFJsHgHp1QHNWhCC9g4pUH15zPain63Dr5wTZEU?=
 =?us-ascii?Q?3FZy3cNgX/y+ZwKAg7kkcQR5D/BV+DhdpP/BiW/Z1RGL01YABfqcHbb1FgVL?=
 =?us-ascii?Q?tqagmXsva6uUelX4SfzK9UA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c65e79-7c79-418d-11d1-08dab169e8fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:36:06.7387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqSj1rZJ+hhUQDiQeMdlzzjyrvSkmLBCtEyhBSbIQJf6retTkpCn4YrCrCdZ5N1f1GUkpGYldkhkSpxyOVoyFt0C27k3M/Fj9xg3xPiItedvOat6WRCFpSxE96xGg01+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8229
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current error handling on snd_soc_dapm_add_route() has some wastes.
It indicates *own* error message *only* for sink or source,
and return error directly at (A). OTOH, it has similar error message at
(B) which indicates *both* sink/source.

And more, (A) is using dev_err(), (B) is using dev_warn().
(B) is caring prefix, but (A) is not.

(X)	int snd_soc_dapm_add_route(...)
	{
		...
		if (wsource == NULL) {
(A)			dev_err(...);
			return -ENODEV;
		}
		if (wsink == NULL) {
(A)			dev_err(...);
			return -ENODEV;
		}

		...

		ret = snd_soc_dapm_add_path(...);
		if (ret)
(B)			goto err;

		return 0;
	err:
(B)		dev_warn(...);
		return ret;
	}

Above snd_soc_dapm_add_route() (= X) is called from
snd_soc_dapm_add_routes() (= Y).
(X) will indicate error message by itself, but (Y) will indicate
own error message at (C). (C) is duplicated.

(Y)	int snd_soc_dapm_add_routes(...)
	{
		...
		for (...) {
(X)			int r = snd_soc_dapm_add_route(...);
			if (r < 0) {
(C)				dev_err(...);
				ret = r;
			}
			...
		}
		...
	}

This patch (1) merges these error message (= A,B) into one,
(2) use dev_err(), (3) remove duplicate error message (= C) from
snd_soc_dapm_add_routes().

By this patch, it will indicate error message like this.

	- error message with prefix
	- not found widget will have "(*)" mark
	- it indicates [control] if exists.

ex)
[if no sink with control]

	ASoC: Failed to add route SOURCE -> [CTRL] -> SINK(*)

[if no source without control]

	ASoC: Failed to add route SOURCE(*) -> SINK

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1796863bff1b..b4f876dff994 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2994,16 +2994,11 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	if (!wsource)
 		wsource = wtsource;
 
-	if (wsource == NULL) {
-		dev_err(dapm->dev, "ASoC: no source widget found for %s\n",
-			route->source);
-		return -ENODEV;
-	}
-	if (wsink == NULL) {
-		dev_err(dapm->dev, "ASoC: no sink widget found for %s\n",
-			route->sink);
-		return -ENODEV;
-	}
+	ret = -ENODEV;
+	if (!wsource)
+		goto err;
+	if (!wsink)
+		goto err;
 
 skip_search:
 	/* update cache */
@@ -3012,13 +3007,14 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 
 	ret = snd_soc_dapm_add_path(dapm, wsource, wsink, route->control,
 		route->connected);
-	if (ret)
-		goto err;
-
-	return 0;
 err:
-	dev_warn(dapm->dev, "ASoC: no dapm match for %s --> %s --> %s\n",
-		 source, route->control, sink);
+	if (ret)
+		dev_err(dapm->dev, "ASoC: Failed to add route %s%s -%s%s%s> %s%s\n",
+			source, !wsource ? "(*)" : "",
+			!route->control ? "" : "> [",
+			!route->control ? "" : route->control,
+			!route->control ? "" : "] -",
+			sink,  !wsink ? "(*)" : "");
 	return ret;
 }
 
@@ -3104,13 +3100,8 @@ int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
 	mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
 	for (i = 0; i < num; i++) {
 		int r = snd_soc_dapm_add_route(dapm, route);
-		if (r < 0) {
-			dev_err(dapm->dev, "ASoC: Failed to add route %s -> %s -> %s\n",
-				route->source,
-				route->control ? route->control : "direct",
-				route->sink);
+		if (r < 0)
 			ret = r;
-		}
 		route++;
 	}
 	mutex_unlock(&dapm->card->dapm_mutex);
-- 
2.25.1

