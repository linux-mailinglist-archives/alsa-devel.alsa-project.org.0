Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EF77D5E8D
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 01:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 940F61ED;
	Wed, 25 Oct 2023 01:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 940F61ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698188763;
	bh=jMSwxUaX7ScRZvkG4xewMJik+jY3quMOYa+4dV/QEBk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpW6A177Lk0Gnihc7Ckev6AHXIYK1uUJouKoEggSSGGdGGUl17BSXAXxSBI7EEEjm
	 9rBGx4TH54ta4hS2qi0gPCE5fzrZidY3ND8t/zgBtPXAezU3Iae1R8lxI9OAj30KJ5
	 pjLweTdeoITa2IEXtwOPG39ts+A2dLyYcK+craZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 496F0F80152; Wed, 25 Oct 2023 01:05:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 809E0F80157;
	Wed, 25 Oct 2023 01:05:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01568F80152; Wed, 25 Oct 2023 00:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D674F80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 00:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D674F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aW+VXqgJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGtv1Xtij1HhZkjmEY9gCtrv9GwacBDbnuBUNy2KolqlgmGDlDn9RecHGBtragXGVRJsGgKZtT5wIUKB0pkafOol5oqlNyWsfyrviByTo23mdIuuvvxh26EFhD9lz2xaSyPd8+5/EVUdVj2ZApyc4Gw76P0ltgHAj3WPATVoiWHAfAhILnfXdYITYdA0o3OIYWMDw+n6aEv7lkGckO7bwgBa7j3Op80towbQRdMbRTtTsOXhJOwOuUCitrU4OEXdipJdkd2TK51CqhOK4GuLSsYbu7oi2p8ummKMNC21qWRHFgH2a/mJrGD1c7BHCwAyHDbyXumrSYa2xSiqoWUIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pb4GirMr6TQjffvu6KxQllnOMBjwXIaX6x37zNgv+I=;
 b=iyxFAU7j2JnlGzqAiHrrERmfTBfVJBGhBIPvkKuLc4UCjxOKHiss5iesXlspTtNqfGcgbfXhRcIDoqv4Kha7jaMTYpHlRrsc0f2b1RE/bT6rF116Z+c1ubmRYGzUpp+dEmCJp43CQuCJ3w3aSuB2VP7Dqy6frxpQCJi8572T8+wbIIYzAYW2W3BOi7B3mbxqndYmBfjjBXocRlTxFVdhMEw21zJkigdLw2vvCxHYlNrcXjUf9C9sw2HymGRdeEo2E90EJb4DBy4J46lqChVaTT2h7bhwz8epHOATJYGkhZLa9WtnsatJNQOZVf9PCYrVWpDC/1qoJ8mzGbcgkuoEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pb4GirMr6TQjffvu6KxQllnOMBjwXIaX6x37zNgv+I=;
 b=aW+VXqgJ1OFHSag8dYzMFE0EVuFOPH7XUhbLYgPI3sPX2bIShv5VH1PhDs+NjV/DsnBbxZqEyWCaafC3B/m701X+bY+cJMF0fHs89Ez3dTkoh2yz2kdVIhUY0UlVRgO1J2s52cC1z1YkNVehGFLKkv+qMNYcmGiZUWhn0DUmtPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9478.jpnprd01.prod.outlook.com (2603:1096:400:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 22:56:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a%3]) with mapi id 15.20.6933.019; Tue, 24 Oct 2023
 22:56:48 +0000
Message-ID: <87lebrbpef.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] dt-bindings: audio-graph-port: add ch-map-idx
 property
In-Reply-To: <20231024-preheated-parasail-34d75ee63244@spud>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
	<87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
	<20231023-security-tadpole-8b4fd45a96da@spud>
	<87v8axj698.wl-kuninori.morimoto.gx@renesas.com>
	<20231024-preheated-parasail-34d75ee63244@spud>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Oct 2023 22:56:47 +0000
