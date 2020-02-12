Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75B15A2AD
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 09:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A298F1661;
	Wed, 12 Feb 2020 09:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A298F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581494632;
	bh=6FVZHQWnq1d7v90qtE1bLxr2KKuJBbfliPiADIrDCVY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hn3jgmHSBGlYACrAYnTR+V4gYo7lTl+nHsMsMrtyf35JyCjQRgXKvDVH3Hbub3U0L
	 komQQunBaogB3ANOieWDVb5DupSVwhyJfZXCGPD2DGxUhrk0qb5jvqPV2Gubur3OmY
	 Wh3GHhvIvXZP4gOz2CdrkLjs61/sooFLk+k5yU2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A80F2F80158;
	Wed, 12 Feb 2020 09:02:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2D13F80157; Wed, 12 Feb 2020 09:02:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C75C9F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 09:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C75C9F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Szq2nQYz"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01C81xBJ095149;
 Wed, 12 Feb 2020 02:01:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581494519;
 bh=NMTGmOJTTsRgJdge33dgFYwCOb7FpIs1fPjpfpLUBhM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Szq2nQYzAVvT+ophs58XAJBCUwogpwmwVdiXQghZG5ljD+XDAXj1yQgiCxGUpkaRi
 HYeV9e4Y8XNBSzCdW3NznHpqDpccIt5dfrPcpmX276vS34FBX1AhfVXo88ZCknfzWh
 TSGbdN6dZrqBXJOMUYJ4Vv0JZNVu/RQIN0BXLkjw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01C81xf1023194
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Feb 2020 02:01:59 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 02:01:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 02:01:59 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01C81taM069601;
 Wed, 12 Feb 2020 02:01:56 -0600
