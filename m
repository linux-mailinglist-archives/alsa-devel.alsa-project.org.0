Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08A7BAED
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 09:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0441A16C5;
	Wed, 31 Jul 2019 09:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0441A16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564559304;
	bh=u2yOQRLVCcLm+S41MCDId+asv7fH7RI3aTQPmVY57eA=;
	h=Date:From:To:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N18IhdLfCXjo4zgOEwjRrRltda9We/M5Bk0sdwgFdM/Tbt1+JT+9yvYlW5rDEG5pM
	 aARqGpuIhH8UHW4nMev597N8QuI4jhWj7h9lxgU94Qm22QJqDs5TGhxEfxGTbwSIq6
	 pqthsS5Ec0EIS7n0+eIBimrm0VkFv8vlQbuTc0l4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B235AF8048D;
	Wed, 31 Jul 2019 09:46:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7132AF80483; Wed, 31 Jul 2019 09:46:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-sz.amlogic.com (mail-sz.amlogic.com [211.162.65.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5487F800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 09:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5487F800C0
Received: from SZ-17300-470L (10.28.39.217) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 31 Jul 2019
 15:47:04 +0800
Date: Wed, 31 Jul 2019 15:47:04 +0800
From: "chunguo.feng@amlogic.com" <chunguo.feng@amlogic.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20190731054003.16076-1-chunguo.feng@amlogic.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.11.303[cn]
MIME-Version: 1.0
Message-ID: <201907311547038935373@amlogic.com>
X-Originating-IP: [10.28.39.217]
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "RyanS.Lee@maximintegrated.com" <RyanS.Lee@maximintegrated.com>,
 "grundler@chromium.org" <grundler@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "bleung@chromium.org" <bleung@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98383: add 88200 and 96000
	sampling rate support
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

SGkgQWxs77yMDQoNClBsZWFzZSBraW5kbHkgd2FpdmVyIHRoaXMgcGF0Y2gsIGJlY2F1c2UgbWF4
OTgzODMgd2FzIHdyaXRlZCBpbmNvcnJlY3Rsee+8jCBpdCBzaG91bGQgYmUgbWF4OTgzNzMuDQoN
CkkgaGF2ZSBtb2RpZmllZCBpdCwgdGhlbiBzdWJtaXQgbmV3IHBhdGNoIGFnYWluLg0KDQpUaGFu
a3MsDQoNCkJScywNCkdhcnkuDQogDQogDQpGcm9tOiBjaHVuZ3VvIGZlbmcNCkRhdGU6IDIwMTkt
MDctMzEgMTM6NDANClRvOiBsZ2lyZHdvb2RAZ21haWwuY29tDQpDQzogYnJvb25pZUBrZXJuZWwu
b3JnOyBwZXJleEBwZXJleC5jejsgdGl3YWlAc3VzZS5jb207IFJ5YW5TLkxlZUBtYXhpbWludGVn
cmF0ZWQuY29tOyBibGV1bmdAY2hyb21pdW0ub3JnOyBwaWVycmUtbG91aXMuYm9zc2FydEBsaW51
eC5pbnRlbC5jb207IGdydW5kbGVyQGNocm9taXVtLm9yZzsgYWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBjaHVuZ3VvLmZlbmdAYW1sb2dp
Yy5jb20NClN1YmplY3Q6IFtQQVRDSF0gQVNvQzogbWF4OTgzODM6IGFkZCA4ODIwMCBhbmQgOTYw
MDAgc2FtcGxpbmcgcmF0ZSBzdXBwb3J0DQpGcm9tOiBmZW5nY2h1bmd1byA8Y2h1bmd1by5mZW5n
QGFtbG9naWMuY29tPg0KIA0KODgyMDAgYW5kIDk2MDAwIHNhbXBsaW5nIHJhdGUgd2FzIG5vdCBl
bmFibGVkIG9uIGRyaXZlciwgc28gY2FuJ3QgYmUgcGxheWVkLg0KIA0KVGhlIGVycm9yIGluZm9y
bWF0aW9uOg0KbWF4OTgzNzMgMy0wMDMx77yacmF0ZSA5NjAwMCBub3Qgc3VwcG9ydGVkDQptYXg5
ODM3MyAzLTAwMzHvvJpBU29DOiBjYW4ndCBzZXQgbWF4OTgzNzMtYWlmMSBodyBwYXJhbXM6IC0y
Mg0KIA0KU2lnbmVkLW9mZi1ieTogZmVuZ2NodW5ndW8gPGNodW5ndW8uZmVuZ0BhbWxvZ2ljLmNv
bT4NCi0tLQ0Kc291bmQvc29jL2NvZGVjcy9tYXg5ODM3My5jIHwgNiArKysrKysNCnNvdW5kL3Nv
Yy9jb2RlY3MvbWF4OTgzNzMuaCB8IDIgKysNCjIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspDQptb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTAwNzU1IHNvdW5kL3NvYy9jb2RlY3MvbWF4OTgz
NzMuYw0KbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEwMDc1NSBzb3VuZC9zb2MvY29kZWNzL21heDk4
MzczLmgNCiANCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL21heDk4MzczLmMgYi9zb3Vu
ZC9zb2MvY29kZWNzL21heDk4MzczLmMNCm9sZCBtb2RlIDEwMDY0NA0KbmV3IG1vZGUgMTAwNzU1
DQppbmRleCA1Mjg2OTVjZDZhMWMuLjhjNjAxYTNlYmMyNw0KLS0tIGEvc291bmQvc29jL2NvZGVj
cy9tYXg5ODM3My5jDQorKysgYi9zb3VuZC9zb2MvY29kZWNzL21heDk4MzczLmMNCkBAIC0yNjcs
NiArMjY3LDEyIEBAIHN0YXRpYyBpbnQgbWF4OTgzNzNfZGFpX2h3X3BhcmFtcyhzdHJ1Y3Qgc25k
X3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwNCmNhc2UgNDgwMDA6DQpzYW1wbGluZ19yYXRlID0g
TUFYOTgzNzNfUENNX1NSX1NFVDFfU1JfNDgwMDA7DQpicmVhazsNCisgY2FzZSA4ODIwMDoNCisg
c2FtcGxpbmdfcmF0ZSA9IE1BWDk4MzczX1BDTV9TUl9TRVQxX1NSXzg4MjAwOw0KKyBicmVhazsN
CisgY2FzZSA5NjAwMDoNCisgc2FtcGxpbmdfcmF0ZSA9IE1BWDk4MzczX1BDTV9TUl9TRVQxX1NS
Xzk2MDAwOw0KKyBicmVhazsNCmRlZmF1bHQ6DQpkZXZfZXJyKGNvbXBvbmVudC0+ZGV2LCAicmF0
ZSAlZCBub3Qgc3VwcG9ydGVkXG4iLA0KcGFyYW1zX3JhdGUocGFyYW1zKSk7DQpkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2NvZGVjcy9tYXg5ODM3My5oIGIvc291bmQvc29jL2NvZGVjcy9tYXg5ODM3
My5oDQpvbGQgbW9kZSAxMDA2NDQNCm5ldyBtb2RlIDEwMDc1NQ0KaW5kZXggZjZhMzdhYTAyZjI2
Li5hNTllNTEzNTVhODQNCi0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvbWF4OTgzNzMuaA0KKysrIGIv
c291bmQvc29jL2NvZGVjcy9tYXg5ODM3My5oDQpAQCAtMTMwLDYgKzEzMCw4IEBADQojZGVmaW5l
IE1BWDk4MzczX1BDTV9TUl9TRVQxX1NSXzMyMDAwICgweDYgPDwgMCkNCiNkZWZpbmUgTUFYOTgz
NzNfUENNX1NSX1NFVDFfU1JfNDQxMDAgKDB4NyA8PCAwKQ0KI2RlZmluZSBNQVg5ODM3M19QQ01f
U1JfU0VUMV9TUl80ODAwMCAoMHg4IDw8IDApDQorI2RlZmluZSBNQVg5ODM3M19QQ01fU1JfU0VU
MV9TUl84ODIwMCAoMHg5IDw8IDApDQorI2RlZmluZSBNQVg5ODM3M19QQ01fU1JfU0VUMV9TUl85
NjAwMCAoMHhBIDw8IDApDQovKiBNQVg5ODM3M19SMjAyOF9QQ01fU1JfU0VUVVBfMiAqLw0KI2Rl
ZmluZSBNQVg5ODM3M19QQ01fU1JfU0VUMl9TUl9NQVNLICgweEYgPDwgNCkNCi0tIA0KMi4yMi4w
DQogDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
