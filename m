Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E653D9E14
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 09:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DB01F09;
	Thu, 29 Jul 2021 09:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DB01F09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627542575;
	bh=K2z5caxZXjr9FlH29kGQwfGC+TDOn6T+fzPgv876paU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sg16IASfZ5eZx7a9CNKtX73CKFWvRbyRP7NwCPn9iLM7Xkrp6X8E0kgREwPo2cI+b
	 K3IUoE12oMKc7oclaYa/xrSpcowRONexyKDK5xGDrpbo14zYwuTiQ9nY61BIr7JODF
	 crhgOFk0kSDCehv2/c7qx0mQYAOSL00+9LUFvwVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 210ABF800E9;
	Thu, 29 Jul 2021 09:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECDABF80258; Thu, 29 Jul 2021 09:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D410F800EB
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 09:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D410F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="T3R0UZcP"
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212852664"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="212852664"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 00:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="435397866"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 29 Jul 2021 00:07:54 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 00:07:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 00:07:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 00:07:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 00:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iugF+BlaCE3uo07EJfob8kebS39Pwx4L6LsfJOa9qD3f7tU/shWUZ+oVhORx98Qxz9GyGBfhgVeiOhB9oSuqoHbzdqM0hpF84dV+VaQtQt2KrPxLjkYXkhz3MFzmj4DXwQy9Vz6+AUKWJvgChna5J+WADP8Jnf8fIts9Cw0ZZXN1OkPWUFTB97ZO+3n7DeawsWKsxd2+tp8ZT714sGNgoCU1ryTMNh2jkQkOwJJAaU3vQkkGFOl3giwuXYBFWaRQgR5y6OFWGWNLjInOcg12ME4tUPrgknlaFiuvLPlxv/q+YnipVfEdfc1rVYKMSX9r9AtvkgayxhaiPzJHZPCNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2z5caxZXjr9FlH29kGQwfGC+TDOn6T+fzPgv876paU=;
 b=BPRqgvHb4T8AohRZm2Fk2FsboscvgFt8ujg67K41xojD3X4wEsGMU3HPJaVSg/nNF73wApA3EjGGSQcPbT7T23IdWKv7AmF0MPUS/LUQ6vOIOeTIdTHYoexyvZbiZp3duMT5J7jpLB19fCe4gSgyyeRbCUj+8VWVQmLR/QWvFwwXcNz65JUgJ0LhY9VTXygND+LHf6ABBiK+1OpFB4LbqoixMaJ1qrgR75P6J2UkdbdaQKQEfTVYKY2QLmJYAQLohsH0U79wTOk4ZkNuQ4TnLH6Kgde9a9aCH7Ju22aw1JfWVw34ORT5Pi0KxoT2ei+Q3sPN3yaGYuvlNeuiio1ZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2z5caxZXjr9FlH29kGQwfGC+TDOn6T+fzPgv876paU=;
 b=T3R0UZcPTXwmUifEliGeZ6/lAEVSWQ8dfbO61Sr+8XY6qC4WGI4Ro4kFuuePaGD9jAYS969KCgizRIL2F5eQjnoyZlgOHBbOIpttvgac8MTn3lvpeBUlunDAXxa4FfSFcoELa385a6o4CwMlvk7wQ93cEaaLYtp3HxqM0GVq8EM=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM5PR1101MB2187.namprd11.prod.outlook.com (2603:10b6:4:51::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.19; Thu, 29 Jul 2021 07:07:51 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::446b:ca82:9706:2755%7]) with mapi id 15.20.4352.031; Thu, 29 Jul 2021
 07:07:51 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: RE: (subset) [PATCH 00/10] soundwire/ASoC: add mockup codec support
Thread-Topic: (subset) [PATCH 00/10] soundwire/ASoC: add mockup codec support
Thread-Index: AQHXeF+ByQ6MYOdeGESg2wBbaUOX9atC3i4AgBbBQDA=
Date: Thu, 29 Jul 2021 07:07:51 +0000
Message-ID: <DM6PR11MB40745382B9815C84CC39120AFFEB9@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
 <162629086374.53311.4247206766252361294.b4-ty@kernel.org>
