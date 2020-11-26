Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EBC2C5233
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 11:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A9C317C2;
	Thu, 26 Nov 2020 11:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A9C317C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606387156;
	bh=iA59gtYMo7j1TwbVEXLpix9gDTTpTvtPzaGwbJTCya8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVfaXT1DSxjnifgN9LfMgpUQVjnUUpR4iyVPQEcs5mejRNlJnyLy89T4wj1hZmnwZ
	 GKx2n/0kcZwf5Jzwfr+d003HcnTsMX7Z2sD6lPII4VobMbWR8CzAnmKLBu8s1hLhsW
	 wCpKw8UwAmv6VIXCAzRsa1J7rbb4L2bzUkJrb8T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08CE9F80159;
	Thu, 26 Nov 2020 11:37:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D423BF80165; Thu, 26 Nov 2020 11:37:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC1DBF80159
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 11:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC1DBF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Lyq2OXB0"
IronPort-SDR: V9rgxgCYfnpeah9CvLL11D/0xXPKkIw8sKViI2uEVPwVTVqIJjaEZEAyrVk6BOucxiynBnimFq
 hPu44i73W88g==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="168765090"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="168765090"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 02:37:24 -0800
IronPort-SDR: vZYu1acYexffJYDk2siC5Z6IfmC5yG3PVPgwTZPTt7UjVY2OqRWr5JBgla7y59ZYLZyqIkFISB
 mAFfInHMF4Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="371095909"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 26 Nov 2020 02:37:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Nov 2020 02:37:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 26 Nov 2020 02:37:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 26 Nov 2020 02:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1ezh/P7RDaucjr3dxQYpXd4iSfSH7BoVS/mDjhrx74zAvswD6VMmjNr9I3HwV5bQWgcSmQisMIeeESIQHdjfQFy96T/B24rfrWXGGbaega0AFgq6R5OfBw3JxERubbnjTyZ33xVn8bKQeeI7WrOhej6Kgh56uSvxne0EUNfOEhv+BJJF5Mbj42ZJgT3y1WWF6CnzIrXh7T9vIObJOgzdevXR0iqahxa5xDAvzzfNFsREpxAbieitPNgHCO+fRnVWOrx8BxVA7z+nW94EbBaMYTYxQb08cBM+JCSVonUzpDV+ZOcQTUMrn/QkzrfB8xEHq2XJrP2EPY7g7FK+4oRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8odoLg5wkL/Oxhu4yDIY01VOt3bRf53LNgOhCexz8o=;
 b=dq+2H0wa4mGjEG2ihb61lp0m/yYtFmOJrO7PDuxAHWtC67XQpf2aGBHKQ1XKPVc2ZMcZH6SMUUvw7GWoOAM9UpKAXvD7Z+zOsYxO+X4QYtGHIei3nnjDpN6jYunR/YNP+TA9FUl4MNOiJTIS9UGHCZpBzkheAyYWBf6Bj5SjgnMi3F9gqFB+jkBm8Jm8SMZon0UOY2qithNWB/PU2J9zdyPgf64QFWfUXugKx+7ceqjV7TFCXW8oBxAX2KTMCKyF8J9OcXLfvTj2q8Cpziv08TSEU5p79zNVpP+W1yopdTrFtvY8shZtqxzbKtf2bcUWavSDw1qPS2S3ZpQwP1y7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8odoLg5wkL/Oxhu4yDIY01VOt3bRf53LNgOhCexz8o=;
 b=Lyq2OXB0nQCnRGgy1WkMRwEJMscXjDCV7P9gncPPy5+q5Q0F2HqJ3tFTdl6RzM7dYbFUntJ3K7bFrbxt/J15FaGCj7svT2BdAJ20WtpgMc6Oalf90AYkF84wseq3jDStjMmbYbAuLz61HOEjYv4L9cvIUwEUgpxjdB1tmtixGOg=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM5PR1101MB2188.namprd11.prod.outlook.com (2603:10b6:4:53::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Thu, 26 Nov 2020 10:37:18 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::b554:409e:1838:bcdb]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::b554:409e:1838:bcdb%7]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 10:37:18 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH] regmap: sdw: add required header files
Thread-Topic: [PATCH] regmap: sdw: add required header files
Thread-Index: AQHWw46uDfGD/9r1zUi19sp3Nj9ncqnZ5KgAgABTxXA=
Date: Thu, 26 Nov 2020 10:37:18 +0000
Message-ID: <DM6PR11MB40744C8625B57C4348989CE2FFF90@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20201125130128.15952-1-yung-chuan.liao@linux.intel.com>
 <X78+hlJTgA3FdmxY@kroah.com>
