Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F301D9A37
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 16:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C413176D;
	Tue, 19 May 2020 16:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C413176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589899334;
	bh=XOvFOw6t1F/4tLGgV0u7BhAQWZlUh9QP4zkkll6kCbg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enJd5ugfyvTwtcSQ7mkzn00s55WsKHm4/1iLxa3fP1FQf8+tHD4fxPpjETmiU3jTw
	 oDTzUMZB8eo2bt5dONyYbqplDw57XGL2JT4ZOdQRg0xsls3lKwIINfCVh8I8pXFhib
	 XVWZElDnwITmwgTTImZ3zVyU7oQl3Sl7l36/iYlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B295F800C9;
	Tue, 19 May 2020 16:40:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D2C3F801A3; Tue, 19 May 2020 16:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A17F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 16:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A17F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="EFLXGYI7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D98t1o6KEw2+PwhHAQAhXKgtF3AH3Iv8c+3Hn1WPj0/kgAmlwMkXEeuMn3th1Vxn7O9MMH26hxSAqnWyXXRyksolCVpQ96OxMulu0rCxf5ILtepiWYdZJ6Mzu96Y6NaeIhJr+S2Hlv5aFOK1hJi7J0ne0z/JzcC5DPC1xq7Be2woiyn0L/57zbxmBFt23Yw/wIVJw3usCQB+NVUdpwGI1CPsB7xlfj25/p+pmgT6JfrXQTwXXBxqS810LnsaBk8sKA547kYSPM8wSv5iMgs4eU1776kAO63k6Tumi/4OBFIopUColku7pWP43BfqsmLdfvDUpOs6PAuuS6nxQPHjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55gKoAa1lDzKdcNfTs8xGJPFJ6DZ52GZxJQDshe3DMI=;
 b=KbFuhEA8hnEtc7tuJ18CpW8GTZdJC8CrlKE5vo0fKf+S2dbEoRtRR0n6IkIdsbVV5GuE58L8e0QrO2F6MAhLtrBP0HgY7kCyO3rXuYc75AOcGPoikmjyaoIUZ7XnwABpXwXRYTwaGDZCQArIgMUjnjAA3xf92Jq+2omoJ40x0h0FFb2MWcIVUz8UaQ7/F5C+ZemDDsPrCsYVk1A7muS21VgSSgohMasMTO1NeY8j3HJUyl0jdmTktgVcQmUsB+bkgRjpHURq4tU/tipGl3XFrIWB7I3LfntqIAoaMImNUUOWLvpVxuqUtnlyiQ89a9c/Djp/1eygSM9UWHex4A8yGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55gKoAa1lDzKdcNfTs8xGJPFJ6DZ52GZxJQDshe3DMI=;
 b=EFLXGYI7yrlAzGUIxrEvkITdKdKyNk4Et+6GUS7IP4oUrE6zFM0/on0M9Kgz36ldOPi9bJ61VNKE9ysGxwY0018OgSYx5rTZcTe1XY+nl7rbbZWmXRQypITPutiydGTeEofnfDeE1ykUBdpUsoSPnCyE8yIPZ5hUEj4aFPiTbeY=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3712.namprd12.prod.outlook.com (2603:10b6:208:164::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Tue, 19 May
 2020 14:40:18 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72%5]) with mapi id 15.20.3021.020; Tue, 19 May 2020
 14:40:18 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
