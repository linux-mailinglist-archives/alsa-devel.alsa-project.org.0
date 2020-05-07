Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAB1C7FFB
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 04:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C156017C5;
	Thu,  7 May 2020 04:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C156017C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588818101;
	bh=V+ukuXCYu0SZ/97fQaxD2AFwkDHPtoogHJEhbgWLs8s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uRn7qmUxJKt+qSxUtMJ4cTohujcQA36/uWxGV0upfhmEInyBzGPHxlssYg3qWBUyE
	 TxTqwPLjhRaH4L08fT/4BhPHeUfCFw6AhVjCbPe+w6JOsu/emZeldUxUkJq8Rc6vUD
	 20Dqcn+1nztYUHoG/AteCsZsWIsjEZBXkxrN6/5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A0DF8015B;
	Thu,  7 May 2020 04:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E241AF8015F; Thu,  7 May 2020 04:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7556DF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 04:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7556DF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Z2UIsTa0"
IronPort-SDR: DqowkGlD98Cf5A9IxQ4hmLILT02wDY7Xl72VwO5lwDOKtllaoCcbvh6SrxG28IO6o+QtdmGt94
 Fj+a+AZgbx2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 19:19:50 -0700
IronPort-SDR: hYNd45gk+1H1xwqQte0wPFuvvcKu6q5d/4dwJNTEQy/VluTp7bB2s5zIcaObJyt/gs07qD+iui
 gHX9wSfuam0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,361,1583222400"; d="scan'208";a="284836540"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga004.fm.intel.com with ESMTP; 06 May 2020 19:19:49 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 6 May 2020 19:19:49 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX154.amr.corp.intel.com (10.22.226.12) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 6 May 2020 19:19:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 6 May 2020 19:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOQTtxsdPyy5Xbet5i0ykc/Lf3Zip5rsOPr0e8JFMkk3yLtck3fIrwywdNVNowiaQyP6FKC6dIbTYhu42QxYP7UgRt3ObPJ8QTgV+QhErtTblnPMDEaBLkL5+pR+kqrhLLxLrEfnKUfrJOjs/CFcCCzA0k2eGhMJ/vR88M1z1k3k3uEph6xyYfC3QCKkastGNPFbs/y2Ck55VciBwnzCn6AtWcdl+Wo0ZOUJv3YpIQHK5rid5l2YK0mE5zpQjuloZP+yI5NxaYBhLKMUBY5lGzaj4ih0+2YyDJWBBnOTz03CxPOA2ZeYOOZEbOzSxFvo8kaEddrbYYVpbJzl0S1cBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+ukuXCYu0SZ/97fQaxD2AFwkDHPtoogHJEhbgWLs8s=;
 b=QNOoc+g8yus6eLA6b/QKsnXZp/MPUmK6DN/ZP70CrbuRxqF0Yj92QHUO+SS/oVuBJUTHF51aRbHJMsW2//hC0caaYvbw4jbpljZZGMAav+9UniW8kKbXpXgQy2/5GxmEA46b2h0g+bwL1dM5Mwz6U7+s2rPom4t9ZSnhxgyndQSj5leNE8rt+v5iMYscNMjHJPIJTFkNhedw0S+olG4XImcT/O7/VIxNTn01dhEG08AnRvWAtyS/jU2sO0kvu0C8gHNw1skAmdp4rjv1sBps85g/TiBueFmg+PNAqhq9o2x2kU947mH2KaCxxjXdjnfzxgs/JluXDJpzmpe9h8Ztyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+ukuXCYu0SZ/97fQaxD2AFwkDHPtoogHJEhbgWLs8s=;
 b=Z2UIsTa0x2YURbq6u8Hb6sbqlQDeqOtJrOQohEui/4n1lt8RewZjegrb940l6BcxvJiaFoupqkUX2tbuxmSIYrzfOOajLNH35ogZ3WPID8xFeYDCGNpxQzQ1h51Q0fKEcxbfN8XTKGpzVIPgJT9Kt73pX/m2tfJAorsLErswFPw=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2228.namprd11.prod.outlook.com
 (2603:10b6:405:52::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 02:19:47 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27%5]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 02:19:41 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Topic: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Index: AQHWDxGPcERmvVi2FUaZ0GDzXVeqv6h4uesAgAAAnRCAAFQWgIAEY1sggB0N0ACAAYzUsA==
Date: Thu, 7 May 2020 02:19:40 +0000
Message-ID: <BN6PR1101MB2132623374C6A708160CE11D97A50@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
 <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <4623d6b9-8dc6-b301-c8ff-74dfb6baf2a3@linux.intel.com>
