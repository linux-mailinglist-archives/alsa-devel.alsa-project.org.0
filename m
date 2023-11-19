Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2287F09DA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 00:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C4BF839;
	Mon, 20 Nov 2023 00:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C4BF839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700436610;
	bh=7Apmke89aJbqI/GN4wBJ+gm61ZP9fcrkctsJ1xPspkY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kr0vhFDsmIa1qtIL2ulge/FWNlQzU6PfAkiZYR5VmAlyoZuf7ArxkeOujjJWaTTwG
	 UEHkz4VXI6NxdzxK8OhwIlN5TEoiXxM1d7ke+CDOHfHp6g+pgFeRoYfFUbpGJMTekq
	 7G+PT8rxOS9Ewmp2V9LVKNKaa5j46v+bKoAroiF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A67E0F80551; Mon, 20 Nov 2023 00:29:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6842EF80249;
	Mon, 20 Nov 2023 00:29:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 182D6F80254; Mon, 20 Nov 2023 00:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4279EF80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 00:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4279EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kTLF/kaj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awfq0QXoq4XkkmklbArFvPkaDpgVNaHbpHYTl2ugYSG2rpjHgWwR+CekcLCEJTGgFJb8KPvhxBdMgrk7OUixd9r72q/2ztz4yOtToCKOd/ZLo33UMbYCuBilXah3fyl8X6pII/RDuds3f1gSVw1Cfjzk6tvQb6fTxufxNzfSn9+MhEuQNKfs3H281km8Q/Ggz8v95WcAYbErYVdUyd3ojQmcLe/AYxLs+ofT60BZM867bn15LR9+OmLZp0YvoliaWcwIFhbwe7k+CwdF6Sf964DxAb5h2Kg5LWI9z+qLvoyb3Fvaq1f2VNU/H1AidGnbH3mHIT34EC0sDNR8+pvOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nW1q0jTZM9NOjgcgFKIXEzfDYIKoyqOWZoSR5lLM3Q=;
 b=MXdY8yOvDoFhZVdWXSY5Fiw1nusqE8usEbwWLuUW7EouwM/WUzuzfrZx7i8DrArzERaUcOiOjK2oIASBVa0ckzaAjVgJUr1OxWK0SbzbxviexmZNB/qegWLToIuz22IMKvHKcORyPYjqXv473PxSEg7fZTxrT+JH79gP77eHn1ZrIdxW+2dSGoP2YDBX4PWlIsBonjdY3Ope8rtcTfXsUgBWBhS5Dn/VySgXuVQwUDowOiTum9vVY8tx3iMbas6Xi7Wzy5p0CjQNqYK65Y4hxLGMvWBI/8UTzXcC7PyTyzsi9s8Km0+D5Q9mjqAPFTaSbhMjRKH6w2HH/xEiqg3Rew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nW1q0jTZM9NOjgcgFKIXEzfDYIKoyqOWZoSR5lLM3Q=;
 b=kTLF/kajoly5STXgIjY70pbNhp3gfJIhLquHpCGSUL+FuEnbxGDqBbDCOhj3rvke5pRDsUiZlPSLWwdUVTOfQbvpU/n4mvJEb7qBcUnTg1han61Uu578UNPK/Nc6zuZLxqTt9y+EegiY38WErVL3ez67cx+tCjSBBhxy1HIL7n0=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6220.jpnprd01.prod.outlook.com
 (2603:1096:400:84::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Sun, 19 Nov
 2023 23:28:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.026; Sun, 19 Nov 2023
 23:28:53 +0000
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iuliana.prodan@nxp.com" <iuliana.prodan@nxp.com>, "shengjiu.wang@nxp.com"
	<shengjiu.wang@nxp.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [RFC PATCH] ASoC: simple-card: Use dai_id from node description
Thread-Topic: [RFC PATCH] ASoC: simple-card: Use dai_id from node description
Thread-Index: AQHaGXSgqKqilaeU5kqopIa/H3nty7CCTJSg
Date: Sun, 19 Nov 2023 23:28:53 +0000
Message-ID: 
 <TYCPR01MB10914A8D3BA6BC9387EC2DC3CD4B5A@TYCPR01MB10914.jpnprd01.prod.outlook.com>
References: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB10914:EE_|TYAPR01MB6220:EE_
x-ms-office365-filtering-correlation-id: ecb2f27e-ef62-41f2-60bd-08dbe9574b1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4BENL2Koq3XSukr1M+rskhIX0LOF0VtoFpx/aIAn82qaUgtkUnzBUoOG4mUIDvO8WaMt/br/ekyVa7/ofmP//vIVM+H9d2sVDcIFFf4vGNYYDBFxB0iIQRzYaM7iV2eWrhOmkLJIbwQhY/ZfzLc+SywBi1qMegvrvG4WH8kDRCAm2bEU7NwD7Vt0b5T7SM2q4Bp3OV3dX0DUivMrl940Kb0BxiJPwbBWLs1YIcLpVRQkGCUgfVGpnZKlL+pzKvnezm3s8T7oImilykXtcX5ZNgXHaGDlgrMMKjONp7mOnXWjJkbD44VleHTrLB/89lp4Y8qc+o9s3E88K12KO2LcaYaj5yvZfowZqn7RyxcBvIwEZWOvG60Zcut9Q5hRC4NBWNDJ7P12AwFAM/cSTnmEBBx0xqOcuY6UpSq3U8evePCU8j7DG0OKqO6nwgiGI8u3IMrXCVxBh5zO7lQsn90tHAdW7sIdeU8pv+hn6LSpitDVT1Fw55VbjF4OruaHpG+aF5wcxifJEq8wlWn54cUbTFcw7zJw9EOITYHJgYRpC0ihmtlWbjNyQklH3Q8Wktnv1mdBKPfHvV+Hs1Mlg4MlMXeW8xvh0yFJ27xUdgQfqAYGdwC5/444vED2sjts/YDD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(41300700001)(66446008)(64756008)(66476007)(66556008)(2906002)(66946007)(76116006)(54906003)(316002)(122000001)(38100700002)(6506007)(7696005)(9686003)(478600001)(110136005)(71200400001)(107886003)(5660300002)(33656002)(86362001)(8936002)(8676002)(4326008)(52536014)(38070700009)(4744005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?98sfXxzSLd4uXCCqI8r6ybovU1cso6Idt8BM1S3tSYL/n1VSLBEqqIA0SnUL?=
 =?us-ascii?Q?A3r18q9V3S3po4Appjly+119hYZCc0sP3+0WpfdAQ/dF0Uphciv30POkpx4X?=
 =?us-ascii?Q?p8nsIuZPWtlVWLBNOibTxocLxeiwvBQiHdPcs0uFT7ENPesmpeZykqc7x8Xd?=
 =?us-ascii?Q?v3J4T7dQUSNicG4nF2vHX77tvaEcGWGJoaY23DefNDeURO8q0llXQOtpiXuZ?=
 =?us-ascii?Q?KudLoLAsZXl7t3XnZbrDkMZubIx/BelUl5rfBM0xfXUYVUEPfFzhzDK9K8aJ?=
 =?us-ascii?Q?/1KxrB1tjej6zy2uD41APYg8PaTh+Ag6ezWnW+YUGD7s0ZErNm18BIblHGF9?=
 =?us-ascii?Q?L5zjcamsdCh8fKl/iS1iXjSaYmtLDnTHDaxBmV/31lkDEZTMjkAAVTJeiIVl?=
 =?us-ascii?Q?SyAzNIOdrdFJOvcn4TWC36tUfdw+FSiHEcR+SU3Rz+QSWWT6hvWwfq6+pjqZ?=
 =?us-ascii?Q?d8A8eK1P2A2ebF+poF85cLEF7ReF2xdeJUUDY3DGc0BoRmN7W6XCw7Ls7nRT?=
 =?us-ascii?Q?Hhrh/GutzJOfsCF1kLsrT7Eclqt8GwkQGuC3T7JJUOv3Nq8lp3cp/cV4DtzV?=
 =?us-ascii?Q?OQJTarbdCIMYarJGdkYdbzPJTvbnpp/fzNGVlJa1ATt/Wu6NrRsQUdo1DCVZ?=
 =?us-ascii?Q?AfzQXIctNpAmpGVB1CG+pC2gDIri6ltjvCtSzgaAgz2XHxJ6Cf3C3BO3s/VA?=
 =?us-ascii?Q?8w758V/1nQfzQpoVPW/YiEL2bmNofh/HUJwmCa1xTvn6wtfcfAEYhHh/nrim?=
 =?us-ascii?Q?rx7/IP/6xDg8BnQMhGtUEWvcmPLqSz0WbBTG4ENYaZFtDxBuM9vC8mHFS8hC?=
 =?us-ascii?Q?yQLFIl8wYIDHlE4OAZIpiA64NV/OkObz9M0Q4ETVIIxzSXRICm2bnjo+8oMW?=
 =?us-ascii?Q?zRLKiz2VHKV1pWrDSVcT0dM7UhqQJUkwiVu2b/keJNK9jnF3DnABUoxjQHBh?=
 =?us-ascii?Q?5/v4CsHey2GbyHZb9sNtnyXS8YeGjx+1ikyzFBMKbdCCDSdzY5ls1Q4YdEb7?=
 =?us-ascii?Q?kqYLOS3cxoXAW6MT4VtV+UQMSd4tcnYFfUfLF1raLINqEaHWG5jTbzbi7O8r?=
 =?us-ascii?Q?dI1aYq0YJB93Hl9J2ng/SiUZPp43eU0pTEDpGwgHUmjh8LcfUQgfb9mvBWeJ?=
 =?us-ascii?Q?q4sMVJBkw+y3z5jLDkZjGgxTQxiA/4+AMRwniGzlHua3e7ypyeZGoZNJhFTV?=
 =?us-ascii?Q?CcpL+3nhlozjr616uQYFqm9qZfei7dnlFyyqcbmZjeq7jQvJ6kelxIULWjb7?=
 =?us-ascii?Q?G/HqaGR3YhMm3JG8vUHefmGYfI7M+svL8EDoqXjv4IE5RfuxGXVhvIkOIp6O?=
 =?us-ascii?Q?iKhaPA2408uyDTh7zOaDL/xeuTAZV4FCCt2wbfkP2xULYH+/5QNvk4xqWK50?=
 =?us-ascii?Q?QSKOhqUNrk1EdIqEcZpC7SiBMLwuobmp4nlqdZhj09/YS6nYNIyKem3ecCaV?=
 =?us-ascii?Q?GAGTgavOmLzKIS7pcqDcCKQqSuRMS+3ymaKiEj+35Y//FY3WHEJlmAc2Us66?=
 =?us-ascii?Q?BsNNuxZCB3rPahyelEfnGd3hL3vcX1yS98YQzrwmf2OaReOgkTed6NyNNv6A?=
 =?us-ascii?Q?Tazgw4WWChn24To4Ab/UzjU6K5p+YYk6wXo0ZgkJ48zLHuoLOhLmmwBUEi1F?=
 =?us-ascii?Q?EohyUZYPPzKUBmS8V4XMGoNjOh6nJEi+Rp5akCIrTqsIrDpafGnXyBjGlzDH?=
 =?us-ascii?Q?sJRdqw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecb2f27e-ef62-41f2-60bd-08dbe9574b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2023 23:28:53.3941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 FMg+MHUUkR9p57awbm/20ouhzFuGolMf/odHS/IOSvCu0RZnLxglH00VfQTFmeGI6OcbPxCIaujz7TCCcBdaIWoSRL1Ma/HVVpmBUcIbRBagIhFcmYPZPweFPq0D4MNp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6220
Message-ID-Hash: S2ZS57WE2ZXWM76JAPHPZGKFP4EU5E3H
X-Message-ID-Hash: S2ZS57WE2ZXWM76JAPHPZGKFP4EU5E3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTFZW6PF5AHDNK6ICPN7BIK63IXPLCFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Daniel

Thank you for your patch.

> We can specify DAI id using reg property. When dts
> node has only 1 DAI simple-card always assumes that DAI id is 0.
>=20
> But this is not correct in the case of SOF for example which adds DAIs
> staticaly (See definition of snd_soc_dai_driver in sound/soc/sof/imx/imx8=
m.c)
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
(snip)
> -	args.args_count	=3D (of_graph_get_endpoint_count(node) > 1);
> +	args.args_count	=3D (of_graph_get_endpoint_count(node) >=3D 1);

Hmm... I'm not sure how it works for existing drivers.
I'm busy this week, so I will check it next week.

Thanks

