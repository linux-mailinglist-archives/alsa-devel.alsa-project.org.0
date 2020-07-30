Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0CD2338DA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 21:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4544B168F;
	Thu, 30 Jul 2020 21:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4544B168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596136658;
	bh=vz/DpFLnZW3WOd8SlyRfebggX3IzXN28iGPQzJ5vu1o=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlXzPL7ejUrnXX955PQ6kxEAUQKWrstydEv0EIjk/ZhRNWjKgagVoF6xN7CJUNSDh
	 xn6tQ+SysGzsaJQ2bbemwYDM7zM2zhAVfi+3ABki227lBpBZbSpOq0OFSWE3WwXh6d
	 6j7tjM0YhTLSzdTGz0HSIOkZ9y6niDlQrOcFf9oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A2E3F80227;
	Thu, 30 Jul 2020 21:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE1FF8021E; Thu, 30 Jul 2020 21:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A938EF800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 21:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A938EF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="o8vGyPNH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkSnsPd9VPTtuDwf18vGgPIhgYxXqUowD9Zt4WE1PoFeBDyFpQJryHFSawJqqg8v3kzqX5BE8ApojHfNENsLrhxc83UNVCSbC+UJKV/yJxN5iEmYphUDvwjdAKXlUg49U7m12z+jzWjjml+cxcU7u1vJie3GQB6eEpHvDRmpQBbFAGCxP+n+nJx963aXIPtyYwFVrqnlAGyZeQCQrZ157F0JJClN1GI9nKvmwx6svoDT0JQuN7FgG7vZI0E9G6fHAeXjUHtDt35To8oN4L7FQZVQUvfJmM1kPD8eMnI0p8ODF77ttZgCrBw1hH5n6I/Yvswp61zNs64NsWNlTmRLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VRUz+HcK1XzOqi+9Al2zmCCPMtass6ENxUf1GDgelM=;
 b=emZgmNHFBlZgmZILHCoiTUNfuCvcSIjZRYNEk0o3cfryvTqm9fGStm5oVks60AU2QYE/no6R4iITXEDY71YAb3uWACt37KtiWLhn4Nfcshoes2HRm2spOrBcQLvtyqJIF2udbPOBPPXbaTNTcY+kU/J7Zps8+tmuDk46VdM76JIyrQYG69UxRoVwTElHnU2oFpoCvhxCYM366yKJk+jYGZ0fGBf1BrqkJNOY8QvldHfakPpUo/4DBq0nw0Tzs8ijsvo+3Xeai6Rj4D/tcuAqKDST92+TYK+Q6nlBTyWEkxVkj7g67o0J5Rra4m5a7me69aLTGQmM2W54jjwNHobAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VRUz+HcK1XzOqi+9Al2zmCCPMtass6ENxUf1GDgelM=;
 b=o8vGyPNHHjnyD3jio6tyH3pTGa3Ux2qdhQdzs88memGnzv6bIxlfYpJUlCSPoUhqDfGLaLuY+GS9aF5HEOuH/29G/iZQi2Z8T6KSLeni12If+6+nMW0VspBOKKpDeOSmKmJo/tll1NIwuO9hcrgT3HFqoLTFhraKCzKMdVLu7ZE=
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::13)
 by AM5PR10MB1812.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 19:15:47 +0000
Received: from AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7114:8e7f:c0d1:3aad]) by AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7114:8e7f:c0d1:3aad%5]) with mapi id 15.20.3239.019; Thu, 30 Jul 2020
 19:15:47 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Topic: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
Thread-Index: AQHWZnpiUvyyyDmjcEOw5pxm+8Nvm6kgQlAwgAAHZgCAAAB74IAABasAgAAIdoCAACP9gA==
Date: Thu, 30 Jul 2020 19:15:47 +0000
Message-ID: <AM7PR10MB364075C56DA64BBA164A58A480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
 <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
 <AM7PR10MB3640C50CDF650A4710E7B65680710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <20200730162808.GD5055@sirena.org.uk>
 <6381232d-8226-fd0a-37bc-6bc42451b5e3@linux.intel.com>
