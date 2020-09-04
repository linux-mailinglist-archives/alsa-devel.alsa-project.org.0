Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D9725D3EE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 10:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA411AD1;
	Fri,  4 Sep 2020 10:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA411AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599209350;
	bh=qN7bZjALQybpNb7OeT53Wk6XZxTfuDD80mmNUsALRyw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrERsKUHplfCx3WITS3aRYUp3furBpQap1FWx06H93R1HRz0ue87idabjq39WcITO
	 kiJvvX2aJXKFUXIE90oxA1iOE3anxhzg5R20zodqAVxoaNIrHaLGOlSl1PCBs3oed/
	 JI5/TvEX/IKu++avWZIDh6kG4J3SFVCfDfv5pn1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C471F80212;
	Fri,  4 Sep 2020 10:47:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ABADF80212; Fri,  4 Sep 2020 10:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A3CF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 10:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A3CF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="cDyuXumJ"
IronPort-SDR: HYBGUZsd3F3hqXX6pIipRRXR8jbqJt9jNlJVE9Ou6WMJaLeP04derEkpYgkrGije5mbFpTX93w
 MBH1sqWI1R/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="156975276"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="156975276"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:47:13 -0700
IronPort-SDR: NkdWH9GsH8V6EH/5/AeyWodIzOgpCeYLXA4iVEqMpklIYnURqhAnNuECI/a931s+Dlr3hgcNLT
 ADFolLjzXlpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="478403973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 04 Sep 2020 01:47:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Sep 2020 01:47:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 4 Sep 2020 01:47:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 4 Sep 2020 01:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVRZnaeEYvX1/8AR2A8l3YYVPO51EUesnnz15qxyr2++YH1wnGP9MrIu8QzqSI2qDP/u+B6KDgFpFmIs3MTVCa1GdXNbs0PEE7qqwKBiqHBGcjUPoZD3CYkU0KzL3+n7iVU+xVnliibpw/51A9MoxHwJwp3YDFb+hsohvb11x6SVP+ez12YEw/35MXv+2nZVqxceK+Ke9MC0G4zjFGpmbb0N7e2WYfbXR/1vup1gbUxLMjqHNvIUwx3jKSI5W7FevKKo8l7c9KX6hrXb0L4S9jVkvYBP8/JU3XIoc5xgkT4RsA9Y3fy0CVTqroMsMJV/edChfVGmmCcSRfzjv+FRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN7bZjALQybpNb7OeT53Wk6XZxTfuDD80mmNUsALRyw=;
 b=fYz3VpX9nsJkmMVn70NQOPRQacd1y49shGDXWPLNAgdpP51lVbYNDif8NTntRBwCxLXX1cxiY2QM7MYwolkC4+TClv7rvX1aJjoCf4V0WTmxzl/utFRTOTLIOwYspqCcE9Bu7BlzVcvUmax48jV6pgZ8/q6VniZ7d9owYS+CBfy+c7xWVIl7mE6hxKTQL1M+ukc35HcGA8Q6lrvK+OaqoGrR1saUMDef52J+kQPSGW5DRTwSV3KpeQnJ9MjJq2/0v6KtD4+S754Q7IpD/4DFvvuAPxtp4C+944XfKxAmqVEsykDxRrmMIy+JGrxg3awg/EgqyhvC1g9Lf/eyMp9/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qN7bZjALQybpNb7OeT53Wk6XZxTfuDD80mmNUsALRyw=;
 b=cDyuXumJiUbEcYdej1eyvuetyo+M84mBs9OSLAEU+KmqJDHbMPMVU841LUXAJXCx1AuIx7d/rwapb73yctVa1ldmVocfpdqYmsB5Xr8rRElAqfcpe2vxUhGRthsZIARglTdsgA8D993yZMsBo5TV9EOjKTNTBXut1qtCabCgWa4=
Received: from MN2PR11MB4080.namprd11.prod.outlook.com (2603:10b6:208:137::27)
 by MN2PR11MB4320.namprd11.prod.outlook.com (2603:10b6:208:195::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 08:47:06 +0000
Received: from MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::68a7:4061:90a:d696]) by MN2PR11MB4080.namprd11.prod.outlook.com
 ([fe80::68a7:4061:90a:d696%6]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 08:47:05 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 0/7] ASoC: soundwire: Move sdw stream operations to
Thread-Topic: [PATCH 0/7] ASoC: soundwire: Move sdw stream operations to
Thread-Index: AQHWgNSto+aiSc2AREW6lHBM0hiM66lWvEQAgAA4pQCAAPzfAIAAO9ww
Date: Fri, 4 Sep 2020 08:47:05 +0000
Message-ID: <MN2PR11MB40804E4E210907CA399BBDBAFF2D0@MN2PR11MB4080.namprd11.prod.outlook.com>
References: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
 <20200903104248.GQ2639@vkoul-mobl>
 <033ea005-e948-c2c6-9bd4-e074d3effde0@linux.intel.com>
 <20200904051036.GU2639@vkoul-mobl>
