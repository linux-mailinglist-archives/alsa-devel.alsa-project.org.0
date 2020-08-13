Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633324359B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 09:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101A21660;
	Thu, 13 Aug 2020 09:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101A21660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597305463;
	bh=yYVhLOE5V+J7kHnn/lWJvJwrZ5YAbWQg5zG7CKcH88c=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nAO6JfJnp6WLYzMnM/vJC/BHAEhB95z8slZfOwNLCs7IApS0MpGEGyRI7NKsKARXQ
	 t1BS07M1QL8vRVngak74JDxitPNjTkzg2bHMNEc3advolsAB5WZGbv7JqNUNXCW+6V
	 0N7Q3J1Ey2FUlRyPYG0xoFi4j8AE8Bh6DaFKZcgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342FDF800F4;
	Thu, 13 Aug 2020 09:56:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE8EAF8015B; Thu, 13 Aug 2020 09:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3C4FF800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 09:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C4FF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="QOdD78f3"
IronPort-SDR: ygEQyazjZZrJJun6K27LtnuLVFsZOWQZldqNJAd/Db1cLdB94+U2hFSlRLoHTYbLtRZ6LHa3ig
 xqtTlnI9MyRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="141806064"
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="141806064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 00:55:47 -0700
IronPort-SDR: eHRZJSoMklw2RN+YicjlzZIvr4HTqR9vMFyf3eGNyp5EfLobKYYLhylgDCyWUf1SYh4tn/gHIg
 z7o3Dl+ivg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,307,1592895600"; d="scan'208";a="318432452"
