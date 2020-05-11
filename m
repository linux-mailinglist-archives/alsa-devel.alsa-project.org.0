Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 892161CD382
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 10:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0909E1612;
	Mon, 11 May 2020 10:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0909E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589184419;
	bh=4nFNRveVqjzvPRCJ5H36qiPYEV2eAM0JBg7j4ys8t0U=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqKhG2aGE5pbYok+bNknSDaA8n+Blg9m1Nu4tcnYiPDQP8CzUHr17umwQlV33HDSy
	 ZVOQekharfOvLSL3VcT+ShiOhHyMpkC+IjNKTaxYp/yHyGOo1ITdorY2ZEMpms7QmK
	 pY4fDeHYRpMKTzQwYSYZ9CoafdgoCzeHF36+k9rY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 030D7F801F2;
	Mon, 11 May 2020 10:05:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C675F80157; Mon, 11 May 2020 10:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ACA2F800B7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 10:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACA2F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="vJSefEqz"
IronPort-SDR: 7CHdx0uWIqcOemaX0IE0xGc8fAoy8SKQvcuHjANyCMMM/DOoJFZxY1zdt3yjJYukh6rI1hGgql
 ECGCyx9nFz6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 01:04:57 -0700
IronPort-SDR: a3lIWqPE/g1jDM+p7cQw7M/N1Y/ingRLH9yG7WO64xsxvKNVSm2AqCOVr/J/nJGl1gUjdi9uiH
 dJxniEk8B1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; d="scan'208";a="371149000"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2020 01:04:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 01:04:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 May 2020 01:04:56 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 May 2020 01:04:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 01:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S30YjUdLhR6u2yKU81AShfty2Kwowtvgp57++2I+IhAk0sNXXa/RnagMTcFRvWWpVrcR4uvl6Z3Ras/YzECKumWklX7IIeYMghM6OPxg+GvhA4tGiSheQ2L1YfLitXU1RD0e+LDZPTkflB1YJ55z5m9Jr8LjSlHq4c17Nx9APEaeI21Np93F6i2gUwcn/OuY3EgCzqL19F2VQD8vg3QG6l6wf7GFyTMggbeK109qBygYKM2xG1hDdSglIIsbVYwZdOXCE+MashIFIcWHCcGeqmcVHgwc920ADa/tbTGx6BVHXz+TV3iy9wD0gmcvojXfuHio2F4j9BCENIjKJJ68OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Crx/4ryfyoYTz8/Q4AamoSf6Ouj8hu6jQTcdh1jCyg=;
 b=csTOhie9A1ufPMZreOa8t7cnDHLOT5259bQnlYPnmEwOn65W9Kp9H14arVGRPHOuXwyHm7COQOF9x9cJiIU5RnLLHVmzMgvhn50XrsoEnunbxcTNbf8xkoABHinCvZ+LQXTA+ebgZlPxqnAtHVn+oMW6UTXhU2AOAoypIpYncThOmT/Q/wrlKJnN1xJl6RTy9B1yxC2Io7FOQWrq1ij+W2inNQgZUuJKTNc7gFvp/ehQmC7B3HdHtqRbJWYmPI4NBlgoSsLksHZBGjJRC/2G/DcyvJ4vAFP+cJMV0DDs8061IEXBiSoQGVGBOXgQTOmNSMabHCLs7YAtJSTmGuHCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Crx/4ryfyoYTz8/Q4AamoSf6Ouj8hu6jQTcdh1jCyg=;
 b=vJSefEqz6jWEBNPT0Tz2/f8+FvWzSGekhY0QBtR0oWC0wgK8+x6CYQ7D7lulDMJKe/JKAUY7M4RRFOnQaRd5Zxf60eABzDFfK0bR15SJGVetcWhQixA4QxDqJ4y3NAvLEclj2L98wFopF7djQ2MOKEbu9KeE15/F6+iHd9OSx0k=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3818.namprd11.prod.outlook.com (2603:10b6:5:145::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28; Mon, 11 May 2020 08:04:44 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::6921:e03e:b890:fd53]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::6921:e03e:b890:fd53%7]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 08:04:44 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Thread-Topic: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Thread-Index: AQHWHrsvVp1w6XL6HkWXivkwcq57E6iifmqAgAAQ+dA=
Date: Mon, 11 May 2020 08:04:43 +0000
Message-ID: <DM6PR11MB40748EA6346831A67BD218C7FFA10@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
 <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
 <20200511063227.GS1375924@vkoul-mobl>