In-Reply-To: <X78+hlJTgA3FdmxY@kroah.com>
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
x-ms-office365-filtering-correlation-id: 1a2e0912-ddf7-4d08-8a46-08d891f73fd4
x-ms-traffictypediagnostic: DM5PR1101MB2188:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2188F57181F1979AD228246AFFF90@DM5PR1101MB2188.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LWVtc//n5+3rc1mmymvm7GhOB/pisJPC3BTFRsywnq4GZHuvx24Y8RLygD+hC5ETKsLYA7TQu+Z2K+iYFcwetYdhNhYhUHVw3STK+SBNeCXRjPinmUhltg+aLhoiuUvimsc8PjEjgpBR4jnddsUM1e5PSGsuJzhmNlCXlkHxa5RQOiOrEOgx+fTJRCVlMiBbWf51QsopGmlWOGFRdd4bq9rvG+OgYXj5l4X1rY8K9L+e6TEa6pZCpsCBRZtfEyfZq8F+UCfbdcmMmYfTW+OJRMdsN2n5ublO7oQvXakCCw1JdHlNayeS3Pz4p0oLjvk/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(9686003)(316002)(7696005)(4326008)(54906003)(33656002)(26005)(53546011)(478600001)(66946007)(186003)(7416002)(66476007)(8936002)(76116006)(55016002)(110136005)(4744005)(64756008)(66446008)(6506007)(66556008)(71200400001)(2906002)(5660300002)(52536014)(8676002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?zMo1Khctzl5RJj7GLC0fpBsrW7/U5KvBpfJfO4sOX3N/30kZFGpK4W6m5Dvm?=
 =?us-ascii?Q?XeM7d2H3TfUk7n95MnaRiv1Ws05vR3YlVOTN0tSBTppjPiRRJKppHXLaJdUy?=
 =?us-ascii?Q?6hciPJ77vbEP4ic3RbwmxvGQpLNEadMPVMTumOG+gopb+bytCEoF/Ync9t2R?=
 =?us-ascii?Q?kakjM4TjI12Cv2dj1Cx1QrfbV9vAdlmh5tCG5dP4S2II94lK6hIfow6PK5jt?=
 =?us-ascii?Q?KS4n3tKVTf2yznHYfk21piuSyJhBE/ggNCa68ncPijZ6xBaKq5kCv2UfMBbG?=
 =?us-ascii?Q?W/H/CwbTXZSFXSKwV3CEWCGeih6uw5Fw5aH86m0OHsrk94FwT3cMDnJGiL+F?=
 =?us-ascii?Q?DDd2yrJVxajBvf34HY4TgHYtlIELKb4d2pS3fN/vaXJe9nmzhdpyQh9dWmHj?=
 =?us-ascii?Q?hcqT+NE1mmMrUjLKPzKdTZu0nRP+Q5sAREI6eK8qqRxmwqymVInnsXM2jGo+?=
 =?us-ascii?Q?Qg1Mo+RRjYd83ZgTVqnu8A32FOzYCpkGmNn/iq4r3iYr3b5lSOtos2gsBM1x?=
 =?us-ascii?Q?WPFOwzkbBJxeMfDUH7qHdX1yMqePs/Eo+z4J7Cwxde3f830IJ1cVxMX7d8W9?=
 =?us-ascii?Q?ga64RfI3+PcxiL9NTN/St5CThLnnkc6Pkt7qJSjMgMJGKqOqx5uCtRxOYL0r?=
 =?us-ascii?Q?U+HdO33mYbi9WwGlM4pKjR8KsYvxSoYs4RAoOBU1k/PKusEyk5/X6zwfKZH0?=
 =?us-ascii?Q?c/4ToNJu3R2C6t4O2DCwsADLGYnc0Si87yO1eRIyevQdFLDcvsDcL9TwtY8d?=
 =?us-ascii?Q?3rLztYZLF3ViOgce08u3RqZp7ouMYh1xUK2dAqSFtUwEI0vHot3TiJWj6DxV?=
 =?us-ascii?Q?EEcZJhnfuBU0m5h4QfzyLquKIIEK2ymnIBD+zgg1pu/zkwHxtz/b+yQEiRPm?=
 =?us-ascii?Q?B7ZJUkWBr5ktR3OmLzUNKCFgeXhY8Bky2Q+Jmy2YCivupEaCpq9rlYAGL8Vm?=
 =?us-ascii?Q?Et1XBpYs8znGIPV4RZvi4H7zl2JQ7e1VRfr+IgjISAI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2e0912-ddf7-4d08-8a46-08d891f73fd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 10:37:18.5858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMaHxuDsQ2hejEK88Ae2eyjb1MlbQB3P9IUjjJY+lmM/SJ9dCnlAH+16GwpoVIe+Y2OoYmhuJos6rm038xmUQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2188
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
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
> Sent: Thursday, November 26, 2020 1:35 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; vkoul@kernel.org; vinod.koul@linaro.org;
> linux-kernel@vger.kernel.org; tiwai@suse.de; broonie@kernel.org;
> jank@cadence.com; srinivas.kandagatla@linaro.org;
> rander.wang@linux.intel.com; ranjani.sridharan@linux.intel.com;
> hui.wang@canonical.com; pierre-louis.bossart@linux.intel.com; Kale, Sanyo=
g
> R <sanyog.r.kale@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH] regmap: sdw: add required header files
>=20
> On Wed, Nov 25, 2020 at 09:01:28PM +0800, Bard Liao wrote:
> > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >
> > Explicitly add header files used by regmap SoundWire support.
>=20
> What is failing to build without this?

I didn't see build errors. But, Documentation/process/submit-checklist.rst
says.
1) If you use a facility then #include the file that defines/declares
   that facility.  Don't depend on other header files pulling in ones
   that you use.

>=20
> thanks,
>=20
> greg k-h
