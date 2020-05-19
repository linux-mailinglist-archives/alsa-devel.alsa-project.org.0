Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD141D969A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 14:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0616A1752;
	Tue, 19 May 2020 14:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0616A1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589892458;
	bh=BBDyqM4LaI5H7gAPduOlyffTkZVBjxuLuAOl9qZET9g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P6dggQJyZpTWR/WbvAx7Fd1FxL337bE6e+3zT8VysIITsz+sYT/kbHSBH1bqlwhmM
	 5lYQbUqYUk6NycDLbflSDk3Zg0uQU5JlCVt1BkSRluJ49ULF7VsehkoFHltDHrD/9f
	 anoT7NmN7dhydIvjOhS4MW4krur790JfO2NIo51o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB87F801A3;
	Tue, 19 May 2020 14:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC73F801A3; Tue, 19 May 2020 14:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CB35F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 14:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB35F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="pzmhRqr+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEijlLL7dQLPIJfqwOtYey6+ItBfamDTBwN9HNlcyL2HxDI06VIsVZojVbjjsKsZe+Y8X4+/MWhZqnMngDRE0oF02GLET26BXMaKyLqcktGndTOSU6p2v1+Yspd0eB2pO7kRi+6sK8PbMoQVbM9PXKS3GFI2H+qdozvZZiXqHlFhdZCWFP77qvtCYjPMcH3DFl6t9zVU9iHj1t8OOAAl7xJhJR5kQiZdTmb7Kh1S1yB0O6fB45UxiX4C1HrDwb7j45/gf5MGv1vrkwXoYgrIYn4gC7c/MxsefM9/dwo8fSX7BcaAcKKP6OBEE0Lfoek49K+yMxB2CAqAGG8Wcsu7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBDyqM4LaI5H7gAPduOlyffTkZVBjxuLuAOl9qZET9g=;
 b=QSQyGBODb3PUR5xhe7D9TiCxLCj1UofVznpfnBM7f3ODfRdBdZcslMwIIFnHiKrCUF5al65XmUXjyPDcYluJd39FqB3INCKfzWNupk4QBBJoBXB9yeEm0kd+1yrl0EOAM22UpJ/yT3JtvC1yxD8Sou+cZC1ZSh8q48yBLTqzBTr6qtEDefVeb+3eJGw0nDNdTXolSn4OSsU5bjrAmssTlbbxQozq147gAxAzf40j12wTYSObPEI1VOu0vm8jxknQgCruqxbs60DmE3FgMzQb5IsUbnmVTIPdP+p+cCLwyQvPEo3794T4X2804YPGQUdZjS3jgEZr5iqp2MZy41qpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBDyqM4LaI5H7gAPduOlyffTkZVBjxuLuAOl9qZET9g=;
 b=pzmhRqr+r0Ez2uqR+xi6e7G/xWOp9MYMCRxLRyBDLbFMCcxQGHIy7PwvuhTuUz8Xae65TmeUvFVcSXylII9zLbp8ZZOO274264MImQSFcFGRMkGRImbOG5B4pf81npPKqs2NnwDebeklf9Y3a6F+IrViQyjB4etI4Uy7963SVAc=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3371.namprd12.prod.outlook.com (2603:10b6:5:116::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24; Tue, 19 May 2020 12:45:42 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 12:45:42 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 00/14] Add Renoir ACP driver
