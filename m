Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276962CDA78
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 16:59:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09EC1844;
	Thu,  3 Dec 2020 16:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09EC1844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607011147;
	bh=PHQRGNTOzlKqVqDt8N+FnCnjTYkaFH1c2pMZHiLfNF8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s9dB8I07zsSZrsa7ZpQjFUkfYNmYWT6CLM/ubStWv/YIszVgob0SPZbaPd5ckAesD
	 /7sZg0Zh1oykl/GQt8ruwfuULNESFvYDddwCFu06UHT1HvQmVPGIeFVFuXLf5LyIDc
	 QFmmI3THPz20IepDna1guLm/AlwOCAVds8c3q87U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF8F9F80254;
	Thu,  3 Dec 2020 16:57:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F841F8016D; Thu,  3 Dec 2020 16:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0DA3F8012A
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 16:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DA3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="FVshWNAW"
IronPort-SDR: 9oJjy342LB02q28D2l5xBk8KUG6QVq+ro9VdTpjPlxgDM1XY7xXDKCTkwoQqwEhz7aYPCjTFpx
 f5vaOH0Q7ezQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="152466526"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="152466526"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 07:57:24 -0800
IronPort-SDR: z3TLFggCtGtEDn0ndwffAiRXrsfozd+umcIQRXTpLnqOsFhM19+h8T8/+NqOridFwRE2YFLjvY
 NydpxkpU9xOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="336001411"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 03 Dec 2020 07:57:24 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 3 Dec 2020 07:57:23 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 3 Dec 2020 07:57:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 3 Dec 2020 07:57:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 3 Dec 2020 07:57:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd3hhfL83T1fvQKbnM6zlu6kqfhlemk/XUiV+5qpcDOYFKxe5ebGr98VF0/1OZ2rFf3TxlM6M/yNG1v4anPErMpP9InU90hOTnUb5Ok1gwwHtYIyCvDGmFUVGMn46uXF5P/WR1pitD+Kzu/LCVPzJM29x2HGDnhynwIVbvxW4zlDivHPagcu6a4aqaC88J0lflEjauaCtk2F3zv6hjXmCqSsSkgSdvqHK5KOw6qMe9D1OA7Ppfx3wvpdIk4GSMJ+Z01XwVoli/lvM8Mq0RHx4nnJwcSYnIgiTIeZS7bpdqjG44cn0zwFtIAp6D75rE2R+K2OnZKVA0PF0HTDAC3Djw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHQRGNTOzlKqVqDt8N+FnCnjTYkaFH1c2pMZHiLfNF8=;
 b=ey388Q7fIsRNut1llg8XKTfC7AiN67rLvXWOZixhxZX/tjnKSEdGABQtkyHx1pn5qIyLleDOqmIw9BOvPZijKK93cLPmuH8m+Neo6s/rDszVLNUlCebOod2y6UUv2AcK+A9ijVHE3lBlLV7HcI0MLgjj1ec5YBtuHSTfXeiPC1UmGYF7qGS0hJ3I4MPUyzHFKmu3sttuKXrjkCxit/dJm+6iLBPY1xh4eJMnVsmx4SN2Hun3pG8C6A2xWa4LXr+/IGpW1zX4RzCF1wx6IYHAKj9TvHH8pSiEGlrKkAyRZX8mO4o4f66XN69YO8pXsG+kb+y5jmLKGXlstueACiw/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHQRGNTOzlKqVqDt8N+FnCnjTYkaFH1c2pMZHiLfNF8=;
 b=FVshWNAW/3l1qSQqwozU77CFK6DNOnRt4L6xCB2nbmNK651LGbW+H+DKiTwoKgokAV7FkA5K8xK4KLHtiKiprYPxFzb25Vi+dMbLvy0lxqJM1k150nWmVjTC0blxAXopieKdQanhPyMbXbRgfXt/336Lgtdudz505HacBPiAPQ8=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB1564.namprd11.prod.outlook.com (2603:10b6:4:d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Thu, 3 Dec 2020 15:57:19 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::bd:d714:9733:4ca]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::bd:d714:9733:4ca%7]) with mapi id 15.20.3632.019; Thu, 3 Dec 2020
 15:57:19 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: intel: sof_rt5682: Add support for tgl_rt1011_rt5682
