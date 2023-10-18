Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E17CD15B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 02:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4AC84A;
	Wed, 18 Oct 2023 02:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4AC84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697589314;
	bh=q/brk5/BKZJnpFsm9cvHxXAJZw21GDh0ytvJnfB2UgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z8awrY7Xq66v7S3EvWO64trDZ10ALLIO4Bu1nk9e1+BkWspa+TNQIQgIO+uLOpHPS
	 I/JuoNt3SmkZyPb5Sr2m8SF6Jm2VZRBRAqRhqr8KCTPtwB6py8Ake2oeJ1WpFWU05C
	 ikFZzJhRJaGe20jM+KmBdYEcPnFr6Le9rc19aKAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FB33F80536; Wed, 18 Oct 2023 02:34:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB4DBF8024E;
	Wed, 18 Oct 2023 02:34:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 043BAF8025F; Wed, 18 Oct 2023 02:34:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EFA7F80236
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 02:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EFA7F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oXMGU2m4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtFgs85i5Pn00xO5b6uP45STppA9N3cHja0L+vFifgxn35/Ylgma4MjJJ42fdQhBnB88OHLYocPa740e+gy/BnK6aOGJaIjidKXhgc2GU4j79nJZrPyiPINgRLud6iuzZJwloRSJz1tzA2uXk/wh+7vKXdYmo8aKx5OJBqjgagc8TwKQk3a1+KwVf7GPWURVh4YeDFYDjsPnSrjKP19kIjJBX12NataBW/yhilnhiHF2/FEXiuzpcSy0VcSd5dvRJuF7A0FLPf6vMgEyK6PbYxqctiiOZnrLLotwIuLA90MUewiacgsheadE64vhxIoI0CxTHW32IQLZWWG6BEDw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/brk5/BKZJnpFsm9cvHxXAJZw21GDh0ytvJnfB2UgA=;
 b=DXnaWf1KDwDTMUO9pQgRWcP1OCY9MRF2LvGPF9N906tPkbjA+AJ/98ui/YWVaf3syVpcPoTfcYEkvMd5AcLEmSAjwilzf1ws2uHTa2JtD4nH6vr73SdV7KkGa4NxEuJWe2UQdb4m3AA7g0tjoPcc6ogCrVYNUGscl5HKkpjJykBtqSiKMiLodi3tpQFO3qjQTZytQMl+UTRKH/0+Z8SwaHNffFF6HoYkh/nqs7mlZgA2/kHv/o7XBTKcB7hiQBeK/vDFQiTeGec1PWWYceSMbjI3slWP5H4e90aM3HSCdX4KcYQf2VLnBjrtM3OZ8GIJR8bUiXyJ88cDVPlHLwQcQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/brk5/BKZJnpFsm9cvHxXAJZw21GDh0ytvJnfB2UgA=;
 b=oXMGU2m48YVY2Ewlru8s4vP0gr2W53EUXqHC5oMAOLvnNfihAYDrJflHXpfpErw4Gu2vrlb2HXD+jTjKxGEwa2aa20l6Y+AN0TRXdknDOWhNKBybrDbCNlyzYp7K+zCVzlRbSH+CcQNa+15DOk8rmK6O1Jl1SpH1qNW3dL4aslU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB11245.jpnprd01.prod.outlook.com (2603:1096:400:369::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 00:34:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 00:34:01 +0000
Message-ID: <871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
In-Reply-To: <20231017-darkness-jackknife-5cf32246a079@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
	<871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
	<20231012-storage-directory-548905001d10@spud>
	<87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
	<ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
	<20231013-planner-irate-8e411cc54a48@spud>
	<874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
	<20231017-darkness-jackknife-5cf32246a079@spud>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 18 Oct 2023 00:34:01 +0000
X-ClientProxiedBy: TYAPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB11245:EE_
X-MS-Office365-Filtering-Correlation-Id: ba58e22e-a4bf-4cb0-c51f-08dbcf71ecfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NfPKnIS9eQy5cpvcYcSjTwV0UOMNmRpRyPVL/+aQIXs4WmZmPrBM+jxbUsf6ekLw4xr0/+TzwkG9NYTjt3EqtYYQGIVTwMtKQdredYb3zg3zl11IRoWoEXWhwGFsrWzMH0+QTh5+rltGZ+6zNHpukXA0KFzmPdE4M7nEZVNDUnjpl9IfcbSGlkUSuoP8uZdIVgp26hTiJfn/Ri8HKqGU67arwiukYJrWt/rDVwmoVMhP0bm+Bzeg7Ag6BixcatH6iL4IBrquvpKhAJBiGsTDes5i7NfPWD6JGX4wwsMJ6B/eL0v6jG25ldmIxo6AhHRm6dcV0Am1s7EW5+T9NMs6pz8fToPHTQM9+LygGSMUklTQLC0GoBg0J1W4fZjNuLg/7RxkzJr+vy1Y4ONovUpagXL88cPg86NPQ0ZqvsxbqwEIWgNR9zMrnShcp3lbmmYpdzJ+hLaH8qG5YDLvipKA//wzZhdjXTXvFA1YZelhk+RoqYFr70m32mEnfRK8Hve6aXcn94N9qsuxcSyIqRSAm1CsHCTDGaiCMvZ0HyBYeCyzheVNN7/GwLAQoBK8OmayvKHg6n4VbVQSsFpByhhHJgP3RZFpVsiCWORRhB0R89WSfKIFnUOrQk+X0k2XmtFaq2Wb5LIbrv9Q8cw0WGLhWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(2616005)(26005)(6506007)(6512007)(52116002)(7416002)(4326008)(41300700001)(8676002)(5660300002)(2906002)(8936002)(6486002)(478600001)(6916009)(54906003)(316002)(66476007)(66946007)(66556008)(38100700002)(86362001)(2013699003)(36756003)(38350700005)(558084003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R6mocC8QxLM1DNQNt/Kg2brPdgJ81aOZDryrIw+kbrOneQYljdZicBAmU2sR?=
 =?us-ascii?Q?niipURK8lWOC/VxPGgdiyh9Cs6bWb8YKlB8cQ1vimqbgmpextNr4mJBPu9KF?=
 =?us-ascii?Q?g2YbQu1O+Ruvh5u8Y0bWcF4vVAGv7x8tKUl3La/1gsVjFJIw8TbC5nnh/BLB?=
 =?us-ascii?Q?WKBsJU6y9tTh5NdYzukkbAZVzMpR0FjlKan2cNvwZhovkyfX1sFYInGIIhPS?=
 =?us-ascii?Q?9nFHbhCUZdAUXsqs4vxy9wYgcBpoJkYlWT48J5vArxLlx1EnotFZ98lkznoK?=
 =?us-ascii?Q?RuQVrMm8Czfp0mEL9801BpW7AV5eLmW/7itSjssewb/BoAolHkSIqdeYEt2d?=
 =?us-ascii?Q?yZLTX0xM8VtpKfSVKeAetcsO/vK+pZM3JM8Jx0vb8L8G8yHF1DqbpzLp3zil?=
 =?us-ascii?Q?tgpYrFK8653xRS/huyqmIVw4oV/2B91ApDq/z+zgA04XIu2iqXVNM8qyJ0XZ?=
 =?us-ascii?Q?hDGHp3xK1ueWrH5s9pi1k7yVkQ1wR/1mPGMY6lZJIuthRANo4d+AaDXa0nbV?=
 =?us-ascii?Q?YJUWu8zw8+dOpxXidvtR0O7hwrrIXwu+A0bHKt2YLlPvRBSxBt50Aj6w9l33?=
 =?us-ascii?Q?Jm7XwHftTWMPbjUF2Dk/76a1CESeu84TV7lJHmOn281c0xatQgMBcTnhCsxb?=
 =?us-ascii?Q?qULTSuc8GM8t3OFJwZlD9Njb4BqODW/t9+1BruyXNaIvsu2krrugYPApdEUG?=
 =?us-ascii?Q?sOCa02t3itJpX5uIlYKTxXC1bwlB75Re4T9S8OYoRKoGO9uRXPWYbRwzV5F4?=
 =?us-ascii?Q?8Cw2whoeTQmYN6XZ/QSJzCY6LdvLBDckTBYQffNm0UU8UgMRxruZuDYgHykF?=
 =?us-ascii?Q?srg0vx7jZS90yLVgBSHbHE11qogFDhIDSxmHvh3vOCjOEFYuXcIC41gf6lz6?=
 =?us-ascii?Q?TrqHYMU1XyW+Bhm1IzUe2U899SBbEwPEv2MA+yLNI+sULnHDCImKxwtxHVkA?=
 =?us-ascii?Q?IQForytu1TfwvGoeBlm/foDgz1LlSYE6Yq1J3oVLGRoMzwZymEsAJC02huSu?=
 =?us-ascii?Q?8yL18vXilTG3b3xBvEp3nBAuvcXvGD5OA89PDrDC3+rXKB/yhNEo7gO3j6GV?=
 =?us-ascii?Q?KVjDpe4vKPnSPeMSVBUYssNAcHXqBUDF1eGa3k5T8iWVc09pou3VnCZckoPu?=
 =?us-ascii?Q?wt8OySfzdE/7PATKVbpk/vbN9D8NCCOQjqzl6fkZzKf0gjaTuZouPK75ivLU?=
 =?us-ascii?Q?yItRrK04b14EU267XmP3+vaXxruNLIXvWr+qNXtTYC/DrD8oawjx/QiDZ2xb?=
 =?us-ascii?Q?ukRAz2zAGGfwCRY6BFe0j3B21RY2koUf/gswUw0hsHVF+FRRiMYiNd5wQwv/?=
 =?us-ascii?Q?ZpYvB4rCwa/T/t0XU7QRrgkqoJd0OaAVbwIYal5pQnTjAPWZMSs9TSKL+SeA?=
 =?us-ascii?Q?3R+eVQDijXk7fH2ttbwky3QcfJDRdjw4j3B+14FtGfWK4BQzv2MCUYgAb/O9?=
 =?us-ascii?Q?Fxga/+pGOhzk4ZpK4xxzBHb7RBjfiMP+0jq+gV806GFsxtiotuFuCZ8AZGMI?=
 =?us-ascii?Q?uRJghOdhVfjbeTLiVv6CB3swntDeq8iRcMelz1md7XRgt9qWQ04HoL5oIuz/?=
 =?us-ascii?Q?/RRFqkc841uxVlikYEy0kbdTsw+FxAXw53/oWZWgg/DNBPodSAFe+xjk02rP?=
 =?us-ascii?Q?T96ZQHFdTdgcTcI6R9z1ECs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba58e22e-a4bf-4cb0-c51f-08dbcf71ecfe
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 00:34:01.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2wf5l8VUEWwI/ryH9tcdVq1uRaeVCe3c4tTp+wACNHkqZBrguZJ92HmErGvxYfKzY53LflLX5KBVdD+zAGtPuAosFkXEocBd6adqwidb+RNAj4EXqmILs3m+9l8IPwn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11245
Message-ID-Hash: 7DVFURLGZL7WOE4BNJKRWLNY5565CDXR
X-Message-ID-Hash: 7DVFURLGZL7WOE4BNJKRWLNY5565CDXR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DVFURLGZL7WOE4BNJKRWLNY5565CDXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Conor

> That seems like a very unintuitive interface. If there were 32 CPUs and
> 30 codecs, then it'd be very inconvenient for a human reader to grok the
> configuration.

I don't think such huge number connection will be used...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
