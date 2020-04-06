Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489F19F2DB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 11:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691F81662;
	Mon,  6 Apr 2020 11:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691F81662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586166368;
	bh=2a3UrR0vvKbfCVyVukYQyK/7BqGP/1N0NHAtHA/piFE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbfuIMHIDUguaOW93n0Mkn5TYzOuLoyCKJc3JzzZfhAX252PMIFPaf4Yd1nYlOVA5
	 ua0BiGisslu0U9o3AXO/qoWrb4yoEIXEBgj73yjtjTZ6sOhMI2DJNKzYS/DpwQ840u
	 egznFgqz7X5jif14R0ilVEQbWxAMpz07lRSAxIPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84C3EF80150;
	Mon,  6 Apr 2020 11:44:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF623F80143; Mon,  6 Apr 2020 11:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 394EBF800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 11:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394EBF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="PUSP/zZS"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0369gowF031596; Mon, 6 Apr 2020 11:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2a3UrR0vvKbfCVyVukYQyK/7BqGP/1N0NHAtHA/piFE=;
 b=PUSP/zZS8e/q90fhP5DzpLOfRx8kh8mju3tyakiTGOgw4uFUJtWZJBdjVLPSKMIcZTdV
 KHjZEbpwdD96F3obw1oICbJgV+PkGT7HkP5iTSZbdNoZEUJDSjZnfYd7veE+D+iNZRR8
 uKuwFooa+ZRuhf57Co/midAgESknOjMaiX2zCcxrzKR4k45ngo+CR24gn3T6KIQHcCJq
 tXfsrjdFWnZc+Oq4lqZjAGUe3qtOYCuW7vWyE4uY/1i4uy2pJ+XA69nkbMdN0nYE8+6B
 N7K0bSlzNNYr/ATG5C1mrs84dKRgHb+en12wupcx6D9KOZ163GrHTSjTQ8xAsvs/gYcy qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306g0w13j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 11:44:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B83CC100034;
 Mon,  6 Apr 2020 11:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DDD92B1868;
 Mon,  6 Apr 2020 11:44:13 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Apr
 2020 11:44:12 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Mon, 6 Apr 2020 11:44:13 +0200
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] ASoC: stm32: sai: Add missing cleanup
Thread-Topic: [PATCH] ASoC: stm32: sai: Add missing cleanup
Thread-Index: AQHWC2DSIRg6JhgxIEC65JTRjgXANKhrt4mA
Date: Mon, 6 Apr 2020 09:44:13 +0000
Message-ID: <1df96e7b-89fa-7822-1a57-b9a87e8388c0@st.com>
References: <1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A296B775786CD642978E621365BD0C9A@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_05:2020-04-03,
 2020-04-06 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

DQpPbiA0LzUvMjAgNTowMyBQTSwgSnVsaWEgTGF3YWxsIHdyb3RlOg0KPiBUaGUgY29tbWl0IDBk
NmRlZmM3ZTBlNCAoIkFTb0M6IHN0bTMyOiBzYWk6IG1hbmFnZSByZWJpbmQgaXNzdWUiKQ0KPiBj
b252ZXJ0cyBzb21lIGZ1bmN0aW9uIGNhbGxzIHRvIHRoZWlyIG5vbi1kZXZtIGVxdWl2YWxlbnRz
LiAgVGhlDQo+IGFwcHJvcHJpYXRlIGNsZWFudXAgY29kZSB3YXMgYWRkZWQgdG8gdGhlIHJlbW92
ZSBmdW5jdGlvbiwgYnV0IG5vdA0KPiB0byB0aGUgcHJvYmUgZnVuY3Rpb24uICBBZGQgYSBjYWxs
IHRvIHNuZF9kbWFlbmdpbmVfcGNtX3VucmVnaXN0ZXINCj4gdG8gY29tcGVuc2F0ZSBmb3IgdGhl
IGNhbGwgdG8gc25kX2RtYWVuZ2luZV9wY21fcmVnaXN0ZXIgaW4gY2FzZQ0KPiBvZiBzdWJzZXF1
ZW50IGZhaWx1cmUuDQo+DQo+IEZpeGVzOiBjb21taXQgMGQ2ZGVmYzdlMGU0ICgiQVNvQzogc3Rt
MzI6IHNhaTogbWFuYWdlIHJlYmluZCBpc3N1ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhIExh
d2FsbCA8SnVsaWEuTGF3YWxsQGlucmlhLmZyPg0KPg0KPiAtLS0NCj4NCj4gTm90IHRlc3RlZC4N
Cj4NCj4gICBzb3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9zdWIuYyB8ICAgIDQgKysrLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCkhpIEp1bGlhLA0K
VGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCkFja2VkLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmll
ci5tb3lzYW5Ac3QuY29tPg0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3N0bS9zdG0zMl9z
YWlfc3ViLmMgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9zdWIuYw0KPiBpbmRleCAyYmQyODBj
Li4wZDBjOWFmIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9zdWIuYw0K
PiArKysgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX3NhaV9zdWIuYw0KPiBAQCAtMTU1Niw4ICsxNTU2
LDEwIEBAIHN0YXRpYyBpbnQgc3RtMzJfc2FpX3N1Yl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgIA0KPiAgIAlyZXQgPSBzbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCgm
cGRldi0+ZGV2LCAmc3RtMzJfY29tcG9uZW50LA0KPiAgIAkJCQkJICZzYWktPmNwdV9kYWlfZHJ2
LCAxKTsNCj4gLQlpZiAocmV0KQ0KPiArCWlmIChyZXQpIHsNCj4gKwkJc25kX2RtYWVuZ2luZV9w
Y21fdW5yZWdpc3RlcigmcGRldi0+ZGV2KTsNCj4gICAJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiAg
IA0KPiAgIAlpZiAoU1RNX1NBSV9QUk9UT0NPTF9JU19TUERJRihzYWkpKQ0KPiAgIAkJY29uZiA9
ICZzdG0zMl9zYWlfcGNtX2NvbmZpZ19zcGRpZjsNCj4NCg==
