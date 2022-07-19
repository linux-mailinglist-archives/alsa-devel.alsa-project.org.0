Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECA57930B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 08:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAF411670;
	Tue, 19 Jul 2022 08:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAF411670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658211620;
	bh=gH22fjB4Qp4VVMczB7xI2pWKPiTO2CSRqJ6zW04w2NU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l6dQG9QBDgkqqHCLLS26/cuwda9A13M4dGDwsSyQEV1vfk3KptB/jlYEPkYluKRaB
	 NnqYx5vsheHPXnspZLc9Hq5UKpvZsZ6WFOmdomYQIb/PofR2LORRv+2LWsUeXsJTX2
	 mLBiE2R0jZhqRzSQz7mO7xAFCqNK2t0+Tcb8VeC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6552BF80224;
	Tue, 19 Jul 2022 08:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D7FFF801EC; Tue, 19 Jul 2022 08:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E706EF80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 08:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E706EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Uj78wri5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP9FB+UD8j9wAFeTzBMk+4SBJo5vVDOZSaOIzmJZdkqAILNjFHC4crgeQgJOwMxH1xUZABHQEDypAJjAMijdDTqWKsm4lV08tjKIMg9truFo8J9GRl8azFtF5cO4SCNkYTu6vYbDAIdBWumdK3O5PSJsGceGTpp6ei9byVygyKE6REbBpBw392lfyoE6Yh6ox5DldAAtc4Hhl+5Ks7E8/i4FpfyJQI5EdaC9Fmw9cXx2YtG93KvjA0tV1FlIW1nnZfpZXovX3ifKxKGCXXda+fMuzRpgdKH2HyvbZGi5dKPpoG2EhxqZqFMpG/oG5gy2UTr0UN4a1kSEJ/xqlNwcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BFPKBeGdSvjFAfmTaUego5NtxRw6MEEMopccMdG+Ww=;
 b=DBxWkFP7mH65MmGqPsEnFr2l8GvyYOsbztxTD9vonbc40wnmxppHghLivW4QktIubmC5tbNvgjtA98wZxwx0clLPCCaXl8uVNNDaZcEk+xQzU7o3qB7r5QKq0TvzRAHucs3QuyTbgO3PVTSw3qcSlUy8W6rnvbU+a5200cfQtjOAK6LI/kSaa2xRUCDBhNIXh0BtT5gcimz63uhwYUBCX8dIu2JamGq1HNgqJWIYoIUcMDR91jcS69AEw7hP1gB8Lo4kXqqpbDcyG85catprYMzce1v77e2s6Wo32Rr2RGk1je8m45cnVXqAzr7CZKL4dkWsxGdMMqw3nkfs1BTY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BFPKBeGdSvjFAfmTaUego5NtxRw6MEEMopccMdG+Ww=;
 b=Uj78wri58u3FS3LUQMGCFR16kxtTmWGJL2Rhgi6jUPv28LAis3zhwZD0U0KJizlPMde3F5qre7h1Ew77d/EYcieVVO/fKrJLxpuxbGDymzaqmXeCAUO+2j/EG7R7CXbgXP7nj/G26Z26QLbfvj3yKiWbknnrnO03yyCgREmYww0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB6198.jpnprd01.prod.outlook.com (2603:1096:604:ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 06:19:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:19:07 +0000
Message-ID: <87o7xloca2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: ASoC: Is this bug ? DAPM source vs sink
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Jul 2022 06:19:06 +0000
X-ClientProxiedBy: TYAPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 948e0941-290b-43f3-cca7-08da694e95c9
X-MS-TrafficTypeDiagnostic: OSZPR01MB6198:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZjDKJ2Y2ggD4zNwBEMQuqp8dDiFGPCCHvKbBM6KrCovd+T7hSYsYV2CRgqIZu5LCAFhqNZOzHZK/A1qMK++sMWEeT8bY+Sfr6X6A4mN67mVw6Lec2Ijwm0GDlvdXNGARUldQYIerUyJUcoE4srqNCdCm9DRQKLVeLrOuo7lWxWmWpBa07K4niPiIGH8kZBGzTfdSxsoUtrq0ZpGA7abgd6kAypjGAXIpQAs/RcdAMBWugfHU2y4JjxS1j0oIVw9mm78vY1F7WFBCl7hkysbTJKDkWkbbyI5wGSBwSXniXe7vwFrXkJ6+omFTxHtHx+hjkmELxZhUMV6wUzBYwv6BU9NEmVhv7r0EolRF4PANxVF7q0b+BuaeAsuaFm6GUViQhaX/X9hwqQeE/N3vc9yNxjl9fmAvD5uBAD7zNA8APsj+jNsxgPJ0PwDBH3ZjbX9WsNuCdKkw4BLDDnaSAE44beIAgXrz97SgXs8V479Thfykth5CIyr8JgByrtGzsUhf4nF/McQFA06cic6+9++5rxOfTfl2F/AhajzgZLR3MPmc8TPPZPw+mGPzD/ffN5sSF3VsaXsBMbHgIoe11MNFplc9I/nk3o4NCR5h+w/6q+SDc5ISCH2oC+n41haAwUhrCbpcooOlfvq7lHAVYjG/1m12wPAyAmsUmjwJzuS9i0uyqHN7q01NlHdZR2fmPoZtZZzsfjaclrDPDnmiE0HyQwHCkmmkgV2yxsnzwTGvjJ6PNtFBVTq+uvoZEjSTBVvC7WMDcPPoQ2E82ks8g1p1SH6g8bqoW7wknKmuwYfR3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(186003)(2616005)(41300700001)(54906003)(26005)(2906002)(52116002)(6506007)(38100700002)(86362001)(38350700002)(5660300002)(36756003)(8936002)(316002)(6486002)(6512007)(4326008)(478600001)(66946007)(66556008)(66476007)(83380400001)(6916009)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKRn5UzYeJPVixLUJMc+CNBCLhTh6FOpnsrtw06l/8ERDI1htJ25q9j/FBZq?=
 =?us-ascii?Q?VGf9nK7y80Qwkf93Fcx4Wyn97vUaRrFR7bjkiE+pszp9DzMPEmt8HUWYyxql?=
 =?us-ascii?Q?T5/TeixasVF4UA3emdkg/gHgnHGOGOAXaNvwY5EGM+4X4WHsE0F2h5DdRPPr?=
 =?us-ascii?Q?f4vPRtceg2WziqYrdA5I65vsAsvMd8/V0WkLk+TC737EGiys7gTCOINlkLzW?=
 =?us-ascii?Q?42dAdVYgpxl9LGaoK1kKy2SLAf5qlvIR90gbLO0oEF5cHB3KuihzP3wmfB+T?=
 =?us-ascii?Q?eDMMOq8GAuWMuVxQ7ySEB8/XCuKyXU5LwkHsxfS0IRFQ3dEo/Hd6+QX6mwcj?=
 =?us-ascii?Q?M+FNKpmO4i8+Vet7vWbHzfPHMSitkKCmKZldbVNBTX3FpVKYFVXIIReoPdLG?=
 =?us-ascii?Q?9KFO6lIuGpmMnN7GGASiMsLTazLM9zZnld5kQ6l2u57KG4DeOTZaEhvYlkvq?=
 =?us-ascii?Q?7EFikLxPV+RE7CXTWNyXO54hMf0beGXD6EmV0ekSH4QQUOo0BrPGftilYZcE?=
 =?us-ascii?Q?d4OXj7+WH84KVqsux89rWKC8TaOU5h/ViivTN2L28zq9liij0vkdcWINFACa?=
 =?us-ascii?Q?H89S4E3n8xQpKdeoR1B4aZq4USJB7Z9cAZvNhfnwIRibxwgU8qcyTow13k9t?=
 =?us-ascii?Q?wzvjelUPgkK1P/IKtI1Efw4zS//SSLk9AbXBO83BKtjeQxz3qN5W3xk0cWIC?=
 =?us-ascii?Q?EgqWWGx33AYK2cEz8Qi02XhCcgQJvFMJUEn/T3aCRPeYc0J8W6MC24/6AFBa?=
 =?us-ascii?Q?eI+sK72om+51rEpmsbL87msnN5h4BLVBkO+hv6m0n7z/0iXQHPc38UdAB/Il?=
 =?us-ascii?Q?kSwXcgX4UQ1yhtxTVtCjJ3Af4AG8WMqp/kpGxUEaoQLc3W8QdhSihae/0hPK?=
 =?us-ascii?Q?zvSam27unK2DmBzSaHE8KZan+/ej2dwPVNMo9Da/W9+iHGSA1Ler7KwVaSRI?=
 =?us-ascii?Q?PBJd5Cz5s+tDsjNditcn8HSg0tHpStD7nJA3yhBiUa72OnjafUR/ZfPfpUdf?=
 =?us-ascii?Q?wyMWtRv9v4zbAChP1uBILHWPqMZOADCgB56Qodm+3W8rWGBI9ui6eKNhg7VY?=
 =?us-ascii?Q?+ukHssFiPFyyzVJWVh7NUsRH2SwwG+04N8gFNXCp3eUWiKeudzbPhy81gMUR?=
 =?us-ascii?Q?OtijbNpFlL0HkrYp2iaQ3CBRax18s9qkaYiGJp1W0QUOmbCNY72VdzYI83vW?=
 =?us-ascii?Q?rQm77dArfK8RDBhrVSA/NlzWFnORpQrpcREzEoUCHi4FZG6hX7XFi+C9z5wL?=
 =?us-ascii?Q?wA1UxhdKgJRfm2Ar+/zUbaUxdkkCKYBXrQ8VCRUFUY+7zjNqGDyvho0Uimwd?=
 =?us-ascii?Q?CAbmd6cbIT8srGNUyiUHPrMjIgeiU+EjJTEdoDi9fA61GgKOgIQ9C9smjkyR?=
 =?us-ascii?Q?WoLnMHNF3H0gi8wA5XMm/e1ijcyrOG4QCjysgAG8LX7Fph6CiaySRbT45fNa?=
 =?us-ascii?Q?FT2oFo4UIBdTUiQ3esEB0HUTgu8H7y/oSq/TMC2uVMHtucowB8081N6L5eTf?=
 =?us-ascii?Q?KCMq/mcr9xnL3FsCNikyVetYQh8SsLySH5WaTZIvk8jUwEh9ncR24UlB1qHC?=
 =?us-ascii?Q?E4uRBuHb3Ygjb+MIvm3509rLPIi6aXeztdFlik96zNdXT96e8DlZdEAvstAN?=
 =?us-ascii?Q?VW7wEtt0NSCfOiIzyAW0aoE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948e0941-290b-43f3-cca7-08da694e95c9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:19:06.9617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gtFnDvbUTzD5nAYYeOuSspfaM0LESSuxqOq8nF/BKwfzdJkRotj3aCK1OBwwmX1qBg0u9UYsXOZlOk32GFmP5dQrO02QSmp9LoapeXW1R9Z08WYGxTktsDjmEBFAAyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6198
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>
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


Hi ASoC
Cc Lars-Peter

I have noticed that DAPM source vs sink are strange.

ASoC had used source/sink or input/output before,
but it was exchanged by this patch

	a3423b02cf745c1418f1f199646c450d6fc9ca4e
	("ASoC: dapm: Consolidate input and output path handling")

I think source/sink pair are converted to SND_SOC_DAPM_DIR_IN/OUT
by this patch.

	source <=> IN
	sink   <=> OUT

But, its for_each are inverted

	#define snd_soc_dapm_widget_for_each_sink_path(w, p) \
		snd_soc_dapm_widget_for_each_path(w, SND_SOC_DAPM_DIR_IN, p)

	#define snd_soc_dapm_widget_for_each_source_path(w, p) \
		snd_soc_dapm_widget_for_each_path(w, SND_SOC_DAPM_DIR_OUT, p)

I have thought this for_each is for special handling,
but, the original was sink is for sink, source is for source after all.

	#define snd_soc_dapm_widget_for_each_sink_path(w, p) \
		list_for_each_entry(p, &w->sinks, list_source)

	#define snd_soc_dapm_widget_for_each_source_path(w, p) \
		list_for_each_entry(p, &w->sources, list_sink)


So, I guess current for_each is wrong, but I'm not 100% sure

	#define snd_soc_dapm_widget_for_each_sink_path(w, p) \
-		snd_soc_dapm_widget_for_each_path(w, SND_SOC_DAPM_DIR_IN, p)
+		snd_soc_dapm_widget_for_each_path(w, SND_SOC_DAPM_DIR_OUT, p)

	#define snd_soc_dapm_widget_for_each_source_path(w, p) \
-		snd_soc_dapm_widget_for_each_path(w, SND_SOC_DAPM_DIR_OUT, p)
+		snd_soc_dapm_widget_for_each_path(w, SND_SOC_DAPM_DIR_IN, p)

I'm happy to create patch if I could get your ack.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