In-Reply-To: <162629086374.53311.4247206766252361294.b4-ty@kernel.org>
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
x-ms-office365-filtering-correlation-id: 5f7e05a1-61ff-4359-259a-08d9525f94a1
x-ms-traffictypediagnostic: DM5PR1101MB2187:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB218704E288244CAFA04D41E8FFEB9@DM5PR1101MB2187.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YDkBglm549H/K+jCr9v1Bpafn030KfTohQAhwG1EHOPy56wiEVjrW7PE6Fvma4H3Hm8hxGkzwfB9VrHNIy6ecYmVxJ81NCWK4LKBt0fPnKcfsvMvGiAvD644xk7yfnGohzNff8FJnjYj8dE2kOCraz8/tZPaaD5vFlpjK1YUaqwlw5MVisbTWED1dB5627S5wiOtmDyl5WhS9HW2wdzq1OP3Yzks5H4gWNt4S+R7XHmCm91kuxpM7tRZn6iyXx7Zip1IBXpZZoM4UUAt/nJOLzt+fjtyODjvGggwT0CsCVyN4JMNaKqQbY9oyNLPT+ZFT1Ug2ywPtFsT7SNWCzzxgiWfsKIsIUXHDOra2pFZJDP/PCAewcvqA1fCYFeSnuRzQdy4oBraW1GaA6uqZAA1HhYy8THJzjMkgvv4Rs4Gyn1RY10FouKtv0FRBAqx7RNn4URBSYHZ9JyLkn9MiHpziwJlD57vLmaM23wyyZifc4SCIf3tgPY6a0QKqNoQlXS8iLImbnXI6hzHzGJG/f18W/63GiG0Kes9TVzIEf/Sha3Rr6JLViMkkmGOk6sHkHHvtKACHH/K2tB6yvEgzkieCB1v5GZ09dcOKd48eK0Prnx7ZvYgujxbwAJXyka1sMi2UxsIjGKjUwqhK0T2ty/Ss2dYJD463Bjt3IUbocDZ1xRoOBxuJb2525R6AXe9mrFp6kLsVhHK1J6PS8NYHWImTKARvWxyOzy0C3IrCqnoSGs4wZggqDXTJwqEQTISXU+LWSltZ/vojZ9OKFN02zIfRG3J2cae0Vt4zVbeQ7f5tEg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(4326008)(33656002)(38100700002)(8936002)(55016002)(26005)(53546011)(122000001)(5660300002)(508600001)(9686003)(7416002)(54906003)(83380400001)(76116006)(110136005)(52536014)(66446008)(38070700005)(316002)(86362001)(966005)(66476007)(66946007)(66556008)(2906002)(7696005)(71200400001)(64756008)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTJFa1BBd2Fzd0psNUxPWFVqYlBQcVJJZDdOaUNIS3NXOG5UL3FOSEFMYmp3?=
 =?utf-8?B?TjhCVWlGRi9ZTEFyN0xrNkgxc0hOWUhscG5mTmVWMGFmazQ1ZkRxdUZFMTdH?=
 =?utf-8?B?SXpwNEFxeDd0U0hXY0sxVkVtU2FwQkt5SXBVWW10ZGJlL0hLVEFqdWlnTmJk?=
 =?utf-8?B?c213SVA2Wm5QUTlBWnJIOUp6ejI0QlgrZUJBaWJSSUJGZDFXVzZkRDA3K01U?=
 =?utf-8?B?a09oMXV2VWhtM281bVYyTnkzMFJQK1hLdkZqYTk2S0VjaVdDTzVVckN0VXkw?=
 =?utf-8?B?U1I1QXBLS1k5RFlXL0RwbWZMMFJNcDFPcGtVeFFvQlRVWlFCWlY4K0tybFB5?=
 =?utf-8?B?RXh0YnhhdTdsOHF5d2FTemhKb1IrRlVTWm95NGpoSGgxVWVodEdZNm9JTHZQ?=
 =?utf-8?B?MlFmWnYwZnFhWFAzZThpWFM0TFo4Y05xdkVwVXdybVlvVFE1L1NaWFZ2K3BV?=
 =?utf-8?B?SnhXblBXYll3cjgvcXBHZU9NeUxNNlFKK3NXTG05Q3FaeVBSTEloSUlEV3E0?=
 =?utf-8?B?NERhY05FZzlFa3BLNmgzQ1JDaXk3R1k5Y2wvaXQwcWlSOG1qc2cvZzNHUGp6?=
 =?utf-8?B?dytzV3dvYzB6VGpKbTd3endlcUtFZENRQTlMOFVmK2N6Q2xSQ3RTaHRQR05h?=
 =?utf-8?B?SnlrcXJjRVY3bS9GeGVoZ1RPSUtkbEs0dzYveVp5NWxsSlBPVmtuYjVneTUy?=
 =?utf-8?B?T205dE42bTVEcHRWakxJSTZmcGNXdzJIM0JUWCtyekcvemVsZzExeEFaV1pO?=
 =?utf-8?B?UTl1czNZeTdSRUNpTHhVcEllWGRxMFhWcnhqUnFicGRiQWFjdFljWTZSYnpo?=
 =?utf-8?B?Vy9yck5uRnlHM2tBS3Q2R3RjbkVqbVhTYlUxTkY0a3hjeExMYVBsMHovY1kz?=
 =?utf-8?B?UzRERGVzc08vZG5DQS9zaFp3UlVDVWlDb0pENlpkQ2V0QnpDU24zckFxQ0JC?=
 =?utf-8?B?WHZEOE5Ma1VmVE1kazl3QVhObmNtUUF1WHdTM0tjT0hoOUc0NDhtTEU5UWow?=
 =?utf-8?B?MlFTcjRyYXRYUSs1QnRwYVNBRTlQTndnaTM1QU1JdmZIajREVmc5d2Vla2hQ?=
 =?utf-8?B?cDYzKzQreGpYT3oyVU85VHlXRGVUcVNTM0Zsc1FpRUVUNUpFdUpPbXJMdWg1?=
 =?utf-8?B?ZlhYRTRYTW1xK1BIT0ZMM3ZVazhQRnNIZ20vZ1VEWGdiWjNhQ2RHKzhtMDgw?=
 =?utf-8?B?NExDeG0wNWJRZXZKS0tsNjNxcDRKK2lSQ1M2eUVTK3JjNDNoMmx1TUtNdWIz?=
 =?utf-8?B?N3VsL2pURCtVLy9rYUtXd3VQdzFxTG1pbjhUM2tQU242UjN4YUViZ2dMcnFr?=
 =?utf-8?B?TUZpZDBhY3RTWXBjendsaitmd0NuZ004dU0yY3NnMTRxcHJuSkJVdUJuZW5V?=
 =?utf-8?B?WlVVU0V3b21qUGRyTk9rSjZORzRoWGsxRkF1cmMybFk2cFRsZjVCSElyelZ1?=
 =?utf-8?B?SkpoalJqbjR1ejdFVkRhZ3VNNzBVcFJNdGpMY0N4VDlHYXdRc0FVdnV4S0FV?=
 =?utf-8?B?aDh5N2tsUEJoK3ZFZmcwT1lMaW5Gc1BzOXZNZ2xvMEIwQkhjYy9iVU9CYTAv?=
 =?utf-8?B?Uk1sUmJlSjY2bXJuWDZwSlp1SGdwRkNDOUVicnphdlV6T0QxZHF6VnE1RTFG?=
 =?utf-8?B?NklBR0tSbi93VWdLV3AyUWdUTHJoVW1mbVA3RmJnaWJkWVpzYW9ZUmwrUS9h?=
 =?utf-8?B?MndjVjFIVTBhNVZpUEVIMW42dDdUOFlVcVJCaWJQejdQZGUzeXVDMVJlK1Yx?=
 =?utf-8?Q?XfdCBNVq+yOaA0w9KI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7e05a1-61ff-4359-259a-08d9525f94a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 07:07:51.7686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ayf/e3v+kcYRgygQhlRHO4rmjyBCXhgAOwsN6MB0VptRUo4Vg50xBXSn/JLQzXd/4kd1rcmo+SoLCRKzmnFgkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2187
