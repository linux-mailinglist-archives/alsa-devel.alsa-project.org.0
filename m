Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECF6954B4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 00:23:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA6382A;
	Tue, 14 Feb 2023 00:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA6382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676330583;
	bh=kUPwvuLO/LeX+b3rWrkrEPzm/9UMmvUX8KqEU4aGcSA=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PMVrjjQ4D1SDbMWx4zTgko+nztNN2KqMkq0QSw+X2XgypdSlIjpyEoiQ8xtmFtatX
	 vBn5jS0DoIPBwH20cS7t5+myIODmm6SKM+koZflBbGfu6nGV18T2GNTmeGpUmjvNkp
	 r3Uk5GzcC09NxxtmWIp0wIRJUwd0z/hSdPw7mVm8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82212F800F0;
	Tue, 14 Feb 2023 00:22:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82F5F801C0; Tue, 14 Feb 2023 00:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF52FF8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 00:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF52FF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hQYJbPj8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq4GShH3+HcnX2GX5Nw7o12N5e/7+APjVIg50bGBtto/vEZ7CV2FdMjvl+iOeDQ6VDHHOUj4iK/5Cxrbs1FWt40Bt295T06PRLTiPtOKqmfmkXxM+FH9LkYLkbdLfRPh0ST1krgW1NDKw2iZN2A/j/fbSdl7/mIZ4sGNIHvx8UT8ra2pstBQ132kzOCxvgiHA92WxSKL8aVwgQcRio/Fh+YLduyTmJnU+J7hfmyIM6tMfgKY9yE0V+7GW+SoUQ/7lzeaYfXVLbZoEqv1rJSw6eqDwE5gbod7/RmtFpXSg+SxB4dWE5CwGbGVqct1+YPkg2rxdjXHzkKIOR2IZiGy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSsyjpHuBTfnC27ekEHdH/OnR608UDO5p3ddZ6HUniw=;
 b=hm5Petqp6/0XPe+xs2W0IRETFOE4/cNKgdEDa7LaBBj6E3l/dnlF0H022Zz1pvbCkofnUD17Y3/ULcTm6/oN3b99ULc8UsO1nu5NfA84SXggnog/IyuHlqjwaLnv3xb1whqwiRKwzdu805C8NoCgqpqEDgiFrNQrh5q+fheAcNZJyVBAmt5ZuTG+aGg8uP58xzSAe2ZyAfYjNaL25v4xcc+N0vYVTb9SOXrQZDzgrPYrhIcgoRfVf71Rc4C+S3aEfsP7yuu2mJbq6megdgmAPLwSq4vNi77JPePjg4Hvekv2HfUskc1GZFSb/zj+VVwNO2hgoQBh6mjiOEue3AOraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSsyjpHuBTfnC27ekEHdH/OnR608UDO5p3ddZ6HUniw=;
 b=hQYJbPj8k+AoYt0Go1+Jo3s+bVD5VI0r3fGbbjQUEG/iCs1EizefNIDIGsxhM43lh+unI3af5YoirTP7vonqzrVdZUEYE3MuoIx2QMratkhNaXW+hToxiiYPj7giV2dyx6DsXwqj2QuXkk8D1QRKvhMEO7arSTzLP1QpFugEXKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5977.jpnprd01.prod.outlook.com (2603:1096:402:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 23:21:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%2]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 23:21:43 +0000
Message-ID: <87ilg52ltp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
In-Reply-To: 
 <CAMuHMdU2_5SO53qs1KVcv7p5O1QP-DWpxVpUhmpFT3MQFKVO5A@mail.gmail.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
	<87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdU2_5SO53qs1KVcv7p5O1QP-DWpxVpUhmpFT3MQFKVO5A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Feb 2023 23:21:43 +0000
