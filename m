Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C82036392F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 03:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C03C1684;
	Mon, 19 Apr 2021 03:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C03C1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618796914;
	bh=Rgj9vQC0MJYIqWO96MOw0FpuBlXhy4lnN6K+t4V3scQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nORBYEyneqgFow1ThOX4X0w/98RovCGCFc484qpJzlL5FdOf7Gv0D66IhDvfJRInW
	 CPjEHxqnHa7uOaVNa148CRWrtrDudeowL4K+tacSA6mT3mENZOTlYtL19F1FzvgVHt
	 KQI3lq9T+t4t02jOPV6xwRzKJq4WKllLC572hmwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C34F80256;
	Mon, 19 Apr 2021 03:47:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F9D1F80227; Mon, 19 Apr 2021 03:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FA53F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 03:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FA53F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="zvUQ7wj1"
IronPort-SDR: qVJVFXhQ3HPLQ5hTL/lPlRBTWYkoB2pCeYexdLfvsFxWIRva4eKZfRcMhDuRa2K1/qte6LGAlD
 6TLB4g9qv7Ow==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="182386352"
X-IronPort-AV: E=Sophos;i="5.82,232,1613462400"; d="scan'208";a="182386352"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 18:46:48 -0700
IronPort-SDR: +/DaflWthXeminBbpHZc18MB6uO7L2f7lWBEy9CvcxEptzdIJrG17/abczFaydvDftRTJMrKGe
 D6zRditxnShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,232,1613462400"; d="scan'208";a="383582676"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 18 Apr 2021 18:46:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 18 Apr 2021 18:46:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 18 Apr 2021 18:46:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 18 Apr 2021 18:46:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 18 Apr 2021 18:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmqgn/eor3rnWGWQ6CqVxe58DL7GD3V7kX7+Sbfow/HuVjIK1D3YV9aCAb6xhci6URWDO/xbEPhSiBEjUBnDHZLQI+AKPEmxf3Lpx9rUI1Y/UEU3ahsdXjGrD9Vmha7yezfqpikwj8zUmXxyuqDmMnK0VRCTt/KEML/3scAE3jJFljVFYm6QE4H0P1op5IbKn7k0G9IrT1IG35PwpPQ1SO7QFz1zWhBEOdbEr3OSOrI/zJp3aKlQ3U6T5/oCU8C9aX+rd4SkPxLjg6WDVumBcdaIoXvy34f2IbvIk4QG6BelMuxn8VbozygeIec64Expy8B3HG2F1jhRgCRwVaUPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgj9vQC0MJYIqWO96MOw0FpuBlXhy4lnN6K+t4V3scQ=;
 b=fsh2hUMOQsRCtJ5+htnyLWblRTbjweJH2FoOZHeWMjX+480QyVJNdBJ1E0lFJW3KSwbHwYgqQ/2XkgxynP4FW7edY4sbjArl2f090f8fZK5nnmY+bZV8RJijAU3cJt8ArVAe3+V4RI9diVbcB17d+YmqLRQldVxd1Rm9kmyXfGEfx3zS5YKpOEvOJv/EdQIX3SMqmh/sMl+j5vpyBQhUt7VBrIpU7mm5bQ5e+xMWERaXPBuOIg5ZJUbfN7eE+D1Q/bdxHzQlz/PAqhvb1Zq2gdiqh0D2XNCBSlxJzRCEhGzHkxehLoK8OtMio3nNDyI7WUi9IGkv3kfJRcpWgudc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rgj9vQC0MJYIqWO96MOw0FpuBlXhy4lnN6K+t4V3scQ=;
 b=zvUQ7wj1mTYDito7onUQps4t8FlSfT5vtxSzAQ4y9xDvhMgiicun/klT9mUvM6zUJbcROc7CvNZsWihgKjC4kDH7z3fb86gO8F+Wn0Pwpk5omrCRDn2BWHB/uZ+DkgF+tQkqeAAkRrQ9cLBGXwxGCmPOzrI0R7kmiRGBwS7KDz8=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Mon, 19 Apr 2021 01:46:46 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::61cb:a6f6:9afb:f8c9]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::61cb:a6f6:9afb:f8c9%4]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 01:46:46 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul
 <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH] soundwire: add slave device to linked list after
 device_register()
