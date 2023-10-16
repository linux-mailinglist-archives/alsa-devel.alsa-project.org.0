Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F057C7C9CEB
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 03:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D638857;
	Mon, 16 Oct 2023 03:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D638857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697420315;
	bh=kqpovcr6ahX+Bcd5whmALOosfaoAXC2QuUlxsaqd+6k=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Y6IlclSwZEwjvzlrotTzTg9/jP3o4WKb0yKLocoHYB3NjUJ7nZdfdXCpaYabd1Ys4
	 O1rPliCoKck/YUvPuPZmf+bT2+52LYu+XkCnEw/upzh6IyIu6TSSObQXyXveHhS43l
	 FYh8RxGuH5swIeSe/uYHFcFk1f4Al+OqZzrk02eQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 925E3F8027B; Mon, 16 Oct 2023 03:37:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC64F8024E;
	Mon, 16 Oct 2023 03:37:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C9F5F8025F; Mon, 16 Oct 2023 03:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27CA1F80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 03:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CA1F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=l1F9RJZe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyTYJWbFYRAEb4eJWcV9ecVhY/MdWTKeAnhiv+F712vW0VEUrgfWnzf2GAY13hDd3OuFH7OctezqoabvwBJIQVxQkrOUJXh0L1kX7dw8unzS3yXFmdvwjAqYD+QSVzyvxKNLbZ9rmRhkEnCH+fLvKlsi3ChkgRrorXE02M/7H8oV1vXlhqcV8eXNuvGv6+JkfMkqeXhyAThPfFEipY9CS4qPIminDi7IEa3lXGa3tIwx1YEZgHkblnFEnCmovrY/sKmnsHFqCuJWRQ1I+4oN/Fr8yeBs/oHU4O+vyGPXyqmS4uDBLQIRFUf/N+X0PyEK9gJBsVKhB9bl3ng7j/cJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyHSX6TkNkujBJQP3tbVz0PGOK1lfrx5Y9A7BNTqYCA=;
 b=UppMAI2sFKb/pBwnuCsf62+fDCksSjN/FG9Rw6mYjBNmKeTVsVH12eWZRAhpnCmKheStDXJF5W0NMtSeIrZPgNjqsqfBrNhj4mvF6hDvu1/HD9pXWbbd/+qushV5sh+r+ju64KLVmDumRwyReYl1imFN8dy2CloU0cUngg8ZuTAncT0m7ndDVOiSCazCFh6Gb5cU4TJw1Da5kw3nceP+6toG/WM5kDaSouDUudYbS7reWlKrIiTtqWmxDYVJ8VlZIM9+r9JAw8b3EO//PsrrvXtSZr/JBOc0WMBTvZNp6DTmS5rd9NgAvX7gbVMgbvr0VQOBCwICwYwyMr7iL3Nh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyHSX6TkNkujBJQP3tbVz0PGOK1lfrx5Y9A7BNTqYCA=;
 b=l1F9RJZehYPzAxR2Df476cVuzEq0V04StIqsIVWp0aAebxmLOyD/RgbWUQ+xHPOz1eA87ItfpEvTC4dEgOY5FH/YfrNA8k+QwdKa/3TGK95wI/L3wQ08mAA1vha0HGLvGv+2rA0IhqKijxGxCcJVGHroGVHHorhNpC1qhTC9pkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11744.jpnprd01.prod.outlook.com (2603:1096:400:407::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Mon, 16 Oct
 2023 01:37:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 01:37:21 +0000
Message-ID: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 0/4] ASoC: makes CPU/Codec channel connection map more
 generic
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Oct 2023 01:37:20 +0000
X-ClientProxiedBy: TYAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:404:14::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11744:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5c57ca-ac86-4a9e-772e-08dbcde870ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VCVFo4hb6ecNpYZdxMRcM5FI8wYV8XrfTuMrAHtRCadHzLTnM1kruK4G/QqXR5y9kr56IV8znU9Glc3EwxyTziI0nrXbnhVBBnVBMRcgy07a9/uTxMoN10LS0AR0YgfktMvUdPeK2SRQv+GUFscQumo661Ujr7nkN9FPFZTrjs25fZ0wOaJKNPB5FwcM5ZFkIrXtIVU6n9/KnbsJaGSxJPNbeLF024LOfAgWahaxkKkya3G8i9pYkkwa+PwVniVlHk5MZ4r335OHTdK7qOXStC2Wm7E73LNP/JcqnJ+5YcGUrD0GwUCClJn092/GbAKy5HEG/uDBABOwAnrrEI0zYwn48aXyzF1drGPwaROn2t5F3kX/kqzuPL3b9IllDlH4IPKT7Q9uJ/OiARuaqXj1EvIadvxAhkDXirGId9SUzRvqsA68aNpAvX+3SeeH91vBnYH9s56+78QxlauOc/6dh0SGO8RP9A8obLPvYhPrzB9hr9L4Ljq+psxfIHsVk+/qvXOtbQSqMICd5bJYpvVljhwVHQMVDSQ4z29dEBxg1YbZmTZJS+md/704BwcexAQAkt1usBls/QGElnhXX4mKbiUk6X9PHMetpvgpAmCHCKg7hq7mYYMjKptjH9Fulb6O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(966005)(478600001)(66556008)(6486002)(110136005)(66946007)(66476007)(2616005)(52116002)(316002)(6512007)(6506007)(26005)(8936002)(8676002)(5660300002)(7416002)(41300700001)(2906002)(38100700002)(4326008)(36756003)(86362001)(83380400001)(38350700005)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+sRsw83NHk8AlbpbPfm1mLuI71GnBFw+G0c6YYZ9zHJnpLmmHQ0xApPCjrBz?=
 =?us-ascii?Q?chUggSKfNSSA3fsYlmD0Y5PUCo0CqCZMQyMsYhOBi068othYcBI8mMiUyARp?=
 =?us-ascii?Q?9b9X14zdpo6iKWfSrQSLHVD6wMrIlCQSl3prnqzySJcBxxnXFfh4SSyzNlPQ?=
 =?us-ascii?Q?kwKu056ye27LBYaTMU4qC52niTX5KNtQLcWS7IQWyqqsLiGUKrU78AvFli0k?=
 =?us-ascii?Q?jL0TVzlWHJr8p2PAvRrcppw8lcbw4Xeia+bitwT4XoFNfeHlRh/X52e3fTT3?=
 =?us-ascii?Q?mM7RdWa3Px1wEREjaJDI9GUBohhwKmNuH6R8FwJ+kuppxM7RdjROU6545t2m?=
 =?us-ascii?Q?Q5LTr6/lzl92eU9C/IIwZsEjBjjopbrkEsNesMFLkYI29tOgsg0IzSLhitaS?=
 =?us-ascii?Q?E4hJPlJUJVMFPx/sy3dBvCE+8brEvagnNOGobvvMnihTh8uqO8ZqzFZ7kpXL?=
 =?us-ascii?Q?hW1kFD5w+MoPsj6FIt430fOz4o3mcdKMi+E7gTwqdULavNtr2YqSwIq/hTiG?=
 =?us-ascii?Q?rKDAdzD2ugeSKHfCMdxH+2X+T+hBe01Z/l9nXKpqG2FVqp48VjwtHoCshucn?=
 =?us-ascii?Q?YGuvBjSlm8FjyTiSRLUrAh2RkotQ7p/kJpHmvWHBqFxmDZk4W330U5ggzLjp?=
 =?us-ascii?Q?xB9J3v/SId6zNcJCs9MfzfLH0Ygr3I4w+2MSGWz+PQfRCVOCUCpQ3NyZAlff?=
 =?us-ascii?Q?a6vkPavgLXHKXOXvKc+u91CJNdLUu9j4Am02FpSOFXavUZNm9e9/TRAV6R4z?=
 =?us-ascii?Q?eBzcZwOsDRkqRic0tu/m6yXaVE9LWq8KAoHfScHJuEAWmESJcgX1jS91Lldm?=
 =?us-ascii?Q?2MkoVm//3EQa1bdEFHRVoQwC5LsLgxsTRmp8K1tI9Rp3plXf3qwnJc/vHyri?=
 =?us-ascii?Q?VoXvqqnMXAnkv0gc5kGIyiMig2miscW+Uno381YcY1u0nPphWaiptQ97BAiP?=
 =?us-ascii?Q?Ae9i30Yr3amJ1R7keu2OzUnjq/SGYXC5VGart8cS0REEY4QkZUWq78WMKWtx?=
 =?us-ascii?Q?1k0ILIGBWDgFNeJKxig1IGpv31xdjo1bFiPxsf0GDq2u+7Nom4NC85nnxk9N?=
 =?us-ascii?Q?xLwQLBWNIeLgd0wfavZrAmMehH91ls7Be8PUzyo2TLglbeA79SdfETiKOFIQ?=
 =?us-ascii?Q?EL0cCFOVx4VMzRMBvDbjXGKjkFHregE/PA8IfU/cT6LOGIdZHbHiRg+iJoT1?=
 =?us-ascii?Q?T5sQjeRwk0WljD8ED/S/A1wCLqENST6kWcAsST8IGW8TFB5O/CtUjRWh2v1+?=
 =?us-ascii?Q?9P6oAbEAwHlx2pMAmVVon7WbI1/lvKFMmtMJC3i3PIytYoRR4VCRIM2EkYsI?=
 =?us-ascii?Q?NlWTK1KGZOCpP8meJg1jdAxCxzvviP9zwwv+y1T+Cad79X38HdiOu62NorfI?=
 =?us-ascii?Q?CcOgoXwodaKq4jhBzBGcHmdi9OMDjzYJEUEa5PuhJdv+3xc+Of1/W0z9h3h7?=
 =?us-ascii?Q?LsSqbE0UWAK3u1eukFiLFKWLey/IGmF+5K01iOTWUtHPMfD/yn1FY6rAjDZY?=
 =?us-ascii?Q?VnN2YtPpn/TPyAwx/wfh7T9h14Kmaa0hv4fkSC584wLeNlPUKwbp3SfPnFof?=
 =?us-ascii?Q?wClox6xt63L7EHhlfcTCR2I8qRuTmHQwXrcGPJ5w5WvehbsIO+n58Yv2hBDy?=
 =?us-ascii?Q?DWEC8iVTYcwEGrLix5iHLao=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc5c57ca-ac86-4a9e-772e-08dbcde870ab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 01:37:21.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ND4X98MwG2pCNbBnd0xSnlZ6iybI5TuVh2wLAuHEfSRSH9V2xk9E1Pc+sPAV7WiQSO0pZC6M44QM1TtSTf40ZnBP+9niJejiVklUKPhWSZAloNWXPYI82IKc49H7MG96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11744
