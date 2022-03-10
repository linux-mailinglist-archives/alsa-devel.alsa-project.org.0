Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E04D7B24
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:02:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8F2916F2;
	Mon, 14 Mar 2022 08:01:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8F2916F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241338;
	bh=JoWJ+VZjFP0p1tjf+PQ8sEJgAu1IJt2vG6WsuzRznH4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gs7qZKdoCOXIUYqIo1ZuZDxcVA9aBuuuSQ/rhOpWKOHxLVeTs1c9UzZ+nNsG9Yyv3
	 bnir6a4lZONPiKZ+i4ZTgt7SnKmr9VMRx5pSHMsOUGLhen1caR5lbipxk7xlpup415
	 tOwmai315Tq5yq6+NIVyLxMwWwgFQU228Lu3UpJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AEDDF80535;
	Mon, 14 Mar 2022 07:59:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8467BF8012F; Thu, 10 Mar 2022 14:58:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HTML_MESSAGE,
 HTML_NONELEMENT_30_40,KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpproxy21.qq.com (smtpbg703.qq.com [203.205.195.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD6FF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD6FF800D2
X-QQ-GoodBg: 1
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: aBJFcW+uBGZtMdU2jXYo9GYv2zfrGyi3uhCVd4og/Dx+C7sjh3iSrQ7b3Imn2
 7y3nJM9PIyeoFGNESKUnFPAHZfbwYvHr5bmj+aNAYSqXTXjcOvhC5OX3MqR3kQ/FMHw4/lS
 dfD3YYOV1cHLot9y+5o4jB8qiKf8sgeEJCvF1oVEbpIImYcjo/eIgMy4wCX2Fw0b9Ce962P
 x6XZTEc2XVxHrnTDfg1ywTvtxGpB51yxedMznkuq4RWkqiim1+BJ+AdQrlq4dizpzFG3ZDR
 AiU5NZdWxUFAbSSvlJrHkZz4Wna6SvHZc0fQkUJiStKOeirSoo62K4cXkU8C8mEoIjyx5Cc
 lo4KScVvdX/svZgm3AKu0wJksmyZZyA2p9/LYzB8TuzlTJO37eHGEdyiV8hdi2QxUJvJMXH
 EBmKhixI4324gwVcaAA3Pw==
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 113.57.13.187
X-QQ-STYLE: 
X-QQ-mid: logic634t1646920716t9276204
From: "=?utf-8?B?6buE5paH6L6J?=" <huangwenhuia@uniontech.com>
To: "=?utf-8?B?VGFrYXNoaSBJd2Fp?=" <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek - Fix headset mic problem for a HP
 machine with alc671
Mime-Version: 1.0
Date: Thu, 10 Mar 2022 21:58:36 +0800
X-Priority: 3
Message-ID: <tencent_0D06988048F675F173385A1F@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20220310130301.22827-1-huangwenhuia@uniontech.com>
 <s5hilsmey0h.wl-tiwai@suse.de>
In-Reply-To: <s5hilsmey0h.wl-tiwai@suse.de>
X-QQ-ReplyHash: 3440138445
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 10 Mar 2022 21:58:37 +0800 (CST)
Feedback-ID: logic:uniontech.com:qybgforeign:qybgforeign2
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

SGkmbmJzcDsgVGFrYXNoaSwNCg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCg0K
V2hlbiBib290aW5nIHdpdGggcGx1Z2dlZCBoZWFkc2V0LCB0aGUgaGVhZHBob25lIHdpbGwg
YmUgbXV0ZWQuDQoNCg0KVGhhbmtzLg0KJm5ic3A7DQotLS0tLS0tLS0tLS0tLS0tLS0mbmJz
cDtPcmlnaW5hbCZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLQ0KRnJvbTogJm5ic3A7IlRha2Fz
aGkmbmJzcDtJd2FpIjx0aXdhaUBzdXNlLmRlJmd0OzsNCkRhdGU6ICZuYnNwO1RodSwgTWFy
IDEwLCAyMDIyIDA5OjI5IFBNDQpUbzogJm5ic3A7Imh1YW5nd2VuaHVpIjxodWFuZ3dlbmh1
aWFAdW5pb250ZWNoLmNvbSZndDs7IA0KQ2M6ICZuYnNwOyJwZXJleCI8cGVyZXhAcGVyZXgu
Y3omZ3Q7OyAidGl3YWkiPHRpd2FpQHN1c2UuY29tJmd0OzsgImplcmVteS5zenUiPGplcmVt
eS5zenVAY2Fub25pY2FsLmNvbSZndDs7ICJodWkud2FuZyI8aHVpLndhbmdAY2Fub25pY2Fs
LmNvbSZndDs7ICJ3c2UiPHdzZUB0dXhlZG9jb21wdXRlcnMuY29tJmd0OzsgImNhbSI8Y2Ft
QG5lby16ZW9uLmRlJmd0OzsgImthaWxhbmciPGthaWxhbmdAcmVhbHRlay5jb20mZ3Q7OyAi
dGFudXJlYWwiPHRhbnVyZWFsQG9wZW5zb3VyY2UuY2lycnVzLmNvbSZndDs7ICJzYW1pIjxz
YW1pQGxvb25lLmZpJmd0OzsgImFsc2EtZGV2ZWwiPGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZyZndDs7ICJsaW51eC1rZXJuZWwiPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcm
Z3Q7OyANClN1YmplY3Q6ICZuYnNwO1JlOiBbUEFUQ0hdIEFMU0E6IGhkYS9yZWFsdGVrIC0g
Rml4IGhlYWRzZXQgbWljIHByb2JsZW0gZm9yIGEgSFAgbWFjaGluZSB3aXRoIGFsYzY3MQ0K
DQombmJzcDsNCg0KT24gVGh1LCAxMCBNYXIgMjAyMiAxNDowMzowMSArMDEwMCwNCmh1YW5n
d2VuaHVpIHdyb3RlOg0KJmd0OyANCiZndDsgT24gYSBIUCAyODggUHJvIEc4LCB0aGUgZnJv
bnQgTWljIGNvdWxkIG5vdCBiZSBkZXRlY3RlZC4NCiZndDsgDQomZ3Q7IFNpZ25lZC1vZmYt
Ynk6IGh1YW5nd2VuaHVpIDxodWFuZ3dlbmh1aWFAdW5pb250ZWNoLmNvbSZndDsNCg0KVGhh
bmtzIGZvciB0aGUgcGF0Y2guJm5ic3A7IE1vc3Qgb2YgdGhlIGNoYW5nZXMgbG9vayBPSywg
YnV0IG9uZSB0aGluZyBJDQpzdGlsbCBkb24ndCBnZXQ6DQoNCiZndDsgKwljYXNlIEhEQV9G
SVhVUF9BQ1RfSU5JVDoNCiZndDsgKwkJYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAweDE5
LCAweGEwNTQpOw0KJmd0OyArCQltc2xlZXAoODApOw0KJmd0OyArCQlzbmRfaGRhX2NvZGVj
X3dyaXRlKGNvZGVjLCBocF9waW4sIDAsDQomZ3Q7ICsJCQkmbmJzcDsmbmJzcDsmbmJzcDsg
QUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9VTk1VVEUpOw0KDQpXaHkgdGhp
cyB1bmNvbmRpdGlvbmFsIHVubXV0ZSBpcyByZXF1aXJlZCBmb3IgZml4aW5nIHRoZSBtaWMg
cHJvYmxlbT8NCg0KDQpUYWthc2hp
