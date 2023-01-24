Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E9B678E0D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41929E92;
	Tue, 24 Jan 2023 03:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41929E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526334;
	bh=uLwrBroZGudU/DKs+m6vh/yUYrxbeEoAeBSkDh039lA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cqkrIuQkC2OL9X3Z5mBMNKLwB1wsit3AdXenTkBsdZsLJgwtOmXIWffP+NJdRsv3W
	 GuQonD3WpVRXPYyGX2Ikm6HHLdME/MCFTqM1VGp+8koT7xk6Z8LzVCs5iY7Jqi/HgO
	 XLpkKrehvHKviDUInnxyefaDTFW3ob4xSyPLKYAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB97F8025D;
	Tue, 24 Jan 2023 03:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 708A1F803DC; Tue, 24 Jan 2023 03:11:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72003F80163
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72003F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oCFI+D61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFAZtyW5TnFTg/l+YaV3EYy59TNPtbR4GEEumMr7gVQrIClJ2mxeBf0Zc9IIqx3a0s8t70oEma0tSMb6o1wGfUfyvr7SWVnwNEdxl2s2Wuzh/anNtv05AZIbnAkRzDC/YJ4Ba3IhTzXigbstSy0mFkwINqU1ftbz9pYsuSI45PFz7OM7pC6Zk6CSaDCHp5Z0bVzbw8ef1ZF6fStPebKpODyBysSrur55jRLyjOYT2vjKIQX6QiUFBOayAvsLn0kHW4SplZ+H97jBZz1nyfVo0wHg8loeNJdrmnCkYq+GybgU0qkOpaawgYvziLgGGS9xZK76N3UnJL+/UQPhdw52Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y02LuwpzK+tWz3XOhLsWzhp30164SfSO7lnXaEf0RWE=;
 b=CCvdRZR15icOCjTNu7fvTpCQURX9BssmDVFbOuUkkp6hM3O8Mje6PQeAomnjepawxaPSrHjSb3FoSw/Q4HCZqG4zhrdVgOYbUj6AXYh/kUtllKFYYOK/sOXW4YVx67X68WFkZREhR1NulBNsFDH38d8oKui/lKs0IOitlztvcLQrAG2uNWlxItii3z0zRAZzMDoRbG9sGHZ+6PnQFhACmP5/KADseLqGeCgxGxnCO6FyGKrl5nyYcj1XGaaTquY7O1B4VKrDQrjdzYRpsdvhJY8fZIk7ymzvMF6ZrpIb7IdWMYsberEDG9SvvU65mgG4kjFizwFN6f24P6ns6q6nZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y02LuwpzK+tWz3XOhLsWzhp30164SfSO7lnXaEf0RWE=;
 b=oCFI+D61NoYygd9lMQDj7VYhc9xQ6/mmsybABQjkNu6qkkMQ8rhLB/wrUx/l+sySOFRBpNCidDi/nE0V+1XFurSdE9xMZxmFTHUAngh8ZnUelsrXyCGi1n7517COdks10iqeaUS6/5TmgNg27uy6qnh4PgQ6VAuo/Z07UvnPmr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11421.jpnprd01.prod.outlook.com (2603:1096:604:22c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:11:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:11:13 +0000
Message-ID: <87ilgwu1fi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/25] ASoC: spear: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:11:13 +0000
X-ClientProxiedBy: TYBP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11421:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ff3fad-c914-4769-1381-08dafdb044c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SPtyLX8pLaQgT+pBc683To1wsY13L/FLHXaVq8haK3DKDN0YvDVWwZGbOm1r8qNrjtZuwq9iLH195YlZFxY74q5xxmN3svaCr37oATOpMa1Omff+fGe5VEe0xG9Ek83KGbJ+cLlqAqcnCATNRMShOoDVl5bnfGjbjK5BaPGfiSTGQOkvqx6JdYupGrOU9Z9dzmsR+3cJ+pnNBOC0vhQ06CbuUVi4aVRqaAzt2142PN+SfIqAiJ+0uNukN1AF+v9NPpZZL2MPP42gbIYA0Mo7c2nVO/NQ2bbFw2TFEaMdaaWhOcBwniWnEapFnhGKNY8llJiuaxiwHKzn8SFCOoMaafZVyFwsAo3CNc/Fich1Y8voLjV/4NZyamxL7cA4MEa0AVr1nz5cT7xU6rtN/K1uNMeBTpX2BpuLJVmVWPA61AERdL8zY51cgezVa2Nc2j558dcTq5W2oOqtBJnxy7lxD2p9RVuivdBtyvtCZ6mTbDF8PCXLuPfYmgqVA5QWNjcr8VcJEG5dVpKma5dHw9QpXITSPIj9Ut1pfiBFsh7/nnKFqVRm3j3H+ffm57KEKBB3BNTbsS9t2K1QsqhPkbBJPD5gNDI/oT5GuD7FOeVQ8FgxKQACkx1UBW3u1PgjD6ML/URSNPWvxSSImme3+8Bdm53Ho4dTnfTxYBOI6QQuxNi9Icn5QGkW5408icAzi83QO8D/JvFMWyqBQtxgfg/sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(52116002)(54906003)(316002)(41300700001)(36756003)(8676002)(66476007)(66556008)(6916009)(4326008)(86362001)(66946007)(83380400001)(38350700002)(38100700002)(478600001)(6486002)(2616005)(186003)(26005)(6512007)(6506007)(4744005)(2906002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qtYaM5GyHCQw9SXvZ8d4sgTgBWy5EsmKNlo9Nlr9WUU5VFN9tF+K2msD3mL1?=
 =?us-ascii?Q?b/vSb0++kxP8qMSEXQI4G3GjsjqdfAfimj8hKUzhhj88VW3HKvg1Hh2ye/vN?=
 =?us-ascii?Q?7nlnAzvzfGAeGJ4z9BJKvFJOYDzgIgW2peDxhonThr99QCN32ldXTctHMI6H?=
 =?us-ascii?Q?tN+W+O15RCMax5EgS4OdKSaVxbvyfPWwPQdjDW+tgEEtzzp9r/kcbVy/qlEx?=
 =?us-ascii?Q?syU8Qb/DYxh8yiSOsaCvsXlo+oNOw3wFTn8FFr94NeE25+BgLHqbo96YgO76?=
 =?us-ascii?Q?qrtkC8I2ns11JKfJsLF5Xw0z/mXBxT4he7VZYjVx9w0Sbc4ic4qUOpZnxVKd?=
 =?us-ascii?Q?/mSO8/qCe0pXeCLbdPIGoKkVgcTfMvjByO/WiZkCx1nhuGmcwezdw/RUq0Yz?=
 =?us-ascii?Q?7k2Jg338KUF9ZhyYbVdV/aj1dQDm7DxUlm0jTB2BjK71/rtqDgf6Sm2xT/lS?=
 =?us-ascii?Q?GpgRU9KQc+yL5Rgrw7p+FlLYBowNucBJW1YOAAe/FfGFx2K/x3QSghx9T1jx?=
 =?us-ascii?Q?VwjSxmFyo13rCtpCih461QqQwlV8jpVxsSBxSSNowHGIJ9aRFwYKHG0oLgpK?=
 =?us-ascii?Q?vz3AJZn1SXx26T3TEXGDYd8gD+ZIaW1PV6mkGG/q1EnrJ3rNJnpZRkOU3nt0?=
 =?us-ascii?Q?cYRxmugXoRFawP673P7PPIOwIU8oIM41D/BPP4J0FC67/ePvMVORVAkHNkUs?=
 =?us-ascii?Q?z9CDnowe3go6AEz0CvjQAFjnXPiNPuRLw7Wn/48sOqAcznAHVFoBkzY3HtMJ?=
 =?us-ascii?Q?ovkZsJQSDOjxOkrSkyu+f0SZfwN3df5ou13l6QY+TNsLv2gVCdZnHmiaJP4h?=
 =?us-ascii?Q?IVDbY7fTa0OVZ8r6seRclHyU/vGm9h5ycI+odnx7VHQi8TgJBPNGNYb3AwkF?=
 =?us-ascii?Q?QoI+vSCeoeCDfnlzj5rUI6DSZebzUeaeKHIpEvHZYHvfpe/X+CIrEmATC90E?=
 =?us-ascii?Q?/ExInYcvznDExRHUkpIBipDdWafo4qnKmE2BcqoFlEEzeJAgAsPAXyiQ2LWt?=
 =?us-ascii?Q?Ds1t7o/m+WaeuJT4UeXeSrPMl7JR8ufTzn0y6E4JBG5mqEr4J9xqcbvIWuTs?=
 =?us-ascii?Q?N/E+aLNRofzf97NvzFjinp3dvz0BrUpX2yytlvACEyr17InaijQWq5+ofnTN?=
 =?us-ascii?Q?IH6RPePBl9jMlLu05A3NI19wpwG7Cp5LKFiUBjs335qfbfaaxSfyUfIlxtq2?=
 =?us-ascii?Q?6EPVHfz/mtrm5OvPP8aHvHPenJD/9QhyKwtdjwsDIP7H1wsRG+l5qRzEqIhY?=
 =?us-ascii?Q?jdTJWmkuMN7Dqz1ebjIqTPXLfXjeLSel+Hlw9OdwXYioVBciOHyfYA4NQsJ/?=
 =?us-ascii?Q?ubH0xUB9Rk06SqLjdndLFy4Epdo9U9nGrZmXRXj3l5AG3ziOx6N7bm7pa5tG?=
 =?us-ascii?Q?BJbGNze+sTAa0sk4xXzriWZpA3WUeSONCuF/FFOOQ63wiUSricufsy+mRkCi?=
 =?us-ascii?Q?DgKyuuFSK8EsAXL+/ydNNSGcQy9jVKivBTrIm5uHTvrs/5hfzXX5BJQWHuR7?=
 =?us-ascii?Q?pGgTrEkaO9NOdTk48BjTwJ7XZQSlSGlKzProMz0jinCFLNn5tdyCKwLNO+18?=
 =?us-ascii?Q?zwHhRUaHiHhQeHNzYiDrmzWHP/67FJnO5ZVmLOcD+QXo0gEbEmapagmNgozB?=
 =?us-ascii?Q?Y4jfn3Y78PFL3+DE+m6Rj+A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ff3fad-c914-4769-1381-08dafdb044c2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:11:13.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hswYRIjEO8Fj5duOcZ58wFRIdbnmlaLqyA/uNhsftQhCKqh1qSr4ZcgoujVyi0kmC5HgWhQtFS1W1kHyOsQV6Z+PwI4xogJX2U2MoR0zCdlbQsmgS0JICfsu7jm4SMZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11421
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spear/spdif_out.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index fb107c5790ad..469373d1bb41 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -244,7 +244,8 @@ static int spdif_soc_dai_probe(struct snd_soc_dai *dai)
 	struct spdif_out_dev *host = snd_soc_dai_get_drvdata(dai);
 
 	host->dma_params_tx.filter_data = &host->dma_params;
-	dai->playback_dma_data = &host->dma_params_tx;
+
+	snd_soc_dai_dma_data_set_playback(dai, &host->dma_params_tx);
 
 	return snd_soc_add_dai_controls(dai, spdif_out_controls,
 				ARRAY_SIZE(spdif_out_controls));
-- 
2.25.1

