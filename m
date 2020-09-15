Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251426AA2A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 19:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28ED83E;
	Tue, 15 Sep 2020 18:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28ED83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600189216;
	bh=DyBhEQSe87j7ji1+5HBc6Y7g60Nh92Y3fYnlrSU2xz0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vz1R5wAKYO4fRpHp3lxERIh9RyEwfcxZqd2kzC8q/7ohxhH7YQHUFGYNlB/26tt9W
	 zPeJVVCbqKfTHkUZAoA+NhDAmMH9p5Z2+MhN1p7g/fMGG6jN6evbIKMNAvukrcsAjX
	 qQx6L3Fexiln2+Toxgl9BomCc3uF43xJPDtBj9kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E8AF8027C;
	Tue, 15 Sep 2020 18:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 753BAF80276; Tue, 15 Sep 2020 18:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF55EF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 18:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF55EF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="THjd3Ww2"
IronPort-SDR: CjNalJeD6b1i0FuiS+a5SeVJvhwqiIzeHFZ12JCtHv1R5bncXCYktBpXZX0e0F8l9AfFNS9ve0
 YlwJ39XtYzNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="138807297"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="138807297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 09:58:18 -0700
IronPort-SDR: JDXTDP4RoSjrty1BXZSa0mtvXa4lEuUftDL5jYwVYniazrzDs0MLeOPKTiE54FHJB8jLPRbwD3
 kHqjET4q9k1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="451498105"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 15 Sep 2020 09:58:18 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Sep 2020 09:58:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 15 Sep 2020 09:58:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 15 Sep 2020 09:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXzvjLDctSX6RGAJko7PxDn6fPtvzagSc5350oqvPtpN/hgmiLsH7q8aS5cEC3QjhsPWIZqK7F0I9XbocFTJ7nSBSsDWfHOE/qu3czZ/RFvSpqabtaoEqvlAvuUDOwqwmYTsrWGaPmAkqTWCVICGexfReY646MfDfNIAtGiRnJmV3BysHZMrjlm25QFnNPWpwJKTKbKQcKwtZPxMMJepRIxc7Zxbk3nbXcM1rmpokECUxK3HrjNOvpDigEJGcEJZ6+wk4KII4yIksTXbK9O1dJutDIIuEhvPGudqsQ1zXqWY5q9uO65iL59K+cKz20YiW61g6/PClM7z+h2ySJDT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyBhEQSe87j7ji1+5HBc6Y7g60Nh92Y3fYnlrSU2xz0=;
 b=lN32yQznKrybfF83omKioCZmciPdpqfmC2ViD3pmJsVQ9NH0DzJ5rTvtHkoUBsia1ZkVOyLJq9jJQsEfZFccKDzwCa0kYxhiVv9QJ1qXDJqz7vZ2+R0PNYcNlxG9gIW0Gx594kNhY9dnUVErjsovW/afkjFM+xE6w63I0Su3sQVsE7LOSKdcQQkaEmT9Ag0k+sIaKIpuzmQXbiOolCc0Vz3+1wcWvAhG6IW4yLehXaG2jPU/oDhIMtPz/NLC4TUl3ibUtzVFn4Zyl5KcyrhQn6x6ONgo25HtNM+0CrHwMs7ArjhGeCy7M1mEAh4WwKwJZiCe6lMAZVOpj3h0ikIKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyBhEQSe87j7ji1+5HBc6Y7g60Nh92Y3fYnlrSU2xz0=;
 b=THjd3Ww2cheEI2TxsIsGepqRIC/pagk75qjihXOCx32266UX0XK5chm7DnhopbcjrooDIs6LEuJuvYV/opNgO3JFKIz6lNj8NWcDUCLro0VQrsDo9Bj+iEqttXgMbkc/4N7B6nJ+CxpyeK4XP4bFt/eh5+N0va2MJFdAqifMufk=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM6PR11MB2699.namprd11.prod.outlook.com (2603:10b6:5:ce::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Tue, 15 Sep 2020 16:58:14 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::17b:8b7c:468c:4fff]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::17b:8b7c:468c:4fff%6]) with mapi id 15.20.3326.030; Tue, 15 Sep 2020
 16:58:13 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [RFC] dpcm_fe_dai_do_trigger: implicit removal of _DRAIN cmd
 since v5.4
