Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B78963826
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 04:22:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57CC7F51;
	Thu, 29 Aug 2024 04:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57CC7F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724898164;
	bh=BmzdFidTgrhhnREb96rU+ewPConAXSqMvJb0/uvojyY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MNmkX+mx/cOGblS+6Ssz67x0sraXXzOGzZcZJVmNKKl4njdZ3/hNddvleCICUmKuJ
	 bvMHvzx1/mpXyzE/9yifsyuyMfH0QCHVbgCQhDbaPjuBSy3iiyvSBh+FmoKEUwDBgx
	 /meBz4k0XreZnxB76G28zR1b6/f+zui8+uP7cAoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39433F805A1; Thu, 29 Aug 2024 04:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB75FF805AC;
	Thu, 29 Aug 2024 04:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B589F80518; Thu, 29 Aug 2024 04:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E412F8025E
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 04:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E412F8025E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5rINgaf5/zVtT3rzGEtBcNZ2cj6/k/0q8vvT4mCU4PIu7oe2Jmr3NFnvUi5dCvFFc+/vI/250osRSRwtQ0gH+8jOuuBl+bxBqta08rUDDx1iOKkR2eVz/6TDUPhuXoV0x54+H0h5UHh6EQOslm6kebxZczDfb6myneSz/5l+hGLFcragh+IuCrQbpFnlX4GJgrx65p0Ko5V33Ma9tk387mEtttb+wb8EaFWhWoIRFusoHkTtvZRPuONHZLX4nUukC5Dg5ug3omE+Lv5g6hZjkqu7H8vL+KMXhaOgM43aR23CnSWw7zwijRA5lIOXPM83g0dCE2ELhldynja/4YSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pklYyjt06QTPU3PmTzuDc+0j4boU9qWg9OcBKLwXGVs=;
 b=Sc1Hys1jHf6FYJYp0u15QjPic5L3rRYqVXWvTPx8VwaRjiRzv+8/kEVju32p1M/1rmdT5GqdJ8andTebB5Zd8woLOVra4jANCTZi01oHTmGxBSQJZWty3RcervQZd9Gnl+iwEX0BrirDxAF9+R5lGNcEFM0gNJE904ABAjj+qYFh+EE9B1c7K89rc4qKupFv8Rltt8AkJXCUPBF7pYKfPZljjLBHTIcK7IyWAz/bODSp00UZFF7z4CFDhQC/AT/C8Y83/JWe6n/TAAxdsE+nk/YmCBVT2VTZFhet5Ru/GF+v61o9sXonxptnP2nxlNEZGAzv2gpehlUKRFMmXvhDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB2851.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 02:21:57 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 02:21:57 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: RE: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: RE: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device
 SMA1307
Thread-Index: AQHa+bo42e84689KSUKufYte1CQ0tw==
Date: Thu, 29 Aug 2024 02:21:57 +0000
Message-ID: 
 <SL2P216MB2337196BCE05C44A6D4371E78C962@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240813052609.56527-1-kiseok.jo@irondevice.com>
 <20240813052609.56527-2-kiseok.jo@irondevice.com>
 <66113ea5-11a7-41a9-8e28-af0394d7ded7@sirena.org.uk>
 <SL2P216MB233758C3649FAF0ACDCCB8898C872@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <33576ed9-abe6-4c6b-a3a3-0ae775601aa2@sirena.org.uk>