X-OriginatorOrg: intel.com
Cc: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Kale, Sanyog R" <sanyog.r.kale@intel.com>
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

SGkgVmlub2QsDQoNCkRvIHlvdSBoYXZlIGFueSBjb21tZW50IG9uIHRoZSBTb3VuZFdpcmUgcGFy
dD8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE1LCAyMDIxIDM6MzYg
QU0NCj4gVG86IHZrb3VsQGtlcm5lbC5vcmc7IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsg
QmFyZCBMaWFvIDx5dW5nLQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1h
cmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IHNyaW5pdmFzLmth
bmRhZ2F0bGFAbGluYXJvLm9yZzsgTGlhbywgQmFyZA0KPiA8YmFyZC5saWFvQGludGVsLmNvbT47
IHZpbm9kLmtvdWxAbGluYXJvLm9yZzsgdGl3YWlAc3VzZS5kZTsNCj4gZ3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc7IEthbGUsIFNhbnlvZyBSIDxzYW55b2cuci5rYWxlQGludGVsLmNvbT4NCj4g
U3ViamVjdDogUmU6IChzdWJzZXQpIFtQQVRDSCAwMC8xMF0gc291bmR3aXJlL0FTb0M6IGFkZCBt
b2NrdXAgY29kZWMNCj4gc3VwcG9ydA0KPiANCj4gT24gV2VkLCAxNCBKdWwgMjAyMSAxMToyMTo1
OSArMDgwMCwgQmFyZCBMaWFvIHdyb3RlOg0KPiA+IEFkZGluZyBtb2NrdXAgU291bmRXaXJlIGNv
ZGVjIGlzIHVzZWZ1bCB0byBkZWJ1ZyBkcml2ZXIvdG9wb2xvZ3kNCj4gPiBjaGFuZ2VzIHdpdGhv
dXQgaGF2aW5nIGFueSBhY3R1YWwgZGV2aWNlIGNvbm5lY3RlZC4NCj4gPg0KPiA+IEJhcmQgTGlh
byAoMik6DQo+ID4gICBzb3VuZHdpcmU6IHN0cmVhbTogZG9uJ3QgYWJvcnQgYmFuayBzd2l0Y2gg
b24gQ29tbWFuZF9JZ25vcmVkLy0NCj4gRU5PREFUQQ0KPiA+ICAgc291bmR3aXJlOiBzdHJlYW06
IGRvbid0IHByb2dyYW0gbW9ja3VwIGRldmljZSBwb3J0cw0KPiA+DQo+ID4gWy4uLl0NCj4gDQo+
IEFwcGxpZWQgdG8NCj4gDQo+ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuZ2l0IGZvci1uZXh0DQo+IA0KPiBUaGFua3MhDQo+
IA0KPiBbMDEvMTBdIEFTb0M6IGNvZGVjczogYWRkIFNvdW5kV2lyZSBtb2NrdXAgZGV2aWNlIHN1
cHBvcnQNCj4gICAgICAgICBjb21taXQ6IDgxZDNkM2QwYmYwOWU2MDZkYmMxZTNkYWFkMWM3Y2Vm
Mzk3NmZjYTINCj4gWzAyLzEwXSBBU29DOiBzb2MtYWNwaTogY25sOiBhZGQgdGFibGUgZm9yIFNv
dW5kV2lyZSBtb2NrdXAgZGV2aWNlcw0KPiAgICAgICAgIGNvbW1pdDogMjY5NGNkYTdhNDM5M2Zi
ZDQzNmUyODQ3NDgzMmEwNTNlNzBlMDczMw0KPiBbMDMvMTBdIEFTb0M6IHNvYy1hY3BpOiB0Z2w6
IGFkZCB0YWJsZSBmb3IgU291bmRXaXJlIG1vY2t1cCBkZXZpY2VzDQo+ICAgICAgICAgY29tbWl0
OiAzMDI1ZDM5OGM0MzZkMzEzZjliNmI1YzFmNTM5MThlZmVhZmNmNWRjDQo+IFswNC8xMF0gQVNv
QzogSW50ZWw6IGJvYXJkczogc29mX3NkdzogYWRkIFNvdW5kV2lyZSBtb2NrdXAgY29kZWNzIGZv
ciB0ZXN0cw0KPiAgICAgICAgIGNvbW1pdDogMGNjYWMzYmNmMzU2NGNiY2JhNDgzZGVjMjBjNzU1
MDkzOTg3M2Y1OQ0KPiANCj4gQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwg
YmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0IHRyZWUgKHVzdWFsbHkNCj4gc29tZXRp
bWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZyB0aGUgbmV4
dCBtZXJnZSB3aW5kb3cNCj4gKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVy
IGlmIHByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoDQo+IG1heSBiZSBkcm9w
cGVkIG9yIHJldmVydGVkLg0KPiANCj4gWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3Vs
dGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZyBhbmQNCj4gcmV2aWV3IG9mIHRo
ZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQg
c2VuZA0KPiBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSBy
ZXBvcnRlZCBpZiBuZWVkZWQuDQo+IA0KPiBJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3Ig
eW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5IHNob3VsZCBiZQ0KPiBzZW50
IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcgcGF0
Y2hlcyB3aWxsIG5vdCBiZQ0KPiByZXBsYWNlZC4NCj4gDQo+IFBsZWFzZSBhZGQgYW55IHJlbGV2
YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcgdG8gdGhp
cw0KPiBtYWlsLg0KPiANCj4gVGhhbmtzLA0KPiBNYXJrDQo=
