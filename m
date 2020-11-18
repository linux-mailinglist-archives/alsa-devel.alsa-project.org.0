Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D92B75E6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 06:28:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1881698;
	Wed, 18 Nov 2020 06:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1881698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605677329;
	bh=7b8QlatZp7wlrprwMCco6zJPZsKBYXskhjmDCoSEelc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BC0osc7XnL/ffp5wCjm9y76L48zVHJ26NPwxjg9qAGN66b2RrRLMOLYEQbJgx8EMz
	 ewuw3fxSNmVJoDMaOBJbBh6QHVDVQBbsBJQQApGviRe6676DDqKVMS4Ko+Jx04x054
	 fozfDXwT/ZZWL1zg0idztKyly1dzSiB0otlgUuoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C0FDF8016E;
	Wed, 18 Nov 2020 06:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF41EF8016E; Wed, 18 Nov 2020 06:27:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD34DF80158
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 06:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD34DF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="yOlWs6mK"
IronPort-SDR: 7wwzZungKueyNqUWIB3R0PqIyKrHw+NM0kFVMOUy1JqcotnHBPAXMkUcb8jVfCGOChY1zytfhx
 f+7l5w/axH4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="171236512"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="171236512"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 21:27:38 -0800
IronPort-SDR: xDSg8Mc8UJmmNzgAqtA3YbHCgsr442EqgA12+U+cU9gv1HJmqPOIHY2V0zxqiyc8w057XA36sC
 +Al/PDRqxTAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="330329508"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 17 Nov 2020 21:27:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 21:27:37 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 21:27:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Nov 2020 21:27:36 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.55) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 17 Nov 2020 21:27:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtEIYPtrBzX64rX1pl94mFY0f16bkqoCuWykV7ycnbEWvgXiBDoWLBgRzvfAKrQpT4ExDLAMWKQtLYV9yS+Kl8wQWE+vM+dVWPPuiVo08IRZ0R6DtEkNEqARQPyEMy5pYUyV/XFdFEQGQAgKivAkTd6hnCjDR6wNL0VfQDVKRa/l32nqRB6W6/CC80eTzWYBNdECXfiNCbtj+L9Nahvf6tlDRuaMB3oq3wRNIaX8wqflbvfEErqfxiR+4PnaPotYgLhk8KJDYkVChn0LK97ZDb1MKM6jW2WGP/Aez+wWYHVYz5t3+EaphomenGoZ+et8rt4ZtgIvlAxi9S027A+XIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqTPGSBljba+YY8lDu8FoG++jRomLfgTZ+TU/xwxxig=;
 b=TRI8lZ7TAG/gGnt/DFjBeWi4SalymswBDjVkZCJvtaqwKKAqZeFjXivauPnrsFyiM+jtYONdRDFVE7+lpqc0JdiLiq2Yx00rdTPTsp/XyfmhcNP9nEqE8G5D2b4Y2tx7SFkYu9/NlhWk0w3som91rlPatAWbRcuL5nxfDKCEY0VjvFAh4vlUThSERRjApIcFxTz+0tAUdn5CyHbS5wPJEHslE7UZ5I7Xav5QX+tcZKKrG+T+bvNN/dkAZj8YKp++qjBNd4J4u5Z8fKU5fZ1K547KOQYpxTgUZ5GYQpqSR6TaTZck6lDZEAqWverprtdB3RqSZh8kULxogb+acmLeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqTPGSBljba+YY8lDu8FoG++jRomLfgTZ+TU/xwxxig=;
 b=yOlWs6mKGSZ8viqrj8bIXJ4j1Bck+eMcV5YBaAanOvfVObCW80KaGTiqkRklRnrvzJmDzjkZ+tD3/UWOp5ShsnfRLvuxiJFHBYRhztFGMG7gCDofzWG4rfjRmYq6qJfGwzBOvgcvO7QZN8q1JD3hARO6RjV10GNfHyN6vpN93sk=