In-Reply-To: <4623d6b9-8dc6-b301-c8ff-74dfb6baf2a3@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.11.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80c496d5-5914-4bc9-209b-08d7f22d19a5
x-ms-traffictypediagnostic: BN6PR1101MB2228:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB222811D509439E6B243E6E7E97A50@BN6PR1101MB2228.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8yD+KhFL79iQMPDl+3BGeEc1g405IwNN+h9UDIvw6IdtAlhdwmzVLNOFJ958XOq6TakRvjv5QUOMXcWzz4ILrQa0V581n8YgxzqhcRWxgzqv6OHZrCDO0pqhNveJHNsumJ21aS7l0y+mBqgb9Zjde/TINImbxsh16vdZoeZOoPWP4Ok+ndj2CeLUUlEnDOjcZ+uPL9IaHD2k39Ag6dxwC+/Syw68pu4ij/l6uzGXsply5CnW+GWMAjZ4NKwfPhSTDqf7vk3THdwPJGtFB3njhyDtFlO3BZJMFrA9iZgBwgWt4j71LRU2qPn+z/zkW6H3YmBJQSgXSeTOKSj8SxGuuYJ+lMqVVplWCxywti5QasrW/DqY1xcj1//sEaEt0WfA/ntTOmVjm+9oFU5vWpfY8B55SCOhdbnf/uQB4HkwqreZbVKDVeUdPgb7Vw+yDuS6zNtd6Q70is2nCwBnZL5ogmbUJnEgK1OiInX8Fmfnh1C+G1TT1Xsc6FS1+iDQNtkH/+sRgqM8qmQOnHzWoyzWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(33430700001)(66946007)(76116006)(6506007)(9686003)(186003)(71200400001)(26005)(83290400001)(83310400001)(83320400001)(83280400001)(316002)(7416002)(86362001)(7696005)(83300400001)(66446008)(8936002)(64756008)(66556008)(52536014)(66476007)(8676002)(4326008)(54906003)(478600001)(110136005)(5660300002)(33656002)(2906002)(33440700001)(4744005)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OHmjZiq4FFmZFOTETEJ5z0Skj/hyMjGmDN3cOQyksbyAPjfgPPUlVvQpxSzCvCLmjKFdf7OAK/iEmemAhAeGZ/aL82eC3mfQM5zIxjeIqfyS2IGzYVcKKkcmIN1vEacXoRVdaw4Bb7Dw82s1rj2XdVirJS9gKb+HsPa1p1tfAtgVVl3WismUpCtlDin4kjP9ncpW/Ff6f1t80LUpYOhh+9dfnH/aqLnEYSMkvWYL1Z8yV3qfrhvnFPBmkrEr3eDchJ2fAEMfwCvJ3UbV8okCSBwH1vu8XnSVHVQVSERQD5a/9YQA0OTyD9ecIQeN3F6FmM0zt57NXfQG1OghLUHmuRrsiCQumVhGb/CLiQ5uSJgZaKZHmEweh6b8nfPr971KzNlL3pSYDcJW/4iOQ/omGP0PIQTNkEQ6QvJncaVo7A+3gOV3IWP9HmFWCuf3RWvePY+nGm1sh9IJXopzlghryofCgqDpueKI8U05OieHXmSMmQAhPrcGJpN6l0SX3WDVGjWbHnutKOu49hkMOpFfAscmcbAjVuEktUzv17SlPZHq6n/YZ6kcxJrv78TPSaDLs+oWr14OF3kt3tNFDbpqND0pojimtkMEcGGZIhePfQ4YzvWVgjB+rmBwZLRrfp3+t32ANElCCEqM1ZCe0zNBxKYUJ2oZPvcAw4uwakrzrX+ov6UcvuwTZxhO6pvzEplh2yGcSBz+LCoVcPR32xne+dbmvPzK/85tijT+Ipc9v4QTFCBUE1zioAXNEfJQjVOgMamX4VHpSs2TAn8ni1FjkVr2dPqGboWg80qqdX4OqoQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c496d5-5914-4bc9-209b-08d7f22d19a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 02:19:40.9648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pel6A/hVx4MMm94Y0SDlujl5uwHT6vysfBwtefvM3z/Z5IYDkY/NVLFuqbQWY+1vp5+OUlADAR7MH3J4n7PSjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2228
X-OriginatorOrg: intel.com
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Richard
 Fontana <rfontana@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

PiANCj4gTG9va3MgdGhlcmUgaXMgcmFjZSBiZXR3ZWVuIHRoZSBwcmV2aW91cyBzdHJlYW0gc3Rv
cCBhbmQgdGhlIGN1cnJlbnQNCj4gc3RyZWFtIHN0YXJ0IGhlcmUuIENhbiB5b3UgaGVscCB0cnkg
Y2hhbmdpbmcgdGhlDQo+IHNzdF9ieXRfc3RyZWFtX3N0YXJ0L3N0b3AoKSBmcm9tICdub3dhaXQn
IG1vZGUgdG8gJ3dhaXQnIG1vZGUsIGFuZCBzZWUgaWYNCj4gdGhlIGlzc3VlIGNhbiBiZSByZXBy
b2R1Y2VkIHdpdGggaXQ/DQoNCkhpIEtleW9uLA0KDQpLZXJuZWwgcGFuaWMgaWYgdGhlIG1vZGUg
aXMgY2hhbmdlZC4gVGhlIGRlZmVjdCBjb3VsZCBoYXBwZW4gdG8gdGhlIGZpcnN0DQpBTExPQ19T
VFJFQU0gY29tbWFuZCBhZnRlciBib290c3RyYXAgc28gSSB0aGluayB0aGUgU1RBUlQvRFJPUF9T
VFJBTQ0KbWF5IG5vdCB3b3JrLiANCg0KDQpSZWdhcmRzLA0KQnJlbnQNCj4gDQo+IA0KPiBUaGFu
a3MsDQo+IH5LZXlvbg0KPiANCg==
