Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48562804F7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB85193C;
	Thu,  1 Oct 2020 19:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB85193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601572714;
	bh=umCm0f8QBEkl+HV5lsyHAD5nN34UCxqqo2OSUzkfo9E=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N6VjZ5F61raeELcE2TRa3KxoPQGC6JcNOHMm6+7fnyzVu+2RTYWGUc6qeCAvdzho6
	 ARI7tJHbC/Qs8bvK2FIeOdCFBNnbLoLwEfc2A9tCXJiPbXQ2nLY+6WMYiMCl3L7Las
	 ogpzcVpbJT5q+yu+xlOYfUXaCHLfYytHmTjz+JrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0078EF8020C;
	Thu,  1 Oct 2020 19:16:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EFD2F801F5; Thu,  1 Oct 2020 19:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2507F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2507F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="UX2IrcP5"
IronPort-SDR: 0OLdnYWvrNYnK4u9votSAepkfCtS3bDZwxfpwB0sxA/n2IIk94UyL1UhRPxVRq3v1z03am4KkX
 JYsQppScVJIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="142790534"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="142790534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 10:16:37 -0700
IronPort-SDR: x5wBcxp7mXI4yCMW3KsT+ULavRTLbkXA9OLdbtPEQG+5ERTNdLlPyBuNYV7UTB84VpSCZKMtAA
 5ujmX8IIHrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="385605385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 01 Oct 2020 10:16:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 10:16:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 10:16:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 10:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUdNJbOnISUEYfulqewnlyoovpDPETKSfgIr8QLREl+pFYxoWFafy3mRFTLmzq4VeBwwFhMg4c4fJ5WgSJ1cRaYPmmlH552d3xwrzhtqaonoJo94pT3LTnFarktPml+a/ZzpI7lW4KAhqlLH7GII9yHNwnHGZuR69bBlr3c+sfjLNgsspGKb+X8vTgbHT41l+gWfgIpduQIorOdhrHiIpLxjXJUMXxHIHD7muy3KyI8g4d+K4OBSZICNKw1gND7hb5TzxZHX1PPcRiQeZAQDVrnsoAPiOm6A+e6hcKifhJtgnpC73tVhiOWKDls5wJOvcs61ej07gaaLJa4bdE/FVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVH2j8JGtE6lSw05u5f+sqxf+fqWXuzCupbEPk1Rqb8=;
 b=MgG8k1XtLvZ8ZuFK4Jm6IHWlrbgYG0GBS35ONeWiGUPL/nnL6lfpRdehF7XIbLekvCEmKtQ4Jc7aocVe5KWOuojl3ZXOj2ZjY/CHSc6OWiMoWfIDVurMcmcbQAZQO0K8R+drONzNx7slPiB21ysN+8zTdAq//Ydn6DBzsagG1eqz/dWrkKS5gS04zrzSVqV731WGsWnIdQA/E0YLQdgQSIcJKj8MjdUSGmPuFISlHbRtFqYjiq0PPrq20WlD3K9tGK0gLpwnTG3MIkAOjUcMmYB6HfxdrdD9pb1aiGQulEM7FFmrWBh7QOqyLBRVuu4Ja/FYsQFanwvka8wfUOpW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVH2j8JGtE6lSw05u5f+sqxf+fqWXuzCupbEPk1Rqb8=;
 b=UX2IrcP5rokkKsPvqEdAM+hwCUjLGJSPE9MV2CJMP1VKzDWY4fDzkmNhYI34a/eMC8pcuafep2Xz49KZ+X9z+10T8xWpZV+T+e3JsgDpmlayC93p5k1qwl4pifgV6j0bVbhUNa7btO9yoN82q4hvLHUZgcxRroqZ/Q2z2OMOh/E=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB3884.namprd11.prod.outlook.com (2603:10b6:5:19b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 17:16:32 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 17:16:32 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCs/MAgAAVbICAAC0LEIAABhoAgAABkhA=
Date: Thu, 1 Oct 2020 17:16:32 +0000
Message-ID: <DM6PR11MB2841AE9C74C8AEB57B5D5B88DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
 <DM6PR11MB28417E157FB2144BC5C99ED2DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001171022.GS6715@sirena.org.uk>
In-Reply-To: <20201001171022.GS6715@sirena.org.uk>
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
x-ms-office365-filtering-correlation-id: 11617326-d275-43db-8bd9-08d8662dbe2d
x-ms-traffictypediagnostic: DM6PR11MB3884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3884FFE59755D0CB7CAF971FDD300@DM6PR11MB3884.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iUYtl8iX06INF+TyVRtw09epH8VqHuS+zOb2TKRRAZsJ+7uWWsVy18NWK9zRbZOEaNQLsl0rgK6ZnFto1Yv5QtqT4u/hLPI9HTTWzUT1Xeebf4gNipQ4Oytl7uzYoccAhhUDsNKZoTR3oTVOO9pOYSssrZ5O4tQwnsE/CqBeNN2bUPeN/WrsDTz2jfdMwX90av3SrtPz7f5a/s4gV/3ym268OFbVO8e7OiENQGAt9ZfJmHh6JqLeVKHVlcLfKX5fCE9gX4c+FYaXQwbOGlfcYQkVtZXTNEZNni2qC8eDmtRMKPyOgEixpEWd5glB2kYQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(55016002)(83380400001)(33656002)(186003)(54906003)(9686003)(7696005)(6506007)(53546011)(26005)(8676002)(71200400001)(316002)(8936002)(76116006)(66446008)(64756008)(52536014)(2906002)(66946007)(5660300002)(66476007)(478600001)(86362001)(66556008)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Y+SfJtXQ8/4bzEpjpq5iNwYqHllXnpP5tukRFwirvjk7iNkVVx+DVkoj2saDi2u4JRhJFxvx/aoyZeCeocMvJTE7ByjuJy7/MmX4eWkS87nrIiUDzvvHPx1Dafj87ovLTXmmBe29qqJjuddPIn+2uhj+qn+SIWt5zaYk0j6wlRPpoqTwUC7cshm+gcr2AOdJeHpVzhG7gobYJYnA7wJfPLs3j3dv8/Fbx8hkzBKuN7jksdBGgHzfrycVtds4p7RmbDLGyB8lkBWcVbhq4R3Rtxv0AXcntZk6Wu7gzCM0225CRoJ2HOae2HgYuWEtwsbmssAEznwTUelDAisut6KDMDzCszv3vspa5/2t1V5SpCGDS1W7Ig0uleCGqsDqlohete9anqg71VhxIXyZsyPHu8tT4lHIDWSJT7SBc1c5XwnUChuuyC+8QPrhD6hDLpmobg4tipYPqjrMXI9Nrxo+SE0pHZMAJFdjO3jQjEvGo5fVB1YWVAXzNKgF2sf5I+i8rLSwpAM4kfah+ntyIGQh3BhwLtCwi+3nmt0FpZHgnJsNvy3BjOkvstL4jqNSnv5EfZk0MAnbA/AqMWxybk++BJijqu+YD75gd0ovUh0B07MCIks6217GuUUihrugmjtXtmJMIBVHPe4Ced6GW154zQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11617326-d275-43db-8bd9-08d8662dbe2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 17:16:32.1913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKkVbV/9xF740+48w6xfFBQTaDIa7d3AsqsMPFzIjRsJVuXyhGI6gDY1I9FMpQvVTOrQXCIumXqfFFTtYpKM7F2gaiMx/3yfTZNvC+8SUZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3884
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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
> Sent: Thursday, October 1, 2020 10:10 AM
> To: Ertman, David M <david.m.ertman@intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; alsa-
> devel@alsa-project.org; tiwai@suse.de; gregkh@linuxfoundation.org;
> Sridharan, Ranjani <ranjani.sridharan@intel.com>; parav@nvidia.com;
> jgg@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
> On Thu, Oct 01, 2020 at 04:50:26PM +0000, Ertman, David M wrote:
>=20
> > > >> are controlled by DT/ACPI. The same argument applies for not using
> MFD
> > > >> in this scenario as it relies on individual function devices being
> > > >> physical devices that are DT enumerated.
>=20
> ...
>=20
> > The MFD bus also uses parts of the platform bus in the background,
> including
> > platform_data and the such.  We submitted a version of the RDMA/LAN
> solution
> > using MFD and it was NACK'd by GregKH.
>=20
> That does not mean that it's a good idea to write documentation that
> says things that are not true.  It would be better to just not say
> anything here rather than mislead people.

I have removed the line about MFD devices requiring DT enumeration.

-DaveE