In-Reply-To: <20200511063227.GS1375924@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.193]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efb13727-2230-4846-2aa3-08d7f581f705
x-ms-traffictypediagnostic: DM6PR11MB3818:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB38182862BB13CEB46198EA3CFFA10@DM6PR11MB3818.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NBKRpm4pAkSSgBv/LOnvXuTf3vNy6oyXAc3UOm0YTo+asUWeH1Tds62Hka1eBv8gW4HCq1nBZuBc/FpWzOflfCexrzGjmJAN1xisBk2UDy1B7xgv4BK/Ov4vNNZxH7ML1ybPOatARXj6dLff/qd86J/A39ML3LMQR/JvzN5t+7aQzGc15dCunFdG209tsaHbmoHLUdAZyesGnneDBjWoksgSDSNcikTRKBQrp8mf6Qkxj/URClqOJ1QN2U3wIzHhQZTZ0AxkoffOEaEVkG9f33T97FMZGVhGu5jLB1BEAZzp5DEwyPorbXEqTSQhgnq3dsO/EMdtALAjkthRuB6n7pT3kXvfwB6NbeE0e57xtWs+N33mdWjUDf5Js1VIPJIk/wPZjKJWFTEumsgGU7ZXM86O9102PYCRjhAA7h2Hs5x1x8EMEQNwCnBGgfWz/whKY5XiHerUwKARR24DyhISN9Eg10GOA6lwtcsTzaKgiFlmczxKkhGeeafQHMYVVvPdk0ZovbHGr8qGC3/dJrP+Ig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(33430700001)(8936002)(2906002)(6506007)(52536014)(186003)(110136005)(54906003)(53546011)(7696005)(26005)(478600001)(8676002)(86362001)(71200400001)(55016002)(7416002)(33440700001)(4326008)(66476007)(33656002)(64756008)(66946007)(66556008)(66446008)(5660300002)(316002)(9686003)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: n2eaAig5+XCLM82aZ7fK1yp/ynA+x8wMkMDc/b0Z3XdfYbTgn6cn0bZmjIuXKDYHwNvuil9shpY7fOfEDEY1X0ndsgRP/2lJ3u/j+lwnUmpZbGXfuBiegQ+qL2fqsLI2pWDWCQh4+8QQC8daJw4RZVeAIbLAE7OIYyJQoSJWae7pE8jY0+Y3UeN9TYeQTbWG+zMMdljTs9Y2ffYJzbx9hDZDE6683D4EwcWTEFDE+1DoqT6dLvYAQhq9MMYrL86My/ux93TlH5nHNHrJmrRweYAGzN3/6TAwDmdYoEGZgcHifJWk1FXthlAucZ3jxVETZLbmn5SN8bpbMTAUY8JdTOj/LLOIkAR6wLrdwhA/MC7rk68zHUhQ+CA+XTkkh5kbAKi3ot/hUi5Xlw1auY4aYjEeXaIL1d0qJ0wHJ0ns+t9BTd/ruxFLjfJjLfhX6iKsCAUCCgNmgyA/W4waGUBbTD096BxYeCGFk4S/B/o1MFc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: efb13727-2230-4846-2aa3-08d7f581f705
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 08:04:43.9152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83a6xzVVMCooAkJ86pZvbcTPyGTjsfRz6SR0G5HFHAXy9tNwPj/40BFImuibYXx10cRtyW9PPwlPlp0QJKGSrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3818
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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
> Sent: Monday, May 11, 2020 2:32 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; tiwai@suse=
.de;
> broonie@kernel.org; gregkh@linuxfoundation.org; jank@cadence.com;
> srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>;
> Blauciak, Slawomir <slawomir.blauciak@intel.com>; Lin, Mengdong
> <mengdong.lin@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 3/3] soundwire: bus_type: add sdw_master_device suppo=
rt
>=20
> On 30-04-20, 02:51, Bard Liao wrote:
> > @@ -24,9 +24,14 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct
> device *parent,
> >  	struct sdw_master_prop *prop =3D NULL;
> >  	int ret;
> >
> > -	if (!bus->dev) {
> > -		pr_err("SoundWire bus has no device\n");
> > -		return -ENODEV;
>=20
> This check is removed and not moved into sdw_master_device_add() either, =
can
> you add here or in patch 1 and keep checking the parent device please

We will set bus->dev =3D &md->dev in the end of sdw_master_device_add().
That's why we remove the test. But now I am wandering does it make sense
to set bus->dev =3D &md->dev? Maybe it makes more sense to set bus->dev =3D
sdw control device.=20
A follow up question is that should slave device a child of bus device or
master device? I would prefer bus device if it makes sense.=20
I will check bus->dev and parent and remove bus->dev =3D &md->dev in the
next version.


>=20
> > +int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
> > +			  struct fwnode_handle *fwnode)
> > +{
> > +	struct sdw_master_device *md;
> > +	int ret;
> > +
> > +	if (!bus)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Unlike traditional devices, there's no allocation here since the
> > +	 * sdw_master_device is embedded in the bus structure.
> > +	 */
>=20
> Looking at this and empty sdw_master_device_release() above, makes me
> wonder if it is a wise move? Should we rather allocate the
> sdw_master_device() and then free that up in sdw_master_device_release() =
or it
> is really overkill given that this is called when we remove the sdw_bus i=
nstance
> as well...

Yes, I will allocate sdw_master_device here and free it in
sdw_master_device_release().

>=20
> > +	md =3D &bus->md;
> > +	md->dev.bus =3D &sdw_bus_type;
> > +	md->dev.type =3D &sdw_master_type;
> > +	md->dev.parent =3D parent;
> > +	md->dev.of_node =3D parent->of_node;
> > +	md->dev.fwnode =3D fwnode;
> > +	md->dev.dma_mask =3D parent->dma_mask;
> > +
> > +	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
>=20
> This give nice sdw-master-0. In DT this comes from reg property. I dont s=
eem to
> recall if the ACPI/Disco spec treats link_id as unique across the system,=
 can you
> check that please, if not we would need to update this.

Sure, I will check it.

>=20
> --
> ~Vinod
