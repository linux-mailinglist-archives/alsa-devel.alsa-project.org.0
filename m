Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099792BA934
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 12:28:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC2916A5;
	Fri, 20 Nov 2020 12:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC2916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605871728;
	bh=4XKg5kM4SjDjB3fqfj28JC1J8VIs611rjTbN56oB8Fw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHFfbidYrDNSpSikZSoCe0s8E86+fKf5197gGs8lskmPpO9RMvOD+SrVVFK2nJ3OI
	 gcT7ij3qGDuKKTiJ4Os9PSPF5v4WOPX0qbUcou9yF9NfmutDYzc9N7vbZOXHI2nSAp
	 SLDTF7OFNCf2Ec6Jj9oCUPL2lcw/KNCc8V0IZw6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01ACCF8016D;
	Fri, 20 Nov 2020 12:27:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18CB9F8016C; Fri, 20 Nov 2020 12:27:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EE7FF80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 12:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EE7FF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="taY94s7q"
IronPort-SDR: i/daQbMkuvcogcQEau0+F3V8FVUYQIvS/Cdxg2OoaskScsjcO/Dr7Xj/zAb/YfDDI0I5fCQxiq
 zSxDPOOB2AsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="189558433"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="189558433"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 03:27:01 -0800
IronPort-SDR: eZO2NXxap/IcVF1Cj6+4N+RRxSvwQjRvh78ZhX+OeyY8pd8ey9YgLE3as1Tmm16RGGkpMZZzde
 kQ5Gtbre1NqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="342014756"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 20 Nov 2020 03:27:00 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 03:27:00 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 03:27:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Nov 2020 03:26:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 20 Nov 2020 03:26:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEs5SPpQ+TNU6ODZQjt1sfFMhu1yPBdCsp7ZWkhy3ld4xKdlXm9n9QEFVmMZGGAqpo0TIOytK5pirQzrh7Y3dS6CaWDeM5Hv6eOnx5PEBGUBMGtz1O88xwx27RYB20xk0VaapYoyRgjGnTCP+BOCe7MIsdmARZnuDOoG9fnMR7A/4DxBPyaLVW2ICjuSfCSh4VJRuoKgFhTL1EBntoNezB+iHarUKVPRo7HF8+9cV1ncOXjA1fGXKcKtuUG7TesiBjTGg/VM7G8GtXc6fE+uc0iUyyr2eua8m3Vgz6wLOYYZ++ktN7raiROaiVwUYwAGk3OC4n2znaaqOjKD4xXZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBiT0YVwavdy+CvGym7L8BkjEa0wXD04tvL/X0xt8zE=;
 b=oDHQHBn/6Sp70hqSto0tjFsxGeDmLOUSJOtVzvKHn8XI8WyCBSBjHycJo+9wKK7EfZEXYWYRcopyFaOEQYQW1x1eSdRWhhEbrRWIQTFjJsNS7ewCuQfSQEgFdkAt1TiBd/dEgPgC3x3QXy/XVzhNU4tzuGvCkctEJjnlrWAZymG3CXiVEawGKcV49IJjv8f/xfVni5yWqoVdDAqNB9DjSMTzrP/H7E51xz2SPPMOWSRAp+A52Wy7PNbDvzF4GZWa/34AU3I7ZNk22ELuHytq/IHy3XrFFejW0LwgmzfHgyJARwXnsUoYQ4/pqWryHJbGHIQWxKYIuzW+tthHj1vXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBiT0YVwavdy+CvGym7L8BkjEa0wXD04tvL/X0xt8zE=;
 b=taY94s7q8AKPHDDO70yK2DQu9YQ45pJvJWRWoytVKcAl0xY4+CYn3AYtwZRX9eZW9xXkGSH7/hr7+2cik0yktZ2yKQwNaK3fVvaxEEkOnemzckMdqwy/5JT/s34Qyn7bKQgUi2rKEjC4w7vvvgdRt3ti/Q38exmGZE6o1l3bu5U=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3147.namprd11.prod.outlook.com (2603:10b6:5:64::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Fri, 20 Nov 2020 11:26:39 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::b554:409e:1838:bcdb]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::b554:409e:1838:bcdb%7]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 11:26:39 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>
Subject: RE: [RFC] ASoC: max98373: don't access volatile registers in bias
 level off
Thread-Topic: [RFC] ASoC: max98373: don't access volatile registers in bias
 level off
Thread-Index: AQHWtwObwWrxFNByOE+NBK4BkmF7U6nPvGkAgADZ+4CAAEWcQA==
Date: Fri, 20 Nov 2020 11:26:39 +0000
Message-ID: <DM6PR11MB4074C256951C7BBDB45DD838FFFF0@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20201109135543.7862-1-yung-chuan.liao@linux.intel.com>
 <20201119165836.GG5554@sirena.org.uk> <20201120055847.GB2925@vkoul-mobl>
