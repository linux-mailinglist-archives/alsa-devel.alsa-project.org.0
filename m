Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E29764B6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 10:35:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE261836;
	Thu, 12 Sep 2024 10:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE261836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726130153;
	bh=YRXOoR9AX7s4BZxPm6L5jT2G6mgwnPwWHYhN5VuGFbU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TO3Tc9qY0jKfXuK+aMFjghwxJIrzYA8RQJSmiB0uocVDIaYqFPTLJM3mhd5GxhAMW
	 5vM50mOfACdMIQwBbR/VK3+JHWxMfgKeOnw9lUdsICl7bZHVNzVS15CKuaAV1Z1Yat
	 7yEUipz3IFRU62Y9MhywjCfSC5rpQJk6nB7pVMfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E7FF805BA; Thu, 12 Sep 2024 10:35:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50866F805B1;
	Thu, 12 Sep 2024 10:35:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA49F801F5; Thu, 12 Sep 2024 10:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2790F80074
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 10:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2790F80074
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gw/nLF8+X8U9kx4YcrYIFA/4N1wvOF4hZTg3VFlw7gwjsaAibhtLf918cgnsImRPAoz46LDK7FhhiIx/XKZ/YZEQZcmel93PAWZbF1QO8wYoFNmv45cird9nfbXN/nii9ErL75vwR1aJ+7AkfyYvtumbOsGC4QfkFjITLICYJ+4mcpYeeaDpy5cQUc99zPHz3+AivkLCsKuW1Q9r3MqT6HJp1MeLe6GTRa2hwlWZ2mf2lpmz4DTejUjGEKCSzuywueBJyi5TcLiZfnh+nWSqt6oNZhwj38/Wv8KvZF1ijnB4YErhMqmxHDQ39BHBbloV/nusRyIb3/8R4tzT3vOeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRXOoR9AX7s4BZxPm6L5jT2G6mgwnPwWHYhN5VuGFbU=;
 b=WdD8aoL4InWJPWHW5yEMjuqAjp0TT14xsznN7lL2tiR/dFwsRiPUiAp0KosNTZvN22K7mQHJIr47n2zm24r9aBg1vSLsSNpiuOtG/Iwup1vRT2eM5qEgpugH4Vew4HKYITaQNXooTlyf+sfNtocKhnD6bGeqERYablXSo1aSsYBnUemmpbVlvt//BZQHytbbOGQnb2hbaYJ4//pjGwNYsGa+7p5WmWzMAkHnggKM0kK5q7KbhCf1OEXN+TFDrT1g/6K7GIehzE25EA0SofW7Dg0HdA3yHp5fBgx01muqU55yEDfNsnkIUcRCebtO/zSKgZz5IhWqSy2Ff0AsR3CdeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SL2P216MB2111.KORP216.PROD.OUTLOOK.COM (2603:1096:101:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 08:35:06 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 08:35:05 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Application
	<application@irondevice.com>
Subject: RE: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Index: AQHa/cRjERJUfF8g1keevq2iDIPRt7JGXjEAgA2DnEA=
Date: Thu, 12 Sep 2024 08:35:05 +0000
Message-ID: 
 <SL2P216MB23371B88485C16DF14A274058C642@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
 <51e05109-049f-4efa-b923-60943fe82777@sirena.org.uk>