In-Reply-To: <33576ed9-abe6-4c6b-a3a3-0ae775601aa2@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE2P216MB2851:EE_
x-ms-office365-filtering-correlation-id: e91ca65c-7a00-4108-c59e-08dcc7d15b79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RNXqY5cuLBLbrJEN7dfIychUwJWaa4l4sq2aV0Jv2WdxCk75dcx5YZSWixDJ?=
 =?us-ascii?Q?w39BmXswiLv1ara+ge+SfuGqODyTwzlmqQKqPPEkZS7zWjrzEOp0tuToYw4X?=
 =?us-ascii?Q?0OJS7+9OVtrsWkCp6PafFDIxI4a6xyPT8H3acpSQuvnSRMBSYXwnPiuAEGrF?=
 =?us-ascii?Q?NMFqmq1gOTRzEJcpYgdRI5pWUz6yQXqgjZlggJDoHI4xz013MvPuwww4fp5f?=
 =?us-ascii?Q?TOLaCEBcfs7+0agT1oJVMnEcc600gALkBtvRLmPx2KTkl63y0RWuUUWdSa9f?=
 =?us-ascii?Q?iOA+ibuorxIi8hbsLa5fdyTCroyX7eVPrFTj3HprugQVlPugAKtSnT+kSjfy?=
 =?us-ascii?Q?9EormYyDrRc9oQiJUgkxO25caasdyA7xCYaPTrPzJxIm3kpnS+iH5z5Kpw2P?=
 =?us-ascii?Q?07BnN8lZTev6XPrpmgY4e7WeFSR3+fPFsNZIHs4zXx41gXTikWqe3vIHaWHv?=
 =?us-ascii?Q?itlumn6Oah4dcGsw+Pao6ujm4a6T75oR4x+QNHTadc2pdP/0vDBqRR6Z+f+H?=
 =?us-ascii?Q?rPMyxREKH7xWy5OwfU7srQGqbXGJuk0P1J2GztIb6tRV+LELo/pbkXdK+d2V?=
 =?us-ascii?Q?psJvXz5vyhlmcdsW1RvrDF+3VqWZN0AMH1/ye3NVq+GxVMxV4Uq6E30V3HG5?=
 =?us-ascii?Q?mRgKDGzJkmdCzQgRYhczNKEhsIggJ790jqnpk45NfZHK4tm62mPoOiOxra9c?=
 =?us-ascii?Q?/mvIUkEIrBTH4k25ATaQ7GhPtSplPi+oLVaAZAAl4QGt5o34Z+tOu1DcCqAL?=
 =?us-ascii?Q?CFfBrVIk/wOmXG/ihmeIOaUya2jIiqYM3NzjV8/tniT9LB0SjMWLMhk0Jm5w?=
 =?us-ascii?Q?jgJMb83wpO8eGQQnV9ZUw431oMdF37bCKUVd36RTj6VTRPg75X4uaRxJVaab?=
 =?us-ascii?Q?kWtY/cd+e9C+wwcH9x3UbHqUoQRdGEVHQ5UAFWgdT0qJaogjLjNTYXsLdOGh?=
 =?us-ascii?Q?I81mmZhN7Ar+RSXr5L/izm38TuYzK4+ZgKuNT0QxU7xQvC+JzsNKqooCaSq4?=
 =?us-ascii?Q?BY0ADjmFcZnks/nexZhWSJKG6d+YyvFghLXHOx3MeRtmq+sJ35OCToucr7j9?=
 =?us-ascii?Q?VE38apduHsv6D7NqoCI2X7cdq+okww2np3t7YsnzY0e1L6dvfYzPd5G2rqkT?=
 =?us-ascii?Q?n0l13F73yhTijYw3IgDXU4uGjmJq1eAAEJMlqf4S8bR1mNVPDaTBhY80N+kL?=
 =?us-ascii?Q?cQof5p+CRVWO89fuenY/CDxiNj9PNfds5ebHqyimcvlSqeqwo70IRV6Kpycs?=
 =?us-ascii?Q?+DSeHoxAV8/RNnD2oDStBHLLDun/ssjlBVCQkMx6oEJ2a6b1aG/+vIOYoLQ8?=
 =?us-ascii?Q?MaVP0SCWdE91kzZTJ0Q6Fn2RGxGKihkVG/slfkcd+74J54sIRKCKtTHM800I?=
 =?us-ascii?Q?VkWK0fJS9zc+1eYLpYN90b70jI4mpGcYI5mOebbZYog0G9yPXA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DyqJPf/qfXj/pcc1QX/P8uNEcZLe57qvVxIi56OchjABfkrbfSbSasa3hb0W?=
 =?us-ascii?Q?6uK76ACFq+v4RZ1yZdQcH2whN7e1EOFCM0zpxTbnaXN8fgluivsctlCsGxoh?=
 =?us-ascii?Q?HpyXcm+2lw+GD3AIxT0nNzs/UGZIW6qhwJTEEfyHj69vRCYgNQ//HwJQV/1p?=
 =?us-ascii?Q?8mLkN0eUENKxa6dBTqlvOfh+nh+fylQNm5dqqQf3VjMKC83/sHWPoEbvWQRe?=
 =?us-ascii?Q?fR9BKXgkfbKUVyb29oZf1ESJ5Sw9xO8q1Ayed7ekvW1vxcV0FwFJZtQ11ecW?=
 =?us-ascii?Q?aFC82jDk1rhqoZJbXktmclpjD0eVIODr2fFETiGmmGIBBvJLInjzgw2z3DDE?=
 =?us-ascii?Q?zO0LOp4Fb73EAUuSEeznb5Q3GdvLpFHDMJJbNMPeGYFOOdtHW/nbtaoDTYJS?=
 =?us-ascii?Q?Hp5dFVwm8l7fljnCHBUKdEvdJpasYbzbCPMeTn2UnRxmB1CiKCZ8IDt5YLeR?=
 =?us-ascii?Q?pGn2zMhvs5p35ZpyPh3Q9FD6NVDQEfu+kOFwEfX+bRANxuF+pRRm0cUEuZJq?=
 =?us-ascii?Q?OnDvBHVKegD9Bl+zEXREijHcNrG46CNwgyickH0QkUZ8hs+uRo6L0imYWgpV?=
 =?us-ascii?Q?pgeppi//pI8FYTgl9GPuWjTXjvL74Ky8PCP65IladesPf5nqTzTx+Kx13p/S?=
 =?us-ascii?Q?jPgu8pmOqjFH7DmkHkwnUZQDMJj6I+OMmk3CyB+HSGebkv6RkYQ+Bl2dEkpf?=
 =?us-ascii?Q?xiqFPXU1r48FLTt/uaT/AQm7XABZYgYCfISUYON9LRM4PKi/XnCERR1m/5yF?=
 =?us-ascii?Q?ELOFpTVB2oI9ehzhx3gKWqnXMgikhp2G2M30pMjbMmD0lun99vnNSPNt6l/4?=
 =?us-ascii?Q?7aPyBEh8FOEGKt8ydGXKp1UAti4/s1zC4vVlnqAXHaXTBmQucANlIM5zVoEO?=
 =?us-ascii?Q?gfQlcOxGXuASEf/ta6stqPy0lHfwF/v2ujxpc/rjoaM02Rr3dycQjV1ozzJF?=
 =?us-ascii?Q?GwchhpqKXxb6yMXlyUOxzNIq8L5QYTyPXMNXw/9CmbnGTb/WGv2rY3/8YohU?=
 =?us-ascii?Q?lHhX2ZiHlu0KHSHKVMJUvEmflGkUYQOlfZPBsFv8Lzv6fAyjP7f0yXAjSqrL?=
 =?us-ascii?Q?HLwW5lwFfY9fIM/fe3GDZXcMPUn8fzVuTf8lWdXWTH7qJ8MDlqF/Hd1v8RpP?=
 =?us-ascii?Q?yILOXSOOarBTtsMWEEUoMdlByz83OIwXB/bkyJ76sPZcs8YS42HfEaw9Xo11?=
 =?us-ascii?Q?eg4Zra6CE61Hq6CBTFR98G2ST3QR5Rk5d+FaalWXg4mXEuc9Jg6/qWGwQPIM?=
 =?us-ascii?Q?253blnSspqq6FH75RAO9R2+gWdv2XZ3/Cel4QxGgcvhk8nyxY6Nl9qgBj0kO?=
 =?us-ascii?Q?PV6PMuu45l0IuZhnZotsN7uLO+l9D3MNQAhCOeZVnBg+Q50Ixgm+/C1OmvR6?=
 =?us-ascii?Q?Go60WvllqDcHQkr4Dy4bFB7JHQzchbH5zKtaRw/uv/U3fIBP1TME5ZXcsK4S?=
 =?us-ascii?Q?r/yRFCfSVw70Ci3HsDzWTNAwcshpscWgECmfrBl9VwxdE1vEJeR6FIOKYZzm?=
 =?us-ascii?Q?zDcwP1g27gPSnEzkSR4zm/K36pm9peORrkBOWlqlpT5rtblevNdd5hUQu/q5?=
 =?us-ascii?Q?0hyRoFRSsGF+SIZFLsiFFmzyDRGZh5027Vdm+oQX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e91ca65c-7a00-4108-c59e-08dcc7d15b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 02:21:57.5844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zTY/B5mneLOtjwlB0FXuokU7ifvVLPIjijPVYXDgMiCa4LYz01hWFnD8/XcGuB/SLg+40ayZ7eNED8gfbcjg7q0PD7AC0+Ietx31vCCbZ2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2851