In-Reply-To: <20200904051036.GU2639@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9439a966-7113-4fa0-a885-08d850af1a03
x-ms-traffictypediagnostic: MN2PR11MB4320:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB43202573B4C33BCE98AA9FF7FF2D0@MN2PR11MB4320.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tzIl4ll3J1UjVbXRryaM3Tifrt/pYrczWyfzzQaBe2MaWa8cML+D88iwfAwaoNHGeuHnrYmPXThV8bUYx06y6RgSHJIBMXGiOimg1L+WZ0rpGg5oEvwhGI75E4lCIO5iCHkgDWXryQqqt37uuFtPyhgv62c6g7c4O4LVJRt6Y4XK8Uufyv57Y+srSZBCi92dePQBOq8954RzKx/cE9nsEi+oMgx3NctrBZoDXiGBShU47zxrgPnXtMBf/tu78kChoA4I9dvLq24C1koysgzKROLThctcvvg9PxfwMMQ7UjNQoHgu1CoTHNsdD8qwF9XO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4080.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(9686003)(55016002)(8676002)(186003)(71200400001)(83380400001)(86362001)(66556008)(26005)(66476007)(64756008)(66446008)(76116006)(6506007)(53546011)(478600001)(66946007)(2906002)(33656002)(4326008)(54906003)(5660300002)(110136005)(316002)(52536014)(7416002)(8936002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 6aro9qiXnSqJwTgxBj+go/97il68rIb5miMTN0qxk/4Zk1jot2kAY6D0ANMWhKk3bQq2qJsKtwSHqFJMlI5tD55lwX8M4IvzopL0eMnbQ/Xj1Ie9muCpbMmMefW98GV2MQtFk6gDIT3kz2epo6if0/l5zM4xgtl5zS0Z7Js13ksxPNL/GgC6QqYW2epDeu8s3YvmnBLruZ+GnFVPZ2F3pdwb7v4JsL9Kdy9W3qKmsw9JZOHQP9OQ2GsS7LQTVWep2/QMWXQ0SS4JOC19f9WMMdDPfW3kNKZYy/zKZ3Fr3yXF6Gze0JolivctuhwkF0lLeVDw4X5HtDaUj4rSg9jY+7v+RysXFH4/EGzNoVJsNvnNCKZ8kWJyavp1CFO61MjyxQCLbewhxcXbZqzZXs5FjFSzC3SgzFqCLdyAk57SWzXuQpYGZG+obnmmUzyc7mgZdTfVfFogvu69SAcT7J/Ve1cnSqAMytMLttQb9V5ONwG/+aF5F4ye4ygH6OiORK/ALKg1YtN6iA3E0lTulqF4t2HRu9OYA2sULdsbnIchmCoAz9QQJCiU1Fyf4p1EyuLy3Fx9wU/9a9/Ps4GPSdqkuGgyFgSdgM0X6qxba2h3gm2b2OBof4zX34yQMWCf2nu6ppD44S1lrjTbZOiMCBSTWw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9439a966-7113-4fa0-a885-08d850af1a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 08:47:05.3174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiO9P/A8XgXnXqUjRw5wkDQgVOE6kKBaG1NaQIxZW29prhOrWkYNGOVKGJfQrcC2L86/nUpnUERldKkCUR6Kig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4320
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
 Mengdong" <mengdong.lin@intel.com>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
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
> Sent: Friday, September 4, 2020 1:11 PM
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>; alsa-devel@alsa-
> project.org; tiwai@suse.de; gregkh@linuxfoundation.org; linux-
> kernel@vger.kernel.org; ranjani.sridharan@linux.intel.com;
> hui.wang@canonical.com; broonie@kernel.org;
> srinivas.kandagatla@linaro.org; jank@cadence.com; Lin, Mengdong
> <mengdong.lin@intel.com>; Kale, Sanyog R <sanyog.r.kale@intel.com>;
> rander.wang@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 0/7] ASoC: soundwire: Move sdw stream operations to
>=20
> On 03-09-20, 09:05, Pierre-Louis Bossart wrote:
> >
> >
> > On 9/3/20 5:42 AM, Vinod Koul wrote:
> > > On 01-09-20, 23:02, Bard Liao wrote:
> > > > sdw stream operation APIs can be called once per stream. dailink
> > > > callbacks are good places to call these APIs.
> > >
> > > Again, please mention here if this is to be merged thru sdw tree or
> > > ASoC tree
> >
> > Good point, I thought it wouldn't matter but it does. I just gave it a
> > try and there seems to be a conflict on Mark's tree w/
> > drivers/soundwire/intel.c (likely due to missing patches already added =
to
> Vinod's tree).
> >
> > So this should go to Vinod's tree with Mark's Acked-by tag on the ASoC
> > changes.
> >
> > Alternatively we can also split this in two, with ASoC-only and
> > SoundWire-only patches in separate series if it's easier for
> > maintainers. We would lose the rationale for the changes but that's not
> essential.
>=20
> If there are no dependencies on each other, that is best preferred option=
.
> One should mention in cover-letter about the linked series though.

Sent as v2

