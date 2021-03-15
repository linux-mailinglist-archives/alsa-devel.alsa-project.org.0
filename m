Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E1D33BE5D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 15:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885B81718;
	Mon, 15 Mar 2021 15:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885B81718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615819911;
	bh=QgUUheSZdHwEgqSqxzge+UGoDVlQwCvrm2kNgUV6tmk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SmrqQwEe/QM5saNETWAMgUUTD7Wa4q5L9KpcxJbQbkgyJPRDsXCP1xLw+n6GfqPNO
	 v3QT7o78Gd7wr0ABt3sfnV5txNP+CewssIC+cNk0C41XD1nH8kgqV/xLDEjDUAVtSl
	 sdraOmhgxfpAqJ/ZnhC7IhE8Rk7VVT0RoQkINxkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B85F80163;
	Mon, 15 Mar 2021 15:50:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93824F80171; Mon, 15 Mar 2021 15:50:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30057.outbound.protection.outlook.com [40.107.3.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC471F8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 15:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC471F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="TrIBgFeh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqYMD0UWStyVTUNyEkOep25RKdSFBkvw3BHqJAEC21nk9dBpw6z4HtxjPZgDwr1AigtUMMrm8ATnj6k9mwl9okm30kC/nSi1vGkiT+4er23PX+VqQBz6CeFfHOGrKbwNPrVtDrc8iu0+qAGPbM1ooVh1lb0Xqgc3EIE+S3+4Q2e9lNHKHXNlxB1Fw2iIihNBgDlfcWHd8skJ1scKqF566AItVz6EWEyVBwkZyijtUMPPmkLUfCSsCGhjGGTVXCTX8QrdBc02nqfhFrUTjjp7ORvvr6crTN+Grnuq1V2VUoVr8es7immIKMINYMy2hnuIPZXS1oJ7x0Ix5ICGPwaMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LxWfM4ys+mNnc6+yuV7nNJz02u2FR6UCdPWL/+jRIY=;
 b=GlWl29dO/rdX3cOpdFi9bIF0s1B3i4i0tCyynSqVpBXDR1faYc/Qo1QKBOyhSh7/lubDJdrlBodCtPBj6nwhzVyGMNw/eLS9rvQI5vtvELLVajTuNmEM9Ld4Uj3Dn6j2EhAGveSyJWtTsjYgqE0F+ihiTebpecFlmiHH2Q/GrlcXRcAK0xnVU7iNYG41EtclZ7LBE8llGDO8RDER12ErtH4o5xxQhEXHdyH76sUR71yOva7pfiNVd3g9MoDUpb3F2jrrrJH5NZJfnazo7wU1Tw8cQ0jOlx9zv6lGipDSiA1XhvBntCAHzUQzGOyu8LB/8NgbktB/ilNV/9veWUR25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LxWfM4ys+mNnc6+yuV7nNJz02u2FR6UCdPWL/+jRIY=;
 b=TrIBgFehZGIA9jDLyH0uZn/agAg73yreXX1ghkAaFLPeAsH46NxMgtx1KwEA1SAN9X26ovOkHSuxt7lyIpp9nG/NRqKHUNuSF5AuWMfVngQNMWJNDS6z5UF0R6dThxdoL7R1sBVJYx4xZ45r3Kc4JrCbVbApCdMlvJN5GaR0cDI=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PA4PR10MB4527.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:50:03 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:50:03 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 07/23] ASoC: da7219-aad: remove useless initialization
Thread-Topic: [PATCH 07/23] ASoC: da7219-aad: remove useless initialization
Thread-Index: AQHXF2zJR4bcoxBZ90eRUUBlgkvUT6qFJVOQ
Date: Mon, 15 Mar 2021 14:50:03 +0000
Message-ID: <PR3PR10MB414250D4E3CD8419B40A00B7806C9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
 <20210312182246.5153-8-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210312182246.5153-8-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d6b4b03-25d4-4a0a-b96c-08d8e7c19dc7
