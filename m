Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B83D3ADD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 15:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9811715;
	Fri, 23 Jul 2021 15:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9811715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627045591;
	bh=rSs0HN7MN3tidG5WArE002+/bm1C8Y0F26hvisvMTJs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cfuOf+JAiTl58MPHcA+5+BZEH2qVjq/ZmVLF2+1T0ZiKorWpGjQBDLnl8FB4IVHhV
	 xUek8fBnbiHBuOdXc7mVD3pYTHnicJs1heVTvhbliM0c9ntkKzcBP0P9U35DFhJKnO
	 sZtvdaGQzwPwkWNhL+lteQw1yU5uuRhhzyGAi7TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F7DF80086;
	Fri, 23 Jul 2021 15:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7446BF804AC; Fri, 23 Jul 2021 15:05:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61A4EF80086
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 15:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A4EF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="qoBHqzFk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGAOX5Y2XnVgQLm4Jgk++IOeLgIKLPyv8XdLV+87UN3ZA5nNCk/BSr0X9jQWeS12LH4lQtiecsS5sT4I389gVacS9PZDvD+Le72ttnqAIpSlE6NVA5+/hwKhi/C46xNaW2AKXwmvEV3Ou273FJ3gkJsHZG8ZsuCvsi/r9HzeKji/1EZ9N81OpTFTaYIWKccymdqHG9si00Y4yFUFeuCp0NXycIaiwoD/rGzLkWK4sfWd6K5CEcwa6UWJDc34ntW8acl9nh3KRarB1VmrwIltEWOD8ElczZrHKFSWDUFeHMjsq2bwqcJMEuMfqXtFHcwt08zfllj6XACAl7RcNKUecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSs0HN7MN3tidG5WArE002+/bm1C8Y0F26hvisvMTJs=;
 b=fWZt6NY5OS44wpIJ/7337NQJAAxklY8gVulh0o2+UL57H2qg6zG0IUPPhLYvLAeoqD0L12bsghrVPC8y0TpGBmqM3KYyN6r0VzycfYHIdvWxlVH50uU6OgWnuoOztC2mUQEGe6xwUxHCC7QaGi8KnP1fSMJd28OEGuCQveMsyeBzggLj6zaj7OAiiZmnz6AOdTMNXyO/Q8J43gg850m5m5T9LNUVXA//Qq+fMQmHVSrtMdRLYe6xMHuHOhmWzK9+fyVxqC/0XN14LKgdb+lmlBpVfO13tN7zVqZxSFbH2eW7tZmP7n4SKaReM84hKgqwmkXjrunGKcQ1TIP1Zlr6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSs0HN7MN3tidG5WArE002+/bm1C8Y0F26hvisvMTJs=;
 b=qoBHqzFk2K6gAbpKZU92zp4pUJtDptUmTNPmT/COKMtL0mmicfWamLf+0JWAU509F2I766ftdKyQUrHDwSm0Icz7s/VVeeHIjvxtaCuLG6qs1WAmAEMUzKjvXmysq2Eh9rxI4Yrfm0W0WaLCSjyub5Z2r6sM/JZJWi67++HLtBo=
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB4671.namprd12.prod.outlook.com (2603:10b6:805:e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 23 Jul
 2021 13:04:52 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 13:04:51 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 1/2] ASoC: amd: Don't show messages about deferred
 probing by default
Thread-Topic: [PATCH v3 1/2] ASoC: amd: Don't show messages about deferred
 probing by default
Thread-Index: AQHXfv1by9A9On+LBkOEkw/rk8fmYatQgWGAgAAGlmA=
Date: Fri, 23 Jul 2021 13:04:51 +0000
Message-ID: <SA0PR12MB45103F60E23D6BE8CF7E603DE2E59@SA0PR12MB4510.namprd12.prod.outlook.com>
References: <20210722132731.13264-1-mario.limonciello@amd.com>
 <20210723123847.GB5221@sirena.org.uk>
