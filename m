Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D312868FB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 22:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD5D16B5;
	Wed,  7 Oct 2020 22:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD5D16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602102414;
	bh=EcJE0gsbPVxC4KfBWRE7Tj63Mgrpgqehl3DRcKAGobE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kk+7naSev/18ghI2TxbKJ2EmQWt+Fxg3aPB+EZFhDj57y8OdFprOArUp6E8NIhazL
	 xqFapnp7jbq7MfjoCcmbOZaU2tc2LWAWbiRTJgtzo6Ib6S/ook0JTjFLEfPx7O1Le8
	 +5KOMHThvsuCTAUjAn0VaYa1at8xG8WCaJX5fkP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0167AF80127;
	Wed,  7 Oct 2020 22:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D589CF80128; Wed,  7 Oct 2020 22:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9FDEF80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 22:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9FDEF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="as0y2r/B"
IronPort-SDR: WyXGalMkXPt5bMeT0PU2luVhPevNUirWkcM+2zg+Glo/0P/E5/SQBFqINPa/8z/azZg/QXmknt
 Yi4fP2CKncmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="165182153"
X-IronPort-AV: E=Sophos;i="5.77,348,1596524400"; d="scan'208";a="165182153"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 13:18:53 -0700
IronPort-SDR: 78vL1n9G2PZXIQDsnaHD/v+UZR5JjNY6fE7LkOkvAnCfuvHJ8FznChiBThHinF37tZ5rIgGu/i
 p1E+KIA8YFpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,348,1596524400"; d="scan'208";a="297648263"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2020 13:18:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 13:18:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Oct 2020 13:18:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 7 Oct 2020 13:18:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLMlxmdQpWpVcXJPw+TXKpvAh5N4ZtjzdvK5S6TMxqLxz/c2LOQOhYLjwkCqsj4y0GSHp5jc65Qs0WzXm+WZWWLbDW0nY46USMP9/Y05qUz/HCH+sI6GNJZMJYjN2abcXId2er9henIeJxooUMHbuQSc1+TRhLFyuOBXn5pFbKURmE88fqesTnSkVYIbhTNVzjRtLjkF7RAFN5Xaye3QBOMn/dKQwNk/Ot3e+IRZ5SenFGaavx7AEGwL1Q2wtRMrRM0alx0PMnIbvU2OgHTpRYgp2qQiL1Wqjs/2hU8TXuWoeTN7zd0VSzCofJp4uVJEzrNQ4oIsNyfVivvh9BDNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcJE0gsbPVxC4KfBWRE7Tj63Mgrpgqehl3DRcKAGobE=;
 b=DHGjdnXaNJOUl6UZmKVJ8tlTB00pYGJo+l3Wke9DRMOc7E+Rmpk5a3kjS2kEmd0wuwpVn7g/BEgFDEjHsZsFucTu8YC8/DKc6Y9nW6uLl40/6STfXmT3Sh1S+uXj1oU8JLoyFkq4Oy+UTKNqL8bkwiDQUonHIKEEDPSihwYHgSatI9iGJ9QcooJej31sfF1WX4ycTw3j/eCQkJAM2t6ZRavM+sDjXwBmxZF1po7SB/NEwGT6jGMGzkidZna2ASDrMygYVoGDkhMy0zFYIb2QSX5IQwYvdGiEYda7wjF/kKTxo0Ka5GiBuUIpsdTvefYhrFCTNvFVQruE/nHVyq9F/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcJE0gsbPVxC4KfBWRE7Tj63Mgrpgqehl3DRcKAGobE=;
 b=as0y2r/BkSgR5MLBgbFTWinoM3GTpS7JzscZovMEZK9nvEXXdcKy9anqazYsnm7Ux9HWWnkZpeDNe15X2GnN5hRameNCtvJy1bl3+F/rnuIL0rY0K4QGm6PC5XbYTpoqRLSFESiXLDjy1vPPvVEu6OpEkAgVhumrkAIgfy4prb0=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Wed, 7 Oct 2020 20:18:47 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 20:18:47 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Leon
 Romanovsky" <leon@kernel.org>
Subject: RE: [PATCH v2 1/6] Add ancillary bus support
Thread-Topic: [PATCH v2 1/6] Add ancillary bus support
Thread-Index: AQHWm06cVdQZOfJAqUq6P9wAQIqk66mKKyCAgACGDICAAeOhYA==
Date: Wed, 7 Oct 2020 20:18:47 +0000
Message-ID: <DM6PR11MB2841D0D8CA291D94EFA4B701DD0A0@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
 <20201006071821.GI1874917@unreal>
 <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
