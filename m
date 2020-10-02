Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5B0281923
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 19:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079441F2F;
	Fri,  2 Oct 2020 19:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079441F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601659558;
	bh=Sore8obAcLodK+91g4cPRmZDN5uxiMRybnTROpqHJGo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgxlmdgLRQWoyWqtSvYQFNCiiA39s7vG6KbdGmbUC65x40PfuVBUEUot8a4v19gJy
	 /RlwkjUU+JwV45+fflU8mbDXwsGy0TJgqjuZBUNIAK5JJP6NmfPonzivkYp9WE75Ns
	 MVcTj0MgyhGKMUO7OzQqM1bMPeMZq1gU2HmrmX2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 276FEF80228;
	Fri,  2 Oct 2020 19:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35BE5F801F9; Fri,  2 Oct 2020 19:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47CD5F800E5
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 19:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CD5F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="WMqke7+6"
IronPort-SDR: f9aBAG+B9Wpsr2pvZzMGKDicM9mSVkxDoWwjvQiUxMQFOrU6bBGnfKD7zlJ2GtuUMbzWVieJtH
 Ulj2apVw7GYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="142428322"
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="142428322"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 10:23:57 -0700
IronPort-SDR: 7EaQ5QWTYMI8REL8JvumR9z355/CoHOD1Ebn5e6p+VWYHcUYehSBOSieJrQyQ0yFAquEYcCi5G
 pjcviedwPWZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="294900192"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 02 Oct 2020 10:23:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 2 Oct 2020 10:23:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 2 Oct 2020 10:23:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 2 Oct 2020 10:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+bS5YsSlxVm6zL84hRlJ2JFs4NrFGrE81P2cFDP/8hHwYFggimDb5r7zZC2DZvQtD0Tbjkx7nMiMP+Lg0fxnBQLgVS8ZnLF+67GoV78Pc8zBuUuiUyJ7c2HN5LyNcBscA4XiDUUoxxYvxdI/iFJm4ITrsgDO+eYh/0/6wwOMo2Tw8I1xe0tKWg21LZkt9+/SGdiCWP8kwqRJ72x3/gzBmKB8YrXUTrSDRun+TyigoiR6tvpx3YfUlDnxynqq4mfsqES28UlmwNhXR/a/q0p9hM8U+buf9MZzWv1LKidra2ifaU8gqyTUYdItGHjfXnrIlae4x9w85sPH3Hn3FCoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYS3+XdtelF+2pbjOa8pY2OF78T6nHRaCySrwRUTeYE=;
 b=MgoIAJLtiYpE8Cqbv70i4rCBJ4qzd6eQ9BsawXFUdA+6lq5fRIYKmUKUFSz6A2uMkRGRfAov25SYqr04xpauIZnNiZlTZqVCqc2rjcs4NiO23sVEPXFkn1M1xyCrEWXO8WKzx16QNgVzJWN/HshBSQ5yWmsQT6A+8MrJyprQ1KTV1KBmk60elRW10WTBoMoAbvDynaO16gx30FvwBblkTDXnsPK1ajQXIwtfMvsGnNy2XXY7wTCIhM62qmQZdlROivRKRT35MQC8BU0sOcNyzjD863OLOfij9uceB6Lk8wcAJvQfZ/h0eQRQPYnq44NKM08zgGB/9/sRikd5j6S4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYS3+XdtelF+2pbjOa8pY2OF78T6nHRaCySrwRUTeYE=;
 b=WMqke7+6zXXhXzjdGxrvgtrU6x9RWBd1yWiMRHkTcKFpPcVZIi+dR+Y5A8CvkGOkxCdE7PxuKZqHIwPuNim0y5/HWxwkPQa4q1x7a7Uu91ZCbVU08c62+kT/xnPHeHblcJAzHrU2+F6F3kiISlezrvNwdeIvbfFJsNVtJA2lT+A=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB2940.namprd11.prod.outlook.com (2603:10b6:5:6a::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.35; Fri, 2 Oct 2020 17:23:53 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 17:23:53 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Mark Brown <broonie@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCs/MAgAAGNgCAABhvgIAADnmAgAAItACAACUyAIAAAllAgAAUqwCAAALEcIAACAAAgABLigCAALCKAIAAZRyA
Date: Fri, 2 Oct 2020 17:23:53 +0000
Message-ID: <DM6PR11MB28417402C0F65B993C6E7E8CDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk> <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk> <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
 <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001201718.GZ6715@sirena.org.uk> <20201002004740.GF816047@nvidia.com>
 <20201002111932.GA5527@sirena.org.uk>
In-Reply-To: <20201002111932.GA5527@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2aaa6e3-47b2-40a6-14da-08d866f7ef77
x-ms-traffictypediagnostic: DM6PR11MB2940:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2940A8110513A0C78096E92DDD310@DM6PR11MB2940.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vvHby1RR3PoP1gczXWVUwagyFCYiAeFAahLyRav3xbfsNN1+u9c+aF+KIt6cjY6XXg6bHyvEotQlcNX8S7/m9/bbCkU4DcvuhvrN8OZQkkq4Xu41J99FfXI0rgljT4+JQd//Tr+ynnkc+xDHs3ZDk9qUWWyjHk28d70wbCku7+7yU/INl88LEZMQpMn92dXLmUk5M1tp1T1iMR27+6pFGmlJlrSfGio7+beIJaemTmn3V4ZukxVgiW+VOSJuuPKdPos/pd4NvwY7losdiQ/ABmtL/8cJN5x76GUumka95agP8CiXZbUkzLfQlqBmKVaIOCGgEEf21EJvEKW6/34UOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(53546011)(6506007)(52536014)(71200400001)(33656002)(83380400001)(86362001)(26005)(5660300002)(66446008)(7696005)(186003)(66556008)(110136005)(478600001)(9686003)(8676002)(66946007)(64756008)(66476007)(316002)(8936002)(4326008)(55016002)(2906002)(54906003)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZhtCfVThlXzLQ1COBtFfyRbFUJmdKUpMIzKUWHe2NNPoldqiHNBsnFoshSzuR2PUAPZVIGLj5cskRHTroXoF+IxI6CQjdDTGnvKMHfwHaTxc42zTjz9xlY9KuH0FG0mu5b82EG3tHF9K+gjxLh42W6P0L+R50Dpbpn6o4nHwgztsBjq/LnDHFQagoIHaGrCZbaLJWfw5FSwddkMkXUz3YL1zVTynUPltLQ2M92qm020K9lccCRdeXunGEeAi244aL64QsjI/dGwMZ+aTmabknHdtlOG0QY/EtBCWOF5+m25eBk3gVBbi/LD/z7BpMtiBe+bjoqjBXDJvrr1DWpbExmb+dlnG9eDpqFrHTe6W2/23aoWqFj/8wGvhDDPUPuJRFIyclCiR/aRKsCWHAxxT1FI5Knm/LFFHdpr2CLvrd6yFb+ckMY8A6lcylgmvTrF/st0yhErDwTScnzwD/Fru5V50oJbis7HM6kfSt1AaTgkp45yO5GXu8pFPNUl+eQM2rRtFNdWBFR+av1ta6TqTKHQi2Vo/rlcX/1xSPDGKv9eVlIkoFvJnwdEnNPSZ/zNXkRiTU2uQk/Yry3ZCdroEQ+W5FYftcoTMg9soe7DfIVZZ7PuIgsh5hymK2LJxvrNOgKrAkANdZKdpeKN+w5ErNQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aaa6e3-47b2-40a6-14da-08d866f7ef77
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 17:23:53.1790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/BaXiy9JvkZ3fKHeymNcALZbrXP0FtOmiR4t3bR7knUq/uU6tJoMcTwzaPWOLioLEnFuWAP7OAjXVGbz9rFKoYbleGwYWuIlioq4Cw/9Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2940
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>
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
> Sent: Friday, October 2, 2020 4:20 AM
> To: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Ertman, David M <david.m.ertman@intel.com>; Greg KH
> <gregkh@linuxfoundation.org>; alsa-devel@alsa-project.org;
> tiwai@suse.de; pierre-louis.bossart@linux.intel.com; Sridharan, Ranjani
> <ranjani.sridharan@intel.com>; parav@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
> On Thu, Oct 01, 2020 at 09:47:40PM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2020 at 09:17:18PM +0100, Mark Brown wrote:
>=20
> > Instead of making ancillary bus giant, it might be interesting to use
> > a library technique to avoid the code duplication you are talking
> > about, eg
>=20
> >  struct my_ancillary_data {
> >       struct ancillary_device adev;
> >       struct ancillary_resource resources;
> >  }
>=20
> > Then each user can access the facets they need.
>=20
> The way most of this stuff works already it's not a table in the device
> itself, it's an array of resources with type information.  Your second
> struct there is presumably just going to be the pointer and size
> information which you *could* split out but I'm really not sure what
> you're buying there.
>=20
> The interesting bit isn't really the data in the devices themselves,
> it's the code that allows devices to just supply a data table and have
> things mapped through to their child devices.  That isn't particularly
> complex either, but it's still worth avoiding having lots of copies of
> it.  *None* of this bus stuff is hugely complex but we still don't want
> each device with children having to open code it all when they could
> just do something data driven.

Would you recommend adding two elements to the ancillary_device like:
	void *ancillary_data;
	u32 ancildata_size;
like the platform_device uses?

-DaveE