Message-ID-Hash: K7JJTUVQQ2BODK66DSPHANINDN6X42Q7
X-Message-ID-Hash: K7JJTUVQQ2BODK66DSPHANINDN6X42Q7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7JJTUVQQ2BODK66DSPHANINDN6X42Q7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis, Jerome, DT-ML

This is v4 patch-set.

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch-set expands it that all connection uses this idea,
and no longer N < M limit [1].

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]

This patch is tested on Audio-Graph-Card2 with sample dtsi,
but needs Tested-by, at least from Intel.

v3 -> v4
	- add Jerome on To
	- add "description" on "ch-maps"

v2 -> v3
	- tidyup comment
	- use more clear connection image on DT
	- "ch_maps" -> "ch-maps" on DT
	- Add DT maintainer on "To:" for all patches

v1 -> v2
	- makes CPU/Codec connection relation clear on comment/sample
	- fixup type "connction" -> "connection"
	- makes error message clear

Kuninori Morimoto (4):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: add ch-maps property

 .../bindings/sound/audio-graph-port.yaml      |   8 +-
 include/sound/soc.h                           |  66 ++++++++-
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 sound/soc/generic/audio-graph-card2.c         |  29 ++++
 sound/soc/intel/boards/sof_sdw.c              |  14 +-
 sound/soc/soc-core.c                          |  85 +++++++++++
 sound/soc/soc-dapm.c                          |  47 +++---
 sound/soc/soc-pcm.c                           |  73 ++++-----
 8 files changed, 368 insertions(+), 92 deletions(-)

-- 
2.25.1