x-ms-traffictypediagnostic: PA4PR10MB4527:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PA4PR10MB45276E791830773A935CE419A76C9@PA4PR10MB4527.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:326;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oqRmmoKwo+y+p21NDGvLpWuIq/3pc9jGe4DvAunaniODdB7S76on5pg7Vn1MyqwDUeZUqD6u0duHVsViw/LXVyb8Z14UnLg4h5EYk2hK913iwUUf4bWaIAjD0Kuzf5fFRe0od7iKYVJQLYVxCbcvrk7XP9fwfBlvqhZS0mKuE94EORJPapwzmEBiCZPtH6TIHAKpjn9EasBJRy1vHO3maUj2q4/RDO1xVEuroYvrsif2euDVyG7vi8H9MQY7KhqQntwZPntYnR27qguvVxuODkSqFoZdD3jLDNSdIFjUBIhA0zfOQIN1nh/rnR7eyNlG7quxfBHC/Dt/wkdsv3WUKAfGLU4lMYjQe1ykSwUspwvFl3VOZQmejOhVsblhOCq2znlUFwrDIvT2gppwrCTJJbsFCCXBXXW9U2zUm7O9GQUfRaJRzWiEAfhDBvevgBPmsdYddOTTp3eSkf+gIwAlLmz5BwXZCjoVpRRHYuBpVwB8gNrBwKtJsrLMotVSlSXXZyqdRmsQ5nkoHVz1la7GhStMwGLolFX8ogykflxxcmo5cMf7mzlhuWgEtTRAuqJ1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(316002)(71200400001)(478600001)(110136005)(558084003)(6506007)(7696005)(26005)(86362001)(8676002)(66476007)(54906003)(9686003)(8936002)(186003)(33656002)(4326008)(66946007)(5660300002)(53546011)(66446008)(52536014)(76116006)(64756008)(83380400001)(2906002)(55016002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gCwry12/4xujRzhmg7eeqD2qTWCIFG3lyWR+MAQZ5V95kDE2mgkpfV10C6l4?=
 =?us-ascii?Q?o7IETNNGmOjn6RnRZ6B0PqwLa+JUtpM4yDDRj+gGqboFORBpvcgtaxavWM6m?=
 =?us-ascii?Q?vh/9ecdhAe+fQsMX6XY3GUuBA/GacYtKxCG7gbEX34dDo8jHWcFkTX7Fth4J?=
 =?us-ascii?Q?hlTseVtzRyW4x5C7idpqrmcQ4QoCX6dJeogtqUWN8Zp/6Bd4+AFHPOhGi3wD?=
 =?us-ascii?Q?0qXqHkmZPF282D/64b6hmvfg28aG4TBXwxlxd3XF4t0CADvugHNHHGvTr5Hr?=
 =?us-ascii?Q?NkJExfioXBvNc1lPmrUzlFf8cbq6tLEqjSRZ2RiQ0xugATKhcnMXIy320W8o?=
 =?us-ascii?Q?OuDk4sP2dSvlqia4qJ2FaiHJ/bYXtq1Z4rQ1P3/wA/AxFSbu/D4vHHWAx4pa?=
 =?us-ascii?Q?p9aVCLltJLYW9idj8eT0bH6DpSzKQagZs0Bn3c0rO2DBipkhiZrlPnZdvSuN?=
 =?us-ascii?Q?NgX95v3NV1LobXzhWRxrHP0kYmMA76JuUl347+aGpoHnzCcwcyvwsIbEjIDo?=
 =?us-ascii?Q?/S3V3tkBI/RcbZICATE3vnznJXC6LL37Iqu0Yu3E1/vl1kWEzap9QUt2x+y7?=
 =?us-ascii?Q?zk/V0m4WoS/E4WKcrXh+jtCUUfPQ8EgOueLB0zV90ytU4CfFveOGj7G4Hl1l?=
 =?us-ascii?Q?ySpT8sFWocZWw7FPG0uFEurA+xFKmrbeHKlocXIft+5ax1fdQ0BB1xYbh0SZ?=
 =?us-ascii?Q?H+3LCjrS/fml/hrJveiLMf6UYQelrO2vxtR7KhgUHhJBFzv1/YIsrpS+9T62?=
 =?us-ascii?Q?NQDiEB20Zc6UzG+Hz2eVCD9giC7xgsJ6Ac2LVmcEwWUi3L/SMsX2Iumwp5iW?=
 =?us-ascii?Q?bB1CdIYI1Cx75p+YEhkbJw9A/kGbz0+h0OjT4Yx8yebdKiHjF2NnIMA24CiS?=
 =?us-ascii?Q?P6yruCxAB/9L2YR073P8k3Ij+kHxEIi/6rrbRjqEr5N2Abt7GAgHHZNaOvRo?=
 =?us-ascii?Q?btsy0JOij+C3l6+gVkahPC6bR01zQvvtFUVBdWkLaW+gGmd0UWc/YTd3l1cd?=
 =?us-ascii?Q?tm/HbXD7uIEOSSvV3xx6GhpnSMHxnRpm9su7jH3J8W4SAv7aFptJZS/56zeE?=
 =?us-ascii?Q?YqIpoKdchJIRWWl+fq7RLf3W4ZHu4S+0YxXWBFtgeILHRxnXd0+b0nrfATra?=
 =?us-ascii?Q?YajWVzg3gHLFxp0RYJkcY7Tv+7KKaduF8TA82q42FBmmxqnbohB4TUEeKEnH?=
 =?us-ascii?Q?PwH/3kgKmXvLbKuQ2P3cJjBliasgAh8SWHcGdPkzuMW50tYMBaXH+u8jREWN?=
 =?us-ascii?Q?ZGox0F016anviFq0l+03MPtrFoeRmxbjiwHgNOj7/pqom0cxRgwhZIGkJRuC?=
 =?us-ascii?Q?P9XyeY6YIKj4eACPp9rIY2C1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b4b03-25d4-4a0a-b96c-08d8e7c19dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 14:50:03.3984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjTaEY7chypVT48hua3cIIFlxP9cOCscxck+9td92mqNtr3QSlZVnnKOTyUztdY98yjUEV0l/N/3TKIj7iJLk2eKeszYe5M8Y9Vn6q/491I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4527
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

On 12 March 2021 18:23, Pierre-Louis Bossart wrote:

> cppcheck warning:
>=20
> sound/soc/codecs/da7219-aad.c:118:22: style: Variable 'ret' is
> assigned a value that is never used. [unreadVariable]
>  int report =3D 0, ret =3D 0;
>                      ^
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
