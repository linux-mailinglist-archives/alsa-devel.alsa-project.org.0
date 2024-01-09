Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066B8290B8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 00:16:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45167F52;
	Wed, 10 Jan 2024 00:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45167F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704842167;
	bh=KczSsm9oWcCHyP317nXMRM4bWU3IfJ0wSJNCFPs2IO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qBr2Yse16ttsO1cOztfdU1K0GqQX0MRbjwB2qM9M2oejwFkZb2FDDR19a0FIUb+ll
	 giCu7A+kEF5OXj1z240hE6l9UHgzHel69bAyNmzvxsQeO7/14VOjaTvTbEiv0slV7S
	 qORg8cT2Ozrhj4VPrNz4mve+N+wE6KVeyO/+sKJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9C4F8059F; Wed, 10 Jan 2024 00:15:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34333F80563;
	Wed, 10 Jan 2024 00:15:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 042C7F80254; Wed, 10 Jan 2024 00:15:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E3B4F80086
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 00:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E3B4F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=m1mzL5Lz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CidtcoI3rqscXL5n8w9e2gtcEtB125ZcWw36UV1sQ2J37aNOhx8iGwvDMSOMBUXnpNpqDs/hC8dDLurHkljR3eSHVi650EHDVO5NqAZLMYPryt9exwR5zoy/lSv2KBSLZwt5jtsVkqLOZDmekh8ZlWgbP5q/ahbtp5Wx3uuZXkP7PVqf72X36EB6OcDCXGhLGSlJwDTmQkalAPD25vWmLHLuSgkxqJjLygDdZCEsPQop/7XyQrEQ0lS7fxoCqgtajY1m1LSJmva5ApJ2XJVA8njlNPq3pFaHpqJ6oV6+RyiW7nziBof/dtq5XkRhHJNRYC00DFk6vcEBjC4Z34+n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVraIwISxfZVO0A/F8AnOc9fm2ujDqrjCo5XG4GVBo0=;
 b=HhWpQCg86uvHG0Pogd+WYpDnUAMrwheKes1oPuZLaOyr9+h55eqH88DM/ct6E4B9A2ZMvtZs4gpwZyt3dyV9KmuJuV2BUQea9X/lP3RU3ZHJ6RpkoNK2Qg5ZHJoiacsKGINymZoxJqg5RfAYOja58tX3plQbs5heu9lFAWphblm7801MaFOwNb6ptz2OXwJazB3B5oSeXZWSg3Ff02Oy6xAVCOtqZJIs41rdIHTONAXFwKpRiaV7kZWLG+g5dg2P7SlodgIW7uMKjrWaK78058du4k+WP5NQAbRcDFEtDwbEKe+xJLN3StMve4qAkxk7aLkoGtNKfvoiUaJ8SVbOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVraIwISxfZVO0A/F8AnOc9fm2ujDqrjCo5XG4GVBo0=;
 b=m1mzL5Lz7GmxraQFgKlWkXQ7cWLRDu+DzLGrMTe29bA4XfZ4YqGseXSAJMdc5fX6PKx3H5/O6PM/1HmGf4/83cA3DcOhU5ioWXorbLWwjvycpbk/q2WiXbC6YBc9VuHjzdS79yOKBmSwUKhCi62aL6bKw6A3kgG3WJlMSeEaBog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10326.jpnprd01.prod.outlook.com
 (2603:1096:604:1fa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 9 Jan
 2024 23:15:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Tue, 9 Jan 2024
 23:15:14 +0000
Message-ID: <87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown
 <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
In-Reply-To: <e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
	<ZZblyhfzQjzyoUc_@orome.fritz.box>
	<42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
	<3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
	<ZZe5sTNz005Tt4jk@orome.fritz.box>
	<8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
	<875y03i739.wl-kuninori.morimoto.gx@renesas.com>
	<e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jan 2024 23:15:13 +0000
X-ClientProxiedBy: TYAPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:404:28::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10326:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c98628-8be1-47be-f557-08dc1168d5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9CdOzLXafvdkPcB8EqEZUbh3vjsS/oj6X4ufgkYg8MKOFpLR/Hxgy7fPfAROr1YZD+bs6vSxRxC069Pgz/RkqxiDmE2JuhLcDgHVpYfptJarSvsnQEDXWfur0OFqJFVMMeBLZeGwn4jNrSfWD5rpdh6DpDMMoWVHHa3So8TwrZKkkcQQaq2PZhqV0riPnkgJUxtr0mSsYyI2p9Jmy5Qm6WyudH+HtpA36q6+1cmEfs7twdg/zzlflVhXhcxkCRSAUQBKbBREGPlLbYhXRnxs7AIivdcim4b3RIWaWGrPohcNDpcnPZqNru7QsdHVsZ6VCII5Jse4rcThSkndxKMEhSPu8MhwpdTfSi38qxVtpObEWTBOPLQdonDKBo5L+4tMr21wRAeLFlmSJUhKj+BMi5yVdp5xV0OvTuLSLhK1ig2rsUATm2Kk1sxYJDaNq7kfqmxhWqGMkHL4Qs9Z4Y7XW7XR/BNQy4QbQotQTRfhNw57laqNgk62/tmYYqhiL0vLJkEu48Vf01V3x+WxZ62uRHmFUIuyykkyh5jX5/8p/fbjAOfzPpDD6wI7WBo/2pALE6xl6fZCkPtZFGdQcsFljrqXTSTM2ALEf6Yir8HonTh08lMXVpCxKwJTJEvEINtzdnDYAGkN6q0bAQPUkJ1cXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(2906002)(478600001)(5660300002)(2013699003)(4326008)(38350700005)(8936002)(41300700001)(66946007)(316002)(66476007)(36756003)(66556008)(6916009)(54906003)(6486002)(6506007)(6512007)(8676002)(86362001)(2616005)(52116002)(26005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JDKMqyUabaudXtxlkLCLEmfj8m4NUWPoWwqvPXONxPTCEcs2nBogCxBBHL7G?=
 =?us-ascii?Q?KKYt6dnt4yrY0RvVaLB6UoN7H3BIJs+e+Wfb67COItFGnaM9JZykVKn61SUm?=
 =?us-ascii?Q?EPSPtsXXhfDXlk4UdgJAtmgJZEei8DQSoJ4f6jlFn1vR5j7NcPjVDZd3B8Nv?=
 =?us-ascii?Q?e7JVos1sGt1uCLpAfsbRtg04CVJdwlPzhgPKcvcUiz6JuAyBTFMh9QlEL/Ri?=
 =?us-ascii?Q?ngDlGMS79JpjsDH6qxUr2AZnj79EoXb7DPYRi56c5vSzK9qvUFm3Z/r0LMnr?=
 =?us-ascii?Q?nwxOB5ajeOdOAbKjSEC6oETFsWnDu6cmBUWWFCQ4soE1Kq76wl2Qfco1yO+J?=
 =?us-ascii?Q?gjEwEq5yYKvB/XEy5olx/Ja9JKvIVVsA2/D1StAVNfQGnXqDPgPS7sq584g4?=
 =?us-ascii?Q?zB/9WJ9p/4pJ6qvG1DQ2z7SDZoGoXm4wVkOAe/zPU7K944XvH0erD4nywecE?=
 =?us-ascii?Q?j2ghU7WRfsA+DQs/Irw3NYIx+GNGaeSlK5UVHJxbQeJJ/5MxHJxy/7OLlphD?=
 =?us-ascii?Q?GnfC2PrE/Ru5/8RaPE0gJPEr1SZA9zkKSq4PyKNzWjPTvGYPy29FGqbOgiyW?=
 =?us-ascii?Q?U41DY6yUkVDVbo8gYnN/QvqOPD5AVBBFLr64198tC3BjS8NPdRcWligo5cfF?=
 =?us-ascii?Q?QBvgXD0ZkygKVWayS9C6RDnDAk74Vnvmw41to4KWZ9w3epqyjEkt+Y3nDHS0?=
 =?us-ascii?Q?nLJCJ+RoP6vhp9hOulaxHAC17NeNGgtkkaNH38azStNmncSIjV+7Tah8ogBa?=
 =?us-ascii?Q?PkTLgmkxwmqfEOtq8MNqwNjNkv8eJqDhBpQlWmnpojKOIsD4RVFHDbhzaIso?=
 =?us-ascii?Q?vnVUHjLXDQXtW2Z8AIfKMqDh9Ng/bLJXc9dxcqcaMowFVtxf/+xJKZJbys1o?=
 =?us-ascii?Q?wF42ELnfBTJTuapS3UgtDQU4kZJr4HRWdJk8M3Rkoxa3fpXl133jYFgjwpP0?=
 =?us-ascii?Q?KKOacYJ+HZmhsuWVB3QrEbBbUxI8FxAghQCsWBfogHvU7/NPCs0sN+b9soKB?=
 =?us-ascii?Q?ZfAtqI0wRHJoqMTq/oZ7V75kkT5YG3cy0xWnctfrjFszSLRsg6gpcq82wJvB?=
 =?us-ascii?Q?DFvPOgvIg01HLtkmDMKzOyRYhpZWXAUvywtx+aVCqFAzN26CE65MfaU4sM0S?=
 =?us-ascii?Q?Yi+vqHTPtuNcXC4taj04n+oFq824xhoTBpMq+SQ6CfmyIRMbYL/y+ISHOzlV?=
 =?us-ascii?Q?TrV6VGvcjnw+VS7HVmXyCtSWv7Hsm0xXfRVhUrbDh7x/ehrVdUneNoQ7nqcc?=
 =?us-ascii?Q?BzhVHo85r1MS+FEaYS3L+0rSyMN6jp15HokI0MGEgPMNKlnHSpkXBVAvmqBs?=
 =?us-ascii?Q?0Fk3TDzOp0aMNXCaeJdtcHZYdiuxX2xKjFeahaUEyyQ5JOeNlG4rSOymjPMn?=
 =?us-ascii?Q?4cKq0w36V0HcuUG+FcinospLJg1tPikCIj6QCo9TxgXrhmDMfFSKRfco2E+I?=
 =?us-ascii?Q?6Vzv+WdIE1W5O/KqavxWVH0/fz1BQWJO0kiupmmRdBrvuf0EhAOeiEtdZ2gR?=
 =?us-ascii?Q?CkFLzH+AJFAPzw69CYpvqPbiB0XafAqmSldH9leWFXil3eTri1+4ASZ4CMAF?=
 =?us-ascii?Q?8JDvMV406tqfqbRgEio/KQz4BzVGiU2mKIlPI5GI4LQliDJA1g0gkzcTmzVZ?=
 =?us-ascii?Q?KOmsAR8hLi5Wwrsbh5XlGDg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72c98628-8be1-47be-f557-08dc1168d5ae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 23:15:14.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CTjd+OJ3OgCTbteTA1SlW+CT3V79bDVpsH8C5PQzRzC/4D2Pboc+s4EalxFWkOcjwpA2X2fg/5HzrwRPBndtCtnHbSbtHRItbL6kC6ilDNetV7+IbnftaqYT5CeOzMsu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10326
Message-ID-Hash: 5MITDEJI5BLEUURLEOJBX2YQTA4J37AD
X-Message-ID-Hash: 5MITDEJI5BLEUURLEOJBX2YQTA4J37AD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MITDEJI5BLEUURLEOJBX2YQTA4J37AD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sameer

> >>                /-----> codec1 endpoint
> >>               /
> >> CPU endpoint \
> >>                \-----> codec2 endpoint
> > It sounds "Single CPU - Mult Codec" connection, and if my understanding
> > was correct, current ASoC is not supporting it so far.
> 
> Yes, this is a typical TDM use case.
> __soc_pcm_hw_params() call in soc-pcm.c loops over all CODECs for a 
> given rtd. So is there something else you are referring to which makes 
> ASoC core doesn't support it?

Oops sorry, I was confused. asymmetry Multi CPU/Codec is supported on
ASoC / Card2 on for-6.8 branch.

> Also the binding properties of "audio-graph-card2" seem to be different 
> from "audio-graph-card". I am looking at a simpler extension of existing 
> bindings for Tegra audio without having to re-write the whole bindings. 
> If "remote-endpoint" can take phandle array it would be simpler from DT 
> point of view.

Yes, "card2" and "card" are similar but different.
I'm not DT-man, but I think remote-endpoint phandle array is not allowed ?
If my understanding was correct, you need to use multi endpoint in such
case instead of phandle array.

CPU
	port {
		cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
		cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
	};

Codec1
	port {
		codec1_endpoint: endpoint { remote-endpoint = <&cpu_endpoint0>; };
	};

Codec2
	port {
		codec2_endpoint: endpoint { remote-endpoint = <&cpu_endpoint1>; };
	};


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