X-ClientProxiedBy: TYBP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f20b2d-417a-4ebc-667c-08db0e1911b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B/p2TfHtzuAQ6OeTMlSdGS9dGqUFL9+Z+xffEn/F9yhEQVmX0gH4z1u9J7Xr/SBjePIa8gc3GNGw2ngh0E8jWbl3UDF5p0JlyYwcKpywKaEGggxnKcJ5imVhyD6MAMoir4DHhwiph7AaQyKD9gJOvMw6KisfPOuLOVHyBqEMF8iRNUm0LabMw5gzYVBWLVneqigfBMg+j2vdfSeRdHh2abC/JDvT2XmkGID7A2DAI1qr8kaD2muR2HktY4nDYvpjYaKjjfOSrayc/w6adoZlwRp/o//YM6K1Zka2Cc7kXg4G48/dft8UERKplakgWn2pxpQtAHaUwAJoMSD3wJxkOrj69ypXMuw9F+NAraw/wJfyrWmzobgqtN3WkpC+qCyfGJfWwk+V3rlnXAyw4pUObLan268FYQAMykO3xEKFgq1qyqLOsXUI0gikCbC7J+92pIcgsMnZveRogDZYXQDeGdi+hHTOxUN6+K40GxD18NGSWil/fIVnlgj5CjvGz2xH7ENA7pRDC29uP2jp/yeA2hwV2rNLIwHO1dJVeEMyak5FfFRayXtvZPIokKeb+L/EkBZrgnU97KQZYJ3xOYMFSqpML3rEHAsdJdXMrgFn6mZRYLtysz/KmxG5unXUD0N9Buyk2wem9sZd5rIz7qprkDI4uylBflw7Z+kAN6dPIssTSpaeugo5NzhTd4I73A3ISqomdYJPxzuiMDxXHTWzXQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199018)(41300700001)(5660300002)(36756003)(38350700002)(2616005)(6486002)(38100700002)(8936002)(26005)(186003)(4744005)(2906002)(6512007)(6506007)(86362001)(316002)(6916009)(4326008)(54906003)(66556008)(478600001)(8676002)(66476007)(66946007)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VH7mmAQ+iiomF2TyjZeogISGJEX+A7P9oOC0Bls1m+Qwsqb478UuRp3msx3Y?=
 =?us-ascii?Q?p8Jej0/iUj+bBGg2dnCzuzMHUEosmMuMx6NM5bqS00W5Va8BoAD8ObmQ0FIz?=
 =?us-ascii?Q?TZeGJwlKVIPEDjJrCJCc0LlTn2twTPzaHxOiFgFzW93oc+h95GvSmRseVqDh?=
 =?us-ascii?Q?+xmtzRMDV8oCbKffuTAs+yvTePj5XO4SpaqLf3l0jJW3pvibX1KAsKwa3F9R?=
 =?us-ascii?Q?vXxc9HVVH/mf+nXhpzi3wfADdqvoaIi4AFyvMw5Jn7LOWlTgUCsbcae6vy+v?=
 =?us-ascii?Q?11HSZrJ5D/j8XJdQExDZv7etvmLOIjUJTzesMt5xTGYVUBVL+s3r8adPfaLf?=
 =?us-ascii?Q?CTlTxgJcndKagA0YArAorm0Q5EQLvzxqoK4+cM8J7EZKBffH/h2Tk07Tv1O6?=
 =?us-ascii?Q?8Y+UEV4RBJ9FOG6ANO/9vsgNC0HF2AcumuNgWjajPMWfTlmBoydiO0TErq8L?=
 =?us-ascii?Q?pfyxaHxtEE5SLR/b8UHCxUfV9ssbn+Vsrl6ymkRdA6q8CT6PLIbNi/2njycR?=
 =?us-ascii?Q?EIawP4DEgEa2TXZWdzRJeDivCwc+rdFUYEF1QBOPpRDs2t1dlH1EvRgKT2I7?=
 =?us-ascii?Q?fQcSdiY3EZ4f8cVMxXF7HHN89SZ81AjAkJkFqSntdlfErhD3h4r1DB+DwDxU?=
 =?us-ascii?Q?WFvCJrbJryDOylOLFQS0O8lKDzWQ9NQ4Hyhh+dF54EzpA8KcouDQG/lKb4so?=
 =?us-ascii?Q?uyc78vm2S2RmiPPOWMWMu1IprHru+5TB5NOa9Ua/9tmceTdCKxmoQMsQoW1/?=
 =?us-ascii?Q?mTf7tcc/Fvi9aKoF68AnGO4d8s7wIBHW2mymQW1Y3Jjb2411CaqFhwrsn+Uk?=
 =?us-ascii?Q?W3IHCQAW4MpP/PQvFh7/vFOpnRfrnKDDs+G/4p6WG5uwDAGKR1QtfZ0eHpv/?=
 =?us-ascii?Q?Ct6GRWTDULhnktLgqTHOxesCjGWFuHo+B7RXrd8M2jWg0stzLcrAJfTPOy9R?=
 =?us-ascii?Q?LIaIaLeIqHfcvj7B/J1sKAgECossYzYXWoeA1f780g5dxMmD1Sa3LLVJDQfu?=
 =?us-ascii?Q?iLaGh7Vydi+/soPKLtOgdGWPL9DS5X4McI3aJJ/m7kJ88G3t4rfd7w81wHC+?=
 =?us-ascii?Q?hqQcVSLw5g0QZFIiOebFG0VtQjdX3H8Nn0GdFdE0BVoHP7of9LO7nlhDXOj/?=
 =?us-ascii?Q?nMRwXwLT3oq427bTRMbGW2WYfvETK+7ugWy+5ckOrMFW1ubhSK0foPtT4Csf?=
 =?us-ascii?Q?ZM5uKLYR+n8rOU64bJkjBh5qPKB8K2dhA/X8zMMj4cj/w/oF4LUSLANNO9ji?=
 =?us-ascii?Q?79nQ7rntiQzo1Mx/P/nQrLaFkIxf8YiWWEhbiD0EZi9ICXBH3PTVluTNIhbF?=
 =?us-ascii?Q?S0uvvn03MKt6QX5GhUcWaM594vTPB07de48AGQEjhva3lRlhvOCgbUjfQqoZ?=
 =?us-ascii?Q?v5OUjcvMgKONDBfKJI8HbEcEbUvzXTZw5heyhVT8tPPAZaGAdmYZjHPgQ0P9?=
 =?us-ascii?Q?Y1sJUhwYu/2iVM20kR2/JBrJJ6fKlEyDJ1Q++GWdKPUEpSjGaWkiC1wd/vt0?=
 =?us-ascii?Q?DvUCikXTUwU20b2JfIJaP5+1IvMosC+h3v5ypuMtnZhi0W1LD2+trfSNZ3Jp?=
 =?us-ascii?Q?N6xiPCK35INAnOVO7quHmLL/ZSlV+p7M/kHMj3F4U7D+YM6O26sWnATlEaB2?=
 =?us-ascii?Q?fCwGqUsONseFFgrbuDslPCc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67f20b2d-417a-4ebc-667c-08db0e1911b0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 23:21:43.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hgZWeLvQDDykZr02mw0qwBe7TuXWRWLy9zGDZA4D2vwOhnzfy0ELl/j37LiKk5ewFPSHOXwuEgJjg6J746BikYgKSCHuIawoJEb++/45HxMBt122nbik3AUtZQz6ggsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5977
Message-ID-Hash: JG65U4KP2WYJCY4WOPGLST4N2CGG2EKO
X-Message-ID-Hash: JG65U4KP2WYJCY4WOPGLST4N2CGG2EKO
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JG65U4KP2WYJCY4WOPGLST4N2CGG2EKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Geert

> > SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
> > are not mandatory property. Drop these from rcar_sound,ssi's required:.
> 
> BTW, do SSIU and DVC support PIO mode?

Only SSI has PIO mode, others need DMA

Thank you for your help !!

Best regards
---
Kuninori Morimoto
