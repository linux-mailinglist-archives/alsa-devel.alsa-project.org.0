Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD47484FBA
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 10:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 986131771;
	Wed,  5 Jan 2022 10:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 986131771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641373440;
	bh=+md92K6eBmJFPmCRL5A10W4V2eFt1R6FWVd5LJX5CB0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nTHnyL9SfyQDgWuKwk8lupG+pwFuflAJI9kH6PXxH0z/jpdNuN7Sdp9XwoELAguNT
	 6OIc2FFLqW3fDJy3KcFN1c9teLdA1MBrr+BW8mjoOxM0S3ft/HzWHUKJAy1RJzA73r
	 AxWAlzf6ePFZ9XlP/6Tu2pmeHKKeqZhAnGZxEcKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BF1F8020C;
	Wed,  5 Jan 2022 10:02:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBBFCF801D8; Wed,  5 Jan 2022 10:02:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 080BAF800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 10:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 080BAF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="anPL2R8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAyNLZStNMLRyix0JWeVJZabvM2b66FcmR8k+lRbD07BkmkA/Gw0lSRIi8uREOaOYE4aZmOtP1grlUfuKECNSiTGhUOBZ2w1Qpy96d5P70+nPkKWkuGzAcjaTzu2noE/UQNInDB4rWnVLwQlgRgYhEegw7l1M/TR47iJj5InWctVjMgt2dszLw+H7k59ywsxWEQf9TKTyfXSXaH1mrVnESCDVz7EZ5jrpH5IOB3rgakCen9jC3t4ojapby9zNBKoM6OaeWMJgQW0SX2bUDwi8L9mHR2Qw7RCqk77Z9erWrXOuF7t0OuQuVrg5A84cwkUUT+4mEfHXkoiXdiu/vRBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWzqq4vSsYu+MH67aPMWryn3svQpFRVFLhmttS4n3I8=;
 b=kwbtj8L2PoJ8qidSYBVTGf6y0/NhJtw4lh9h5FChq/kpBTobs5WLHHLDDUx2V4Ves4RiiZJ51ar0TtmJgrAeowjx9XXhD/W8NI8AXtqgCkOBJr3MBSKvintPTju8cvMH61H9c3O4ouRDA3xk1ZE9Y0eBAS8nOoYnPXmSj7YGqByv0ltNTJ6ghX93AKbLqLC+Li6AoGpBO1UAjYpdvbXKgAqGNe/ACblT7PG3M0zn/h4BNOR3DuQHCliEwHQvVsCTTsr0+WYGMG6DktMkynB2+ICTC7z9hZrqBWuuLOdtLSvMv/fizfgqpqWAxFv1WzZr2zQx9EHjwVdWZhLtCQjGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWzqq4vSsYu+MH67aPMWryn3svQpFRVFLhmttS4n3I8=;
 b=anPL2R8KfzviZeSu+iqa1HMPxvlE2netH1JjJA9M+1QHPLyv1DdGoEuwgzSasb0yVzLY5ejZDwUb7wSTIBdqsbVFJ5pKyKWqUMLAtFR8mZzVVDlzKhNZt6YilJKVNqo9EKza7/uVeTE+eAwNi7DpW9LS3g4k/xoPBZPEz/GY8+A=
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by PAXPR04MB8831.eurprd04.prod.outlook.com (2603:10a6:102:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 09:02:41 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::192:f955:f98a:4d62]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::192:f955:f98a:4d62%4]) with mapi id 15.20.4867.007; Wed, 5 Jan 2022
 09:02:41 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: imx-card: Need special setting for ak4497 on
 i.MX8MQ
Thread-Topic: [PATCH 1/3] ASoC: imx-card: Need special setting for ak4497 on
 i.MX8MQ
