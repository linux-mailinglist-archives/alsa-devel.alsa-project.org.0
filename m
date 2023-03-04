Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52D6ACB36
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:49:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B824A11B9;
	Mon,  6 Mar 2023 18:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B824A11B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124944;
	bh=gDrkor2XR/HqmD/iud3o65PhGUajLY0l57peako2FDg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rb1Doojskm7Do81+BIDt0hADhfX7msb+fTJe9PCCypKtPn2uSGe1cIY8vqlhUkI4I
	 0wtodD2/M/PCvhMXJHE3JCNekVbji9yhv9ZSZL49XArfYavEQh7vODTkstP3AQP3sN
	 26yTR/huek7UkeyQAGbrmC0ig09sZVoDkDAHB/Kg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A26F80608;
	Mon,  6 Mar 2023 18:42:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 345D0F80266; Sat,  4 Mar 2023 22:07:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C40FF80236
	for <alsa-devel@alsa-project.org>; Sat,  4 Mar 2023 22:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C40FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com
 header.b=BYwYyrt7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwMzCWwNuZaiVBVxkyyvt5G+eEhi6psBRcey8s+EzqATRSwdIDj+6eLANe04aClMhYBoTBghtXWI99Ehgie2gQbCA7qajQDKg4DpbSfqkbC8R5OAoCd9RUcVM+fS8DSQJODv0aP7uiSJQHjDVNqVhUGWTWFCoesLxdhBRYIOOXjJXSeVOlP+cNC1oVrcvKpCXZ4Qm6w1LewN/YCCoGOop1M5hDh0iQU+4zOkVp/qo3CwRDmeu5pd/lgiZCM8Gg0Y72+CTFdleeYzW4SBJ2k0KbGSLdnYjviEHlOB2x1WVZFa84cKmdW2IBdrEU3oymFoItVPgx9l7jFGHN/+hQZKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xp7wc2UPNF5h4UVQvNr9FWEl1Upk/fI2SAMwERvC/k=;
 b=T9o2cbRCOubcv52KVCYExv3lfVrU+rMzx2z9AcHUznOBKrirWFqmUwCm8eOr7N2npFV0P1tvym5LE8SOsG3QiUfn4PdxSQRdO/mYxo9MQD0HLU/yRTI/VEDpnKPU81BdjOV6Up9L0KiyFztZucPPF/17Hxg7Bdwm5xym2i8j1i0xWsSoarR0Qs/TWEkLrA2WVXiFamQc72nyM+TeaCzhrS5pgOGhhdYBRHhUAzua9ksPysh/El/2KtAxTKDLaWcIH0oUBurNbZxpOxXuDfZgSnuhIqghHUEL0Bwpz7CbZN24ZECGRqBzClpMYJaelX7Upqs/9lM3n6ljVfK7oxbzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xp7wc2UPNF5h4UVQvNr9FWEl1Upk/fI2SAMwERvC/k=;
 b=BYwYyrt7ZMuajcXh6sUlUgdZE6Z3VfWSQhhzI/pKi/oWV46mPBdzNrN/Kzeu1JEHaLt3vpQB59kRUeielk/gG1RJzijLJ7tFZKJ2lXz32M/YBi61fcszIdE112YuF8ChZ0NpqYXfuAJ0ItDAuKN4Va7A+qAcd7rJBULeAEWsD5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SA1PR13MB5053.namprd13.prod.outlook.com (2603:10b6:806:1aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Sat, 4 Mar
 2023 21:07:03 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6156.025; Sat, 4 Mar 2023
 21:07:03 +0000
Date: Sat, 4 Mar 2023 22:06:50 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
Message-ID: <ZAOy6jNd3gxBYCcS@corigine.com>
References: <20230303214223.49451-1-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
X-ClientProxiedBy: AM0PR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::25) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SA1PR13MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1b7f64-5a59-4a1e-f3e0-08db1cf46686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JU7IdMmGwhw8uvFM3cMrZ8Pba8l0SY2CJnj84em/zrUvIjMU1sO3NkvRAErfbZ6rWISKNs5oSKMcsErglh2h5Mq94XmI/5MYWTFYzllZzt7uENwwMAD8XOiBAIRcoJJpX+d94qmHZAj8vtVaj+qgIjPZGRoD0nsEvGRqlHbadIsgGiUV6+ONx+wzU+ZHqqYc57q4PGxFW+7gE2ims5ma0gdSwmpqQGoRAPsJmFICKSjh+yWA0RvC3GYzmHc6Ueu8xwEXuDqW0t+YdPOmBig9/ozp/W710eRFDKABhMmuT7ncPdObwKCItbv65Qegry+ckpRZH6IBy2ClG+zIKWII6lLy9hE3FJ64ZEJzZIiWA4fS/jjgEsNR7zQzNXqgskd9cGjslh1wy7SuTqgvc9qwQO5sG7EFtX9iP0iiyyOrydoWhZfPibPEj5mE2mJv/NILDCrLEabCrgnxM0hBh3b6vV/eQY7i3FQnnNJi3brNIQQ7TaNKNXmNTrcJjLOoHjSHKAWXKkuJtA0bkctE66jSawDStCwAE4yu9RzDg+6UzJ9BbTD/B/V6JTrwpUGxRsgu++BptLeSWOVOodYyWNxosXzBh9gTxyDlXEuqzZ6oIRSGcTqTgQqzB4HoP8ikCpe4ZGw3svuFyNal6Rffkxx3vIJ9BiFCNfzk928mWedVnhLCUodK7p8S1rIdfNQvWepE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39830400003)(396003)(376002)(136003)(451199018)(8936002)(7416002)(7406005)(5660300002)(4744005)(66476007)(41300700001)(66946007)(66556008)(2906002)(44832011)(8676002)(4326008)(6916009)(54906003)(316002)(478600001)(36756003)(6666004)(6506007)(6512007)(6486002)(2616005)(86362001)(83380400001)(186003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+Bx3g8iaCaq1gYTwgTVzuxl0pZo52aXpGwKZp9UCAgJB8m7+fUP0cQlDtvvp?=
 =?us-ascii?Q?NUDnShiUkCXuYiSrKgS36+I5dMZYwcbYMrygZsy5D+LkKnKVRjwvmvJB6SxC?=
 =?us-ascii?Q?VmxXf9JGrLSa5HKpmiSGYllBbKj11vLRaJ5L1b8z6oA2O+CfPeNERfmdUzwy?=
 =?us-ascii?Q?Ydc5DM5fuR/QexYbAtsZ34NXSMJ5JGj3cHXEgAn02j1rBVYcz+J3sQvQ5v/H?=
 =?us-ascii?Q?5oV2LuLnDdYNNYGwlxz6Cgf/+uWPdEqUBd0zCg65F2WxRqcpOZODOzFh6gKy?=
 =?us-ascii?Q?VETriMFVlKGBz6ebGiygK5xujpb4zahKa/c5KfzG5zOT8ZFKL4OtaFDq4Ut1?=
 =?us-ascii?Q?7M6vmrvvDUm31WnZ7FfFkWZ0U+wrXzhKGidzktkXNjYxG1gr1PB7WhUapNZZ?=
 =?us-ascii?Q?v7gsST2WiGsV/E4N6ALiCPLAwrBhyYCf6bZc/yzKyW6Nx/uT6Rp8I7tUlhQ7?=
 =?us-ascii?Q?7uYyaCwEV9eJOhs9ocCil3Q1AI29u92Fgg7n+YnNNfRgpB2JQpsgNqcL9gWm?=
 =?us-ascii?Q?p3mSngYpmRp+PAp/6WInH1Fa6cEuUr+RVqEiz9MU50BDspw2oWbHG7kNWQId?=
 =?us-ascii?Q?TjAXtmX8edRiStjuc4fkBygPT63jNps5ncKdyhz308JlDxUE+9/3n6EHsgvT?=
 =?us-ascii?Q?+vy/Pka+WpLujr+DuWYoo6A7XsuOiRwsCOFcgzswHaFF304zalOkZ/l4Koby?=
 =?us-ascii?Q?b9XAKNHBfzQPUvKHifZYuC+eV5Cslfek0UtaW/HDh7o+8VFCBvT/9HsV3ja0?=
 =?us-ascii?Q?zLWIRebzcnsRTGKFfFSgMY1GdVFxS0jvMNfl6hJRQ2npdxK4twPsbATKXBR9?=
 =?us-ascii?Q?EZn4ZuW0m1/JuGhHa1DPB6jRDshA9o5AHNKYVjzWTn3VA2Zf1bp3UZo9q9cT?=
 =?us-ascii?Q?iiTkHrSHyXWS/yVyPkxw0wyII1IrFT5uP5cX8B2KomXNda5Ol6b18C3puxmE?=
 =?us-ascii?Q?4aX1V8BoQGn47Tf0t6GnXYgHobxs16WWxxQca4FJDTvTh0agT1HDpBq/2c0O?=
 =?us-ascii?Q?VpDDGEnbNjnz5NRxucsYOIiBdjF5g/kQVp6bcGlg7PDNL8TCTh4GO8UwWezM?=
 =?us-ascii?Q?LpDUFhSu3j+B9FnggcJ+8mugYLDuwwkrMfddrbeZ7Q8NzasnxxEcS+ObOJox?=
 =?us-ascii?Q?VMxN6HVc3wSY83JaGioUdjmj0zrvFp24E6HQ42a/o1B5h8i16raoNvg1ys72?=
 =?us-ascii?Q?D6satm5ABat3Y8LnUuAGYEQFrKe4IwtLTOPPitYfbaIn9PVm4PD58cR2KV0P?=
 =?us-ascii?Q?ViMsJyRhDFNaI3SHg85O62pKX4KEfume/hFyiKdsGgH/0Yy2oCYVbWgr3qm4?=
 =?us-ascii?Q?uO68/IG8BLNpS3Ov4LgKl8n2852CunOYi2RHjhG+R+kfrZ99DMA++5lWl2mT?=
 =?us-ascii?Q?B2SJHZnSjcEKpZBiqaZtwxFcjwWFgwTyZHS6Lp28nRoh/E3PGU9nbSSyyNg3?=
 =?us-ascii?Q?DmuEXXx89tnpdQkowL+tzXT6oy2dZqHuXXIy7QE3OqM8g6HcsqYNroi7DWFy?=
 =?us-ascii?Q?xSVyeebOxfRvcR5wB6pu0V7eDM/VoTlzZnKvpCdf0fU3fr4SagBcJb6Wu1FK?=
 =?us-ascii?Q?/rbHYS/VejDG5uGbH4ElmUnW9gGp+5ws7XDM8msRZM+GpSy2rSe8XJ9ldk5Q?=
 =?us-ascii?Q?ylHQB5cEhzU8eUdultiUyHEon8JHj9uBi3Wm2BIA6RZU25UnrV51xs1CmgTD?=
 =?us-ascii?Q?vFh+og=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ad1b7f64-5a59-4a1e-f3e0-08db1cf46686
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 21:07:02.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YT9kAw83Nw+cGzz7lxlz7Ou9GJIp/WAGH9u/vjlxl9chK4/3ygGPEsiyFlysDEN3h9ARq2q8VAeI1Pmnx0XqgM0yAefg8g2KUppks4q1RRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB5053
X-MailFrom: simon.horman@corigine.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZOGMUTY3CMLMM27MSNB266PX4QVPUUI5
X-Message-ID-Hash: ZOGMUTY3CMLMM27MSNB266PX4QVPUUI5
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:42:11 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 03, 2023 at 03:42:23PM -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a

fwiiw: prefered -> preferred

> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

...
