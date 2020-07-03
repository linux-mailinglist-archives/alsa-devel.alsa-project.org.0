Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F8213850
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 11:59:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A673D16DC;
	Fri,  3 Jul 2020 11:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A673D16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593770380;
	bh=hn2aOjMJRNE8f5HRxmQlF3oRJBHSoruFQ5QiCEBsi70=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+vE1Hd9nXu9ovOwlE2yP6zVJz5hhsAMseEbIuTrxSEMSA4hkOFCunTSMjtx9L3EP
	 8ddtwQfdti391jH2IXUUv63oF9cLH40qTNQrF/D+c14L6bGCYEiwV/Rw9+HrgI9Ic3
	 cDSeTzKP6WDazv1xyXCni+tkYoaod0eWBEIdZMwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD358F8020C;
	Fri,  3 Jul 2020 11:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A291F80217; Fri,  3 Jul 2020 11:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C36D0F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 11:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C36D0F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="m9yY+6aq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZVc0dN2a+bfYjVdXC+PxGT6Sy2j+vky6hwhlyPuAtyksPW5Y7O/k4k29GYLYecgbjfx1p/j+iq3gz2m4N33zOHGBh/lsAMSgJB+4lhgUGx8N5PNYCS8R5VOdD2+MMeChqaezg4Td3ZbzBFkMQB5lQpTM+JUFqD1j34FL/4IeYRI2Y0PYHoPazAXADN7ePPA1erFmkbXNqreLs1x7pdxUsQqClWopkG2v3PXylYxmvQrXVdQAFZnyG9x+rdt4XfQWKorTFxtgR1Yy5+6z3pB/YOUyPBFfcxkFW1D5QNc5x6NA3AtkZvVYZ4QgjlB/d3V14LlJqwo8GfNvd/WdEdMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAeCWJy/4dcXeO7h3OplAjBLd/M2k0+W9TTTnglCcLc=;
 b=CdWMZyVpw7Pgs3ghvLN4mhn3drkCjuIUoZxzb/yhreVpzteTII92VYmPslanwsKe0wntL3/ViE5S4ViQCMTXaxvS+PfavyVP0zeJ4zeZ14RaxQK2Y2ItXg51LFoSwy8zN5Jn/XKNuR3Xlvakp76ZaXpVePVazH7k33pDZSAnhlvyxg57UwYJVvKije9ZumPsaWMIwNfIZ6htES2+usj2cZCN9Y9MXGPqWHERbVSlqe0xt6aMxgKfECuA3p0xQZFPIzG8XSXbAbxMy1Pg8g7g0KEyf7qd2uViat1/MGzpmyOzK9p2sPQyZfbQtX89Pcna8Bam4fNBf4wr50y4+B7+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAeCWJy/4dcXeO7h3OplAjBLd/M2k0+W9TTTnglCcLc=;
 b=m9yY+6aqcVTyAnOvTimck6WW7P3bX05TIzMIQbIVnN0Nt5BiGsxWYUT8tLO3PlOCeFp+hNzp/i4oxEmga+2Z53oOSGEl0YeQmwUN3i0ZyKnzkircrCQAsWQarS05egA2VrZuoNv6KmoDymtHk3fm7IsqOS70z6czK7WDSnfKNVs=
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:65::9)
 by DB6PR1001MB1144.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:63::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Fri, 3 Jul
 2020 09:57:46 +0000
Received: from DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5]) by DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::314b:f930:76b1:11c5%10]) with mapi id 15.20.3131.029; Fri, 3 Jul 2020
 09:57:46 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 04/11] ASoC: codecs: da7219: fix 'defined but not used'
 warning
Thread-Topic: [PATCH 04/11] ASoC: codecs: da7219: fix 'defined but not used'
 warning
Thread-Index: AQHWT9TglCRPh6aF50mArntijWazBaj1l1KwgAAIcQA=
Date: Fri, 3 Jul 2020 09:57:46 +0000
Message-ID: <DB6PR1001MB1096D4378397C76A4CFEAF28806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM>
References: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
 <20200701182422.81496-5-pierre-louis.bossart@linux.intel.com>
 <DB6PR1001MB1096535996028B7DE0D136DC806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB6PR1001MB1096535996028B7DE0D136DC806A0@DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: diasemi.com; dkim=none (message not signed)
 header.d=none;diasemi.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6659de3-9f97-473d-cea9-08d81f3789bf