In-Reply-To: <51e05109-049f-4efa-b923-60943fe82777@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SL2P216MB2111:EE_
x-ms-office365-filtering-correlation-id: 5c858aa4-e016-4e9f-6623-08dcd305cda0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?KI4BoZXBDH5NEJucGm14ue0dh2Xt0oqdVPJYb/9Ww2zOkSZTY4vn0zPy7mBN?=
 =?us-ascii?Q?/ULa00RIWnlh4kYXpYh2jZqKWzLBykDsOr9IHP034bBCcAxCVKk7Zy9psaXu?=
 =?us-ascii?Q?87S4Gd5g41r+N54IMHfiBHadIJpyXU7Ib8uXbwWXNduWfy5tJV4Tqmhz8EF3?=
 =?us-ascii?Q?0AQXYxuQ9kf6h+acHQ+95gN+x+XSmqtkInHc4LCwMHtSsvNUHrB5+thoeWaD?=
 =?us-ascii?Q?2xx6HbS1eRXcm3gw/NcOhce/oW47g+8J820184pLPnhlosULLxv/LZYaCyuI?=
 =?us-ascii?Q?hgeje0VldY0DSRdnQcHJW5qXBpkLQ6Hd85NaOEsmLcJfJmWGilelhzr05eWh?=
 =?us-ascii?Q?DuerOzzUuxJPfaxIdDZ7Jl4JJ0zTpbTgaNgzOoyGaPv5crYR/RrjxhfXXE9o?=
 =?us-ascii?Q?pUDVy883yJHXr74hZSl0OPL7OfeFsQygsjigaEMuWs1qQZ8/c06xy+2QcRmQ?=
 =?us-ascii?Q?vkqBvKxSHRbdHtsRS0y0AU1vVOrFJZDq8G42lJ7B3LQuRuh658GylvDOZ28w?=
 =?us-ascii?Q?ul8D7gpxouwSJKboEg1S68vDmTpmgZroSgAyEPkbn7iYXv3j5x4d7YVUU+y3?=
 =?us-ascii?Q?PvpY0KarddhY4Htpb+ALGoN7/i6n35wi1M7Fo6aDa49qsT7RxNZPsiWwxFcy?=
 =?us-ascii?Q?wfuU4rmUtTyIx4pMCSgn5oC/vCypbDGDDLgUldHpOXhXaeyQTarmQKFlLXqL?=
 =?us-ascii?Q?vMyKi3i9bTmMN5ud/pkZoI0a19FmNg/hhMqk1/A73AH+1S3KBWQ89X36bIJV?=
 =?us-ascii?Q?py4H8W7fYEbJBMCHlGjXjg2+d3E9YAppYXonCJqJ0tBaYpm/OQTAW3tJUOBx?=
 =?us-ascii?Q?PO0HHS+BvCXAon4HtUrwdoEWGtb7V6kIfkwP8CYU2x3pWhsEiSc7kUdP1vJo?=
 =?us-ascii?Q?H+n9pJak3b2B1wdSd+g64o2+ulQ2WCnduyFs2L+a0lLYduJZMZHE8cf5wAh7?=
 =?us-ascii?Q?hI2Y/bQlB7NRxM1VaxrRqMsb01gfoeHIWNqnsQhg+EHCDd0OfZBryMjwXDgU?=
 =?us-ascii?Q?nGA/j0uNucsGmnnL+euDopTzDdNTvmsB6AruJQG8fBJYRFD+wr+Lrp5IEQwR?=
 =?us-ascii?Q?78ZsaXKLT3c45BB20GSlw0mv4sq9FT3BVJntm+dsnU5G+VBvDTwADSXdCo8r?=
 =?us-ascii?Q?8Ach3DHumOnF9NyABwaC+i7U5m82zzbxVz0pnSElkouqHalSFiDJwULliaKr?=
 =?us-ascii?Q?/aSw/yMhq34xgR90fvj+sBvOxtGC4/20ui1MwKJmj1Q9ng7jWn4fLWGjNhrX?=
 =?us-ascii?Q?YXM/nmw1ahFsoiNduA9KUmVjOfL2+UPCsmvdhNRYOQIRdvb24hzrjoPvgCLj?=
 =?us-ascii?Q?KiuDMR2Wpgs8QYaZ/pbB2QFIDvRRtrfXs+o8JlkpWjkzUGZNaK47H77V+YnZ?=
 =?us-ascii?Q?nO/90CAWmqL9EMZi1X9dmA9Tv5A34WXrnPeYK/Iqz/kioqzkIQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2eEEW7zvHSW09X5L0BQKYymyPxASEOWJ0fXYwFE0vEE4gfhTVKQh7PzxuLyC?=
 =?us-ascii?Q?cQ+X/V4kxOX8FNRaWcfnj1vuDhCWb/xfmdoafQAyRaUJxDfobfU1H9rJIGmi?=
 =?us-ascii?Q?vxCkbltIpGz0pYqMgosLOwG7ZCxHiDzHX2c37d+tz0H99XESwFW3wXp5jl3A?=
 =?us-ascii?Q?ikTxEA/fGdC3h6mITpMBNAB3BkVXLXJFqwGrSnAeM2C6b1CdN1a06ps++fRe?=
 =?us-ascii?Q?QKv9AjB1/dUXpmpXV6287sST6q/RMur3LRF06eHW8hTNv3GRoPMO/bPo5HPx?=
 =?us-ascii?Q?+qveWTiR7TaYcCcPzu1JOemHB4BGJ4vUlVLwXi3J/7t8TVrIiVu+fqHBwcfR?=
 =?us-ascii?Q?ZZKgmz+HEbxLsUhRso0Xq4UvIanPg4eI/Bx8oyyuH9S0AnvRU0GIWcdvp0Uh?=
 =?us-ascii?Q?/XfMITjjoEiHDlO5vQQBLJ+j5tB7s7Ziy3T3gjcY7YHAvDZiLda40gJqXMXB?=
 =?us-ascii?Q?8l//NYD5Sh+jHF4+O7X4gGLPMO0wbqTUVRvcFqXk5w7arrQ/OHgqhT8xNq+H?=
 =?us-ascii?Q?zfgtgcxrFlMOI81wNlmfwKsT16OpIAyYOsphHCiGcxNQIdvc17PcF59eJOI1?=
 =?us-ascii?Q?SpsEH8ZE3KoolXcIgF8Y1wdC9DTGP6+PEsLTFBuMebV1CAyGX18Gfb68x7qD?=
 =?us-ascii?Q?CIggmtduk5oUYLT95KXdpf1J0sWHGPWWA4IiaM+Yc4o2oa2yyAVYWr+phsIT?=
 =?us-ascii?Q?8ljR3GHKAayHnBubfcLcqs5T+0+zJhejr6ZwhwxrI4NJrbALrGzRPMKM+Af0?=
 =?us-ascii?Q?2aVQXprfxBBB+xt93KwCW5jCyFI6wZd7TV68Fw5Jhd2gPEcD6PjdGOgUxFRv?=
 =?us-ascii?Q?YS1j9sgwU9Jm5OWeAwUF+s3+WiYBZGQoBsHaOiYrTeqU/jjEZLeMQdMBjFY8?=
 =?us-ascii?Q?v4YHMSbcMQaMMPoJ/8kNp1W0GGrqPPBMn539v81EM7iQkRyKXMei5IlqC1pC?=
 =?us-ascii?Q?S4bqYpWy0zwI7lrWU8TD4HAUpwJv0dDPQW01rAJ47wD6shIb/zeLGUoSFp50?=
 =?us-ascii?Q?eIB0iKtIdF/Hjc1rVPLJtlR4MtTBaGsSqr7r9IWd9UlN4Df+rofLFv6JiHPw?=
 =?us-ascii?Q?yRaSREQA8Ztqn3toN7zAgnRmuh7qlJI1241LDRHxWtUflDNTm6t/U/E8GyG9?=
 =?us-ascii?Q?rsxy+ImZxs5wNKIunyQBHKoavF2pFhloyXiNQyrWgxbEXYMCUxwnrLlfklX+?=
 =?us-ascii?Q?wEc4g5wfzcnYsHQp1rkYzk1vM11l8In1XsMatLiJpsIcEINI2UlhqBGnignh?=
 =?us-ascii?Q?h/kAANBG07RWIKJEImxzCEUUQXLhyouJHN6o3PXlc9RSKUCNg29YTcsPJP2U?=
 =?us-ascii?Q?h8vH9B1nT8CGN4sFN93tumGbeVwSSZyOVhANqQ1St1Er6Z2suhgKk9EjcNV/?=
 =?us-ascii?Q?R9XvjDT4hOuWWafmunuHm0fvMLpTOfaoyF5+Lu1wDH11KiVRH5kKeVx8TCkZ?=
 =?us-ascii?Q?pjS18G3shGpacZSiKvMHAGspd46qSLB08tzGR9y89V2kkpXd5xo4IC/Fkplv?=
 =?us-ascii?Q?LSuK7Ytx0m7Fo1OeWr4T0n9HbIrgsRWTwp3PQGcqHYzuBRZkZl8U1Rh+dAPD?=
 =?us-ascii?Q?JaVkc+gREYLw1m7F+SKNCalgVVeq2MrUJviiF16N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c858aa4-e016-4e9f-6623-08dcd305cda0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 08:35:05.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xDlFq8agLGuYqgZT7LU8VdYAI6t/M0ZPQ6upvx0poldYxes4r6lv3NWEqmw2jAtzlcp+Z7OR4kv0z0gADHMMC4Z6RcF6K4dpKZUwo91cDQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2111
Message-ID-Hash: G23FCTYY33ALYQ6FUU73RXMCXSGPJKBL
X-Message-ID-Hash: G23FCTYY33ALYQ6FUU73RXMCXSGPJKBL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCOVMV5EXUCNUDW5PP6BDXL32H5SY2S7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Thank you for your help, as always.

I have one question I'd like to ask.
It may be basic, but I would appreciate even a simple hint!

>=20
> > +static DEVICE_ATTR_RW(check_fault_period);
>=20
> Any reason the fault stuff isn't an ALSA control?

I'm planning to change it to ALSA control as per the feedback.
Could you please let me know how to set the default value for a control?
For example, I would like to set it to a value of 60.
(For controls with a boolean value, I would like to initialize it with a tr=
ue value.)

Thank you for always providing good advice!
