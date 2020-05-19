Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16C1D94F3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F015F1716;
	Tue, 19 May 2020 13:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F015F1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589886716;
	bh=QJDezwTdATk108/9JMPYE2BqZ9gkPmKGxudSFQSSkPY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nTnkBrIbNcB/ldxAInRybld+xBOqlyLbExe1VBJ3PLsDv5viayzUPFAdFtajF0b02
	 QJOMDUS37ddNjhTbIWf92EQ2PBtXgHnnKIMUP/XM2o8mHH//9HzO+8NheFTK7vxzZV
	 G1JklNYUy7IH4OCAr30ivlwueFT+nTawuB3EK4p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B7BF801F8;
	Tue, 19 May 2020 13:10:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F077F801A3; Tue, 19 May 2020 13:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BA67F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA67F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="tnV/QR3R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RerZyvxrnK82X/chsiZRdYr6bsHJecBy3g5K/hb4bhQivSOg1yYZ3sNbGxbL65gOCNsVeTYv4wMffMvAxR4F3J/x2hLSdkBEE3Shk2UTCA4r4a5JUD71N6C6t/DRqpQYo0MpPHRgnb7Y6lag06mYE1VvaOLi0SbJs4HI6UEg334X5Tg/n3Vyzw/RAExLF/KdXadM2s98tKkMNMhcPtaJECWsYyJNNO2nCxRtm/bR+hAdg5uKH4XfHdbQ3rM5t1zyiSsLGslLmL3sFXoZGwGOZVFwdE7sNHv0ZSbRgNclS5ll7hhSHDhFqVqgm6PF6MFyZwL+Bx/BT+P5fImF8TvKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXq1B0KxrI4pdHJvm1+nDc9o58bFUWqUNpGSYzWiLII=;
 b=kGgmNDkVqaMUlqMB5J+XILgIGkjMkYY3GyLclDqP8oyAOLFi4XA7N/SQxi4ASJun1+w5uwDM+QDw09CDCWUnt2lNN7jzo3flo6++GZTfif2YLK5Kueg2yjUvmXbXlUYfuM2IbE7drG5sDOPDzMCtGYVN8fpSjhfYqoos8qdLwKeroNMj5JqA7N7p0Kq0OW7IXk8XFm6AsBI96PpvJSRQuCiFwBzZ9fXme73ve/cpNwWAfIKNOBh25Hl/bHlSeKTGJZvaOat084t8B/M0zqm3OT2x8y19ZFR2iI+YNHkbXBYlSmmrQ3b+DiaB0BGwIEN2FME0q++nRVJRj+X1EzIFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXq1B0KxrI4pdHJvm1+nDc9o58bFUWqUNpGSYzWiLII=;
 b=tnV/QR3RC4+ErJ58w96LmOFxXIYVZUn3NFsuxXhOeJkc1RPCyOlD7ZjerfQGWNoLf+YWAaeCXDfyBKGgFimnWpEJIGo0e0ErNZGcF4g2QE+GDU5h7ZrOCS6PDG+LC69PYUAr7qfvrBxOZhrXZmUEFpQv1RgpOSKq0ABuWFL3o3o=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4011.namprd12.prod.outlook.com (2603:10b6:5:1c5::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.27; Tue, 19 May 2020 11:10:00 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 11:10:00 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 05/14] ASoC: amd: add ACP3x PDM platform driver
Thread-Topic: [PATCH v3 05/14] ASoC: amd: add ACP3x PDM platform driver
Thread-Index: AQHWLTgyQxPCOAim/EGy5OQCT+WGMaivPVIAgAACvmA=
Date: Tue, 19 May 2020 11:10:00 +0000
Message-ID: <DM6PR12MB26335F2ABFBE88629334FD9A97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-6-Vijendar.Mukunda@amd.com>
 <20200519105434.GC4611@sirena.org.uk>