In-Reply-To: <20201120055847.GB2925@vkoul-mobl>
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
x-ms-office365-filtering-correlation-id: 94134de4-c617-42ea-f06d-08d88d472628
x-ms-traffictypediagnostic: DM6PR11MB3147:
x-microsoft-antispam-prvs: <DM6PR11MB31471F78686BDD264425EACCFFFF0@DM6PR11MB3147.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pnONDEf4rDiMQdZ0E9Jxa8NXI9QCCZZFFlwIuk3/2n2GrBN3mwanb/60Nb5Na0LVtgUwXju1N74+9cuLxsNNI/V8vWT5LOvQBjLh7eqOdQjtGjQnSV6GQb1rUo7O2GKsSta+XAeexzg+zgplFNBZvAX/wHuK0XXIjhmLWW2MHL341gW9oZ3ayKi2a/KB6eeW6p1ySW7cMD2/Z/Dh/GNW9PFwM01wiu1QldLVdvX/rNCsrYEK5IxoZp0Tudn5W4p8fCrzk9KG8h/28DZaNJjzzvp2ZV2LXrAfuYLc5zZBTknHXK944jSEgD2BDz/UFLQ2poFk7ooqQqN1hFURtsIlCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(66476007)(26005)(54906003)(186003)(316002)(83380400001)(52536014)(66446008)(64756008)(66556008)(53546011)(6506007)(5660300002)(76116006)(4326008)(66946007)(86362001)(2906002)(71200400001)(478600001)(8676002)(9686003)(55016002)(7696005)(8936002)(110136005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YqVEF+uH1+SJjeToIb6zjs5+CZgZ50i2BueCtjGBUwjoOzvIYOL9GWzKUffxBEScC0iNOVuiEznkmoYNnG+kDqas5lopnWMRGQNylOkfDiyhYapSo0X5uKZ78YONdcJxV9DWN5qlNa93NIxbGTtuWgFi4N1SxMxrIjQ1QToNC2nkhjY44W4nZSRqcOkVxwBRInigTYsPnI9XJepiE2513wCTD7cD5gTMQjX9ylGIWwrsSbAofeoVEh22e35Aznk2JgP2wlXZ3tvy7Yk3tRiDwf2SfhAn7xexWJfk1S/7JwTQirFRx9mmz7yC9f/4dMSh098VpwK+uvTX9131N4t+Jf/kJITAdQucMudrD5xYYC4R2CyJWe25IxYFIPZYjMX99nFYH7yjvSD66q1wTC9vX5OEHRDW0JdgFFQVg1t6wlwgOdXRWfhenu9o1yZ8jI/UXWanXuarpTtrvedLtYYQIuRQW7aX4valETtfDgbaEJV2YobKpUeLx2SSwWd/lV9YbIKvz7x/dtTIY2bYgr5Glsel1ajDur3/n/9U18hlqkl3vk+EwSYXkrNhFoYYCMnFXchtpQCCnTxg9BPywzggmaICFmbplhkx1JElo2rnFpMVNVo3SpvoxIZF5X+4RzdNtiu67U3+o8srfYI8sCuhvw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94134de4-c617-42ea-f06d-08d88d472628
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 11:26:39.4047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbIwKykkQERSs7WJY6DDKvJxhUR2NlPfMTWM0SfkX3CxvGoWPbLzoCUw2MrmiZee0QF3EYo7c6UjMnGRiVrMTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3147
X-OriginatorOrg: intel.com
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>
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
> Sent: Friday, November 20, 2020 1:59 PM
> To: Mark Brown <broonie@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>; tiwai@suse.de; alsa-
> devel@alsa-project.org; pierre-louis.bossart@linux.intel.com;
> ryans.lee@maximintegrated.com; kai.vehmanen@linux.intel.com; Liao, Bard
> <bard.liao@intel.com>
> Subject: Re: [RFC] ASoC: max98373: don't access volatile registers in bia=
s level
> off
>=20
> On 19-11-20, 16:58, Mark Brown wrote:
> > On Mon, Nov 09, 2020 at 09:55:43PM +0800, Bard Liao wrote:
> > > We will set regcache_cache_only true in suspend. As a result,
> > > regmap_read will return error when we try to read volatile registers =
in
> suspend.
> > > Besides, it doesn't make sense to read feedback data when codec is
> > > not active. To avoid the regmap_read error, this patch try to return
> > > a fake value when kcontrol _get is called in suspend.
> >
> > > However, the question is what is the "correct" behavior when we try
> > > to read a volatile register when cache only is set.
> > > 1. return an error code to signal codec is not available as what we
> > > have now.
> > > 2. return a fake value like what this patch do.
> > > 3. wake-up the codec and always return a valid value.
> >
> > This depends a bit on what the value is, if a value obtained by waking
> > the device up is likely to be useful and what userspace is likely to
> > do if it gets an error.
> >
> > > -SOC_SINGLE("ADC PVDD",
> MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0,
> > > 0xFF, 0), -SOC_SINGLE("ADC TEMP",
> > > MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0, 0xFF, 0),
> >
> > For things like voltage and temperature it seems like if we return
> > zero that's not much different from a userspace point of view than
> > returning an error, they're both clearly bad values so if userspace is
> > doing any kind of error checking based on looking at the values it's
> > likely to get upset by unexpected values - a clear indication that it
> > was the read that failed might be better than bogus data, stops
> > someone wondering why there's no power or the device is suddenly
> > freezing.  Or if it's important that we get a value for monitoring
> > purposes then waking the device up and reading a value might make more
> > sense though it'd burn power if done by some random ALSA UI on a
> > regular basis which wouldn't be desirable either, it'd be relatively sl=
ow too.
> >
> > Another option might be for the driver to cache the last value it got
> > when powering down, that way it can return something "sensible" even
> > if it's not up to date.
>=20
> That would be better IMO. Also, do consider the nature of data, the
> monitoring data should be useful only when audio is active, not sure if
> anyone would care to look at this data when codec is suspended...

Thanks Mark and Vinod
Obviously, return the last value is better then zero.

>=20
> > TBH I'd consider moving these to hwmon, it's possibly a bit more
> > idiomatic to have these there than in the ALSA API where things do
> > stuff like go through and read all the controls I think?  Not sure
> > that it'd be that much happier with values that are only
> > intermittently readable though so the underlying problem remains.

Indeed, the issue was reported when someone went through and read all the
controls. People are not happy to see errors.
Moving it to hwmon sounds reasonable to me, too. But it depends on how
userspace works. I don't know how userspace uses those controls or if
userspace needs those controls.
@Ryan what is your idea?

>=20
>=20
>=20
> --
> ~Vinod