x-ms-traffictypediagnostic: DB6PR1001MB1144:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR1001MB11440485C077558648CCD16DA76A0@DB6PR1001MB1144.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:147;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XE5b8DO1/Yln1IXel+YK4uz5THtSk+9vZLkjiKZ9fcfg0uI3hKZg/9QkImlY/yX18K/10Ql+cI6kR+A/JPkK2kVRRMJ1pYY3FDbG25uNPWFCLlI58MLMdQd9smIyAUyAmh600RWzokzKiiZRXGWS50Spb33eVSgwgZmUKhf4cE4MOfsgbBlf6Jb8WEp498l/DKCu5yIDf+KgOduywmpLCyyvQSXGDZYpjJILZYKX0PAeVvpImHRFbli5FUnYN68OBaRs8k56Ut84K/QA9s92QDBEH6cf2C38Vc2xSNrscPmpKWLq7h5LHYYjStG2StyPwu1c0kSVA1nT8E+/625U3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(2940100002)(83380400001)(33656002)(52536014)(4326008)(55236004)(86362001)(26005)(6506007)(5660300002)(53546011)(7696005)(186003)(54906003)(8676002)(8936002)(110136005)(9686003)(71200400001)(478600001)(64756008)(55016002)(66446008)(2906002)(66476007)(76116006)(66556008)(316002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: M7WeRRdt4tkPXyIvXIyTtu41PDfqMS7wYlS/D/CQcvp93WxBqEIyhihYSrzuCD+u+c2hsgRclG+GO1yYnjrvCXCtGMgDWfv87cves6yP7864GCJOiy/XtZigaDtVr9aLXDbpze5DFD47pwtnfifNI5YQDzW1Bc77Yc5BhMs2Kug4SJ+k8/ED55+X6wn0ywmbGJSA9cBSjxTUtE6Oc9gdP3eySeux/x+qEYyRZ0rMxFyGRvNSrTiiDaIzdvmE1zB32VO6XFoj/oJxTwsE8oLFNbo8QgZYfcwcfPleYL/KCOOZWb4B+HQxIj6uMoSSN7nYaI0dbh2gGawTWNhxFd/iPnFXc7s0vWMbzdw2b6mbixs5dT8Z5J2YGsjiCJvMti++7VZGjbhhq96plch7QgA8AZdF+89dL74j07C0QH/+g9t6z1xO+bRuAXzutW/3Zu2VWdoW8XiSalDfEvZ+1ZHpmB7Olq7dfy+N4szGjv29oVI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR1001MB1096.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6659de3-9f97-473d-cea9-08d81f3789bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 09:57:46.6526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iN3bPhffLRutYkJwRh5m7B0lQLOvhlhNY2oN34mhcFq8Ic29jRJcPcAlM75GfKOzyv3nSMOw0oFFWWqKptnAQI8tfMJb9yh/FnCiEuFnMXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1144
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

On 03 July 2020 10:33, Adam Thomson wrote

> On 01 July 2020 19:24, Pierre-Louis Bossart wrote:
>=20
> > fix W=3D1 warning
> >
> > sound/soc/codecs/da7219.c:1711:36: warning: 'da7219_acpi_match'
> > defined but not used [-Wunused-const-variable=3D]
> >  1711 | static const struct acpi_device_id da7219_acpi_match[] =3D {
> >       |                                    ^~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.c=
om>
> > ---
> >  sound/soc/codecs/da7219.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> > index f2520a6c7875..153ea30b5a8f 100644
> > --- a/sound/soc/codecs/da7219.c
> > +++ b/sound/soc/codecs/da7219.c
> > @@ -1708,11 +1708,13 @@ static const struct of_device_id da7219_of_matc=
h[]
> =3D
> > {
> >  };
> >  MODULE_DEVICE_TABLE(of, da7219_of_match);
> >
> > +#ifdef CONFIG_ACPI
> >  static const struct acpi_device_id da7219_acpi_match[] =3D {
> >  	{ .id =3D "DLGS7219", },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(acpi, da7219_acpi_match);
> > +#endif
>=20
> I think this will break non-ACPI builds as this symbol is used in the
> declaration of 'da7219_i2c_driver', without conditional compilation surro=
unding
> it. Unless of course I'm missing something. Could we instead use
> '__maybe_unused' to avoid this warning?

Obviously a slow start to the day for my brain. You've obviously built test=
 this
given the intention behind this is for non-ACPI builds. Will get more coffe=
e
shortly.

Still wonder if '__maybe_unused' might be nicer as per suspend/resume funct=
ions
on platforms which don't include PM_OPS. Either way though:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>=20
> >
> >  static enum da7219_micbias_voltage
> >  	da7219_fw_micbias_lvl(struct device *dev, u32 val)
> > --
> > 2.25.1