In-Reply-To: <20200519105434.GC4611@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-19T11:09:58Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=390eb4d2-4d3a-4dba-989a-00004ba04003;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-19T11:09:58Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 9fed69cf-70c0-474e-88e4-0000d73702fe
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 867b66dd-b6c7-4fdc-84b0-08d7fbe52c3f
x-ms-traffictypediagnostic: DM6PR12MB4011:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4011986431B4109BC37F17BE97B90@DM6PR12MB4011.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ThdqieuYp2XI8IbMZlAs5NsJ6VgQc7xmsPe3ZmqAR7N5BOEve79YjisE3nJTUB8oEn/Pokn3UcfbYFGMmJfJ4ZqTNwRRStjwFF+P39kk2R/XC2sm65Ry+AyyIIEGgnXb7+rnltpCY1JyTrqO4GGlepc0uzVYHP4HfTsez+yEPNJDwOHzqee1y8b4iCw4Yz3zULsBGOoji6jyp7B6Lc03qbOPGBs3ziY96MjmZPsT5Xq9U+05ML/q0+CtlDrKuODHWlLWm1Z1T+HiQ9MO30L0299LroFia48z11A2+Ynb+UJthB3OlGufDvo7quIZckgX3SV0+6UbaYTqkui1Sd85JoXgaEmC1kFHbz+zotxeAdGHhRC7V2Qg+UXgem7fEXNGOdVy+QMZCTvDK8MXaCL/H6aURi7Pdu7uxf34WW8OUFIsdG7ibAr8BEWpkBmiA8QBJX1SQfbM3wo1ADdSQVUD0Es3UoghkhX8JwttdK7Pps=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(33656002)(54906003)(9686003)(316002)(8676002)(66446008)(66556008)(4744005)(52536014)(76116006)(8936002)(66476007)(66946007)(64756008)(7696005)(186003)(478600001)(6916009)(71200400001)(55016002)(26005)(5660300002)(86362001)(4326008)(53546011)(2906002)(6506007)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: qbdTkPTsoMphkD3I7AFgXipzPkgicA9JAMTAvehXY/PWupy9jDpnUh+s+rHStl/1mBNQnLhPT96dXsd7+CgmrlrF1hj+Xv6YRZe5kxm/GqZD4p9xWq4sQmg4/IgeYGvopk6qym0p7ef4Q7nus5t7CBTpOSspDwCebd1nTyOpdF9SedxoIXZht1sr/m97Vpg7+J58nZtXxn0l28gX3bzQjW1FHK0dcLcJfUdYO4cUamUP6TR2MbU7CtyEpWq66FtKZ+Ble9wUS+TyUu2zIufzaJ1XIxlmrkUc7eHW/r9R0rVdJjSt8gnKH6tHXWJhOo7+HeipV9SXkUlUKDY5KBy9U2mcdeQBq2WbuXHVpLcuj3Gli8pfFslaYVI4kP8VhVgKCYYPPH20tgwxpIIX71416BsdlJVR8/QxXJIVfOb66cUyv1MrfpTwiCSpWfmqa3uG/V/Pt597/+XEDXNy5KQyG4+ZBXNKCMWIjC3yDlbe8sGzp77mDOJwGVesUmHQkw7j
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867b66dd-b6c7-4fdc-84b0-08d7fbe52c3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 11:10:00.3258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfwmpt50vJ6zxvZMUs9V2pe6G6GlfIhZuIWvmPiLZ3LSlABZl0OtmrNojcAgLEockuda6g2/D070LOE9ZBJIAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4011
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
> Sent: Tuesday, May 19, 2020 4:25 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v3 05/14] ASoC: amd: add ACP3x PDM platform driver
>=20
> On Tue, May 19, 2020 at 01:16:55AM +0800, Vijendar Mukunda wrote:
>=20
> > +static int acp_pdm_audio_remove(struct platform_device *pdev)
> > +{
> > +	return 0;
> > +}
>
> This is empty so can be removed.

It gets filled in future patch.
Below is the patch reference.
[PATCH v3 10/14] ASoC: amd: add ACP PDM DMA driver pm ops
