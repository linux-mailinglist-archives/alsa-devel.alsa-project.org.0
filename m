Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED42A07C9
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:25:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D5D1657;
	Fri, 30 Oct 2020 15:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D5D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604067927;
	bh=xfi/xuEkyUgjR0Hi2tSykmCQ/7wIuRoHCIO+0AKXGf0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtdUKygp9U8zf+Jks7xFDehY+ih3hV5zVZja4gk7KiaS9YnovtriSXQ61BLhj0p1K
	 YhPBrawsQGYnsRH7q7fzl4nZuJzs/onusMWxJ55SA2iiI0kDXTQV90UKoLEKah64Ul
	 Rf55H4juXr3pN228ME37GibLkE+fidC3aT5n25oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6FB4F80249;
	Fri, 30 Oct 2020 15:23:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7798BF80212; Fri, 30 Oct 2020 15:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F657F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F657F800FF
IronPort-SDR: Yj7XT0Zxu8mFDPPzw+oUybX6PWLrJvLzFzehIci/ys5PyAXA3cHDk2gfIUOD0is77H2nqGHiQA
 XeMQ3PVqa6IA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="155587412"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="155587412"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 07:23:40 -0700
IronPort-SDR: mYwC3yDD2XLDUAdQedxzDFccu2HFDVAYxl/T9wSv9Nmn6AXltYBZ9RNwre1s3/O7x9nQMRaGWG
 yk7P3htZmaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="304945266"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2020 07:23:38 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Oct 2020 14:23:38 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 30 Oct 2020 14:23:38 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: RE: [PATCH v3 0/7] ASoC: topology: Change to resource managed memory
Thread-Topic: [PATCH v3 0/7] ASoC: topology: Change to resource managed memory
Thread-Index: AQHWrrlvjJim24GI60Cvue3XRUIgVamwMb3g
Date: Fri, 30 Oct 2020 14:23:37 +0000
Message-ID: <3975a572394d4d8ca82778979c5e422f@intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

T24gMjAyMC0xMC0zMCAzOjU0IFBNLCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZToNCj4gQWxt
b3N0IGFsbCBvdGhlciBhbGxvY2F0aW9ucyBpbiBBU29DIEFQSSBhcmUgcmVzb3VyY2UgbWFuYWdl
ZCwgdGhlIG9ubHkNCj4gZXhjZXB0aW9uIGlzIHNvYy10b3BvbG9neS5jLg0KPiANCj4gVGhpcyBw
YXRjaHNldCBjbGVhbiB1cHMgZmV3IHVubmVjZXNzYXJ5IGZ1bmN0aW9ucyBpbiBwcmVwYXJhdGlv
biBmb3INCj4gY2hhbmdlIGFuZCB0aGVuIGNoYW5nZXMgdG8gZGV2bV8gZnVuY3Rpb25zIGZvciBh
bGxvY2F0aW9uLg0KPiANCg0KVGhlc2UgYWRkcmVzcyBzb21lIG9mIHRoZSBsb25nIHN0YW5kaW5n
IGlzc3VlcyBvZiByZXNvdXJjZSBhbGxvY2F0aW9uDQpmb3IgdG9wb2xvZ3ksIHRoYW5rcyBmb3Ig
eW91ciB3b3JrLg0KTml0cGljazoNCip0aGUgMC83KiBsb29rcyB3ZWlyZCBnaXZlbiB0aGF0IG9u
bHkgNiBwYXRjaGVzIGFyZSBhY3R1YWxseSBwYXJ0IG9mIHRoZQ0Kc2VyaWVzLg0KDQpGb3IgdGhl
IHNlcmllczoNCg0KUmV2aWV3ZWQtYnk6IENlemFyeSBSb2pld3NraSA8Y2V6YXJ5LnJvamV3c2tp
QGludGVsLmNvbT4NCg0KVGhhbmtzLA0KQ3phcmVrDQoNCj4gQW1hZGV1c3ogU8WCYXdpxYRza2kg
KDYpOg0KPiAgICBBU29DOiB0b3BvbG9neTogUmVtb3ZlIHVudXNlZCBmdW5jdGlvbnMgZnJvbSB0
b3BvbG9neSBBUEkNCj4gICAgQVNvQzogdG9wb2xvZ3k6IFJlbW92ZSBtdWx0aXN0ZXAgdG9wb2xv
Z3kgbG9hZGluZw0KPiAgICBBU29DOiB0b3BvbG9neTogVW5pZnkgYWxsIGRldmljZSByZWZlcmVu
Y2VzDQo+ICAgIEFTb0M6IHRvcG9sb2d5OiBDaGFuZ2UgYWxsb2NhdGlvbnMgdG8gcmVzb3VyY2Ug
bWFuYWdlZA0KPiAgICBBU29DOiB0b3BvbG9neTogUmVtb3ZlIGVtcHR5IGZ1bmN0aW9ucw0KPiAg
ICBBU29DOiB0b3BvbG9neTogU2ltcGxpZnkgcmVtb3ZlX3dpZGdldCBmdW5jdGlvbg0KPiANCj4g
ICBpbmNsdWRlL3NvdW5kL3NvYy10b3BvbG9neS5oICAgICAgICAgICB8ICAxMyArLQ0KPiAgIHNv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jIHwgICA5ICstDQo+ICAgc291bmQv
c29jL3NvYy10b3BvbG9neS5jICAgICAgICAgICAgICAgfCAzMDIgKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgIHNvdW5kL3NvYy9zb2YvcGNtLmMgICAgICAgICAgICAgICAgICAgIHwgICAy
ICstDQo+ICAgc291bmQvc29jL3NvZi90b3BvbG9neS5jICAgICAgICAgICAgICAgfCAgIDQgKy0N
Cj4gICA1IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDI3MyBkZWxldGlvbnMoLSkN
Cj4NCg==
