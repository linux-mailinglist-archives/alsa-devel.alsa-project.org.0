Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EE4D7B27
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19001745;
	Mon, 14 Mar 2022 08:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19001745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241371;
	bh=F6jyeQ+1/BFBvjIn20y3rV5vjod0mDBVTL9NqRdLdgc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TClKtIZWPGfwz7p1Wy7t2/e34PwKXladVLV7M+Ntt017cuSbwmd8kcZtFhjNHPdTA
	 KSz7cgPeaDsrLW4eZNwHIWMuu1d3IaZ4wRnK/RRqRTGtnMMxqx5i9gVU5XVQ7bjHXH
	 TStCh2i9xAHkqO9SJXMcRC9Dlf0TuBiGzRDh46hE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADD3F80543;
	Mon, 14 Mar 2022 07:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAD86F80227; Fri, 11 Mar 2022 09:51:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 HTML_MESSAGE,HTML_NONELEMENT_30_40,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A7B7F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 09:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A7B7F8012C
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: CR3LFp2JE4lFYkJgjwvqUZAgoXXizvRldlbwb47Ecn40QvALF+Qvt02X2c3Lm
 3r6EhoPgyGitykrwnSQFDIBlZBPZNbl77/DnmYS7gLNOGOAxngb0edqA4PbfFm4n9URVCYZ
 9U8HiLorJJeYpY3BCXA6lL79EhkZI8Y2/r92u71RtT2X0WbFiamLZKwFZg9QzUwZXJ8zYdF
 Y5Ld5N3qIZxtGo8BdrLri0F4bRFrCtq65dAK5S3gV+dPVZGoCi9XB6p68JNtprZAiwfb8+F
 OZnoeLio0k8AEjznTkEoMuVj+US2mlxuOXJWuaxL96xCSWeWty0EFQEjVtdIGapbJyxIIjJ
 baXtlgrDRsaFQHLIeYHzTr7RWohB4oWa8O8IEIK2dfDMWIOWXX/J/Czst6iZCIS3LVWyrm6
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 113.57.13.187
X-QQ-STYLE: 
X-QQ-mid: logic634t1646988698t3509776
From: "=?utf-8?B?aHVhbmd3ZW5odWk=?=" <huangwenhuia@uniontech.com>
To: "=?utf-8?B?VGFrYXNoaSBJd2Fp?=" <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek - Fix headset mic problem for a HP
 machine with alc671
Mime-Version: 1.0
Date: Fri, 11 Mar 2022 16:51:38 +0800
X-Priority: 3
Message-ID: <tencent_1FFDCEAB776DE8D712987685@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_080B040F1CE2D7D83D6FD0C8@qq.com>
 <s5ho82cevra.wl-tiwai@suse.de>
In-Reply-To: <s5ho82cevra.wl-tiwai@suse.de>
X-QQ-ReplyHash: 2573382394
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 11 Mar 2022 16:51:39 +0800 (CST)
Feedback-ID: logic:uniontech.com:qybgforeign:qybgforeign7
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

