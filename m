Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459682A0412
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 12:26:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD311658;
	Fri, 30 Oct 2020 12:25:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD311658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604057181;
	bh=I4QI6A00GXwsZdMgxowb2V3axci4pGJE1bBhT8Bb1RQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oa8L7oClAPtDsx6pS6zbUm+Jtr+Jq9ww7ss/zPYUMiLJSCiCimXTugfOcfoSK8/xO
	 RkcO2FNpKUsVfo+AG1QM8tV1hsgEqCxDnunuM1PjTr6wjkBr2uvY7Nsnp/Sp/Cszlm
	 /Xh/rARn4wvi4D4sTaIcRfjPypkjH0uU46Kys9og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA0BF80249;
	Fri, 30 Oct 2020 12:24:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFECF80212; Fri, 30 Oct 2020 12:24:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_21,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07516F800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 12:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07516F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="SPupe1O9"
IronPort-SDR: 408PEpXrpiS+qVwBCxD+2om3sCNhykTbrSRRlv7l7nvPOKd41ozXgmrgEqveXmgFVi1GxatneP
 txqwPTjvA5Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="186397627"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="186397627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 04:24:38 -0700
IronPort-SDR: Ajp1JkS97i9Sqnnb+qnTUYGBREWPaMHSuX8CzeO8X0VMh/TnWPmGR/Eru+vTUOa0yWgU8Qztq0
 P2tXBW5qT9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="351271652"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 30 Oct 2020 04:24:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 04:24:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 30 Oct 2020 04:24:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 30 Oct 2020 04:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1yC9umt8M3D+65zTXInVH5VIo37KwuBDl1b9rpvppVc/YJGqKu8UF44+4KHaf3R+e/GA8hcDekvd1GRQLEa1VqR9/V/fyIUXXMq47t0yHmca06+JymtAYBTy+rqCqokVjqUhysVu/CMPsVomM3iRBLN67VcZ2JIrL0EFyLw4NKZpRyG9PCVQ2V26TxRPSu8/8SFqss/dNSy5q+rAqAhQsEsXdDnRS+tfbF8sDXNpHZit4ndTQRZ8bDjEMrNVZ3usIbQ+kkgmC/xzO92nu90+sPqSuxEggwnWdEP8PfVzVqr6qIbXmidhG2JO4fJFqCG2btdW9ohP+1zI2iwzC++4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr9OFmZFYpRC5HZy587Yd8/7N56Y2VbW2eq3TmSE4Ls=;
 b=dlaO2XA5ZRwpsSEO0o+gG/qytyRQI/coyB5eZAjTLTPHodAjKySmbfdpv7tJnJibH1Oz1J8EspnvDawLtSILDNE+1hDH/ia0yRBamHp9UJS+TlCQzZ++j1AooyRUGJ70wMky5WeGJQ0NVCkj2QWTy39WyKOA7YbDajFRKUtgtcUxjzNjU7Ax2tPmXQXZHQJGv9gERzfo4W+9kMw7oDNTh/XMGAvWQFBjHQETo8tkbZBIfMZeH4xnNf4rOV+X7hv1khfPIU9jR3Q2SZlUz/3bHljMa4m7KUO3GffBF5ZIuHVa5BOQXt4LD6oeqcHWyT7JwaAZH/jG1ifjVUSF1+94gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr9OFmZFYpRC5HZy587Yd8/7N56Y2VbW2eq3TmSE4Ls=;
 b=SPupe1O9DJtyo98Flqv+pK4Hq/u5lvllf12y23iUlLpRj9623MXD/WSe9u7oPLJoKyMqXwyAvMEx7d8D7wCBWgthzAW5Fb+eSa9Pf6DOX9UTPO+KdIbQ4fWkrFGoM0abIrwWtLnfMlec/usAr0wY2wSMkoux5HGltl17DQ957pc=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3354.namprd11.prod.outlook.com (2603:10b6:5:9::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20; Fri, 30 Oct 2020 11:24:35 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::b554:409e:1838:bcdb]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::b554:409e:1838:bcdb%7]) with mapi id 15.20.3499.024; Fri, 30 Oct 2020
 11:24:35 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH v3] soundwire: SDCA: add helper macro to access controls
Thread-Topic: [PATCH v3] soundwire: SDCA: add helper macro to access controls
Thread-Index: AQHWrpjbyfa2plPVA0OzLYpo4vdcwKmv4zKAgAAXXQA=
Date: Fri, 30 Oct 2020 11:24:35 +0000
Message-ID: <DM6PR11MB40748AD8D57C73E4D79D4676FF150@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20201029204955.8568-1-yung-chuan.liao@linux.intel.com>
 <20201030093651.GA2080962@kroah.com>