Thread-Topic: [PATCH] soundwire: add slave device to linked list after
 device_register()
Thread-Index: AQHXH4vWr6CUV9BToEGatETvWC/ba6qRJJcAgADBjwCAKVV6UA==
Date: Mon, 19 Apr 2021 01:46:46 +0000
Message-ID: <DM6PR11MB4074389B63D3CB3B396838DBFF499@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20210323022529.21915-1-yung-chuan.liao@linux.intel.com>
 <YFmRcPUxxFxkuMkr@vkoul-mobl.Dlink>
 <82d579ca-5021-341c-1fcd-5c85c54c637b@linux.intel.com>
In-Reply-To: <82d579ca-5021-341c-1fcd-5c85c54c637b@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: d8745b13-7061-4b54-468e-08d902d4fdef
x-ms-traffictypediagnostic: DM4PR11MB5390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB5390B00134436382005FBF64FF499@DM4PR11MB5390.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jdum+QH4A0nUo3dxk35I9f8uBDP16Hvpz9C//A6g7eIW/BKo/Lw5qqjYNvuNcNAp2bjXN7HZITxSrsM1wM6iKNHCFITnL12XPrwyDnkXSYK7l8lChAjX1NDF/OqF5N4213kFkNr8R5Abm38mupW/GHXvQQUel5qMWLPdaWaAvCK2I0WXBt+u18km5zgKALnKKeE+43nuE9T8E0NL8vJkb6AvpaE1LHsrp428eTL/6TUaOTWFPovTqXKYzNW0LDPOLQ1CHHNN4Bw8gk4MkYN4SQPB2VR3KSo026j4qR14mpuURtVVEUN4Agbsa/gnHxiAeAaIrdFT8EJUbndHZ9RfhEvhzs8+BEOlFHcMg3r4wRdNIi3M4GLKRqzR8lmoBxm5DHCbAvCX8quATVgLRiiiZzr1OYfPm6M/fHOuTkvtpVd8YYOmi3sir16Ae7Wpkr3TDqTgbrywLdvCTOXOxYcUpuOcZJNSYYivHWN2+fgmkmgS3yz2j1csNQJGDiaMJpunQjgyGM4t7OrpAhJe4MxlOELDhVeupRdOfmExU/KkZ0pU7ys/imdBOlxs74+mrvJuROw4LeARKBojUvu/fjjLYCcOe2uzmMozY4AttqQkygs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(64756008)(66946007)(66556008)(66476007)(66446008)(33656002)(5660300002)(38100700002)(122000001)(86362001)(52536014)(186003)(76116006)(55016002)(9686003)(71200400001)(316002)(54906003)(8936002)(8676002)(83380400001)(110136005)(7696005)(2906002)(26005)(6506007)(478600001)(53546011)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NEl4VmJOZ3R0WWIxTTBmQlBxc1VtV0wvSWgxYTBTbmJpV2RQcExvOFFYR2Jk?=
 =?utf-8?B?N1lMZHY2K3B4WVdaOEpVNWQyb05UU3lXMjl6YytYclI2MldLVGZncitSTS82?=
 =?utf-8?B?Wm16OEhKeVNrVEpwQm41QTFtMTlJU29heWlBOE5uY0V5Tjk1dnY4cHh1NVI1?=
 =?utf-8?B?dStwMjgrZlFNMTJqcWh4TUNpK1FITHFhVVNnTy9TWEZ6Sk1xclpzR2FkZmJC?=
 =?utf-8?B?cmZKR0hUTUIwUVN4MUkzZ2c0SnU0REhHTEJUaHVrcjFzVFJwdENDcXNtWVFY?=
 =?utf-8?B?SVJXRXYrNm4wZEVUMUVOUUxSVDlDalpSTVZHM0l2bXVnS0lhVWhyVHFOSmZS?=
 =?utf-8?B?VHcrOWs5MFhHK01oQlFTa2l5VmdrYmVTLzNmNVVNQWdJSEtFQlNFU1Nka25D?=
 =?utf-8?B?emtpZmZqREtIcHR3VjNaTnYzL21wRGRYQ2QxUi9tVCtiOG5aZ2FoNzlQekNa?=
 =?utf-8?B?WHRJYmdZa0h6WjZya29nck11V3pmUjBPZU5YWndWN2VPeituZDc0c2o2Q0pr?=
 =?utf-8?B?YkN6ZVFsVGJzaVBEanhZLzFsOUFNanFJbCtCM0Z5NExDaGVtZ01DTlN6cnV5?=
 =?utf-8?B?MHJmOWM5QjBjV0J2Nk9wQTRqaVBGeEs1Y2tjeTE5eVVHRmZRMWsyazgxaEJ5?=
 =?utf-8?B?MWozTStYL3dvdGx2dGs5Q1ZaTnRkYmlDZGkyWHAvcDFzUXRHdFBSZ3h3cWVU?=
 =?utf-8?B?dkNXbDQ3Qk9GVjhOMzFub0FVWjNvVG11Z1NRTXJ1WkdMZTlwclVwOTZ3RlZI?=
 =?utf-8?B?MU4rN3VmMGFMMkhHWXlEcnRHS3IxWjB2V0ZFaWs3alg5dkxnUXFpU203R2cw?=
 =?utf-8?B?WjFjSDlsQmJ2R3k0MXFra01NZUNkTzB2MXIwWGRFZGdHdjZRNStKWTA2R0d1?=
 =?utf-8?B?c0k4dlA4MGVOSFpHbFBBQ0hreU1Bc1FtN3ZLUGwvWHpmeklkRlYxQUIzK1Nv?=
 =?utf-8?B?TlMySjZ1Y29ZbFlMcmdQbFluNHpzN2UwZUgvMEJ4d1o5QmJnbm11cFZvdVJa?=
 =?utf-8?B?VTdBMkZKNUlja1F0elhQTDRrN0s3dkpJSlN1WVpCWUNldWtoeHNUYk5qZFYw?=
 =?utf-8?B?a3BIb1Z5aWtTV1BmRnB5VGJRQUJ6ekdkRWJhcEhjeWI3WlVmbHZvdWd6NkY4?=
 =?utf-8?B?NW40T1lVNk9VRWpsNUZTS2FNVStDNXdOQ1QrWDE4ZEJDLy9NbzZYWnhac3h2?=
 =?utf-8?B?L0w3WTNudkhkQjdDVFE0SWZYajdCRi96cm8rbWx6REU0NzNWMm40NzRFQXZz?=
 =?utf-8?B?eDVDSjNhZk8rZFpZMmxjOUI2OTFSQTNOY2V5ZEx3bEpOTTNRMFNpNXc5aG0z?=
 =?utf-8?B?VE44RjhQVmgyVEY1cVRVZ3FuMHN1YnkwTXZ5ZHhMamxBSW5VK3BuUU1xTllG?=
 =?utf-8?B?QVdlMGpDK0pVOU9CNDFXbWIzSjgxcGRiRDY0MklVTUFlblRHNEFHQVRjQ2dN?=
 =?utf-8?B?cHVwczBUdlpjNDYzTmxPdjBiSDRhUUVmbVJRalh3QXRaOFlMWFBEbHZpK0sz?=
 =?utf-8?B?RkhKUnB6eWd3ZlljejFtLyt0S2pCYjFIbDBCK0tWOUxTOEprZjE3Q0l2RWVE?=
 =?utf-8?B?YTV2bS9CZWE3bzI2bCtJZXdsYnhZRVUzOWVrQmxTcUpZa28wRXNVK3g3WjJ3?=
 =?utf-8?B?dmFldmtPelJiekdZdThDd0tlS2lWOURmaUVSRHlhcDNnbHU1Y1RMMFFabW5D?=
 =?utf-8?B?OUJkNzUva1g5T09sM0tBbUpwQlEyU3ZlVVNwejBDVDlhYjUxYVBlSkFncmkw?=
 =?utf-8?Q?g5i4wQHE3PQhGpQhwo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8745b13-7061-4b54-468e-08d902d4fdef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 01:46:46.4915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAIGV6L/X/OPm+rfbCqYzAK00hlaKtIOgYCSRkQwGn5fQu52535nnt4Y+GeR5F4MdLYxul6USj9/76zejX9zNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>, "Kale, 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE1hcmNoIDI0LCAyMDIxIDI6MzEgQU0NCj4gVG86IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5l