Thread-Topic: [RFC] dpcm_fe_dai_do_trigger: implicit removal of _DRAIN cmd
 since v5.4
Thread-Index: AQHWgdHhLVPZ40IsyECeOO/MUMZVMalp/yYA
Date: Tue, 15 Sep 2020 16:58:13 +0000
Message-ID: <d3d7c8ce0a5af7bbb8085f3c9ce1e237a75a38d4.camel@intel.com>
References: <2eea3479-1efb-ec82-32f2-e89614998aaa@intel.com>
In-Reply-To: <2eea3479-1efb-ec82-32f2-e89614998aaa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8604870c-49aa-4dcd-3b0a-08d8599888ec
x-ms-traffictypediagnostic: DM6PR11MB2699:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2699A86584BDD84F05561C59E8200@DM6PR11MB2699.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YjOwRUWYBRJD68UFvMuyFLAnS/TvddUpDDGzyTriGDdey6bLJlEHbNUGL4fvcVOe0QLNDZXPiYjfncgEe1CM/0mYvyCbqo6KdbOPNjreSWGTfBaqpYEalq5XfNTbnxDfmiOtkM+Wob1ckNGOLITxBzNLq7xsLVEkt4jJK298AZPQ410bBn7WsKsC730wy49gmNN4GKeahqrgeLVlyGrgjyZq/PWrjyNUaexfrwsp+Cw+oyrQ9pjl8rjWaAOt3c2dkWhxdPE05ntRGWxh3ZBaTBDj32qbGCF7qnegWt/CNJWcfJtnanf2ZeeuSEmT+XYkvzJUqtC+MZsP+CAlA0spGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(186003)(8936002)(6512007)(26005)(478600001)(76116006)(6506007)(66946007)(2906002)(91956017)(36756003)(316002)(86362001)(4326008)(66556008)(64756008)(66446008)(110136005)(8676002)(83380400001)(5660300002)(6486002)(2616005)(54906003)(71200400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: o52k9uMGHu0eH1W5WkJz6NAqFaUvUpRheMXCTEMdXAKPXiIBfvyl/wWaYWNWqsJfBeMvkelTeJet2hgawn/aVa46MG/z0n4lXr55OkoFJpeuGU8O4Izlk4SzwyzQcsRgZTsXNSGeEOi+/WRIQIjWaRj4yEcy7POIXQsg82s55liy2xf1w+oCTdAqbZC6y4WJnwmJLd2x07KeCchdyK4t0ZPonL8X4RnWkrqb0mNIbdIbeO9+K0GXwzREHXHnssMhm8x1+b29eAjaZnuYyf/SNbfmxuffIzcl/NQTQtUoqmMsRb/MeOPAb8osBNr63A3TRLzCPAlTnX13A6kOfzXuyx39QaOj1V8uGdwDjfT25T+DXUq5NWh480fMPwSoZFnYt5OJ8XTyl6Nu6+qBMwOydIYzTGd4q5B85e1ePKT7WOfqEOGc2IeUPnrTD8NIy+j76+q40mx2U8mfNioH3yRvgS35L3NGLKD3oddswPQBFqlhRrDybSfUMF7ob+JPeqZQTfr10ZdQ+E9E28sA/lfhhwdI+4yseh7074MaTHKrJQV7kjbB65c9uAgC5Y2bEEs5/Y6L/qmaNxxitWTBPygNR76ahhqRgcWOBrI5xk3dy0q30iXzV5l7uZn+J+n1uvTCCsVyv6rdTXTfmPVRfGlZXA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <05CCFC97B1F39B4EBAB4E47B9A6224E5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8604870c-49aa-4dcd-3b0a-08d8599888ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 16:58:13.8230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuoG2HdMxanv3A/GP4QSpMQVdG5qJAGiERZs0tJttrg3oDaHP697vGvRtOPJ2AHhYGOcZEx2S6ESd3OggvEgGJw5poGVTYhzDL9GwqcP1PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2699
X-OriginatorOrg: intel.com
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "tiwai@suse.com" <tiwai@suse.com>
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

T24gVGh1LCAyMDIwLTA5LTAzIGF0IDExOjAxICswMjAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IEhlbGxvLA0KPiANCj4gVGlsbCB2NS40IGRwY21fZmVfZGFpX2RvX3RyaWdnZXIgd2FzIHN1
cHBvcnRpbmcgYWxsIHBjbSBjbWRzIGFzIGVhY2ggDQo+IGNhc2U6IFNORF9TT0NfRFBDTV9UUklH
R0VSX1BSRS8gX1BPU1QvIF9CRVNQT0tFIHdhcyBzaW1wbHkgcGFzc2luZw0KPiBjbWQncyANCj4g
dmFsdWUgdG8gYXBwcm9wcmlhdGUgdmFyaWFudCBvZiBfdHJpZ2dlcigpLg0KPiANCj4gU2luY2Ug
dGhlIGFkZGl0aW9uIG9mOg0KPiAJYWNiZjI3NzQ2ZWNmYTk2YjI5MGI1NGNjN2YwNTI3MzQ4MmVh
MTI4YQ0KPiAJQVNvQzogcGNtOiB1cGRhdGUgRkUvQkUgdHJpZ2dlciBvcmRlciBiYXNlZCBvbiB0
aGUgY29tbWFuZA0KPiANCj4gYWRkaXRpb25hbCBmaWx0ZXJzIGhhdmUgYmVlbiBpbnRyb2R1Y2Vk
IGZvciBfUFJFIGFuZCBfUE9TVCBjYXNlczoNCj4gDQo+IAlzd2l0Y2ggKGNtZCkgew0KPiAJY2Fz
ZSBTTkRSVl9QQ01fVFJJR0dFUl9TVEFSVDoNCj4gCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfUkVT
VU1FOg0KPiAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9SRUxFQVNFOg0KPiAJCXJldCA9
IGRwY21fZGFpX3RyaWdnZXJfZmVfYmUoc3Vic3RyZWFtLCBjbWQsIHRydWUpOw0KPiAJCWJyZWFr
Ow0KPiAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9TVE9QOg0KPiAJY2FzZSBTTkRSVl9QQ01fVFJJ
R0dFUl9TVVNQRU5EOg0KPiAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9QQVVTRV9QVVNIOg0KPiAJ
CXJldCA9IGRwY21fZGFpX3RyaWdnZXJfZmVfYmUoc3Vic3RyZWFtLCBjbWQsIGZhbHNlKTsNCj4g
CQlicmVhazsNCj4gCWRlZmF1bHQ6DQo+IAkJcmV0ID0gLUVJTlZBTDsNCj4gCQlicmVhazsNCj4g
CX0NCj4gDQo+IGVmZmVjdGl2ZWx5IHJlbW92aW5nIHN1cHBvcnQgZm9yIF9EUkFJTiBjb21tYW5k
IC0gYWxsIHJlcXVlc3RzIHdpbGwgDQo+IHlpZWxkIC1FSU5WQUwuIF9CRVNQT0tFIHdhcyBsZWZ0
IGFsb25lIHNvIHN1cHBvcnQgcmVtYWluZWQgdGhlcmUuDQo+IA0KPiBOb3csIGlzIERQQ00gbm8g
bG9uZ2VyIHN1cHBvcnRpbmcgX0RSQUlOIGFuZCB0aGF0J3MgaG93IHRoaW5ncyBzaG91bGQNCj4g
YmUgDQo+IC1vci0gRFBDTSBzdGlsbCBpbnRlbmRzIHRvIHN1cHBvcnQgX0RSQUlOIGFuZCBtZW50
aW9uZWQgY2hhbmdlIGlzIA0KPiB1bmludGVuZGVkIHJlZ3Jlc3Npb24/DQoNCkhpIEN6YXJlaywN
Cg0KVGhhbmtzIGZvciBicmluZ2luZyB0aGlzIHVwLiBJdCBkb2VzIGxvb2sgbGlrZSBhbiB1bmlu
dGVuZGVkIHNpZGUtDQplZmZlY3Qgb2YgdGhlIGFmb3JlbWVudGlvbmVkIHBhdGNoLiBJIGRvbnQg
aGF2ZSBhIHdheSB0byB0ZXN0IHRoZQ0Kc3VwcG9ydCBmb3IgdGhlIERSQUlOIGNvbW1hbmQuIFdv
dWxkIHlvdSBtaW5kIHNlbmRpbmcgdGhlIGZpeCBmb3IgdGhpcz8NCg0KVGhhbmtzLA0KUmFuamFu
aQ0K
