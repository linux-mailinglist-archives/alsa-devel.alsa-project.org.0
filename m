Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB433D150
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 11:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281F117B3;
	Tue, 16 Mar 2021 11:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281F117B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615888946;
	bh=7BchDlmPvWcgPkT+eM/Smvyx8j6sLSvDQ3ilo0ZDvEA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GxT56JncxfwXhg/UAUjX9vaxMj1KSK0L8tWv6HqyKifs5GTFR/XMJetyv3I6e0+FI
	 X2Phrm/vHZL3mhD98ekdlBtmbdGsz3L5WG8qgxL4m/pk2nNUI6InQwtjO74H31ERp/
	 LAqyAOXePFbgJx/Rl6ZZeeQ/MDCLofy/kcZmm+xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F301F80171;
	Tue, 16 Mar 2021 11:00:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0073F80163; Tue, 16 Mar 2021 11:00:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C99F80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 11:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C99F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="RBbUyfHe"
IronPort-SDR: UeoQFQUAB3ht+toZcNNLxpN+93Dxa/3kA0UI/AL2sUDCOcdzyenbOjuhryzrqcaym19N7FPhUz
 yDg1oJ63lp2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="186854534"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="186854534"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 03:00:43 -0700
IronPort-SDR: Bhxq8+XYHpZuwsXMKLMLI1E2z0X9FzCrFidPdZyuuA+ijeuM5NP/YzER1jGiBSUFRqHYFwh5vf
 jL8XDnJv4R/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="371934997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 16 Mar 2021 03:00:43 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 03:00:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 03:00:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 16 Mar 2021 03:00:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 16 Mar 2021 03:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOFs90DCVnDhTVtrCQKaMlU/mE8fmCTmEofjtbeFuculz5+O0+7Mmih1bVCkeC1tWBAVqJPjwiiZdJOJvaORq9D8Dz5vOViIOW6tzrhdePNlUzOr2DVjxOivmFRLEIuqpXoawROz59bwoFVs1JKxyA2tRAvywiTe+upIrVo3Tt1RWnEC7rw0bjCNfuGhMxsLQE75krY8/QZY09oSQ9/gtikref5NtDQK6QTCEFvrWRTU9q0+maRY3OrydBrEMncXees4OLk62cMVJ4XgWTbK9LsoquGJjVbWzeShbfarBHy7Fgp/A0JhwAQXqFoYU8yo9dL0s+2DJ2Uu28OxGUW5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BchDlmPvWcgPkT+eM/Smvyx8j6sLSvDQ3ilo0ZDvEA=;
 b=eLurNFlUMkFd1FKu8IEI2kXKR7t/lVOUEhGEvu/O9UMtkXh4yorXXFqCaLfbtFLSCLCYKTTjkf/KezJ7Z2TRlAqkMQPdY/YNcHwrWAoo1CcBaXb6VTLWglaZY1VkCf22/+OjgkFYirBfYgpClx8Aqy4OO+4tLk/7bwXlFznfR2awGu6VbCI25vgCtScyGoe8T1976yEh91CuTW+foCOzk2JvfN1U/OFi1Au/kxJuZIueRjekqjWp1m1Xt20wqZ3HhKE7PjOdBD5t1HRhguJYsNzcjSXwGrW/5PjBw3fi16Cf85CFhZ/1dzM2MaToz4P6LLnyC5+yguKSskxracGqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BchDlmPvWcgPkT+eM/Smvyx8j6sLSvDQ3ilo0ZDvEA=;
 b=RBbUyfHeQCsiP0/lKq6uNveLa0lUj5t7Vo+939nON/c/cuX8ibhKwL/Q4HjVJflULVLYA2jMBFbW3K5M3Dxezz6cWXN5aEX4QIQaxccvLjPweoFjIwUlPeED3RaAuh8j/9bV9fggaK7iPMi6sQtLUoQSSzB5SJXutarVqDrlx0c=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 10:00:39 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f135:7a69:c586:6a22]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f135:7a69:c586:6a22%2]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 10:00:39 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: Add rt1015p speaker amp support
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: Add rt1015p speaker amp support
Thread-Index: AQHXGBDpE9LBiGnjT0W/ItSyKgNeQ6qFHjsAgAFGz3A=
Date: Tue, 16 Mar 2021 10:00:39 +0000
Message-ID: <DM6PR11MB364283E4424154A6F10938FD976B9@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20210313134038.5577-1-brent.lu@intel.com>
 <7ec5763b-29cb-4846-6ff8-3899c2ff1248@linux.intel.com>
