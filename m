Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E447B28280D
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 04:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28BB418C7;
	Sun,  4 Oct 2020 04:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28BB418C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601778536;
	bh=BbTE1ETohLKkOuQ/oGjusL6XIeKqdzRWG57IsyP1syY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqjKf17dgO89gCcWF0IabRUAJT1lcKNmaHUbTnkMRpVn4hFetdG2xNazK4qAcgE4y
	 7B0OAefcJVQTL5C8Qp/gkCXmy6rtadnEQ4E6Yae8dxkPuRuVjR6eWkTAJ6zBCYPW5v
	 U41d5l17MTFnHWZyQmsAc6wwDJ7LV4XzuiCEeRos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15168F80121;
	Sun,  4 Oct 2020 04:27:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A3EF80246; Sun,  4 Oct 2020 04:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DB9CF80121
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 04:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB9CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="dvam5LfG"
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7932f20000>; Sun, 04 Oct 2020 10:26:58 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 4 Oct
 2020 02:26:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sun, 4 Oct 2020 02:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5c7Jj0/FZLzlWaw7qx7ngLyhLQ4P4HrFkWepSDM9v8aF/zi3MUtrkt7asqGSElL7OTXZfgA+BqVBIIob44emQhgrHZ6ZVVYzbOiZC3I+A0ns1xfnuMoEwAb5SutMAWadrWQXiLnZJnKPbt7KE9HXinVjHtI55IWp17aBNINkVw5Y93Dx7IEQnsL6O8He791NINo1H4+BsCSIrPjMP2j4M/uhdK0mfDPk57uz6saP88hkRgzr1RcbFxYVwx7k3qPkWCIZ127zMzZSgazf6UfwFnz4kqmQg0pJ94higHCZ+ddAAQqtmjXwxU6/nKIyiuf/2lDgbiiTgHfvT9gN1cO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/b+3rPBc93Lv6CNi7HiFoewInUP/ViEWogHUML32LI=;
 b=Tm90ZypgVHAK/tiNsFX1K8rC7oOfXzSRkvBucBhs93dNq/Wx9URriMpCW9/3Tw2ahxXyb2d7MeKecSKiqx+w2cAKGC91Lb7mNmZEOUO+ZRc2zn9SNOThts90z3rI2fQQiug27qUJfx5UbotixNzF/JfzmdNOXmJZUjMigSGLi93Q0F/EyAEX5ESN832rQ/AX/iSdv04L14TzpWOiJBLjVYsL4ARwVeLZXrhodY9k+EG3fTzE8GAKhsmEhYUoWeWYQPLCZDq1hiimA5mzr0t0PwiGVwsNSgTdVCNUS+cLrDMKjeNyLV35dbJg8NSFd7P1L61E8eT2dFdBYnv0DSu3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 by BYAPR12MB2997.namprd12.prod.outlook.com (2603:10b6:a03:db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Sun, 4 Oct
 2020 02:26:53 +0000
Received: from BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105]) by BY5PR12MB4322.namprd12.prod.outlook.com
 ([fe80::3c25:6e4c:d506:6105%6]) with mapi id 15.20.3433.040; Sun, 4 Oct 2020
 02:26:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Ertman, David M"
 <david.m.ertman@intel.com>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3xKvomHiYgkD0WKJ7Q9Ugi47amCVemAgAJu/YCAANXFgIABIMYg
