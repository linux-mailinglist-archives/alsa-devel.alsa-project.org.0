Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846A3D84CC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 02:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E88B11EF3;
	Wed, 28 Jul 2021 02:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E88B11EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627432838;
	bh=SXmOimALnqtTBQeyalZukiX5dYQpz2+d4ODvBL4ZPVo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZGhYIWs/hVnIXTAV6BbxftOx9ERfwnW/g7K9/s1THxcaiC5VU4eLVjB/jgOAoMx5
	 TfL0skHfPVyEbqBVD5S62X/CBFXClgXDDWXrk24WeSg8lYperwc03cXnO18hLaIQ4I
	 W9dxO+H+EPVAORPSHzaaPcBFQXs4WTQK4nGFGEgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E032F8026C;
	Wed, 28 Jul 2021 02:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7E4DF8026C; Wed, 28 Jul 2021 02:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A2BDF80212
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 02:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A2BDF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="OwcxLHfE"
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="192149260"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="192149260"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="665680980"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2021 17:38:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 17:38:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 17:38:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 17:38:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 17:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqdeD3OrTM/EAXdpAf5vwkCUk4szKPSsD79Ddca+offaLfa6b05KZo7uctf3wmbtezRF0BKAxJfYFPwvPb3dKixf7Tm/OWYgrKz9b/tz3TXExGO8d+39COkefiY8GIHN62IYtV9j2dSvk007rjKFFs0LUpyyejGJqx7rkvtAqQ0H11X7Cb5Eg41dl08jb1EGLG0zCY+nGo8pBeyIaDdA2IjN8nBbUbt0KJggPOBq8xcUOevFX3Ki5SOdMgIBI3UL532kbSc5a9CYAIGqUpZSMxUad1vhU2/KwV+TR4W+TvPH4eAI5N7ltfm5u1uWpkMQgzq7O+ck+SAOn+QnfPakLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve1bKR8bbfDSrVrLQJhB83Hssi/tm8Qy89LkEtbhAf0=;
 b=PGgTLPjJKNBm3Ym1Ouh9sqAY04WI/4ZknNJ/xUJgRhWVNbbYjad60NngzGOotZOSVCYxUoc5QK+RSeNALvGa9jzl5lqThLW2s+kYTnH8NjGJk+uY7VW5LT55zv4ma60Jd8uSL00HLhJzRZjtLOW/Zj/fwlf7nVjP2R4RIOpt1kMMsifIKMYLx9Lg1/thUcUd8Go7azn55gwXLO80KVsWp3tK1oPfesr0fjLXjl4gmgN9290/f6LaR5muroKLqWLzo+0Z1JxJkPtzkOOTpjbaCG+3W6g8fYL/m884jGVzEJE3hqu+lRGO1i9wvVc1M1aT5i+9t8aaTV4ZItdCQIzpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve1bKR8bbfDSrVrLQJhB83Hssi/tm8Qy89LkEtbhAf0=;
 b=OwcxLHfE/4MBW94sZ67YdY/rZT6mu5SrAoMAQEpuZes5dm/7h5K2KSBeq23Wok+a1JtYs5GKETuEnOQATF+UgpVw93WjYN5ZUmqO/FjhDURPF0H0O0Wx2Dg8mHha04vOG41Zlv1HLiUJ+dLz5CqXlJIHkE3/cCw30jMe7qZleec=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3705.namprd11.prod.outlook.com (2603:10b6:5:136::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Wed, 28 Jul 2021 00:38:01 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 00:38:01 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent bases
Thread-Topic: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent bases
Thread-Index: AQHXf7mVUlX1mcEYvUObS5Z6Q10WOqtXBK6AgACM/7A=
Date: Wed, 28 Jul 2021 00:38:01 +0000
Message-ID: <DM6PR11MB40744606D9CD2D3FD27FC92FFFEA9@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
 <20210727161133.GY4670@sirena.org.uk>
In-Reply-To: <20210727161133.GY4670@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eaa0e0aa-7450-4765-1a48-08d9515ff49b
x-ms-traffictypediagnostic: DM6PR11MB3705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3705D0D59D6DE98400BB5A24FFEA9@DM6PR11MB3705.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fvKpYdTB09xPUGLmxbHcVZzkrJFrwAtQYtIM39IIFvj9bpoTzMQ9l0whD8nKyzJvZQI+feMRyjyjFuNFz1Xf2cFQly6Zq504ymubHRkjhJmuaFf7230II1vHmwyNP0hoYGOvyQQPxn+e0uuV6UtJyM1owKTzFAkt+CSoEO5VKr9ngWs9QBWGkvHPe0OP+AIblL2vfWONLld/2u4wbMNgJelyhuvgKKwVxyhDuYchoJufFT7G1lwO4o5NJSvpXF2YCwEl6Oil8nPwFUMoJy7v19z83Gp+rOdZoavJMYDB6RNI65vxkaOQ/JB7YHhsNtiquE38TWVM0XOUXNeSRBBTXaRIf4hRasQERPCnW8Euy+T2RVN4FjSK5QZc9FoLw6nfSHZ0YQuVFZGrV1tglFvo39XxVnM0Jww/7TqgfI92K1H03clkNkZ4Udov6bf7CZg9CPlAIDA0r6s2UeZaJHCEmPp0phgIvQ5yksAqE0nd4ynIn/0NN/HkD6WhTqqzgc2pzm/mcfYTLgakZSM3KpszQl6bs//U7+l6GTtdqRXM6tzORpQRet40R7zm86MULDDmJpjNN3EaXBJQNPOYrvc40Y/QqVqgot4WxLfvUfEiw+gZOGx0jl2IYH6qdnRFlN1T2rHCY8M89B4l7u95JJFLVteJY0CWfCG742XXaLG6aZYxREw7yAXJf1HN6BGy8VCvBUHb/2kBt7g0bzLbQUoA/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(4326008)(4744005)(8676002)(8936002)(122000001)(38070700005)(38100700002)(478600001)(66446008)(66556008)(66946007)(76116006)(55016002)(316002)(110136005)(54906003)(9686003)(64756008)(66476007)(6506007)(53546011)(7696005)(186003)(86362001)(33656002)(2906002)(26005)(5660300002)(7416002)(52536014)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2GGW7vx+BjMRV3vIFoygU6zDp6oXXohRcZO8Xp4V4Bj9U4Gt+k4HOl+zjd1S?=
 =?us-ascii?Q?bVcHX1zYIk6XtQyhjHU3MintiUxzHZ8D5WEt+HsV0YuYB/+f6YrRsPGR/QzI?=
 =?us-ascii?Q?9nOnFMy7igFN7BNRH7rtS6RaCYmIRBDgCQ5Hhbs/oHEQaQyBJxP90JA1gUUW?=
 =?us-ascii?Q?vC6QtZLL5tmd7ZruaujvJF7EeoZz/lniYAxri7Vi71+XZUpXd/7oivVQCqLw?=
 =?us-ascii?Q?WYRpbdgftKXNC1m6K09ZSWLY9ejqh7pBnPKSNp6y65yZ5RXsFKwW08TMSb0t?=
 =?us-ascii?Q?8kHLXLzmb0UVg9rmaJAbPDJn0fbKfE7xsri4QN7FXokZBGd9z8cw2d9XKVMU?=
 =?us-ascii?Q?y+JazwTStPk2FwI6dCfxcn9jyxUQ5liVw5uCY20GIG5DKpOH7FcKHAt4JZIF?=
 =?us-ascii?Q?lVB5Ou8oSbAR5OXBsn26yXAOf/RID1wN+zG0nhJx4GCcDC8jVd8o7nTT/KwJ?=
 =?us-ascii?Q?YuS8smrv5FGOJnJ1iRdOn9sK6vNOKKDwb/8wVc56qcP9KP9+yDWUzcc+kP2P?=
 =?us-ascii?Q?tevo2ZqIoFn38jiNQ2qQK9lRtNdL9v4pAsHDQD1XBaklMXllSZIdwclnbicE?=
 =?us-ascii?Q?azM8zGWxZvL2y19vNGvT/4ZBtdjvE4NB9q7ySsfFAg2eMLO7MEmNyFgOi1yW?=
 =?us-ascii?Q?GOknFIhSy4MjhjpiU0elOvVEeMU4FVaOY3ADx9q1N8ChldodRd9RivuDj5K4?=
 =?us-ascii?Q?j6P09j1/FB95qDMYAGI/bwINNGXOYFOgNnvyTTOXcI1u7IzUDJozJdp+JzXI?=
 =?us-ascii?Q?fYW41Awdy7UDhFhJa389Vcy45ZrRELqj8r3V/nHkRp+5epw0WTuyI5b2V55U?=
 =?us-ascii?Q?m0bgYUxNDZr1FY44NR1xdeahXKQZZKOK482AbAjvsb5Sx6pt+K7fE3V2W68S?=
 =?us-ascii?Q?RzJj+l8sJImugm62E3bbMuZ2OKy7B8noeKn2BdEPta6hxxVpsZPqySqOqchi?=
 =?us-ascii?Q?YSpfOUhtDVdk6oH9jnaQke8/AeMtGJuX75o2vtwgoimbqB45LVhHqf4W94U2?=
 =?us-ascii?Q?w7kdwEa+ocajcw+Ub3qsTUo62kbf39P3A96uiCxCrLJngWmrUX+uqktLOzkb?=
 =?us-ascii?Q?j9nDUpgs6m759LlqY/sSFwDCVc8wKerrEZEz1G4RMGZGzs9KOMPcr815SjSY?=
 =?us-ascii?Q?h+8ZuBSdcqR+dG4mCsMDx1O0Q/C9VHNnPp7bF6HdxeWgCRBvWDdP6q899JmK?=
 =?us-ascii?Q?4k0TuASL8jEjym+n8iuHSq9w6kgiN+AV3eKSXfDxPmeGmL7VeAIgvNi3/GiG?=
 =?us-ascii?Q?xVwBhumkqQscJLDmBZZzMMl0SnqwKeQm050HTsVJFKLOmXl1haxOQ4qpshfI?=
 =?us-ascii?Q?lZo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa0e0aa-7450-4765-1a48-08d9515ff49b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 00:38:01.6344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3QXltzUsCjoo8g7qYc33iPX832oo5xzQ+VDAwze+q9GR7x/mlxFsCdIwu0bxnYRT2axSj55NKjU1hyK6LMrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3705
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>
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
> Sent: Wednesday, July 28, 2021 12:12 AM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; vkoul@kernel.org; vinod.koul@linaro.org;
> linux-kernel@vger.kernel.org; tiwai@suse.de; gregkh@linuxfoundation.org;
> srinivas.kandagatla@linaro.org; pierre-louis.bossart@linux.intel.com; Kal=
e,
> Sanyog R <sanyog.r.kale@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent
> bases
>=20
> On Fri, Jul 23, 2021 at 07:54:45PM +0800, Bard Liao wrote:
> > shim base and alh base are platform-dependent. This series suggests to
> > use variables for those bases. It allows us to use different bases for
> > new platforms.
>=20
> The ASoC bits look fine to me, what't eh plan for merging this?  I can ap=
ply to
> ASoC if people like, or should the Soundwire bits go via the Soundwire tr=
ee?

Thanks Mark. Apply to ASoC or Soundwire are both fine to me.