Thread-Topic: [PATCH] ASoC: intel: sof_rt5682: Add support for
 tgl_rt1011_rt5682
Thread-Index: AQHWyFDFqs4HPmArj0WrMEW1nixp16nj7BUAgAGc0xA=
Date: Thu, 3 Dec 2020 15:57:19 +0000
Message-ID: <DM6PR11MB3642703026686BCA8200BE2F97F20@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20201202015826.7678-1-brent.lu@intel.com>
 <9d3d76fd-869c-ec20-0fa0-a0da88e32502@linux.intel.com>
In-Reply-To: <9d3d76fd-869c-ec20-0fa0-a0da88e32502@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.136.119.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b07f221e-406b-48d7-6b44-08d897a41d5b
x-ms-traffictypediagnostic: DM5PR11MB1564:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB15648B9DED33CD4589503D5197F20@DM5PR11MB1564.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JAoJa9jo+aGj/s9TvYEz4q9hKqF28/tD717yPcHnUWd6RbZQRyERd9kQSPRpeAXIoYLnqw8/i85s/UU/TFsoXGAv39D74aD8Uihf1p9aS5rhNEhNdqyeU1B3WfKtA2nDJyb/rTFpRN5E9wRZwKMzWEvGLE8+X8pZzr6yL2BUhfpKQsvmVos0U45CTunlNJOwhA0sO8ORSR2l36hXvX+zkCaXYjGBnWMUV65FRIZtskJ3LgLaK9jPX/sMeAUsuWp+ffgwuOjtZQIMlU150fFCQ8NB2guRxb+gC2WfVZ8u6VrSX6WFxKHNJ605mhmBQX+YEHJIrvgxOulKYk1jfHTApg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(26005)(478600001)(52536014)(4326008)(71200400001)(186003)(6506007)(5660300002)(55016002)(8936002)(54906003)(2906002)(9686003)(33656002)(316002)(66476007)(7696005)(8676002)(86362001)(7416002)(110136005)(66946007)(76116006)(66446008)(4744005)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WkMvNDRxeFFteVZPcGZhRDVHeHZFcC9hVldVYjR5czVUVkRmWTlWbndiemhy?=
 =?utf-8?B?NENWQ2FqZ2QzMm5sWDFqOGhhVDZ3dlRzT2I0YXZGeDBnakxiM1orNTRJZGNr?=
 =?utf-8?B?VDl6bzY0S3RUU00xWVN4SXU1UkxOcnBkMWxRZnVqdmhtQWNXTGo5V3dpSm9s?=
 =?utf-8?B?NzJHRVdPV1lKeHN3YStiM2tnUGEvY1BtbVlCbmpKb2U5RWhLTGhZUEE2NVpj?=
 =?utf-8?B?cTJKb04rVVJwazRzODU5djRTWWkvSDNOeGpPQVV4T3BOT0JMeWpZL3h6UXRR?=
 =?utf-8?B?dlJaMmNtVGo1N1NVY0RLZ3FJakc2UUUrUkdyYVNmR2pOOCtGMjZPODI4dm9m?=
 =?utf-8?B?NlJrbFM2My9kQzhvL2YwZnAxTTJSUkdoZWJHMnl3bWF4bUpnMWRmOEFiN3F0?=
 =?utf-8?B?bFc1Um1tZjBCWlJxenhVbkVzRUU0ZDFWNk9oR3pJMjQ0Qjh0L0pJYkVOZ1Mr?=
 =?utf-8?B?YTlUd0c4TjdHQzFoYThUemFNQVZSeDBzU3FFa2NCa1R3NHJOZ0dXMFJZZ3NQ?=
 =?utf-8?B?V0F2V3dtUFVCWS9pb01IR2U0UU1JVll2TFRoaEl1bFpicGtZWG00NXJjY2hP?=
 =?utf-8?B?UTFSQlV1SkZDNC85c21hbk1oT1daVXA3cExMbS9rV2J2L3RLUUhsK2FxYlJQ?=
 =?utf-8?B?RmpkWTdOUnJoMXlPUmU5RUVoTFpZTkpOUFh5bGl1SEhBcWd2TitLSCtvL0Za?=
 =?utf-8?B?SUdlZDczVHc3UHlWNDBHL1NOZnhldFJXc0VWOEhUQ0RIbzdnTUtHbU9PNCt6?=
 =?utf-8?B?TnByZUExeENHZTRYRWxCaVNMUHA1UmFsQUtDZmJiZ2t4TEM1eFk3NWJ5dS9y?=
 =?utf-8?B?aWdydC9HV3N2c0MzUE1FMHladmxYcHhDdFhWcTNlU1lJMjVHSVkrT3JzYmJ2?=
 =?utf-8?B?NWZad0FKcWV3Q3hWOXBKY0JNNWRoeGcrc1FRN0NBWEwza3U2MVlUWE1UekVx?=
 =?utf-8?B?eE50bmpDOFgyM3VIQkd2K2FSTWxTdnJKV003NUFTQW5KUVhwaDdpSDN2YThQ?=
 =?utf-8?B?NmJkUnhVbEF6U1pFVUtIYXFqQjJ0MTVSaW9QaVdJd01oZ0loUENMaExCZGNR?=
 =?utf-8?B?NjFPT3lsckVkUXl1Q2s4b0FZbSs4WURyZk9pOFZ1b0szT1VYNVh6SWFIT2FQ?=
 =?utf-8?B?aERzYTlzOU9PY0svbDh1VzBpaFB1am4velJ1NnMrY2FWeUlnbEJuSklHOVM1?=
 =?utf-8?B?by9lRFdYbFZvNk9sWVJWaUU3YlZaZ3pTalNuLzRialNpQlNsSDAwRFdidDM2?=
 =?utf-8?B?TnNuSmRFUWgwUnVpWkRab05jMHFRdmVMT0pXeU5RRGxNeG1Cd25NbGEyVXll?=
 =?utf-8?Q?bSTwS+zXMEfo4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07f221e-406b-48d7-6b44-08d897a41d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 15:57:19.4577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JX0TAtDmPakHCfluYURkVYMnsnLBQYb9FM2WrsIe3QngN0xdv6HasTMHNJ3YU+q+Ze9bLOVSZaZtYGAVZo3Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1564
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>, "Nujella, 
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, "M,
 Naveen" <naveen.m@intel.com>, Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 "Zhi, Yong" <yong.zhi@intel.com>
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

PiA+ICtzdHJ1Y3Qgew0KPiA+ICsJdW5zaWduZWQgaW50IHR4Ow0KPiA+ICsJdW5zaWduZWQgaW50
IHJ4Ow0KPiA+ICt9IHJ0MTAxMV90ZG1fbWFza1tdID0gew0KPiA+ICsJey50eCA9IDB4NCwgLnJ4
ID0gMHgxfSwNCj4gPiArCXsudHggPSAweDgsIC5yeCA9IDB4Mn0sDQo+ID4gK307DQo+IA0KPiBh
cyBub3RlZCBpbiB0aGUgR2l0SHViIHJldmlldyB0aGlzIHNob3VsZCBiZSBzdGF0aWMgYW5kIHBv
c3NpYmx5IGNvbnN0Lg0KDQpXaWxsIGZpeCBpbiB2Mi4gQWxzbyBhZGQgY29uc3QgdG8gc3RydWN0
dXJlcyBpbiBzb2MtYWNwaS1pbnRlbC10Z2wtbWF0Y2guYw0KYW5kIGluY2x1ZGUgZmlsZSBpbiBz
b2ZfcmVhbHRla19jb21tb24uYw0KDQpSZWdhcmRzLA0KQnJlbnQNCg0K
