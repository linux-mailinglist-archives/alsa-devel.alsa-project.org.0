Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9B7D2768
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 02:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD2A83A;
	Mon, 23 Oct 2023 02:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD2A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698019793;
	bh=/HY/Dv2VdhUYjy49txo8IzP99pT+VjELAOWsY6/nitI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kZgVAUpFCP9QIspbcNjZVtiPktO3PGZGHPNxWXM4jK3GYoJNQbnCcxMI07ftmY7fG
	 44WNfKzqk3sgz3/FqVsycRvs5bkmPfVh7oGlUqHUkmFPBmSAt+ESFxwDU7s7Hfo7HU
	 9/P8GZglY+8/PGtPb7gRSmRKtSh1hsd7/f31P628=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEF22F80536; Mon, 23 Oct 2023 02:09:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6938BF8032D;
	Mon, 23 Oct 2023 02:09:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F39F8F804F3; Mon, 23 Oct 2023 02:08:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BEFDF8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 02:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEFDF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=caKF+gah
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6rAHIglnrOL7ITInWMEAhKhT9xcFApqaspR2I04yLnJL3HL9HN+LlsklRI4I8qe6UhS50W1RxFTiUB1FSP/ptyGyxOPwGHjbAtWWEYLZoew3VNELZGqJWnECt2+dONk3RcTEzaAsfcyz23M+6tVP8FEpfg8jDUuReBbMsoNUi+CFcPzWF2VtXfCjPf9TdLHDOhMWnzStG4SW+VHPxr+md0Lo5ZV9l1YcLILyhhl5qY1liLv9OQ2yan+z4eL6kOA+DafFddukKbzlVj1gQzdUKpbmnzo20+s0N53VT1xxUgJLoYsIy/PrixaQWAuPwCPoEtoQmwmZ/lbFPzcJynxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDfqffmptt2D60t1xyF6UFQtwQ/c12F+GxKYEl1/Izo=;
 b=nspoI+ixrjT1iMv+H/5lTQD+hk5a8ZmgWHRrEQyJ0zDqEHILmy8/eC4S+TBNT0g3gsme1BYkveNuvPsTO1QzD2VBju+lXudPLv6ghbTyBJZ1hJDjT49ZdhsEJCVoCbC0/yT3fGyvCXLMpZYA+I+dSvAjer3L4Z/7P6unCbmE5oYGYb41OSyjvMQ1dpExe2EndnfTxPMKyZm9qojPon2zHP7sZB0KGJZqFJT5dyqM0VdoN5aqIZw5ZMJCStCdyGZNaAxAfpz280PxbcG8EAL1AiwtR0BhQJO+bqOxLW3isySFfrOGYPP5IP6genBBdYsUPcuwhVh/KFQMX/aChzWjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDfqffmptt2D60t1xyF6UFQtwQ/c12F+GxKYEl1/Izo=;
 b=caKF+gahCf58dalOEQlC5ATf+WyUlaT/i2FSLQ4+8Hsut5jnBmNxDVti0jNTtDi84STkjRxsAlU9iuLITXwNHoQmzZeONFBq9uu+WXm3khZZ6RDHb0mc82Nc4jQM/7NcvnR7CmSxYTeCiIEjLU2c6omrWvgHEvIeXwXpOEim40g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8493.jpnprd01.prod.outlook.com (2603:1096:400:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 00:08:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 00:08:39 +0000
Message-ID: <874jiiqjy2.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <ad696b38-3bca-4cc9-8e9d-81dce9686de4@sirena.org.uk>
References: <20231012-storage-directory-548905001d10@spud>
	<87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
	<ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
	<20231013-planner-irate-8e411cc54a48@spud>
	<874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
	<20231017-darkness-jackknife-5cf32246a079@spud>
	<871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
	<20231018-object-renewable-6e03bce41ff4@spud>
	<77d3d1e5-7120-4a5b-99c0-c34407f63d5b@sirena.org.uk>
	<878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com>
	<ad696b38-3bca-4cc9-8e9d-81dce9686de4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 00:08:39 +0000
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dbe1c1a-90f3-4309-fb33-08dbd35c35ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GfOCgLV161Eh/x2Gwg7K8HvWoLhVuFMUTjqDRGiHO4Ri82R1VNF/ZyGKrTVFjoLYWp5KjrDbVC/KlGuaEfhChOeQ+DCs9J1xmiXt0BB6v6ZWXjFJFKhWol4MYLKji8VppQFiC0onjeSm5aJP68oCZn7WYbAgPDM2i6/1EyLieIuKFAh1FUd57uKbHjJeuGQ8lBm/kvbkp0XewLx7d9YsT27klDdG7wnXwj9SXLol844Rfxc1wcG5BYEQGZrR5sr4eUIUsJ7f7+thi9d61BG3l6UONsbuGKPuZi77WyYqC4WsZhpvYxctjQDQRDFBX5godmuCjzhIOmtoFTi3DGmtAkDQdmUr3gvW2iP2lcwJKjItI8N6EYqo/f3sr0lLRqp3Kvdmfj8LnhC/U/64FAmStQmHdRCxXsvHZn1w/MiTrb6i3TN6mo+zwRBSI4qvYQ3jCLBXonwV0Nmwx9OGbO3JZ+ILwCqLLLKjDpU9ooCAgLc1Vi3ZoSRZP3Yf9iGHGKItYR5bWzU2tyVdTtP25eXIKScayicbc/SmgB4ozxhIy+f6F+TqTeftIbK2nyrrrkBmiHSu0aLjGWZ9iuOmx0BPkbXRXxHP7hdrtolMQL7qMnMVlt9+RK9t8yBj9v22qUsNsZcqryAy30Smb6yoIgr9dQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38350700005)(2013699003)(6506007)(86362001)(38100700002)(2616005)(4744005)(5660300002)(36756003)(7416002)(4326008)(41300700001)(6512007)(2906002)(26005)(52116002)(478600001)(8936002)(8676002)(6486002)(66946007)(66476007)(316002)(54906003)(6916009)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kOPwXFD3rHz7pRV/1oruPaQJ+Jf6yvM9nFpj5aMvmq7DY0UKRmmuLEASoi4K?=
 =?us-ascii?Q?4UTyZ83HjQy64WhltaxpODuCGr5BFrzGINxXok+klQ0jpQQYiVBTvGlFsRZZ?=
 =?us-ascii?Q?0uBR2yEsNO6YCBerUKjZCqbjF+jL3hSowTG1FLICxcc0F0LQUWyrEOijfVU9?=
 =?us-ascii?Q?fM2Bx2f6S8VJtGLcC8wTS94B3Rdl9JKmmCZXop7eh8sxi2ivSjAy9yKfWFBd?=
 =?us-ascii?Q?aCgwwZRCeiPorN7wqx0ilz3gnCBvlafKzJS1NWkY9oU89hEmraVB6fhmtYt/?=
 =?us-ascii?Q?YWogTPo1uhevCuClFVVj7r2P6vRgt6bZhSUU2vjG0vst+HOydJfSji1Ox/ZL?=
 =?us-ascii?Q?Xy7yRVK9MIswiJJzH/UPx/F75MPIk/fprVvJQUbcFPNGeAQbQ/55s3fsWmg1?=
 =?us-ascii?Q?Xfg7+SpGdDHQt8fwcMWLpUOBs3S0Dc5+MhaNs/VSbAYg+ntyn5JkyjMGtFQz?=
 =?us-ascii?Q?GuLGEtK8rgngXBJU4S0MdLgGzcAQRhE1u12bXRr+8ZmUfr6XJwtAJ4w0gmQg?=
 =?us-ascii?Q?XYU2lzMe2+q2lo74mJnP1+BsqBy5Sm8kfGxQaqjTNAiD06npTQc9movTX/+2?=
 =?us-ascii?Q?AVWrKltYY/qd4sNCijNtdVFUHxKT+IXiBp6RU7z2X75kPq78S0JF8FsAh5nQ?=
 =?us-ascii?Q?y4/tqmdpcEJb5WXgHCQHFp3iuH0PmCcMQ3vPD660aiKlFEE+aYUZ8uWRc8CQ?=
 =?us-ascii?Q?d2iXTeS5aNn7CnzHJOCfTzH7QxpkVDK2YSft3pmyYCSpsK89YgP18Ny9if2X?=
 =?us-ascii?Q?937DiE6moe34mEscwifPpYkNEXcw66LXCWMDxc/D2zuYCtQtCVI8IF+N/ta6?=
 =?us-ascii?Q?PNdxMwKhCKmBic0U8k++jwj9Cj7g0JSxap1qZ8MSIPgNFVeZNiuiEThoMsQJ?=
 =?us-ascii?Q?BWAVQdxs4lHSVfTeXxgrlL60Lz7nFDMPij363XNGpB5GOKpnAeDIgwW0xq91?=
 =?us-ascii?Q?qq7gpC24UO/2+pWgwABbRnXnfdvesq0JcHen6I4dtMxeKI50VTOjPwo0EQww?=
 =?us-ascii?Q?UEkeZxs1/1qLqgs/43oiEhyI/7+QL9uN5U08kgislRc2NX9PRZJGEvu6D1J+?=
 =?us-ascii?Q?VR4xgRitiJLPvtEJo8py8yWRYAht4kmT0zILFibEut9Yxc7Q9Z3VqEgIOn/9?=
 =?us-ascii?Q?m3jGm8iOC3roXD3Rmee3moAFCijdNwwtMGQV505WaNuCW7Ew/gzwi3jl/hNG?=
 =?us-ascii?Q?hn8bbpKdooFghB70a+0LmtmfqkdcN01rxclZML50h3odzV3wOLVqz+4uA5A9?=
 =?us-ascii?Q?Zik2IBs71c/7iw5lTBFpr47qroR4YJAhqaMIamIbyLENfvgOi41A5h6LhvQi?=
 =?us-ascii?Q?9pt+eV3fhIdGCDjeVRQyXrdLG37DFvmBNV0jO8JkqdtMtb5Dpsff395F9rly?=
 =?us-ascii?Q?hqYPCAINUx6EbYWzAMiZ/iGITG0dU9CPkXA5WhX3W9GS9wvAHCB2WMMYrL5d?=
 =?us-ascii?Q?113mG45MTtfAHeqjyhvx6azkiUDsedwN5AqL/0lBgx6viKtRqE+DtfHugXEf?=
 =?us-ascii?Q?kumYNZyFb+fSc8JHjnW2JNiTDjFtJyL1rtpdWha9cRlnE7kmvP5WM4GvTVZo?=
 =?us-ascii?Q?2wKCoigAgelrnagGcaligJ9KIl6mXrtNsBf90axGpU0g/JGRVzMj7F8HOQtz?=
 =?us-ascii?Q?yyhVSApTfe/3mm7pTNKaCnk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7dbe1c1a-90f3-4309-fb33-08dbd35c35ab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 00:08:39.6798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tSvIkfosbVULPlrekY4tewiBlo6o3YUr4zYhj/X5qel8MlwpkI2TS/CUOWhmj5RQPqM4BE9+zw+i8NwGGTB9w/3r0HHnw7ZSFA/GV4Gfb7rMIvqx2ZK+3ggvOPoudDEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8493
Message-ID-Hash: DSKE2L7ILJ4ALYSBFHD7ASMVZMUKUQR5
X-Message-ID-Hash: DSKE2L7ILJ4ALYSBFHD7ASMVZMUKUQR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DSKE2L7ILJ4ALYSBFHD7ASMVZMUKUQR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > DT
> > 		(A)						(B)
> > 		<- port ->   <- port ->       <- port ->      <- port ->
> > 			          ax(ep) <--> (ep)bx
> > 	map=<0>	cpu0(ep) <--> (ep)a0		  b0(ep) <--> (ep)codec0  map=<0>
> > 	map=<1>	cpu1(ep) <--> (ep)a1		  b1(ep) <--> (ep)codec1  map=<1 2>
> > 	map=<2>	cpu2(ep) <--> (ep)a2					  ~~~~~~~~~
> 
> I think that looks like what I was thinking of, yes.  Might be
> misreading it though!

OK, I see.
Indeed this is better idea than mine. It is easy to understand
and code can be more simple. Will use it on v5.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
