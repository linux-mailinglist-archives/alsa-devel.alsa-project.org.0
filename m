Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4628AF88
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E67167E;
	Mon, 12 Oct 2020 09:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E67167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602489633;
	bh=6bVmTZIKoR9n+Z80/vBKzVM3UgmMA8hy1jTWU2FbheM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZptuiROcR0YVcNKPcRdnJJYyMF7wRmdwSO/A/Sxcg1m9YXoKHxPx7IMrg10y6XSe
	 3QURfj5rjOAt2roqrkgYybZQoLG625K+QDxd6vO5oCxHUsCspS3eYOv/VjkQkQyzZH
	 bWS6OzBrbUztv1lTgLOvimO+zN9pfAoA86hMKmdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148E6F8021D;
	Mon, 12 Oct 2020 09:58:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ACEAF80217; Mon, 12 Oct 2020 09:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64042F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 09:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64042F80141
IronPort-SDR: NQ8xuv8b3bGF19nBNmDuYDDSgFgPghVh3CKRZCnc+7/gPyZ++c8/rCIQUXflDNCkxhgsmaglsf
 Rt1dGUQLhxbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="164918258"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="164918258"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 00:58:43 -0700
IronPort-SDR: KcAUyyJoQQV+GrnqsRdUVU9UWGTKarklTiD+Zkf9VCWDpx5WB1s1PeKzf3ukehepqo95DaKB54
 m+5CfOPTGaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="317838918"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2020 00:58:42 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 08:58:41 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 12 Oct 2020 08:58:41 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: RE: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
Thread-Topic: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
Thread-Index: AQHWn7Rwuj7kFXmqX0ujyMeVn0Z2aKmTkUZA///0/4CAABO7MA==
Date: Mon, 12 Oct 2020 07:58:41 +0000
Message-ID: <972f16ace6e546ef8c5cd2d15784d89e@intel.com>
References: <20201011095346.49589-1-hdegoede@redhat.com>
 <b92b6b6d382048829a37ae803d4f9451@intel.com>
 <6fbc7ba0-646a-27b9-8879-e9f4045385fa@redhat.com>
In-Reply-To: <6fbc7ba0-646a-27b9-8879-e9f4045385fa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

