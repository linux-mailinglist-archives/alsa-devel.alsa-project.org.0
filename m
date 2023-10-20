Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555827D060D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 03:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5745E829;
	Fri, 20 Oct 2023 03:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5745E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697764487;
	bh=sWuCxSc9xpuU4kWF9hBQlhwRcFiYLyiVwSpqt6Ngqz8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GEOHkFxZYycmkG8WlkPST2H7fhshuPqRxKSPTfUMLP2WMlUxjqkw4z17qhSK9hqCp
	 o2O9bwN1DFn9c3jRJPyev2Jl2Z060TNtfsh5CduyVeUjRxWJAfCYYkyFRBFRtnuvDx
	 RyUDczBii5gGu/RquYMbiykVcv9ORghFqg4A8IbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7CEAF8027B; Fri, 20 Oct 2023 03:13:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1F1F8024E;
	Fri, 20 Oct 2023 03:13:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 918A9F8025F; Fri, 20 Oct 2023 03:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3E96F800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 03:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E96F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=eRSAzJtR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xrq4hfD8OmMqWQQG9sGii9mvVAFSNP9hB18nnJyY25hRd9/yyeSc1FGAy2kZr+PSk41+nvZHSUTVPC7mPy8G3J+1BXclijK1NvE23C/vG6TqDa4T2RZ/uYULTp13ByVBanoC5ACh2p8QRODTuRo4Nsb9XZnT7FiwrebafQrBFG2CY5GDB7oIDFFczIt1vjXZ+BpTJ6sNqFRd9pD9ndAV04RCOANh9t7zVonb4iX3BVnMjYgWe2oThQ1IvOMbqAODpyzSmYqCFEsVeUHPmrG7gn8cr186xiOF7GvSuIguwME1ElkC1geCo/xvQLWKh1c3fz4pyfY6f8xmm5niCeRtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p36oTTMzWFecu22W7Vo8AqltNuLBcEk9Mv6jKjU+v9g=;
 b=aOgdQMn9KbQOlppXT9An6+6eHC1clIFqY+KdPMirj9hpW/K+ijsTL98XrdV4lnlEzWhL1/fIrM5P/6nZnJeWpAtwdT5+KZzYigf/x9keufKJo2pYAp9AvF+41KuEIBLKT6A5bIvxEGojT66EZanVSqwM7u4ZFHWTj/AIO4ngMDBUQzXgPAjFiY/yUH0dN1V33SDSwvgGlo4JeufVsKqkQDp9Nw4jVH2zqVM9XiWesFL6Lag4qRO9oo0mj4Uga+atqgBoVjJCmAyeGF2om0LPrf4OIET+Vd40mlMHe011lwhR6Gxkp9Ix+UxbpwqCiueeBHowXCg5I9HA/lDJxPjw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p36oTTMzWFecu22W7Vo8AqltNuLBcEk9Mv6jKjU+v9g=;
 b=eRSAzJtRv6wYGYGoFZlYfv9px0AwnqdIcwBq8umUMFO34phBGl1wL6Ntv1ermKtOTfyMqlcC6DB7JkOjZdrqeGYyY/I2gLE0BHWplSbiqt+nxBVVk38pk1Wy2PZ0ln3Kh4bVLdiY/Ojkjs8xe0NZB4x8yRMm0w60D9pGubWA8u0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9648.jpnprd01.prod.outlook.com (2603:1096:604:1d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 01:13:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 01:13:32 +0000
Message-ID: <878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
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
In-Reply-To: <77d3d1e5-7120-4a5b-99c0-c34407f63d5b@sirena.org.uk>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
	<871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
	<20231012-storage-directory-548905001d10@spud>
	<87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
	<ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
	<20231013-planner-irate-8e411cc54a48@spud>
	<874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
	<20231017-darkness-jackknife-5cf32246a079@spud>
	<871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
	<20231018-object-renewable-6e03bce41ff4@spud>
	<77d3d1e5-7120-4a5b-99c0-c34407f63d5b@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Oct 2023 01:13:31 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b987952-5ca3-4e22-975a-08dbd109c6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N2j/beHOzt0bZSnIas/NGvcnG8/2lqTtI/qq9LUSThngzkhUbheD6sp9LJecX9+d1Lwmod+da9bfyDiffR7SoHelmKrdm7abG/WFQJAv6n7pRo02lQvRMng0Ea1VyeuSR3uDkXDJBy3a3QwEbIaalvBVILBVJa/udxbxVZW12nQiXX60B2zKf5O3RGcQLjnrBJgNLbaZIU2EsVW5RJWOu9emIEA69N3HXHhdSfleBLfgfoQjCbwzMFV8kOdRLEldDkNvcvJ8UNVru+SMnbJ1KsZQ10ul+AvTsjPhH8pVixLl/WkFZiaJGV+yBttwvoxyxeHd/4u8rF8SfJawF8P4g2kML088WTVbE1qzVDPof1+Tblyijjv89GPl6GY+n6Y2WW5srzRV6PuP91HAKIOlPsFjypu/vK6z295lKL2UZcp2UakZrYYKh24gPTZGwb/ra9nz49aca25qcP2s8QrZ++YTu/oQWPBxMsR2sk4I5R3qirPNxx3ChE+t83wiVMNIKCKmAYiGVMftuDT5VhoXj1kuF0h9ciWBnaej+Zqh0KLtS5nZS0KLXlhQks+v0MUtuz54wftSkdrJYQ1L97yoOtZmYJ5My0oPpFu59kkANjM44cmDcvQjlfM3bss47eXmJCCSLnmy2+msWuFmD9xyqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(7416002)(6506007)(2906002)(6486002)(478600001)(2013699003)(52116002)(4744005)(41300700001)(5660300002)(4326008)(8936002)(8676002)(66556008)(54906003)(316002)(66476007)(6916009)(66946007)(36756003)(26005)(38350700005)(6512007)(2616005)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4H3hGbnZts+PyAcKO5W/+dALKP/iy/Pgim9psBOtDfCLQtsNwybwox9CH1zD?=
 =?us-ascii?Q?dHxIuozFkgWkT7qffejx1PEfyZGNTUt0GuObHedcu/6wXlJLfZ71MHBnf0Mg?=
 =?us-ascii?Q?YDZcv3ZA+6CynY8J7YIXxDkBlZjgyW+N0bIFrMLZYY7PkICLW1HEhg2kDZqC?=
 =?us-ascii?Q?h3BTB1QP8omYLnzJ1wP+gXWYCGlw0xrHcxsG/fIuwd6oa9Z8KO43Q4601Nwo?=
 =?us-ascii?Q?BgMiODymWpLaedlCVyE9BsnHo3MjY2/o/GMNJ2EhrrtsBIg87pk9lqqZfYlj?=
 =?us-ascii?Q?JocmNc4r7o8zYi4dI17rL5A0DWgGZvZwgzqqm+RblgLllCt8bp5Ul3pWYJKL?=
 =?us-ascii?Q?RM8YDZGSqOtDd/F2ww8TgZEIkIvmzlivnvJ2Jf5Je50g4uaUyvHP9x3Hc6eN?=
 =?us-ascii?Q?iILUS+ZxpYyOzhrmF7mKdIKivGWGuDv4McYZb7TuyVC4FjKmTy+JCEKeXZ+u?=
 =?us-ascii?Q?+pPAZh1svMHTQhEwIM3BeChulzJ9VelBBmiv+g80JOOsi5ACrWUSsa9uwPeX?=
 =?us-ascii?Q?te14wNeCbVsRJ63MfuV3LyTOdaPT1ox+xNmiYAafFXyV6Dgg0sQdy8PHdqPC?=
 =?us-ascii?Q?+01VdRiAz5PqiOrRo7ytxWSRVTtV0IAhsAtbkRfKQRT168eb/13Mm9xqSH3R?=
 =?us-ascii?Q?20GzPn+qpf+Ht25ywEwJpu93hd4HdLem1rooYIhahfgKVvYb9VYp8APrv1Pq?=
 =?us-ascii?Q?NacICLc9j/M4Kbs572fk8a8krlESvj8zYdALIlOPDw8v3MhFBMVO9Aq6Fvo2?=
 =?us-ascii?Q?0ynCztiB0LRKSnfln3LFa3h6Jl1qxsAe9KC6OopRN9BTAAnp4sz4orboWr6+?=
 =?us-ascii?Q?BwDsGpvJoHRVTdC21CpJcmzeRx8VN+MY1m+w4R1PQpmEYMP8nEHn722HZ15F?=
 =?us-ascii?Q?iuZu3T754JNnxxuAzv/7BW/P7vldCuZzhUoSuDFYXZufKtgTF8IW2Y1GJR55?=
 =?us-ascii?Q?2Kq3jq2V8gN4p/JoGL3PtqjNfIshhI44mZci7aL7LAZxhnyJ2egWfBURkJEP?=
 =?us-ascii?Q?6jgDa9a4DuIWFVjPihw3g0KrTymI3H+ZzX26TCZ99vMq1xsgBI4S6dsIfvHa?=
 =?us-ascii?Q?z5yymBg3SXM5J7Estpyz8wv3LO2biE0ODWW79sHr0gWFJdn+2m1sAxsSsnp+?=
 =?us-ascii?Q?xFgCieKKgDYbpEluw3lxJzjQPvukB377fhH7sgUPmq2InSJtlHIozdlBdLN0?=
 =?us-ascii?Q?mi161Q+80vTx3Q4wHYCwICdcJZ568d7foOSkWGcVyto+iKGp1RMHZ7p3AeCq?=
 =?us-ascii?Q?UvziTi6s/q87Y+Pe8sGP8cSjBoNbXclzmRfn3Ralu+Teq/0YDGQVUceZfHNJ?=
 =?us-ascii?Q?5OUnaD1VZARaDYjowz6xO83OPI+rzE5x7/gq3ZAntj18zuDHYTBMvhfea5op?=
 =?us-ascii?Q?u1JuiPws/pUXO6NOReEqyeGEy57AmsByrDGuroUbEWoibhPG9d31umbqIiWG?=
 =?us-ascii?Q?F79OEOQ6d1af0Z5Ed+7DJ0ANf3ZSZEaKwqsYAsp3c2EYMqs5MdPqXfNDIwIa?=
 =?us-ascii?Q?CBHHqSddI94SoTDAyPbkbDnbEuL3t8K78+qhXuHbNIoJmZ6cAzROnJrdFJB8?=
 =?us-ascii?Q?yAlcK72garelYNHCKb9fTj7QRKN3EuZW7o+bxwIQTz6AY/eG2/WhhRDt+TtZ?=
 =?us-ascii?Q?aRWmtIjvwoBuUrxZ+tYZB0o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b987952-5ca3-4e22-975a-08dbd109c6ac
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:13:32.3325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CHO5b7nmlb8biyNIAGm6S/xY9zRlJP9ThhkEXMg3btkkjcLFORwc5wB7hgk4ACwrbcfLAumGMeFlftHXLrHxelP8NR9SYYqtDn4hBxZxzmMyGutFInsFY6wHbx+rmn6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9648
Message-ID-Hash: CG2JOW7SI5HVBSUOYRU2DDH542CGILW2
X-Message-ID-Hash: CG2JOW7SI5HVBSUOYRU2DDH542CGILW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CG2JOW7SI5HVBSUOYRU2DDH542CGILW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > I really don't like the number of elements inverting the meaning of the
> > property.
> 
> I have to say I'm not a big fan of that either.  It might be easier to
> map each channel to a slot number on the link, each DAI could then have
> an independent map and the kernel could compare DAI slots to join things
> up.  

Do you mean something like this ?
almost pseudo code...

Image
	CPU0 <---> Codec0
	CPU1 <-+-> Codec1
	CPU2 <-/

code
	ch_maps = {
		.cpu;
		.codec;
		...
	};

	.ch_maps[0].cpu = CPU0
	.ch_maps[1].cpu = CPU1
	.ch_maps[2].cpu = CPU2

	.ch_maps[0].codec = Codec0
	.ch_maps[1].codec = Codec1
	.ch_maps[2].codec = Codec1

DT
		(A)						(B)
		<- port ->   <- port ->       <- port ->      <- port ->
			          ax(ep) <--> (ep)bx
	map=<0>	cpu0(ep) <--> (ep)a0		  b0(ep) <--> (ep)codec0  map=<0>
	map=<1>	cpu1(ep) <--> (ep)a1		  b1(ep) <--> (ep)codec1  map=<1 2>
	map=<2>	cpu2(ep) <--> (ep)a2					  ~~~~~~~~~
	~~~~~~~	

Thank you for your help !!

Best regards
---
Kuninori Morimoto
