Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE079BC1DA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2024 01:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C79EB827;
	Tue,  5 Nov 2024 01:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C79EB827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730765502;
	bh=rTo05Yoni/Y5TJLtDtTVIxefM+gmh66jPU7DIB+2EKg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQKu7/dANp5n7NrwxefkjUmphLwI3bn26VwMlluXAaI2IFslfNsA8pzegeGOkEzi3
	 m+6aL196GwkHQp5sCOGiSNINFPtMflrzFhev8cGTR5BVrrl4AK/nWg2DItp5JpnjQw
	 CbsIWesq6/yYr+ILJZo+qiJORBVDXYHennUpLkM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20140F800D2; Tue,  5 Nov 2024 01:11:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E241F805A1;
	Tue,  5 Nov 2024 01:11:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA675F8013D; Tue,  5 Nov 2024 01:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from SE2P216CU007.outbound.protection.outlook.com
 (mail-koreacentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27A29F800C8
	for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2024 01:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A29F800C8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylXrn6LD7zYTe/rxrLs9N4g3ul3hmmxR5Q37cUTnyCzPxAnUApNqWgQX6gf3sxbOPw70XNMhID+wJqyZayQ+Wl78pstHAW6pEdAjPKAgO6SRFkjaq5o8HLT61fE6N5w3V759AJM9W/269pv7YmukDDtu0D5LEkL3JTdj11Y0Q5UvWUXrN3W53Gp+L6U2YtYXQNS1/Y8nBrJ8p2F3YpTskL5swPXz5yHH6zzounbmlQhof9xAIp6tEJSqqWE/HeyQn3dhhZwZcFmge/UJ3vRWQ82eDBpZ6roKALX7aE+bvuPiUwDwv92HDpt2LGbcXXIQBnnJrwqnLtFBVNQx9KlHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTo05Yoni/Y5TJLtDtTVIxefM+gmh66jPU7DIB+2EKg=;
 b=fDssZM2nepPiyxDJj+hX5taYHVqX2KvdniApSEKQzcNDY7bNFIk9ZasQdtBC0ttggXj/2Jz90mLU9FwGUbLEHmntbuguISGxq4gfQUphs0KQUGZrJEgUEbI2FKS2FYLLa5cCGDSPVxoCosC/4B+IGcefcyfL+VNKTbDrGmOjz4Tqq/qtsE3s0UVqR4+qOzDjFxgMzChfQ3FpEGhd1o8tFYHZnQQOlHRs35RSHk+3vP9AaNofRF+Kfr9490+Fu3hvA9NeljIXNWxuT8vD4l5MjF17g+3cJzSm2vKvpewaHzP3e3PObDtM54G6B6922wXInBwjXQPPOQ2fpY/kBt3tyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB1554.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:10:44 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 00:10:44 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: FW: [PATCH v3 1/2] ASoC: dt-bindings: irondevice,sma1307: Add initial
 DT binding
Thread-Topic: [PATCH v3 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Thread-Index: AQHbLouKiZhyQxp3QEaHiHHnHEZlXrKmujyggACS3YCAAH7jwA==
Date: Tue, 5 Nov 2024 00:10:44 +0000
Message-ID: 
 <SL2P216MB2337EC0F531BD24D6341D9D48C522@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
 <20241104-irondevice-sma1307-v3-1-4bbe79895f54@irondevice.com>
 <SL2P216MB23377A60BEC4396ADFA78A6A8C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <20241104161751.GA320514-robh@kernel.org>
In-Reply-To: <20241104161751.GA320514-robh@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE2P216MB1554:EE_
x-ms-office365-filtering-correlation-id: bf35b47f-e58e-4860-c356-08dcfd2e4ae7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?9a11yGA6Ui08+xvoQlV2CTH41K3gliUrzg6nh3k2yk0BlEwSbcA5wB/0z8zR?=
 =?us-ascii?Q?E2QBqLTVNQuxEPJIJdSfF8Ft4S7zyPw6H2kwdCr3KaE4nXNWpc3vxAOcrWlj?=
 =?us-ascii?Q?FDvVtcQkgtJPO7XJIpdUnFi2cALubGfl0KQUaUFYZd2ju0AOgbWVwNM0TqtT?=
 =?us-ascii?Q?tHX3CnJ7oLF7Kh70K5Few0GkamvLD1wy8KUcyW5LzS5maSXZXNkGmSoYDEwK?=
 =?us-ascii?Q?9KwaEtsxHYL+MQJvvOAPKKS7v3f85Qgto7EXH3GaFQFoEje+NZLGZJ0dHk+y?=
 =?us-ascii?Q?0OKsC/RZyjxWXIooynbSC88cCDIlF3PZQGtEenB9f3kXqxlLn7C0zLPnXOhv?=
 =?us-ascii?Q?DiQe7XZJO+ic99e9w21ohtt0p2yuunnB5WmTRrxU1wOBX5oimqBOJuGfRbE1?=
 =?us-ascii?Q?FmMuNwiMC/Mm0/rJ1rmA3OQmmdmuzFZ/AHg5hCeiMjTxF//DLttmyel2j7k1?=
 =?us-ascii?Q?N5uUM6D6ZbxyBT0Mke5A9GKk89E0OGttMpTwlSngnJYoGjJnBA5sqFJGP87s?=
 =?us-ascii?Q?Zgpb/eCm2k1/V7u63VW4RNzVWg66ar263DMVFOn8OVGMCwew+iBEIS217LgF?=
 =?us-ascii?Q?JgNccBwKFBSJUoRWxiYojC9IeX5BPO5K0cJW2VFOxvtHcN6Nd/RrJuM7ogsj?=
 =?us-ascii?Q?lliJgIjTP2Z8dZ2s7A08jb1I8jsA7lzHnilcoHAh08VCyI2Kl6/OLf9yKI6d?=
 =?us-ascii?Q?yiEFydVEtpdVslR83aeHHtE6dgajdZ4w9oPFE4r3fK/jUArSYJEpovYGTWwv?=
 =?us-ascii?Q?VzydbCbt2OKkjNGjoMKIJTMVGD2atAcoLGItTRxmCXvbSxK2LgE7Y4NvNohp?=
 =?us-ascii?Q?QC80NLeINgi0H7xk5D8hX8BceWOL7ON0+5MjkLxPKAI2zHcdSrU1Wyl9B2sN?=
 =?us-ascii?Q?ad7NZk7Kb8Pq13DjlSNn1BlthWu9Ks3dDRMBOYrBxlfVcRIsjJeIJfX6EytO?=
 =?us-ascii?Q?OlXZTCczYk8o2UyZ1wYgyw3K1lPIbPAd094z5MlIiLfQO8DE0JVf8fwxCPOS?=
 =?us-ascii?Q?Vt4p4afIMRN8F55jLoks4TDwfXUG6KTqQpdY/ubFT7RmEOb9y2lSlLFkKSHs?=
 =?us-ascii?Q?iAjEzbmKqsA8twQk0nbHEgRJNeBydwUhkAA3r3pZaVi9okd9lJPc5ZgMejf2?=
 =?us-ascii?Q?ExOzhWf0wiuQigA0yPYRuPiLbhSxCY+xryyJjvZr00SW9uUPOQmxkQ195jh5?=
 =?us-ascii?Q?4Ce+Nq7fMwAP2xckqLxE0jhGhQKbF7onauC2qmF6gA/uVWgZIVbfR9WPyUCa?=
 =?us-ascii?Q?tLphNDZzy6HGn8duxLgad3XdrYG4ddhSBmR9sRqQExZvbS8HMP4TeAqefoNd?=
 =?us-ascii?Q?RKo7YyAfb48icZDei7PBdGq8QuvSUNKaDGW+faGMVdVQqTz1l5pYAx+jxoec?=
 =?us-ascii?Q?xlLFexk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0scmS1AcEzj27XD3/d8qqy9LTfumJn1iEoVtqeUFv8TqiggnXNBxaqrbEovE?=
 =?us-ascii?Q?KUHwGnEu9wzn2nkGv2Vkfx2WEoJ7b99+RJ1crfri2cAZSagDEK8W+/tVn28A?=
 =?us-ascii?Q?fUxFbkguKPRr5CEhv55K6NdMiqxxmruC0mCmLmY5lzDtDAanAP6ULfG9rSL8?=
 =?us-ascii?Q?8ql8BmjWbzOi6rIsL0TBRcQIV//xr9ZkxiOkyp06fEh0AItepu4FTWWgFfLy?=
 =?us-ascii?Q?7MW5s2IUnUTJW81rSzsh/9tipfECsI1W0PFAmgC+LQmmd3tRBIXR0ePwYicC?=
 =?us-ascii?Q?q4kh4+hb/SyE2Y+p87p/MDwtsl1uqTD+xxE0ocKzxKnlA9YQfLI976YlGLi+?=
 =?us-ascii?Q?Yxu09NNSehUkFmPsS9Goiz4ZRX4sT7iqK6AhViEvzVXgJGD9cB6Mu9+QQZxd?=
 =?us-ascii?Q?aL3JO725Q712hTqIprMYFR7vPLulPd/yCuvdlD6NthnpCz4Pm8MgY7wB1zLQ?=
 =?us-ascii?Q?FXUJchlWDCtTXLKK+dz9DU4eHEHJfeeUGCbRTRldEDMZPZrvx+ZqGB0Ij8kh?=
 =?us-ascii?Q?96x0+8qBgWbkZeJ8B38ELCFikOZPxD6yZ7YQhwIGni/q0wmErUn/c0IwSk6W?=
 =?us-ascii?Q?hIG8sJlEwTjuI+KN4mCAwUjoWPn4CoIe56kva+lJ2mc3vzeXUP1YiXV5KIFh?=
 =?us-ascii?Q?gjxmrCjQYzsRPvIzDGQIZw3acGq+ZSbqegdSRYFkqtgHYmu74GmpOLShkc7q?=
 =?us-ascii?Q?tNHQBiJw4d79i4U8trCv87/0DKaVq8lu97mlZ03HZDqTFS9m3YrSMwRnLZ+U?=
 =?us-ascii?Q?u/xoDerONBH7B25OiT8KpKJjdnJyEpWnzXhSnzx8/woyEEjV9J1QWLlZ4QIM?=
 =?us-ascii?Q?EpzWDgZvZiG77dS11o4qIY9xyY73ZYD/wkECjLLvo9iEnqsyLe5K0QlhDkn+?=
 =?us-ascii?Q?WLo3VCYss+K4PPoaRgWgbd97HYiUHNsyOl2TCi9OR9LIMgue7LsZofixtO4z?=
 =?us-ascii?Q?i4noJZoMEjHQOpag08u1fjwgI2ALYMLWMpXGkogzJlYbL9bZnh4PrIkAl2wI?=
 =?us-ascii?Q?0aEAlxJP1pCK0GCoz2XvMzYjKoDSaHyZxuLse9ha5tMw7mTB5kdvP0MGoHG4?=
 =?us-ascii?Q?s683nkOd1SN4aGQ+pp9odNuCcYLPGFvlFimdR5vSYdP8BbvkQlDgNHE/BMn8?=
 =?us-ascii?Q?prcaq5T3g5ouV+gHSoBqhHl5yqT8mgROyLQYMl6GmUyskXVLvPPsjxDNCDj5?=
 =?us-ascii?Q?8M7hy/0hWqZMAX4eBXquSs7bgFR1HMeCfid5jvXGPAF/g1ibRD/po9xBgnO0?=
 =?us-ascii?Q?LjRcvGYbA9eaYqSe2s92lRNtDqfD76XPvi8ZlvN1DA0YT8O/VoPTgW8FKEMh?=
 =?us-ascii?Q?3arSgMAAvNiKcoYdunBK5ztBG/wt1CEoDDC9cfVQILoziR0gpJ9xGh6xAyW3?=
 =?us-ascii?Q?3TYu7iUl5wQaycnlhBV2cKrcEkZx3L8Rj/F/F3jp8gcYCik392b18+ERbFGY?=
 =?us-ascii?Q?3hvL1rfzSKQ7+3AoJZVJgR9ReGUNNGKhH214OUI8TNZ1yBYy/JtS6qBwPxqO?=
 =?us-ascii?Q?iOvh3P3gp84lKgJ/cg1Kc9PRdtZeqP+9OAUE7oA/zcgLHgFkp7ZJEONMyX42?=
 =?us-ascii?Q?iR05/odgUXiG582h4Hz7c0vKk6S5H+g2aCK9yBLK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf35b47f-e58e-4860-c356-08dcfd2e4ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 00:10:44.6422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Bmv6rVLDK1cKsAWz5oG3hTYvAgFskxQOcLWmAeXZncmiTA/61QIOMKPt9cjahXKM4+/OzxXZ+tqIjwBnodKUfW97QPiGFIZla55c6vonuHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1554
Message-ID-Hash: I2MZ2TCMABQOAGEXXZSKTJPRMXPFOOEE
X-Message-ID-Hash: I2MZ2TCMABQOAGEXXZSKTJPRMXPFOOEE
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCE46C23SFN5H4HYCJYOFQRE4ELFQN6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>=20
> On Mon, Nov 04, 2024 at 07:33:47AM +0000, Ki-Seok Jo wrote:
> >
>=20
> I don't see the rest of the series (I fetch from lore). That means your
> threading is broken.

Okay, I see.=20

It appears that using the b4 tool this time may have caused some issues,
resulting in the removal of previous content. I would appreciate any
suggestions you might have for reconnecting the series. Thank you!

>=20
> > This adds the schema binding for the Iron Device SMA1307 Amp
> >
> > Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> > ---
>=20
> v3, but where is the revision history?

Yes, that sounds good. Thank you!

There are changes before v2, but there are no changes in this section=20
when transitioning to v3, so I didn't include anything.

Would it be better to add the previous changes and indicate that=20
there are no changes when moving to v3?



Thank you for your help!
I'll reflect on the points you've mentioned and update it to v4.

If I download the source again, make the necessary modifications,
and then just change the version to v4 before sending it,
could that cause the threading to break again?
