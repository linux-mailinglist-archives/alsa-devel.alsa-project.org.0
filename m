Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF21DE52C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 13:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0F51873;
	Fri, 22 May 2020 13:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0F51873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590146136;
	bh=5aZTywGJKYviNcqGubYNaYXPaZFyRN60U4RO49Z/dUk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkS1AsxEWlGAeUs3A99kIIj5l3Tk4lBnYjrQWMcb6ICLjiim6PbyHl3cti/Yrv42p
	 azEOnufySsmI81ZcirKw/4IBoPAdz0qCy1wSlYCFBUBrS37HWYRp10Ag2H6gvsUn34
	 sRBkRaxPvzuwGkPA3O0Ezxsjy6HbmlWWlzLcB8Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E064CF80140;
	Fri, 22 May 2020 13:13:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C8D6F801F9; Fri, 22 May 2020 13:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B931BF80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B931BF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="SHaT5flN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpNa9Q39cj4AXJjy19JPU4qe9OtH5yRjE9rIMmHDDGj2YWRIiyN1fd1aHzgJ3uv62c1r9CdIsPxsLWF+GdBzhcYChA9wIwuXHnIpJ9rV47ah1dLs3wExqQCsSYNAtwBwhqr7Izvb9bUKqRpx/RoPvmXTbYd1otFkE5UZC7McgwUUklUyis2nxDY07KfL+rintRyV7JgPuRgOBhTuRrlfKJcjQD+39ksCyOloxT9vZsVvDcnBMI97msJYTjmmiHQaTXpPoFR4CD1r5Z7deMiuZ95yM9TfIc0i6dIigQrHpLRqcS7XLkvFhfERRheg3J6qBJXAjmYeUfQzBpybRtqi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aZTywGJKYviNcqGubYNaYXPaZFyRN60U4RO49Z/dUk=;
 b=BGuUXqvj65Lf+BZXnX50SGcQdG54OhYDS2Ckav9DtD2P6ffWJgWLfKwMqVYkyYGZpQnrPdIsSbEVFP172aYSCWYNxmzDu9RNg9APb5VYYLtBoot3dZSTIgeATBYYX0QE2EJQdej3jZLn51m/BZ+QReeHyDYUiqEPZLZUoGNfHLdSXqfRObTAkkLybgX57MJFDm4CvzXsCdMT8ZQ4w77HTAWyb0GC3XN4I4GMwHhwWuzW8WAyap1fVyy0Nq6Kn7qg72yHZe5rd6ovHwGHeXFQpQYjPlqvJm6QkGgcNZ4txWBZ8vM6YQu+1HxOY1ZoFhQNZHDbI8fJ1GZ1oOiVPqN+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aZTywGJKYviNcqGubYNaYXPaZFyRN60U4RO49Z/dUk=;
 b=SHaT5flN1XZwY3OnRaREKsbWFEMR+VdlXEicsrnF8LyLhdB9n38b1PhTdTbXeoNmAsN0hagbBJaJq5shFt0fXr/U7qZL9Ml7suZwEMZnNUn9+dbYSp5rirz8QjkHtpyesm2mlD1oAQlqQ40U//mmSLXeRwWx9eTfSGI/U5U4nR0=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB2811.namprd12.prod.outlook.com (2603:10b6:5:45::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Fri, 22 May 2020 11:13:44 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 11:13:43 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>, Hui Wang <hui.wang@canonical.com>
Subject: RE: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Topic: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Index: AQHWMBGAxjoSFfw9qEKCikUbd/uKQqiz8myAgAAAyuA=
Date: Fri, 22 May 2020 11:13:43 +0000
Message-ID: <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
In-Reply-To: <20200522110811.GB5801@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-22T11:13:40Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b3596346-500a-49ca-993f-000062eab0fb;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-22T11:13:40Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 61c700a0-56c5-4e47-ac24-0000db52edd4
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f7d1c9d5-3ce7-445d-b905-08d7fe413056
x-ms-traffictypediagnostic: DM6PR12MB2811:
x-microsoft-antispam-prvs: <DM6PR12MB281137D27B39655687AA026E97B40@DM6PR12MB2811.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h+Ru2BekQbWXS//QfBVqn68VaPFyd/6EOlB/8edYE8t6UKi+pM33sngiK3tUwAv9sa+H4YLMWUF2ksklYuiJV1KGU8qU4i7ROAzTYNYrI70bvnxuWNLL7GPrjMXs2qQtBa5XL/ZGiokv8fYoBzStQy1yXM+Pzv4vuG+kbSklMuEkV6TOY+wPmTlDgm/ArpQw2cyUcx27KndH/MxNp9MiYCJYdLc+nGExS6ylqgLDFSXNdMSx7uEO1rX/J1qR//ty+G6MU5x3jEDA02hsbzduca+NiokdXC+iiKegEDZDlqPx4B9Wf3E9ZSIpoxngeKQTW4duqfp5duH15SfJHLMWYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(76116006)(110136005)(66946007)(4744005)(316002)(52536014)(186003)(86362001)(33656002)(5660300002)(66446008)(26005)(6506007)(64756008)(66476007)(53546011)(7696005)(66556008)(4326008)(8676002)(2906002)(55016002)(8936002)(478600001)(9686003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: QqSPPjV4Lc3dJywiF4s1yYkChFdNSlzbe4aMkCSzOAKoUEa+fQQiNAwzeaqrvFvdnlclcte3AvamGo7ZffozUsOVqa+iA2UJi2Zfx8KiIZN/sq7kE2/zgHdax4zVw5UYcnNgAfGkqqbtxgALfeZnuExGWyJZn2cLUWhl+kez1MgPYPRgZwNGB9WmifPw/dKaOaKxYahAxd3gOtvNdnktXbQn8zLjsu7u57kkYP/yYZi5lZXQdB0aCLjAOtaV9hxGygYM5rkOov57si2HnbuzCrcVDlsYSPOUts1dX5qoMyP+Q47RgVBRpvj69Lpx4kFWc9Fd9yYlBOtQ+fBT/zkpXtqr6A51sTHGCDqqcNykVBQvRfEuTDe1UHWhn2bxD0PYK4zjylz1Fq0E/lkKCQ2H619fqO2j9Zzb6R0gTXEOJcAzjgoaWNhzbYxLSulzwRkzVFd8x8at0QzXabb0WOt1kkdYxz7qtZg/wUO07nqxkUOw9nzpaYmqQj/hWkRLzSFG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d1c9d5-3ce7-445d-b905-08d7fe413056
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 11:13:43.2714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YviphfsY2Ffc6ysbd8Txpln1iBRVPYAdMHq+KWzgxDIML34YMmjP9xAJZlbHaASfie5KDk2/HqslxbxfBTkWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2811
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

[AMD Official Use Only - Internal Distribution Only]



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, May 22, 2020 4:38 PM
> To: Hui Wang <hui.wang@canonical.com>
> Cc: alsa-devel@alsa-project.org; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>
> Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev =
to
> avoid -517 err
>=20
> On Fri, May 22, 2020 at 04:17:38PM +0800, Hui Wang wrote:
> > If the mach driver's probe is called ahead of codec driver's probe,
> > the kernel will print -517 error message although the audio still
> > works finally:
> > acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517
>=20
> This is just a bodge which will be at best unrelaible, it might work
> around your problem right now on your specific system but it may well
> introduce issues on someone else's.

Does sound card registration failure at boot time due to modules loading or=
der can be considered as bug ?