bC5vcmc+OyBCYXJkIExpYW8gPHl1bmctDQo+IGNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPg0K
PiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGh1aS53YW5nQGNhbm9uaWNh
bC5jb207DQo+IHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZzsgS2FsZSwgU2FueW9nIFIg
PHNhbnlvZy5yLmthbGVAaW50ZWwuY29tPjsNCj4gcmFuZGVyLndhbmdAbGludXguaW50ZWwuY29t
OyBMaWFvLCBCYXJkIDxiYXJkLmxpYW9AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBzb3VuZHdpcmU6IGFkZCBzbGF2ZSBkZXZpY2UgdG8gbGlua2VkIGxpc3QgYWZ0ZXINCj4gZGV2
aWNlX3JlZ2lzdGVyKCkNCj4gDQo+IEhpIFZpbm9kLA0KPiANCj4gPj4gV2UgY3VycmVudGx5IGFk
ZCB0aGUgc2xhdmUgZGV2aWNlIHRvIGEgbGlua2VkIGxpc3QgYmVmb3JlDQo+ID4+IGRldmljZV9y
ZWdpc3RlcigpLCBhbmQgdGhlbiByZW1vdmUgaXQgaWYgZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbHMu
DQo+ID4+DQo+ID4+IEl0J3Mgbm90IGNsZWFyIHdoeSB0aGlzIHNlcXVlbmNlIHdhcyBuZWNlc3Nh
cnksIHRoaXMgcGF0Y2ggbW92ZXMgdGhlDQo+ID4+IGxpbmtlZCBsaXN0IG1hbmFnZW1lbnQgdG8g
YWZ0ZXIgdGhlIGRldmljZV9yZWdpc3RlcigpLg0KPiA+DQo+ID4gTWF5YmUgYWRkIGEgY29tbWVu
dCA6LSkNCj4gPg0KPiA+IFRoZSByZWFzb24gaGVyZSBpcyB0aGF0IGJlZm9yZSBjYWxsaW5nIGRl
dmljZV9yZWdpc3RlcigpIHdlIG5lZWQgdG8gYmUNCj4gPiByZWFkeSBhbmQgY29tcGxldGVseSBp
bml0aWFsaXplZC4gZGV2aWNlX3JlZ2lzdGVyIGlzIGFic29sdXRlbHkgdGhlDQo+ID4gbGFzdCBz
dGVwIGluIHRoZSBmbG93LCBhbHdheXMuDQo+ID4NCj4gPiBUaGUgcHJvYmUgb2YgdGhlIGRldmlj
ZSBjYW4gaGFwcGVuIGFuZCBiZWZvcmUgeW91IGdldCBhIGNoYW5jZSB0byBhZGQNCj4gPiB0byBs
aXN0LCBtYW55IG51bWJlciBvZiB0aGluZ3MgY2FuIGhhcHBlbi4uIFNvIGFkZGluZyBhZnRlciBp
cyBub3QgYQ0KPiA+IHZlcnkgZ29vZCBpZGVhIDopDQo+IA0KPiBDYW4geW91IGRlc2NyaWJlIHRo
YXQgJ21hbnkgbnVtYmVyIG9mIHRoaW5ncycgaW4gdGhlIFNvdW5kV2lyZSBjb250ZXh0Pw0KPiAN
Cj4gV2hpbGUgeW91IGFyZSBjb3JyZWN0IGluIGdlbmVyYWwgb24gdGhlIHVzZSBvZiBkZXZpY2Vf
cmVnaXN0ZXIoKSwgaW4gdGhpcyBzcGVjaWZpYw0KPiBjYXNlIHRoZSBkZXZpY2UgcmVnaXN0cmF0
aW9uIGFuZCB0aGUgcG9zc2libGUgU2xhdmUgZHJpdmVyIHByb2JlIGlmIHRoZXJlJ3MgYQ0KPiBt
YXRjaCBkb2Vzbid0IHNlZW0gdG8gdXNlIHRoaXMgbGlua2VkIGxpc3QuDQo+IA0KPiBUaGlzIHNk
d19zbGF2ZV9hZGQoKSByb3V0aW5lIGlzIGNhbGxlZCB3aGlsZSBwYXJzaW5nIEFDUEkvRFQgdGFi
bGVzIGFuZCBhdCB0aGlzDQo+IHBvaW50IHRoZSBidXMgaXNuJ3QgZnVuY3Rpb25hbC4gVGhpcyBz
ZXF1ZW5jZSBvbmx5IGRlYWxzIHdpdGggZGV2aWNlIHJlZ2lzdHJhdGlvbg0KPiBhbmQgZHJpdmVy
IHByb2JlLCB0aGUgYWN0dWFsIGFjdGl2YXRpb24gYW5kIGVudW1lcmF0aW9uIGhhcHBlbiBtdWNo
IGxhdGVyLg0KPiBXaGF0IGRvZXMgbWF0dGVyIGlzIHRoYXQgYnkgdGhlIHRpbWUgYWxsIEFDUEkv
RFQgZGV2aWNlcyBoYXZlIGJlZW4gc2Nhbm5lZCBhbGwNCj4gaW5pdGlhbGl6YXRpb24gaXMgY29t
cGxldGUuIFRoZSBsYXN0IHBhcnQgb2YgdGhlIGZsb3cgaXMgbm90IHRoZSBkZXZpY2VfcmVnaXN0
ZXIoKSBhdA0KPiB0aGUgaW5kaXZpZHVhbCBwZXJpcGhlcmFsIGxldmVsLg0KPiANCj4gRXZlbiBm
b3IgdGhlIFF1YWxjb21tIGNhc2UsIHRoZSBzdGVwcyBhcmUgZGlmZmVyZW50Og0KPiANCj4gCXJl
dCA9IHNkd19idXNfbWFzdGVyX2FkZCgmY3RybC0+YnVzLCBkZXYsIGRldi0+Zndub2RlKTsNCj4g
CWlmIChyZXQpIHsNCj4gCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZWdpc3RlciBTb3VuZHdp
cmUgY29udHJvbGxlciAoJWQpXG4iLA0KPiAJCQlyZXQpOw0KPiAJCWdvdG8gZXJyX2NsazsNCj4g
CX0NCj4gDQo+IAlxY29tX3N3cm1faW5pdChjdHJsKTsgPDw8IHRoYXQncyB3aGVyZSB0aGUgYnVz
IGlzIGZ1bmN0aW9uYWwNCj4gDQo+IE5vdGUgdGhhdCB3ZSBhcmUgbm90IGdvaW5nIHRvIGxheSBv
biB0aGUgdHJhY2tzIGZvciB0aGlzLCB0aGlzIHNlcXVlbmNlIHdhcw0KPiB0YWdnZWQgYnkgc3Rh
dGljIGFuYWx5c2lzIHRvb2xzIHdobyBkb24ndCB1bmRlcnN0YW5kIHRoYXQNCj4gcHV0X2Rldmlj
ZSgpIGFjdHVhbGx5IGZyZWVzIG1lbW9yeSBieSB3YXkgb2YgdGhlIC5yZWxlYXNlIGNhbGxiYWNr
LCBidXQgdGhhdCBsZWQNCj4gdXMgdG8gYXNrIG91cnNlbHZlcyB3aGV0aGVyIHRoaXMgc2VxdWVu
Y2Ugd2FzIGFjdHVhbGx5IG5lY2Vzc2FyeS4NCg0KSGkgVmlub2QsDQoNCkRvIHlvdSBoYXZlIGFu
eSBjb21tZW50IG9yIG9iamVjdGlvbiBhZnRlciBQaWVycmUncyBleHBsYW5hdGlvbj8gDQoNClJl
Z2FyZHMsDQpCYXJkDQo=
