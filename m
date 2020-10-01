Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B122806A2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCEF1926;
	Thu,  1 Oct 2020 20:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCEF1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601577118;
	bh=nM5PN2pnNMw3/8aJj2JJzOYDXxlteeheahlnsIjiWDk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLtCNpz7A6PE8u/WWtD8tZ9AFcvGTGSrQ2zCRzRShPCDUGFSDpAOxN2NQJWIuNUML
	 BHdp/gOmdbyBnIviqIGPfvv9lxUBgGIoOIxHJaX5a3FRcrsQetZQ2/S4YV1k/QD+2l
	 ysaSg3RULqC0qiBo1JvYfuEHHd+vpnfY+EXCKSmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A732FF800AB;
	Thu,  1 Oct 2020 20:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA657F801F5; Thu,  1 Oct 2020 20:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD55F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD55F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="oTe138jC"
IronPort-SDR: ucr6H63qeCzeBouBb+l5rOV7XpWL+LnyPfDTFGW7DM3bxjQygyAMhrlMqE4eSO1cQav2m4bHW1
 9V3alezoX8OA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150597378"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="150597378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:30:03 -0700
IronPort-SDR: e0FPQE14dILWiE6cpFN6tmGtlBM3gW9VC5wDjDmD8QDUFzrPrknIs7niDHkrDBMnja6y1z0tWy
 Nf1tBUsJJc0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="416173997"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2020 11:30:03 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:30:02 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:30:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 11:30:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 11:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+vdRWvhvqqWCRXzGxAvysKDEXofXG87PraUTCOIzsCDJGT6gX8ssMYPNr6M8OvtaJrLV3c6JLC6LsVH8SMknJRHbKKLHYYgkcgW9C4jl/eDOkYcXmlBfJ5qzbhXGdkY+AZZfLtXwG8q/cpI7X+NtSbLJHgQNo+mUthVoWQD1NnuXVKt9pCAZLMXSPvdeHwAaY98q1fE4cnOc0jPs10B234Z6gXLr5YZh/YEmvwJOYeCFmTcHCGZ27o8B1WNJ5Z18y5hb9qUmGKEr6TJN15GozsxK5CtCpTafuuDJtE24eT1ImFo7/rZUQpBisu3xdUP1cXlvocewbWroDwyg9EPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snTTkaf4KSIckNsPcnxkiz+dEDkfCHlMWUvRusTNj04=;
 b=DqOForTbET8lGXTprFVpy60Frwxs15ruoKliwni+/IGoozPA/Rjq2yC7DnaEtQZU8MImqUhUM+t4ePk8t5kDWGfe3uBRUlQJn9XG0b5JCmO56VCU3tCYApxdtkNdlj2gyvQsdRrtR1TUxqmx432BHNw5twWMAM3/PcSun/E65j8TBHhHP8P24n8cAbHWi+nDKUJ8joRpsMx5Rym5fujtkH3hfme6dXotkxi4qusOiJJ9QPSvRugf76knwcUmWAoFBhh3+Hvtc+8v4L91I//xZ0Qy7NBNLB4a1kcigf2zr4Tk4wi1RIcFkb0GhjG2ctOEuIhXJitc6bMc5jCJ8vDq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snTTkaf4KSIckNsPcnxkiz+dEDkfCHlMWUvRusTNj04=;
 b=oTe138jCZGwtgRHh7i1IVx9Acb1dCuSiWHy9AaRG0eWxH7MlPf1SEhZbU9s5PI+jlRlHUnmDS0kJkiZoIVtY5R0rTLpdyToWylfQ6q7aSBbXoxd2aJEvgGx49fEzRlqvRKg7nGvP7w/J5MgY5cm8zT8OweQbtTUwXJZb60talvs=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB3947.namprd11.prod.outlook.com (2603:10b6:5:19f::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 18:29:58 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 18:29:58 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCs/MAgAAGNgCAABhvgIAADnmAgAAItACAACUyAIAAAllA
Date: Thu, 1 Oct 2020 18:29:58 +0000
Message-ID: <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk> <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk> <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk> <20201001181624.GC3598943@kroah.com>
In-Reply-To: <20201001181624.GC3598943@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 785c5ccb-2040-4dfe-4175-08d8663800b8
x-ms-traffictypediagnostic: DM6PR11MB3947:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB39473B50DD96BBAE2E5BD297DD300@DM6PR11MB3947.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2XgBtQip/Q/RFTCeezqJJhUdkDBUpQgkjOhJLPlg85ckMrt+fgdyfBIk8ugqkvk/yjyXc8UGOA2IC/h5YGuhBMo62+DMUL1dFrlUzXJR2WmdV6X/BRCl4QirY2l1yPj2T+KFB2n0dx9pKvDQeQ5TEtW+TgNIav1aA7eWDwxbtKg+fehqfvHZHWLx8/OzSpzkQNlirecAyBCqOV55W9k9HZJzm4ZR+zAOtJHcPdANz3ZGA6AysyA4s+WpKN+RQnhAo6Aj4m6eEqcx09yuJh0GoXrpKPwRu6MoSSqcp8NtEyfiBToVfR0dGIE7JnUgtMQA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(4326008)(9686003)(55016002)(66446008)(66946007)(86362001)(8676002)(316002)(66476007)(66556008)(5660300002)(64756008)(52536014)(8936002)(7696005)(83380400001)(26005)(54906003)(71200400001)(186003)(478600001)(76116006)(33656002)(6506007)(110136005)(53546011)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FEg1R2npf8sVdpHY0pl7N3M8NWzDemj5TlVg3xNq7nFtUAKsADkyoSVS745+h48BHnlkZNRSDrPAYhN3cgRdZfhIS2EEqX97wYScmV5wc5fxXaaJEwn8X4wHHFdspr6j4f8tzlsRZpSUcVEwqMuxoSUpmj0WGLXSFH9t+5rwrVrifr9UjawGFQ1FbVtrrdt3RTrXSBEg75LRZQxjbcoXJ1JUJfndTko0iPg7jqPmYKb2rxcARHGKs/At8YQjnTeMISBqEdadmSYjcj9IO+P7a2QDhEPujHMs0pSNEl95wNuhA6wtVQivIPJLSgJQpglayOYsUhAn7EUS+mq1hxd5w2QIm94vmaTBQmRpzKLZw0ANa0XgTbolOSSTLhHf3482ndH/YC1LVAFk5YXoe32GtFOum9eYZwhUGl7raMdV/SeweJwUrqhwxRx6nDoE4+qB7VQPZr8TaiDVG0dj6CZPyQfKIJpTPu5GH22UYXK8JDukC8o3UwgHoVujPTPUvAnZVVRZeRvpr4qJ90pSehvijVz7cYWsSwuQn6CT2YTe8udk+fmXM3p/guKprC7rDxXDKlDt4BcrhM09lyvNMfRSBClqhjVlCa2XoX078DLQwnX0bO5dL4AUuNJW2fGQieaj4WigTRj796OVG4NwR5MTfw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785c5ccb-2040-4dfe-4175-08d8663800b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 18:29:58.8902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0odwWII3bqc0fZ5R8fMa0L0yML7vKt5yxW25UTUVCV2H2buJDvv/A7IVJTGpbutELbU+BbDyF4vhI0F7xnSIPU2DOqA9PZow8NMSx0jptXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3947
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Thursday, October 1, 2020 11:16 AM
> To: Mark Brown <broonie@kernel.org>
> Cc: Ertman, David M <david.m.ertman@intel.com>; alsa-devel@alsa-
> project.org; tiwai@suse.de; pierre-louis.bossart@linux.intel.com; Sridhar=
an,
> Ranjani <ranjani.sridharan@intel.com>; jgg@nvidia.com; parav@nvidia.com
> Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-clien=
t
> support
>=20
> On Thu, Oct 01, 2020 at 05:03:16PM +0100, Mark Brown wrote:
> > On Thu, Oct 01, 2020 at 05:32:07PM +0200, Greg KH wrote:
> > > On Thu, Oct 01, 2020 at 03:40:19PM +0100, Mark Brown wrote:
> >
> > > > Right, so my concern is that as soon as we decide we want to pass s=
ome
> > > > resources or platform data through to one of the subdevices it need=
s to
> > > > move over into being a platform device and vice versa.  That feels =
like
> > > > something that's going to add to the mess for some of the uses.
> >
> > > There shouldn't be a need for resources or platform data to be passed
> > > that way as they are all "owned" by the parent device that creates
> > > these.
> >
> > > I don't want to see platform devices become children of real devices
> > > (like PCI and USB and others), which is the goal here.  platform devi=
ces
> > > are overloaded and abused enough as it is, let's not make it worse.
> >
> > How does this interact with the situation where someone makes a PCI
> > device that's basically a bunch of IPs glued together in a PCI memory
> > region (or similarly for other buses)?  The IPs all have distinct
> > memory regions and other resources like interrupt lines which makes the=
m
> > unsuitable for auxilliary devices as proposed, especially in cases wher=
e
> > there's more than one copy of the IP instantiated.  There's a bunch of
> > PCI MFDs in tree already of admittedly varying degrees of taste, and
> > MFDs on other buses also use the resource passing stuff.
>=20
> I would like to move those PCI MFDs away from that, and into this bus
> instead.
>=20
> If there needs to have a way to pass/share resources, great, let's add
> it, there's no objection from me.
>=20
> thanks,
>=20
> greg k-h

The sharing of information is done by having the parent driver declare
the ancillary_device as an element in a parent_struct that also contains a
pointer to the shared information.  This way, when the ancillary_driver
is probed, and a pointer to ancillary_device is passed, it can perform a
container_of on the ancillary_device and gain access to the shared data.

This keeps all requirements out of the ancillary bus code and it can be
as flexible as the implementer wants it to be.

-DaveE