In-Reply-To: <20210723123847.GB5221@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-07-23T13:04:20Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=44b7a7eb-9ed9-4241-88a9-7449fe178065;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e82d2b43-6453-47b6-556c-08d94dda758c
x-ms-traffictypediagnostic: SN6PR12MB4671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB46710625F9A89AD11BBF8367E2E59@SN6PR12MB4671.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gIzV5QeWXWqJJju2jaMCxkhN4nevw1xx0TgOopsqeYKaNjiO9e3AqBPuktimNek3MWv9jXE1hi3+lUIVxJv7QZYZqxF0KeUDKBbK3fFJR/TZYaKCEa1/3jrBhFo+ulxyIcom8G0/jb67unVdkKVV48sV9yRH7bsD+s9b+MnFUl+1pQnNN185uVa27vN/i2KTE1DQmLRSX/qF7wXEAdwh3wPHtCcobK4tCvPedgUVgOkV8WtqjpX0BCP7RywNC5qujjNBrhEp9tvgTjb9mB34k1M9i8L4Wb108fpy+Sqah1d5e+4U+cEQkkpSUq+hYuFP2YzzvXDXVrMn4kBwV8DfcuiheUrlTfYK2/GSkKIf4CPMQ3VwM+5ZuEKbyJCFTog6I9Q1TiI2beoQMdBuv6AY54JhHJt91jqbeHc01p762Du0tAFIIaOLsv6gwLIf82rYcjjOS1dOWVrbAifnWsS08huOgbyaQZ1FDKG+li1kUuAYtYGhUGntZG/5SF6pD9UQ5kWtyarQ4x3ccBpruXuGXoqEySy3z+TOSbPayV8/518/T8r38srz8RSCz7/UQ/xlgMcKe/OPY5WDoQllbNOIlTMbo0fPmlF8ytiGmJEpEUGwkL98MoeOK7AOlmnQIbTPBVD9rinBQGfvTcr6L2FzfwKhvzKOVukt5ta0t40GO7e6/mfB9AkvA7XrHCUQR6+moPnBf2CEWephkfmt4j5kZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4510.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(15650500001)(4326008)(86362001)(71200400001)(316002)(66556008)(6506007)(5660300002)(186003)(66446008)(66946007)(33656002)(64756008)(52536014)(7696005)(9686003)(55016002)(38100700002)(54906003)(83380400001)(4744005)(8676002)(66476007)(478600001)(2906002)(6916009)(122000001)(8936002)(76116006)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?026OzdthAGK6iLDxv1GpEACYgItp8UJtCwYYk9gLW8m6fqvR7TlacFXm1k6s?=
 =?us-ascii?Q?PD3mErMxJGhRaWt9qREkmgvjwzBz/idZfvhPlzdw+TgwVkpQ83SiZ/B4vTyW?=
 =?us-ascii?Q?OjyWrZqzV3MioTa1q/ZYppqlMxT3zUV4JkFqzCBm49z+zK8RE8s6LYUGiDz0?=
 =?us-ascii?Q?oXyxv1e/ZudkPR05CUtBYxntqqfTCXxk4e4EqtS0ma/hWN297CI6VyBX+5rC?=
 =?us-ascii?Q?b/u4l/gT4qTV1lwtCyukoFPnRJ/acauD6LbYYU426O9fEVEFLfhnj0P41ijx?=
 =?us-ascii?Q?sC4JP2nJR8xpSdhPmBwEwhRmU1p6A4t8tMv3T9oaTJZxXfOezbndx+a/FbWd?=
 =?us-ascii?Q?boGe+pym5aAsXJy2AVbIWp6AaTVdJG2KsCHsA7SaRxpVnd67Hl4+P6nGl48l?=
 =?us-ascii?Q?VpBdKMvsRJ/aOKzIz+wtZq7Tgnp/iLqazyBsesE74wDZFdOMLipKUL0hsq0K?=
 =?us-ascii?Q?aU14lkMeVvptBGv8229VYVnPCVP34L0PQ2XF+Ur1Q+HZiVzwoI1vAyiXcazZ?=
 =?us-ascii?Q?U9uEiGNMhmQbPEVBwBG5PpGDR9szpq6Nnypt8abbHBnKwFLO4SJgPLr9ACNm?=
 =?us-ascii?Q?mZzhm00cnMtZKPYkCqm1rykTbBdDBsDzVGYpRLU4yyhJvh4Cg5C/vwhgr9Zv?=
 =?us-ascii?Q?2fS0cd8dEyFY/UbdNuTezJArXCBCac9ZlrfkYrqh4dsMtXEm22IvPX9DLE9o?=
 =?us-ascii?Q?qkWdW73SQJrom/kIDjt+5RFsA/MP0Ax90xzOSQrxaJp2mx4GfoFbFxXHm1H6?=
 =?us-ascii?Q?nM5r3nR76BmIez8jqwevoqQtBu1gq30cQsWfCvWsbrE/3XuyxWQyDf4VkhG4?=
 =?us-ascii?Q?Mq+o506cROI9+nu0NVnIPB8e71jjZANqTzpkeL443MLi5OfEGXm1XoXqJFcA?=
 =?us-ascii?Q?BzqN2uZnaoUOhmtT1eGwMifJDRGgWjVLP8SLWCCY+daPOD5Y9s9MptGXXhcm?=
 =?us-ascii?Q?/TYkqrzqDWtAzXHyBDjjb/CdlPoRrmsru9b87aTepII93mJx+yVNfxzVV/vc?=
 =?us-ascii?Q?7sWbM6oRIK8qhSOZTslH0Q+Ix1r4U1Eb9aMXX0aCjlOZGTwpiHSIeLTx8Tt4?=
 =?us-ascii?Q?PQfaR5cQWW5XZHui0skcKT5Pzsv6r51wnNxQG7v/negFQtfdDOgiUN6SHvE2?=
 =?us-ascii?Q?2AYmawvu+OhAI4ERT49w2+LrF8FotB4X8AUWf3gwO4j5fFY3wci6MwsgAo5E?=
 =?us-ascii?Q?t+CGJJROTTcOYQuQB3qcoV9B+y5dDELdVSs9ziZDSEdqfGKUf59F/cCXaUOx?=
 =?us-ascii?Q?CDlcAz7mW5zhy+NaVoVBhIYRyzcmCJX33cauKzYMc24blcdzXBuET0lNPLJK?=
 =?us-ascii?Q?f7m76DnTOnKcf46AtEtwHNJnz+ujdsYnnajphOAGSF+WNsygLVYGRScQ3nfh?=
 =?us-ascii?Q?HWD/fOsgIrDDafZmd9L+m1DbnOCL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82d2b43-6453-47b6-556c-08d94dda758c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 13:04:51.8278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0eovnTvM6NFizis6cm+Mq3srW9vjbTnND6dkj6npZOgYtqsBgjbKUnH5fpXZnWDta+6Qzkqv40qQwuxsOWf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4671
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Mukunda, 
 Vijendar" <Vijendar.Mukunda@amd.com>,
 "markpearson@lenovo.com" <markpearson@lenovo.com>
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

[Public]

>=20
> On Thu, Jul 22, 2021 at 08:27:27AM -0500, Mario Limonciello wrote:
>=20
> > This isn't useful to a user, especially as probing will run again.
> > Use the dev_err_probe helper to hide the deferrerd probing messages.
>=20
> The reason we have these error messages is that they are very useful to
> users if they ever find that the device isn't instantiating due to some
> missing dependency or something that leaves it stuck in probe deferral,
> they give some hint as to what might be wrong.

Right, but they should be at debugging level, if someone has a problem they
turn on dynamic debugging for the module and then can see these messages.

To reinforce my point - that's what the drivers in patch 2/2 do already (bu=
t are
being moved to this helper) and furthermore this was in result to some repo=
rts
looking at this message in bootup thinking it was a problem but it being a =
red
herring.