In-Reply-To: <20201030093651.GA2080962@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4320457a-35dd-495c-fef0-08d87cc66178
x-ms-traffictypediagnostic: DM6PR11MB3354:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB33543C21E98BD833C8E59CCCFF150@DM6PR11MB3354.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h6JegD0AW++0VTsmUEGVE6E6K8avlKP8rOB+bHKdmEJGdP4eFJQxEqtBsMlUx2Aqts94feC9wsu4reeT1EUouGsmyI5sfz7duep0drjCqdIrV/nxzbmLm1aWvy7rOCp5g0KXN9Kn3wt5nKLPI5LB2HPAo7D35Mb6o6TyB5jCSDfrhAk2lodqs74UtvfJPrdqcj09yW4g+SeW1ge8SvP2wXr7l9vYOgyvnMg2uX5pJI1VTWh4i6wsfunHotuY/JG/XMZBlEiUXtJZ4nVI246CRyfafqDr6vt6fP8t46fyVkiW6dELVbKM0IfDkjTplCwaXCWns35P8zGEqMcptZvdiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(110136005)(2906002)(66556008)(7696005)(33656002)(8676002)(54906003)(316002)(26005)(83380400001)(9686003)(5660300002)(53546011)(76116006)(52536014)(66446008)(4326008)(66476007)(6506007)(8936002)(64756008)(478600001)(66946007)(71200400001)(186003)(86362001)(55016002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Ugie2NlTZTB6HUR2i3QhJlldA9+V11K/nPy7upLb/7lWDux0euB/gU3+HMv/9vMaSr2hWm4e04kYHacxn25OyIagFBuWAxaNT0QHgjhiUar7T8jearLy7CE6PfKgng1gd62WkowGfQiR10PMIYxo08k1x18Y6PPIGRQ+iydbDAySdKIk03sdYaPRLY4DNhBteU6W4XjI+tYW1okVPltrBkclEb30qbb0BmLT5LO0UF6nrRIa2cyD8ahM24PFRUoKuAM592uvJ+AgDx3/CND7Ygp/SIVf8QnCkvBF+cY5hImXL/Nhg5H3AVaO7efgvAh4SxD9ht5uaAZmOznH7AnKs+qEiR0MdltiJX9FGDH35cxZ4Xo3EWawKOFDvhiRod6g1WqW05KmoiK5g16i0Wkc6Al1oSgsEfOx5+Sc4VuGV5awzRY7QInjwuPLLArc/Jrx9qnRkFMLjaRsIamu1M4+EajoioVxk96aE3h1ErSsKKUaVha1urT5SdfM8rhh2hS4jrKMcTJ3wcti9ZcUN1B8YvCGgmH2QFj11LylfdrPV9d26OmrBHVjpOapQCKoYs9PravPdOvV+eOPYAKVVCRvH8tvJT8DNVHnG5YcWQ2V8Vg1WZmIjNdAKqjuAGayPPQRbwLYX9UiE61Ir1dhSyZH5Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4320457a-35dd-495c-fef0-08d87cc66178
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 11:24:35.2324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sb4f34fuPn8LP9/M51QiuCwniZClYZu25YYYJhl03CLeA+T4AiTXwrz98KhXBP0y3i0O5HSxhuO2VxhYvZaX4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3354
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>, "Lin,
 Mengdong" <mengdong.lin@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Kale,
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, October 30, 2020 5:37 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; vkoul@kernel.org; vinod.koul@linaro.org;
> linux-kernel@vger.kernel.org; jank@cadence.com;
> srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>; =
Lin,
> Mengdong <mengdong.lin@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH v3] soundwire: SDCA: add helper macro to access
> controls
>=20
> On Fri, Oct 30, 2020 at 04:49:55AM +0800, Bard Liao wrote:
> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >
> > The upcoming SDCA (SoundWire Device Class Audio) specification defines
> > a hierarchical encoding to interface with Class-defined capabilities.
> >
> > The specification is not yet accessible to the general public but this
> > information is released with explicit permission from the MIPI Board
> > to avoid delays with SDCA support on Linux platforms.
> >
> > A block of 64 MBytes of register addresses are allocated to SDCA
> > controls, starting at address 0x40000000. The 26 LSBs which identify
> > individual controls are set based on the following variables:
> >
> > - Function Number. An SCDA device can be split in up to 8 independent
> >   Functions. Each of these Functions is described in the SDCA
> >   specification, e.g. Smart Amplifier, Smart Microphone, Simple
> >   Microphone, Jack codec, HID, etc.
> >
> > - Entity Number.  Within each Function,  an Entity is  an identifiable
> >   block.  Up   to  127  Entities   are  connected  in   a  pre-defined
> >   graph  (similar to  USB), with  Entity0 reserved  for Function-level
> >   configurations.  In  contrast  to  USB, the  SDCA  spec  pre-defines
> >   Function Types, topologies, and allowed  options, i.e. the degree of
> >   freedom  is not  unlimited to  limit  the possibility  of errors  in
> >   descriptors leading to software quirks.
> >
> > - Control Selector. Within each Entity, the SDCA specification defines
> >   48 controls such as Mute, Gain, AGC, etc, and 16 implementation
> >   defined ones. Some Control Selectors might be used for low-level
> >   platform setup, and other exposed to applications and users. Note
> >   that the same Control Selector capability, e.g. Latency control,
> >   might be located at different offsets in different entities, the
> >   Control Selector mapping is Entity-specific.
> >
> > - Control Number. Some Control Selectors allow channel-specific values
> >   to be set, with up to 64 channels allowed. This is mostly used for
> >   volume control.
> >
> > - Current/Next values. Some Control Selectors are
> >   'Dual-Ranked'. Software may either update the Current value directly
> >   for immediate effect. Alternatively, software may write into the
> >   'Next' values and update the SoundWire 1.2 'Commit Groups' register
> >   to copy 'Next' values into 'Current' ones in a synchronized
> >   manner. This is different from bank switching which is typically
> >   used to change the bus configuration only.
> >
> > - MBQ. the Multi-Byte Quantity bit is used to provide atomic updates
> >   when accessing more that one byte, for example a 16-bit volume
> >   control would be updated consistently, the intermediate values
> >   mixing old MSB with new LSB are not applied.
> >
> > These 6 parameters are used to build a 32-bit address to access the
> > desired Controls. Because of address range, paging is required, but
> > the most often used parameter values are placed in the lower 16 bits
> > of the address. This helps to keep the paging registers constant while
> > updating Controls for a specific Device/Function.
> >
> > Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> > Reviewed-by: Guennadi Liakhovetski
> > <guennadi.liakhovetski@linux.intel.com>
> > Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > Signed-off-by: Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > ---
> > Changelog:
> >
> > v2:
> >  - add SDW_SDCA_MBQ_CTL
> >
> > v3:
> >  - add SDW_SDCA_NEXT_CTL
> >
> > ---
> >  include/linux/soundwire/sdw_registers.h | 32
> > +++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/include/linux/soundwire/sdw_registers.h
> > b/include/linux/soundwire/sdw_registers.h
> > index f420e8059779..e14dff9a9c7f 100644
> > --- a/include/linux/soundwire/sdw_registers.h
> > +++ b/include/linux/soundwire/sdw_registers.h
> > @@ -298,4 +298,36 @@
> >  #define SDW_CASC_PORT_MASK_INTSTAT3		1
> >  #define SDW_CASC_PORT_REG_OFFSET_INTSTAT3	2
> >
> > +/*
> > + * v1.2 device - SDCA address mapping
> > + *
> > + * Spec definition
> > + *	Bits		Contents
> > + *	31		0 (required by addressing range)
> > + *	30:26		0b10000 (Control Prefix)
> > + *	25		0 (Reserved)
> > + *	24:22		Function Number [2:0]
> > + *	21		Entity[6]
> > + *	20:19		Control Selector[5:4]
> > + *	18		0 (Reserved)
> > + *	17:15		Control Number[5:3]
> > + *	14		Next
> > + *	13		MBQ
> > + *	12:7		Entity[5:0]
> > + *	6:3		Control Selector[3:0]
> > + *	2:0		Control Number[2:0]
> > + */
> > +
> > +#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |
> 		\
> > +						 (((fun) & 0x7) << 22) |	\
> > +						 (((ent) & 0x40) << 15) |	\
> > +						 (((ent) & 0x3f) << 7) |	\
> > +						 (((ctl) & 0x30) << 15) |	\
> > +						 (((ctl) & 0x0f) << 3) |	\
> > +						 (((ch) & 0x38) << 12) |	\
> > +						 ((ch) & 0x07))
> > +
> > +#define SDW_SDCA_MBQ_CTL(reg)			((reg) | BIT(13))
> > +#define SDW_SDCA_NEXT_CTL(reg)			((reg) | BIT(14))
> > +
> >  #endif /* __SDW_REGISTERS_H */
>=20
>=20
> No users of these macros?

SDW_SDCA_CTL is used in sdca codec drivers which are not upstream yet.
SDW_SDCA_MBQ_CTL will be used in a new regmap method.
SDW_SDCA_NEXT_CTL can be used in sdca codec drivers, too.
