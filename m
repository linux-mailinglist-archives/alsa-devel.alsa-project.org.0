Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12BA7CD123
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 02:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7757184A;
	Wed, 18 Oct 2023 02:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7757184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697587790;
	bh=mgux39jKdt//vo4aATjg6pFB+zkrDYcLIKD5LCc9pLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ds9OB0gKuc3WBLlUGTvRwpMQm2CFyjpikSRxfw2AyXDKoIe0Z/M0yeIkklS7Jx/lr
	 n4fJ7nQBxbQk/CMLFUsRQ/lSHjOsBC3x411ITVzg2igJcsNAp+qa2Hvb8m2Y5oPu0J
	 nXftH8eruJr3SoX+HK9knS5kgHVE6N780HtoJ2fQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3A41F80552; Wed, 18 Oct 2023 02:08:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A835F8024E;
	Wed, 18 Oct 2023 02:08:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1E69F8025F; Wed, 18 Oct 2023 02:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D78EAF80236
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 02:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78EAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YuB8PrPZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGAxWfMk+LQJeM7wiQhI655db4YN//9fnoI02eGCV59retgCGHMDYBjz9bNdEuxdlRO+f1JFFNJd9VLyPtlNi/tTcZubN7v9x7wFlIUgmTmSYOPoTFg2Yx69/Knha61yRD1btbeCWNzQh1ct1uBfo33g/DmAC+Z0h9xuaFzWTe6O/WalHftv9gFXcsyKeU2AX1ZUg/yH+d1ioN2VnYsdTkEjOs7RTxKHnLUBc9v/UXjjyQxLfITaK2OZK4aon50LJNV5BcDyaM6QFHRt2PKNn0DmaR72vt+cpnkc8DsCNLIY2Pfy71JkcEuNnwqgRpqsy3AdiETWjWlx01c4USUubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h484txA83zdPC71g3cwMWGRwYm9jybhjuSxeAdV/GUw=;
 b=Vnj4YiITkszI+X3yvoujclsOGo1+aWfJE4KvFDi6VBG2/1Z8jYnmPuOYHNoZxwE4IrWoWoFxFpmnsL//uFqbsGpuXJYvSb7e2Dbq7OTtgntShunf4vpGcqozTskdtfyEXwLKXOgG7MmHWYClgoQGe8RoKJBG/f1M2acx+jUekn7OEaR3/ROWXSplFVI5O3ZO3jPw9G1QPpzZ42EkR3qCFazZPWfRxSUxmaqTiW5Yowih4iVbTzv1vBs0DfGPBsVpmEXQs9L8/oFpF10Jb3TKSW+P2M2Bq/ATpp1rE3P3dRAnGksEwrptsqW5b9No7+m/IEEZF4Qk62JoBtQLJWrssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h484txA83zdPC71g3cwMWGRwYm9jybhjuSxeAdV/GUw=;
 b=YuB8PrPZboWohI/bgqqWHNRLJeK5RXrYbnBfo4voOwGbR43jX2ssjKO2liN/4D9ZwayxlsyF3e1oxtoOCkijqE4a8k17U6M7Cuow2HqFcVNzjZSSP9C8h4bXz4xPmev/uIorZtSs4JG7pQOq/J+olnRUtq1JlHMIHezHeAZBPGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7928.jpnprd01.prod.outlook.com (2603:1096:400:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 00:08:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 00:08:36 +0000
Message-ID: <8734y8kd1a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
In-Reply-To: <5667241d-6976-4b44-8edd-79ee426415eb@linux.intel.com>
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
	<87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
	<d3c97c54-d149-4bed-9013-3f07bc6a7f52@linux.intel.com>
	<874jiokg1r.wl-kuninori.morimoto.gx@renesas.com>
	<5667241d-6976-4b44-8edd-79ee426415eb@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 18 Oct 2023 00:08:36 +0000
X-ClientProxiedBy: TYXPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:403:a::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: f12b16a8-48ae-4ec2-3461-08dbcf6e5fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qs6dmNSgGRrjOf4KTPFNSXxlJbNt+hzu5Y20lHsfVYJ40+Btez9I7WMKQBj2aWdox8yI/7BWayLg1BaL/wkyq8YO7U5X22Rvg6Mt23fHhqxUtoPSo5wSr95P3HKWpqzYOusOesiVy1aFc6I1UIut2WgTPFWXRRkmqRVdVNOdzPqLgheunm+/aPGePnrQRTwQG6b7e7vhy4AbHz1N9MCS6NLQjZ6G3LIqKLr0PTC3+u/ysotcbI+WEE4IfQfKpBAaHfi1ibnOSO4QuGeMNfd1yJvrZSKjDKiamidVkdLzmzmYFS6xckXimFaEAfR9gSYRVby04mkTw0w6eohbuiDL7hpSOGziq0H8lVFq5UPYY9+FRAWu69bCPJs7w1LK+T17i78z6NISIIf5KXVa+xnxsUPXdHjyyUTLzecZrV9dX7o1ATyb/6NgyCexhN8BuCbQtM3GaXGHxTw5zJyNs03uII9ke8xg/QYOX6uG5sjf2PElpTjtnuqyqsqbMzUnpif1Hstct0cCL9SVjogBkbpZvMQNM062Mkw8pS3cs7dtPjsnI5+Pgs6N4h9YvwypifHP+eI0Te4j4NVXSxg28eGSokZCk3OjJ/s5OAqJy2p06hHXqECAzr4nr8BvIj0GnAph89l9WL7zndduaKHCv9WPNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(52116002)(6506007)(38350700005)(6512007)(2616005)(26005)(6486002)(478600001)(36756003)(41300700001)(4326008)(2906002)(4744005)(38100700002)(86362001)(5660300002)(8936002)(8676002)(7416002)(66556008)(66946007)(66476007)(6916009)(316002)(54906003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9VRq5qE/OGUXKvFohivbqg3RaG/rCPRdC/woQe2Pb7wa1zL/kmzEYHPiVmfO?=
 =?us-ascii?Q?FqfkKoz5OuSG6djsYJpRUkENIO2/KmGkZ49KKZGi/7rL7jf4CDAWEMX7LSnk?=
 =?us-ascii?Q?8YT9VNOwY6a5pIOhRc9nm9zIC2BuBcGZaOorPGRCDzh3p0E1CzIRwAV3PLMt?=
 =?us-ascii?Q?G9MYLiWx9xCqV2sSIU9gwFbqOaMbtCI+ap4rw8eONkShkuao7FNsJKgyhs64?=
 =?us-ascii?Q?nrZVb3Mrl0r+fqDgube4qfB3GJBaMctFisemo9F144lYxkXN/boN3VaonZbG?=
 =?us-ascii?Q?wANLNdsPK7WjKsst4LYpD7HHQe4mo66IuNEx5XRZs8p0bzmorpR5d0u58nFB?=
 =?us-ascii?Q?iJVMnCRU9fOBZgTrnVMifcvbmUxP9ma8RDXzhlJ43r3jY47rCqjkyv4Y8lhX?=
 =?us-ascii?Q?0Ywq15aMDjPlPdG/7SJc2+fMUVPEU5cmbaRid+YXeJYShxvqLZAQZRtLc02R?=
 =?us-ascii?Q?qcjZnvuHOPq4fDcs5UvhEljnD3Xd96VdeAba4WW6DZiwy/5KhSiaD6qZ2PDZ?=
 =?us-ascii?Q?i3zeeloen0kgd75gqnaLqI/puoF1Wjg3G9+V93+spjiCkP3XMSV+GEMhdiL4?=
 =?us-ascii?Q?0iGCkUjGEjM25GxIACDoVcFJQTSYSzquxAWHykL+72Xl63+4x3xho8O7MGC6?=
 =?us-ascii?Q?5Fxip+Ov/oDx8ntI9TahNYspBPTkK1dffa+UVFnUj1BX1SKkyF9K4gsUh39W?=
 =?us-ascii?Q?pAw18nxf4BVeQlPOSH49sm241lJGgHJ+/LeWH28rAvMzSVXvFmqhGQU4e4Zh?=
 =?us-ascii?Q?LtnWD6VKGVlKvuJhl3de83ItfxQtmmsp69paAuWIxYnXlUdnPatsb/tZ4okL?=
 =?us-ascii?Q?mOGuzJ/FfE4rzpTYfa1/bb+EfGx7JV6rH9T+p+oEz9Yc//vs7OlRLTXBOyCG?=
 =?us-ascii?Q?4m/J1Amb4LRLbGUlcxHSrbGR0pprVc8+2Us73t5aDioluNgOQmQ717oUdM+I?=
 =?us-ascii?Q?90kUGTg95hrWtVk4JqamPnd4f7CWm7xXVgzJVN0XKZ0F/8cudL4qSIMbGBBv?=
 =?us-ascii?Q?0un9UjFklgGN/SiYyYHGzMqxyv3WdWMp0m3zlZT3avTuhCnnjGvL28uYwWPZ?=
 =?us-ascii?Q?BCmyKUh36kl6+nVBLqYuoVrnAqvN+jK8Zz/l47/vMGf3oXEByXClaktVGm0R?=
 =?us-ascii?Q?Sq8Ln9sFqK7MX0RSGX6OB0KBn2uojHkKxpZowpNTvyhK1QVn0zg7zfwmY9FR?=
 =?us-ascii?Q?d+oyVbhtVGawPtR3w6z25fYDUbOdqbd8FyiKZHSszNjWdTNGa6yDd0hxvAr7?=
 =?us-ascii?Q?FzB3W8Hqx3GpLHX+D1Pq+MPyMPOnUc1XXDrM+iv49zOBaBCjnFKnRaVXIt7i?=
 =?us-ascii?Q?jNuHB/kp1lD4MuJDIIJZ3C+kcjamRB/Vcgn5p7/imygUhvrRotUu+L0rv5Wf?=
 =?us-ascii?Q?cfXE6A2Iz9Y+wBuA2RrWuTXtJNwUhfzKdU76HQl7FBmZ+dNiOERXiLtMpaQ/?=
 =?us-ascii?Q?LqPyqonJRBQjKXlOaxc2k0vUGdqO/EN+Y32L3m2l7LjbjpxFYqS2itIOnxMa?=
 =?us-ascii?Q?MNrNddntxQQTLcVXH6RQnE7ym2N2YTfAbewuMs9rlmioWXzJ/f2pO6HNna6C?=
 =?us-ascii?Q?2UQci/22z4K8bcz8mgmzRjNSZu1bDC09aOehAw/9cEbDC7XBogE/Vr1ts4++?=
 =?us-ascii?Q?BBRZkLr6Z02aPLtSCE1cM/E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f12b16a8-48ae-4ec2-3461-08dbcf6e5fbf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 00:08:36.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ey5XzsQRSVrIy1NvXMcFXSu3Mf5VnUTu6kAMpdag61IGOwTKgWLhiUdWgk4VGoFNwcYaA4hH2+HFUsOX2/Pf+jlKoPhYzIrtw9UQu5dBEnsJq98GJ305HOF386SULdEm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7928
Message-ID-Hash: LMVGNEHDVMABRBVJUHACU6PCAGLUEQ6L
X-Message-ID-Hash: LMVGNEHDVMABRBVJUHACU6PCAGLUEQ6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMVGNEHDVMABRBVJUHACU6PCAGLUEQ6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your feedback

> > Oh, is it using topology or something which doesn't call
> > snd_soc_bind_card() ? If so could you please try to call
> > snd_soc_compensate_connection_map() ?
> > (I guess it is using soc_tplg_fe_link_create() ?)
> > 
> > If it could solve your issue, v5 will handle it.
> 
> Sorry, not following what the suggestion is.
> 
> Yes all our solutions are based on the topology, and I don't really
> understand the benefit of a ch_map for an FE? the codec_dai is a dummy
> one...

This is my personal opinion, but the code can be simple
if all case can be handled in the same way.

For example this case, we don't need to care about FE or if (!ch_maps)
if all dai_link has ch_maps. Complex case/pattern can be bug entry, IMO.
ASoC is already very complex system...

And because Codec is dummy, there is no effect for FE if all case
handles same way.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
