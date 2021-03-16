Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E733D73D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 16:22:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8791E18B4;
	Tue, 16 Mar 2021 16:21:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8791E18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615908124;
	bh=EBhvFWRuK8LUdjvVldRxzoMRoPT+Flr68e5RDn/50UY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjtYXeIcHGgO0mkzedVhnJMawQV5dmBuH10SObim7I+ecsaGNqtDTQ2KIKticeBRG
	 b4qFlXj2FO4iGQf5i09BQRCGZBBpw2gyTCrB82mTDm95oB9ezldc0MMXzTtwyhUEMC
	 EWZ3Zk4uKtbSY4GSCF2aRhlfEvvV+mEDSGIeM8WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033E6F80156;
	Tue, 16 Mar 2021 16:20:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82BCFF80163; Tue, 16 Mar 2021 16:20:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64C37F8013F
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 16:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C37F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="C3AYrqBO"
IronPort-SDR: UAyfdX58D9uRFI30lbcT6UX63h7f1Qgz5k9v24Kn+1JTDxHC6sugTXaNmuOtX0Y3ENnD26drGq
 Qr2q7eo5xF2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="169192116"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="169192116"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 08:20:16 -0700
IronPort-SDR: S5ezofNbvD8/Ky/oYvYdCURsJZwsoWBN9GLaSFYQYQeRmphU0w7v4kSbyZE2Zm6AsZip+qWOe5
 iFEC88wfWkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="378900358"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2021 08:20:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 08:20:15 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 08:20:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 16 Mar 2021 08:20:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 16 Mar 2021 08:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa7L+2mQ1qlZ9xlxU4CGF0MGe7q0TZWQF3VIXMooOj5Z9t2yH2A8XQMyUY38eD81YkjJg3/E0vxiuPkdlFHP7SOweX9/1QbQdyiL+LC5LUs1TmDvI90IRCkrxtDDIPLElDau3RoXNmh74FpxaVU7jM1hsQ5m7xeXGgcROHsLlrznLdzrZDaDU81ZIuj41w/qMfGy7epD7IWwkOBQou9p2enrKRxL3mEpftWXrZfP5v+nQRnf5fHgcTgaK58kTJ1OLd7jW2l8pnbcLwYto1cX57IyozcpxCyruLzgnYprw1xGti0IdA0REpIAPyNxCKbmo/2d05VLocbs8vJLTS9nCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBhvFWRuK8LUdjvVldRxzoMRoPT+Flr68e5RDn/50UY=;
 b=Hm+odiRSNbw0OkBTzmBJtEFcQi48S3naMNdUuafN7W3RQITwNweDcCC3IkexY4241Zrgp+VOogOjTsPTv+sAkHEwReUyeq4OzO/2AqGlcMXtvuLh4VMqlkwF/X9pekYGRdFo9CeDyp3dNV6715s1/OEqcjSIBgLumekG54Ty4k8i32g5ZIPPOaen1AeYZkZsMYABo+cI921NbuUuFWSmc/0zDk2ZscdpnUizSs59UGd/OvevvFccThGuiv8K0owgIGzLDbYJhHfr2LKLPx+sNJDatrvA7vikHX4Eoi6/sgUuMghtMzpzSJKJc99j4CN1Tf3pa4HSeRuXsf39O7h1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBhvFWRuK8LUdjvVldRxzoMRoPT+Flr68e5RDn/50UY=;
 b=C3AYrqBOXhy0Epx7uMrBBH7iWr1c1MsIP7LYHZjqixPM6wu2ZxShK7OdPcRKq1AojK3Y/m09FZttgLF9H9RmcuDgo3vEPTUxNd7kLeq4Umbq/r/8t2C5oA62ybzjnorRaDnSfp9UWfjW21sXRSEr/957C9px0lySnjrbzwUZVHg=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 15:20:11 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f135:7a69:c586:6a22]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f135:7a69:c586:6a22%2]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 15:20:11 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Topic: [PATCH v2] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Index: AQHXGkvAdLyP5wwwj0ysOm95FV+F/KqGtqwAgAAAbrA=
