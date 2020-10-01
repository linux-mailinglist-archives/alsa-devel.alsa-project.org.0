Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD42822E3
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6866418F9;
	Sat,  3 Oct 2020 11:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6866418F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601716120;
	bh=TRHsbEJG3yBFC7ahOGE75VoJIVqFKlarGjJ/jrVnqJ0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tSqthpyw3dQOWHFrzxcBpUuw/8LDCmmzL5bT5F/6Tk2Gof4vtcXgurE/D41cYQrrz
	 Y5dvVWDwbb9+F2ez4cc6IOYm1nPpncgRaWNdRvg427inRKQJMcrexmq8FKyjgo2ZBt
	 pdXymzbJ3MRPv6Et9XeTbM4nb0VZpGy8laDJzofQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 395D7F80273;
	Sat,  3 Oct 2020 11:06:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76DBFF801F5; Thu,  1 Oct 2020 17:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B701AF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 17:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B701AF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nvhI/WpZ"
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75f0dc0000>; Thu, 01 Oct 2020 23:08:12 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 15:08:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 1 Oct 2020 15:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMWkei0kPznHbta2qYTfttkG20oBq+Xzn0v3z9de7jiXQv+5gi/mfawK1eu11JDAu1Y+fsL7gWehXg+FUmU7aAfdxYTzsp3knE4EWOniT7ZIOFFPbM9R2RoWKK7b9lIKatjPa0G+J+TQoZ3WonGUqrzoQxFB/8/5jJP/VAoJp29I3Vdv4qx9M9TyiAJZMeyF7aRhB9YfD7NM4YX41JOxfyNSpdLsPQzfAmp2hEddS0jUzHmh6FOqtn8f6gYl38Nh//lrM54wiJLsxV3oSSh0v9Km+XVXX6V+FypYaSP50A0OscvyU6+ioC9fWzZfX1JSMgQyjXGHsuybTgwcKpM1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90+1aztcslFDgPuqZORuJ1g//5iqr5ezSrcTRItvaZo=;
 b=ik/NqIN3T/NGE0ijJePN9SPY7vlqdoDJbd5SFF3lCVFx+mivjoa8p7rs+NOguACAhoba8k8DhY0RNnTvvTTDZCG35rDS5Ot3RZE73h/gQ0bC69bue5f0a6Ia4YhZal1hLgpJ1GL/aKKjz5A5QoZP3wE20bt5X+ho9CWKAjBCuYLgs8VdBa9a/teICkGXX6VsRNRB5+LIn8fRTNP7Dt6tZUS72Zwi0Kxp7JZ18L09J4730w+oqW+5iclT35PD7f+Bmcxtop0t2VTSvaTiY6tMSdUSNfb6eYcBD0E3wFQuyfextOoJDUbkH502bAmVasiv3Zp7y6/CFGMauxvqO6BxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Thu, 1 Oct
 2020 15:08:10 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105%6]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 15:08:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jason Gunthorpe
 <jgg@nvidia.com>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3xKvomHiYgkD0WKJ7Q9Ugi47amChbyAgAAPJICAAB6eAIAAAc0AgAAXnJA=
Date: Thu, 1 Oct 2020 15:08:09 +0000
Message-ID: <BY5PR12MB4322954209FEBFDE26902A50DC300@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <8f34ae733db0447d93736f4f3f7524f9@intel.com>
 <20201001105925.GA1939744@kroah.com> <20201001124900.GA816047@nvidia.com>
 <20201001125526.GA2378679@kroah.com>
