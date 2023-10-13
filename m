Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42AE7C7AE4
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 02:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6362844;
	Fri, 13 Oct 2023 02:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6362844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697157319;
	bh=S/OrT1UOK5tWAchLwcZF565LZISNKnXFSFo+7jocURY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JXHfyPsu4ZHAW4Q9fW71Tkiqm6xyEhntdRqheini2K91QyyRPDmxtM25YcSB8a7iU
	 nCKEZOLoIHpCTo7XYE+W9cU/YaL+piZictfnvhoKltGckxglU3allcy4S8k0Iiy0Ec
	 KlPI/p9QceM++OCS7dLtxHMYH6U1TYxqngkPr+Uo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 409E4F80310; Fri, 13 Oct 2023 02:33:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F875F80166;
	Fri, 13 Oct 2023 02:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34819F802BE; Fri, 13 Oct 2023 02:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9227F8019B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 02:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9227F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BpgfkoyG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eitW72cJiLMW+PmDUax/rPvKyjiWwI30GRUr8HJzZ+PzTxhAEEs80oCf9jw9tjkLyxuK0JLJ5+XnA/51vdcxd/RG/ffCp4FxzTM7DZOZmlTTIXxiWZr2zVN7nMhTpx3Wq2AJMicdfqIejXmEFNgwpXCZ9VJy6SMG9JeWMMtiEqiNi51B414LzF9APJmypUykkyGl28pUUOZd3CygQaXrp6rh6ax+uc4F5YGz+mzrlm14AYHuXysp2ck7q4G7+ZOEGVH2asqWY5VYGKf6HMAZ/WgR3MgHotOn5TAgH1ijVYbuqC1jt8y9Y2JQZt8N6qxPz1gkr2b82WFY835LFk/VJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrbQqJrj2QCri56lxQ60P12tMzAjbPudfl3/Wsd4kkE=;
 b=iNqprtr1s79IkcgD/MifNnVbonSSGRwJhYEh/PK3wfWIpzHbgkiDEg4sRne45QZHMRG/+WSXmZ3EwYYwfG7nWxDr3/Rrm/EE8u3Vo/MDOlNxK3XQsT1Zj7c97E6luqWg2i/cfPgEwiza51IKBbKACdL7KsQvhPOINOAW4AR28lqU0V1j91igIzamZhxFXFBEcFEiC31LiSTF5WwY3PjM9AMqu8Q248sdCdNwhD/xVi84imeaPPdequpW2mq5xBpztXDW92xPMnmsnj2ox3rlBk+e7eDxKgEwggD4Z06rJ2xssuqlPm5P0PbJvX+f5J2GjYZpChzrWf9fcbnOrRbVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrbQqJrj2QCri56lxQ60P12tMzAjbPudfl3/Wsd4kkE=;
 b=BpgfkoyG+f5yNMDWHV/NjRsxXUipiFoQ3B6Z08DhwTLb1fLP3QO6kIcdet4UOgoUg590/Z+rO1gFfUKiHQyzjZ5WzHJUybVNxXy8an3njf7EiStnS/R5SFxam0a68SVTUdmzMFMsRLSnTgTTdBvtYxe5A+crKk4cBMq3Ke9yoDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5919.jpnprd01.prod.outlook.com (2603:1096:400:43::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 00:33:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 00:33:35 +0000
Message-ID: <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
In-Reply-To: <20231012-storage-directory-548905001d10@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
	<871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
	<20231012-storage-directory-548905001d10@spud>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Oct 2023 00:33:34 +0000
X-ClientProxiedBy: TY1PR01CA0201.jpnprd01.prod.outlook.com (2603:1096:403::31)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6483e2-114b-4c0a-d30b-08dbcb8408f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3R8nitXROcDGcKttdKLaTb0PA95UIbRxbW2x+TqIzIG9JUzgrW4vm3aHNLM+biaRXoynuD6rS/lfpWbz2LmYCPFY9kdbru6FsCNrhGCvAlgDsJE3xaDmLU0jn0umDbRFNhgIzCVEypZnSG1ahkNCgRC97QL0+Gk+jTKidypk/5isrAtso9kr8XCUfz28J5/xTHhGOER7ZARIwhbTyen4Yb5PZXQFgXHco6b92Gs7kuW0O4bZ/6A5jHrkEVO+fvoMRsJV2dNUOotMEU94dJHPSvgpc+EYz/g55cxrd86iUn3Fp5vpwLhRjVMMye1DXMsJGGktWiSawzkwFDqglstHJ4zokDxnUqWeCfeAdRBVkdYfMbYQI87tEZzvweO7Tip6XVP5nnBVLiwK91mqMgJI7tJWMbCa2keqsSv8l9yWZom3RSrFoSDEBX6r+dJFKD3iYFNrrQwY+qeyazb/xe1XTLQCd950mZgr8vFY73UQNVHA8oBmUcRtdRbasxauG5PP4BHt6Bs+Equ0VsgmTVZeBDvkXAwuw/Fp1SgUb+XAsmEAWk6tsd9J6outsV7+TdqgB3kgfsBAIXuePRLbaF35twZv6qzXOqAJA0eaXV7TbhWy/4q4fThuSYdajsxmgIqmXo3czrO2O64vOwF7MtD8kQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(52116002)(83380400001)(2013699003)(26005)(2616005)(7416002)(2906002)(4326008)(41300700001)(8676002)(8936002)(36756003)(5660300002)(86362001)(6512007)(6506007)(6486002)(66946007)(66556008)(66476007)(316002)(54906003)(6916009)(478600001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KkJwn4g81pvQ8Kf/alANtUMOjInffxDPUC1kGt4uE+FlYQbfBod3vxxh6pu0?=
 =?us-ascii?Q?UINfF2k3t2kEV/wizD3tuyoXuvWUPhUBNWv+LO2T24oM1q1oQt92r1l4suHI?=
 =?us-ascii?Q?RoOS4JwQXxGGR3+bmw4mnxEkRnd5xYetQOs2xfX0UzAtOfrI2nq2myBCOzR/?=
 =?us-ascii?Q?Wm85duMjyxvS/h/BS1C2MbRkex6CkGVbOsT/CvDE0CXNmeP7Q2wd1PNaRuPE?=
 =?us-ascii?Q?9gN4Yf0njZDEcA3VI+0qJHuHJpXxve+zGAJJA1zDqi/bqU3vFTbXQsexqPQf?=
 =?us-ascii?Q?BlGwtGjmAZn5jgmqbjwNZ/tVEzk6KT5wwIAhtyX+RVcilzMxGH4sWzZqZoDg?=
 =?us-ascii?Q?WpRFYygELEEfHyeL0zArvskKG6r2di3oKMVzp4yIZt66ZpX2K6Gbx9wetevy?=
 =?us-ascii?Q?ktWgI0LCfiasdFY6zBsW5VHDJeoSe6TpMWNt0NGD1Yb3ctB9YQ0p1VDurzez?=
 =?us-ascii?Q?i38wKj+gozgSVjGkzrl4rIeZRxed2TIdKmTIqVA3sXi8uV73IHScenSuLuZS?=
 =?us-ascii?Q?ppEbbJU8KkrZh2V/yhRGaaen8tv31t1itdLr2r6oWFWeKYErJzQQq2chIsvb?=
 =?us-ascii?Q?ljCwoqW2erwbTvIPXImbz0nDJOowOpKLTEs6OOMAw6DTgJMq5UhIl+1NumTh?=
 =?us-ascii?Q?Fot87x6V/Vx4b843NjXCSTKGpb1YaH0Tjzuzl7FzEbFswLiFCL7tsxviPUn4?=
 =?us-ascii?Q?/ndz3EM73aqdTBXI5+xco2X65m61z898VZ9jz27x9gqdYCBcVHXgdBf8bupi?=
 =?us-ascii?Q?5tGy1ENoXqCsg5Bzfl7eoHS/Ga0yl0kTz8w9NjchZ5YlpO8A8ooEB+9L0EiA?=
 =?us-ascii?Q?jmgYDsO08f8ulW6NG/k9ykydaFVuJxgnVxn0HtpeaAzrKTOvEdla9IwFW5Uw?=
 =?us-ascii?Q?RNrSlcNFcl3Q5aoDz8TGr8PYjo5J06cS9L5X5RBw4U/az/YRc9gK/+AxHKrZ?=
 =?us-ascii?Q?aJ/BUMQ8/J5aCPiP6f3FLfvisEbsYFpyRUal6P2OcSm1qMB2C8UtVCABd6iU?=
 =?us-ascii?Q?2f8s7co5lbymaBGQls3vFQqVHyGhVxiw7n1OpQ3Dzb9XEBcTUhICM5l4YjYy?=
 =?us-ascii?Q?asQUtA/ARFTASJ8ZtrpJjpyfrKCO4OPPgq2tJ0+vXihX1DSzHRWiyb6Sj+el?=
 =?us-ascii?Q?uzSrqbbPfdZLd9X9FA2e/9BJXu94IzSlU2ESHNo54JCnp0Ek2XgzDt0mc/ia?=
 =?us-ascii?Q?IM6jEhU1ZMx/Gpqz4rBG+DkF4af8zBnM6qPRCE+t/7l9aENMoJ3Gf8M408vp?=
 =?us-ascii?Q?v+/rR6H54X8Lr96nIBDqZMjbVv+OROvdiJ8hhV9gOiWX/pHK+/cfo5K7oSxy?=
 =?us-ascii?Q?0vKnjgdYBwuD3PafkUPv0AtB1zBs61XIlUkmY3CZ64GaS0MHJn7wIWU64XDo?=
 =?us-ascii?Q?fMem+fIfRxbHcgzgpEOPu6zq+Rh+ap/DGEFDLYXJ2nuDvwZUQKx3O9Xd6h12?=
 =?us-ascii?Q?ORa5pGapKmU614ufK2Nzme4XzCBU8Y8OPvUbCHVlvq858IgLPjbGXuAgN9li?=
 =?us-ascii?Q?EFA5vAM6x04DCmpLNjdJ9Gl02UuJdDvA6iNi9/jVOW55m/rGc0u6nMg1kCn8?=
 =?us-ascii?Q?DplE2FVftGet1Fm6laWXx51n+xJeP+PgY/Hg2lFxIug+beNn2X48vJtGyJ2M?=
 =?us-ascii?Q?byGsXHqEBayuODYbcPDkWGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a6483e2-114b-4c0a-d30b-08dbcb8408f8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 00:33:35.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GPxIqj5kLPHc+GgnUjV6UhCNJk1sJ1vGUDlZ1WCS9KF/vlHMdJsr8YDFYu44yVF5+uMyW+fQgycfb2Jlf4u2yTQi6cWZlny0SV+lfJWZCRyX6qGH2MmED0fuAP9JTg05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5919
Message-ID-Hash: PVRNNPUFVJBQMUT34GGK37SYF2UXCWF2
X-Message-ID-Hash: PVRNNPUFVJBQMUT34GGK37SYF2UXCWF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVRNNPUFVJBQMUT34GGK37SYF2UXCWF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Conor

Thank you for your feedback

> > This patch adds ch-maps property to enable handling CPU:Codec = N:M
> > connection.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> > +      ch-maps:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> Most of what I said on the last version applies here too. Only the
> s/_/-/ was done. Is there a reason you ignored those comments?

Ah sorry. I thought you wanted was add your address on To/Cc for
all patch-set.

> I only got this one patch, so I have no context at all for this change.
> Given that, and since I know almost nothing about sound stuff...
(snip)
> ...I have absolutely no idea how I would populate "ch_maps" correctly.
> Please describe (in the binding) what this property actually does
> & how to use it. Also, properties use -s not _s.

Some Sound want to use multiple connections between CPUs (N) and Codecs (M).
Current audio-graph-card2 driver is already supporting 1:N / N:1 / N:N
connections, this patch expand it.

These are implemented by using Of-Graph.
For example N:N connection case, it is expressed like below.
One note here is that cpu0/cpu1 and codec0/codec1 are *not* independent.
We need to consider cpu0/cpu1 pair and codec0/codec1 pair.

ep (endpoint)

	(A)						(B)
	<- port ->   <- port ->       <- port ->      <- port ->
		          ax(ep) <--> (ep)bx
	cpu0(ep) <--> (ep)a0		  b0(ep) <--> (ep)codec0
	cpu1(ep) <--> (ep)a1		  b1(ep) <--> (ep)codec1


In N:N case, it is assuming cpu0/codec0, and cpu1/codec1 has related.
This patch expand (A)/(B) part to N:M (N != M). Then, ch-maps indicates
how these are related.

	(A)						(B)
	<- port ->   <- port ->       <- port ->      <- port ->
		          ax(ep) <--> (ep)bx
	cpu0(ep) <--> (ep)a0		  b0(ep) <--> (ep)codec0
	cpu1(ep) <--> (ep)a1		  b1(ep) <--> (ep)codec1
=>	cpu2(ep) <--> (ep)a2

	ch-maps = <0 0 1>

ch-maps = <0 0 1> means, 
	cpu0 <-> codec0
	cpu1 <-> codec0
	cpu2 <-> codec1

Thank you for your help !!

Best regards
---
Kuninori Morimoto