Date: Tue, 16 Mar 2021 15:20:11 +0000
Message-ID: <DM6PR11MB3642B7F0E8D288CFD7772CBB976B9@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20210316094632.12360-1-brent.lu@intel.com>
 <3e48f98a-247f-1784-2d72-ccd6feae1cd4@linux.intel.com>
In-Reply-To: <3e48f98a-247f-1784-2d72-ccd6feae1cd4@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: b5ac1bb0-b730-4134-a934-08d8e88efdd8
x-ms-traffictypediagnostic: DM6PR11MB4689:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4689E2E503D260ED3611C5B8976B9@DM6PR11MB4689.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CB1ndK5MKt1zdcT3KnLZENpB01oOfUhoJxt4VgrBdmTTQ2Jm6zZeAskORoAV/OTc45N/In22Mepg+2VeRkPqAEsguKVuTxEQ48U+3uB8YpsTV/Nx2Z1fE18wypdOi7iOj/F+AtO9CyI7lwa5XU6NXPdqe3L8+26CXEi3y00uhshXuby82ZiZelkIUZsRBMmonOfeRp2YbDOH0f3QAHvUjA2GNawu1hQLIlWz9LusHxHqzIwJhp78oszGNOt5O6MWEfug5OwGawhnlzq123W1U/LMurbPs2e9tf3+K8ekVKP9mOTbcfy0+eQKyz1tOiY2HvfRbW857SALcmeXyZ16L4FgDwD+5nsVozFWSPZBLO38bFPGtU8TiEZilm2shQEIVKHVgNsDaEG1P+UIU77XUkmb9FITWwzeiRXwAo1C6TuzKDg/ZIHy3P8EyW2LdCY6arFFJlVE7WhpZeOKpXd0YxkGouByhx5NVVhBD+rL8IaJoux4hZrm7UOoPL5o7r0ufLIgyGk3Ab/4jJ23+5VbpUOvmyigroiUFPyKp7N4zIyJ1rfjcNucB0jjoy836c4W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(33656002)(76116006)(4326008)(66446008)(9686003)(7416002)(2906002)(54906003)(26005)(7696005)(66946007)(110136005)(6506007)(8676002)(86362001)(5660300002)(498600001)(66476007)(66556008)(64756008)(52536014)(186003)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OUlmbjUrUjZHYWtLS1FsN0RYemlJMUVrenJ5VTdSSTI1ZjAxcEhIQU1MbmFT?=
 =?utf-8?B?TGw5T2VjTFN2OUltNVQ0YndZNGRxVHAxYmdWMkFrQVg3ZlpMK0VaQ0hKdm5l?=
 =?utf-8?B?a3lWK2hicmxMWWlrLzNYYnMwZGx6WitSOEhDOGdEbEJqWVZZRUJ2RGNpbExB?=
 =?utf-8?B?YWlYS0plZ01vNlEyWXFJcWk3aUw5ZGUvcENzRE9vYXZkRkUwdmlzdXlPdHR0?=
 =?utf-8?B?dG5Ma3B4V3h6Tk5YWTZVbXJHcmVieU5yMnVJak1OQnlOYXl6NXRqTTBlam1O?=
 =?utf-8?B?dmpMRi92TngxYWlvN2kzcVBnVXBJd1pNVHQ0NDNkODBsWXFrUnRiTXVYdGpI?=
 =?utf-8?B?b0lKNG0xcWpTT1BlOUFDN0NYSjBsN01sN2Z3cXNGM0t4aEpsdWRxNW5LUThI?=
 =?utf-8?B?dDhucG9wU2FDeDkzUG55cjRueS9BOVR1OVJuSWw3ZElxa2QzT3hyTTV2Rkg0?=
 =?utf-8?B?dHRYaGowNVJKbk5wZXQ0Yy84UzNaQ2RYRXBWVlVQcFU0MzM3YTByN21xcFN2?=
 =?utf-8?B?ZnFVWVpOODZXTzljQ2J4c2xpNlJhcncxWnBaNW43ck4rRzkyK1A2eVdKcE5R?=
 =?utf-8?B?TmEvNENCVEowSUV6bitXMWtqY0E0cWxraG8ySnN6cmhYREoxNWtvUmxzbGpU?=
 =?utf-8?B?ZE1HNmZtZkQ0L000OUVBM3J4eFc5MS8wUXFBTmk4Q25kcytkMkFiYi8rK0p4?=
 =?utf-8?B?V2xJOXhiaVBNMnBXMk1HWHM3UG0zanpmQWVSUHBZYW5kUEhrNlVlcE5aYnh2?=
 =?utf-8?B?RFJCNTFmNytoQ1JEWTN0d2RVZVRzd2FyR2pQZGVRSGg5a3FZYkpaVlZUbEwv?=
 =?utf-8?B?ZytMcmJIYjR5TEtQa0pvaU12RU5NWDdYVHFRUzQ3UEl0bnFOQzNQcXh4RFJp?=
 =?utf-8?B?MGpaNkVtOWhCWlFRMXBPU2o3Nkl0azZhNmp4UXdpTUh5TEVWT3dxa1B5ak05?=
 =?utf-8?B?T0taT2hrN25TdVdhV3lNNFNZT2ZOREQ4bFQ2YVpDNll4MmVIZFVzVzdIMGpB?=
 =?utf-8?B?NG5xZTNtU2VHVis1K0lFMS9uZyt5SEZOWjB5WExVMEp5ZUQ3TDI1K2tOK0Zm?=
 =?utf-8?B?QWpITDhXQjI5d1lWS1l1UFBpWlIrcElob0hoQllTdGNCVU9tWDdRanQwZlBi?=
 =?utf-8?B?YVc4ZW1lbWRiUTcvbjZHenMzcXpkS25mcVhmUlUwRlZ1REJST2kxNThIcmla?=
 =?utf-8?B?RzBXa3QrYWpHOHB5M2xjdmFDcHU5L3k3em14aU8vVDNoQjljeS92TStQVHVj?=
 =?utf-8?B?aWlmTzZNZG0rVVhtVS92QnMwamtuMitwKzl6Zyt2cDJONXh6MHQ4WU8zK1gv?=
 =?utf-8?B?T2dNU2JTSDU5ZFlibk82UThzMEhHV1dLckw5dW1rZU1VNUUrOW5pTDlCMkJm?=
 =?utf-8?B?Z0QxUkhiQzErNHZNTGxtQVl4Rlo2U3VFVlBNL21GOE9XVStlS3Fiem5HYzJm?=
 =?utf-8?B?TXJNa0RyOUhqcWdhTHU5QXRYTzlRdzErYXo2a2N4SE5RM0hHQkxabGZka2FE?=
 =?utf-8?B?cDZCV3pHYWd2QTFzSlE5bkp0RndrVExOclhCd2VudU1uMUZFRnJOanFwa3Iz?=
 =?utf-8?B?T2FvaFZtTFI2THhoT05ZSVZ1QnJLTWFzOE5WTnJQdnFKSTlXL25VY3NnT1pV?=
 =?utf-8?B?L3lTK085R2UwRGUvSm8ycFphcVhaQWwyWTJMcHdVKyswcmR6d2QyU1VCVmdE?=
 =?utf-8?B?Njd2RVhpdWhmMnFNQTNaOHJUclFaMmx1bUttV25ONno1dzV4OHFrT3A5S1FX?=
 =?utf-8?Q?SybwRxCURwGWmWMdWFSlGj1KdFXDPWwy9ohq7zW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ac1bb0-b730-4134-a934-08d8e88efdd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 15:20:11.3830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dih6c7WGPgFYSFaoXnuBlhNP8CA/Y1/oSwdf7scSsjrrK7D3+/kAZwGfc/9FaBRkz/fem0XXMrvUptQd/MH4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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

