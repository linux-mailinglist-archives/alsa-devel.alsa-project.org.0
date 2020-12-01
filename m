Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F82C9563
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 03:45:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290AE1757;
	Tue,  1 Dec 2020 03:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290AE1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606790724;
	bh=ZHZ49CsAxA9IUEIQkz3nPTLSa3hRHAwKaFYOZeCVw0k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPcNSQa0Pj+SGtkPZvJQ3g4y1E4+97wzsCidgOIACfJ9R/rsgfSWMdNw7iTEvCDk+
	 118aKAEsjqR4qyFTSqp4z2Zq+EIhGiAA3q+CtrYqD6NJaCPBqRXA7e4hYOOlL8k0Xc
	 oybNdv60nStCHXiXLxUTP54dotK/BMHSit63TI9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B7BF80139;
	Tue,  1 Dec 2020 03:43:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB53DF8016C; Tue,  1 Dec 2020 03:43:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D125BF80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 03:43:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D125BF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="n+JwU8O0"
IronPort-SDR: 4FFMybhJmd5bE0Z6GBaSAtZsW33riC2FuM8gNQEX1lIPO59ZnOdxK13tEP+cTxtb56Q4Sea7BI
 IuTcUGxiqkbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="152582123"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="152582123"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 18:43:35 -0800
IronPort-SDR: Y1AFoFb8krMbbNbQEgnoyLqtpeFSYHZ2nHjEGJcaIFIygH0mW+eZ4D5IFt0//QpOn6Uvgf/A13
 fdxXvrVLBESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="549363506"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2020 18:43:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 18:43:09 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 18:43:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 18:43:00 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 18:42:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWzKRZHrEO0WBZmzKDBKtnyIYNV0vOzgmZxnQysRjugjgIPfNzlNu+89Fd2mLZrzuejNviv2wkws0r89tEKgASQe7MizLL+Y0Q+lhJrqr3Ggkk124RcV1VqEeN/qs3xBy8pcPdunN91ixHcfA6JCSDw3ZGehWYX3yLZrCJdUx5js0JtqFCVxv70snd26eI4JYTQWTwV+XISPUPAyRwcvE+w631Tz4PJ/SxRJ+1SuzslLI4DNLMGYl+EamVInH6SjzHpm8D41g5ne3waikGAXH5wLMpcxJK1s860VbBmR5o7RBuX3ERpcnPR+iHGfVllOtmX97dZckj9oqOpodlk68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VBRM8FzXcGIDPlsuIlB2pzeGxoo/kYBbm+d4l0Kv4Q=;
 b=cDNmEGTzIBSZkmruPCetqpOZRPv1hAm68je2NHMQHiImL6dwp4mrFc1XeoRGwVzxqZBqZosxCCKAp8+1tS+OSW3s+BO3FzdDo2gk0eRTqZOBa6CFwGEfwZewQ+6594hbQkCnRon4g8K20uQqCA/GNe4tmLVAmHr9f8M5UZ2d3HYTLnKtQ1bu8ZFt0qjcs/+lu4oKtOeQhnj+9RvC0h3mHqmEyQwMMB+pl5xtpHcSv7tLGPqG810EPkYSRvQjoo1q6TPsXpFZ7ZaFwXO2xqkPpaf8nr7oDZF+nwy4r2t8ME9Xb2OGiDDK2gr6X0S8I3dMRCLXIbc55lBoovHv44v7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VBRM8FzXcGIDPlsuIlB2pzeGxoo/kYBbm+d4l0Kv4Q=;
 b=n+JwU8O00MJMnvlZQmhEAckhHMeXuju/qo0ADS8WOF77t6/ruyZFmcEJ8NFnIh8hQCBik19p8Zk/8b8ML2PrgK2RZDyrEL8HVd2/CClMfsBUcURVSSBW3LOV+7VNNS6zg5ehFheiPKp3AM7ihFigo7jjZi99EHybA/kwZayEMcY=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Tue, 1 Dec 2020 02:42:52 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8941:7045:2dc8:707e]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8941:7045:2dc8:707e%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 02:42:52 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "vkoul@kernel.org" <vkoul@kernel.org>