Thread-Topic: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
Thread-Index: AQHWLTgxgS+fctdw90GKqdueXRCrHKivPSmAgAACpgCAADupoA==
Date: Tue, 19 May 2020 14:40:17 +0000
Message-ID: <MN2PR12MB4488F4D0F47F64F713238219F7B90@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-5-Vijendar.Mukunda@amd.com>
 <20200519105359.GB4611@sirena.org.uk>
 <DM6PR12MB2633F809ECAB00A78B76004E97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2633F809ECAB00A78B76004E97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
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
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-19T14:40:14Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 03074093-d2ba-4ea4-abb0-000000d77697
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a0640052-ace1-47dd-508b-08d7fc028cec
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3712F87368E009D2D4DE355EF7B90@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tdNh9My3Nw5BMI2iPsj3Q7J36ZYKJqf/i6x5LwXnYGAa3DZFqKsHV5TIVzjmWXp0Psfks6yCJ6sMtcrV6NluHdmjtNds0WBkeWdvwiAny48n3I3Zqsaa9Kw2yCm/yC+66XC32QbS+Hu6TxDKdnEz3talCU+OTadxwI2zpNVdfdCk2DpTk5YGznI5lt4imLgqgN3x6JnuA6OhK5j27p/rXOPpXWxezdpQmS46EVB1FQmeqXxxe8sLk5F85ligD90Aaxnq0ctMmqvmcRx238AaglofpiXNL1WnmIKm08/unLijJvGTyDWgJGSCbmvxhAVbxBbybbUGfec2fvHM+GHDu56szKGNAem0WwMohyFc/yEOz8yenYCHwLQPKnuVP0+QUIjSlsHL//o1JtEop73iJUPoyeIi44BHHoY2kXaBrd830fIWeuNX10g256ULgJNNhDxeRCD0qaWCAkDlBTh2rzy3L12yuUW/BUsatH+S5DinJ/tqKtUYiGcncOJGyJq+woUjDO5sLmm/AKhDwDhP3xGhGlFzfcuASSN0kBDAke1oOsA3NEwIRu7HkwiBrHo+c1gXRFD+eAAvYC+ipkdMX6OfaGmqawogI1HbIgS6Kxs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(55016002)(8676002)(66946007)(8936002)(53546011)(6506007)(66446008)(76116006)(66556008)(186003)(7696005)(4326008)(5660300002)(52536014)(9686003)(64756008)(66476007)(26005)(54906003)(110136005)(2906002)(86362001)(316002)(33656002)(71200400001)(478600001)(966005)(42413003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /qESla30hYndMIWjIr7evk7Otb8Vo4Q97JMHocyPNTuAL/Z1pIJwuWBYiKJanEoJhwHs0LsfiDOKCWvP0c4P3autc8xTP1+6XgNqNVJiUWkI1T30QIr+ms0f9mPyiFZb13q28EBJbHvd6mh5CIfSWyETTm488wTUhNqaWP0rFAy4wyvbXLdbvwoVnGW6CFLSE8TOvCcRXgvtxnSZ3uQ8OMl6GMVO/noGLaqxnnaG2M67jPi4DbRMNZXVXrlH2sBxZY/yLGDD+WmGWMfH6yWVr/BBlxujJ+/cFc0+2jFrkBBWxlirC0g99ztq1PCElRezh4dqra7cC0r9pcAf6h+D8lhvrTY8BjSDU7VBv0PMdIM/lzByz0LT1QiF1T7QAqrw1gIGFu4jd0CrSvfP+8lpLvJXqbEYWHYmYIugbZTmjVAZ4hWSJvgq0l73KtMrkKQn3kkgABBgK0CMsOh7YIMZk/DFLvNpi16kT+pev5Xrxz3bxpysQJwg+a+Net5yX7Tv
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0640052-ace1-47dd-508b-08d7fc028cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 14:40:17.9311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BA/5LlumFtEdXc8cDSx2HUG4QCgB81jrUH8cmO6O98kBJ9LOvpp3DNnrPuQbXqEZBK6XoYfmBr9hbJvJc9oAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
Cc: "tiwai@suse.de" <tiwai@suse.de>,
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
> From: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Sent: Tuesday, May 19, 2020 7:03 AM
> To: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: RE: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform device
>=20
> [AMD Official Use Only - Internal Distribution Only]
>=20
>=20
>=20
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Tuesday, May 19, 2020 4:24 PM
> > To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> > Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> > <Alexander.Deucher@amd.com>
> > Subject: Re: [PATCH v3 04/14] ASoC: amd: create acp3x pdm platform
> > device
> >
> > On Tue, May 19, 2020 at 01:16:54AM +0800, Vijendar Mukunda wrote:
> >
> > > +	adata->res =3D devm_kzalloc(&pci->dev,
> > > +				  sizeof(struct resource) * 2,
> > > +				  GFP_KERNEL);
> > > +	if (!adata->res) {
> > > +		ret =3D -ENOMEM;
> > > +		goto de_init;
> > > +	}
> > > +
> > > +	adata->res[0].name =3D "acp_pdm_iomem";
> > > +	adata->res[0].flags =3D IORESOURCE_MEM;
> > > +	adata->res[0].start =3D addr;
> > > +	adata->res[0].end =3D addr + (ACP_REG_END - ACP_REG_START);
> > > +	adata->res[1].name =3D "acp_pdm_irq";
> > > +	adata->res[1].flags =3D IORESOURCE_IRQ;
> > > +	adata->res[1].start =3D pci->irq;
> > > +	adata->res[1].end =3D pci->irq;
> >
> > Creating the subdevice is good and sensible but this is basically open
> > coding what the MFD framework does.  The subdevices should probably be
> > created with that instead.
>=20
> Previously during raven I2S driver development to support multiple I2S
> controller instances, we have seen challenges with MFD framework.
> That's why we opted current design.
> There is lengthy discussions happened over the mail thread during Raven I=
2S
> driver upstream review. Finally current design is accepted.
>=20
> This driver further going to be expanded to support I2S Endpoint also.
> We believe current design is good enough to handle it.

For reference:
https://lore.kernel.org/alsa-devel/20191014070318.GC4545@dell/
Basically MFD should only be used for drivers in drivers/mfd.  Everything e=
lse should use platform devices.

Alex
