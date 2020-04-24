Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DC1B6BE6
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 05:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C79169A;
	Fri, 24 Apr 2020 05:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C79169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587698704;
	bh=T4p22++0YyW5Fm2ioEi5VUv9A34BIDEQfX0DzRVoCmQ=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JASUr8CCFp2cB84vOqYQvSL2S9ijfuQBs+zDT7SmZ/IFuNfkgPjIx9ebXvneLwNLE
	 s16hmEuutWlKP6/Gr0DHbpIwseRN45X6MYtkZTPd/Ks38deGnBWzVvjwLZhDqGoq2n
	 7N+bGE8MboO1LAHpSencAbFbss+NZcsyHWHWLUhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29853F80116;
	Fri, 24 Apr 2020 05:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DFE1F80142; Fri, 24 Apr 2020 05:23:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC5EF80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 05:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC5EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="uEpGQlBC"
IronPort-SDR: dR5Jc3AWBU59eMksgVfeYhCLumWsWmLBWbdES9pOGlA38yk0tl6rkpZaDeLRk7YcZjPICWGI8g
 aYRucBDhIDLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 20:23:01 -0700
IronPort-SDR: bJuna5CI7ZunzNUXpG81huexekPynDobjuDZ9txe8fiwSe4Z8DCpA7TDPbORTS0hp+GZRi/RmL
 rsSZZYVp7Yhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,310,1583222400"; d="scan'208";a="246469059"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 23 Apr 2020 20:23:01 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Apr 2020 20:22:33 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Apr 2020 20:22:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.51) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 23 Apr 2020 20:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaqTBDWQmB76UqCyjnII7rKxww4KjLmdVlz69TSKkoTL/5MRZ5ADjTJ8msmEgM2jAbdLGWX8bYHGxmS0b6WWz0CHEGJ6aOlTtYPK2J1OMtvZdTeAGjFn5qxERmfEapxLEf8WLIm+Rxyf5GNj7K/SaMnqS8dKcjTcLlqs2L1FBF60tI/ooOhYLl16fd6l287FPLgW2WsyYlbS9pMVv2ZoWiTHVXF9T07ZmEVNDgOwLJW7uJbvDdryQoOk9fYl5hIMtMV658XBYgmnHhZ7ZWtyiKOQb7XuuSIGYqJ8O5GcV9H+M9Urd1vOu3bhqfQdNZVVdsZFJMqtUFiRRDlvNOHPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4p22++0YyW5Fm2ioEi5VUv9A34BIDEQfX0DzRVoCmQ=;
 b=jClgu2xUwVjE4CR+gsaUEfag35j1dz6GbmOK+zaYqQlhMY3U998C1my0+mDanxP4tYISJS4djtutWOjhaomkJg4xyUiLPjK+n4UQpzfJT45P2/6KymWdS9TVlsWELoXhZwhMPQyNd+/+Oiak22gbqOtKzlGENMOr2LaISgcSSUyYH2OklwtuM2zJ07hPR5g0zS4+VT7JE8pRdLkiajSwxV4caTWptqeSefqPQWjbp6oMiJh3SaAR/57ZMKBaBjWG6FtMFtUNRH5AP7l4uyokGsyjMVjlKktTWYrpQQaLjCa0SYi6GQNQwujS/GYHT0B/NuyRbr8jruXQhWc6cMXRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4p22++0YyW5Fm2ioEi5VUv9A34BIDEQfX0DzRVoCmQ=;
 b=uEpGQlBCk6AzbcjN1sdzhmNt0+C6CvE8YZwEPxthCiec/M5tnEXsenIs095EyHUZTVYaAQUE9TwCWtQREryW5njVTB6bvvVRRcICUFCrFKGL90GyK1XuThigsfykJSoisDLg5gwE14QRzNKVtAmNFbmcd8u0JcAeEz70JhfI2VA=