Message-ID-Hash: EK2SH5YHUQKAK4U7M2DJ2YWVJXD356YB
X-Message-ID-Hash: EK2SH5YHUQKAK4U7M2DJ2YWVJXD356YB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOSHV4OYXWUYWBNETQPTXDGA4YUD3A2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Apologies for the delay in responding. Thank you for the great feedback. I =
will incorporate your suggestions into the code and submit an updated patch=
.


> > > > +		return false;
> > > > +	}
> > > > +	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
> > > > +				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
> > > > +	sma1307_reset(component);
>=20
> > > This is a very unusual thing to support - what's the motivation for i=
t?
> > > If we were going to support it then we'd need to handle what happens
> > > to the controls, either generating events saying where they've
> > > changed or rsyncing existing values.
>=20
> > The 'sma1307_reset' function is responsible for configuring the
> amplifier to operate properly.
> > Sometimes users may want to reset the mixer control to its initial stat=
e
> after having used it.
> > I have added a reset control for this purpose.
> > Will it be problematic to initialize the chip values and return it to a
> usable state?
>=20
> Yeah, so we don't usually have a control for that - most drivers could
> have one after all.  The usual thing with ALSA would be to do this at the
> userspace level, saving the configuration on startup and then rewriting
> the controls from that saved configuration to reset everything back to th=
e
> initial state.  I guess you're partly using this to reload the
> configuration from firmware?