To: Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>
References: <20200211171645.41990-1-tony@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
Date: Wed, 12 Feb 2020 10:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211171645.41990-1-tony@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>,
 linux-omap@vger.kernel.org, "Arthur D ." <spinal.by@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Allocate dais dynamically for
 TDM and audio graph card
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxMS8wMi8yMDIwIDE5LjE2LCBUb255IExpbmRncmVuIHdyb3RlOgo+IFdlIGNhbiBoYXZl
IG11bHRpcGxlIGNvbm5lY3Rpb25zIG9uIGEgc2luZ2xlIE1jQlNQIGluc3RhbmNlIGNvbmZpZ3Vy
ZWQKPiB3aXRoIGF1ZGlvIGdyYXBoIGNhcmQgd2hlbiB1c2luZyBURE0gKFRpbWUgRGl2aXNpb24g
TXVsdGlwbGV4aW5nKS4gTGV0J3MKPiBhbGxvdyB0aGF0IGJ5IGNvbmZpZ3VyaW5nIGRhaXMgZHlu
YW1pY2FsbHkuCgpJdCBpcyBzdGlsbCBvbmUgREFJLi4uCklmIHlvdSBoYXZlIG11bHRpcGxlIGNv
ZGVjIGNvbm5lY3RlZCB0byB0aGUgc2FtZSBJMlMgbGluZXMsIGJ1dCB0aGUKY29kZWNzIGNvbW11
bmljYXRlIHdpdGhpbiBkaWZmZXJlbnQgdGltZSBzbG90cywgeW91IHN0aWxsIGhhdmUgb25lIERB
SQpvbiB0aGUgQ1BVIHNpZGUsIGJ1dCBtdWx0aXBsZSBjb2RlY3MgKGNvZGVjIERBSXMpIHdpdGgg
ZGlmZmVyZW50IFRETSBzbG90LgoKPiBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvdW5kL2F1ZGlvLWdyYXBoLWNhcmQudHh0IGFuZAo+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncmFwaC50eHQgZm9yIG1vcmUgZGV0YWlscyBmb3IKPiBtdWx0aXBsZSBl
bmRwb2ludHMuCgpTZWUgdGhlIGV4YW1wbGUgZm9yICdNdWx0aSBEQUkgd2l0aCBEUENNJyBpbiBh
dWRpby1ncmFwaC1jYXJkLnR4dApUaGUgUENNMzE2OGEgaGF2ZSAyIERBSXM6IHBsYXliYWNrIGFu
ZCBjYXB0dXJlLCBidXQgeW91IGNhbiBoYXZlCm11bHRpcGxlIGVuZHBvaW50cyB3aXRoaW4gYSBE
QUkuCgo+IEkndmUgdGVzdGVkIHRoaXMgd2l0aCBkcm9pZDQgd2hlcmUgY3BjYXAgcG1pYyBhbmQg
bW9kZW0gdm9pY2UgYXJlIGJvdGgKPiBib3RoIHdpcmVkIHRvIG1jYnNwMy4gSSd2ZSBhbHNvIHRl
c3RlZCB0aGlzIG9uIGRyb2lkNCBib3RoIHdpdGggYW5kCj4gd2l0aG91dCB0aGUgcGVuZGluZyBt
b2RlbSBhdWRpbyBjb2RlYyBkcml2ZXIgdGhhdCBpcyB3YWl0aW5nIGZvciBuX2dzbQo+IHNlcmRl
diBkZXBlbmRlbmNpZXMgdG8gY2xlYXIuCgpXaGF0IHRoaXMgcGF0Y2ggeW91IGVmZmVjdGl2ZWx5
IGp1c3QgY3JlYXRpbmcgZHVtbXktZGFpcyBvbiB0b3Agb2YgdGhlCnJlYWwgTWNCU1AgREFJLgpZ
b3UgYWxzbyByZW5hbWUgdGhlIERBSXMsIHdoaWNoIG1pZ2h0IGJyZWFrIGFtcy1kZWx0YS4KCldl
IHN0aWxsIGhhdmUgbGVnYWN5IHN1cHBvcnQgaW4Kb21hcC10d2w0MDMwLmMKb21hcDNwYW5kb3Jh
LmMKb3NrNTkxMi5jCnJ4NTEuYwoKd2hpY2ggd2lsbCBicmVhayB3aXRoIHRoZSByZW5hbWVkIERB
SS4gT24gdGhlIG90aGVyIGhhbmQgSSB0aGluayB0aGUKbGVnYWN5IHN1cHBvcnQgY2FuIGJlIGRy
b3BwZWQgZnJvbSB0aGVtLgoKSSBrbm93IGl0IHdhcyBkaXNjdXNzZWQsIGJ1dCBjYW4gbm90IGZp
bmQgdGhlIG1haWw6CkNhbiB5b3UgYnJpZWYgYWdhaW4gb24gdGhlIGF1ZGlvIGNvbm5lY3Rpb24/
CkRvIHlvdSBoYXZlIGJyYW5jaCB3aXRoIHdvcmtpbmcgY29kZT8KCi0gUMOpdGVyCgo+IENjOiBB
YXJvIEtvc2tpbmVuIDxhYXJvLmtvc2tpbmVuQGlraS5maT4KPiBDYzogQXJ0aHVyIEQuIDxzcGlu
YWwuYnlAZ21haWwuY29tPgo+IENjOiBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxhQGJpdG1l
ci5jb20+Cj4gQ2M6IE1lcmxpam4gV2FqZXIgPG1lcmxpam5Ad2l6enVwLm9yZz4KPiBDYzogUGF2
ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gQ2M6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZh
bHVzaUB0aS5jb20+Cj4gQ2M6IFNlYmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4KPiBT
aWduZWQtb2ZmLWJ5OiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPgo+IC0tLQo+ICBz
b3VuZC9zb2MvdGkvb21hcC1tY2JzcC1wcml2LmggfCAgMiArCj4gIHNvdW5kL3NvYy90aS9vbWFw
LW1jYnNwLmMgICAgICB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvc291bmQvc29jL3RpL29tYXAtbWNic3AtcHJpdi5oIGIvc291bmQvc29jL3Rp
L29tYXAtbWNic3AtcHJpdi5oCj4gLS0tIGEvc291bmQvc29jL3RpL29tYXAtbWNic3AtcHJpdi5o
Cj4gKysrIGIvc291bmQvc29jL3RpL29tYXAtbWNic3AtcHJpdi5oCj4gQEAgLTI2Miw2ICsyNjIs
OCBAQCBzdHJ1Y3Qgb21hcF9tY2JzcCB7Cj4gIAlzdHJ1Y3Qgb21hcF9tY2JzcF9wbGF0Zm9ybV9k
YXRhICpwZGF0YTsKPiAgCXN0cnVjdCBvbWFwX21jYnNwX3N0X2RhdGEgKnN0X2RhdGE7Cj4gIAlz
dHJ1Y3Qgb21hcF9tY2JzcF9yZWdfY2ZnIGNmZ19yZWdzOwo+ICsJc3RydWN0IHNuZF9zb2NfZGFp
X2RyaXZlciAqZGFpczsKPiArCWludCBkYWlfY291bnQ7Cj4gIAlzdHJ1Y3Qgc25kX2RtYWVuZ2lu
ZV9kYWlfZG1hX2RhdGEgZG1hX2RhdGFbMl07Cj4gIAl1bnNpZ25lZCBpbnQgZG1hX3JlcVsyXTsK
PiAgCWludCBkbWFfb3BfbW9kZTsKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RpL29tYXAtbWNi
c3AuYyBiL3NvdW5kL3NvYy90aS9vbWFwLW1jYnNwLmMKPiAtLS0gYS9zb3VuZC9zb2MvdGkvb21h
cC1tY2JzcC5jCj4gKysrIGIvc291bmQvc29jL3RpL29tYXAtbWNic3AuYwo+IEBAIC0xNCw2ICsx
NCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9vZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9vZl9ncmFwaC5oPgo+ICAjaW5jbHVkZSA8c291bmQvY29yZS5oPgo+ICAjaW5jbHVkZSA8c291
bmQvcGNtLmg+Cj4gICNpbmNsdWRlIDxzb3VuZC9wY21fcGFyYW1zLmg+Cj4gQEAgLTEzMDQsMjMg
KzEzMDUsNTMgQEAgc3RhdGljIGludCBvbWFwX21jYnNwX3JlbW92ZShzdHJ1Y3Qgc25kX3NvY19k
YWkgKmRhaSkKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgc3RydWN0IHNuZF9zb2Nf
ZGFpX2RyaXZlciBvbWFwX21jYnNwX2RhaSA9IHsKPiAtCS5wcm9iZSA9IG9tYXBfbWNic3BfcHJv
YmUsCj4gLQkucmVtb3ZlID0gb21hcF9tY2JzcF9yZW1vdmUsCj4gLQkucGxheWJhY2sgPSB7Cj4g
LQkJLmNoYW5uZWxzX21pbiA9IDEsCj4gLQkJLmNoYW5uZWxzX21heCA9IDE2LAo+IC0JCS5yYXRl
cyA9IE9NQVBfTUNCU1BfUkFURVMsCj4gLQkJLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1Mx
Nl9MRSB8IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFLAo+IC0JfSwKPiAtCS5jYXB0dXJlID0gewo+
IC0JCS5jaGFubmVsc19taW4gPSAxLAo+IC0JCS5jaGFubmVsc19tYXggPSAxNiwKPiAtCQkucmF0
ZXMgPSBPTUFQX01DQlNQX1JBVEVTLAo+IC0JCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9T
MTZfTEUgfCBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSwKPiAtCX0sCj4gLQkub3BzID0gJm1jYnNw
X2RhaV9vcHMsCj4gLX07Cj4gK3N0YXRpYyBpbnQgb21hcF9tY2JzcF9pbml0X2RhaXMoc3RydWN0
IG9tYXBfbWNic3AgKm1jYnNwKQo+ICt7Cj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gbWNi
c3AtPmRldi0+b2Zfbm9kZTsKPiArCWludCBpOwo+ICsKPiArCWlmIChucCkKPiArCQltY2JzcC0+
ZGFpX2NvdW50ID0gb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2NvdW50KG5wKTsKPiArCj4gKwlpZiAo
IW1jYnNwLT5kYWlfY291bnQpCj4gKwkJbWNic3AtPmRhaV9jb3VudCA9IDE7Cj4gKwo+ICsJbWNi
c3AtPmRhaXMgPSBkZXZtX2tjYWxsb2MobWNic3AtPmRldiwgbWNic3AtPmRhaV9jb3VudCwKPiAr
CQkJCSAgIHNpemVvZigqbWNic3AtPmRhaXMpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghbWNic3At
PmRhaXMpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG1jYnNw
LT5kYWlfY291bnQ7IGkrKykgewo+ICsJCXN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIgKmRhaSA9
ICZtY2JzcC0+ZGFpc1tpXTsKPiArCj4gKwkJZGFpLT5uYW1lID0gZGV2bV9rYXNwcmludGYobWNi
c3AtPmRldiwgR0ZQX0tFUk5FTCwgIiVzLWRhaSVpIiwKPiArCQkJCQkgICBkZXZfbmFtZShtY2Jz
cC0+ZGV2KSwgaSk7Cj4gKwo+ICsJCWlmIChpID09IDApIHsKPiArCQkJZGFpLT5wcm9iZSA9IG9t
YXBfbWNic3BfcHJvYmU7Cj4gKwkJCWRhaS0+cmVtb3ZlID0gb21hcF9tY2JzcF9yZW1vdmU7Cj4g
KwkJCWRhaS0+b3BzID0gJm1jYnNwX2RhaV9vcHM7Cj4gKwkJfQo+ICsJCWRhaS0+cGxheWJhY2su
Y2hhbm5lbHNfbWluID0gMTsKPiArCQlkYWktPnBsYXliYWNrLmNoYW5uZWxzX21heCA9IDE2Owo+
ICsJCWRhaS0+cGxheWJhY2sucmF0ZXMgPSBPTUFQX01DQlNQX1JBVEVTOwo+ICsJCWlmIChtY2Jz
cC0+cGRhdGEtPnJlZ19zaXplID09IDIpCj4gKwkJCWRhaS0+cGxheWJhY2suZm9ybWF0cyA9IFNO
RFJWX1BDTV9GTVRCSVRfUzE2X0xFOwo+ICsJCWVsc2UKPiArCQkJZGFpLT5wbGF5YmFjay5mb3Jt
YXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUgfAo+ICsJCQkJCQlTTkRSVl9QQ01fRk1UQklU
X1MzMl9MRTsKPiArCQlkYWktPmNhcHR1cmUuY2hhbm5lbHNfbWluID0gMTsKPiArCQlkYWktPmNh
cHR1cmUuY2hhbm5lbHNfbWF4ID0gMTY7Cj4gKwkJZGFpLT5jYXB0dXJlLnJhdGVzID0gT01BUF9N
Q0JTUF9SQVRFUzsKPiArCQlpZiAobWNic3AtPnBkYXRhLT5yZWdfc2l6ZSA9PSAyKQo+ICsJCQlk
YWktPmNhcHR1cmUuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFOwo+ICsJCWVsc2UK
PiArCQkJZGFpLT5jYXB0dXJlLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSB8Cj4g
KwkJCQkJICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFOwo+ICsJfQo+ICsKPiArCXJldHVy
biAwOwo+ICt9Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50X2Ry
aXZlciBvbWFwX21jYnNwX2NvbXBvbmVudCA9IHsKPiAgCS5uYW1lCQk9ICJvbWFwLW1jYnNwIiwK
PiBAQCAtMTQwOSwxOCArMTQ0MCwxNyBAQCBzdGF0aWMgaW50IGFzb2NfbWNic3BfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCW1jYnNwLT5kZXYgPSAmcGRldi0+ZGV2Owo+
ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWNic3ApOwo+ICAKPiAtCXJldCA9IG9tYXBf
bWNic3BfaW5pdChwZGV2KTsKPiArCXJldCA9IG9tYXBfbWNic3BfaW5pdF9kYWlzKG1jYnNwKTsK
PiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlpZiAobWNic3AtPnBkYXRhLT5y
ZWdfc2l6ZSA9PSAyKSB7Cj4gLQkJb21hcF9tY2JzcF9kYWkucGxheWJhY2suZm9ybWF0cyA9IFNO
RFJWX1BDTV9GTVRCSVRfUzE2X0xFOwo+IC0JCW9tYXBfbWNic3BfZGFpLmNhcHR1cmUuZm9ybWF0
cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFOwo+IC0JfQo+ICsJcmV0ID0gb21hcF9tY2JzcF9p
bml0KHBkZXYpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICAKPiAgCXJldCA9IGRl
dm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25lbnQoJnBkZXYtPmRldiwKPiAgCQkJCQkgICAgICAm
b21hcF9tY2JzcF9jb21wb25lbnQsCj4gLQkJCQkJICAgICAgJm9tYXBfbWNic3BfZGFpLCAxKTsK
PiArCQkJCQkgICAgICBtY2JzcC0+ZGFpcywgbWNic3AtPmRhaV9jb3VudCk7Cj4gIAlpZiAocmV0
KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IAoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwg
UG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAw
NjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
