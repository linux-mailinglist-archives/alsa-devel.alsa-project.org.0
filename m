Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487F11FADF
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Dec 2019 20:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6CA166B;
	Sun, 15 Dec 2019 20:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6CA166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576439706;
	bh=lNv2QJRVTDgJibxyxpDn4RDF9vlOeerW5dgpNb+sU8c=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTwTyQ7v6yMW0FDxuyouz2uqGwo1QM6e2S/omIhs1HO2fIapYYgsxg67DoMtca51d
	 bd89x2D586T3/NcgIw4YKM/6F2ImlWl6rV0mbCl/B0kUqMGp8zImddqleebOooSiV/
	 YJDUkTkAmg5NDveGoqBCPCDB7x1JeDve2Pb5a+oY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4606BF800CE;
	Sun, 15 Dec 2019 20:51:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E954EF80234; Sun, 15 Dec 2019 20:13:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ADE3F8014F
 for <alsa-devel@alsa-project.org>; Sun, 15 Dec 2019 20:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ADE3F8014F
Received: from a89-182-230-81.net-htp.de ([89.182.230.81]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1igZKp-0007dy-Li; Sun, 15 Dec 2019 20:13:43 +0100
From: Martin Regner <martin@larkos.de>
To: tiwai@suse.de
References: <20191202074947.1617-1-tiwai@suse.de>
 <e3420134-e0a8-db0e-90b9-258573c4de39@larkos.de>
Message-ID: <ccf873b5-d8f8-d330-a112-72bbbe7abdda@larkos.de>
Date: Sun, 15 Dec 2019 20:13:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <e3420134-e0a8-db0e-90b9-258573c4de39@larkos.de>
Content-Language: de-DE
X-Mailman-Approved-At: Sun, 15 Dec 2019 20:51:50 +0100
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Modify stream stripe mask only
 when needed
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

U29ycnksIHRoZSBwYXRjaCBiZWxvdyBkaWQgbm90IGNvbXBpbGUuIFRoZSB3b3JraW5nIHZlcnNp
b24gaXMganVzdCB0aGlzOgoKLS0tIGEvc291bmQvaGRhL2hkYWNfc3RyZWFtLmPCoMKgIDIwMTkt
MTItMTUgMTk6MTU6MzcuNTEyNTgzNTIzICswMTAwCisrKyBiL3NvdW5kL2hkYS9oZGFjX3N0cmVh
bS5jwqDCoCAyMDE5LTEyLTE1IDE5OjE1OjQ4Ljk3NjU4NDU5MCArMDEwMApAQCAtMTIyLDcgKzEy
Miw2IEBACiDCoMKgwqAgc25kX2hkYWNfc3RyZWFtX3dyaXRlYihhenhfZGV2LCBTRF9TVFMsIFNE
X0lOVF9NQVNLKTsgLyogdG8gYmUgc3VyZSAqLwogwqDCoMKgIGlmIChhenhfZGV2LT5zdHJpcGUp
IHsKIMKgwqDCoMKgwqDCoMKgIHNuZF9oZGFjX3N0cmVhbV91cGRhdGViKGF6eF9kZXYsIFNEX0NU
TF8zQiwgU0RfQ1RMX1NUUklQRV9NQVNLLCAwKTsKLcKgwqDCoMKgwqDCoCBhenhfZGV2LT5zdHJp
cGUgPSAwOwogwqDCoMKgIH0KIMKgwqDCoCBhenhfZGV2LT5ydW5uaW5nID0gZmFsc2U7CiDCoH0K
ClNvcnJ5IGZvciBib3RoZXJpbmcuCgoKCk9uIDE1LjEyLjE5IDE5OjU3LCBNYXJ0aW4gUmVnbmVy
IHdyb3RlOgo+IEhpIGFnYWluLAo+Cj4gaSBkaWQgYSBsaXR0bGUgYml0IG9mIHJlc2VhcmNoIGFu
ZCBteSBjdXJyZW50IHNvbHV0aW9uIGlzIHRoaXMgcGF0Y2g6Cj4KPgo+IGRpZmYgLXJ1IGEvaW5j
bHVkZS9zb3VuZC9oZGF1ZGlvLmggYi9pbmNsdWRlL3NvdW5kL2hkYXVkaW8uaAo+IC0tLSBhL2lu
Y2x1ZGUvc291bmQvaGRhdWRpby5owqDCoCAyMDE5LTEyLTE1IDE5OjQ5OjE1Ljc3NTY4OTg3MyAr
MDEwMAo+ICsrKyBiL2luY2x1ZGUvc291bmQvaGRhdWRpby5owqDCoCAyMDE5LTEyLTE1IDE5OjQ4
OjIzLjQ3NDY4ODU0NSArMDEwMAo+IEBAIC00OTMsNyArNDkzLDcgQEAKPiDCoMKgwqDCoMKgwqDC
oCBib29sIHByZXBhcmVkOjE7Cj4gwqDCoMKgwqDCoMKgwqAgYm9vbCBub19wZXJpb2Rfd2FrZXVw
OjE7Cj4gwqDCoMKgwqDCoMKgwqAgYm9vbCBsb2NrZWQ6MTsKPiAtwqDCoMKgwqDCoMKgIGJvb2wg
c3RyaXBlOjE7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBhcHBseSBzdHJp
cGUgY29udHJvbCAqLwo+ICvCoMKgwqDCoMKgwqAgYm9vbCBzdHJpcGU6MDvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGFwcGx5IHN0cmlwZSBjb250cm9sICovCj4KPiDCoMKg
wqDCoMKgwqDCoCAvKiB0aW1lc3RhbXAgKi8KPiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25n
IHN0YXJ0X3dhbGxjbGs7wqDCoMKgIC8qIHN0YXJ0ICsgbWluaW11bSB3YWxsY2xrICovCj4gZGlm
ZiAtcnUgYS9zb3VuZC9oZGEvaGRhY19zdHJlYW0uYyBiL3NvdW5kL2hkYS9oZGFjX3N0cmVhbS5j
Cj4gLS0tIGEvc291bmQvaGRhL2hkYWNfc3RyZWFtLmPCoMKgIDIwMTktMTItMTUgMTk6MTU6Mzcu
NTEyNTgzNTIzICswMTAwCj4gKysrIGIvc291bmQvaGRhL2hkYWNfc3RyZWFtLmPCoMKgIDIwMTkt
MTItMTUgMTk6MTU6NDguOTc2NTg0NTkwICswMTAwCj4gQEAgLTEyMiw3ICsxMjIsNiBAQAo+IMKg
wqDCoMKgwqDCoMKgIHNuZF9oZGFjX3N0cmVhbV93cml0ZWIoYXp4X2RldiwgU0RfU1RTLCBTRF9J
TlRfTUFTSyk7IC8qIHRvIGJlIAo+IHN1cmUgKi8KPiDCoMKgwqDCoMKgwqDCoCBpZiAoYXp4X2Rl
di0+c3RyaXBlKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuZF9oZGFjX3N0
cmVhbV91cGRhdGViKGF6eF9kZXYsIFNEX0NUTF8zQiwgCj4gU0RfQ1RMX1NUUklQRV9NQVNLLCAw
KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhenhfZGV2LT5zdHJpcGUgPSAwOwo+
IMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoCBhenhfZGV2LT5ydW5uaW5nID0gZmFs
c2U7Cj4gwqB9Cj4KPiBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoZSBhcHByb2FjaCBpbiB0
aGUgb3JpZ2luYWwgY29tbWl0LiBBcyBmYXIgCj4gYXMgaSB1bmRlcnN0YW5kIHRoaXMsIHRoZSBz
dHJpcGUgcHJvcGVydHkgaXMgaW5pdGlhbGx5IHNldCB0byAxLgo+IEluIHRoZSBwYXRjaF9oZG1p
LmMgaXQgaXMgc2V0IHRvIDEgaWYgdGhlIEFDX1dDQVBfU1RSSVBFIGZsYWcgaXMgc2V0LiAKPiBG
aW5hbGx5IGl0IGlzIHNldCB0byAwIGluIHRoZSBmdW5jdGlvbiBzbmRfaGRhY19zdHJlYW1fY2xl
YXIuCj4KPiBXaXRoIHRoaXMgcGF0Y2ggdGhlIHN0cmlwZSBwcm9wZXJ0eSBpcyBpbml0aWFsbHkg
MCwgc2V0IHRvIDEgaWYgdGhlIAo+IEFDX1dDQVBfU1RSSVBFIGZsYWcgaXMgc2V0IGFuZCBuZXZl
ciB0b3VjaGVkIGFnYWluLgo+Cj4gVW5mb3J0dW5hdGx5IGkgY2FuJ3QgdGVzdCB0aGlzIG9uIGFu
b3RoZXIgbWFjaGluZS4KPgo+IEtpbmQgcmVnYXJkcwo+Cj4gTWFydGluCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