T24gMjAyMC0xMC0xMiA5OjQyIEFNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IE9uIDEwLzEyLzIwIDk6MjQgQU0sIFJvamV3c2tpLCBDZXphcnkgd3JvdGU6DQoNCi4uLg0KDQo+
Pg0KPj4gSGVsbG8sDQo+Pg0KPj4gU2VyaWVzOg0KPj4gW1BBVENIIHYyIDAwLzEzXSBBU29DOiBJ
bnRlbDogUmVtb3ZlIG9ic29sZXRlIHNvbHV0aW9ucyBhbmQgY29tcG9uZW50cw0KPj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxzYS1kZXZlbC8yMDIwMTAwNjA2NDkwNy4xNjI3Ny0xLWNlemFy
eS5yb2pld3NraUBpbnRlbC5jb20vIA0KPj4NCj4+DQo+PiByZW1vdmVzIHNzdC1hY3BpIGNvbXBv
bmVudCBhbG9uZyB3aXRoIG1hbnkgb3RoZXJzIHNvIGZ1cnRoZXIgY2hhbmdlcyB0bw0KPj4gc2Fp
ZCBjb21wb25lbnQgd2lsbCBvbmx5IGNhdXNlIGNvbmZsaWN0cyAtb3ItIHJlcXVpcmUgY29tbWl0
IHJlb3JkZXJpbmcuDQo+PiBJJ2QgYWR2aWNlIGFnYWluc3QgdGhhdC4NCj4gDQo+IEFzIEkgYWxy
ZWFkeSBtZW50aW9uZWQgaW4gdGhlIHByaXZhdGUtdGhyZWFkIHdoaWNoIFBpZXJyZS1Mb3VpcyBz
dGFydGVkDQo+IHdpdGggbWUsIEphcm9zbGF2IEt5c2VsYSBhbmQgTGlhbSBhYm91dCB0aGlzIEkg
d291bGQgYWR2aWNlIGFnYWluc3QgDQo+IGFwcGx5aW5nDQo+IHRoYXQgc2VyaWVzIGZvciBub3cu
IEZpcnN0IHdlIG5lZWQgdG8gcHV0IGluIG1vcmUgd29yayB0byBtYWtlIHN1cmUgdGhhdA0KPiB0
aGUgbmV3IGRyaXZlcnMgYXJlIGFjdHVhbGx5IHJlYWR5Lg0KPiANCj4gQWxzbyBJIG11c3Qgc2F5
IHRoYXQgSSdtIHF1aXRlIGRpc2FwcG9pbnRlZCB0aGF0IHNpbmNlIEksIGFzIHRoZSBwZXJzb24N
Cj4gd2hvIG1vcmUgb3IgbGVzcyBzaW5nbGUgaGFuZGVkbHkgaGF2ZSBtYWRlIHN1cmUgdGhhdCBh
dWRpbyB3b3JrcyBwcm9wZXJseSBvDQo+IEJheSBUcmFpbCBhbmQgQ2hlcnJ5IFRyYXVsIGRldmlj
ZXMgKCopLCBoYXMgbm90IGJlZW4gQ2MtZWQgb24gdGhhdCBzZXJpZXMsDQo+IHRoYXQgc2VlbXMg
bGlrZSBhIGh1Z2Ugb3ZlcnNpZ2h0Lg0KPiANCj4gQW55d2F5cyBJIHdpbGwgcmVwbHkgaW4gdGhl
IHRocmVhZCBvZiB0aGUgc2VyaWVzIGFuZCBhc2sgTWFyayB0byByZXZlcnQNCj4gdGhlIGVudGly
ZSBzZXJpZXMuIFNpbmNlIElNSE8gdGhlIG5ldyBkcml2ZXJzIGFyZSBjbGVhcmx5IG5vdCByZWFk
eSB5ZXQuDQo+IFllc3RlcmRheSBJIHJhbiBteSBmaXJzdCBzZXQgb2YgdGVzdGVkIGFuZCBJIGlt
bWVkaWF0ZWx5IGhpdCBhIERTUA0KPiBoYW5nIGRvaW5nIGp1c3QgYSBmZXcgdmVyeSBiYXNpYyB0
ZXN0cy4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiANCj4gDQo+ICopIEFuZCBr
ZXB0IGl0IHdvcmtpbmcgcHJvcGVybHkgZGVzcGl0ZSBvdGhlciBwZW9wbGUgYnJlYWtpbmcgaXQg
d2l0aCANCj4gY2hhbmdlcw0KPiBsaWtlIG1vdmluZyB0aGUgdXNlcnNwYWNlIHN0dWZmIHRvIFVD
TTIuDQo+IA0KDQpIZWxsbywNCg0KV2hhdCdzIHRoZSBuYW1lIG9mIHRoZSBwcml2YXRlLXRocmVh
ZD8gT3IgcGVyaGFwcyBJJ20gbm90IGV2ZW4gaW52aXRlZA0KdGhlcmU/DQoNClBsZWFzZSwgZWxh
Ym9yYXRlICJuZXcgZHJpdmVycyIuIC9iYXl0cmFpbC8gaGFzIGJlZW4gZGVwcmVjYXRlZCBmb3IN
CnllYXJzIHdpdGggb25seSB0d28gYXZhaWxhYmxlIGJvYXJkcyAobWFjaGluZSBib2FyZHMpIHRv
IGl0IC0gd2hpY2ggYXJlDQpzb21ld2hhdCBkdXBsaWNhdGVzIG9mIC9hdG9tLyAtb3ItIFNPRiBl
cXVpdmFsZW50cyAoYnl0Y3IteHh4eCkuIEZyb20NCmxpbnV4LWtlcm5lbCBwZXJzcGVjdGl2ZSwg
aGF2aW5nIDN4IGJheXRyYWlsIGRyaXZlciBpcyBzaW1wbHkgYmFkLg0KDQpTZXZlcmFsIHRlYW1z
LCBjbGllbnRzIGFuZCBncm91cHMgaGF2ZSBiZWVuIGFza2VkIG9uIG11bHRpcGxlIG9jY2FzaW9u
cw0KYWJvdXQgdGhlIHVzYWdlIG9mIHRoZSAvYmF5dHJhaWwvIGZvbGRlci4gTm90IG9uY2UgcG9z
aXRpdmUgYW5zd2VyIGhhcw0KYmVlbiBnaXZlbi4NCg0KVGhhbmtzLA0KQ3phcmVrDQoNCg==
