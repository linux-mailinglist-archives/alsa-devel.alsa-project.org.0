Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7F6E3CF8
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 02:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40463E8;
	Mon, 17 Apr 2023 02:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40463E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681691746;
	bh=ngDrBq78SBo9sEP6zGNIRoRnN+FxpgfTJMOLDv3lCHc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JmeH6rjSAiUZzPeslknxHwGXLsfIDMAs/SFoAkhAtub2+Oa+84G4WHmWfUq2E0r43
	 X4VK9Zq+xJtM1M0bqT6eaKhW3nOJEaX6R7L3jVlX42frkMRmrfv3alkRLhBZzILwui
	 IVEaAXTwSQNyDr18PB+lHTaJoVKU8yTHD1GAI9H8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA22F8025D;
	Mon, 17 Apr 2023 02:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54E06F80266; Mon, 17 Apr 2023 02:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0FC2F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 02:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0FC2F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MZHHJ72z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V31f9ssFrAsmx6emgBN8l1hgVNwy4/7mnexk1tRfTnIdeGxi7yl/TpDjjBi0u0+qaR0nrXHuOP4ZBNk1nx2mvEEuJ4BK8nuCg6kEWzmNbpRabqt05NNLTY54m9ozhQ06o6F6waqqD8czJlfsVLzYs2aoC2mZyDwAnWKKsfwzrKH9PJI7CCawcvWLcjENG/qo3bGQFkhEEOWdanfWvy2AKBw4SGgkNP6cK9+My85m8E7T/T/8bbxxE/8PvPBhy2DokCvao2lVpR/6hhW1xgJwl2j5lg/DGgNgpoxX2zleFSEjW8LnCwcIy1+8oa1TRDHXabPsA+4Dhiyf9AFmHt6tRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3kWiHTV1E603JSjyz1QJ74VYM3Ucg5A3DIhcLcQTUk=;
 b=hdHxrVHjsuRgdcqIC1smUF5wBYV9qUIrbwzDiksMYU4C88ZCQmCrgcJ2amqsdKiVX6cEQxdmAxt8drpyYNQh8cIUJ4lN4RMu+bgAY2wFy3ym876eSiATD5/b5UEn0yDoPiR9zmdB9CDWwjUg+bDrWVYzzOqzqBJre0x+nndd//KKrbC0dVr9kgLQ52BBMf6rw2wFJAA16PLIU4jiWc6aIKsMSOGPAKzLjLY1yPwpGrLAECpisSsXGXVSpXNetwPH49nsX6arrdMq2B4TmAKhOuo4/OkfcrWVtpG+wHIGF6Q8+pppTm6isXh18HiBiDCTBgfF1HKg2ncHfG8yKQwUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3kWiHTV1E603JSjyz1QJ74VYM3Ucg5A3DIhcLcQTUk=;
 b=MZHHJ72zHnbX0gNSVosNdzYA2oZT3/7YRLxC8nXG/Mdf9+7y1DiHBPCiGU1ubm49aTEL8N9FGih8gj91gScUe+rVxgSqJRWRtI/wHqVjkNvewLb0HslNFHZOescBaJ93aZT/4r+f96Br5vZ3ae6OS+5pfRI4ujNXSHya3XRQ0fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9388.jpnprd01.prod.outlook.com (2603:1096:400:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 00:34:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 00:34:34 +0000
Message-ID: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH resend 0/3] ASoC: cleanup mutex lock
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Apr 2023 00:34:34 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a89ef7-fcef-455e-e172-08db3edb849a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H9MkntNwaD5ZbGP6xxU9GCXm54dDhpe52kU3dGxrAn7nPIY81ukptbBqwtw5M5np24ZtTc3awgMI49VnB+ZexblYnf+1Zix7AfzPqdFKFT9LS+wlOCCyFr9fv28cr+WtAYDuzEZFof5E9jlauWdO3Ikv/hPh++t4SMCeVRuSLNM8NoUI/htML8elTfHYQXYnlb6llZDxcIustN4MfHYGruat+DNJTDFTW8MOU0QtPDNbgK17kWxOANyuIXjLzrkXSn/ZFJfRLQTULRIYZLZehRzD3ERF+ejJElASsI/M2Fvo2FpuTehsJOj+Nzm2xGC6YuwApQOzAgi8gfu/fzYTcxxjCFHjBRFjPdQ/PWbQorHmXk4XOr7hmOaJQ6QaS8MVfGzWe3/y8CseYek0zZ07AVtMZqGZCPxc6v9dxK7/Yx67WtPGwTLH2mQpqKiQBV93n4FxL9LeRuT6ZxUgu2BVnsUU/Tqe/IEVw9JSYqFe2rU6fjzKfn/Rw5BDUa7iDLRPxKrfqSlT77MeJC3vpaAttHGf15b0aDubd8YBoCGZRbvqKOGJpD9MpVZ1XniXKE7W7hYSaGcr5F9BYk7WVpURuW1Xq22IR/0G04SaNWmbVXky4H4oAb1E9QvMSDJjgMZF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(36756003)(2906002)(4744005)(5660300002)(8936002)(8676002)(41300700001)(38350700002)(38100700002)(86362001)(478600001)(2616005)(6506007)(26005)(6512007)(186003)(6486002)(52116002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kSsg5N5YJpIb8KOqkQisJ9SnxyF1h3EBqVS/fscuHp5WSliru9ZZEtgapc02?=
 =?us-ascii?Q?FClwZnFSrUH0qmg16s80eMW6BfRDdb8fjX1wD9M8jmrxAzIwod3ekhw2L/Nw?=
 =?us-ascii?Q?SPQJidr52EO9jQ96Z607cxA+PF+tUBvGiYy39ha7FhzIeXKBf6AGJjssoRtc?=
 =?us-ascii?Q?5acIzzsgT5qNrgYfSBdNyYQ1PX1kx5j37VzwZt/N6E+OfLb7gtJ6A9E54bIZ?=
 =?us-ascii?Q?OWYVvKn7c7kI735IJK46WjE0S8OfEefB6h7mKgiMHobgEfETQQfnXkLjikAz?=
 =?us-ascii?Q?8tgJmGk9u7Sykjw1Ho+6/9nwvyuRnD5R8DiGs4GOzNsdk80BRwdRliMkIzbO?=
 =?us-ascii?Q?KomDtyb0qlVCQCfb26Sb1ZiHKLLoj8PGsImk4uOjfpIbmi7GW81rES/KnSEl?=
 =?us-ascii?Q?mIaUfPO1JjguNeOXZKM29coPJwwayFWJin4aNIhyKHiSxjibejOY41T6CumK?=
 =?us-ascii?Q?3FrR6QNQ6HLZxmbkd5QLQq5wJ8WWagWh3uSWl0dw2cyMw5w4O/l6DftAVItW?=
 =?us-ascii?Q?ZHJKlDZb/GdLmfQJE/js5pckEzqZ+PQbRb9U2/EzwYKM6IMx5TNMbNvOV0Ud?=
 =?us-ascii?Q?QSm+0VTfmdc+0FzuRbJy24/YlFl4UjXRCWYr8Z2Js5L4C3nvBw1DZl1ONmUr?=
 =?us-ascii?Q?4C8jqVeAuN17rMEQBGI7vLUVdgLh2RBrr0e0q8WkFlz0on8hl9QCTl/o2/kL?=
 =?us-ascii?Q?Nq5h/Avs8ez0jZp+96oZLSuFFDkNY4Hm7gtYl/cXeC3uKx6wygedZa7X+d+t?=
 =?us-ascii?Q?adAoNnjbPtfuORG32Cnu9SNUfHYWsimVO+oasVFTrnpJ6tQXep87upJle1wr?=
 =?us-ascii?Q?MMKd1w9S4f5r8oYBQFwrsw1ULXFmCDTR1lyDGUjKpr/+EwdzjuGc4uXCp9hv?=
 =?us-ascii?Q?uKdMC1ZcSwUWjIqFdFZ1ik+tv7qq1x9WSEVoRrgPY2oIIJNKckcx5MGOvTFc?=
 =?us-ascii?Q?K+iu358EBckKwa8kN7THupYnE2R2qMj6ezDlKnoDcGwtHiXWu2JSubrXOkiw?=
 =?us-ascii?Q?mFAuDIrFk1haOXlpVEmcs8Dwue6GfS25D2cW5C29/U1yhYx0NrxiL2zTPqMt?=
 =?us-ascii?Q?LhPdbLRLo8OkiB3jRBZqcaDN/ggn5sKyN9OFN8wNL76dh2CMd5LFPKvA5G7Q?=
 =?us-ascii?Q?unQLt7KIwSqghjlTE9q/1i9rr/VsRNjMSvSwYhIEliKX7Jcp4IWOU7x7yIjc?=
 =?us-ascii?Q?vF137LsYIEe+MdGvEjds2xJifGaJHFogtsOKRjaBByDAY6o6/6O1YWYGsaTN?=
 =?us-ascii?Q?n8tzwck4DS8chIUB9ppAwHBPiaZEG+t0Y8AHFTSLEvmkAS3jbPU3UJ7Xxe0a?=
 =?us-ascii?Q?/rt03JaT5vAXGjnfdU4WljeL8PgSlOMFEPxyu2NO2YGQh5AC6svXzsA0YchA?=
 =?us-ascii?Q?EulePYAcb7jSXkTSNQ1Y6gf1OKjogVpPraVBnKRSLHIiwSvPnFYoIX066gT8?=
 =?us-ascii?Q?E7cOehCW37q28QtIdp5wJrklAJVJFn9LVmWZQrDt0royF2v16GlwS7qDjw6w?=
 =?us-ascii?Q?KRr1z0qm971Vyb6QUeaJSlsswGr4FRo9siYHYVk9KwyKQSeBM53djOcXeQYW?=
 =?us-ascii?Q?pm+wZUgGlfEgLV4LpydknUTgQr6TPvPbXkA7sUxQm+omloYKdYTWvMebMzb2?=
 =?us-ascii?Q?LGQngyz7TFbNu5acLwFluWo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03a89ef7-fcef-455e-e172-08db3edb849a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 00:34:34.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rn3Mw5OJC6Tr5EwlHjegNFMXvp/sP9vDKusjFbZn51+b4nHKfqid2y0nEDeuaTuCROheczdbt6UYPXCz27ncMuw1I70NVelZ03b5WVkw1JuZF4J3FcnRLXYTLUmMr55n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9388
Message-ID-Hash: WKPQAHA3TPQEMF3CXK2ZLZEBCWHUTVTL
X-Message-ID-Hash: WKPQAHA3TPQEMF3CXK2ZLZEBCWHUTVTL
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKPQAHA3TPQEMF3CXK2ZLZEBCWHUTVTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is resend patch-set.

ASoC is using many type of mutex lock, but
some of them has helper function, but some doesn't.
Or, it has, but can't be used because of static.

This patch-set adds helper function and use it.

Kuninori Morimoto (3):
  ASoC: expand snd_soc_dapm_mutex_lock/unlock()
  ASoC: expand snd_soc_dpcm_mutex_lock/unlock()
  ASoC: add snd_soc_card_mutex_lock/unlock()

 include/sound/soc-card.h  |  17 +++++-
 include/sound/soc-dapm.h  |   5 --
 include/sound/soc.h       | 105 +++++++++++++++++++++++++++++++--
 sound/soc/soc-component.c |  12 ++--
 sound/soc/soc-compress.c  |  60 +++++++++----------
 sound/soc/soc-core.c      |   8 +--
 sound/soc/soc-dapm.c      | 119 +++++++++++++++++++-------------------
 sound/soc/soc-pcm.c       |  17 +-----
 8 files changed, 216 insertions(+), 127 deletions(-)

-- 
2.25.1


