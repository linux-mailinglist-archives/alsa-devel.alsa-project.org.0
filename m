Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B601D957D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A60DC1768;
	Tue, 19 May 2020 13:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A60DC1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888695;
	bh=w3Pp48m1G5RlhSQ4uXs5v/hTUMrULQAgmBTP5wMvAKk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJEoEilW5VIOpGP5i6Mh+S7HhLRwtpbJFtrAUvV3jIpIb4ftg0hK54itrXfqP+B5f
	 CQ6VY3fL+HPEUKM0D6nPqHjfSLTFvZRHSPq1BAXr4ljseo4K1a8qIueYFI8N8G7Iwv
	 ETUQdRVbBpCCTT+M8/ge6pQwSthrZaVzI/roxRKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18058F801A3;
	Tue, 19 May 2020 13:43:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D78FF80229; Tue, 19 May 2020 13:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 566F1F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 566F1F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="OB8du1xX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAfjgr3We4B8Y8CbqvxGj2ZXZ/4OVa/2qm7/kn429X4VgJHE6AMGRYGiBVAxeIhb0m32YR8nlfIKWgVTg4Nct1Nf+sIXtdAEtSFk890oLIoEln9wjnHC+cInWX9SL4cb1IJ3vLvnebe2z4qBVO+Mie5J6dhXNX7//UWzqaAcrB9+X0YdsnB5aOFGX4f8o2rxxE4QXBaeIekdXE5OIE/4NOk45B+77CYIS4pcayo9NkK3zn+zugZVnHuGKuFjeg/mgVS8lWH4dVh6HynCyehDQC0twuCaN7pCnhicc9fw45n8m23r22dmxB2Bzd9Vf9XPFlJskJit/1L3PfCd/ztqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3Pp48m1G5RlhSQ4uXs5v/hTUMrULQAgmBTP5wMvAKk=;
 b=XPeVnoDbSfnm7bx1dHOOeIZILZQCR8v7muF304xWpMC/OIwUk+CSEF7J6Fk37lj6GeMJ5YuMNRgNDUaIqrL93NjKsn5FYjowgXXLYupqaIfARrOfXBO/LfIhQK8xVQFMCQqDtPDdlRtTSquSwYG/jBZnzUOlkw08J5NWKfIVUWv+s74Y+w3DMNrN1+TqIjKO/Lbcf+0XztT/48z3jRPOG2hIIvrTCWFdz7q8SJzssQUDbKqAJo8DZ8Co3acKHSr/mH4TkAiK8okImJGTvOzIAxcNnDr6zGpn439/9JsREBkPJSvHtKltGPVLJJ35+kEYO7prG3E4lRU21rYCaVB85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3Pp48m1G5RlhSQ4uXs5v/hTUMrULQAgmBTP5wMvAKk=;
 b=OB8du1xXvsGJ/atfa0NoJrcde37SGOvTNwIDkULzjmixGur6JzCk12dCm3buOfs2l9j5jNrP+yJ3aotVvvQhdlNX2GtC3kFsNFtimOWd3YTLv8b1Czixl7XJgBpRCnXcyhOGeejSq+aN8N2FjTibBYQUyKG7q/G90gPhw1OvnQ4=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Tue, 19 May 2020 11:43:27 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 11:43:27 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 00/14] Add Renoir ACP driver
Thread-Topic: [PATCH v3 00/14] Add Renoir ACP driver
Thread-Index: AQHWLTgtTmZQ99bpt0+/Z5YGee8cJKivSaUAgAAAS4A=
Date: Tue, 19 May 2020 11:43:26 +0000
Message-ID: <DM6PR12MB263364D5BF8C368366C82CC797B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200519113840.GG4611@sirena.org.uk>
In-Reply-To: <20200519113840.GG4611@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-19T11:43:24Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=0f3f22b1-a94b-45e5-ba84-0000afb69a80;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-19T11:43:24Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 5ec0417f-b8e3-40af-81ff-0000138b9942
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b27a873f-bd05-4803-e3c8-08d7fbe9d848
x-ms-traffictypediagnostic: DM6PR12MB4417:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4417414AEFAF5777BEC2572197B90@DM6PR12MB4417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xJZI046BoI1ueLgaJ5zUbGiKgT2FF5x4UbNHhrad4A0UOGPJ3XGoCGE/fnKaDudzeWyOvK4E5VSD26ouH2Nz/7vpU/NULRBxXMs+vyLQCqthqsuoZPzW2n3eptZ4n8QsFiZiEZA5j9AgIyToRqVbflbkc1ZbCvg93nRuCUpe2OHF4bY1jCG0qr3xGHGWUr0vJHZ98EWEoKKd6M9bfGp0lKrfW7tB3j/fiSX0SqDWM45iQuDdTa+4ugrzzlzaXX90ARuAH9sNhsE6BVRUbFvYUzJKEZM5cu4U1L786kJP5zzwBulKyFWlLIHfOGhERlP0ZVOOsSI2kH1ZO8ahh1PqNkGnOP14rtnz7S1IheiI8K5GsKRJYC8e5chZml8qQM9WmhO+CwRKNrKrDsiseDNv9JHS5IYASu5SoDCEIDAYKrodWwHyiPI8iIQE4aTCd5Ah
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(55016002)(71200400001)(53546011)(8936002)(4326008)(6506007)(316002)(7696005)(186003)(9686003)(2906002)(33656002)(5660300002)(66946007)(66476007)(52536014)(66556008)(64756008)(66446008)(478600001)(76116006)(6916009)(54906003)(8676002)(4744005)(86362001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VuHGrKSetYuvx3vg69nvJ01maM7Q3esYHnlpcGnNUOh8bBJZCoS53I4xW8rJpkasm0ayFcEEm4QGTzljqGmpB3CqnUzynK1WEUok9rmC4XACc6a1sQAwAGq95/sId87qqrNeAjACFNpYzZAjJqv9EJu2RqAKnMmoBfchc079BUd8m8Obbqt5b7x3MYgv9UgXNjZkdSO0x/xB2NF2BFq1wzUOnf6aDNkvQN16VOo94rRH/P5tjargxOYnyvVQ2lgN8Ar28xvzi23Qk9TLNsmcQXXNVe+6PqMGaMmmInYt6u+PsifQSkMpkX4aOKCUrIrsa04OVw3VPt49ZhFIfZMnqbtQLAqkqDEJPL8T6FJ1uA1715u49TcXlOsEwclOxY5GOOZFOmVVQOepN4wl2OELLeGmh2bLM408b2dbmbJNp/N5mQC9VJlCbD7CGRM90Q1WT1m+PovyMU+Ga11Xp511aBxKAcvw5rpKoNq5JKZXdmuVYDFyYmTG7EwRmz2P/36z
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27a873f-bd05-4803-e3c8-08d7fbe9d848
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 11:43:26.9862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PTheMvJs0RS6RJZPHzgyjw+Ne4JCUwJSTd6XBoRC8mfixS1BIkMzxZAINkr1AkQj3cApFHr13m+5WR8CcFsutw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
> Sent: Tuesday, May 19, 2020 5:09 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v3 00/14] Add Renoir ACP driver
>=20
> On Tue, May 19, 2020 at 01:16:50AM +0800, Vijendar Mukunda wrote:
> > This adds an ASoC driver for the ACP (Audio CoProcessor)
> > block on AMD Renoir APUs.
>=20
> The issues I found here were relatively minor so I'll go ahead and
> apply, overall this looks good - please submit incremental patches for
> the issues.

I will address your review comments and I will post an incremental patches.=