In-Reply-To: <7ec5763b-29cb-4846-6ff8-3899c2ff1248@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [111.248.46.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da041314-453f-4472-98cb-08d8e8625a76
x-ms-traffictypediagnostic: DM4PR11MB5246:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB5246F12A8BF527A95CFE8FEB976B9@DM4PR11MB5246.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mzY4q4u/61V6ApkALy1xiEr9mU1Yui3q7wxBE47/Zn+V0qHhYj8KrMt7iwkmREbmQbIIj0BihyaDIgIbIWpcR4zud5gkDqbsB91wtrnIETRT6YAbUPFIoZjPE1oxGFGLtP3U/9P7O72Ua6mO0yXTi2YNgtbKnfYASdOCN7tatlguOYF3YUu+LdMZkAWvqRHWaA66dSFLfDVlctgXy6ux7iUDV44GZqcLg6xzTY1vqw3UZcPRfydSp6hmPPnwtXEI5olWqHO7+TYxrj4mBs7lood9LZOgmjYs9ZIJFQFdcKXYJawwEfAKG7PxRdKB5Ol3WPppcFRPzrZDvCbFEJQU4I7g71EnPMFyamj8m/LCCdYmq6PRhEIg3czJQ5L34gPq8vDzpKP7dA23rCmqKbEtgzESccLuLwVjvdk0m5dyrFklqcvQBJdXYk5yemOBJRetKKawDVaxhG+mmlf2tk3OB7kioZAV1RzOwpvAIUPdK5lbHwzSOsIMX7IZaFhkD1i0PlLfpV3TqaRgMgk1vAA1mbpbCDhyPkHkrGmhwWLTJWpUoclE15OTaycW6F8cQkfk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(8936002)(316002)(66946007)(55016002)(4744005)(71200400001)(86362001)(110136005)(66556008)(8676002)(64756008)(54906003)(4326008)(26005)(76116006)(186003)(6506007)(9686003)(7416002)(66446008)(7696005)(2906002)(478600001)(52536014)(66476007)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UkZnRlhoZWdXWjdmekZoVWdxOFFxWW1Pei9FY0YweHFJR0dVbkZ3K2dOTFQr?=
 =?utf-8?B?TytzTlRFazZ0d3lKa0pFMVVsRVZ1Yys1cS9uZlh1YVQ3UjdlcHFIbTNLcXRR?=
 =?utf-8?B?aFY5MGlDenhWeWtPSlBvWXBzQ1huMmY1NXd5Y01BTkYwQStmNmJVeVc2d1dz?=
 =?utf-8?B?bXhlbUluak5aODAraE9iK2RheTA0eVVPWm1xNmlaeTlLcUx6MDhHQnF4NkhI?=
 =?utf-8?B?Y0NiZFpHSFlDckk3ZFhmN0MyY3ZHbG1hbWluc0gyMm00UzR2R0dxMkpkLzhl?=
 =?utf-8?B?TkF0ZFNvbDh4dkpYV3ltOHdxMDJBTjcxM2FpdEdxWjVTcDFSeUoveWEzdUJB?=
 =?utf-8?B?TExkNmVlUzlVMG9pTDA4SUJtNzJlRHJJRldPaVdKajdPRVVnRzEzbm9YQWhX?=
 =?utf-8?B?M2EzV1hIM25PWVo4TEg5SWt1UnphZkM5enFxcW5mdTl2cldNTlY3QUNXVk13?=
 =?utf-8?B?NXlVb1Q2a2pGcmRLMlVQeldKU29HNlVEVTB3QnRZZGlVeXN5SlRTQ3ZEOVAy?=
 =?utf-8?B?Szh1dzNpenJwQ21EZmJnaTdIb3JzcWR3WWpreHFFTzgzSDVCQkx0V3BvZzBL?=
 =?utf-8?B?MnhGbWZOYVVFL0JoNTVNMjN2VVFxR0xISEJ6dExEaG8vMFkwSkU4ZTlud0N6?=
 =?utf-8?B?L0lPTnR4dWswTWtuQzkyNzNXejZQMmx4VU0zVnRKWDdOb3oyL1hzS0lYTWd0?=
 =?utf-8?B?N1ZOUVh2OWY4TUNDZWlFS1Vmc1NJWXJ1UDF0cXdLTkoybENZdTdwQkdMVlJZ?=
 =?utf-8?B?ZEtPZVkyVU16YnJ6bFdQWVdoc0N1ZHV3dGV4dk9qcDdydW1tUGROMnE0OGN5?=
 =?utf-8?B?ZGQxL3A3dnZaYUYzVjFvbUxsb2xYQ0xHdlEyZCtYNUM4Y041aFNZUHA4bWhN?=
 =?utf-8?B?WjZRekJ5U0RleG1UeE5QMDF1WjAzVDJ5ZVkyQk52RDhBNFBMQXlFd2NLL3Ax?=
 =?utf-8?B?NFBUQks5dElyeXRxL0VVVTlrZUVnV0FXSkpEaVc3YXMrUXJoTUVwblc0cndM?=
 =?utf-8?B?eUhKY0JoYlJiOWFWamFsck5VcFVHaWRZYVFIclNocDJURHJjZmcrNHYrOG1u?=
 =?utf-8?B?MWVhazRFOHNMYzZ4TTAxV0RsMWNXeit5NmNNOWdFNjFrRC84SEZiUVZ3QWkr?=
 =?utf-8?B?cm80bmJIeVlleUtUWklaaTBrV01XdXBYcE9xUE0rS0tpdkllazRRRnpjUzJ4?=
 =?utf-8?B?dzJobjFGVHBGK2cwcytaZFNNR3JYOGRLdVVudlJZUFNrS1RZQkZzdndZT055?=
 =?utf-8?B?R1ZqY0YwTDYrcm01RjY5ZjI3ZGxGMkhpOU0wUkN4Lzg2anRGNEpvS3d3K2J6?=
 =?utf-8?B?ZDdvREJzMW1QUFRxeGVDRW5MdVB6bXI0WnR0MXpGSEM1OE1hUS96N0VJYzA5?=
 =?utf-8?B?aWlUT0srWjNUQzByVGQycGFIb0dLdnppY0tPdTRsMGozZG5FRFVsejVRdVQy?=
 =?utf-8?B?UDVCYTFNSE42WGRKM0RzTzllUnBCb2V0b3FrWUlxZFFsWmZMakdCM3B3Q0d6?=
 =?utf-8?B?SDF6VU5IemU5bEFyOHg1RWZFQ25MdThzRUg0Zmt1MDZTU0JIYzB6VkRTbUpp?=
 =?utf-8?B?aUd4VXRZOTBKTEE2NHRKRis4YnorRTRoN05HZFdsMEJRSmtGYXF0d0Q1Yktp?=
 =?utf-8?B?YktkRlhDQ21vSEtIeWQ2eS91WGI1WXl1TVI5cnV0ZzFldzFEMkJHMWxLM1JZ?=
 =?utf-8?B?R1k1dm1ZMk1wVXZQY0hOdDh5NUhkbWkrK2lkVEFLV0tFVzZicWNiUDFRaG80?=
 =?utf-8?Q?uwn/9fV1tleDmmi8Sqwd9rIww6Buzm6dgJM6VgO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da041314-453f-4472-98cb-08d8e8625a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 10:00:39.3177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWjgoJPx0rlndTpoabkrpYBxnRFF2MMZV+Oi1s7fpFJ7qfKU4LuXv4fr9r1xPq7wgg/2x9kmYpCMtpO4M7379w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
X-OriginatorOrg: intel.com
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Fred Oh <fred.oh@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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

PiANCj4gY291bGQgd2Ugbm90IGhhbmRsZSB0aGlzIHF1aXJrIGluc2lkZSBvbmUgb2YgdGhlIHR3
byBkYWlfbGluayBvciBjb2RlY19jb25mDQo+IGZ1bmN0aW9ucyBhYm92ZT8NCj4gVGhlIG1hY2hp
bmUgZHJpdmVyIGRvZXMgbm90IGNhcmUgYWJvdXQgdGhpcyBSVDEwMTVQX1NIQVJFX0VOX1NQSyBx
dWlyaywNCj4gaXQncyBvbmx5IHVzZWQgaW4gdGhvc2UgdHdvIGZ1bmN0aW9ucyBzbyBzaG91bGQg
YmUgc2V0IGluIHRoaXMgc2NvcGUuDQo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBtYWtlIGl0IHZpc2li
bGUgdG8gdGhlIG1hY2hpbmUgZHJpdmVyLCBpcyB0aGVyZT8NCj4gDQoNClRoYW5rIHlvdSBmb3Ig
dGhlIGNvbW1lbnQ7IHRoaXMgcGF0Y2ggbG9va3MgdGVycmlibGUuLi4gSSB3aWxsIGltcHJvdmUg
dGhlIGNvZGUNCmFuZCB1cGxvYWQgYSB2MiBwYXRjaC4NCg0KUmVnYXJkcywNCkJyZW50DQo=