In-Reply-To: <b4f6b5d1-2cf4-ae7a-3e57-b66230a58453@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8488502f-3aad-47fd-f298-08d86afe32aa
x-ms-traffictypediagnostic: DM6PR11MB4660:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4660CAE2F89D788B51429EE5DD0A0@DM6PR11MB4660.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Le9b4d+zePwyPw/IgZa46l0YBqzPisQEWN3prpw3qHjpX10PH38PQG0zXa0WCrE0XSzLaI4pj+SlQQtPHRoEemoXnVUtuCE9FI6rg+FCYpgbv0mxbUGSMIIFiX58cI8y47PA/CWhiPpFQe5pPNcZ23TAnly85/r/B+av4MyvZmLIlAtcQP7mTz8KmfNg0cRPZ1ZxImvWTI7ddQ9ReeViGDITgeRfv5yFPVL1KsmLj2Oc3qYidO6aHbDD3Gfg9gzGwYq0ttK3qvhs63M82teJI+DmHbHx0SOFVCFaIuEGV3EStx7b/OwVGPDSLfz85ujyiYoPB4P7DnSlbsRwDVH42A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(83380400001)(7696005)(66556008)(4326008)(52536014)(8676002)(66476007)(66446008)(66946007)(5660300002)(478600001)(86362001)(2906002)(76116006)(8936002)(33656002)(64756008)(71200400001)(110136005)(26005)(7416002)(186003)(316002)(54906003)(6506007)(55016002)(9686003)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 14BkKtTWvosjFPnwJ4l62CCnOqxRj8zzxPoGGEVWqkUwV6gaK1nj60QG4ph7RJ67z9tVGDtLgprJzgxqNVQeAshcsrI5u5Vv2hkrvLOc+X7hw2geNXfIbyToUGKhNuq/vJo4NnKkminPNm5LpMK8EoR5QllieCJO9pxhpyMtXkmN1fhx3WnfjIv8p5FROv24Txvbh1A+nqFtPWMCsr/M5rGFZ5/vYV5q1uj+GUxCaZAfh2jby2yEpuiQMuUyWBfpgmpitZ3KCH45hMxECbEbisvA8Gwk8M7rIVq3Cphm1Z030GvoPue5WsTIjmTQv3WB5vBEPyuuvxh2SBy9R+C7sKlZ/9mhFNGguDRzoecJ7TTBGBEjEsWgLfNOjtb3sWFcsQW/084phNq5FOkKtiMI6Ln0d5VvJPCpWQ2U7CASS2Y16aO2MI61NwbxiQVsYAahxgAVVZ9d7LWsmgeXxt/i74ho8PkQBqxpPt54SRxsERZHibnLuCdANaCrzVtWV902sLgJxBEUR1gwD99tnOcUmfDT26rWUeIP8Ibm+zWSQzfCsb/0VxVp3qYAEvD9wLM8GQ0YKzuJLTRnaEmYsJzrpnK4AAxavCTpUp5ak8HfYEnRmA60ZqaceSBuVMa4qp4RdMZtfPachr8VaQFUdxa0xw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8488502f-3aad-47fd-f298-08d86afe32aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 20:18:47.6247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4jy8Y1+LZkCTPxGZ+UAO9ykDsoJw1EOqWnzp9XSrXonpwsT74uFXosCY+qrEVv6LPQxn8yo+Osg7qVPdHtrf/HdJE8mjXKb4uPv19wtDDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "parav@mellanox.com" <parav@mellanox.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Saleem, 
 Shiraz" <shiraz.saleem@intel.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "Patil, Kiran" <kiran.patil@intel.com>
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
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBPY3RvYmVyIDYsIDIwMjAgODoxOCBBTQ0KPiBUbzogTGVvbiBSb21hbm92c2t5IDxsZW9uQGtl
cm5lbC5vcmc+OyBFcnRtYW4sIERhdmlkIE0NCj4gPGRhdmlkLm0uZXJ0bWFuQGludGVsLmNvbT4N
Cj4gQ2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgcGFyYXZAbWVsbGFub3guY29tOyB0
aXdhaUBzdXNlLmRlOw0KPiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyByYW5qYW5pLnNyaWRoYXJh
bkBsaW51eC5pbnRlbC5jb207DQo+IGZyZWQub2hAbGludXguaW50ZWwuY29tOyBsaW51eC1yZG1h
QHZnZXIua2VybmVsLm9yZzsNCj4gZGxlZGZvcmRAcmVkaGF0LmNvbTsgYnJvb25pZUBrZXJuZWwu
b3JnOyBqZ2dAbnZpZGlhLmNvbTsNCj4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGt1YmFA
a2VybmVsLm9yZzsgV2lsbGlhbXMsIERhbiBKDQo+IDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+
OyBTYWxlZW0sIFNoaXJheiA8c2hpcmF6LnNhbGVlbUBpbnRlbC5jb20+Ow0KPiBkYXZlbUBkYXZl
bWxvZnQubmV0OyBQYXRpbCwgS2lyYW4gPGtpcmFuLnBhdGlsQGludGVsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAxLzZdIEFkZCBhbmNpbGxhcnkgYnVzIHN1cHBvcnQNCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIHJldmlldyBMZW9uLg0KPiANCj4gPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBB
bmNpbGxhcnkgQnVzLCBhbmNpbGxhcnlfZGV2aWNlIGFuZCBhbmNpbGxhcnlfZHJpdmVyLg0KPiA+
PiBJdCBlbmFibGVzIGRyaXZlcnMgdG8gY3JlYXRlIGFuIGFuY2lsbGFyeV9kZXZpY2UgYW5kIGJp
bmQgYW4NCj4gPj4gYW5jaWxsYXJ5X2RyaXZlciB0byBpdC4NCj4gPg0KPiA+IEkgd2FzIHVuZGVy
IGltcHJlc3Npb24gdGhhdCB0aGlzIG5hbWUgaXMgZ29pbmcgdG8gYmUgY2hhbmdlZC4NCj4gDQo+
IEl0J3MgcGFydCBvZiB0aGUgb3BlbnMgc3RhdGVkIGluIHRoZSBjb3ZlciBsZXR0ZXIuDQo+IA0K
PiBbLi4uXQ0KPiANCj4gPj4gKwljb25zdCBzdHJ1Y3QgbXlfZHJpdmVyIG15X2RydiA9IHsNCj4g
Pj4gKwkJLmFuY2lsbGFyeV9kcnYgPSB7DQo+ID4+ICsJCQkuZHJpdmVyID0gew0KPiA+PiArCQkJ
CS5uYW1lID0gIm15YW5jaWxsYXJ5ZHJ2IiwNCj4gPg0KPiA+IFdoeSBkbyB3ZSBuZWVkIHRvIGdp
dmUgY29udHJvbCBvdmVyIGRyaXZlciBuYW1lIHRvIHRoZSBkcml2ZXIgYXV0aG9ycz8NCj4gPiBJ
dCBjYW4gYmUgcHJvYmxlbWF0aWMgaWYgYXV0aG9yIHB1dHMgbmFtZSB0aGF0IGFscmVhZHkgZXhp
c3RzLg0KPiANCj4gR29vZCBwb2ludC4gV2hlbiBJIHVzZWQgdGhlIGFuY2lsbGFyeV9kZXZpY2Vz
IGZvciBteSBvd24gU291bmRXaXJlIHRlc3QsDQo+IHRoZSBkcml2ZXIgbmFtZSBkaWRuJ3Qgc2Vl
bSBzcGVjaWZpY2FsbHkgbWVhbmluZ2Z1bCBidXQgbmVlZGVkIHRvIGJlIHNldA0KPiB0byBzb21l
dGhpbmcsIHdoYXQgbWF0dGVyZWQgd2FzIHRoZSBpZF90YWJsZS4gSnVzdCB0aGlua2luZyBhbG91
ZCwgbWF5YmUNCj4gd2UgY2FuIGFkZCBwcmVmaXhpbmcgd2l0aCBLTU9EX0JVSUxELCBhcyB3ZSd2
ZSBkb25lIGFscmVhZHkgdG8gYXZvaWQNCj4gY29sbGlzaW9ucyBiZXR3ZWVuIGRldmljZSBuYW1l
cz8NCj4gDQo+IFsuLi5dDQoNClNpbmNlIHdlIGhhdmUgZWxpbWluYXRlZCBhbGwgSURBIHR5cGUg
dGhpbmdzIG91dCBvZiB0aGUgYnVzIGluZnJhc3RydWN0dXJlLA0KSSBsaWtlIHRoZSBpZGVhIG9m
IHByZWZpeGluZyB0aGUgZHJpdmVyIG5hbWUgd2l0aCBLQlVJTERfTU9ETkFNRSB0aHJvdWdoDQph
IG1hY3JvIGZyb250LiAgU2luY2UgYSBwYXJlbnQgZHJpdmVyIGNhbiByZWdpc3RlciBtb3JlIHRo
YW4gb25lIGFuY2lsbGFyeSBkcml2ZXIsDQp0aGlzIGFsbG93IHRoZSBwYXJlbnQgdG8gaGF2ZSBh
biBpbnRlcm5hbGx5IG1lYW5pbmdmdWwgbmFtZSB3aGlsZSBzdGlsbCBlbnN1cmluZw0KaXRzIHVu
aXF1ZW5lc3MuDQoNCi1EYXZlRQ0K
