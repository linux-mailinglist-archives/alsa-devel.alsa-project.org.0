Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B26211D20
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 09:37:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2AA51687;
	Thu,  2 Jul 2020 09:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2AA51687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593675447;
	bh=7z/BEQcWHUDt1oZhzP9ArwYj2ktIfrUo0bHaNMGiQ1k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VktgCpRFMhIkWqNeZqTMyNw42YCMNmIGrEROiJNp+bkdNJrKroZbg0WHy4i3OmQ83
	 ruicHuONAvV4Q9K0HBkChaJOiGrF0qDZHwSHij32Qh0mZUrd+jsGY7J6z9ohn1+oTL
	 Gq/g2DCRAQbk2W9da4s9/d1ZCVJT9rcOjbJBXCLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1739F800C1;
	Thu,  2 Jul 2020 09:35:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89FDDF8022D; Thu,  2 Jul 2020 09:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D15E3F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 09:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D15E3F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="AoJlUpa2"
IronPort-SDR: nW11/GBRCXCHLN9GYnx/5uHkr4n5E2vv+QGP75cSnu4HmfqdxAWDsISfzVVOIeMXlE0waL94Na
 M8rWuahAXJ4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="126917463"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="126917463"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 00:35:19 -0700
IronPort-SDR: ubZVH0Cvjow8acJF1a3yf1bLmV+27TThH1joze1Vs4+6qibm60CxAV/5a+Oi95Eq9TF65VVVK8
 EiCtg7nKZi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="321453454"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2020 00:35:18 -0700
Received: from orsmsx122.amr.corp.intel.com (10.22.225.227) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Jul 2020 00:35:18 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX122.amr.corp.intel.com (10.22.225.227) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Jul 2020 00:35:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Jul 2020 00:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQsk5VLm8qZBrxeDlfm4P9D8wgzpaw2jGnqDOkZb5TD2WgN8Z5uupe/fi0DNqc+Vl/Y+sSgdRbE5XAyJcQFfm9KvJH6CsQeyery61a/O5dthOpz/Ck23F+LXrLdHRn6tavwW8jh61o4UXciAzqjZ+gNeiTGKEYm7Fw0enVETW8usAOOwMzsoahyy5jpjCFEEHjZ/eln/dr8XdVwLpWPLx0wSYT3Hlf4uP/UR2Hh9omD/uCI4Cfv35X528BODtwp9hYiBw/qflE7TC6nSEzyKVcNE0hsVhcxXyDio/o5nOId07AzG2tyF39tdphzg32L62ExLbabK0IUf6dOiiobleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5j/5uQ/aUieLdeXoPikFHxwouzXeMABwmRg88xAkX0=;
 b=kT+MYWpFmhEgdCg+WIjp9DjbRGsBLtwhbMAa8GZEoJr0xEMF9D50W9eBOANLsSfHBVDyhhTqSueeSkube5U/4Q0ujTqwbNH46+mkoBuSVZ0CU7rAwdzyjGrDG9+h78j6N/NeT+rdiLBVfWzCXokNsrj1llvvky/nrCcDwPKXJiy/Gp5XlRYH7QN8LKmcXnenVx/+L9qKZKIFVdM212VPTgrW1cst+FVXS6YNEhpTamWXz2WG/L79g9URR/SSEOMrRgolUzmJUumw0ChHJZ+aYEmbXkM2e8UE8R6UK/fr9V5DTJHHjRgJ/3YZxMA42S/Ld3FMhWRWpjs18/nzA2SpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5j/5uQ/aUieLdeXoPikFHxwouzXeMABwmRg88xAkX0=;
 b=AoJlUpa2zBYmSsLnbvtvXGgkl6Fq4zxf2FHQm1dlOy2P1LcTPy3D11714ZZotVh+pY4x0mfWzWpnIlUFCCS7Tz6wYKNXAR9DuwuULtAW8v5vHHrNZ32hrqzg0hZRCWwOMFfihXQDAl4xF1vC9P/heej7Fzv5RemJrd9dyPOApHA=
Received: from MN2PR11MB4080.namprd11.prod.outlook.com (2603:10b6:208:137::27)
 by MN2PR11MB4238.namprd11.prod.outlook.com (2603:10b6:208:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 07:35:16 +0000
Received: from MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::9fd:f54f:62f9:a24e]) by MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::9fd:f54f:62f9:a24e%6]) with mapi id 15.20.3131.028; Thu, 2 Jul 2020
 07:35:16 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Thread-Topic: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Thread-Index: AQHWSeihfI1JFQJUyEWaiZs1lVW7K6jxYiAAgAAGM4CAANimAIABonmg
Date: Thu, 2 Jul 2020 07:35:16 +0000
Message-ID: <MN2PR11MB4080CF23D00A3AF817AC1E7CFF6D0@MN2PR11MB4080.namprd11.prod.outlook.com>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
 <20200630162448.GS2599@vkoul-mobl>
 <55fbc41e-cb41-8bdf-bdbd-1d1b76938683@linux.intel.com>
 <20200701054224.GV2599@vkoul-mobl>
