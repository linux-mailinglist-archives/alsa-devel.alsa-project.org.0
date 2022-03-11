Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 868474D7B25
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:02:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A8A21742;
	Mon, 14 Mar 2022 08:01:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A8A21742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241355;
	bh=jO7pRUhUzvbKLtcfqjSd2vvFUPfaXh6VTOyoapeVawg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YnMS4TJfKQ/yaeyBibWJp9JCHeWU75vr24igoy/gsF9wtGqJOqhgUbrh1zVKJqV8B
	 FV8QaShXhekoQEOWi7dRgaJdYf/YX5Uaq2BT0ZhYYm2w7W3aaFrS7/mSjzyi8knWT9
	 TbxWZbah/vaJcZNOMyVUzyiKtKrKZxuk40CVZJS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A71F8053C;
	Mon, 14 Mar 2022 07:59:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 494E4F80137; Fri, 11 Mar 2022 02:20:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,HTML_NONELEMENT_30_40,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7264F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 02:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7264F8012C
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: znfcQSa1hKZH2WdbhNb45iQZaSHkICk4CdRpnOwOPCTsuNrCiMNb1wkxe2kOZ
 bdRUuA7zdVunrsKuhbn70fB/E+Z7EkTPmvbemlXSaQUwxXniowJWB9ISwD4kg4awiAq/ipo
 trVN0LYccp9bs0lywQy7nw0injTi05RbRp7tXtxMJBfe3OJBHhY11yzUvg9zmfMu6QmAK1t
 OfUQoGec06jbCKYJVP4deGIXCbyN1PTzl7+mGsBt7gwr8SFlaf3DsFGn7wy+D7z0Yid9ZJr
 H1Pu6PziG4XIlhOEZ9qQqDZmSRVAy30mFcchh0op0cmBbKYz+V5CxquZeaBrraZ1tWEkaeS
 yi7iWzKdCCznVayzPU1zcW7qK+FTHkD79CWmDUliPlAhbyjOhMLxUHRyU57Li2A1rrr8N4d
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 113.57.13.187
X-QQ-STYLE: 
X-QQ-mid: logic634t1646961642t3019198
From: "=?utf-8?B?aHVhbmd3ZW5odWk=?=" <huangwenhuia@uniontech.com>
To: "=?utf-8?B?VGFrYXNoaSBJd2Fp?=" <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek - Fix headset mic problem for a HP
 machine with alc671
Mime-Version: 1.0
Date: Fri, 11 Mar 2022 09:20:42 +0800
X-Priority: 3
Message-ID: <tencent_080B040F1CE2D7D83D6FD0C8@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 11 Mar 2022 09:20:43 +0800 (CST)
Feedback-ID: logic:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?utf-8?B?YWxzYS1kZXZlbA==?= <alsa-devel@alsa-project.org>,
 =?utf-8?B?a2FpbGFuZw==?= <kailang@realtek.com>,
 =?utf-8?B?dGFudXJlYWw=?= <tanureal@opensource.cirrus.com>,
 =?utf-8?B?amVyZW15LnN6dQ==?= <jeremy.szu@canonical.com>,
 =?utf-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
 =?utf-8?B?dGl3YWk=?= <tiwai@suse.com>,
 =?utf-8?B?d3Nl?= <wse@tuxedocomputers.com>,
 =?utf-8?B?aHVpLndhbmc=?= <hui.wang@canonical.com>,
 =?utf-8?B?c2FtaQ==?= <sami@loone.fi>, =?utf-8?B?Y2Ft?= <cam@neo-zeon.de>
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