Thread-Index: AdgCEhZ7Lb6RtTFBSJ+4JF9NIvhERw==
Date: Wed, 5 Jan 2022 09:02:40 +0000
Message-ID: <PAXPR04MB9089C99640D09D6CC22AC0DFE34B9@PAXPR04MB9089.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc5a9e4f-d050-42db-ac56-08d9d02a210f
x-ms-traffictypediagnostic: PAXPR04MB8831:EE_
x-microsoft-antispam-prvs: <PAXPR04MB8831A576E4ACBEE8139C2D8EE34B9@PAXPR04MB8831.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s6cEfGQd5tWeTxdhhRFZPZrw/N2Yxhxa0JLB1VRFofKKkYy4GKeQ/SdI/xpcW7ordBaMeDI26oPZvSG5/1WyRMi4N607y1KiWaqhnrA0MxwOIKYInyjvkUI/GyJLRM6KyUHomGy8gtl7cwZ8J0tUqgpYGQScNlp0sxuhwfq8ZKqwVUixUnpfUhwLfuJo1XVN8Fr8v0lbNMdEOExZ9WHuka9nzgpXv5mz1x4iqLOqDmIASlu2ZZofvCLOKnAe4d3PXu8tB4y81f+T5RhOr6qORygmME1uDrOt73obU+l1iVZ11ikb4yZAptEF2Rx9G+fuIw7h1U96hLi746kIawfnRIgb1LsHk6o3rVKToLlL+xp1V0n5BYjuPuB9VpaZuMlbrj/NqU+1UPK6MWEwiX7C6BB39SwGpPs2RzZeVFUWw0XnPEyjsYjZv9SNuCgdwgujEMbeV/0PcafzxYy/gpAKwZ10DdY2wsuWJwwi9jm4wC+gIMO4SMVaZ0/DhdoYUErd/01JrBO3ePDXtAWp782nOZ9QjTVWytzgcbpkqTwaMDLfZzNHlAlmJ/nVmm9JsE/guxNnIN0uirmwuFPzPivnrw32mmg8AHWYgXxFW8QkJVrUickgcAa6ovXySyJCs5zCXdpIjzXcA3NnEtrITDbTLT6n238p7Euh5ZBOdTmt9bo2HkHZ2dh2W4anidXSu4RTrmbMADKXc3jV8iVZXMnPCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9089.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6506007)(508600001)(4326008)(7696005)(66556008)(186003)(26005)(66446008)(55016003)(122000001)(64756008)(66946007)(76116006)(66476007)(5660300002)(38100700002)(9686003)(316002)(83380400001)(54906003)(38070700005)(8676002)(6916009)(52536014)(33656002)(7416002)(86362001)(4744005)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yfl1q6Gy8mD9rMr4Xtmc1TTwBGit4VYPbJRPJGgMKWn220ft5wvzxEDF9EK5?=
 =?us-ascii?Q?8heNhe+LMlc970x95OLwILHjMciO0Qtrd0gT4ubBvs1/hRHPNd1scUCmZ1iC?=
 =?us-ascii?Q?hP4iy3w+fVv7lx3PjERwmay2e+8JbufjV0StlmgWFBIJxPBge6y7Jw+4nT9T?=
 =?us-ascii?Q?TbbMMUBtuukfj1jAG0ek0FmZwL7ndrGzDn/JVwUYK4FcARidO9cPdxvqUA+R?=
 =?us-ascii?Q?q9iAm3PBWX24mc3MDF6QjDIWS4GokJFkG7T3B6mHoWji6fOMjTioyZklDXeB?=
 =?us-ascii?Q?GHW2A/3ZMiqcdb/CPZEriIBGEEKM3NSplgeOTUPMTqKNUESbDL1l3DUNdHiS?=
 =?us-ascii?Q?+OrHbXmy1I/OAUTz4m4VSa8dQr+/K5YDaoeIEz72N8OWXOAMKpifn2Lqz32g?=
 =?us-ascii?Q?u7c+5vMbKqlCMGINpCMV8rXmmxaBT8vaM7JP3vF8u9ZDCZyoGtgT8MJ6a0Qc?=
 =?us-ascii?Q?PHTPT7697d8CPMjJk7XqerfenKXM0oHcuXsOeGPgh3oPVRWhwY5ae/jwocKb?=
 =?us-ascii?Q?3Roih1WV/1S+2xGrUtBgGOCqhmSWnzCjdchV66RzdRBD8Q+EhSHROc8bs3Ix?=
 =?us-ascii?Q?gRZ67Yx5VZwVdn4ANoKeN6kUoN25dyTVCcGKvxvZR6w0eqHyMunwtCcJR7EF?=
 =?us-ascii?Q?GrhrrLZsq3z+s05MKd8Q8wi7oXu4ZFJBkAiQ52uhj43o3w1uUzveyB2YkZK9?=
 =?us-ascii?Q?RHGHbPxGDxKTJfIvagAxJZxztTob+rT8rH9YIjQybhwFuwmosUL6I6VwTb5J?=
 =?us-ascii?Q?WO6wM75J1el7vSzCmp4lhVqapuObkVtR5R08HaKc1D8FiTR/NE1t1tIIjmhV?=
 =?us-ascii?Q?8fxrsSigrRrz5YpCb/C9jAIbs70xNXQokAJkwahW7Yn/7FUPlr09aPYC3o0M?=
 =?us-ascii?Q?DdP1AOvBMDzHmc4JAkPUzhrtmrIyDmElTY1Sv+GQjf1Wj8+QwdjRuNRTHJ5q?=
 =?us-ascii?Q?auSxoggcdyl5g+IrkASSgPAck8CS6lgSC7I5bhvJiISanr6s6nklq1MgzOHQ?=
 =?us-ascii?Q?PtBpH0e3JJiWZh/dYnraQ50iKOY+pd2FL4in42YB/rEocfDoP/SRKRe9rxlG?=
 =?us-ascii?Q?lFMBbe+zv0a6mKEWsG8a2d//mL/UnZhiPRT4LDNV5fXqRod8kpWbhqGJ5T/O?=
 =?us-ascii?Q?djdEniZBJwLV6xdu/fOrZgJ6sriVe7z8hKwcfAgiy1NiPpxj06l9IGiPu2SZ?=
 =?us-ascii?Q?i7oaQwtefSRYQK+MD9iTZpcO2T3afel6KnbQIkMd/ZpUtSZ7Og5LibHqNaig?=
 =?us-ascii?Q?6adyfF+WKhAqkhhhCwrl+iG4KQ4IEiAGR12Cezp1sIe7eNht6DzFbSDK/EJC?=
 =?us-ascii?Q?srXLXMgGx90Tpm49aelNQl2OFTgYoqEwvui1vf9H31bKgEOWP0MipStri7mz?=
 =?us-ascii?Q?RlOT3EViY+KyN6l1d+yDWv0l53uY2HlwpRKFRYmlj6QSG7CysHbcWKsdXp0D?=
 =?us-ascii?Q?q0LgCJeg2JpqPbIDuhZonjgGIQLG/0+oyRokooZl+K8EA2ob1ZCqB0T0lIKf?=
 =?us-ascii?Q?/ir9CAQNdkGpbGmlWewOBulGtZ/AiOL8rh4fuGOckVZSfn8XGHuV3H4WK4dq?=
 =?us-ascii?Q?ei/mQCQuJ1X047C1em1Iadq3lMWKKgc+Niqgkiw8pMLzatbGqYTK4xDik25p?=
 =?us-ascii?Q?hQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a9e4f-d050-42db-ac56-08d9d02a210f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2022 09:02:41.0577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A975re9hDVsFGyvl0YBKDImV0NgMoxaznJ9LYv7VY9Zwsf5k55bMoy/4UCwtjPkK6jWM+pV4PG88bzwMta92RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8831
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi

>=20
> >  			/* sai may support mclk/bclk =3D 1 */
> > -			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL))
> > +			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL))
> {
> >  				link_data->one2one_ratio =3D true;
> > +			} else {
> > +				int i;
> > +
> > +				/*
> > +				 * i.MX8MQ don't support one2one ratio,
> then
> > +				 * with ak4497 only 16bit case is supported.
> > +				 */
> > +				for (i =3D 0; i < ARRAY_SIZE(ak4497_fs_mul); i++)
> {
>=20
> Shouldn't this be keyed off checking that we are actually running with an
> ak4497?

No need. Here just update the ak4497_fs_mul table, before it is used the
codec type is checked.

Best regards
Wang Shengjiu