In-Reply-To: <20200701054224.GV2599@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fbc1e39-9fa3-4b64-03e8-08d81e5a76cd
x-ms-traffictypediagnostic: MN2PR11MB4238:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB42385665A4AD145D4E8BE623FF6D0@MN2PR11MB4238.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UUUCOPRTOv2wKsuQnqKsw1SP6ZHaXTBTNHMDYCbh2XeVm9sOyLVcAblYokCQJKfsFQKPp+x7bI2ZXVipBaFdvTavlCP/K9Jwi3SelA6dVSxb3PqW5SrwodLlsoPbBRI8t1UbEUofQUy8w94KW0nhOrdMPhIHQ2I9PD8NKURnUNsFnUr0f8vKojlpAsSDP/rgaY7Ex/sRE1D67T4qOEjwv01yuqv0CJn2i8mrE/TrxGpXvIH/7Moxy7H/gzLgRlNJO7cFEJMm9NBTZzthaugWjMGFKnkF0ruZlbr0ZMwIRel0PoNgH6SgUIb/2rq/Au9X1sy4AeGeaPJ7C8abr1Ce5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4080.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(83380400001)(55016002)(8676002)(8936002)(86362001)(7416002)(478600001)(54906003)(110136005)(316002)(33656002)(9686003)(7696005)(2906002)(26005)(6506007)(4326008)(186003)(76116006)(53546011)(66446008)(66556008)(64756008)(66476007)(52536014)(5660300002)(66946007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: A+D+rOdiT67zNP/qGldB8P9Vwe3tmgTAAZcREzyklL4ZiiLDWDpIDXNA+1G3+r9HhNGrsvsGxJhqXQkwWHQv1RMdLObKisgbzlXpiTkpB2nl0Sr0nH3scFAyZZ0xOd7Gdgc/TnrN8bCChfCRsxQv+N8tYTn9oTBX4TJi6HJQfqAT4Vhefjvjm3j9chhwcQg34mZJ7bXmuS8z6xTh3Yta67n0FBNhDhaqaZVxeFEUp26bzrNIrvgfGJHf122jGmOIobB9uGgFtwGmUCevOZBCtq8j0CrtaBDgk86T13DboKiF6hDI+9AOEDFOve25d0VklwMP4iqb4/PALqAOi9FbzYXUbxFddmPLySBDQ5cElpRE4SxqTFycpQbcLNGH2CPMNaq5hjnA3ISBIqXnnFF+j/rVSDa5q7/3xDS2ufk3ONwe1LC6Y3KEReTYw2y4wQgqTj8tRSyAI5spZ95+PZMd39rQ0xBEOiIVE69HqEyQBys=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbc1e39-9fa3-4b64-03e8-08d81e5a76cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 07:35:16.0723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbEGflzLV3eAZhiYNiqEQGjyKdWpZMPvc8YRzd84m/QN8MVv2gmor4qN5DyYWCK6km/3WS/8uymcbiDZ7VY3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4238
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Blauciak,
 Slawomir" <slawomir.blauciak@intel.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Wednesday, July 1, 2020 1:42 PM
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>; alsa-devel@alsa-project.=
org;
> tiwai@suse.de; gregkh@linuxfoundation.org; linux-kernel@vger.kernel.org;
> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com;
> broonie@kernel.org; srinivas.kandagatla@linaro.org; jank@cadence.com; Lin=
,
> Mengdong <mengdong.lin@intel.com>; Blauciak, Slawomir
> <slawomir.blauciak@intel.com>; Kale, Sanyog R <sanyog.r.kale@intel.com>;
> rander.wang@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interr=
upt
> handlers/threads
>=20
> On 30-06-20, 11:46, Pierre-Louis Bossart wrote:
>=20
> > > Is this called from irq context or irq thread or something else?
> >
> > from IRQ thread, hence the name, see pointers above.
> >
> > The key part is that we could only make the hardware work as intended b=
y
> > using a single thread for all interrupt sources, and that patch is just=
 the
> > generalization of what was implemented for HDaudio in mid-2019 after
> months
> > of lost interrupts and IPC errors. See below the code from
> > sound/soc/sof/intel/hda.c for interrupt handling.
>=20
> Sounds good. Now that you are already in irq thread, does it make sense
> to spawn a worker thread for this and handle it there? Why not do in the
> irq thread itself. Using a thread kind of defeats the whole point behind
> concept of irq threads

Not sure If you are talking about cdns_update_slave_status_work().
The reason we need to spawn a worker thread in sdw_cdns_irq() is
that we will do sdw transfer which will generate an interrupt when
a slave interrupt is triggered. And the handler will not be invoked if the
previous handler is not return yet.=20
Please see the scenario below for better explanation.
1. Slave interrupt arrives
	2.1 Try to read Slave register and waiting for the transfer response
	2.2 Get the transfer response interrupt and finish the sdw transfer.
3. Finish the Slave interrupt handling.

Interrupts are triggered in step 1 and 2.2, but step 2.2's handler will not=
 be
invoked if step 1's handler is not return yet.
What we do is to spawn a worker thread to do step 2 and return from step 1.
So the handler can be invoked when the transfer response interrupt arrives.

>=20
> --
> ~Vinod