Received: from BYAPR11MB2614.namprd11.prod.outlook.com (2603:10b6:a02:cc::27)
 by BYAPR11MB2965.namprd11.prod.outlook.com (2603:10b6:a03:82::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 03:22:32 +0000
Received: from BYAPR11MB2614.namprd11.prod.outlook.com
 ([fe80::b5a8:5dc3:d999:46e3]) by BYAPR11MB2614.namprd11.prod.outlook.com
 ([fe80::b5a8:5dc3:d999:46e3%7]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 03:22:31 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "libin.yang@linux.intel.com"
 <libin.yang@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
Thread-Topic: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
Thread-Index: AQHWGRhiH/9GZfwFqEKekVlquHpT8KiGrcAAgABLYYCAAJkZIA==
Date: Fri, 24 Apr 2020 03:22:31 +0000
Message-ID: <BYAPR11MB2614DF61F17186141D35059C90D00@BYAPR11MB2614.namprd11.prod.outlook.com>
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
 <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
 <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
In-Reply-To: <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGRhODI1MDQtZDE1MS00YWYyLTk5MTctYmM1OGYyYzcxMWE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibW5rSFVTblJUQ3dLQkFMY3JnY0ZMTEl3UkduTWZFdEdXeXlsdnE2VUxMd3ZwY01rVzEweVBzbnNVUVBUNFQwWCJ9
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=libin.yang@intel.com; 
x-originating-ip: [134.134.136.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81026eff-f56d-49bb-232d-08d7e7feb9b1
x-ms-traffictypediagnostic: BYAPR11MB2965:
x-microsoft-antispam-prvs: <BYAPR11MB29655435352DBFE5A76EFA1E90D00@BYAPR11MB2965.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(396003)(376002)(39860400002)(136003)(346002)(66476007)(9686003)(8936002)(52536014)(6506007)(110136005)(86362001)(33656002)(7696005)(186003)(71200400001)(66556008)(66946007)(478600001)(64756008)(5660300002)(66446008)(8676002)(26005)(316002)(81156014)(76116006)(2906002)(55016002)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F5LDR9yz112SLUKOyHZFZkEYbvGbUzA3Se9WKtNc9UDgdNAtJwt42j153Bgmci2PcaqxO0sEl9DcBnb+qlzYrGcxjVVBVay5AmjVbz8LZY7PqjZLR5eWdD4AgBnbxes6Dd7SpiIHYnBSWImroNJfD+dCuAVZzHDAy/vmjGgOmh13DZi4HpBA1sFNYULg+GyNoA1F9OQa/KFozYO3fWAcafUdIDq8Nr1wFiJiHUnsRMllrb5pQHE9dlRE6NLNbeaRlfeQ+7on583QuPxH//M0uFrVUe3FQ/UnIUs89oTc943CQgDn0o+3haK3RjXN1N1fdAeVwNf9p+F0XttkjsNT5+0sf+z70GvKndT0EDGZL38DY0Y22LPbbAaDaygYz3I64va/fQ0eStPDjnPjCvwXF0wqDVHli36sdFXpfaw9k3aA39AAiTx8D+OkOuQfBpISfEL2dL2DzUm1JW2YDCm3lfEbne6ltlJrgIHtVEVgh00jyKBleHK/o9lwtQw0ygxO
x-ms-exchange-antispam-messagedata: vo4upONmZyJdGZtXgs/SNz3qSUCGRXOkaBPhZZ1QCtxHXOCfkQOOuidNqq5imwNXITv8vkG5y81ONirk3b9yixSZztDJ8cl6ADt0hHvvHkFwEWD/C2Se8WObncseAGRF9u5HQJdqPu9pqfLwA5D6ow==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 81026eff-f56d-49bb-232d-08d7e7feb9b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 03:22:31.7568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGOwPMjgihkIeoz1VrX8UStyDoGRNoBBPqUqDJJcVXDtnrQW6YNPCaoHC/FXRskE6aIrlCbIamWeYMI9yWv5Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2965
X-OriginatorOrg: intel.com
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

SGkgSmFyb3NsYXYsDQoNCj4gPg0KPiA+IENhbiB5b3UgY2xhcmlmeSB3aGF0IHRoZSBjb25mbGlj
dCBpcyBhbmQgd2hhdCBpZCB5b3Ugd2VyZSByZWZlcnJpbmcgdG8/DQo+IA0KPiBUaGUgYXJyYXlz
IGluIHRoZSBBTFNBIGNvbmZpZ3MgYXJlIHJlcHJlc2VudGVkIGxpa2U6DQo+IA0KPiBVc2VyIHN5
bnRheDoNCj4gDQo+IG5hbWUgWw0KPiAgICB2YWx1ZTANCj4gICAgdmFsdWUxDQo+IF0NCj4gDQo+
IEludGVybmFsIHRyZWU6DQo+IA0KPiBuYW1lLjAgdmFsdWUwDQo+IG5hbWUuMSB2YWx1ZTENCj4g
DQo+IG9yDQo+IA0KPiBuYW1lIHsNCj4gICAgMCB2YWx1ZTANCj4gICAgMSB2YWx1ZTENCj4gfQ0K
PiANCj4gKGFsbCB0aHJlZSBzeW50YXhlcyBhcmUgZXF1YWwsIHRoZSBhcnJheSBqdXN0IHJlbW92
ZXMgdGhlIGluZGV4ZXMgZm9yIHRoZQ0KPiByZWFkYWJpbGl0eSkNCj4gDQo+IFRoaXMgcGF0Y2gg
dHJpZXMgdG8gY2hhbmdlIG5hbWUuMCB0byBzb21ldGhpbmcgbGlrZSBuYW1lLnVuaXF1ZS0wIG9y
IHNvIHdoaWNoDQo+IGlzIG5vdCBzbyBtdWNoIHByZXR0eS4NCj4gDQo+IFlvdSBjYW4ganVzdCBk
ZWNsYXJlIHRoZSBuZXcgc2VxdWVuY2VzIGxpa2UgdGhpcyB0byBhdm9pZCBjbGFzaDoNCj4gDQo+
IEVuYWJsZVNlcXVlbmNlLnNlcTMuY3NldCAibmFtZT0nUEdBMy4wIDMgTWFzdGVyIFBsYXliYWNr
IFZvbHVtZScgNTAiDQoNCkkgdHJpZWQgeW91ciBzdWdnZXN0aW9uLCB0aGUgY29kZSBsaWtlOg0K
SWYuc2VxMXAgew0KICAgICAgICBDb25kaXRpb24gew0KICAgICAgICAgICAgICAgIFR5cGUgQ29u
dHJvbEV4aXN0cw0KICAgICAgICAgICAgICAgIENvbnRyb2wgIm5hbWU9J1BHQTEuMCAxIE1hc3Rl
ciBQbGF5YmFjayBWb2x1bWUnIg0KICAgICAgICB9DQogICAgICAgIFRydWUgew0KICAgICAgICAg
ICAgICAgIEVuYWJsZVNlcXVlbmNlLnNlcTFwLmNzZXQgIm5hbWU9J1BHQTEuMCAxIE1hc3RlciBQ
bGF5YmFjayBWb2x1bWUnIDUwIg0KICAgICAgICB9DQp9DQoNCkl0IHNlZW1zIG5vdCB3b3JrLiBX
aGVuIEkgcnVuICJhbHNhdWNtIC1jIHNvZi1zb3VuZHdpcmUgb3BlbiBzb2Ytc291bmR3aXJlIg0K
SXQgc2hvd3M6DQpBTFNBIGxpYiBwYXJzZXIuYzo0NzA6KHBhcnNlX3NlcXVlbmNlKSBlcnJvcjog
c3RyaW5nIHR5cGUgaXMgZXhwZWN0ZWQgZm9yIHNlcXVlbmNlIGNvbW1hbmQNCkFMU0EgbGliIHBh
cnNlci5jOjEyNTc6KHBhcnNlX3ZlcmIpIGVycm9yOiBmYWlsZWQgdG8gcGFyc2UgdmVyYiBlbmFi
bGUgc2VxdWVuY2UNCkFMU0EgbGliIHBhcnNlci5jOjEzNzA6KHBhcnNlX3ZlcmJfZmlsZSkgZXJy
b3I6IEhpRmkuY29uZiBmYWlsZWQgdG8gcGFyc2UgdmVyYg0KQUxTQSBsaWIgbWFpbi5jOjk2Mjoo
c25kX3VzZV9jYXNlX21ncl9vcGVuKSBlcnJvcjogZmFpbGVkIHRvIGltcG9ydCBzb2Ytc291bmR3
aXJlIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24gLTIyDQphbHNhdWNtOiBlcnJvciBmYWlsZWQgdG8g
b3BlbiBzb3VuZCBjYXJkIHNvZi1zb3VuZHdpcmU6IEludmFsaWQgYXJndW1lbnQNCg0KTXkgdW5k
ZXJzdGFuZGluZyBpcyB0aGF0ICJFbmFibGVTZXF1ZW5jZS5zZXExcC5jc2V0IiB3aWxsIGNyZWF0
ZQ0KYSBuZXcgc25kX2NvbmZpZ190ICJzZXExcCIgYmV0d2VlbiAiRW5hYmxlU2VxdWVuY2UiIGFu
ZCAiY3NldCIuDQpUaGlzIHdpbGwgY2F1c2UgZXhlY3V0aW5nIEVuYWJsZVNlcXVlbmNlIGZhaWx1
cmUuDQoNCkJlc3QgUmVnYXJkcywNCkxpYmluDQoNCj4gDQo+IAkJCQkJSmFyb3NsYXYNCj4gDQo+
IC0tDQo+IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+DQo+IExpbnV4IFNvdW5kIE1h
aW50YWluZXI7IEFMU0EgUHJvamVjdDsgUmVkIEhhdCwgSW5jLg0K