In-Reply-To: <20201001125526.GA2378679@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [122.172.151.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90580905-5873-40ed-dc98-08d8661bcf54
x-ms-traffictypediagnostic: BY5PR12MB4952:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4952D390783C354A6FA0599BDC300@BY5PR12MB4952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vm+TA1XrUT8wWtNMhdAX27IgIzdN/bFGs9DQXoCpmNFQ5rfhnW+Z3od/ZvqiKVjGGO0kV161odPb6QEuOC9WAoJ0vPxaAzROuiYk8j7fwrD1pmaFUsi5J+3El/5dzirJ3dscQsxAZ/a6el5Datuauna1IDi5919GkTc0YjPSxw9ezOPvuqz1vMM8mCuk+/8SPa4rUTMKibkiAg4KMOXosCUrRzXX6HQmoUv8kPXRro7Fw4uhhQYCR8k414PBzHnSK5nr2Cf/OeiYcc0CaiRnkNOeuv//+h7e9v/kMTWDnEIzV9L9y5GYjYJpA/KLumINKHInqmotLtnO+s7zDRD1imUgvXC1XbpDow2rQU4VJe8QygaR8AW7PpNoyUEfdftJpZOAPxOpGKvAsSBz5sLBW2uc/LHKWs2ONAsTEBZ32vMgYDAo5+3+vy8ROpqEfxDhOxiPSYvVyt7KTS8lYGbRhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(110136005)(55236004)(6506007)(26005)(54906003)(8936002)(86362001)(33656002)(478600001)(83080400001)(7696005)(83380400001)(2906002)(6636002)(4326008)(316002)(71200400001)(52536014)(186003)(55016002)(66556008)(66446008)(8676002)(76116006)(9686003)(66476007)(5660300002)(66946007)(64756008)(966005)(6606295002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KXPdZJitU/ceb0KROApWQJGF4jU1lstX0WK/qE59LvJP1UEIYtlemvz+uA9RABWLUeVZx+U5dZE7z5qJPqjb5UeJJJ/pW4+tSxCw/pBZtpazapK3zCHCTWKKRZ282GjyvkyMmabWxmAr6qR2Kzjn3GMVHCG9lyKXjEgMS8EFONk2PiZE9xolZxNcj7zyxUGzcWfnMW1KT9ZSam8MHu8ceRTNFYQrvUiOMZThAAXRyG93bQgcjjD/8k5jofAEW+CG2cNPgfSDzOkz2HCgB+qB8y5h90kHh0jHet5pZxF/x7I4OGgaeihQL/K+buCUIjBsKDfI4AD538Q6aMGGSb8uXW1HAh2TPM76e7as0v4MBKVu39VWYD8mutSA4ltVcApq5AclgQ8BF8ovjeW3AY3nAmivuvbDiaSQmzty952kEpY0r9iDyJ684q5vLeKMQe4fco0q6bpwdIw4mvPVs3OVNNHCQjNlMe8yFORq92FwBt/eVrZ/l2V//GBTgZqmw8zvhrK5Xvg7IjCAuiFTfFBEN67Zqh7RaxgLuso2kOLGtwUDBMilQHT5L8xF5yP1vrIFrwxSkQM8riP3BaUxVslrKzCLAYq6HoMMin6E9n5TZbedimlLXjyTm63PXf83RThEptaC3kbCdBqPsVZfK+g13Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90580905-5873-40ed-dc98-08d8661bcf54
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 15:08:09.9917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6Ct0mOq6IhbA9hhk7UfwCLOHI7KqnPngPIZNxy/DuBjLENWCjgORpbD2SiEOkE0ekv3N+Yx2qMz/o6MCV/UJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601564892; bh=90+1aztcslFDgPuqZORuJ1g//5iqr5ezSrcTRItvaZo=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:Content-Type:
 Content-Transfer-Encoding:MIME-Version:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=nvhI/WpZ/tJFx5QfPavqNQQ3IgNrSkOQZVZhMQUPwp6+zUYz9ZLcarjJKFfvnnrbf
 c7kU1NDM581Tx70tib3JG/CexSyHPZ54Xm4mFpJcbiJk+DJAr8LuUi5qrCkYsxvMcC
 FPyECFi34uWoxo5kWqV5+qJbulrFIGxBhrLjbo4Kfbdirw6F/p88ToAfnTFsh4B+Yj
 WJQ01j7IcFSyDPOr0k47bclcjXMBl/uCwVT3IrGsPGZ/5a/e9wXWf6WPkMRBHWUeOU
 OJLRLwuDKtxvYjpPiBGEZjXppOgmAMp/AxL+Wmzsg/ujWh5xz0X27QWPmw3rh6os9f
 Zr+VFzblwidrQ==
X-Mailman-Approved-At: Sat, 03 Oct 2020 11:06:14 +0200
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan, 
 Ranjani" <ranjani.sridharan@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "Ertman,
 David M" <david.m.ertman@intel.com>
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

> From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> Sent: Thursday, October 1, 2020 6:25 PM
>=20
> On Thu, Oct 01, 2020 at 09:49:00AM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2020 at 12:59:25PM +0200, gregkh@linuxfoundation.org
> wrote:
> > > We don't add infrastructure without users.  And the normal rule of
> > > thumb of "if we have 3 users, then it is a semi-sane api" really appl=
ies
> here.
> >
> > Based on recent discussions I'm expecting:
> >  - Intel SOF
> >  - New Intel RDMA driver
> >  - mlx5 RDMA driver conversion
> >  - mlx4 RDMA driver conversion
> >  - mlx5 subdevice feature for netdev
> >  - Intel IDXD vfio-mdev
> >  - Habana Labs Gaudi netdev driver
> >
> > Will use this in the short term.
> >
> > I would like, but don't expect too see, the other RDMA RoCE drivers
> > converted - cxgb3/4, i40iw, hns, ocrdma, and qedr. It solves an
> > annoying module loading problem we have.
> >
> > We've seen the New Intel RDMA driver many months ago, if patch 1 is
> > going to stay the same we should post some of the mlx items next week.
> >
> > It is hard to co-ordinate all of this already, having some general
> > agreement that there is nothing fundamentally objectionable about
> > ancillary bus will help alot.
>=20
> I agree, but with just one user (in a very odd way I do have to say, more=
 on
> that on the review of that specific patch), it's hard to judge if this is=
 useful are
> not, right?
>=20

As Jason mentioned above, mlx5 subdevice feature, I like to provide more co=
ntext before posting the patches.

I have rebased and tested mlx5 subfunction devices for netdev to use ancill=
ary device as per the RFC posted at [1].
These subdevices are created dynamically on user request. Typically then ar=
e in range of hundreds.
Please grep for virtbus to see its intended use in [1].

To refresh the memory, before working on the RFC [1], mlx5 subfunction use =
is also discussed further with Greg at [2].
Recently I further discussed ancillary bus (virtbus) intended use for mlx5 =
subfunction with netdev community at [3] and summarized in [4] , jump to la=
st slide 22.

mlx5 series is bit long and waiting for mainly ancillary bus to be availabl=
e apart from some internal reviews to finish.

[1] https://lore.kernel.org/netdev/20200519092258.GF4655@nanopsycho/
[2] https://patchwork.kernel.org/patch/11280547/#23056985
[3] https://netdevconf.info/0x14/pub/papers/45/0x14-paper45-talk-paper.pdf
[4] https://netdevconf.info/0x14/pub/slides/45/sf_mgmt_using_devlink_netdev=
conf_0x14.pdf

> So, what happened to at least the Intel SOF driver usage?  That was the
> original user of this bus (before it was renamed), surely that patchset s=
hould
> be floating around somewhere in Intel, right?
>=20
> thanks,
>=20
> greg k-h
