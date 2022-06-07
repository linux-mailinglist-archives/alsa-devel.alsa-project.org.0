Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FE53F9E2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 11:34:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9FD61929;
	Tue,  7 Jun 2022 11:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9FD61929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654594461;
	bh=TTNWsWKh6Z6I90mTX/HuWDWrniZEzlt+dUcrU/sH1E8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIte5f3Ip42PA7M19sIgz9+qlLVs1QelpwvUZ8T8CPEol108BrAKoG6P2feXVrbNh
	 xdKxG271Wg3enx8Da52fyEywcBitR+J40vFwa52L0XQ/WRHdiFInN/FmfoPYevBP8y
	 LNAchlxdI1lB2KVzhgMPKcNuPaz7Ten2hcTT6Odg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 222FFF80109;
	Tue,  7 Jun 2022 11:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8FCFF80109; Tue,  7 Jun 2022 11:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,HTML_NONELEMENT_30_40,KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from qq.com (smtpbg468.qq.com [59.36.132.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F92F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 11:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F92F80109
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: aBJFcW+uBGZNbF1TO0Kgm0v6+1v4Kap+F98wUr+Gshow51/tSzfYbgKpX43rB
 qi17w2aK4yxCMwLSoaj3PIvl8Sl65AInpVE0lUVcFHuVJ/9zuXifIm01rGh0kfMYYF/FvcS
 SkK0FETC/q+CNLDxqRNDq4fDmIVfVIHl/8PGWUi3s1LDMChSJ/FNUGHKWc8tPwjQDI+Rwrp
 oOCecbrqhdsMXUGtsh1LVJAg1W06SHrd3wiQNBCF85LzZhTflS9G6RIDGnw0biHF5VHr7BI
 EkU3H+jaugC72gXt5xdwk/ofQD8UihXTM9yUK/b+oUjZbfC88xKLFIbKtxjkExDgiU3wk/r
 qTIDqDQPT5RLdLlUyxN7wpXQrJQp1hMpbLv8BjvjgzeP0XlMMXIR6FmoBAR5t5rFmq/UqSz
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 113.57.13.187
X-QQ-STYLE: 
X-QQ-mid: logic634t1654594356t4953297
From: "=?utf-8?B?aHVhbmd3ZW5odWk=?=" <huangwenhuia@uniontech.com>
To: "=?utf-8?B?VGFrYXNoaSBJd2Fp?=" <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek - Add HW8326 support
Mime-Version: 1.0
Date: Tue, 7 Jun 2022 17:32:35 +0800
X-Priority: 3
Message-ID: <tencent_18B4BD6850E70A3E57204B05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20220607084109.29120-1-huangwenhuia@uniontech.com>
 <87h74won52.wl-tiwai@suse.de>
In-Reply-To: <87h74won52.wl-tiwai@suse.de>
X-QQ-ReplyHash: 682223303
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 07 Jun 2022 17:32:37 +0800 (CST)
Feedback-ID: logic:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
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

VGhlIGNvZGVjJm5ic3A7IEhXODMyNiBpcyBhIGNvbXBhdGlibGUgY2hpcCB3aXRoIEFMQzI1
Ni4NCkl0IGlzIGRldmVsb3BlZCBieSBIdWF3ZWkgdmlhIENQTEQgd2l0aCBSZWFsdGVrJ3Mg
Y29kZWMgSVAuDQoNCg0KVGhhbmtzLg0KJm5ic3A7DQotLS0tLS0tLS0tLS0tLS0tLS0mbmJz
cDtPcmlnaW5hbCZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLQ0KRnJvbTogJm5ic3A7IlRha2Fz
aGkmbmJzcDtJd2FpIjx0aXdhaUBzdXNlLmRlJmd0OzsNCkRhdGU6ICZuYnNwO1R1ZSwgSnVu
IDcsIDIwMjIgMDU6MDkgUE0NClRvOiAmbmJzcDsiaHVhbmd3ZW5odWkiPGh1YW5nd2VuaHVp
YUB1bmlvbnRlY2guY29tJmd0OzsgDQpDYzogJm5ic3A7InBlcmV4IjxwZXJleEBwZXJleC5j
eiZndDs7ICJ0aXdhaSI8dGl3YWlAc3VzZS5jb20mZ3Q7OyAiYWxzYS1kZXZlbCI8YWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnJmd0OzsgImthaWxhbmciPGthaWxhbmdAcmVhbHRlay5j
b20mZ3Q7OyAidGFudXJlYWwiPHRhbnVyZWFsQG9wZW5zb3VyY2UuY2lycnVzLmNvbSZndDs7
ICJqZXJlbXkuc3p1IjxqZXJlbXkuc3p1QGNhbm9uaWNhbC5jb20mZ3Q7OyAibGludXgta2Vy
bmVsIjxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnJmd0OzsgIndzZSI8d3NlQHR1eGVk
b2NvbXB1dGVycy5jb20mZ3Q7OyAiaHVpLndhbmciPGh1aS53YW5nQGNhbm9uaWNhbC5jb20m
Z3Q7OyAic2FtaSI8c2FtaUBsb29uZS5maSZndDs7ICJjYW0iPGNhbUBuZW8temVvbi5kZSZn
dDs7IA0KU3ViamVjdDogJm5ic3A7UmU6IFtQQVRDSF0gQUxTQTogaGRhL3JlYWx0ZWsgLSBB
ZGQgSFc4MzI2IHN1cHBvcnQNCg0KJm5ic3A7DQoNCk9uIFR1ZSwgMDcgSnVuIDIwMjIgMTA6
NDE6MDkgKzAyMDAsDQpodWFuZ3dlbmh1aSB3cm90ZToNCiZndDsgDQomZ3Q7IEFkZGVkIHRo
ZSBzdXBwb3J0IG9mIG5ldyBIdWF3ZWkgY29kZWMgSFc4MzI2Lg0KJmd0OyANCg0KSXQnZCBi
ZSBhcHByZWNpYXRlZCBpZiB5b3UgZGVzY3JpYmUgYWJvdXQgdGhlIGhhcmR3YXJlIGEgYml0
IG1vcmUuDQpJdCBsb29rcyBsaWtlIGEgY29tcGF0aWJsZSBjaGlwIHdpdGggc29tZSBvdGhl
ciBSZWFsdGVrIGNvZGVjcw0KKEFMQzI1Nj8pLg0KDQomZ3Q7IEBAIC0xMTQ3OSw2ICsxMTQ5
Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2RldmljZV9pZCBzbmRfaGRhX2lkX3Jl
YWx0ZWtbXSA9IHsNCiZndDsmbmJzcDsgCUhEQV9DT0RFQ19FTlRSWSgweDEwZWMwMjM2LCAi
QUxDMjM2IiwgcGF0Y2hfYWxjMjY5KSwNCiZndDsmbmJzcDsgCUhEQV9DT0RFQ19FTlRSWSgw
eDEwZWMwMjQ1LCAiQUxDMjQ1IiwgcGF0Y2hfYWxjMjY5KSwNCiZndDsmbmJzcDsgCUhEQV9D
T0RFQ19FTlRSWSgweDEwZWMwMjU1LCAiQUxDMjU1IiwgcGF0Y2hfYWxjMjY5KSwNCiZndDsg
KwlIREFfQ09ERUNfRU5UUlkoMHgxOWU1ODMyNiwgIkhXODMyNiIsIHBhdGNoX2FsYzI2OSks
DQomZ3Q7Jm5ic3A7IAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDI1NiwgIkFMQzI1NiIsIHBh
dGNoX2FsYzI2OSksDQomZ3Q7Jm5ic3A7IAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDI1Nywg
IkFMQzI1NyIsIHBhdGNoX2FsYzI2OSksDQomZ3Q7Jm5ic3A7IAlIREFfQ09ERUNfRU5UUlko
MHgxMGVjMDI2MCwgIkFMQzI2MCIsIHBhdGNoX2FsYzI2MCksDQoNClRoaXMgdGFibGUgaXMg
c29ydGVkIGluIHRoZSBjb2RlYyBJRCBvcmRlci4mbmJzcDsgUGxlYXNlIHB1dCBhdCB0aGUN
CmFwcHJvcHJpYXRlIHBsYWNlIChhdCB0aGUgbGFzdCksIGluc3RlYWQuDQoNCg0KdGhhbmtz
LA0KDQpUYWthc2hp
