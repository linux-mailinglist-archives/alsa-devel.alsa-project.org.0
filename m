Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CA12414E0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 04:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931C81665;
	Tue, 11 Aug 2020 04:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931C81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597112333;
	bh=cO5E6Zj4I4fW6s0YVxrtHIccIX5GIO4qQSHL6AfBZBA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpXvJ3fn4T/9zZMVmrygfjKM+iKGCCsF6/Rvs00tDm1JTVjs0VrFjz00AweB+IJr9
	 LYZE6dyCBVg4xPJM83YBG4OlaMOHVTNn1WF/IGyNgZPRNuQxq7O00amHmyfRNVnjnM
	 S/CtLz4ybYSGya5aCPb3YC/rsgjZPznScQ66nvio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA34F8014C;
	Tue, 11 Aug 2020 04:17:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FEACF800D3; Tue, 11 Aug 2020 04:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B984FF800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 04:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B984FF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="r9HoV5SD"
IronPort-SDR: w7FLj3yxiuVs3g5iD9ldyuRAgqFXBUGngYbqFyuiB8AtZNWaMWSc0alXr4bgSLAsv8x+CQgV1S
 uk0DduEYAZfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="133193528"
X-IronPort-AV: E=Sophos;i="5.75,459,1589266800"; d="scan'208";a="133193528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 19:16:59 -0700
IronPort-SDR: HKMnEe/QMyAnlG0IX+bvpEsdAIi+0PIiP1OfrpB88NQcCn+g8Uz7yZ2ATiclT4qSG5HfK+oJkA
 M5tVhf7hI1Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,459,1589266800"; d="scan'208";a="368817691"
