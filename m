Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E169D7392E2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 01:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C4182B;
	Thu, 22 Jun 2023 01:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C4182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687389054;
	bh=dOH+SHo4OdGcd83BS3dGeGNWSBEiCCOI1zMZtg1E3fQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2wNf4H4hAZcnFlGY+51ZmqEmKmPcQDifViL3Bqly/+NfVJdCfnDSPs30eP6up2uX
	 zcw4E+QZR8B/edI5WWkGZKfV+cj3AfqOzewJZUKPZb+5AO109MH4eM96h2Icgh9z0N
	 aC+ocIKk1FkTQ0cUrRroDW49SFcoy0PwMHei4W7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A537F801F5; Thu, 22 Jun 2023 01:10:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3394F80132;
	Thu, 22 Jun 2023 01:10:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D660F80141; Thu, 22 Jun 2023 01:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8A2FF80022
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 01:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A2FF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EGcQO63E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQ1JtI3FcPAQp9Vq4AoMcJlWX0JAL0gesOF0xSbHEPFq8oNv622NDyYKQMh2EcjhBj1E2+317JvxD7MzF7BZOXd1pHvnGO74IL2og5D+T3cEmFY2W/KoehiZ9JgW9sgEC9PHx/1OZ4do65YwNHIX7WOJzQIkyK1oAtX18mQf/QYLVFHRtJWN/oeHGrcRJkLXOmWKBhNmWmVdmQNLOhyQ4l/zYghl2PY9gGz5EX1c1xP7+cARE7OpmlccWN53Fn6ytNAZuos+7ALMJgXgxmE4K4tnf7BTsW2uCFRgdXSLQSqT2C5ns+ka8G3X2eeC280gk2B9VSMCnzZUdnJAiNXq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5optzd9qppc+u/1wHV0aLJC/86huU+Cj3sBFKB2cJrs=;
 b=DRRNcHitcu29QalWikMsJx2isU2YQMxirz9ZRomnC2LWeXmHLi6GConOR1z5K10M8MSPclOnJ9ii9vGqW2Sj+nDF/iYCVHJAYLEczoztrL5MxR7tKod5iyXhZcYv/c8EovPQzgPAsscurgA7iOS2V/5MZHGUJuiXl4ICQxJ1zF1ZcQ1DXDiQk3CVBlPTm+RMv3C8H44USObA7qC3ZzI39QsXky0WFoqtao3xbwilKq90AVr/1jIib/EHrEfSqiS73Ls5vII/TS+Mrq72PafbMcFiVHs743zn67BT1m/IYPKNFALcsS0X46f5S8slAiDOx61bqoAHE5tsiRXIMXZcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5optzd9qppc+u/1wHV0aLJC/86huU+Cj3sBFKB2cJrs=;
 b=EGcQO63EyltTs1iTnb9KfttMCfNKtdIiun2P5C7PhU6DgN9xddwWyVxlvk9pOkROI9kxxcMEYPIYiT7CX4hVST8yd1tQET4u0SZC5/AAbDSiVYLdGXeu88E1Akhj6zChRx8z+wT5kXPv+SOD5ScNnJKvOiKM6LtAAFqEPyPsEhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5852.jpnprd01.prod.outlook.com (2603:1096:404:8053::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 21 Jun
 2023 23:09:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.024; Wed, 21 Jun 2023
 23:09:38 +0000
Message-ID: <87jzvw2z0u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 14/14] ASoC: dt-bindings: renesas,rsnd.yaml: enable multi
 ports for multi Component support
In-Reply-To: <bf380ae8-6d88-150a-9482-1fd89f500186@kernel.org>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
	<877crxblq4.wl-kuninori.morimoto.gx@renesas.com>
	<bf380ae8-6d88-150a-9482-1fd89f500186@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 23:09:38 +0000