Received: from unknown (HELO fmsmsx605.amr.corp.intel.com) ([10.18.84.215])
 by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2020 00:55:47 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 00:55:46 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 00:55:46 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 13 Aug 2020 00:55:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 13 Aug 2020 00:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOKJOe8kDABnf81XdmA78jPLBJfweqp8Kfm+pkxHDaRTzLD7c+3dppYZ2pc3p4/EBtmhKB2f99Rn5YCZTug2yVlPQ8KfbIxF/uMScZiDpuy7HVkcKWiKRdsdS6YqyIpxaCbpm0J4YYb9M6GR1GvxbWtlo7N8vC5PEdEaGSSP7qrnOG0N76txT477WJil8pUxzRcbA8OccYoGDPTGgrl4xFZyoPV7+ivsZDMnSl7yDbOE49ysElsp4MwbOX165nn/EeSz9USdmTsQFPiH03s97bU4usOc2DywRIlxSngeSJXzXRP6MhRpHkGCPcrETuc0tOnSbMmc93aM2nkYvI508Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYVhLOE5V+J7kHnn/lWJvJwrZ5YAbWQg5zG7CKcH88c=;
 b=enNbigok+Re1kPeIpyTCmzp9gIAy0FageN7A9va+uZ3TeII9+YwQsbpSBZWERU2m6F4YjB/LQ8eMtTM03+AUZ6I5C2y0yP25lpmK8KWW7uuTdTZAqiXzv+WrJnrgRwlRt43xA1ZafBdubNPMbeawpGh0JrJR+F35UcYJGYaGtz+OnR9n9cNkrIrUUTWinB76xLwKF2h7epZJ7WsQtGL7uxrgrAzzGlNG/fQvficQb7DNRLe5XR/HtzPIJxeZwrdXdlhBxhNEXe5ZjAb60zGSxZ8GWGFTcjQILbfynru4C1yEntn53ffIqzxcTOC4r+KZtp59vghLcUV/LHbhjFXcgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYVhLOE5V+J7kHnn/lWJvJwrZ5YAbWQg5zG7CKcH88c=;
 b=QOdD78f3ypKikxB88KEOQ/E6Jo0BiLVQ18p0ynlajV2WGXvZW7u4G0XrI2xOKl1byYD50JUzW/jgaSNm6tp5c4uOOlpzeSoYaAavpPIjfue7D7ZXq9lD5R/hnZP5q7b4GpVFb+kuTPnQKRfbA7p0Cs5+nxsq8skn7d9hYKYzzmM=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3785.namprd11.prod.outlook.com (2603:10b6:5:13f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 07:55:44 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 07:55:44 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZzZzIgMFwAI7HkKT1/DPVspAl6khsDgAgAFDasCAAAm3gIADX8DAgAAlz4CAABcIUIAABbiAgACx9iCAALX6gIADSeRAgAYuywCAACtmAIAAiqgQgAAJsgCAAFelAIAAC9AAgAAD0wCAAA/XgIAAWOKAgAAhvQCAAAewgIAApDwAgAAzaoCAAAsZAIAAAU+AgAAMkQCAAAEQAIAAdTUAgAACd4CAABB9AIAAAZsggAAKpgCAAObvAIAAFs5Q
Date: Thu, 13 Aug 2020 07:55:43 +0000
Message-ID: <DM6PR11MB364285D8B21B723EB88915CB97430@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
 <20200811145353.GG6967@sirena.org.uk>
 <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
 <20200811172209.GM6967@sirena.org.uk>
 <CAGvk5PqGi7cXthLHFi4NyypxFiGnoHvD9vp+5nJdH-_VkVvcKw@mail.gmail.com>
 <s5hr1scz908.wl-tiwai@suse.de>
 <CAGvk5Pp+Gk5Uk-iLdhVPWuCL0FiL9OhsaAtwkotay5JAYUNxdQ@mail.gmail.com>
 <s5hlfikz6y8.wl-tiwai@suse.de>
 <CAGvk5Pq3rEGJX=WjriPfWg_sEAVWHGZ9S=4iySNfYaHX7Xcw0g@mail.gmail.com>
 <s5h8sekz4ox.wl-tiwai@suse.de>
 <e4cc6231-8b19-c145-1b18-91d3a00131d3@linux.intel.com>
 <s5hv9hnx6am.wl-tiwai@suse.de>
 <be45d821-57c6-6ca5-0864-ac3aa521d82e@linux.intel.com>
 <DM6PR11MB364242D3652EDC2F9B8B214897420@DM6PR11MB3642.namprd11.prod.outlook.com>
 <0714b222-d3fc-5744-1147-bfac7df2651e@linux.intel.com>
 <CAGvk5Pqg000SnrRhVD+8cOtAVokomRSa6MLdaKKnY2P6R_ruGA@mail.gmail.com>
In-Reply-To: <CAGvk5Pqg000SnrRhVD+8cOtAVokomRSa6MLdaKKnY2P6R_ruGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.36.93.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19ec3ac1-de2f-42b3-b8df-08d83f5e4821
x-ms-traffictypediagnostic: DM6PR11MB3785:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB378522B4448EF9C67C47139297430@DM6PR11MB3785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9fLuQ5pzX/VR/QCmLCka47e4Avlii8g0JktCXodCJYcB6TJZBUQEBW3VQAWAt/n9gdhBO6ZTyJzEyw1EAN+R9Bs5U1g0K/I6Sum+mJXDoj0QUf4rnuGxRv3vb97YF6FQKVBvVjCTXP1d1l77A3O7GLc9e3oI8inzPpnwteifu5nIo1YvwGYAzgmQTgteNvzgmnCxdh3mO26t0/18KuJ5kPahN6q8pWE+bWAW0Mg+aMVZFSBDnAKKml2hK6PAKQo92Q9UGdaGauYk6zCDcDilDg5qckSL2eftaQ9QbXqKalcyoV1i9xaM+IGmq//tx/VsPSu4j3paiSrMrUPISJvVxmqLfnUWuXdTNDniQY3gH3SH05J7QzAPyIbS19Bm2lvp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(186003)(64756008)(66446008)(7696005)(66476007)(76116006)(66946007)(66556008)(83380400001)(26005)(5660300002)(52536014)(478600001)(7416002)(71200400001)(54906003)(6506007)(86362001)(8936002)(2906002)(9686003)(8676002)(55016002)(110136005)(4326008)(316002)(33656002)(11716003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: oIbMoGJE8aVRNygBYbkz9+Tg73C+EmP31UcsWS77+GsBP8bEVCyS/Tpgf9F4P/bv1c5egzLJIIdJ52SySj+6oST5rB6Hy312g2jRYybUDrE1Dvm6d8yw9p3Y3BsKslm6w7tjZwcoPZR6dg48dRAzjDeX6bqKVhl+ijGeOMHEtYSc6SV/zdonYKYzdPeIZaAQhPamLIsMKRkn7oqfg9ubZAGN0o8HUktqDf3R0TNNJ1ejCgPrrAbg9i+bSQBxvX6xfd7atV7yY6BuJYy5kZyY8s1LrPEnmjUSa5AD0JW2vbEgNQpdDKwxDILptlkzBeKP0B2tUwY6K0ULhd8dbAFMiFy5J8wejXy4yZr+nwwRopH1yWcXGMfj/mDTInU1OBisy2DnqEIy0qQqt1EhaUDUYD21ZYU+gYgx9QNmWbonLt4MCxQVgZ0KHQp9y+2kAr+LvBqWm5NebtrzUYgal9tRoBSm5b0Bel3nG1oQfoWjB0SisaXWoMh6Cbhuo42KrFoJtwEA2Wo1I+870ijBZ/RyQH2wb8jTG8jI9QMNot5Vjr3qh6v1ihMFsQXJ7u2B9C6f30LZz6jl5gGFws0wtUb70wnWQRzZxkQjaKbE68GVpDYzAxgSG/hox0jokAUrcNlSCrPe4+KRfpBKyRTI/49vAw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ec3ac1-de2f-42b3-b8df-08d83f5e4821
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 07:55:44.0751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7CN3buowdNqW/D/HE5r+JBmk1fZ4RAieK/HZBDgdL6AFxIunDQ6JS8Wj/YVl8J7AvhW1F4wUWDWihyv5SBl7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3785
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Sam
 McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

PiA+ID4NCj4gPiA+IENSQVMgY2FsbHMgc25kX3BjbV9od19wYXJhbXNfc2V0X2J1ZmZlcl9zaXpl
X21heCgpIHRvIHVzZSBhcyBsYXJnZQ0KPiA+ID4gYnVmZmVyIGFzIHBvc3NpYmxlLiBTbyB0aGUg
cGVyaW9kIHNpemUgaXMgYW4gYXJiaXRyYXJ5IG51bWJlciBpbg0KPiA+ID4gZGlmZmVyZW50IHBs
YXRmb3Jtcy4gQXRvbSBTU1QgcGxhdGZvcm0gaGFwcGVucyB0byBiZSAyNTYsIGFuZCBDTUwNCj4g
PiA+IFNPRiBwbGF0Zm9ybSBpcyAxMDU2IGZvciBleGFtcGxlLg0KPiA+DQo+ID4gb2ssIGJ1dCBl
YXJsaWVyIGluIHRoaXMgdGhyZWFkIGl0IHdhcyBtZW50aW9uZWQgdGhhdCB2YWx1ZXMgc3VjaCBh
cw0KPiA+IDQzMiBhcmUgbm90IHN1aXRhYmxlLiB0aGUgc3RhdGVtZW50IGFib3ZlIHNlZW1zIHRv
IG1lYW4gdGhlIHBlcmlvZA0KPiA+IGFjdHVhbCB2YWx1ZSBpcyBhICJkb24ndCBjYXJlIiwgc28g
SSBkb24ndCBxdWl0ZSBzZWUgd2h5IHRoaXMgc3BlY2lmaWMNCj4gPiBwYXRjaDIgcmVzdHJpY3Rp
bmcgdGhlIHZhbHVlIHRvIDI0MCBpcyBuZWNlc3NhcnkuIFBhdGNoMSBpcyBuZWVkZWQgZm9yDQo+
ID4gc3VyZSwNCj4gPiBQYXRjaDIgaXMgd2hlcmUgVGFrYXNoaSBhbmQgSSBhcmUgbm90IGNvbnZp
bmNlZC4NCj4gDQo+IEkgaGF2ZSBkb3dubG9hZGVkIHRoZSBwYXRjaDEgYnV0IGl0IGRvZXMgbm90
IHdvcmsuIEFmdGVyIGFwcGx5aW5nIHBhdGNoMSwNCj4gdGhlIGRlZmF1bHQgcGVyaW9kIHNpemUg
Y2hhbmdlcyB0byAzMjAuIEhvd2V2ZXIsIGl0IGFsc28gaGFzIHRoZSBzYW1lIGlzc3VlDQo+IHdp
dGggcGVyaW9kIHNpemUgMzIwLiAoSXQgY2FuIGJlIHZlcmlmaWVkIGJ5IGFwbGF5LikNCg0KVGhl
IHBlcmlvZF9zaXplIGlzIHJlbGF0ZWQgdG8gdGhlIGF1ZGlvIGxhdGVuY3kgc28gaXQncyBkZWNp
ZGVkIGJ5IGFwcGxpY2F0aW9uDQphY2NvcmRpbmcgdG8gdGhlIHVzZSBjYXNlIGl0J3MgcnVubmlu
Zy4gVGhhdCdzIHdoeSB0aGVyZSBhcmUgY29uY2VybnMgYWJvdXQNCnBhdGNoIDIgYW5kIGFsc28g
eW91IGNhbm5vdCBmaW5kIHNpbWlsYXIgY29uc3RyYWludHMgaW4gb3RoZXIgbWFjaGluZSBkcml2
ZXIuDQoNCkFub3RoZXIgcHJvYmxlbSBpcyB0aGUgYnVmZmVyIHNpemUuIFRvbyBsYXJnZSBidWZm
ZXIgaXMgbm90IGp1c3Qgd2FzdGluZyBtZW1vcmllcy4NCkl0IGFsc28gY3JlYXRlcyBwcm9ibGVt
cyB0byBtZW1vcnkgYWxsb2NhdG9yIHNpbmNlIGNvbnRpbnVvdXMgcGFnZXMgYXJlIG5vdA0KYWx3
YXlzIHRoZXJlLiBVc2luZyBhIHNtYWxsIHBlcmlvZF9jb3VudCBsaWtlIDIgb3IgNCBzaG91bGQg
YmUgc3VmZmljaWVudCBmb3IgYXVkaW8NCmRhdGEgdHJhbnNmZXIuDQoNCmJ1ZmZlcl9zaXplID0g
cGVyaW9kX3NpemUgKiBwZXJpb2RfY291bnQgKiAxMDAwMDAwIC8gc2FtcGxlX3JhdGU7DQpzbmRf
cGNtX2h3X3BhcmFtc19zZXRfYnVmZmVyX3RpbWVfbmVhcihtUGNtRGV2aWNlLCBwYXJhbXMsICZi
dWZmZXJfc2l6ZSwgTlVMTCk7DQoNCkFuZCBvbmUgbW9yZSBwcm9ibGVtIGhlcmU6IHlvdSBuZWVk
IHRvIGRlY2lkZSBwZXJpb2Rfc2l6ZSBhbmQgcGVyaW9kX2NvdW50DQpmaXJzdCBpbiBvcmRlciB0
byBjYWxjdWxhdGUgdGhlIGJ1ZmZlciBzaXplLi4uDQoNCg0KUmVnYXJkcywNCkJyZW50DQo=