Received: from CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 by MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 05:27:31 +0000
Received: from CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f]) by CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f%4]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 05:27:31 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLkz/K4udK7YCEaiWD6EQ6aik6nMeVcAgACNiCCAAEmVgIAAC6Ew
Date: Wed, 18 Nov 2020 05:27:31 +0000
Message-ID: <CO1PR11MB50262A9095FD05560C7D4F77DAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118044033.GK50232@vkoul-mobl>
In-Reply-To: <20201118044033.GK50232@vkoul-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [218.111.111.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 538da297-f31a-4708-7172-08d88b82a5ca
x-ms-traffictypediagnostic: MWHPR11MB1392:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1392E52D3077EDF4162F162CDAE10@MWHPR11MB1392.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yBj9ioWpODIio8ua4eTo50GtbBM1Rnfkspy3FN5F+H4oKjcy/sZdokztBuuOiHxjnj1orBIIO0LgWlH7zN69Gvk3lmYKEqeuEU44lpkPWOVJKQ3ZPiNqY/BgV4b9qjNLY6nNhbGFzf0iMRNbucGJA6ZQZKSR4vIrXyaQKFrgTqMnfRVbhJ1M9V/9bx1lX3gV3kL6l9zoxXYr3nZedrk3iObQjRpFZjIw37PiOUcDBMUrHDO2V+R/XxBUZbPUIuXjWFJ3xs72NiUXl+rv8pA7zcqS/HhoslqgkRCotBGecjQL65GDqrEeBzh2iuE7ElQBCNfMSRqXCEDyiMUJqTnf+Y7bg8TQZRWccTe2ew4MFX5CSWO+hGuzkBh9G3VLF6Qj0wPhEGwcGPq6ncjKtQoyY1klOYsWuipNX0MfKDAwHnXR/xaQacRyJdufzHvxSEuvyBVY1OsmCxAwcyvSc3o+FA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(71200400001)(6916009)(33656002)(64756008)(83380400001)(5660300002)(66946007)(66446008)(66556008)(478600001)(52536014)(66476007)(76116006)(2906002)(966005)(4326008)(186003)(54906003)(8936002)(7696005)(316002)(86362001)(6506007)(55016002)(53546011)(9686003)(26005)(8676002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JfVrX5T2H/tV+A78Z3SpMpJ70bAKP4vlGtrIHNlBe7MTmPLLDzCj8Gh5Nn9KmyLDzrxSjaUiy+tHi4hI4gWaB7KcZBjynUVVc4MEvuOk48E25g68no+S2aoux1xg8uxe6lkIhrPQAu0eqU/xvBL1pxau/aLC+fCL4sj1IC3PzsJgkBY9A+j0WV51SHqcMkPgotLB3zfUsONyFRlI7L7vBc96iG/s/UFyOeVaAKTNyENvNwE6+RedYxZ8AA3b+aNNqB+1E+2rK0YBPt28w2kNMH3rYiBNLcthGRuGnU2efkPy4KENFDSw/0gHsAOSGMYwrz+Rc4ee9obCmX230d7hTTAaN1GQDHxgLeEbZyc/oSrr+luaWZscenG/Ms+golyUAUZk+OpqYyMCx81BTfOUQ86srYvKpRA35gy2x/UxfRIasLLSaBNOw/7z//jigY9jnfup+57W/RLpyv+inHHr0DMsq72GLLi7JqvaJAifufr/vDQ5ToNBsTvfZWuFDhw1uEBeNWrrOeN4yIl4zLp+S9MtUc/h0aeMfaXV8V6MHZLoBezLf+B4Ss3sCCBjFkY1x6kTZjbXlEwKCXEDMMTV+OhPtqROoB6Kw+JYg9B10YvSxv+oERB5eOqqLTXQZGcC9mssU8nT75ZM7W8t8Veq4e5AO7nNbf90ZdDQJ1Vev+zW2QZU35gQLEG7ckxZQvoRxAPC2B+aXdEsE6bf+z2sp4bIZ7RjjtvRdyY04GElFHA908TJamP3JMh/jkcML5BoZHJpdAL3vDD2QkRi7MzM9c+w+YAeQjDxkOfaTlmzSL+c98x1xY1bn1uVxAsiPreCVuK/rKd9H6Xi+WXKm+ANHE88Q0RlQtZiIu7+4frUpeK7iITEKtthhtupcNDLavfJ4A23lW0QuvOeYNmtgB7hYA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538da297-f31a-4708-7172-08d88b82a5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 05:27:31.4769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYVmAkv/sg2knpgrVxTMyRbN4ikcp/O0RRQWfohj6cckI1Ae0//I12bdna7Gc2svk0kzON9ERkGrGMpUvMrXsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1392
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "Sit, Michael Wei
 Hong" <michael.wei.hong.sit@intel.com>
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
> Sent: 18 November 2020 12:41 PM
> To: Sia, Jee Heng <jee.heng.sia@intel.com>
> Cc: Shevchenko, Andriy <andriy.shevchenko@intel.com>; Sit, Michael Wei Ho=
ng
> <michael.wei.hong.sit@intel.com>; alsa-devel@alsa-project.org; tiwai@suse=
.com;
> broonie@kernel.org; pierre-louis.bossart@linux.intel.com; Rojewski, Cezar=
y
> <cezary.rojewski@intel.com>; liam.r.girdwood@linux.intel.com; lars@metafo=
o.de
> Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
> prepare and submit function
>=20
> On 18-11-20, 00:34, Sia, Jee Heng wrote:
> >
> >
> > > -----Original Message-----
> > > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Sent: 17 November 2020 11:51 PM
> > > To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> > > Cc: alsa-devel@alsa-project.org; tiwai@suse.com; broonie@kernel.org;
> > > pierre- louis.bossart@linux.intel.com; Rojewski, Cezary
> > > <cezary.rojewski@intel.com>; liam.r.girdwood@linux.intel.com; Sia,
> > > Jee Heng <jee.heng.sia@intel.com>; vkoul@kernel.org; lars@metafoo.de
> > > Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add
> > > custom prepare and submit function
> > >
> > > On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei Hong wrote:
> > > > Enabling custom prepare and submit function to overcome DMA limitat=
ion.
> > > >
> > > > In the Intel KeemBay solution, the DW AXI-based DMA has a
> > > > limitation on the number of DMA blocks per transfer. In the case
> > > > of 16 bit audio ASoC would allocate blocks exceeding the DMA block =
limitation.
> > >
> > > I'm still not sure the hardware has such a limitation.
> > >
> > > The Synopsys IP supports linked list (LLI) transfers and I hardly
> > > can imagine the list has any limitation. Even though, one can always
> > > emulate LLI in software how it's done in the DesignWare AHB DMA drive=
r.
> > >
> > > I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM and didn't
> > > find any errata or limits like this.
> > [>>] Intel KeemBay datasheet can be found at below link:
>=20
> ** Please wrap your replies to 80 chars ** I have reflown below
[>>] Noted.
>=20
>=20
> > https://www.intel.com/content/www/us/en/secure/design/confidential/pro
> > ducts-and-solutions/processors-and-chipsets/keem-bay/technical-library
> > .html?grouping=3DEMT_Content%20Type&sort=3Dtitle:asc
>=20
> And this link is not accessible freely!
[>>] Sorry, perhaps need to apply the access.
>=20
> > Pg783, "Programmable transfer length (block length), max 1024".
>=20
> Okay so block length cant be more than 1024, and IIUC that is 1024 items =
and not
> bytes right
[>>] Yes, it is 1024 items/blocks
>=20
> > Sub-list can't exceed 1024 blocks.  BTW, I think the 16bits audio
> > could be a confusion because it is not about the number of bits, but
> > rather the constraint of the block length.
> > Base on my understanding,
> > Audio needs a period larger than 10ms, regardless of the bit depth.
> > The questions here are:
> > 1. Should DMAEngine expose a new API to constraint the block_length
> > (instead of size in bytes)?
> > 2. Should DMA client re-split the linked-list before passing the
> > linked-list to DMAEngine.
> > 3. Should DMA controller driver re-split the linked-list before
> > execution.
>=20
> I would go with 3, this is not a fwk issue and can be easily handled in t=
he dma driver.
> It knows the limitation on block and can split a period into multiple blo=
cks and set
> the interrupt on last block. I do not see why that will not work
[>>] Got it. A separate patch shall be submitted to AxiDMA to split the lin=
ked-list.=20
Hope the rest of folks are fine with this approach.
>=20
> --
> ~Vinod
