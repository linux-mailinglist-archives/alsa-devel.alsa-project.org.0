Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A191DF369
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 02:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28B9B18A5;
	Sat, 23 May 2020 02:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28B9B18A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590192807;
	bh=kfYckxMA15n8mluTlp+4f2702wFKV8rRdRcv9Apn1Iw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBqp8if0ID0VflnDUAciMv9phhMkKLe7xoCe1REWWNceJQND/OASl8cwbrrMH6EYF
	 KhqZsG7SId0WCx+aAwrMY6J3SVdP8oEpF1b9yWePdKuzm+D2nB1TkMkTgcJXKO4sfB
	 RTxHS0Hr5ClM7ojm/0CDfyu8Q7QJ+cu2SSjB86Vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C0A2F80140;
	Sat, 23 May 2020 02:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 671B2F801F9; Sat, 23 May 2020 02:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5A5DF80140
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 02:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5A5DF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="R53pp1WT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkL4FwEKls8QUqIWYx4W3qcdSwu6n6+iQerBE2Bd27STB0LC6gTwIB8MqsVbJaw5sYMk2W5dPgtkz8xnUMqLa/rpDMb8BnM6pfMp0g0Xe/zlgODCUPnnEAUqrN/80AM5zbnaIRTJkOSWgYdxIorUIiJhdv049uTt/L2LzTt+XVGH7oF6yqbVrgZOi4/2FFPwUzuMEpUDhFUgw+a1uSkpyVM5AV2DmIGVrW3eKH4x6q/+H6cPx8NRkdCourb0oIYGc8A9dqi2NXmkbeqnPHcnE3iQMKh9bSArQRJsYbvHGkybzea3CV+nFS/c+Xm+TP+4k/1eIofML/AR9AJj0Ashrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xOOmcSWoz1qErxKBvUeMy6NClswJ8kcMY4q8LRwvnM=;
 b=M4cQWafVfQ3S/wg1cpP9k/G0Etej9UvQdyG9hut5qLY8llfYMtGt4jSaL8oLWZxwrJuLNqfFNCTVGWb377V9pvos9SVw5BZ7oS0/EBOdOZTTgKLttjQmNVuy0a6K7+pFIZW3TpYGxN8RjSvU8XTcxSKmjGW43nRT3oqDZj6pk76oMIKy5b5uy8738nz1Lrav7VCpbpzxNl7/gJKlodCGF4meA3WMXcuMtZKBr5DR/lN2GccIAtvgPr+mO89K2R+cA//np6L7wsG8YXbt4CLESZJ05gleNl1dODQ8WdrkS3yVrbGZdiH6emGrsN6YyOLofTmYn/X1ZMBCRp8R936z9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xOOmcSWoz1qErxKBvUeMy6NClswJ8kcMY4q8LRwvnM=;
 b=R53pp1WTQD2ZxNXMAwz7t4fJp9rn7FvUrd2ub7jDSTlwnS5QZEQf5z3mYDrJIQSYB74CQSqlrU+SJJgysddHUe+isl82qWVOW9YBMZZa+EjhgOZ0nqHD9FvadGDTHCA9H9MWHfImMgHJSH/ELQA+OwWH5WPS5fFnL2HqUlhdFic=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB2857.namprd12.prod.outlook.com (2603:10b6:5:184::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24; Sat, 23 May 2020 00:11:24 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Sat, 23 May 2020
 00:11:23 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Topic: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Index: AQHWMBGAxjoSFfw9qEKCikUbd/uKQqiz8myAgAAAyuCAAAM0AIAAADWggAAa/ACAABASgIAABwTggAAKD9CAAAl/gIAAeClw
Date: Sat, 23 May 2020 00:11:23 +0000
Message-ID: <DM6PR12MB263317584234E31A4937199197B50@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522112228.GD5801@sirena.org.uk>
 <DM6PR12MB26337FD48A99D14814EB32F097B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <2285006c-388c-810f-c1ac-ef76ab2319bb@canonical.com>
 <0acc99c4-6fe0-b613-4af2-5439ecd8981b@canonical.com>
 <DM6PR12MB26335DA69D595C332A20779697B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <DM6PR12MB2633FECD2F752EFE8DD4A6AA97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522153225.GM5801@sirena.org.uk>
In-Reply-To: <20200522153225.GM5801@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-22T22:42:35Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=d3895e99-7205-4ab8-beb4-000025544187;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-23T00:11:20Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 8b56b42c-a678-4fc7-9455-0000cac1c694
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c66646a-109c-455e-9f49-08d7feadd43d
x-ms-traffictypediagnostic: DM6PR12MB2857:
x-microsoft-antispam-prvs: <DM6PR12MB28576B701F58CEAC45783BB797B50@DM6PR12MB2857.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0412A98A59
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miLC9uSdJZGXeP+ars7ADDOtT8WNtDBasWNGoAAdrMxsNKla0gwnF3ecZYaSMRYztvuodq/HPaj525m5F4bNTiTxHeQIdpBow2eDsANxGfMqP8nMHqfwKL+gCjimRSf32Q1vAVW6Gkauvv2PuXyc0yxVaB7J1C1Mu0qVDha+TW2ceB5NKcDifjabOpxzAKUmx24L9UuKz2IxINtTe9IuAbaHAzbPv7He4thCGhCqeomxSKzEYy9Xmxb7vdFiyRrEZDoJmIc0c+uJnBuO+u0cv9hjOl6SbPMH/u+rFkc9CfjrUacwrHwOF6xOwQ1NNTXrus5Z62xvZNs6K5qCipNbjA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(6506007)(71200400001)(53546011)(26005)(54906003)(5660300002)(186003)(7696005)(316002)(2906002)(478600001)(66946007)(66446008)(4326008)(66476007)(76116006)(66556008)(8936002)(8676002)(86362001)(52536014)(33656002)(9686003)(55016002)(64756008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: kH0XLgX0yxHvzMNK4C21WNWWnxcGKYhDrdMK1lueE874MHGF2QTTTH33cWOAvtCPUDgv9v4pme1w9kEE/8xrkStiPnp+n+rEtq4T7N8sPm1bCIqXDcmQhtZl7dvVOJSR2t77nqSGQfXymfSeq6F2TR8Xc6VSnL5Arn7CYGdUHlEMiowslP2AbUEIq0O8MDrHm5v87UFtuTfJW9KmB+qOldtw3ZwonBLjnOMnIqINsmODCHccvoqet8taEjG02SxiU7igvPfxFkEibQbSh6406FGFFTBcqEQ3Kk/ofn9feIJW/aBtOuQddWRbAwZucXbGRCcPboYnElaVtVf0MdFF9WxeYSliLjFXsrJPtoEiwNkSoyePblDjV7uI9pLzoXMTiYsXnfs5TNogrsj2HSbuGDRryMDr+M3ERH27H47eVicjg3+5q85rGRi1IsSvdvM8tc7hk7fsC2ILHJe7DoDH0Q+jETsWgY9Pv7UQe+qKn7vbjwDiLIGnB9bN2Kk34Y80
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c66646a-109c-455e-9f49-08d7feadd43d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2020 00:11:23.8001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHZRljxv25VZpqmkWjVBFcjShtOs507H4ehUpVNEOLkp1s4Ae7XUWZfEYFkHbBXvSCSp9ucc3kNSUY9oJvF08g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2857
Cc: Hui Wang <hui.wang@canonical.com>,
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, May 22, 2020 9:02 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: Hui Wang <hui.wang@canonical.com>; alsa-devel@alsa-project.org
> Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev =
to
> avoid -517 err
>=20
> On Fri, May 22, 2020 at 03:14:21PM +0000, Mukunda, Vijendar wrote:
>=20
> > I have seen sample implementation of deferred probe in one of the machi=
ne
> > driver code using late_initcall() API.
> > Not sure how this api really works which will resolve the modules loadi=
ng
> sequence
> > issue.
>=20
> What deferred probe does is keep a list of devices that failed to bind
> with a deferred probe error code then every time a device does manage to
> bind it retries all those failed devices in case the new device provides
> whatever was missing from one of the others.  It's a bit brute force and
> ignorance but it does sort things out in the end if all the drivers are
> actually there and just loaded in the wrong order.

We see one more problem with this patch.
We are going to add support for I2S endpoint on another
platform based on Renoir.

Platform device creation logic going to be expanded in ACP PCI
driver probe call.
Because ACP Is Parent device , Ideally platform devices creation logic
should be handled in ACP PCI driver.

Based on Audio configuration, During ACP PCI driver probe call,=20
platform devices will be created.

In case of I2S endpoint support,  machine driver gets probed via acpi dev i=
d match.
If we go ahead with this patch, We have to expand the work around logic
by adding extra check in PDM DMA driver  which doesn't seems to be good.

Currently I observed only two times sound card registration failure in dmes=
g=20
during boot time.
For the sake of avoiding  few card registration failure logs observed in dm=
esg,=20
I don't think at this stage, we really need to go ahead with this patch.







