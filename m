Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA5281CE7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 22:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFAE91928;
	Fri,  2 Oct 2020 22:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFAE91928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601670358;
	bh=HgFqLYPAjb3O7Xv1OhM/wwdLgfZOfvT0MsBcjkO78Us=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6N86Q7zwAeq0L/GY0XiEj18Isjx94gAUcG2w2X40Jp/pFC5bScRPR+F+mh/Z6ukn
	 DysBVlMD3Q/SUDvFbrFQQP07yIbI0APX9XhuaPl7zvxiHPQEl0caWA5mZdYqFUyNMD
	 YaZSSS2/cX4dTNu8VP9Dd3Y6W3dt1Z5kpF1ABm0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB0DF801ED;
	Fri,  2 Oct 2020 22:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99301F801F9; Fri,  2 Oct 2020 22:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9742AF801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 22:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9742AF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="jKukLEyP"
IronPort-SDR: 3e7KuXKb3NX6RMgy50ZlsD5ZxabO15oBzbzTYnNHstUgRkgkxEsA4Ek7mu4VSnAA6tIKCAuhx8
 n+gbzel67pNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="143060360"
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="143060360"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 13:23:52 -0700
IronPort-SDR: RIWuTb6zeieAlAo6x4tciaxwJOz7C5bttOIwMuRSBmlVNE6y4tJT3qYTBMrhLXqAAl98YjrZX8
 OSitz3S7WkKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="510260364"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 02 Oct 2020 13:23:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 2 Oct 2020 13:23:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 2 Oct 2020 13:23:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 2 Oct 2020 13:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLW0oMFQoVdnIos1wx1m234b9mt/JgpkGfmOceyBZcjw0i6qV3cN3TKkjj1KadudKg7ernk7cEci5F3XuktofpcdDVuQ+3PlT07ctAntfgDeYob61Yy9zfXy7ovHNT1QR6ReujC1vwKQAbWl2O2KYOq5OQ/IR6EyY/d7RRouyh93Srvv0l/B524JZE6rNKE+HnUBnGUzm9B6jSoqZLTd+1i6gUnNgMvf5i2k/OTLzjL4l1YDu4FLxm6AorspMvWpXCXqRFIZH47ynIRvk0NDkZclSWcYd+8LmwERgVEFxcs0CODqjVtuqyUvLBnu907flloQiU4Eae4YLGJjOiSH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgFqLYPAjb3O7Xv1OhM/wwdLgfZOfvT0MsBcjkO78Us=;
 b=Fe80Hx3QlROdVqNboZH89w2ftyuZwKK95IJXvKnf6adnIHVUv9i//LgoXPqxoo9KHvXBc4mT0w0gH2b7yjBGSFVLemD15pUTmZoG0fVPgO2kyKXktI9S4Y6TyEEBplrWqMMAZ8RQvwBkYuLSm9tkYV5SuHtTk4+0DvTOVVBrhAFJABllMu0UFA+gofRcvbmrrYTl59w1a3y15teJ0Cl4YWpROQ1/CGtCVyi4Z2zFILSj+Zlx3oVOajogIWiILYM++9E/CI9gRAbzntjpgiMDl8iPcZJJQyzZM7+RnCGj+3tnpHqPWacLl52L7mK84F6mktJJiNZ7WXhRZti2CSRkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgFqLYPAjb3O7Xv1OhM/wwdLgfZOfvT0MsBcjkO78Us=;
 b=jKukLEyPMDSImsXy5+BeNCAw2hdQLHkPfu5n6xIOboKy3hbCXQqpvIUSuR5vF7J+B9nnniUIQd1h3c75PJVb+jNEtxAzJbQrei6d8QxfKCiMTPVdNYxQ6B1vy56h0W/uVhTRNgP2lEqs/XTVXRJ13p/syvcK5LlqUesyJfyHqLU=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM5PR11MB1659.namprd11.prod.outlook.com (2603:10b6:4:6::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.38; Fri, 2 Oct 2020 20:23:50 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 20:23:50 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3ykvH7F12v7nEO6CAys49UIaKmCVeiAgAJoT9A=
Date: Fri, 2 Oct 2020 20:23:49 +0000
Message-ID: <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
In-Reply-To: <20201001071403.GC31191@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94a513ea-5c2d-4497-dd53-08d8671112e1
x-ms-traffictypediagnostic: DM5PR11MB1659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1659387C5A1D8837C39DE1F2DD310@DM5PR11MB1659.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PkSK88thM1DosKlFYSVMNl84tCcxOKtleOC1/AE3s5QRODVBOzt89FVD83cFuY/owR59H8mOTrxoL/eB0D2bLw/OneL82kt66yML8rqnaCOnxNyvao3txJ+ptNhlQagV+VkBti57CdJkkjAt2ZtyKFHUHM7fLCo6tYnGg1I6+jykKn/JBME73optvQhcumGg7UunGs+dsz7vO82FRCY2LBZScMrCktosXzYEkGPZqZrIjrA/rlnC96lXON2vI+VyPfZRSIXFriXOvdUIMDSHqMlwEG4/+7MXdvTKM5JCNjxV37QNA89MJM3YWzEAwfyFaGbR/UWOy+Q6hoiwBj/fOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66446008)(83380400001)(66946007)(76116006)(5660300002)(52536014)(26005)(6506007)(53546011)(7696005)(54906003)(2906002)(9686003)(64756008)(6916009)(71200400001)(55016002)(66476007)(498600001)(8936002)(8676002)(186003)(4326008)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kPRli0mXhQ4Kzr9p8axeEBre1TxCjPo6Tjt2HykdSWCwGvr2Aktcxq1XBUwOjhc6YPjduheOu5aAPKqBjVdyoTLWzYL3mgk3kY08zbFVTwhv7t2k9+YSG7HvMz0t2/tx2DxR/J0sJT2gJdFRSF3KjZdIARicbEYELlICeKBnxXNJ9MeNhdllk0k++dMeW0fSiW8YPUkLvXbA33PnZ31tdbqZ//IGR6SttRMcU9jCq8TlA5cUv8zRXfIOmia3IADsyGNbtUT2yDVmKWA1ktYMRw8Si26f/S9vnQaRbT+AqCKxS4dAFJ11GJTLap4ozTPDCDmkQFebDsP1N/f0OCofK8d8FS3blkz6dryafBGeFzUh2VFJxOs7uc7HVgWRJV70dDL+UUPpe3R3yn+NIlBRdyQ7vU9b4sQQVLsDWbv4+hq8oMXrgqnyG7cVdi+DJA3qUJcWIowDvFPlIUOBHE0RS/b0Ks52VyllH+DpAwkvo657kJjbNKVBPW3bmRppPlIR3hSUVgZQJlWvWTXiLExmYNuCdWbB4nwShggEZG0a3AoWbDLSLtXsYpWQ9Gvj2VP8OLL2NcYqejZJgTiManAI4zbg1YX2zE2rJ/62mHL137SA0Jti2E2fVpXZgNOCfnxZmFJH+/lRKB+vRDIgA6zwXQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a513ea-5c2d-4497-dd53-08d8671112e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 20:23:49.9383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCAH8WipXP07qTbeqWsbK7CljhS3sz0b2mBP2/4M2JxbVbrxFxQKHUZRTRIgix27XLj1acWssevSrHsQUdf2xx3kq06BMJd+jekDc/p0C64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1659
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtIIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMSwgMjAyMCAxMjox
NCBBTQ0KPiBUbzogRXJ0bWFuLCBEYXZpZCBNIDxkYXZpZC5tLmVydG1hbkBpbnRlbC5jb20+DQo+
IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IHRpd2FpQHN1c2UuZGU7IGJyb29uaWVA
a2VybmVsLm9yZzsgcGllcnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgU3Jp
ZGhhcmFuLCBSYW5qYW5pDQo+IDxyYW5qYW5pLnNyaWRoYXJhbkBpbnRlbC5jb20+OyBqZ2dAbnZp
ZGlhLmNvbTsgcGFyYXZAbnZpZGlhLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gQW5j
aWxsYXJ5IGJ1cyBpbXBsZW1lbnRhdGlvbiBhbmQgU09GIG11bHRpLWNsaWVudA0KPiBzdXBwb3J0
DQo+IA0KPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAwMzo1MDo0NVBNIC0wNzAwLCBEYXZlIEVy
dG1hbiB3cm90ZToNCj4gPiBUaGUgYW5jaWxsYXJ5IGJ1cyAodGhlbiBrbm93biBhcyB2aXJ0dWFs
IGJ1cykgd2FzIG9yaWdpbmFsbHkgc3VibWl0dGVkDQo+ID4gYWxvbmcgd2l0aCBpbXBsZW1lbnRh
dGlvbiBjb2RlIGZvciB0aGUgaWNlIGRyaXZlciBhbmQgaXJkbWEgZHJpdmUsDQo+ID4gY2F1c2lu
ZyB0aGUgY29tcGxpY2F0aW9uIG9mIGFsc28gaGF2aW5nIGRlcGVuZGVuY2llcyBpbiB0aGUgcmRt
YSB0cmVlLg0KPiA+IFRoaXMgbmV3IHN1Ym1pc3Npb24gaXMgdXRpbGl6aW5nIGFuIGFuY2lsbGFy
eSBidXMgY29uc3VtZXIgaW4gb25seSB0aGUNCj4gPiBzb3VuZCBkcml2ZXIgdHJlZSB0byBjcmVh
dGUgdGhlIGluaXRpYWwgaW1wbGVtZW50YXRpb24gYW5kIGEgc2luZ2xlDQo+ID4gdXNlci4NCj4g
DQo+IFNvIHRoaXMgd2lsbCBub3Qgd29yayBmb3IgdGhlIGljZSBkcml2ZXIgYW5kL29yIGlyZG1h
IGRyaXZlcnM/ICBJdCB3b3VsZA0KPiBiZSBncmVhdCB0byBzZWUgaG93IHRoZXkgd29yayBmb3Ig
dGhpcyBhcyB3ZWxsIGFzIGdldHRpbmcgdGhvc2UNCj4gbWFpbnRhaW5lcnMgdG8gcmV2aWV3IGFu
ZCBzaWduIG9mZiBvbiB0aGlzIGltcGxlbWVudGF0aW9uIGFzIHdlbGwuDQo+IERvbid0IGlnbm9y
ZSB0aG9zZSBkZXZlbG9wZXJzLCB0aGF0J3MgYSBiaXQgIm9kZCIsIGRvbid0IHlvdSB0aGluaz8N
Cj4gDQo+IFRvIGRyb3AgdGhlbSBmcm9tIHRoZSByZXZpZXcgcHJvY2VzcyBpcyBhY3R1YWxseSBr
aW5kIG9mIHJ1ZGUsIHdoYXQNCj4gaGFwcGVucyBpZiB0aGlzIGdldHMgbWVyZ2VkIHdpdGhvdXQg
dGhlaXIgaW5wdXQ/DQo+IA0KPiBBbmQgdGhlIG5hbWUsIHdoeSB3YXMgaXQgY2hhbmdlZCBhbmQg
d2hhdCBkb2VzIGl0IG1lYW4/ICBGb3Igbm9uLW5hdGl2ZQ0KPiBlbmdsaXNoIHNwZWFrZXJzIHRo
aXMgaXMgZ29pbmcgdG8gYmUgcm91Z2gsIGdpdmVuIHRoYXQgSSBhcyBhIG5hdGl2ZQ0KPiBlbmds
aXNoIHNwZWFrZXIgaGFkIHRvIGdvIGxvb2sgdXAgdGhlIHdvcmQgaW4gYSBkaWN0aW9uYXJ5IHRv
IGZ1bGx5DQo+IHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBkbyB3aXRoIHRoYXQg
bmFtZS4NCg0KVGhyb3VnaCBvdXIgaW50ZXJuYWwgcmV2aWV3IHByb2Nlc3MsIG9iamVjdGlvbnMg
d2VyZSByYWlzZWQgb24gbmFtaW5nIHRoZQ0KbmV3IGJ1cyB2aXJ0dWFsIGJ1cy4gVGhlIG1haW4g
b2JqZWN0aW9uIHdhcyB0aGF0IHZpcnR1YWwgYnVzIHdhcyB0b28gY2xvc2UgdG8gdmlydGlvLA0K
dmlydGNobmwsIGV0Yy4sIHRoYXQgL3N5cy9idXMvdmlydHVhbCB3b3VsZCBiZSBjb25mdXNlZCB3
aXRoIC9zeXMvYnVzL3ZpcnRpbywgYW5kDQp0aGVyZSBpcyBqdXN0IGEgbG90IG9mICd2aXJ0JyBz
dHVmZiBpbiB0aGUga2VybmVsIGFscmVhZHkuDQoNClNldmVyYWwgbmFtZXMgd2VyZSBzdWdnZXN0
ZWQgKGxpa2UgcGVlciBidXMsIHdoaWNoIHdhcyBzaG90IGRvd24gYmVjYXVzZSBpbg0KcGFydHMg
b24gdGhlIEVuZ2xpc2ggc3BlYWtpbmcgd29ybGQgdGhlIHBlZXJhZ2UgbWVhbnMgbm9iaWxpdHkp
LCBmaW5hbGx5DQoiYW5jaWxsYXJ5IGJ1cyIgd2FzIGFycml2ZWQgYXQgYnkgY29uc2Vuc3VzIG9m
IG5vdCBoYXRpbmcgaXQuDQoNCmFkamVjdGl2ZSAtDQpwcm92aWRpbmcgbmVjZXNzYXJ5IHN1cHBv
cnQgdG8gdGhlIHByaW1hcnkgYWN0aXZpdGllcyBvciBvcGVyYXRpb24gb2YgYW4gb3JnYW5pemF0
aW9uLA0KaW5zdGl0dXRpb24sIGluZHVzdHJ5LCBvciBzeXN0ZW0uDQoNCkNoYW5naW5nIGZyb20g
YW5jaWxsYXJ5IHdvdWxkIGJlIGEgc21hbGwgcGFpbiwgYnV0IGRvLWFibGUgaWYgYW5jaWxsYXJ5
IGlzIHJlYWxseQ0Kb2JqZWN0aW9uYWJsZS4gIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBv
biBhIG5hbWUgdGhhdCB3b3VsZCBiZSBtb3JlDQp0b2xlcmFibGU/DQoNCkkgd291bGQgbGlrZSB0
byBmaW5hbGl6ZSB0aGUgbmFtZSBpc3N1ZSBiZWZvcmUgZ29pbmcgZmFydGhlciB0aG91Z2gg8J+Y
ig0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQ0KLURhdmVFDQoNCj4gDQo+IE5hbWluZyBpcyBo
YXJkLCBidXQgSSB0aGluayB0aGlzIG5hbWUgaXMgcmVhbGx5IGhhcmQgdG8gZXhwbGFpbiBhbmQN
Cj4gdW5kZXJzdGFuZCwgZG9uJ3QgeW91IHRoaW5rPw0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3Jl
ZyBrLWgNCg==
