Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F28CE528
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7487C206;
	Fri, 24 May 2024 14:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7487C206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553230;
	bh=Fus6Ppe/8Bf+Q/12no8+yQP5kmLXaP6K3RGALkfKOBo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=otoaqOshKcaPHM2KCvMX3jix8M7L2Qi3AhuaDP0+yoQP6LNKvAupl8EDdPaMRj2Vm
	 otxtf31QeOp1WVtt72N7/i/VtfbEZ3MR+FREd9c1yKCyOMWUEI8mS/Hyx8U6TkLpRV
	 wD8NHwDveaTn08CwFqbxTKHQUMdKt4SNqsowMTtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 605A9F806C0; Fri, 24 May 2024 14:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC28F806AE;
	Fri, 24 May 2024 14:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95748F8026A; Thu, 23 May 2024 03:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20711.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D497F80051
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 03:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D497F80051
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu0V0PIp6YOzWPqpMY7VZfhgwplPeA714hjtPv47rObQFZs0lLO/ZjwOMJCbRMshVzTJOHe0AcTFfoKuLjz/W2L4xd9CBUkgvIeb6F/VjcCgEaElfNFhbmzEyX6Fm3ivbjweUaW+C6lWEYbXpU9q+c7f7cx3LucQsNuE1d8zSN5aBhT5Y0vIPvN4aT6TjIO9NDr1kXvq8bOU3TFAuAaJiqltwPl8ulUeaZ8+eW0D0dYLsZcdQNKYrQmc0L7hdzizsys0FUEHCdDyV8d9Z8gDBqg2lS3qpW/KGWSg0OEh/hd88ueu3r56K41r5TN46C8w/TJvn3S/hBuURvMejTV0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf46/6kYIW3uUV4UPQjL9QVmPC/ACK517YtWT495oXA=;
 b=EBKusfD0dPSkajewqwix3t7L8OVPLpxqX8gcEJhMxYeuB1Eb5C458vzvIf32o1TEArmySG3ekHJtppcdrbNYhJ7zEbOO1fE9/wT2CJEk8k6BFXmzA89vwXLy/wsADtj9bHPw4GVLclSjgU3ovdLrOQzu90ngN+N/y5/xTsCW4IooO4e1q2Y/2zgQQ4WQkar953spVZfZicDM4UGMjPbuYDSSc1KNAags57qXtjr26qo53o0jt87GRAb4Gm1bc4wo/0w2h/OYRzPktWyqb1wA3g5ZNhoc5YHwFRd+MCMnv4DnM5menXoWhNgNnp/hUOHUJx6vnncMnSNIIE7A+fsS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1099.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37; Thu, 23 May
 2024 01:48:57 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Thu, 23 May 2024 01:48:57 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Walker Chen
	<walker.chen@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	<perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
Thread-Topic: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
Thread-Index: AQHalVkIdRsOCKK/U0GRbtz/T/P037GiqLtwgAChPwCAAOjtUA==
Date: Thu, 23 May 2024 01:48:56 +0000
Message-ID: 
 <NTZPR01MB0956E13D4D327B76682E51279FF42@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
 <20240423083405.263912-3-xingyu.wu@starfivetech.com>
 <NTZPR01MB0956BAFCBF0EA32824C3350A9FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <297b2034-4e2e-47a7-97bf-53991a102db7@sirena.org.uk>
In-Reply-To: <297b2034-4e2e-47a7-97bf-53991a102db7@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1099:EE_
x-ms-office365-filtering-correlation-id: 3d4412f9-93d2-444e-98d8-08dc7aca8269
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: 
 BCL:0;ARA:13230031|7416005|1800799015|41320700004|366007|38070700009;