X-ClientProxiedBy: TYBP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a4331a-37e3-4432-bbe3-08dbd4e48078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NLY1yYEfjiviMY7HW8snaTK3rrN3ZaoVMZccfojGqSZWRU+rqYivmTEGY5ZohFtMcMcXPKKqbUEi3NoDRD6/XZ2+rjfcwXJRi8kFv1XLWbDB7Y+zy2cpJvvKH4/Exnls2n038E+zu8uU+8dYn6iZMP6Nolnllc48MWWzWDFVVHipe0ElLZClwbpqt8f9Yq+n8/oxx3CL6dDuNtP8xw4Mf2MwglrYYfToOt9OMVWDrZSvjBzdH/h1JR0129tELIs9gebO48x4n1q85p3gKr7gA9SsS1d26l2TlU3Vng69OYOoOQV5hnxRRGPgHLACtlvIp7LfXw/79mnPsuaybJt68YBR+Q8cpRlxKrHiNWsXZQWK8J2+aNNAYz1wYk2ZMaib28/iWPnNOsvNTRI32vT8IdtcD+JOx/rFlR4803V7P39//Nbm+iHfZpNnVz68oF9SqP41/fjEnJ6Fbj0NdSh0SI9rZ+d0pmsqcZnl9jqDdPVCS36ggMVt8+1qIvr5ccemlW9+nKodAkhfH3AFeuz6EDa5xsfsAidUujJwFQMuhyK5oo2buyaGXXFSqyiYHqF0iqVBe6P7hKMeKycBjv/TrH0rD1ihGP3MtoWG+mhzz7vpWxZp73rP7CdnFdOi5jmQ9HgRizxapXDeTZtjMlHo7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66946007)(7416002)(41300700001)(5660300002)(4744005)(2906002)(316002)(6916009)(8936002)(4326008)(54906003)(66476007)(66556008)(52116002)(478600001)(6486002)(6506007)(8676002)(2616005)(26005)(6512007)(2013699003)(38350700005)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dTliuFCBRPWEq1fDGWYBuRw7hnLC2tkFK9evzq54rSZl18ZlCvhNH7fQ+m7R?=
 =?us-ascii?Q?VGMnB/A970CGwN4+aHKt5VzFtPTKaJM2oyCyhNUhPsTummQsNZgemMFUYJXR?=
 =?us-ascii?Q?Isu6YdPYk8Eh8VyjsxYkA1rToHkSDMuUG+wFuLE1gmuVo5SybEfri+eTxO5r?=
 =?us-ascii?Q?/jmHJ3Rqa3FhtcIqJ4ImXD5Pm5S/+ZJoKYYXJnH0FzV4ctX0dPv445NVRPpM?=
 =?us-ascii?Q?mCVSFF5TzweNsP7scko3Q9nX0n4l3o9VyTt0XcdkZfTauiIUleAXff4QN0ls?=
 =?us-ascii?Q?C3/5Hs8WoZ2fS33LUnZrU4ZvlVYHin3UhSOKr+5grRBedagrqQoMD3EMBvNu?=
 =?us-ascii?Q?RMpMDSPARJZ83HkTsioX1LI3aLOtRkhaAj2aDSQKf4ngc1rFzpfR3ge4GbUg?=
 =?us-ascii?Q?bomr0P6uvAGNSl9E14AWLBc2qK7onGNgfMtgxcQ8piiMruk54s0OJbxYM+FI?=
 =?us-ascii?Q?pgLKJyPU2dCmezAboHMSBUm5IQUe1deXgCbVDpOeHfZX2vhijMkXfaFzlCY5?=
 =?us-ascii?Q?sUbIzZqqCErtV6ZRaH0yuLWNItT1Q8wUUokGDlhg3ngWdLxPlr2f5jiimj5R?=
 =?us-ascii?Q?Xe+eBvEGn8de99qzakkvSYwaVpEV0fc8Cclz0uvlYUaeQ8SN0lhdAS8V4UcR?=
 =?us-ascii?Q?kMJ8EZLi5uUBbKZkEOD3CyV8w/hNbTDm6skRpirXxG5M70MOPLmdzZOk7uoQ?=
 =?us-ascii?Q?8Q3M1grRL6mu3+kX47UPb7BSVsx9jVlK3pZGWab0d44dP+cMfX3aQlbX1jRA?=
 =?us-ascii?Q?6Re8XYGBRt2MWltB0qS5noWm0y8g1pRIe5H8bARC0MRkUo3PdHf4yyVVQEHA?=
 =?us-ascii?Q?647ges0O+ZNXZcFbaM4CWRkePXbs4tQHnHDR+tfj658UTNuPFv5GZT8jyaxi?=
 =?us-ascii?Q?AwHM1IVxx9sfZre5RU8dh31lwQuHlKDwYvU12dFgYht/k7JgmdPstFIVdzKW?=
 =?us-ascii?Q?2xQoLQz/kDLHdewC0fBgx0ArHvdQX/UVrfBy4nra68Z+MAcSKHmMe/0G+c9K?=
 =?us-ascii?Q?d7k87O/sia20QmetdXYUngMGFmmGlY7KmupU4GodmzqLTpl1cuEww18NAlRs?=
 =?us-ascii?Q?j1/TY4ZViYYTJaH4vM7qsMBn2+3qkk6f4POX50o5u3ydDW2LeRzlKhkK8JpK?=
 =?us-ascii?Q?Ofx2U74vnqthYgGW/Xu5uyox00ufJTIdTEloAyGJ7grnxSM3xvYRdh7yaKRh?=
 =?us-ascii?Q?7ktGqTbfHWRQ3EAuPR37OFSZ3W6CDzgbYup9RXuMeV4kf9P3jtv0B3oNMBfP?=
 =?us-ascii?Q?78MulDxzinP33jJTsQsgK89RUtJ8CnikrdrjEgXJ8bEX4n/h3KGyUH5U4JOJ?=
 =?us-ascii?Q?6A9WEORCmvZ4XqgP2wkNieJvO6C6sVIQLXw3c3W2Il5BYg1ATVPYtL7Wi4PI?=
 =?us-ascii?Q?vHgSjp6KlyOxvCJNg0bahTjUIkZZWoTizRLAw7MV1hDqB8E91cBufV8KM7Zy?=
 =?us-ascii?Q?rW+0f0GjjzDqxmBLuZRTbV+HPUeXF7fC9G6zoV0RWusbdKtNMiRMauobrowe?=
 =?us-ascii?Q?3pogMsNfRkHJwz18yJpkl4RdaABBJhh2mI9DRYoYlkij10R6uqgOMNvPI3Dz?=
 =?us-ascii?Q?ThEcNssFKiyWRZOK52vCS33tDvyiWWuY7U5tCCRnuktyh9dCIIty01RN3Jae?=
 =?us-ascii?Q?Ji35+cUMck9keJVLf2iQQpE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d4a4331a-37e3-4432-bbe3-08dbd4e48078
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 22:56:48.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TvyTl7POxFDv7IJ/POIsuJgXq3lKOZpnpi98XgWCRBhVmnte7Ll5HhKKWIKpNatMihsOSiWaMk/o7+B2Rz3NW7CvMzzapRWcEG1sKqodTc4X9K3sUzKHIGcm24jdZyrT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9478
Message-ID-Hash: BFWTLUQ26SZWOKICJR4YAX63R2PXLNX4
X-Message-ID-Hash: BFWTLUQ26SZWOKICJR4YAX63R2PXLNX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFWTLUQ26SZWOKICJR4YAX63R2PXLNX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Conor

> > > Again, relying on header files in an operating system to explain the
> > > property is not a runner. You need to explain how to populate this
> > > property in an operating system independent manner.
> > 
> > Sample is not mandatory here, I will remove Linux header pointer from here in v6.
> 
> Please don't just remove the reference to the header file, and actually
> explain the property instead.

Yes, I will try my best.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
