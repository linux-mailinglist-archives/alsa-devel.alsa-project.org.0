Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FB27CEA1
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 15:10:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C8C0187B;
	Tue, 29 Sep 2020 15:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C8C0187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601385057;
	bh=D79dFV77BP1jEFtzq+doJHoPyaPdH2rlDGocVkmlP+0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMympCB1RKW1ifoReW6H4MgJ/3uFccQx/Cpr2dgjWq51OXZgBtVUP5mpA3dSvNblF
	 IgDSGO7ww2enrxygU64t4EeKcuXGd0BNzanpYwFuB1dIxCV9I2w4FN6BLoEkLyBhFa
	 zbhzSPmAUAn2dZC/zdihF+ciGinSpTQ/BmEMB0S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E38CF8022D;
	Tue, 29 Sep 2020 15:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 850A7F8020C; Tue, 29 Sep 2020 15:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3A6F8020C
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 15:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3A6F8020C
IronPort-SDR: nzKyTutWfQpP+VLGNyx3lVlPTBpj8rfUejkZVocPWn3ki4fuqxgcIusrMyZPp/ZAzB3Uu0WJ8V
 rP0QiJQaeDyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180342169"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="180342169"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 06:09:37 -0700
IronPort-SDR: AEuTDzDr2VGAJKdRQi7dpoIAslLvaTWnwvUk78ERxvY1tNpMbkbm6+r8+YguDags1xkTtcmMFJ
 mLrHknEVYgQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="514672510"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2020 06:09:35 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 14:09:34 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 29 Sep 2020 14:09:34 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v9 14/14] ASoC: Intel: Select catpt and deprecate haswell
Thread-Topic: [PATCH v9 14/14] ASoC: Intel: Select catpt and deprecate haswell
Thread-Index: AQHWk+Nyd+dRmDU8V0SVbtJbwbPJRKl/dJAAgAAm+UA=
Date: Tue, 29 Sep 2020 13:09:34 +0000
Message-ID: <5a09acbd83764f7fa06acd6e4aa9c7f5@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-15-cezary.rojewski@intel.com>
 <5a765891-c84e-4475-5b91-7fdfc265c5d5@linux.intel.com>
In-Reply-To: <5a765891-c84e-4475-5b91-7fdfc265c5d5@linux.intel.com>
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
Cc: "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

T24gMjAyMC0wOS0yOSAxOjQ5IFBNLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZToNCj4gT24g
OS8yNi8yMDIwIDEwOjU5IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6DQo+PiBQcmV2ZW50IHNv
dW5kL3NvYy9pbnRlbC9oYXN3ZWxsIGNvZGUgY29tcGlsZSBhbmQgc2VsZWN0IGNhdHB0IGluc3Rl
YWQgYXMNCj4+IGEgcmVjb21tZW5kZWQgc29sdXRpb24uIFVzZXJzcGFjZS1leHBvc2VkIG1lbWJl
cnMgYXJlIGNvbXBhdGlibGUgd2l0aA0KPj4gd2hhdCBpcyBleHBvc2VkIGJ5IGRlcHJlY2F0ZWQg
c29sdXRpb24gdGh1cyBubyBoYXJtIGlzIGRvbmUuIFRoZSBvbmx5DQo+PiB2aXNpYmxlIGRpZmZl
cmVuY2UgaXMgdGhlIG5ld2x5IGFkZGVkICdMb29wYmFjayBNdXRlJyBrY29udHJvbC4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5j
b20+DQo+PiAtLS0NCj4+DQo+PiBDaGFuZ2VzIGluIHY3Og0KPj4gLSBwYXRjaDogMTAvMTQgJ0FT
b0M6IEludGVsOiBTZWxlY3QgY2F0cHQgYW5kIGRlcHJlY2F0ZSBoYXN3ZWxsJyBoYXMNCj4+ICAg
IGJlZW4gbW92ZWQgdG8gdGhlIGJhY2sgb2YgdGhlIGxpc3Q6IGVuYWJsZSBjYXRwdCBhZnRlciBt
YWNoaW5lIGJvYXJkcw0KPj4gICAgaGF2ZSBiZWVuIHByZXBhcmVkIGZvciBpdCBmaXJzdA0KPj4N
Cj4+IENoYW5nZXMgaW4gdjU6DQo+PiAtIHJlbW92ZSBETUFERVZJQ0VTIGRlcGVuZHMgb246IERX
X0RNQUNfQ09SRSBhbHJlYWR5IGNvdmVycyB0aGF0DQo+PiAtIGFkZCBvcHRpb25hbCBDT01QSUxF
X1RFU1QgZGVwZW5kcyBvbg0KPj4NCj4+ICAgc291bmQvc29jL2ludGVsL0tjb25maWcgICAgICAg
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiAgIHNvdW5kL3NvYy9pbnRlbC9NYWtl
ZmlsZSAgICAgICB8ICAyICstDQo+PiAgIHNvdW5kL3NvYy9pbnRlbC9ib2FyZHMvS2NvbmZpZyB8
ICA4ICsrKystLS0tDQo+PiAgIHNvdW5kL3NvYy9pbnRlbC9jYXRwdC9NYWtlZmlsZSB8ICA2ICsr
KysrKw0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9u
cygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL2ludGVsL2NhdHB0L01ha2Vm
aWxlDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9LY29uZmlnIGIvc291bmQv
c29jL2ludGVsL0tjb25maWcNCj4+IGluZGV4IDBlNDhjNGY1MzJjZS4uZGZjMjBmMmJiODU5IDEw
MDY0NA0KPj4gLS0tIGEvc291bmQvc29jL2ludGVsL0tjb25maWcNCj4+ICsrKyBiL3NvdW5kL3Nv
Yy9pbnRlbC9LY29uZmlnDQo+PiBAQCAtNDcsMjEgKzQ3LDIxIEBAIGNvbmZpZyBTTkRfU09DX0lO
VEVMX1NTVF9GSVJNV0FSRQ0KPj4gICAgICAgIyBIYXN3ZWxsL0Jyb2Fkd2VsbC9CYXl0cmFpbCBs
ZWdhY3kgYW5kIHdpbGwgYmUgc2V0DQo+PiAgICAgICAjIHdoZW4gdGhlc2UgcGxhdGZvcm1zIGFy
ZSBlbmFibGVkDQo+PiAtY29uZmlnIFNORF9TT0NfSU5URUxfSEFTV0VMTA0KPj4gLSAgICB0cmlz
dGF0ZSAiSGFzd2VsbC9Ccm9hZHdlbGwgUGxhdGZvcm1zIg0KPj4gK2NvbmZpZyBTTkRfU09DX0lO
VEVMX0NBVFBUDQo+PiArICAgIHRyaXN0YXRlICJIYXN3ZWxsIGFuZCBCcm9hZHdlbGwiDQo+PiAr
ICAgIGRlcGVuZHMgb24gQUNQSSB8fCBDT01QSUxFX1RFU1QNCj4gDQo+IFdlIG1heSB3YW50IHRv
IGxpbWl0IGJ1aWxkaW5nIG9ubHkgdG8geDg2IHBsYXRmb3JtcyBoZXJlLg0KPiANCg0KQWdyZWVk
Lg0KDQpkZXBlbmRzIG9uIChYODYgJiYgQUNQSSkgfHwgQ09NUElMRV9URVNUDQppdCBpcyB0aGVu
Lg0KDQpUaGFua3MsDQpDemFyZWsNCg0K