SGkmbmJzcDsgVGFrYXNoaSwNCg0KDQppZiBhZGp1c3RpbmcgdGhlIG1peGVyIGVsZW1lbnQg
b3IgcmVwbHVnZ2luZyB0aGUgaGVhZHNldCwgdGhlIGhlYWRwaG9uZSB3b3VsZCBiZSB1bm11
dGVkLg0KQnV0IG1vc3QgdXNlcnMgaG9wZSB0aGF0IHRoZSBkZWZhdWx0IHN0YXRlIGlzIHVu
bXV0ZWQuDQpTaG91bGQgdGhpcyB1bmNvbmRpdGlvbmFsIHVubXV0ZSBiZSByZXF1aXJlZD8N
Cg0KDQpUaGFua3MuDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tIE9yaWdpbmFsIC0tLS0tLS0t
LS0tLS0tLS0tLQ0KRnJvbTogJm5ic3A7IlRha2FzaGkgSXdhaSI8dGl3YWlAc3VzZS5kZSZn
dDs7DQpEYXRlOiAmbmJzcDtUaHUsIE1hciAxMCwgMjAyMiAxMDowMyBQTQ0KVG86ICZuYnNw
OyLpu4TmlofovokiPGh1YW5nd2VuaHVpYUB1bmlvbnRlY2guY29tJmd0OzsgDQpDYzogJm5i
c3A7InBlcmV4IjxwZXJleEBwZXJleC5jeiZndDs7ICJ0aXdhaSI8dGl3YWlAc3VzZS5jb20m
Z3Q7OyAiamVyZW15LnN6dSI8amVyZW15LnN6dUBjYW5vbmljYWwuY29tJmd0OzsgImh1aS53
YW5nIjxodWkud2FuZ0BjYW5vbmljYWwuY29tJmd0OzsgIndzZSI8d3NlQHR1eGVkb2NvbXB1
dGVycy5jb20mZ3Q7OyAiY2FtIjxjYW1AbmVvLXplb24uZGUmZ3Q7OyAia2FpbGFuZyI8a2Fp
bGFuZ0ByZWFsdGVrLmNvbSZndDs7ICJ0YW51cmVhbCI8dGFudXJlYWxAb3BlbnNvdXJjZS5j
aXJydXMuY29tJmd0OzsgInNhbWkiPHNhbWlAbG9vbmUuZmkmZ3Q7OyAiYWxzYS1kZXZlbCI8
YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnJmd0OzsgImxpbnV4LWtlcm5lbCI8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZyZndDs7IA0KU3ViamVjdDogJm5ic3A7UmU6IFtQQVRD
SF0gQUxTQTogaGRhL3JlYWx0ZWsgLSBGaXggaGVhZHNldCBtaWMgcHJvYmxlbSBmb3IgYSBI
UCBtYWNoaW5lIHdpdGggYWxjNjcxDQoNCiZuYnNwOw0KDQpPbiBUaHUsIDEwIE1hciAyMDIy
IDE0OjU4OjM2ICswMTAwLA0KaHVhbmd3ZW5odWkgd3JvdGU6DQomZ3Q7IA0KJmd0OyBIaSZu
YnNwOyBUYWthc2hpLA0KJmd0OyANCiZndDsgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lg0K
Jmd0OyANCiZndDsgV2hlbiBib290aW5nIHdpdGggcGx1Z2dlZCBoZWFkc2V0LCB0aGUgaGVh
ZHBob25lIHdpbGwgYmUgbXV0ZWQuDQoNClRoZSBtdXRlZCBzdGF0ZSBpcyB0aGUgZGVmYXVs
dCBiZWhhdmlvci4mbmJzcDsgV291bGRuJ3QgaXQgYmUgdW5tdXRlZCBpZg0KeW91IGFkanVz
dCB0aGUgY29ycmVzcG9uZGluZyBtaXhlciBlbGVtZW50Pw0KDQoNClRha2FzaGkNCg0KJmd0
OyANCiZndDsgVGhhbmtzLg0KJmd0OyZuYnNwOyANCiZndDsgLS0tLS0tLS0tLS0tLS0tLS0t
IE9yaWdpbmFsIC0tLS0tLS0tLS0tLS0tLS0tLQ0KJmd0OyBGcm9tOiZuYnNwOyAiVGFrYXNo
aSBJd2FpIjx0aXdhaUBzdXNlLmRlJmd0OzsNCiZndDsgRGF0ZTombmJzcDsgVGh1LCBNYXIg
MTAsIDIwMjIgMDk6MjkgUE0NCiZndDsgVG86Jm5ic3A7ICJodWFuZ3dlbmh1aSI8aHVhbmd3
ZW5odWlhQHVuaW9udGVjaC5jb20mZ3Q7Ow0KJmd0OyBDYzombmJzcDsgInBlcmV4IjxwZXJl
eEBwZXJleC5jeiZndDs7ICJ0aXdhaSI8dGl3YWlAc3VzZS5jb20mZ3Q7OyAiamVyZW15LnN6
dSINCiZndDsgPGplcmVteS5zenVAY2Fub25pY2FsLmNvbSZndDs7ICJodWkud2FuZyI8aHVp
LndhbmdAY2Fub25pY2FsLmNvbSZndDs7ICJ3c2UiDQomZ3Q7IDx3c2VAdHV4ZWRvY29tcHV0
ZXJzLmNvbSZndDs7ICJjYW0iPGNhbUBuZW8temVvbi5kZSZndDs7ICJrYWlsYW5nIg0KJmd0
OyA8a2FpbGFuZ0ByZWFsdGVrLmNvbSZndDs7ICJ0YW51cmVhbCI8dGFudXJlYWxAb3BlbnNv
dXJjZS5jaXJydXMuY29tJmd0OzsgInNhbWkiDQomZ3Q7IDxzYW1pQGxvb25lLmZpJmd0Ozsg
ImFsc2EtZGV2ZWwiPGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZyZndDs7ICJsaW51eC1r
ZXJuZWwiDQomZ3Q7IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnJmd0OzsNCiZndDsg
U3ViamVjdDombmJzcDsgUmU6IFtQQVRDSF0gQUxTQTogaGRhL3JlYWx0ZWsgLSBGaXggaGVh
ZHNldCBtaWMgcHJvYmxlbSBmb3IgYSBIUA0KJmd0OyBtYWNoaW5lIHdpdGggYWxjNjcxDQom
Z3Q7Jm5ic3A7IA0KJmd0OyBPbiBUaHUsIDEwIE1hciAyMDIyIDE0OjAzOjAxICswMTAwLA0K
Jmd0OyBodWFuZ3dlbmh1aSB3cm90ZToNCiZndDsgJmd0Ow0KJmd0OyAmZ3Q7IE9uIGEgSFAg
Mjg4IFBybyBHOCwgdGhlIGZyb250IE1pYyBjb3VsZCBub3QgYmUgZGV0ZWN0ZWQuDQomZ3Q7
ICZndDsNCiZndDsgJmd0OyBTaWduZWQtb2ZmLWJ5OiBodWFuZ3dlbmh1aSA8aHVhbmd3ZW5o
dWlhQHVuaW9udGVjaC5jb20mZ3Q7DQomZ3Q7IA0KJmd0OyBUaGFua3MgZm9yIHRoZSBwYXRj
aC4mbmJzcDsgTW9zdCBvZiB0aGUgY2hhbmdlcyBsb29rIE9LLCBidXQgb25lIHRoaW5nIEkN
CiZndDsgc3RpbGwgZG9uJ3QgZ2V0Og0KJmd0OyANCiZndDsgJmd0OyArIGNhc2UgSERBX0ZJ
WFVQX0FDVF9JTklUOg0KJmd0OyAmZ3Q7ICsgYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAw
eDE5LCAweGEwNTQpOw0KJmd0OyAmZ3Q7ICsgbXNsZWVwKDgwKTsNCiZndDsgJmd0OyArIHNu
ZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwNCiZndDsgJmd0OyArICZuYnNw
OyAmbmJzcDsgQUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9VTk1VVEUpOw0K
Jmd0OyANCiZndDsgV2h5IHRoaXMgdW5jb25kaXRpb25hbCB1bm11dGUgaXMgcmVxdWlyZWQg
Zm9yIGZpeGluZyB0aGUgbWljIHByb2JsZW0/DQomZ3Q7IA0KJmd0OyBUYWthc2hpDQomZ3Q7
IA0KJmd0Ow==
