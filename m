Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C31D94E4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8C11711;
	Tue, 19 May 2020 13:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8C11711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589886322;
	bh=l2RVqefE7u5ilP3hrp23merhzc7uo7WuJaeVGHp3ucY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZEWtL2KW+ndHgY0sCZJW466NA5t25/V1abxbWm1+OXu7V0zrKQJ0bFEPGjjR4riT
	 GNTirWQKgagN7u/Rr+LebvmjDHzRDR23gWulxZ4vZWq9jdQELW5hDjbsR6Jc1PAjMO
	 Ny0zOr2SNVz0hC0VzA/VwDBSdNkHvYOUj5KUFRhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A04E3F801F8;
	Tue, 19 May 2020 13:03:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E802F80110; Tue, 19 May 2020 13:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770059.outbound.protection.outlook.com [40.107.77.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE08F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE08F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="lQnTgNqr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9MdEkE99Soz+tU8B710qnA4ikmMpCK9fZltHz4GGkjcDXDN64DcFuWK/xaoQywPWK5v0PZsHQtnaDWONAR6jwFAj/rrUdyXSGx05AYuMB48otXRRD01fzvK5fM5suvZ8SEwXqlyo0pVy97ygO+gdzcQa4LLUrX748WmVyWtn5PSbbUq4LCKwmXtrlOJ0cA1reN761zbr6nNpX2zM9bSA2X4Qw6RstyLclbToEfxs2d+aJNhw1y1U53DfQCyWchuekjbtGexLjJo1reEhFyY7OyZZnqrWPkhzLPMxQEqTZed3FyKOseAm5ATZmD9vg4JUY1Sx+ocZem0uMjDe8bROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNVWplGLto2WtjhWNkFoCLCMKXktwCiybtZNYnBhiwE=;
 b=W/Pv18aXyN9RGdTOMtaL69RoqumTsmCIzFtrT/2MstgyUZz8uRFfi84Bvm/sYhnZYg6tmkRi11WjgU/XDHPLgb+Be0xOdXZ6klpTAiu2gSI8yItC99FjixiY/qoIewhcmsnmFObLZISa+L2OaYb5mvxX1cBtc5Z7xwDRFQTlSuybM0g26Pr0A8ESIUAtqi9/4BQUcXfCF8Ky228XwLZi+46of///HotVGVYx5pDfpuRb2RV9ZmOuRbw2OPWCdtvzORVcDkGPnO0fazMHocOMKDBqFLDoXMtze+b4Vlplx4LNWy6P2q5PNPXytcO8xHwko0u8zL/7wNlGNsQs1yq/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNVWplGLto2WtjhWNkFoCLCMKXktwCiybtZNYnBhiwE=;
 b=lQnTgNqrUNq/fbfl0NN4FfUk1RAo0QyJirOP7R7Kz/uhLLofv6Rt4ATIeB8H3mACIX0Xvd8l0eX8vcIgf7sLwVClgy695TO5mVr3DaCNcKlmfYi5uCpcZMcRMWn31PoYEFHuG9bbHuTi6hTIXesmQjcCayu57O/X+2kL8CP2W9M=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3483.namprd12.prod.outlook.com (2603:10b6:5:11f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.27; Tue, 19 May 2020 11:03:28 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 11:03:28 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
Thread-Topic: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
Thread-Index: AQHWLTgxkawVWQaM7EmDx0Qzdl78eaivPSmAgAAAllA=
Date: Tue, 19 May 2020 11:03:28 +0000
Message-ID: <DM6PR12MB2633F809ECAB00A78B76004E97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-5-Vijendar.Mukunda@amd.com>
 <20200519105359.GB4611@sirena.org.uk>
In-Reply-To: <20200519105359.GB4611@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-19T11:03:25Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=e9d6cfb7-6f31-41e8-9868-00005a4652d3;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-19T11:03:25Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 7249f8b3-3e1b-47ea-bd5a-0000718fd6db
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2aa220d0-98ac-42f3-5769-08d7fbe442c5
x-ms-traffictypediagnostic: DM6PR12MB3483:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3483632B88A3F00399077D8197B90@DM6PR12MB3483.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ZnSs4B+nMI1kcP2U/XL+tmW92Lw1futiBHQI7FxePwhqOQ6H2sdnauNo0kWOpbDZKRJi1w069LhPFfRy0Tx1BjO8pqSC008nzvInlLj/PQpEVyInu1O62WwBOSamDhRZH5UbYtmbHNgwyqwIJ94tz6ncE3Z9oDeywoktfYeiWuZ2aa4wF85GxF/iRrMYZSjkki2jzH/abv/0EAMo+AQXJ6A3NiHyrMs5dt5AZOr7D3oYkvTyP1X7z7NyP1VoWk06nB0qB7Fw3GWa0QhLP/r5QHOhc3WeCtv0yl12yx8R+q3rlgUpGAydxZIsZhEemKE6g35JpRE5SaOHozDhK9ZgQVDyl+KzCBAD0dTP0U6bOk9inPHFtC3YRBVLDh+RSAVtkZyPTS60eLu5bvj6OgWOh0p/ZpjV2R+SrQXSbujRytUDjh/GNQXC/wfMlx/+m1JW8Z/j/k43Yr6VDa4yRNZB4nkbPJWusWDrbrwTVZsGu4pHZdWM4kJV74i1QaifDd/4pYVy4H6OsbFcR6qFdpbQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(53546011)(7696005)(6506007)(86362001)(54906003)(316002)(66446008)(52536014)(64756008)(76116006)(66476007)(26005)(66946007)(66556008)(71200400001)(186003)(8936002)(55016002)(5660300002)(478600001)(8676002)(9686003)(6916009)(4326008)(33656002)(2906002)(42413003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9khPmZbWt6cFJ2qsknf/kL+gdu5zuhN23sQmVJTqNY0fDiDaUCqw9Kj02VoqHfPUtimeM5tgF6AKOr1R7L61IjPc9RgNEf+3zXT1b8CvRKw41Wraa+HMF9s6DyVBmMs+dpJGM0lkXLyclOfbxkrndpMudBAt3UDHxZcHZq90VuDep+TR6AcJ86N5DqJyhFwoeGrwHoT/V/gCYPcDoYiYgFD/EUwc6wV9o9ITxCxe4SJXaJINgK82k30a6ms4dk8pv+ynd2esAVhpt9U0ldJRb32sBWBfQ4+aVPwhixzeFjL1XD1SWBz6vqZFeqqostYvTYNw+1bot+/LwbUg4G8GRxpQMtMIFNntx2reTO6din8096kSbEuNztHKgBeNzpqtrVNgBIYaSBSrWtPgDgVRfyQFEuxNyMBrRYY2BuoInMIR49kYUP6KFCST7BAn7bMObVLPcWBnPGJJQ689GYeOndyNPaFtoGBbOMx2N6Wr8tfdvEURo8pNQdz9qlQwhoaB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa220d0-98ac-42f3-5769-08d7fbe442c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 11:03:28.6859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muUh/RegSwq6jnvYfoECURALmPxmsyzpkpdlGwELDjCU1XoMoxHyNx+XNYppe5SSZpRMmxFv5H1/Ri8B5Ntg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3483
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
> Sent: Tuesday, May 19, 2020 4:24 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
>=20
> On Tue, May 19, 2020 at 01:16:54AM +0800, Vijendar Mukunda wrote:
>=20
> > +	adata->res =3D devm_kzalloc(&pci->dev,
> > +				  sizeof(struct resource) * 2,
> > +				  GFP_KERNEL);
> > +	if (!adata->res) {
> > +		ret =3D -ENOMEM;
> > +		goto de_init;
> > +	}
> > +
> > +	adata->res[0].name =3D "acp_pdm_iomem";
> > +	adata->res[0].flags =3D IORESOURCE_MEM;
> > +	adata->res[0].start =3D addr;
> > +	adata->res[0].end =3D addr + (ACP_REG_END - ACP_REG_START);
> > +	adata->res[1].name =3D "acp_pdm_irq";
> > +	adata->res[1].flags =3D IORESOURCE_IRQ;
> > +	adata->res[1].start =3D pci->irq;
> > +	adata->res[1].end =3D pci->irq;
>=20
> Creating the subdevice is good and sensible but this is basically open
> coding what the MFD framework does.  The subdevices should probably be
> created with that instead.

Previously during raven I2S driver development to support multiple I2S=20
controller instances, we have seen challenges with MFD framework.
That's why we opted current design.
There is lengthy discussions happened over the mail thread during Raven I2S=
 driver=20
upstream review. Finally current design is accepted.

This driver further going to be expanded to support I2S Endpoint also.
We believe current design is good enough to handle it.