In-Reply-To: <6381232d-8226-fd0a-37bc-6bc42451b5e3@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5751c390-2d41-4340-7b02-08d834bcf72b
x-ms-traffictypediagnostic: AM5PR10MB1812:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR10MB1812D43163A193161DE5C30FA7710@AM5PR10MB1812.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pU5wVMadGTuK99idDJgc4vwZRcM6de1U5CaGz11f64sqqrtG/8LWu9JlgmAV3A2V8zyyemh2tejlJwAwzIG94qOUQ8k6EqxchaFxG1i8/xX9UNUiECg2kVdi6t4vlJj2I+qtmNRtMQOTTp+gN9f4J1gZ3IR+6J3noeKW343Us4y6RlGZXeJYu0NznfJiL2JMBtYApngQBXCeXiOLsuWgB+ErnxK3uRrVg4zqwyVUuVuYYWAwbWar8PJSLRS5Wf2E7vDcIqY6KViG94OYRU3etJI0jHZpKK4YmFz7jsg5Q0hIAQ51U6gxw21AcdXoWQE3tiTz9iYihGZPSv0z/w2Sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(66446008)(64756008)(186003)(66476007)(8676002)(52536014)(7696005)(2906002)(26005)(66946007)(76116006)(66556008)(53546011)(83380400001)(71200400001)(55236004)(6506007)(316002)(5660300002)(86362001)(55016002)(9686003)(478600001)(110136005)(33656002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vcE01ebqd9rOS3xQfdNB1b4uCUhLljVANdaIEPk/nxN3ij1p+pTVq4svBxJFvnB8VF8QZfagC1aDAF35Pg/75+2RF628zDJEonrvifjtsIXgyCB5LQIFk+XtgsobQ0g/3eweOaRDMLIRGABMmPTdmCqY5i1xCD58kMq6CPwMgpxi/YXBmBM4VGGwcFC2O+JvKSAXjGD4SK0mXOM+Q2IB/2bUDQoGQGBx7/Fu8iZULFGkWZzCDHv37EZEi9e6lqkjd7Sr5XnDD7qk86ywCtrCaIhAQMeMzJqSB9kum/LBAvExIIPiS7sNkRYE3nnATMLjYdoTKU0RZeD+wyGfyWFdSs/hMZ0LrSF1YiurNjS05eoYFLzO4VA1limQVU+kZe12MBjPLnaoo5M8Ln4sT6HekEFs0ocaWactml1je4uByBOBSr381MH/ZdFjZI5Wb+xlUhKO6DXwCyEzKwjadRHV/nGX79YblePQbMlabX0uJM18mXaJ9NgM2hVn8AhBhekPULG5lOWEsw3EyO/0bYhNXyDlaMLJkk2IHfbO5KIKhYQ0oXdh+LCBBvC1rrHe2cGVfSGH7WzP82ABuquSZ3dqWlC2euTK9i7GOyUeWL4tGWAA7/3zVzjgR5GQSl6KEeupp+/yD2D/vuKmuAM4xmV+SQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5751c390-2d41-4340-7b02-08d834bcf72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 19:15:47.7137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uTMALPn3MJ9VW+iLs2Q3bu6gRlZ0CM+p3r2GCi+5DyE4uEly2FsJNU02TONvvpmFWLnljdVhltRA93luozs4qKqrtlu4yV2nrMO6c1mpp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB1812
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Zhi,
 Yong" <yong.zhi@intel.com>
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

On 30 July 2020 17:58, Pierre-Louis Bossart wrote:=20

> >>> When the card was uninstalled with modprobe -r, the da7219 codec was =
not
> >>> removed, only component da7219_remove() is invoked, do you suggest th=
e
> >>> component driver probe and remove has to happen with da7219_i2_driver
> probe
> >>> and remove together? Thanks for the code review.
> >
> >> Well as far as I understand it the the devm_* allocated resources are =
tied to
> >> the i2c dev. If I'm correct then unless that's removed then those reso=
urces
> >> won't be freed. If this is a valid scenario then we would probably hav=
e to look
> >> at avoiding all devm_ calls in the da7219_probe() code as they wouldn'=
t be
> >> released when doing what you are here.
> >
> >> Mark, what's your take on this? Am I missing something obvious?
> >
> > You're not missing anything, you shouldn't be doing devm allocations at
> > the CODEC level only at the device model level.  I'm somewhat confused
> > why you would be registering clocks at the device model level TBH.

Ignorance on my part when I wrote the code I'd say.

>=20
> I am afraid we have quite a few codec drivers used in x86/ACPI platforms
> using devm_ clk functions at the component probe level...see e.g.:
>=20
> da7213, da7218, da7219, es8316, es8328, max98090, max98095, rt5514,
> rt5616, rt5640, rt5682, tlk320aic32x4
>=20
> some do even worse: nau8825, tlv320aic32x4 call devm_ functions in
> set_sysclk.
>=20
> The module load/unload tests used for SOF remove all the drivers, so as
> Adam was saying this should not happen if you remove the codec driver.
>=20
> It already took us quite a bit of effort to make sure all resources are
> properly allocated/released. We still have known issues when removing
> the platform driver only, mainly with HDaudio. I wasn't aware of this
> case for I2C codecs, I guess this just made the list of TODO cleanups
> even longer. D'oh!

Well, I'll make sure I at least sort the da721x drivers to rectify this
discrepancy and provide the correct solution. On the back of this I have al=
so
spotted something else that looks stupid in the cold light day, so will dea=
l
with that as well (relates to these updates).
