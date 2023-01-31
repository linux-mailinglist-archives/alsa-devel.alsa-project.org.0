Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFB96821B8
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:00:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D72EDF3;
	Tue, 31 Jan 2023 02:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D72EDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130413;
	bh=5nfnmU6K/b5YpFEaPjMx9URUZy3EreAXlmaLqAWaUkk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GA/HvFC6sZ30tSpsi4J1IE6JP/3bKHfdo1pdHSqEoikLMM861FuvokEKT8EMjrRHD
	 kuvrFOPxOhJO/AQ7yK+j+duIaQvA44FOE//YyqDQ1rFVY+0SN6a0sp6V6HeaYZbRTF
	 Cso1VFCCwd+eHzFH+gR0P0Yt1PEzg+Fn7twCVKws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F84F8045D;
	Tue, 31 Jan 2023 02:59:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27649F80155; Tue, 31 Jan 2023 02:59:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2119.outbound.protection.outlook.com [40.107.117.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B41C0F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B41C0F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TbTdAe8j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHrE+AP/M3dphU60HAkC67WWUv8/gKXkBvQq5WMVakVPSnmpBhFCjv+eQm7SPhQq9MJSUkFm9l/7DrClOvHKyCSF53K2MM1AsgCFSL1wvGrPU2Nai2rQF9bNkB0TKoCGV4mO4GLNNZRprFmqmDlVTOb3XxTeeIWhwagG1igIyHUuZck4LG07n3K9RGntz4Tf29lWcUWNX00R0uMdMB4iEK2yYxXzwUu3ut1t401TahDnhYAphxMA9yIHrH06wQt87Dug1wjVsJuKvui+2qwft1TgEkIgPJIpb/WoXlDRi+y4TWQSYni4dZWKPDsfg2MAozCzEvPvQ/x49H5ncYZF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIWlI27zncJI6mrCeGB4mikKky6wwvFOOPrwT+cojGI=;
 b=Bud5CdIzJgp8zPSd6yM6pDDaZHq0nIUfgMcQIHWKtrzQfxlm2ubWGtBKn/zywQBCCXDJLqhpXZBIHDvQAmnmlkw50y/D1QyyIM8nQJ7d+XVVb8Owr3S+BHLxUzAHogHV0TQMOqOkchfbGNkS6SXvdTDBHhbslSxLYw4qg9ZPrzdADRc7zR6XAplRGuUBiehaiQRnQER0iUXeNauN2blfJnQVOwKUuaQPbTLnyj7fg2a3qWobGRsfxcqfgSw2munMHpby3dvuJSI4UVJU2Q81X6hDgpMGfWkTBNmrse9UB34V1DdAGmcuTITBSJ34RJW02AK8YsGxtUAHoEyUGDSLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIWlI27zncJI6mrCeGB4mikKky6wwvFOOPrwT+cojGI=;
 b=TbTdAe8js4Kr+Ipkb30M9jI2JqbPcN1HF5wZsjTwVG+NzDyMZ6gDcCt7xGBzctI/P7OoFuHZ5ldHwZoSOQn3SrSMOy4mfmpe0TySKQKnJbz043mtzQolZL2kDLj+JMGEgVMvIdLP2BDbXR+Lwj/F7GmbnmdHX9T9PregBGt7ZoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9980.jpnprd01.prod.outlook.com (2603:1096:400:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:58:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:58:50 +0000
Message-ID: <87bkmfforp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/25] ASoC: soc-dai.h: add missing snd_soc_dai_set_widget()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:58:50 +0000
X-ClientProxiedBy: TYAPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd9dc89-8a3f-4444-f144-08db032eb2e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAZlP906CzkZO4cTs5WBw1wddOJA0OUYZoW6jVRYq9ecjPBQ6x8tT2biI9KiA6goNnx61wAxn0ciSMYxUZg+qNAhtmyj1a87cx1UOwAuaGsjwXvn+yGYdzsKQDVkBRmmnF7dzCx0wJ8Lsbym/SYrdLRWL29OuJt2Xlg5HbJ8QH1a06NVi1zYuFqgjD6oZQmOdvpa53U09t2/phYOm3qKil9fx63+iP5In5245qrMqQGBAThvdAjZ6d5MBwyPpCY37A0EDB0MlyPd6iYlAlGbGFWCCgOjvG84Fdr3Jvcpfea7zmHiwqj/54HV5YLTR+7t6/5C8VrEVwOdoCRmpvi51hdzAvFvaGZbsxJwzLvQoIv6gTVjYU1sDkQRI+Y7ezQuF80qzWNO4D6LgSa298y4AFdZYvnZxbPUUstwVSzMXmR47Q6oVivxISbcXaoVZsI8whvNxIlQAFCUHrHgu4cvJ7609H8J93mlFoNIg4cmIFUHik9XcgyZDAdS9sULR1ib3C4Rbz9zQFbx+2OTYlEmxQJ2pYE+uci8a7QABOeJwJZTNwcvnl6fh/XYcD0WI2J4BwYU3c1ikOXJ6Q08tsIjYZBrAFIlxj7nUQoech4Jeb0g8UDRO92n+BJwDpky6Go7FzH89MHGJYOX7G1p9bkA5osH7AsHmalgXZ8kU/aBS5hQ9uNAnb/Hatvpg5SeCmDe2jNubCHvSFSsFa+m3sdjdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66476007)(8676002)(66946007)(66556008)(4326008)(41300700001)(6916009)(8936002)(316002)(2906002)(5660300002)(6486002)(478600001)(52116002)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(36756003)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mBW8Pu8fLfUGbLK2AA1yQ+XiinNJAQbmY9SNd2liFK48U2we4wMcIyzwYmqa?=
 =?us-ascii?Q?Pp0u457BIAYSSd5g+kR5XP/OCvH27Hdu4EdJEgD+P2oxTXQXst8fi1jCos++?=
 =?us-ascii?Q?aUKHpLMsJNJKBqhAqZoOxSYA9HvytTVO7RQGC+DUlYHAVFEEMgUii4uzk3cC?=
 =?us-ascii?Q?hRysZyeZsXTmMsquKBBZZOyBtcnUlniZ2EyMiNd/dsyHEhUwBtoSIOcrNFWz?=
 =?us-ascii?Q?YskC7V+O6tWaBYzEQCclxBnu9Q+dYQRnGxKUQAxCEptqiK4TyzmtON9stLaO?=
 =?us-ascii?Q?XanKazr2QzpyB5MlEl8CibSJhnO/9k9zVInEXuteJMBuC8Zshq8d35GoPp0/?=
 =?us-ascii?Q?rjWUmKqPJa4AQ+z9/V8V3qPWYtEWNffUFo8cTv68b7d90+s6u6DSZkKUtoOW?=
 =?us-ascii?Q?Ts9y2/y+Jp3NbtqPb7tlyjCLVh8aslC8wpNcj+nWyTwSSC0rTzZnSiYZpkuO?=
 =?us-ascii?Q?RXSJItZ6cgbuvsLzOYUbGt10FlqeQotk53a6uDk068chfunDbnEyVDDWNNTi?=
 =?us-ascii?Q?yF8/RJPtmq2hvYB9rBeTNvUl8kOJSV2NMjW+Cy5H6vDzcBCMKT5ghY5p494w?=
 =?us-ascii?Q?hHGm9Tmr/Sjy3QFDAMLlWUQv0SUR+l4+o2OE5X8zMC4eC5V1EXTV0uA79nHE?=
 =?us-ascii?Q?Ho28yafGtFNPYHM+5gesXBBMwf3OGtf77c1MZRdi9FX61TOCrkG07KLXSa2q?=
 =?us-ascii?Q?BE+l4/r49pQNzyt1bbVmFhkpGtJVuH4R2WbfuSDFZqW184mpNOCFayI7zLxy?=
 =?us-ascii?Q?WvnEVqPHKsOQq8LzYgbOawwDe3eKr4dOIr7Ul+h8HE5yMWtO1aoduOz71b82?=
 =?us-ascii?Q?1UNlZlxoyfUJISXzIncfQ/HCtnkhTvzueWk0w2Ii9bAK2+GBwISf2uaYKuu4?=
 =?us-ascii?Q?BY39UnQslND99oKrBOFYk4kOdOT7h4s/1ipzrCfmuTYqwJTKVvL99zwwZ/96?=
 =?us-ascii?Q?XtyvhdCdnYg2qTa8az+qj5bn5MFYv8GpU7TIGeBS9QD75yhgySVF9++YYGps?=
 =?us-ascii?Q?wYPiYRKDV44sz+rGHZklICmVIiYt8SST+PeFrS+GPcKVMlgB0b9M/W/jwFvY?=
 =?us-ascii?Q?skHF9eRwuJ36OfAGLvpTk6VJKrBdW/sg9vnlajtOBQHNeFleW+No6kf25vVV?=
 =?us-ascii?Q?rDKCE/N8akulAeYyArWLLLzIhIZEXSlNCqdf/XkkLLAirwrH+1FRH5dwvv7X?=
 =?us-ascii?Q?/wTM9jZKeMmYLbpe5j9TLCBbOIwQvK1dQHqg4YGDfkpAGvZ6oCytmaTmp7FQ?=
 =?us-ascii?Q?amO5f7rcdK3qubJ6/aXq9iM04FiyyvckuKs9273OfdfzLzJtfULaK4Rz3MPQ?=
 =?us-ascii?Q?LOfyIaNtHZgbHkuc7BMUo4+ve0c9ZjjNoO+9azmYHrQn0JXlCok6TD2GM4mD?=
 =?us-ascii?Q?+Pjk8ZNsG29TqnPrQE1Omylr0rnlFzVmN54CJpMNhiSiXB+a+VFNB6d16kMy?=
 =?us-ascii?Q?ltjIXb11T+lX5exkar7QA3W8F/wGroG2t6PEZQBAQhaDSSdjIXEZPrp3PnSD?=
 =?us-ascii?Q?iJx1K6M4jFu5X1CFlRgsrhak4diLFLTkYIVL60wcqpMek7VtSByBoVbywZ3H?=
 =?us-ascii?Q?P4tq5zB7O42h1hhNBDMutbZDnxeLz9J9V9my2P4Fdmqhw8f7SGUcf+EH91eU?=
 =?us-ascii?Q?/oWxxWcAVZYlB/oYJ3cdq2g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd9dc89-8a3f-4444-f144-08db032eb2e2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:58:50.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXcZXjYnCMqhEq89M6EDfj/dTGbZ0V8pVu1czphCfEJDbmaXu5WtK4nQq9mZ0rRXXBkXF5/xlevDScsTyNEv+aMSz5wU+uYOR1xfmgxCKKQNwE6UEPY0zK53r3mYKkQU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9980
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has snd_soc_dai_get_widget() (= _get_) but doesn't
have _set_ function. This patch adds it.

This patch also cleanup unnecessary line break for  _get_ function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea7509672086..ea704d92deaa 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -478,13 +478,21 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 }
 
 static inline
-struct snd_soc_dapm_widget *snd_soc_dai_get_widget(
-	struct snd_soc_dai *dai, int stream)
+struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
 	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_widget : dai->capture_widget;
 }
 
+static inline
+void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_widget = widget;
+	else
+		dai->capture_widget  = widget;
+}
+
 static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
 					     const struct snd_pcm_substream *ss)
 {
-- 
2.25.1