X-ClientProxiedBy: TYCP286CA0309.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 706a96a2-e187-4e0d-9bde-08db72ac966c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AjAvJn2V6G50651/XS4tgah9FZYIAf91Bd/3q4f0EKIW+BdVDdB3ErOEbHCIZZMlaEiUZvk0720Krbwur8IQsiin7zasmpb2nh4bAPE8adxiW/ghjbn6wqiSTuhHu4qAk6+kFy5a4+hzFsAnTBZsh8EAxTwtsh++eujPIC9o1L53lWD0ty4YgF51A6P/hxL3TnTIABuMidmUQ7ig4fzJUm2OFbqN7Zqg2ZFrFPj7N3iRcQIG1WoQbPykBVbzFZ2cOIAI5sEC57pCY2MlmJT/GwBSQLkeFXuZZC8PV5cxnLUqxksjgmq2jvdLapZojsKixfomRfngEcjlTp+nkFXpDPJMW3Zh+rspbcT4qnYa5UHo1s+NhqP9NeihzadjETo8RW3kULRpm7UuXuswB5B6G4Zt4y5QIO6JF0irvpCkMzsC5c34tXlscDcmINokrr8FCqqO4xmvF8hxQwXI8BS3bHIAaPUnDkZpCEyEnBSHO6brWo8DoDOX9HgedkGLruO1Qoc/bsRBPzKQOIFXZYa9EeW++AHjd5XZsHGTifbL3wiy6hheoU2TQDPYoZZXlQ3zuTr2oXOaV4cXE/4S6vaQ3q1YpLAOD7XNYVtvDJ7E7U65x2dIdvgcqjJa4C0X424+W0pj5kqutGuUdVt43Rya5079OgN9T9hlNWBHy4KtqLg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(8936002)(41300700001)(186003)(8676002)(26005)(6506007)(2906002)(6512007)(86362001)(54906003)(6916009)(66476007)(66556008)(4326008)(66946007)(36756003)(6486002)(316002)(38350700002)(38100700002)(478600001)(52116002)(2616005)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hI6xR0bSx3HStXJQI7RYHSItWHCB8fUjQUrql1C3Ws6X9BM+Op3JXcxr1EIK?=
 =?us-ascii?Q?f63CWB9byxkM7cQhVinrMZkUaPxreXKPjg8B9DseQIB07KmPQb856YrHUreR?=
 =?us-ascii?Q?DyO5/OTUHFLumPGYpPzyF9a1p0SC7JSclflAdW8jYfh7wSDtxk29noL0TSxC?=
 =?us-ascii?Q?ocKuLIMJEZ+gYs3Nm+mdBYX27SjHYTCivLO9askJDl6s5jIJQZPN2mP3fzLY?=
 =?us-ascii?Q?GGfa6mypGTOGn2xmZuCdRl+Z4X5QoLfLx4asnTGGNKggnfSynmCb1KmzphYP?=
 =?us-ascii?Q?rT8AgNYqJXmcxFnhFM1dsOAl1wFINK8TH4mrs3xzHPGPp7WXXPn3cRocOY/W?=
 =?us-ascii?Q?BSbmTrULyG7kkPwUZKUntPne6n04vDviMZHBemIHyT59+31w2nmzTMfDq+Bo?=
 =?us-ascii?Q?8I+dKGY+RiF/juvUrFwOyUAG2MefYciJ9iGAx5WIG6SK4MbNMdo1ZghcQGty?=
 =?us-ascii?Q?VcDCPHLTyo1kib8O8j+24p2qZN62VwYbqgXJ9xIY/bhiAS99IJCDXVi0p6dF?=
 =?us-ascii?Q?pIni1UfOzADHji3Esly7OcDSus775p9PSFR+A1e41z7IkWRASM553WckacER?=
 =?us-ascii?Q?tQoulMNfF2Dj/FXkmABYATU0SJ8NMER5luFaazlr0VXiaP/uNE0plkWZ+rTU?=
 =?us-ascii?Q?wqaL/iHjE+ksb3wGB1D6NlhUgYvdz0cbdT9gNqB+8tBz3iX39hrJsB5PfRXZ?=
 =?us-ascii?Q?DamREbGNH2p+y6cu97oc5kqxc92Jo8RUSh5Mv5XYsTzQvF8jCXZwAgSlS4bz?=
 =?us-ascii?Q?FpeEL5DT9tOfyg3xLp5acdyIrJmPrill6jtXCXr+e254+ZnNrL7vUOYBL303?=
 =?us-ascii?Q?Q2x6S6zu64Q18/9ir6RJpFsNF0jMAzr8peZl8LK4spMNRleUQBtRxwAUuR3i?=
 =?us-ascii?Q?asOHc40kr1/gDI6KSx3AdnFND1UwvA2QfCV8qwACfasDeDhZRN6mai8fvog5?=
 =?us-ascii?Q?JPvbzgiWpm6wY+lKqcQcoLKSpA38uM1gxUn4xXPyjJVz1/ZnYcPO5vOK4nvO?=
 =?us-ascii?Q?bGm2OJoOR48bvEvFKJo0IvGTfAH07cRtD2f6hLdtQR0v6BGbQXu7Blm7LQLx?=
 =?us-ascii?Q?sKUIMclWRF/G38J0tFU3Jn6tKaM7teuYjjqcYsl+rTTSGDyykVxeO1BzDOmy?=
 =?us-ascii?Q?xsCeLLV2GRMT8tR4c8yZiiY/2TEwMjIRnZi7mFqCtM+DiW485Y4CjCz8KpRU?=
 =?us-ascii?Q?z4RmNOPGo2mouu5YYTnG9my1tmnTQk9ih/Ibz7vfVqKS5RF9m3k1g+d/ZeZX?=
 =?us-ascii?Q?DT4yt05VNqgE3r9S60JNeLLNtAJWanq5+tWP5lzqAMZLRCbU96HKt0LmEv++?=
 =?us-ascii?Q?lRv04iz8U1owREnj2xo4CFWUyXXKXHjOP2GfhioWuBn7LIB0GtoUnVf4skYl?=
 =?us-ascii?Q?d0xuRr/+8/tJjMuul3YVmlNpf1YjLRtBJJfw1x77AsPHvqhyr5ypEZpwGg1M?=
 =?us-ascii?Q?SajC7DC03o+GzyPg+Wx7CetGZxdHcrndmgNAdQ0NxMhukhsbr5f71Mhy9LDb?=
 =?us-ascii?Q?B229gVXz5zkHyyysI1qf+PwvbjbfPZCJIwAWgf8XOWPc5QA+fP8xKqPbOWjo?=
 =?us-ascii?Q?hIuLbKM4WjqCE5PkI9tPYNJm7m+5EEEiOuAK5TRnESSiEg2zFcHKNRA4Zeh/?=
 =?us-ascii?Q?z1nXHhdu+IHr/swU7xPBqL4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 706a96a2-e187-4e0d-9bde-08db72ac966c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 23:09:38.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UpaF9eGOUywe/R3gidLgCz9GCe3vcEsFTxwHDOGd68llQyuSp8WSbsZNqEqB7lL/AscSHa7+H66jye75pMQk0y209eLnoKKxGDPnT6/kVUnxo2rmWFEq2cbmw2N7/Zwj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852
Message-ID-Hash: 4BUVSMI3MEYOAJONQUNYNMZUJYR5B62Q
X-Message-ID-Hash: 4BUVSMI3MEYOAJONQUNYNMZUJYR5B62Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BUVSMI3MEYOAJONQUNYNMZUJYR5B62Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Krzysztof

> > To enable multi Component support, "multi ports" is needed for Audio Graph
> > Card/Card2, and "multi rcar_sound,dai" is needed for Simple Audio Card.
> > This patch enable these.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least DT list (maybe more), so this won't be tested by our
> tools. Performing review on untested code might be a waste of time, thus
> I will skip this patch entirely till you follow the process allowing the
> patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.

OK, I see.
I think it will be merge-window soon.
I will re-post this patch-set after that.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