Subject: RE: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Thread-Topic: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Thread-Index: AQHWx4pQDnpV+A2n6kyb1b68GB2Tu6nhheRg
Date: Tue, 1 Dec 2020 02:42:52 +0000
Message-ID: <DM6PR11MB4074311B4E0B70F24383E754FFF40@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
In-Reply-To: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe78de2-3ead-440c-f9ee-08d895a2cc8d
x-ms-traffictypediagnostic: DM6PR11MB4202:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB420275CE2A952060E5795E90FFF40@DM6PR11MB4202.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jRWQu40qSO/lC3xgXhIogzllY1AFGFB5f2OIf2BIVAZudTn8VxJBQRxYvcB7Fz+B5BB1MPScfx6QKxgH85XF5rhntZBniRqAmX3JcD2dWtRF1P5Rknrjk4VwGFJvgJxAPRh1Bo/idBSlpjRnYUOoCIdU3l+sD4SHJIB3s7MsW22ZeA3ZJhIfTK+51BadKtYNhF9uIz1jrbjGqVLRzXjVn2E73LtWIiMg0VPsC8PfMNrEhQxGd0jMC2Bfpl/kI3kbPWM+r0Y+ColMsOkHL+gulzp3Yw+GbhohKA+cXBuVY89x5iu1k1Y/mIU5SHfTpgDZfpixHFrQYwfXP17eRPl3bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6506007)(2906002)(54906003)(53546011)(8936002)(7416002)(186003)(66556008)(110136005)(7696005)(71200400001)(5660300002)(83380400001)(26005)(478600001)(86362001)(55016002)(64756008)(8676002)(52536014)(9686003)(76116006)(66446008)(66946007)(66476007)(33656002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HCFwAWa2vvR7WeAPGqdOJB9DXvoZAdqg45Izdt0Lx8iZ1Ai1DnLMtjarmO79?=
 =?us-ascii?Q?+6BQbmW0ju/01RE7/AbS+pdyOR180kH6rMLobqF5MHOXb8GYbQ77aqOge2sx?=
 =?us-ascii?Q?lg6NxY8H1OgON6nAf5cvBNR+T54FWWAoJSsU8FUwnfv7fw6DC5T9LmJ+4IK0?=
 =?us-ascii?Q?7F8fEcamFoWiDJBOWezgmuW+WlP0lk+raeG2y5570YserNqc9MDNNAc6UDv9?=
 =?us-ascii?Q?OnmWM6vHG6aF8EOFxBzMMZ2XiuDgw3tEvm/dYi2CrwatpFC7H08PwPgjzHE/?=
 =?us-ascii?Q?+mlA4LDh9kprOy+6dSyWVjGaIWrCzL0wVSdmLL07q/iOs/u/30Opj40E4uco?=
 =?us-ascii?Q?4lrXUwWj07RnEUrB9Rr3i7JgGqCP9GHfNVcNODFQJRWdq9S3gYCIs8z1LouT?=
 =?us-ascii?Q?5ZnS3m6L18VTxXZKyJ0TWfVjA/miqkuas7bc4NPBGFvxUTbK/DKViuc8vNKo?=
 =?us-ascii?Q?7SUoB0boQlZxe3FY4aaXpygR2icSf9ebj/+w57tS02Mx8NfUbGMhVNSuzE6L?=
 =?us-ascii?Q?myR//qowP7HRL0E0bcGnarLCnFIobQqfFfTnoDqzQljObKIbgcyD3wwT4iwg?=
 =?us-ascii?Q?Yh+2P9qEleQCdeaIqffb2E8qSp+gwIupXf8R0Tnf/2LX6xtMutZLt4WdjCaM?=
 =?us-ascii?Q?PDU8skbGUbYmbagG77DNdbL/49D7dw611aKgntuvGuCEh0vW3GaOGvOyjdLH?=
 =?us-ascii?Q?xzsyg9+5p7oUBtrGuXMCALpDHFMjdOZPVdBMz5su50xOSSP81KaGoVdc6pyP?=
 =?us-ascii?Q?7lg3K0YLVpQ1WdQfwjU/voDx2nUanYgC5NBO/475k3+jQobKrMqx8NJoH9qa?=
 =?us-ascii?Q?ShklKv+Vk29pDB3VC08chTXubA76H2PXjoAMcSoG75EUy2VrYN0PfIWtAA9v?=
 =?us-ascii?Q?VCfmhSY4JB0yd1feu6Z3IxXDSRjhbGKjZEBVWrS+/pTtaB9nyfYO7IZI0dJO?=
 =?us-ascii?Q?Lth2CRtA7I9CAF0L6VZVYGQyXR4x2UR01oXvd2XB0z4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe78de2-3ead-440c-f9ee-08d895a2cc8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 02:42:52.1202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBGUKcjuVTHu0X4wztV7XnpTegH1GiqyibAHQqX2J2UGscaFSY1K/6sxPHesXPkG17VpWMaBNE47wtyjS4+c0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4202
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
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
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> Sent: Monday, November 30, 2020 10:40 PM
> To: alsa-devel@alsa-project.org; vkoul@kernel.org
> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org; tiwai@suse.de;
> broonie@kernel.org; gregkh@linuxfoundation.org; jank@cadence.com;
> srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>;
> Liao, Bard <bard.liao@intel.com>
> Subject: [PATCH v2 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA
> support
>=20
> The MIPI SoundWire Device Class standard will define audio functionality
> beyond the scope of the existing SoundWire 1.2 standard, which is limited=
 to
> the bus and interface.
>=20
> The description is inspired by the USB Audio Class, with "functions",
> "entities", "control selectors", "audio clusters". The main difference wi=
th the
> USB Audio class is that the devices are typically on a motherboard and
> descriptors stored in platform firmware instead of being retrieved from t=
he
> device.
>=20
> The current set of devices managed in this patchset are conformant with t=
he
> SDCA 0.6 specification and require dedicated drivers since the descriptor=
s
> and platform firmware specification is not complete at this time. They do
> however rely on the hierarchical addressing required by the SDCA standard=
.
> Future devices conformant with SDCA 1.0 should rely on a class driver.
>=20
> This series adds support for the hierarchical SDCA addressing and extends
> regmap. It then provides 3 codecs for RT711-sdca headset codec, RT1316
> amplifier and RT715-scda microphone codec.
>=20
> Note that the release of this code before the formal adoption of the SDCA
> 1.0 specification was formally endorsed by the MIPI Board to make sure
> there is no delay for Linux-based support of this specification.
>=20
> v2:
> - rt715-sdca: Use rt715_sdca prefix to avoid compiling issue.
> - rt715-sdca: Merge multiple mute/volume operation into single
> mute/volume
>   operation
> - rt711-sdca: Initial ret =3D 0 as it could be used uninitialized.
>=20
> Jack Yu (1):
>   ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sdca codec
>     driver
>=20
> Pierre-Louis Bossart (2):
>   soundwire: SDCA: add helper macro to access controls
>   regmap/SoundWire: sdw: add support for SoundWire 1.2 MBQ
>=20
> Shuming Fan (2):
>   ASoC/SoundWire: rt1316: Add RT1316 SDCA vendor-specific driver
>   ASoC/SoundWire: rt711-sdca: Add RT711 SDCA vendor-specific driver
>=20

Hi Vinod/Mark,

Could we take this series into Vinod's tree with Mark's Acked-by?
It failed to build on Mark's tree.

>=20
> --
> 2.17.1