Yes, that's correct. Essentially, we can change to default values through a=
 reset, but we also load and apply settings files from the firmware. This a=
llows us to modify the settings file even after the probe and reapply value=
s using that control.



> > > > +static int sma1307_register_write(struct snd_kcontrol *kcontrol,
> > > > +				  struct snd_ctl_elem_value *ucontrol) {
>=20
> > > Again, this seems better provided by the regmap debugging features.
>=20
> > Occasionally, regmap writes are restricted in debugfs, so I added it.
> > (Reading is still allowed, so a read function shouldn't be necessary.)
>=20
> Yes, the regmap debugfs interface requires modification of the kernel to
> support writes which is generally fine for that application where you're
> doing things during development.  Do you have a use case for this in norm=
al
> operation?
>=20


When applied to actual smartphones, debugfs is blocked, so regmap settings =
cannot be modified, but tinymix might still be available. Therefore, it was=
 added to change device settings when needed.
The contol has been removed.



> > > > +	/* HEADER */
> > > > +	sma1307->set.header_size =3D SMA1307_SETTING_HEADER_SIZE;
> > > > +	sma1307->set.checksum =3D data[sma1307->set.header_size - 2];
> > > > +	sma1307->set.num_mode =3D data[sma1307->set.header_size - 1];
>=20
> > > We didn't verify that the firmware is big enough to contain the
> > > header (eg, if there's some filesystem corruption) or any of the othe=
r
> sizes or counts.
>=20
> > The file format is fixed.
> > The size isn't very large, but up to what extent is it acceptable?
> > The header size is predefined, and the header contains the file size
> value.
>=20
> It's just about making sure that we're not reading beyond the end of the
> data we got from request_firmware(), or doing something like dereferencin=
g
> a NULL pointer.  The main issue is being robust against loading a corrupt=
ed
> firmware file, so no real need to enforce specific limits other than
> what's needed to make sure that reads are in bounds.
> Consider what would happen if there were a 0 byte file instead of an
> actual firmware for example.
>=20

Well, you're right. I should handle errors if the size of the data is small=
er than the size of the header I specified. Thanks for the good feedback.