Thread-Topic: [PATCH v3 00/14] Add Renoir ACP driver
Thread-Index: AQHWLTgtTmZQ99bpt0+/Z5YGee8cJKivSaUAgAAAS4CAABGaEA==
Date: Tue, 19 May 2020 12:45:42 +0000
Message-ID: <DM6PR12MB2633CBB77EFD8157982CD5EC97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200519113840.GG4611@sirena.org.uk>
 <DM6PR12MB263364D5BF8C368366C82CC797B90@DM6PR12MB2633.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB263364D5BF8C368366C82CC797B90@DM6PR12MB2633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-19T12:43:30Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=6879871b-03e5-43bb-9e2f-000050ba5e61;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-19T12:45:40Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 8944a42f-c016-44ce-a33e-00004f1ef599
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 181bf3c7-3da3-4e59-ff4b-08d7fbf28aec
x-ms-traffictypediagnostic: DM6PR12MB3371:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB33715E7E240EA2FD0339488497B90@DM6PR12MB3371.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/3m9sEbJ2ChWiHvjEbxgBEVhaSVrRLmzbKP5P/U8rCKJRpJsvJXqVaE+sPSxBmAt8odOTyVZkqeyrBNK/Qc+3OJt24/XM1/7H0kd5RI9V4VU3yd9I3HNNdI6ZtpFG+XhO0XZ1QUNWME2py2UzK2aPduyijRXCuOasv5IPT1YRgQ0GkEa/lUkG+azKyLsb2A+Fz1v5ZJ+4hvLSsKJRzpEx/dqn81e519WvP9ZuUbWUtf6UpGz5WBYKuxcouTm5+/l58U9zX7xs2vvLvySGM5YS1stMtxJzfWji/0zv/Z3JvjbwFs7XpyCVXMznVuZbKQKnJvw0s/Dn59azw1iNHTBnO/lIyPk/OpOOCF9o3v8zjA+w7FnlSRsdqPSs/DNQ07/abQBxLU14B513e/a/6e0COZytUadKJUYUCUi5INYYyWuJZdiTTvbM1lTUHAvyGb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(6916009)(7696005)(52536014)(316002)(54906003)(5660300002)(8676002)(2940100002)(55016002)(4326008)(9686003)(71200400001)(86362001)(478600001)(8936002)(2906002)(186003)(33656002)(66946007)(76116006)(66446008)(66476007)(26005)(53546011)(6506007)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PBztoNebtLWxw8mylu+gDPo/dnVRqML2JY6XJDaBOFwoB5IhDOLkSE2FIxsTvBj/pxuMN0xMtNnivwEIyQaIdwA+5bZc+bILfARLs0ZD5KS1QHPOCLKRoJtGNV3/1WstCKFgPG7euyNonOhQ9sIg5TNYu/ZxONCFDn03eAkBaHFKAg4alYP/g4y97WRu+mP9iopKNsrbcgBTIOZuEflIT2tFKTLhjWlJb5OpN2FBIsF9xpEIO7K0eJ4ZsvZ71qgXFQrLT3J2lGHhv64TSLuyMwXJGq/oBk3k7iECEp4KdwYn72ZQVGRzN72GUzHNoHmCtA5zb8SuNR8TRk0HdWvjKkZ5sQftjCUtwvGnct3mIiw1B2CPqbc+qB3w2J/bE2PlJ1rCCplX2u/EFIgIn2ULQBORmCxm/FyhrqpTQ8gV5NfvGAXHvXvmEr3eTIOJjb01RxDpRgChOc8wU6VNBg5o6d6fjPccaSCAeslrKZ7RhfKOlRaRAD+f37sWtYWfF69z
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181bf3c7-3da3-4e59-ff4b-08d7fbf28aec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 12:45:42.6200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJzCj/OHBHztOJFl5qqpfwlz+xWAS/LFmY5iqvLcBsYKiksEgp8qC/38FUg8n7AlAjYF1fUidx6F9z0PIVbuNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3371
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



> -----Original Message-----
> From: Mukunda, Vijendar
> Sent: Tuesday, May 19, 2020 5:13 PM
> To: 'Mark Brown' <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: RE: [PATCH v3 00/14] Add Renoir ACP driver
>=20
> [AMD Official Use Only - Internal Distribution Only]
>=20
>=20
>=20
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Tuesday, May 19, 2020 5:09 PM
> > To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> > Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> > <Alexander.Deucher@amd.com>
> > Subject: Re: [PATCH v3 00/14] Add Renoir ACP driver
> >
> > On Tue, May 19, 2020 at 01:16:50AM +0800, Vijendar Mukunda wrote:
> > > This adds an ASoC driver for the ACP (Audio CoProcessor)
> > > block on AMD Renoir APUs.
> >
> > The issues I found here were relatively minor so I'll go ahead and
> > apply, overall this looks good - please submit incremental patches for
> > the issues.
>=20
> I will address your review comments and I will post an incremental patche=
s.

Got one kernel warning reported by Kbuild test report.
Will upload a fresh patch set.