x-microsoft-antispam-message-info: 
 ETwNtop60IaaWvwXslC9h+OK7apdTxt/va+4w3Kr50bIgQcBqqNdPT5wwP4AE1xKGHZeNniO0v+o77In/GI1xdFUt9ipKuHmkp2876TgKKAMHFOPgE818kUEeclbFCbxOWS2U0sAzILw3N7CM4NeJaLVaKq07BdeHSP8hefn+rkHBhjsV419SRLTwjZQZ4Ice//g7p/CzYHrY29yIESETrMNJliy0H6Lhirj8mXhmEUCQ/tzjR6hMQx153a+sAiSy4aYQoy8sndW3yMnUqZ9ulgLDks8D9xNtWiqqXEPGdWpgqGHi9fHfhENfWs8IOhNky9L7O6PP7hEbLwTgr7KcT+hJBEgb0ppFuqeDclW067oukB9Ok2di2xpMucSeOSRiZwXHUhqi9T0/w+req+dLtpgocF+8uwdn5OjZGtwXMbm+9ErPLcJBSP0z/ZFGT9QKD7zhySu1RrQkBEKrqf3sQ+3TpYk7l5zbYmn0UsbOOiPQXrhvivLkdHCKhaBwks1se38/ihaeWCPiYIuVtvUV8VYsnwHuAkQ1OADooW9SD+gd1wj9YndqO67KNlpDze8KggLTDMsNbMOQqyA7KO3LSebENllaz+7c+dWxbXTZYe6J9tOSwhlxzBGGl3jhVpl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(41320700004)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oPyko5St/rcgjisQUS5cESLxOnDtGs5bbLJMjluHTn2gHn7vDe1LqjO/WRdC?=
 =?us-ascii?Q?f0fZ6q0qksyGURG8zTEiXTW2dWTlqxzwOXi6Hg0UaxqtdpiE/drKdQGuMFYo?=
 =?us-ascii?Q?mlJrgxL7WUiuAHDFLrcVUrwFBK7dGVz2IZvKD128WcojK4XFZbHi3zw/cdVQ?=
 =?us-ascii?Q?0nZ+Oa9pZvyTFrRH1PiNPh9F3PxIeK4h6cRLgvOB8dmT5DN/HFuMfh13i5Hi?=
 =?us-ascii?Q?fsI6B6yUZymHQvnfrLMH8PsXDc1moo6f4jW6d0KWITfAl3Y8r8UkTEE+rhpA?=
 =?us-ascii?Q?Nir5/S6Xofo3QYGaifw0h6ABKw25SnOmlAFea4rnO16stsVIHCZY+E74nLCv?=
 =?us-ascii?Q?ACp58hrU+ANy7i2j9wxAG52Zgvk7fl/iqsVqCITLMHVhm1MQftFqzbUv9GzT?=
 =?us-ascii?Q?RNIKmAHQ9Izki6yo4mwubircpGRVB6vIBquyVSsZJQiYDf8u/yfO9LlZ61Zo?=
 =?us-ascii?Q?QuhfG+lzXwXGphhPSKVevLCzA8mzXralkwDBQrpAFmlLj/UnUN37PlBloFT5?=
 =?us-ascii?Q?JoToKzbOCkeErZXvfQqGJPy2YB+CKlFpSJWIAqK2mRTWgGN3U6Cp7RMjK8yF?=
 =?us-ascii?Q?IfIL9dycyDNjQaBGPTCESihAQcbILRAjXwsWT+8fk60Ik3zySTbzohC523OU?=
 =?us-ascii?Q?aWtmMcFGrospgJ7xfofP0LK+jNiuReMUvy8gr63cqEN4lTgUBsn3UXGnmYSa?=
 =?us-ascii?Q?lDQfjbWQnH5QsaxNZCJxkshRtXSQUyNDd+N6BZkZ2swqrzmPmNfQrPliMI4j?=
 =?us-ascii?Q?wNBAU0TmpHKXjvk47FsgISoAoppkxcDk/BBwRFdR03khGpPqFlzsVwK71W8X?=
 =?us-ascii?Q?pHYZM87/N4msHZxgqG6D1lgev0qC1J4DmxBhvLRCTLS9bvlk8WRLeGFmSU9q?=
 =?us-ascii?Q?c3D+BmF5cTsHJ5YO4LaxcD0NX9vopssjl0ij93RZq2M0WyWdiNsD1zK9/gmP?=
 =?us-ascii?Q?tgaYVM5rs8TSWTcU7OvcBWr4/nVfvfQu6XXso/cRzWX3PrbHnQeVrKXETibA?=
 =?us-ascii?Q?4DNsvPMYRqQK9XEiEurQIAt+mKDp0waC5XuRcHHZBG+043m2ywESoSgvLgFM?=
 =?us-ascii?Q?gmtefmsyBtE9h15nedH9n3dQiPfl+ZhEsgwYYOjAUu70gm7NOymqA/17mYKJ?=
 =?us-ascii?Q?NOOdGFUxMb6GWGxwbpNLBBPT1ZkfO+loo4u6OXjTkc/evq0Zx14Z4Z4A83vz?=
 =?us-ascii?Q?gzAq/wKR/19OsQRjGLR2C6VZ+Ue6EIToC8phnlBKG12p3Qzmg1QG14V4VUsZ?=
 =?us-ascii?Q?q7blnWPIdsKvY7F1GBc6clxCQo/wUAqCC4m1UV4LL8hKmUtcHYrUJ3CMjm40?=
 =?us-ascii?Q?HhdACNYQMwFzmV+wAN73O6dgbfgTcH78Mbn0W10We42veML6v4LHRFkeWTXK?=
 =?us-ascii?Q?YJS7N281JCQDhm5saGlVP5lZtIt4v8FQyivALkZ7Q0crsg52NpH/ILYNVOc2?=
 =?us-ascii?Q?jUZbYpVfnfGu/wECe5Uhg1XiAngAbsAExghpCv2erm7D+x2D6rnVM8Mk5hSb?=
 =?us-ascii?Q?xQDYWk3UM35P5XeWBt1fNd8brvb/2+vpFBL4Ex98xkNmnPjHbhaRTiTqRHVb?=
 =?us-ascii?Q?kuG1AR1B/dXfwE93HvvTc4nKptgO+12KNmf03Ms3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d4412f9-93d2-444e-98d8-08dc7aca8269
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 01:48:56.9676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 E6+2hJ5hWmCxhQQ4Tg686XWAXRydqDgA0RThNB3T95lWiouuFiqXxctLnJBgi3R+IkOYlI1Fa9NFZ3+/lJ5YIKwZ89mu9QQErP6cEb1Wgw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1099
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VCYLEB5P3UO3VYZKCG6M4ZWT6POKZLDQ
X-Message-ID-Hash: VCYLEB5P3UO3VYZKCG6M4ZWT6POKZLDQ
X-Mailman-Approved-At: Fri, 24 May 2024 12:17:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECRU46TB6GMUVYVGOAMY5XP25QO4V7XG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/05/2024 19:23, Mark Brown wrote:
>=20
> On Wed, May 22, 2024 at 02:11:55AM +0000, Xingyu Wu wrote:
>=20
> > Could you please help to review and give your comment about this PDM dr=
iver?
>=20
> Please don't send content free pings and please allow a reasonable time f=
or
> review.  People get busy, go on holiday, attend conferences and so on so =
unless
> there is some reason for urgency (like critical bug fixes) please allow a=
t least a
> couple of weeks for review.  If there have been review comments then peop=
le
> may be waiting for those to be addressed.
>=20
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed directly=
 if
> something has gone wrong you'll have to resend the patches anyway, so sen=
ding
> again is generally a better approach though there are some other maintain=
ers
> who like them - if in doubt look at how patches for the subsystem are nor=
mally
> handled.

Sorry, you can do it when you have free time. Don't mind.

Thanks,
Xingyu Wu