SSB3aWxsIG1vZGlmeSB0aGUgcGF0Y2ggYW5kIGNvbW1pdCBhZ2Fpbi4NCg0KDQpUaGFua3Mu
DQombmJzcDsNCiZuYnNwOw0KLS0tLS0tLS0tLS0tLS0tLS0tJm5ic3A7T3JpZ2luYWwmbmJz
cDstLS0tLS0tLS0tLS0tLS0tLS0NCkZyb206ICZuYnNwOyJUYWthc2hpJm5ic3A7SXdhaSI8
dGl3YWlAc3VzZS5kZSZndDs7DQpEYXRlOiAmbmJzcDtGcmksIE1hciAxMSwgMjAyMiAwNDoz
MCBQTQ0KVG86ICZuYnNwOyJodWFuZ3dlbmh1aSI8aHVhbmd3ZW5odWlhQHVuaW9udGVjaC5j
b20mZ3Q7OyANCkNjOiAmbmJzcDsicGVyZXgiPHBlcmV4QHBlcmV4LmN6Jmd0OzsgInRpd2Fp
Ijx0aXdhaUBzdXNlLmNvbSZndDs7ICJqZXJlbXkuc3p1IjxqZXJlbXkuc3p1QGNhbm9uaWNh
bC5jb20mZ3Q7OyAiaHVpLndhbmciPGh1aS53YW5nQGNhbm9uaWNhbC5jb20mZ3Q7OyAid3Nl
Ijx3c2VAdHV4ZWRvY29tcHV0ZXJzLmNvbSZndDs7ICJjYW0iPGNhbUBuZW8temVvbi5kZSZn
dDs7ICJrYWlsYW5nIjxrYWlsYW5nQHJlYWx0ZWsuY29tJmd0OzsgInRhbnVyZWFsIjx0YW51
cmVhbEBvcGVuc291cmNlLmNpcnJ1cy5jb20mZ3Q7OyAic2FtaSI8c2FtaUBsb29uZS5maSZn
dDs7ICJhbHNhLWRldmVsIjxhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcmZ3Q7OyAibGlu
dXgta2VybmVsIjxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnJmd0OzsgDQpTdWJqZWN0
OiAmbmJzcDtSZTogW1BBVENIXSBBTFNBOiBoZGEvcmVhbHRlayAtIEZpeCBoZWFkc2V0IG1p
YyBwcm9ibGVtIGZvciBhIEhQIG1hY2hpbmUgd2l0aCBhbGM2NzENCg0KJm5ic3A7DQoNCk9u
IEZyaSwgMTEgTWFyIDIwMjIgMDI6MjA6NDIgKzAxMDAsDQpodWFuZ3dlbmh1aSB3cm90ZToN
CiZndDsgDQomZ3Q7IEhpJm5ic3A7IFRha2FzaGksDQomZ3Q7IA0KJmd0OyBpZiBhZGp1c3Rp
bmcgdGhlIG1peGVyIGVsZW1lbnQgb3IgcmVwbHVnZ2luZyB0aGUgaGVhZHNldCwgdGhlIGhl
YWRwaG9uZSB3b3VsZA0KJmd0OyBiZSB1bm11dGVkLg0KJmd0OyBCdXQgbW9zdCB1c2VycyBo
b3BlIHRoYXQgdGhlIGRlZmF1bHQgc3RhdGUgaXMgdW5tdXRlZC4NCiZndDsgU2hvdWxkIHRo
aXMgdW5jb25kaXRpb25hbCB1bm11dGUgYmUgcmVxdWlyZWQ/DQoNCkl0J3MgdGhlIHN0YW5k
YXJkIGJlaGF2aW9yIGZvciBtb3N0IG9mIEFMU0EgZHJpdmVycy4NCg0KVGhlIGluaXRpYWwg
bXV0ZSBzdGF0ZSBpcyByYXRoZXIgY29udHJvbGxlZCB2aWEgYWxzYWN0bCwgcmVzdG9yaW5n
IHRoZQ0KcHJldmlvdXMgc3RhdGUuJm5ic3A7IEFsc28sIHRoZSBzb3VuZCBzZXJ2ZXIgbGlr
ZSBQdWxzZUF1ZGlvIG9yIHBpcGV3aXJlDQpkb2VzIHVubXV0ZSBhdXRvbWF0aWNhbGx5LiZu
YnNwOyBJZiB0aGlzIGRvZXNuJ3Qgd29yayBhcyBleHBlY3RlZCwgdGhhdCdzIGENCm1vcmUg
cHJvYmxlbSB0byBkaWFnbm9zZS4NCg0KDQpUYWthc2hpDQoNCiZndDsgDQomZ3Q7IFRoYW5r
cy4NCiZndDsgDQomZ3Q7IC0tLS0tLS0tLS0tLS0tLS0tLSBPcmlnaW5hbCAtLS0tLS0tLS0t
LS0tLS0tLS0NCiZndDsgRnJvbTombmJzcDsgIlRha2FzaGkgSXdhaSI8dGl3YWlAc3VzZS5k
ZSZndDs7DQomZ3Q7IERhdGU6Jm5ic3A7IFRodSwgTWFyIDEwLCAyMDIyIDEwOjAzIFBNDQom
Z3Q7IFRvOiZuYnNwOyAiaHVhbmd3ZW5odWkiPGh1YW5nd2VuaHVpYUB1bmlvbnRlY2guY29t
Jmd0OzsNCiZndDsgQ2M6Jm5ic3A7ICJwZXJleCI8cGVyZXhAcGVyZXguY3omZ3Q7OyAidGl3
YWkiPHRpd2FpQHN1c2UuY29tJmd0OzsgImplcmVteS5zenUiDQomZ3Q7IDxqZXJlbXkuc3p1
QGNhbm9uaWNhbC5jb20mZ3Q7OyAiaHVpLndhbmciPGh1aS53YW5nQGNhbm9uaWNhbC5jb20m
Z3Q7OyAid3NlIg0KJmd0OyA8d3NlQHR1eGVkb2NvbXB1dGVycy5jb20mZ3Q7OyAiY2FtIjxj
YW1AbmVvLXplb24uZGUmZ3Q7OyAia2FpbGFuZyINCiZndDsgPGthaWxhbmdAcmVhbHRlay5j
b20mZ3Q7OyAidGFudXJlYWwiPHRhbnVyZWFsQG9wZW5zb3VyY2UuY2lycnVzLmNvbSZndDs7
ICJzYW1pIg0KJmd0OyA8c2FtaUBsb29uZS5maSZndDs7ICJhbHNhLWRldmVsIjxhbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcmZ3Q7OyAibGludXgta2VybmVsIg0KJmd0OyA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZyZndDs7DQomZ3Q7IFN1YmplY3Q6Jm5ic3A7IFJlOiBb
UEFUQ0hdIEFMU0E6IGhkYS9yZWFsdGVrIC0gRml4IGhlYWRzZXQgbWljIHByb2JsZW0gZm9y
IGEgSFANCiZndDsgbWFjaGluZSB3aXRoIGFsYzY3MQ0KJmd0OyZuYnNwOyANCiZndDsgT24g
VGh1LCAxMCBNYXIgMjAyMiAxNDo1ODozNiArMDEwMCwNCiZndDsgaHVhbmd3ZW5odWkgd3Jv
dGU6DQomZ3Q7ICZndDsNCiZndDsgJmd0OyBIaSZuYnNwOyBUYWthc2hpLA0KJmd0OyAmZ3Q7
DQomZ3Q7ICZndDsgVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lg0KJmd0OyAmZ3Q7DQomZ3Q7
ICZndDsgV2hlbiBib290aW5nIHdpdGggcGx1Z2dlZCBoZWFkc2V0LCB0aGUgaGVhZHBob25l
IHdpbGwgYmUgbXV0ZWQuDQomZ3Q7IA0KJmd0OyBUaGUgbXV0ZWQgc3RhdGUgaXMgdGhlIGRl
ZmF1bHQgYmVoYXZpb3IuJm5ic3A7IFdvdWxkbid0IGl0IGJlIHVubXV0ZWQgaWYNCiZndDsg
eW91IGFkanVzdCB0aGUgY29ycmVzcG9uZGluZyBtaXhlciBlbGVtZW50Pw0KJmd0OyANCiZn
dDsgVGFrYXNoaQ0KJmd0OyANCiZndDsgJmd0Ow0KJmd0OyAmZ3Q7IFRoYW5rcy4NCiZndDsg
Jmd0OyANCiZndDsgJmd0OyAtLS0tLS0tLS0tLS0tLS0tLS0gT3JpZ2luYWwgLS0tLS0tLS0t
LS0tLS0tLS0tDQomZ3Q7ICZndDsgRnJvbTombmJzcDsgIlRha2FzaGkgSXdhaSI8dGl3YWlA
c3VzZS5kZSZndDs7DQomZ3Q7ICZndDsgRGF0ZTombmJzcDsgVGh1LCBNYXIgMTAsIDIwMjIg
MDk6MjkgUE0NCiZndDsgJmd0OyBUbzombmJzcDsgImh1YW5nd2VuaHVpIjxodWFuZ3dlbmh1
aWFAdW5pb250ZWNoLmNvbSZndDs7DQomZ3Q7ICZndDsgQ2M6Jm5ic3A7ICJwZXJleCI8cGVy
ZXhAcGVyZXguY3omZ3Q7OyAidGl3YWkiPHRpd2FpQHN1c2UuY29tJmd0OzsgImplcmVteS5z
enUiDQomZ3Q7ICZndDsgPGplcmVteS5zenVAY2Fub25pY2FsLmNvbSZndDs7ICJodWkud2Fu
ZyI8aHVpLndhbmdAY2Fub25pY2FsLmNvbSZndDs7ICJ3c2UiDQomZ3Q7ICZndDsgPHdzZUB0
dXhlZG9jb21wdXRlcnMuY29tJmd0OzsgImNhbSI8Y2FtQG5lby16ZW9uLmRlJmd0OzsgImth
aWxhbmciDQomZ3Q7ICZndDsgPGthaWxhbmdAcmVhbHRlay5jb20mZ3Q7OyAidGFudXJlYWwi
PHRhbnVyZWFsQG9wZW5zb3VyY2UuY2lycnVzLmNvbSZndDs7ICJzYW1pIg0KJmd0OyAmZ3Q7
IDxzYW1pQGxvb25lLmZpJmd0OzsgImFsc2EtZGV2ZWwiPGFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZyZndDs7ICJsaW51eC1rZXJuZWwiDQomZ3Q7ICZndDsgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcmZ3Q7Ow0KJmd0OyAmZ3Q7IFN1YmplY3Q6Jm5ic3A7IFJlOiBbUEFU
Q0hdIEFMU0E6IGhkYS9yZWFsdGVrIC0gRml4IGhlYWRzZXQgbWljIHByb2JsZW0gZm9yIGEg
SFANCiZndDsgJmd0OyBtYWNoaW5lIHdpdGggYWxjNjcxDQomZ3Q7ICZndDsgDQomZ3Q7ICZn
dDsgT24gVGh1LCAxMCBNYXIgMjAyMiAxNDowMzowMSArMDEwMCwNCiZndDsgJmd0OyBodWFu
Z3dlbmh1aSB3cm90ZToNCiZndDsgJmd0OyAmZ3Q7DQomZ3Q7ICZndDsgJmd0OyBPbiBhIEhQ
IDI4OCBQcm8gRzgsIHRoZSBmcm9udCBNaWMgY291bGQgbm90IGJlIGRldGVjdGVkLg0KJmd0
OyAmZ3Q7ICZndDsNCiZndDsgJmd0OyAmZ3Q7IFNpZ25lZC1vZmYtYnk6IGh1YW5nd2VuaHVp
IDxodWFuZ3dlbmh1aWFAdW5pb250ZWNoLmNvbSZndDsNCiZndDsgJmd0Ow0KJmd0OyAmZ3Q7
IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiZuYnNwOyBNb3N0IG9mIHRoZSBjaGFuZ2VzIGxvb2sg
T0ssIGJ1dCBvbmUgdGhpbmcgSQ0KJmd0OyAmZ3Q7IHN0aWxsIGRvbid0IGdldDoNCiZndDsg
Jmd0Ow0KJmd0OyAmZ3Q7ICZndDsgKyBjYXNlIEhEQV9GSVhVUF9BQ1RfSU5JVDoNCiZndDsg
Jmd0OyAmZ3Q7ICsgYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAweDE5LCAweGEwNTQpOw0K
Jmd0OyAmZ3Q7ICZndDsgKyBtc2xlZXAoODApOw0KJmd0OyAmZ3Q7ICZndDsgKyBzbmRfaGRh
X2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsDQomZ3Q7ICZndDsgJmd0OyArJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRf
VU5NVVRFKTsNCiZndDsgJmd0Ow0KJmd0OyAmZ3Q7IFdoeSB0aGlzIHVuY29uZGl0aW9uYWwg
dW5tdXRlIGlzIHJlcXVpcmVkIGZvciBmaXhpbmcgdGhlIG1pYyBwcm9ibGVtPw0KJmd0OyAm
Z3Q7DQomZ3Q7ICZndDsgVGFrYXNoaQ0KJmd0OyAmZ3Q7DQomZ3Q7ICZndDsNCiZndDsgDQom
Z3Q7
