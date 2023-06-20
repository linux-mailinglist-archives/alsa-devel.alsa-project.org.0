Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131373611B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 03:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4B683B;
	Tue, 20 Jun 2023 03:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4B683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687224546;
	bh=/qHuNFA+u3ocSP4C/HBvBopxZKQ9DFyctYLnukTe7Qk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=brLovc0EVTWD6qq/Bu+wJGswSz9u/28fSgs+hDqeY4JaySq2uqqIp72V8GWLr+F8H
	 akEGDBVMPLh56aLtIdM15YS+SIb3tpFSsbmipvVkzfViOOEqQlgi3SstjRsbg/UP4M
	 MuvvAsEiTgbrshIKhC8+AZtk5GF6ZCYyC6qH1ejE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10D94F80535; Tue, 20 Jun 2023 03:27:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E959F80132;
	Tue, 20 Jun 2023 03:27:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36476F80141; Tue, 20 Jun 2023 03:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68B1BF80124
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 03:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B1BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MX6q3tzK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRt5XOeFaTpDFc+ZjdhF19vxhBVk7ixXfKJMbbqfmYi6+q574czpj/kS9Yjw/dsAtDixN+jvkslOeEp1IbohQOu6vwLTN3ybeuNwxPgP+UDDmO63X6UDdBIMS7DmuLrrnbumIYo5dyYU5Wpf/jxjqA7kSdd0Lq0w5vQ5qZ6PIEksjlU8Po2wMwvKsuKiP07IhRTe2nQvYAnANkYTSi0z3MLoHHKQQXK++Pl99fWru29JqMH/5pqVl+qMgyIhlmNait3Ycgce8QDCHX1vdxOh9C3ITJ4JtRQViYt/sdfoLpdmoo5pfYJZFcyyy34LJVtvyFRHXRRwIWdf5CeCrWHYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmdT2kjqYtAg8qhTTjhzPURP2VgrlRHUEEQyTT+6xIQ=;
 b=GdZQVhpNDYberL5UR2zumXDG5hbe0Hw8ymvwrnvYoe3dcP0hitcNVnDEnsUN4o3QOCQfhfUQK9SA4+mwtucZdTyjo8ztTMP5ulLRS9Bh2a5ZWUH7wGtA1fh27LD0K/l4bOwXz0uw2Tt1mcQeuRwqUxNaHlDgZnQkSvlLmy620PHPp/4w7HPTAC9goZFi5TRmxVzkFyIfNDT+RPJ6t+kqIIoky9sbxSIO1W1w+Kr9SxBQu8odgENIU/6DU8MjANNglRSyPVsB7NZKCvE/s8knVuA8gyK8U118mqTKcj3uQIJ8X1oNI9uOSc7yeMAVkz6CXQuQFc1NhIGgkyty7gRPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmdT2kjqYtAg8qhTTjhzPURP2VgrlRHUEEQyTT+6xIQ=;
 b=MX6q3tzKKNiPQVwEwnDL+2umL4JSIJGIgtMX5HKuohwXqocO8BLAAKFN3SP1E9arGP1UpPtmHghc1Zmi8AaDCtVXkE+20ISh1E2VMOZq8Nd6BGy0Kex14RKoFgrXKL9vIkWl1fslOugfTi9tNg8PbA3LK0TRtbH+/OQLCb6O8fM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11601.jpnprd01.prod.outlook.com (2603:1096:604:243::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 01:27:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 01:27:32 +0000
Message-ID: <87ttv2dit8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Yingkun Meng <mengyingkun@loongson.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/9] add snd_soc_{of_}get_dlc()
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 01:27:31 +0000
X-ClientProxiedBy: TYCPR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:3::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11601:EE_
X-MS-Office365-Filtering-Correlation-Id: a139729c-6829-4d3a-5a58-08db712d84f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k24Dv1vftXaE9ZV8m2zHqUc6x0qNSTyzLT4RUhrzEHIkSF3W22cwV92NbU/jb9FBhaBrqmZASMwJziodUv6Cybt/mKMqGT1fwZuwqAjEqmT0fF3lL8LiYYdtdH6VhRqnZuW00OwPMerA6eHYQS0A+nk4vyqPU/K5G9HJPJJN3DfrcOELdpY9Zb72FeU8+7nAxwhfbioZwQfax1YYO6h81PhFhPO1MvNr/gAWgy0zcYk72h3W6b+mqUlmRs7ygoA3f94v+t15Wnhw21WOKjgn1sGRFLobZXC/LnVLNIYgMhGbEIdILkuWG5MICwMt+EbwBCGfSTC/xYW+W9UFYbB5UU+3veNpQiPbMj+tdYKOcKpUMM9ffrTMB7Rx/5gKmuvpuag8cU0RKgH2pH6QM/TN/pPfG0NWFSWiFHZ3xbdRaDwQctKtiGzP2ZK4YdAaIO9yy3vD81VQsep87nlIVX/DeaTkkbOh/bapbSZRM1fHKO2qGB2eH0iWIUU221MsrU/n3uHjVCrNE6pnJBJ3v/80li0GlhbbKevht7aYmmxDg7QzTRGjcIyhTL/jDTSXkhr64lpUcpMODbQ20dvHTiPjrLYcx/fTcKXJrFTwITZBhDrlopCMEesnzyr7RrsDChx6WD9FwKMVtvCLEpYaGgCX6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(8936002)(186003)(66946007)(8676002)(4326008)(66556008)(66476007)(5660300002)(110136005)(54906003)(6486002)(38350700002)(52116002)(316002)(38100700002)(478600001)(41300700001)(36756003)(26005)(6506007)(6512007)(2906002)(4744005)(7416002)(2616005)(86362001)(921005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QdqhG9KE6/IRU1j6hpk0Enmi/X9HpPMhEvtVKEunk1kiWNwpkkpEv62LWUxf?=
 =?us-ascii?Q?bVraskwsDiBurtzakdpPVvdHQH4n0zkq4H+WozxmJZDzMs+nn5O13ClMMUnt?=
 =?us-ascii?Q?QPdYz9IUF8YShq9bZWwKAgfy4gJu45vDzalmNx75UwWlkuofK5qJ0cmK/07Y?=
 =?us-ascii?Q?9D1cQCn5WQa/wGBzVF142YtyYOmctsQ8O916Is0TnQxSZkAmb97ZnR5vJiG+?=
 =?us-ascii?Q?xxugvjnzpd+Lxn7GAqwwK1s44U9pfcZ1SWNOr8IwhN9EtABaeen2xT30xNJg?=
 =?us-ascii?Q?M2hgxDzU/U4ry7l0/CmmDbCAEyoNEZCV/XUYEZz22yZrM1HB+0NPgdR4oZLA?=
 =?us-ascii?Q?xpGhwwIddXKz44bbh4zJqbK40Zw70wsNn15t4fH2qEs1IMJVfdmzs4U8jAbb?=
 =?us-ascii?Q?+6csR0wHLpkGKqZCNmJ3g/pctTaHhkAhlmNSVlshLqrdhnXe3lmOmgQ8kQ9c?=
 =?us-ascii?Q?6g/yyWYVw0VOLdDCz2HURPgUNdGJ+Ld1SbhQc+MogGGCkse22Z8p8+S6vPQ9?=
 =?us-ascii?Q?ngZpc4ALMfldbzRSdjstb+AJutu0wJ+czmQLLW5U63H+dxfrJxz1LfLJePSN?=
 =?us-ascii?Q?E6LcqNduve64kudyz2evdVtGN1JsmZWwnuKJHVkJjo8zA5BrUCSEgHueWlUg?=
 =?us-ascii?Q?jgtGorWbhOyQQ6oboHih/24RtrBBN6RLzbz0Yeni14h/W4rBpLoh51JTZunX?=
 =?us-ascii?Q?tEjBEmpYbFmPYJ2w1XAlI42PVNktLDdRdpqxfEyjIoYZPLYRS4ccUXm6CGIv?=
 =?us-ascii?Q?XR7G4CeqChgnG5tuI3A9CEs/XhcdpBfIXWiz6flcZyIK2QLeidOqfCYBbze7?=
 =?us-ascii?Q?KxdZDFU7nVYaIcCriKoHeQZ5cfYpcSlzY3LAkXM93mWsx87ZCeC5SVWGC/JP?=
 =?us-ascii?Q?/XoGqVcx6BIwlcFCVIDOrIhF94YOT0REsa2TSlKl9itPhcTs4Tz2G57P1sX2?=
 =?us-ascii?Q?2wJppFZzwi6SILX9oSIoRQ+5yI3f39u4ZmakqjoVM2uhLoa/iWxsicIa02pZ?=
 =?us-ascii?Q?aOlyHmxU1My6etQlLeaucmQl9gIVWYJyzs3FhhTTfxxfo9qcCYJXVNkpFcp3?=
 =?us-ascii?Q?7bB5S3YvU1Kpb0p8sBPdBvnZvWh/MFS4qBXIyYhxw0UkSENbo89GNjGMseCY?=
 =?us-ascii?Q?iF1ZZxv7DuzuGDZIuHWE3RS2ki128UZVncNw20GUqS1GTUvmXRsuf7zQfZv4?=
 =?us-ascii?Q?IYRrMI4V1VQV8b19z2ptZqcq6RZvvySLGYiGQ66vAdE9lDSnc9esv+VQN1xM?=
 =?us-ascii?Q?sZqQs+OK7kGZPAcUMsDgDbOiivkojR5hv7PWgiACSZqjJCVZirzQqsq13FX1?=
 =?us-ascii?Q?KDp6pkyR5XHhtXM2f5NUgSfODE0m2P6WgOPVfl1OOBzI62n+M6jkSLqfex37?=
 =?us-ascii?Q?wydi+6PVJjf49kxSjSMyh+SfXmQzaDob7nQZPOfPCdWLP1uijU+EKFnFjObo?=
 =?us-ascii?Q?+V7MxcVwuLgrXE/uXbqjMxct0o8sD4rkFFjRVWiMypT+JE39QclODxWigFgY?=
 =?us-ascii?Q?4ajkK1eEd8JVeXYOXUzlcGvKdXGpOKp7nptO2Cb2wq5nJR9hEm/vKbw0rdQh?=
 =?us-ascii?Q?ztanjjCg5Ry7+zT7F4vG+EHdV4vYZ9ne2X9Bq87txRsK8Lw7eEPKSG8Xh68g?=
 =?us-ascii?Q?jmaXx66WEBtCRgl3EkdZ+Ts=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a139729c-6829-4d3a-5a58-08db712d84f3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 01:27:32.2297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aRQuiH9x2vnUcpOcRbHdAX8EKidjMdzB9NuOPsndpSfCMBuUz3x6hiH74H6P1RQSNCkmby1qekSav0LDhN2tCycF3HBmoiGmdrDuZOonu8v8xUuwLWEONlroA06S1nLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11601
Message-ID-Hash: CUTLBN26Y5BOPC4ZAEYBDBW4BG5O7IQ7
X-Message-ID-Hash: CUTLBN26Y5BOPC4ZAEYBDBW4BG5O7IQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUTLBN26Y5BOPC4ZAEYBDBW4BG5O7IQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
> for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
> .of_node too. Therefor user need to arrange.
> 
> It will be more useful if it gets both .dai_name and .of_node.
> This patch adds snd_soc_{of_}get_dlc() for it, and convert to use it.
> 
> v1 -> v2
> 
> 	- care loongson

Grr, I added new patch for loongson, but [2/9] patch didn't care it.
It breaks git-bisect. Please drop this patch-set,
will post v3 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