PiA+ICsvKg0KPiA+ICsgKiBydDEwMTU6ICBpMmMgbW9kZSBkcml2ZXIgZm9yIEFMQzEwMTUgYW5k
IEFMQzEwMTVRDQo+ID4gKyAqIHJ0MTAxNXA6IGF1dG8tbW9kZSBkcml2ZXIgZm9yIEFMQzEwMTUs
IEFMQzEwMTVRLCBhbmQgQUxDMTAxNVEtVkINCj4gPiArKi8gc3RhdGljIGNvbnN0IHN0cnVjdCBz
bmRfc29jX2RhcG1fcm91dGUgcnQxMDE1cF8xZGV2X2RhcG1fcm91dGVzW10NCj4gPiArPSB7DQo+
ID4gKwkvKiBzcGVha2VyICovDQo+ID4gKwl7ICJMZWZ0IFNwayIsIE5VTEwsICJTcGVha2VyIiB9
LA0KPiA+ICsJeyAiUmlnaHQgU3BrIiwgTlVMTCwgIlNwZWFrZXIiIH0sDQo+ID4gK307DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV9yb3V0ZSBydDEwMTVwXzJk
ZXZfZGFwbV9yb3V0ZXNbXSA9IHsNCj4gPiArCS8qIHNwZWFrZXIgKi8NCj4gPiArCXsgIkxlZnQg
U3BrIiwgTlVMTCwgIkxlZnQgU3BlYWtlciIgfSwNCj4gPiArCXsgIlJpZ2h0IFNwayIsIE5VTEws
ICJSaWdodCBTcGVha2VyIiB9LCB9Ow0KPiANCj4gSSBhbSBjb25mdXNlZCBieSB0aGVzZSByb3V0
ZXMuLi4NCj4gDQo+IGlzIHRoaXMgYSByZXN1bHQgb2YgdXNpbmcgdGhlIGNvZGVjIGNvbmZzIGJl
bG93IG9ubHkgd2hlbiB0aGVyZSBhcmUgMiBhbXBzIHdpdGgNCj4gdGhlaXIgb3duIGVuYWJsZSBw
aW4/DQpZZXMsIHdlIG5lZWQgdG8gdXNlIHRoZSBwcmVmaXggaW4gY29kZWMgY29uZnMgd2hlbiB0
aGVyZSBhcmUgdHdvIGRldmljZSBpbnN0YW5jZXMuDQoNCj4gDQo+IFlvdSBzdGlsbCBoYXZlIDIg
YW1wcyBldmVuIGluIHRoZSAxZGV2IGNhc2UsIHNvIEkgd2FudCB0byBtYWtlIHN1cmUgdGhlIGNv
ZGUgaGFzDQo+IGVub3VnaCBjb21tZW50cyBzbyB0aGF0IHdlIGRvbid0IGxvc2UgdHJhY2sgb2Yg
dGhlIGRlc2lnbi4NCj4gDQo+IFRoZSByZXN0IG9mIHRoZSBjb2RlIGxvb2tzIGZpbmUuDQo+IA0K
VGhlcmUgYXJlIGFsd2F5cyB0d28gYW1wcyBvbiB0aGUgYm9hcmQgZm9yIHN0ZXJlbyBvdXRwdXQu
IElmIHRoZSB0d28gYW1wcyBzaGFyaW5nDQpvbmUgZW5hYmxlIHBpbiwgT0RNIHdpbGwgaW1wbGVt
ZW50IG9ubHkgb25lIGRldmljZSBpbnN0YW5jZSBpbiB0aGUgQUNQSSB0YWJsZQ0KYmVjYXVzZSB0
aGVyZSBpcyBvbmx5IG9uZSBHUElPIHRvIGNvbnRyb2wgaW4gY29kZWMgZHJpdmVyLg0KDQpJJ2xs
IHVwbG9hZCBhIHYzIHdpdGggbW9yZSBjb21tZW50Lg0KDQoNClJlZ2FyZHMsDQpCcmVudA0KDQo=