Date: Sun, 4 Oct 2020 02:26:53 +0000
Message-ID: <BY5PR12MB4322CAB6B9A1548D96A53BFEDC0F0@BY5PR12MB4322.namprd12.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
In-Reply-To: <20201003090855.GD114893@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [122.172.151.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84edfad3-e0f6-40ae-8ecb-08d8680cf50d
x-ms-traffictypediagnostic: BYAPR12MB2997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2997C7FF767063752CEB077ADC0F0@BYAPR12MB2997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BBZjG2TZjkqtzQAJthk6vf0wngnxRhRdtzpjB6Hv0TAnCCZYTjmcQEJhbzucTogqk1IokU4bTjOEclx5StB/GkGSIogmb0R5HKkEJ2DHyIZ3X0zBUo7viHFjpCE5xKJgKcD4BdeVfpLong7p2M+3F1g1CQV3rqOTn6YKMlKDxLHMNReBYfQPtVOFbssyfTrtTxNHe1XltXYJI6GqMm7sSGzaerUDJ/p87SvDJQeCDh5ucR/Owu5WsNFR+6epcqTrOVpnSEJv+xqIi0BD5pSR4XRzIv2CuPggzKJl8/74YnOTbIUGvX00fA1bjjcF4x875TIubplTIrXY1ANlmrz9VA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4322.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(6506007)(83380400001)(7696005)(186003)(478600001)(33656002)(26005)(55236004)(5660300002)(76116006)(55016002)(54906003)(66446008)(66556008)(8676002)(66476007)(64756008)(66946007)(86362001)(316002)(71200400001)(2906002)(4326008)(8936002)(9686003)(52536014)(107886003)(53546011)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oTTvtrUMb1HrOkQ3cdiTz64yg2JENNxYm7pj4cdVVWKFRmD/4Oo3lp6jmetfgIinzWt5tsnJsIJyDsOeflV7Wunx7ZbxyIUyYnbXBrLyNkUoY3JpyEOUE/7XxnkEDfH7jSi6V62tpZ6N8Ja67GPLW8G3UuQK5SCT7Ua7BG6QJztTEoTPJc0Ikb2n0lpx7yHc58o/FTwDeoHYHVpCfYMsXvwp9+cRQwSjbYeo0JPjK5At/NlNIcx7uYu8qX1JQl87JnRc7MYEZjJmeI9zTkCYnzy02W9J6Vjr6K/oPQOpjE9wOpw0DKN/WmmTjN/OAtIVCKy7PlcYqZfzq0gZ+eXT7+zZfwdHFnRs7x9McC14TEfE6ZJw4LkfRwZRx2Yma0bok2Y9Zlc8SM3FaKdgTxUW2sxNF5aiDZPVAzvzVIRFZWWCdVfHqydtzGqD3rMZNtoLkRkZm8EO2O71Y8K4gX+JabO4hLSmFkQydiK87Sk04/LLNwKLdANo2tJrimtbW28b4nMOEk+pY7f2JDUVgtznnwEC9AbUs+L44rf3ixVbTvKaGRNer4l1eotUYFFFTo32C70Y3l644N5LagTgClfMkev3kjQ6zDMQarqWgym266k/RgrcOO8jDL/zyv2EALLF4zBxKvbPu5ZD3kUrQbWmeA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84edfad3-e0f6-40ae-8ecb-08d8680cf50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2020 02:26:53.1694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3bBpxOGPAfKvnfUoW7sF/BY9XrQItjbWRkcBVvgX5vA4vSxIJlU7KvVeSuksuns4cPdq6LUtOYv8mkkKOUZlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2997
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601778419; bh=m/b+3rPBc93Lv6CNi7HiFoewInUP/ViEWogHUML32LI=;
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
 b=dvam5LfG99RymHm+XN5MNMk/JAil5LoZmY1b1u23mg7m60vcIAesyzgZJzZro/16h
 6vmeg6usoQfbpCh4dgc5appPYVZvPhajHSlev1m8EmBpIVsJLTbNx0+pG9fotVk1Ir
 vngYghOiUAFfi0N1LMdGFWk+JDVDhblSB+63BVc6F6c6DEw3+8rO0IJu2lnX0il/Zy
 PWMLnCbk2IBONdnP5AwDZa8i586tvKHtMwmOOHlQJ79aGWKB5IR2QbXoHj0Gz/GUq/
 3ZGAsa2POSLVMUT3+gr6Hv0s2vb9YAsvkFM6JWLmb1prMFqPUdz8EmrknO/pwr7p2Y
 W/UzKT2y0S0dg==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
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



> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Saturday, October 3, 2020 2:39 PM
>=20
> On Fri, Oct 02, 2020 at 08:23:49PM +0000, Ertman, David M wrote:
> > > -----Original Message-----
> > > From: Greg KH <gregkh@linuxfoundation.org>
> > > Sent: Thursday, October 1, 2020 12:14 AM
> > > To: Ertman, David M <david.m.ertman@intel.com>
> > > Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org;
> > > pierre- louis.bossart@linux.intel.com; Sridharan, Ranjani
> > > <ranjani.sridharan@intel.com>; jgg@nvidia.com; parav@nvidia.com
> > > Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF
> > > multi-client support
> > >
> > > On Wed, Sep 30, 2020 at 03:50:45PM -0700, Dave Ertman wrote:
> > > > The ancillary bus (then known as virtual bus) was originally
> > > > submitted along with implementation code for the ice driver and
> > > > irdma drive, causing the complication of also having dependencies i=
n the
> rdma tree.
> > > > This new submission is utilizing an ancillary bus consumer in only
> > > > the sound driver tree to create the initial implementation and a
> > > > single user.
> > >
> > > So this will not work for the ice driver and/or irdma drivers?  It
> > > would be great to see how they work for this as well as getting
> > > those maintainers to review and sign off on this implementation as we=
ll.
> > > Don't ignore those developers, that's a bit "odd", don't you think?
> > >
> > > To drop them from the review process is actually kind of rude, what
> > > happens if this gets merged without their input?
> > >
> > > And the name, why was it changed and what does it mean?  For
> > > non-native english speakers this is going to be rough, given that I
> > > as a native english speaker had to go look up the word in a
> > > dictionary to fully understand what you are trying to do with that na=
me.
> >
> > Through our internal review process, objections were raised on naming
> > the new bus virtual bus. The main objection was that virtual bus was
> > too close to virtio, virtchnl, etc., that /sys/bus/virtual would be
> > confused with /sys/bus/virtio, and there is just a lot of 'virt' stuff =
in the kernel
> already.
>=20
> We already have a virtual bus/location in the driver model today, has tha=
t
> confused anyone?  I see this as an extension of that logic and ideally, t=
hose
> users will be moved over to this interface over time as well.
>=20
> > Several names were suggested (like peer bus, which was shot down
> > because in parts on the English speaking world the peerage means
> > nobility), finally "ancillary bus" was arrived at by consensus of not h=
ating it.
>=20
> "not hating it", while sometimes is a good thing, for something that I am=
 going
> to have to tell everyone to go use, I would like to at least "like it".  =
And right now
> I don't like it...
>=20
> I think we should go back to "virtual" for now, or, if the people who did=
n't like it
> on your "internal" reviews wish to participate here and defend their choi=
ce, I
> would be glad to listen to that reasoning.
>=20
Like Greg and Leon, I was no exception to look up dictionary to understand =
the meaning on my first review.
But I don't have strong opinion.

Since intended use of the bus is to create sub devices, either for matching=
 service purpose or for actual subdevice usage,

How about naming the bus, 'subdev_bus'?