Received: from orsmsx601-2.jf.intel.com (HELO ORSMSX601.amr.corp.intel.com)
 ([10.22.229.81])
 by orsmga001.jf.intel.com with ESMTP; 10 Aug 2020 19:16:58 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Aug 2020 19:16:58 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 10 Aug 2020 19:16:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 10 Aug 2020 19:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTzORw2cRm99gcBN1C99g8Z6viEPageR99JJaqxEXBBWWQ9CdNz08qn94MkYhMUd+1xGjTuksydxVWG4F3yNRiIa+8nPDHqRTxsoHrRjmTi88iGD024fzem5C3+SGysgK+zvgxTTiAvV6dCTrdfLQfQLggaFsftO7ZuFM7FK79apISt1qGz+mDphjCJeh2fw4sM6mu1CXQx/fDyzFjDvTAm7e3/vbXmpkobujxjIrntNzumtFWk4SEgPK+xPNEtdUziStug+2Kgt1Wc64JX7dxPMq9SnkU3eRB5whXB2XOxQfUkV5aarNTVOIrRAr0QkK4DI4XyOiFxYQqgRIg16qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO5E6Zj4I4fW6s0YVxrtHIccIX5GIO4qQSHL6AfBZBA=;
 b=Kh0If+hMPYKEopWZaaqYsrl+Bf3mzt3uiPpY1GhWHqprU5DDRhNpCqlpScoLXfAEVqb51coQX2GwiLa2jcO73EggMFupPK+72eCIcPiwsSO1HKrliDx0Xk40e0C+qirI7A18L/AMxKXx6aWYmRUIeaaORk5WEr7c9IKPr2CZPSGKKUo+ZiCK25PtWVrRJjbYxvepD00en3a/dXT8y04pmgAY6/x4IQkwlANkn2Arquj+gyOgNohEs9Mb05EiT6egdoYg+Lo2xNs/MOTS1hnedQVBs1GbqIPgvoT8zIVIk9uKXV+PotIXb/9JVCzZFWVMxtIzuNbwWpj4XM6mbN0GRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO5E6Zj4I4fW6s0YVxrtHIccIX5GIO4qQSHL6AfBZBA=;
 b=r9HoV5SDSJHZoTLmx5E+NYYUS7iB56QgJRYUycORKf2SnX1X825cRtk4ARPX2mSonel/wI9nWVm/8x0el7Gq8VcRFpZXqY2QyAWymwAof6V1zx945waKCnLVDMkSa0X/SKfwgsxz5fRJVT9jFI0Hk63Kp47qRD8c1S2AmFJqQ4s=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB0042.namprd11.prod.outlook.com (2603:10b6:4:6b::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Tue, 11 Aug
 2020 02:16:55 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 02:16:55 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZzZzIgMFwAI7HkKT1/DPVspAl6khsDgAgAFDasCAAAm3gIADX8DAgAAlz4CAABcIUIAABbiAgACx9iCAALX6gIADSeRAgAYuywCAACtmAIAAiqgQ
Date: Tue, 11 Aug 2020 02:16:55 +0000
Message-ID: <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-3-git-send-email-brent.lu@intel.com>
 <s5h5za3ajvb.wl-tiwai@suse.de>
 <DM6PR11MB3642AE90DF98956CCEDE6C2F974F0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hd04a90o4.wl-tiwai@suse.de>
 <DM6PR11MB3642B5BC2E1E0708088526D8974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <63bca214-3434-16c6-1b60-adf323aec554@linux.intel.com>
 <DM6PR11MB3642D9BE1E5DAAB8B78B84B0974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hpn873by6.wl-tiwai@suse.de>
 <DM6PR11MB36423A9D28134811AD5A911F974A0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
 <DM6PR11MB364259049769F6EF3B84AABD97480@DM6PR11MB3642.namprd11.prod.outlook.com>
 <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
In-Reply-To: <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.212.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 421ebebf-54ca-4e22-5b96-08d83d9c9e73
x-ms-traffictypediagnostic: DM5PR11MB0042:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0042D2F09A1292DF86BFA8B297450@DM5PR11MB0042.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9/P5NoPkwb6TGwENf6KhuHhUNF2YhX680e6Fm1s+nO2oK/igTbpX+wrq0skr9tL/g98ydzR2McL3+c3uwn/EfsrcJ5rJiZTlu7K/3oYNXWDp0Yn+0jE+auP0IHS42F3La44s1rjUAtbENGyucKcXOm9AeXDqxeUHzWNu9gk9R2+0WFiGmNVNxbUmfV4e5kOmOwqSa8Zn3btk99FLtJF7+MKUW9rNbJwLY81arohE96HG9EYIsNL0vqLSwZIm6lprIK10Z80o0tWXGIuDETYv5wnW9GS64jjpTB2h6xOoHWdMwKwKnsn6cxLAcJDaEbXQ7JZVbhgT1YgNbNdd/Jp7WA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(71200400001)(478600001)(86362001)(76116006)(26005)(64756008)(6506007)(66946007)(66446008)(66556008)(66476007)(83380400001)(5660300002)(52536014)(8936002)(8676002)(7696005)(9686003)(4326008)(316002)(186003)(7416002)(2906002)(55016002)(110136005)(54906003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bnliXy0pvk12l/ZDj/oPO0NZS07qtD+iOKwg4z7a+JEUDxDD/lIhqGdbA0OLi+G5Lee4Je5r19qDYrmCFNJnW8SB7ENtaHmYPJQ3I+2u8sp8o5kN3j4hSEaMpCMmld/IX9fB14oywm0xqD8YyiLae0GShY+9Xaw1BlZUKJW+fojS4X88NytEjJ5BsdP3U9uwAuW2aWMk/BiuXm5KOeDdqcHogzA4P+Vf9ZYRJjluLlmZy+pq2nIqDmIhBbzjerQvo0fjRhJSoAdaql6e0ly3IYchfQdIPChJ/LJ+VKIItDqT/SNrYVovDVVENkWjTz1bRxwLp/9YIZIDQJya9qi+1FwbXyRT5OvwlZVkzvdz/s1RONZcNYNOkN0CcRlyOySzqe9qpv8+U7A1xqPUJRYb1kYfBXmOJ8dY3nr1vYYgc24QmXEMr/Vp0iZh92z+KecE/+BpVkemWJRak1iMWwRjLC4brl/Z91ocl3xNay+hjnrVtGHgTtDS1Q6daIYO1q+2USXQEuOTzAg5IdipStaJ6XJeUrl+JB3DC4mwDHtRdjX7TljrNZDtfBWJggJ4FwYmVvRzsi/d64c6cQQx0TknGzfihHdQRrb9DIoOC7tDz+gyH4wPDgAiArQ/1yCTym4YmtWrcKvNKRnZyKsC/W5UZQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421ebebf-54ca-4e22-5b96-08d83d9c9e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 02:16:55.4468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Lj3CkhLadvZtNf0zDfOk2ugWFRnRFGG8BjVMZChrqZeCMK239VIe2iphcb4xeMvjM1Lflhnu/yJ4CV1QVB6Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0042
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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

PiANCj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBDUkFTIGRvZXMgbm90IHNldCB0aGUgcGVy
aW9kIHNpemUgd2hlbiB1c2luZyBpdC4NCj4gVGhlIGRlZmF1bHQgcGVyaW9kIHNpemUgaXMgMjU2
LCB3aGljaCBjb25zdW1lcyB0aGUgc2FtcGxlcyBxdWlja2x5KGFib3V0IDQ5NjI3DQo+IGZwcyB3
aGVuIHRoZSByYXRlIGlzIDQ4MDAwIGZwcykgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgcGxheWJh
Y2suDQo+IFNpbmNlIENSQVMgd3JpdGUgc2FtcGxlcyB3aXRoIHRoZSBmaXhlZCBmcmVxdWVuY3ks
IGl0IHRyaWdnZXJzIHVuZGVycnVucw0KPiBpbW1pZGlhdGVseS4NCj4gDQo+IEFjY29yZGluZyB0
byBCcmVudCwgdGhlIERTUCBpcyB1c2luZyAyNDAgcGVyaW9kIHJlZ2FyZGxlc3MgdGhlIGh3X3Bh
cmFtLiBJZiB0aGUNCj4gcGVyaW9kIHNpemUgaXMgMjU2LCBEU1Agd2lsbCByZWFkIDI1NiBzYW1w
bGVzIGVhY2ggdGltZSBidXQgb25seSBjb25zdW1lIDI0MA0KPiBzYW1wbGVzIHVudGlsIHRoZSBy
aW5nIGJ1ZmZlciBvZiBEU1AgaXMgZnVsbC4gVGhpcyBiZWhhdmlvciBtYWtlcyB0aGUgc2FtcGxl
cyBpbg0KPiB0aGUgcmluZyBidWZmZXIgb2Yga2VybmVsIGNvbnN1bWVkIHF1aWNrbHkuIChOb3Qg
c3VyZSB3aGV0aGVyIHRoZSBleHBsYW5hdGlvbiBpcw0KPiBjb3JyZWN0LiBOZWVkIEJyZW50IHRv
IGNvbmZpcm0gaXQuKQ0KPiANCj4gVW5mb3J0dW5hdGVseSwgd2UgY2FuIG5vdCBjaGFuZ2UgdGhl
IGJlaGF2aW9yIG9mIERTUC4gQWZ0ZXIgc29tZSBleHBlcmltZW50cywNCj4gd2UgZm91bmQgdGhh
dCB0aGUgaXNzdWUgY2FuIGJlIGZpeGVkIGlmIHdlIHNldCB0aGUgcGVyaW9kIHNpemUgdG8gMjQw
LiBXaXRoIHRoZQ0KPiBzYW1lIGZyZXF1ZW5jeSBhcyB0aGUgRFNQLCB0aGUgc2FtcGxlcyBhcmUg
Y29uc3VtZWQgc3RhYmx5LiBCZWNhdXNlIGV2ZXJ5b25lDQo+IGNhbiB0cmlnZ2VyIHRoaXMgaXNz
dWUgd2hlbiB1c2luZyB0aGUgZHJpdmVyIHdpdGhvdXQgc2V0dGluZyB0aGUgcGVyaW9kIHNpemUs
IHdlDQo+IHRoaW5rIGl0IGlzIGEgZ2VuZXJhbCBpc3N1ZSB0aGF0IHNob3VsZCBiZSBmaXhlZCBp
biB0aGUga2VybmVsLg0KDQpJIGNoZWNrIHRoZSBjb2RlIGFuZCBqdXN0IHJlYWxpemVkIENSQVMg
ZG9lcyBub3RoaW5nIGJ1dCByZXF1ZXN0IG1heGltdW0gYnVmZmVyDQpzaXplLiBBcyBJIGtub3cg
dGhlIGFwcGxpY2F0aW9uIG5lZWRzIHRvIGRlY2lkZSB0aGUgYnVmZmVyIHRpbWUgYW5kIHBlcmlv
ZCB0aW1lIHNvDQpBTFNBIGNvdWxkIGdlbmVyYXRlIGEgaHdfcGFyYW0gc3RydWN0dXJlIHdpdGgg
cHJvcGVyIHBlcmlvZCBzaXplIGluc3RlYWQgb2YgdXNpbmcNCmZpeGVkIGNvbnN0cmFpbnQgaW4g
bWFjaGluZSBkcml2ZXIgYmVjYXVzZSBkcml2ZXIgaGFzIG5vIGlkZWEgYWJvdXQgdGhlIGxhdGVu
Y3kgeW91DQp3YW50Lg0KDQpZb3UgY2FuIHVzZSBzbmRfcGNtX2h3X3BhcmFtc19zZXRfYnVmZmVy
X3RpbWVfbmVhcigpIGFuZA0Kc25kX3BjbV9od19wYXJhbXNfc2V0X3BlcmlvZF90aW1lX25lYXIo
KSB0byBnZXQgYSBwcm9wZXIgY29uZmlndXJhdGlvbiBvZg0KYnVmZmVyIGFuZCBwZXJpb2QgcGFy
YW1ldGVycyBhY2NvcmRpbmcgdG8gdGhlIGxhdGVuY3kgcmVxdWlyZW1lbnQuIEluIHRoZSBDUkFT
DQpjb2RlLCB0aGVyZSBpcyBhIFVDTSB2YXJpYWJsZSB0byBzdXBwb3J0IHRoaXM6IERtYVBlcmlv
ZE1pY3Jvc2Vjcy4gSSB0ZXN0ZWQgaXQgb24NCkNlbGVzIGFuZCBpdCBsb29rcyBxdWl0ZSBwcm9t
aXNpbmcuIEl0IHNlZW1zIHRvIG1lIHRoYXQgYWRkaW5nIGNvbnN0cmFpbnQgaW4gbWFjaGluZQ0K
ZHJpdmVyIGlzIG5vdCBuZWNlc3NhcnkuDQoNClNlY3Rpb25EZXZpY2UuIlNwZWFrZXIiLjAgew0K
CVZhbHVlIHsNCgkJUGxheWJhY2tQQ00gImh3OmNodHJ0NTY1MCwwIg0KCQlEbWFQZXJpb2RNaWNy
b3NlY3MgIjUwMDAiDQouLi4NCg0KWyAgIDUyLjQzNDc2MV0gc291bmQgcGNtQzFEMHA6IGh3X3Bh
cmFtDQpbICAgNTIuNDM0NzY3XSBzb3VuZCBwY21DMUQwcDogICBBQ0NFU1MgMHgxDQpbICAgNTIu
NDM0NzcwXSBzb3VuZCBwY21DMUQwcDogICBGT1JNQVQgMHg0DQpbICAgNTIuNDM0NzcyXSBzb3Vu
ZCBwY21DMUQwcDogICBTVUJGT1JNQVQgMHgxDQpbICAgNTIuNDM0Nzc2XSBzb3VuZCBwY21DMUQw
cDogICBTQU1QTEVfQklUUyBbMTY6MTZdDQpbICAgNTIuNDM0Nzc5XSBzb3VuZCBwY21DMUQwcDog
ICBGUkFNRV9CSVRTIFszMjozMl0NClsgICA1Mi40MzQ3ODJdIHNvdW5kIHBjbUMxRDBwOiAgIENI
QU5ORUxTIFsyOjJdDQpbICAgNTIuNDM0Nzg1XSBzb3VuZCBwY21DMUQwcDogICBSQVRFIFs0ODAw
MDo0ODAwMF0NClsgICA1Mi40MzQ3ODhdIHNvdW5kIHBjbUMxRDBwOiAgIFBFUklPRF9USU1FIFs1
MDAwOjUwMDBdDQpbICAgNTIuNDM0NzkxXSBzb3VuZCBwY21DMUQwcDogICBQRVJJT0RfU0laRSBb
MjQwOjI0MF0NClsgICA1Mi40MzQ3OTRdIHNvdW5kIHBjbUMxRDBwOiAgIFBFUklPRF9CWVRFUyBb
OTYwOjk2MF0NClsgICA1Mi40MzQ3OTddIHNvdW5kIHBjbUMxRDBwOiAgIFBFUklPRFMgWzg1Mjo4
NTJdDQpbICAgNTIuNDM0Nzk5XSBzb3VuZCBwY21DMUQwcDogICBCVUZGRVJfVElNRSBbNDI2MDAw
MDo0MjYwMDAwXQ0KWyAgIDUyLjQzNDgwMl0gc291bmQgcGNtQzFEMHA6ICAgQlVGRkVSX1NJWkUg
WzIwNDQ4MDoyMDQ0ODBdDQpbICAgNTIuNDM0ODA1XSBzb3VuZCBwY21DMUQwcDogICBCVUZGRVJf
QllURVMgWzgxNzkyMDo4MTc5MjBdDQpbICAgNTIuNDM0ODA4XSBzb3VuZCBwY21DMUQwcDogICBU
SUNLX1RJTUUgWzA6MF0NCg0KUmVnYXJkcywNCkJyZW50DQoNCj4gDQo+IFRoYW5rcywNCj4gWXUt
SHN1YW4NCg==
