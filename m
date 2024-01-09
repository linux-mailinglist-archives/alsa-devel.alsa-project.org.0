Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E119827CD2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 03:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3498826;
	Tue,  9 Jan 2024 03:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3498826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704766708;
	bh=nls9x7Q3AIORc6RkHHRWftquplbCUi55OhAOLzAP6aw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LiteXyFaU8aaPNNha71/eWTuOE/EFRkZhiN+GhQC26f2/J2kuxLizPTXhMO+WQKSD
	 B9cLltbQ9AJEcP6SfLT7WVwwpmeMyq8Qsubk+98Tp4/ydU/uDCnYV9gGJL/QVP398d
	 5F6eVcDv88z6rtOKwKurLlvMe30y85Y5+1O68AFk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D7EAF8059F; Tue,  9 Jan 2024 03:17:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 804DAF8057A;
	Tue,  9 Jan 2024 03:17:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D0FF80254; Tue,  9 Jan 2024 03:17:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97225F800F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 03:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97225F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Oc/XAG+g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSv4hUiUtYl/fQfn1Hm6xjI5mII4fb6tyxoq8Z5KBIec9saEWdK2ghgx4c7ccKyUOeN/McP6wL/ZpIFN95nHGNA4M0BwF3pgTLpwq/F7pUOHaQmD3rv2EWMH1TICzvBuG0kftGveyk3aMFvH0dCXW2Zv53CB1zuqRiJTpQv7be5dPG9UjVdsIa3+3R303Vx+fEliCc6tkFHu0N0gqdLKIJsFfNiD8h+uRsjF1z7xJEJNoxsZ1ABF/5ADhbICZLq/ZCrhagQEXzaeu6wAeP86k2Zi+fXn5iXO4LzfWdO+m6j4DDL5gV1t3Nv9o+U3cCz7kSR6Ge/BniJoVnmlBeIhsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klqRr6/8+a4sTaVdQ3FY2UrdJi2bxntpe83F94aSq8E=;
 b=V6xSTp+iH4aBlf4T124kEHr1LFslEtPW5tJv9sZ54ZFAiVElq8odzRLZ39kdn2OQhSfF0vHrl5o2KMmtCZoif0l2rYSwtfiSKjHeeYu8jOcZQAEz0EIDlHKuEg9Xo6ntj9Q0zuDohOOClXDyU3nY9BUg9Ng6OQ+dvtMuasnIcqlCgxQroz/FB8fbrR2Qg8PDl6pJqbsLC+KE7Up5lB/mybM9rXufdB4vK0HYMaDBYMbX9+RFM9hfDDFU4P+pSfxveJVN21xPTfyvKVxlwRRgZWLtDf4fx7618VUS7C7K7629ewiC4BL8sJwa9g/QelcoLihGIeRdXDWAvqPzq6unfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klqRr6/8+a4sTaVdQ3FY2UrdJi2bxntpe83F94aSq8E=;
 b=Oc/XAG+gTL9rq2iwT7ikbTlD9xWfUFldsiZX+k9pVUD93H/xrC72dfkTV6GGRhbHML4XXvso8Eh7MYnaxIX8FpBpHnKZjQ5iFrALQEtz3UnZnhQH7yOYeTTDE4eSeXBQvJY/sROdr9Z9hlma9o3kh5dRS4OabrvAD6f32jxdTI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11111.jpnprd01.prod.outlook.com
 (2603:1096:400:3f3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.15; Tue, 9 Jan
 2024 02:17:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Tue, 9 Jan 2024
 02:17:04 +0000
Message-ID: <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
In-Reply-To: <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
	<ZZblyhfzQjzyoUc_@orome.fritz.box>
	<42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
	<3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
	<ZZe5sTNz005Tt4jk@orome.fritz.box>
	<8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Tue, 9 Jan 2024 02:17:04 +0000
X-ClientProxiedBy: TYCPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11111:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b09540-32e7-45a8-03ce-08dc10b9126b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A4+4ukqMVe8q2xWroMbzJcaqgz1PgScuqMls70UrjAcNdtqhowd3J+u5/uBnzJVCuis2oGc9pgNCTU8cQaFwDM7mRMXvxL+4zi62vyo+nTVrx9kiIk/+BluROdA8HgWI4DLPwwquk8DcLu3qf6X7LzZ+50W0YB6exve+6UIjeqVXOaleuQLjWd+0z1m5YNUEX/7kiS4UGRfcYSW+XcptlCqXo7p3mHlD1tIwq32o670ReBCy8GhXJ4iiI2FxIW9IjKRRVmmweaTgVL2ZHoR4ce1RpvJIR2yNbvqIKKGv7mAYBQbkN4loi14t5O32t/A0zm70FO644KJTiSImpD2iX0yZ/tZXaxfFOnkyUb4GwTyaypgNiJWQn9ROIQZs/k5iH3O/yUgpx4snmaiI0flV2DNH2BqyJA3aPVbjtzpKTuDJXej+3aRe6zrOFXcLeBvTXyQ9kObhKcZeF8SW/HronzIlW9sHdpUTYfoBegBcWA/jick3BAVMa8+h2Hbhlz3ZhJw4CkP4dLpNUezfSlQUu1zTiOsXIHUXH3rCC3cCPWc/w2o1HsJZcH2/QKoIsuevMAWoPx0I2MOrhuT9NgjbW6ZPRcEdTdf/aIuybR9u67W+b3rkuJtdWlOuNf3kJA4+9CXOpT0sz17CNnF6ClM+Hg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(478600001)(4326008)(8676002)(8936002)(6486002)(26005)(2616005)(6512007)(6506007)(66476007)(66556008)(66946007)(52116002)(316002)(6916009)(54906003)(5660300002)(2906002)(38100700002)(41300700001)(38350700005)(2013699003)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?yOrMHDcunZ5rYbRUA3xgKfGcc+isOMUaGvEFQYByltPe2+xUzCxHcCnyPf?=
 =?iso-8859-1?Q?vGpY51VntttLBOw5CP5n0Ee0c42dA5O5+C20MVgBLa7cxPatEXCsbNdgi0?=
 =?iso-8859-1?Q?AvokZCtVGK6TlkhBkvwJqa/bxk8iMwQ3O5ZFEeo6Ar90mg6LnZrSV7j4nY?=
 =?iso-8859-1?Q?oU3owwUKDZMPD8xUBttcfg35BHWBwElze0xAJ0tm4csV8Qg++YKTwH66vl?=
 =?iso-8859-1?Q?D9jmD7Wr4/ZI92aVp9vPLE2XBSHLFdVHE1R2xV2C+xi6Ny/4NHPYcGoCZR?=
 =?iso-8859-1?Q?zAWWmqVPEeA316lETso1k/Pb1zIHMo7o7bEuyh3s1l9M7PfpNUHG0DgKFA?=
 =?iso-8859-1?Q?lF2CGxhWVxbbT2BCEhVUMPhnUfACBo997N8zMg5llIZ0Bg4jpmPvDhwhea?=
 =?iso-8859-1?Q?o8xy/Zdtc2LYpIAQRZ/WZ4MYD6EYUYKSVti7lbCdB+13gcmnI80sFG0Hf/?=
 =?iso-8859-1?Q?x2TDKGUWi3LKH6wOyQ64yVXua/MoRwa46jhJRbmZ0vziF6q+ZyU2tbb+nI?=
 =?iso-8859-1?Q?nqIAP3xLclPMWJk4CKOMXBNJOHDwtDE5POEXqzqxFEcmedEi6Mz4YEaAjW?=
 =?iso-8859-1?Q?y+2Pg7Kl1CSU+PtJ4s16gq2bGHM8nsXbFhsmDOh6OhzbA7ztftOOnv0R9Z?=
 =?iso-8859-1?Q?D7mjCTlxcUPDPZOH4vjyBMXoTbrpPZ/j0ONItuKtOs/hILG4MjYWpiY93n?=
 =?iso-8859-1?Q?hXgLYogLZJke0vS2N7kVAbyUwj1fpJpY+I/11kRgG1ZcND8XlIytN2SKkH?=
 =?iso-8859-1?Q?nW1lrRBhtE8MBrY45clUQBRsRSe+8HZfHnAyT7DVcR+V686NUTfaFJfXdi?=
 =?iso-8859-1?Q?hkkUDFFBQm8+DGO76PkIN6sIw7pcWQx8uq77JwXshiyydxvhGoX1iYTUc0?=
 =?iso-8859-1?Q?bxMbNrRgN8bmKooxiVvKbQHPK08f8AKV7/J3WN0V7vz3unr2fO6qxS7o8C?=
 =?iso-8859-1?Q?QFrFCFgE1ziExqYUj9iC8we8yKbZREcmfkGEhRDPfICrA5SOdR3Pnx9FVV?=
 =?iso-8859-1?Q?CwyIsy7Y1aIMkocNOF1JIdYUsTR/kp3kMRHPSeJvcwrv3c6sx2DUSoZqby?=
 =?iso-8859-1?Q?y5lM76iUzyEdmmBog6lVjaP/Hz+tYRHshvCws2DDQ/my1B4xl2Ef9KTNrm?=
 =?iso-8859-1?Q?icJ8TZjH+XDJ2aIcBuIT+Q4DZHmLYW5/gnnEj/qpwUV1rGIp9Fu9PjBqd6?=
 =?iso-8859-1?Q?ha8ViSOkMNqiGkplWkyv6csIWokXO/qbHR2Tf9hvxKF2wEPZxp0s7vo4S7?=
 =?iso-8859-1?Q?gNrebb2bdWk0riZJHePg8RFvAWXeO7vRYupyt2gueKycyKK1sAgf2H+jyD?=
 =?iso-8859-1?Q?IikIOwUSBue1Coxz5iHNpEpgKb8JKocPBfWAz4A71JBvzSwEAEXvZ6/WtJ?=
 =?iso-8859-1?Q?TXNK9fF7+naoj5EJsh2tTrsOw9tUd7y7KjBkR0+wrB+2BFGY/RZsIVrO7V?=
 =?iso-8859-1?Q?LUzJtIX20BK2CTBOoOjb9iRWbxGnv75eYq74nlCPYTadP/uyBqoLMoJB84?=
 =?iso-8859-1?Q?LoXAhQ2kQUWanqfwC87DDxaAx62pIRxhcYuDAySMCy4AkWzQCg0SiqR6pX?=
 =?iso-8859-1?Q?KvrwghohYJ4ppqsPWx0q+2VhvpDGdqmayivB/OCdjLm8j+2ftdlKEDzlLI?=
 =?iso-8859-1?Q?RiZDECdRhCn2DmSap7lNyqvYjvuhOOFaitf7xVrM32t0y7K/U/GuGlZKF/?=
 =?iso-8859-1?Q?/lWTsLblMUJEXhxrF2A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4b09540-32e7-45a8-03ce-08dc10b9126b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 02:17:04.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EtfES2L4nvg8pXWyTBfyvwOt+pkeIpTTf+fSuCYa6JKJrFZBjEmGZPpBL8EX0oipDKLrPM78Z0qjt1Vzvo/TWvigQqyap6O7SC6sUo9eqen+EBo6ORjO6t+3z42U5x24
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11111
Message-ID-Hash: HNJXAUQBDGGXG5TGA5AMT27J4W6KQQJF
X-Message-ID-Hash: HNJXAUQBDGGXG5TGA5AMT27J4W6KQQJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNJXAUQBDGGXG5TGA5AMT27J4W6KQQJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sameer

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /-----> codec1 endpoint
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /
>CPU endpoint \
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \-----> codec2 endpoint

It sounds "Single CPU - Mult Codec" connection, and if my understanding
was correct, current ASoC is not supporting it so far.
But dummy CPU with Multi-CPU/Codec connection helps you ?
I'm not 100% sure though...
See
	${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dtsi

DT looks like

	[Multi-CPU/Codec]
			 +-+		 +-+
		cpu   <--| |<-@--------->| |-> codec1
		dummy <--| |		 | |-> codec2
			 +-+		 +-+

Use Multi-CPU/Codec connection with dummy.

	audio-graph-card2 {
		compatible =3D "audio-graph-card2";
		links =3D <&mcpu>;

		multi {
			ports@0 {
			/* [Multi-CPU] */
			mcpu:	port@0 { mcpu0_ep: endpoint { remote-endpoint =3D <&mcodec0_ep>; }=
; };
				port@1 { mcpu1_ep: endpoint { remote-endpoint =3D <&cpu_ep>;     }; };
				port@2 { mcpu2_ep: endpoint { remote-endpoint =3D <&dummy_ep>;   }; };
			};

			/* [Multi-Codec] */
			ports@1 {
				port@0 { mcodec0_ep: endpoint { remote-endpoint =3D <&mcpu0_ep>;  }; };
				port@1 { mcodec1_ep: endpoint { remote-endpoint =3D <&codec1_ep>; }; };
				port@2 { mcodec2_ep: endpoint { remote-endpoint =3D <&codec2_ep>; }; };
			};
		};
	};

	test_cpu {
		compatible =3D "test-cpu";
		port { dummy_ep: endpoint { remote-endpoint =3D <&mcpu2_ep>; }; };
	};

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
