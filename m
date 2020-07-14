Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E597221D32
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D6D1672;
	Thu, 16 Jul 2020 09:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D6D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884039;
	bh=CLS/Og7nifP2D67rD/LG5tpGS6CRJVjCR0tLyiXcTr8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UMkCI6WEHelIn1Sf9Zoep3yHmqqSogNZXR4YwLuy8kf9GdMqcGIr81xJkkAef/yW3
	 QGxyeprhDJSPhl/+16MdPGvctkajMqwY2Pqm5e+ygKB23qxzofP/OXwR5B2Ofj36xg
	 OQqA4fsAs+T/NNh3wVPZ8pLlyEMbDE9SaQUE+/CY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BDAF8027B;
	Thu, 16 Jul 2020 09:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F0F4F8019B; Tue, 14 Jul 2020 16:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HTML_MESSAGE,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 943BAF800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 16:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 943BAF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com
 header.b="Z0DoxgkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1594737039;
 bh=TF3M1tT9BsAcoNIDNEOmjnPZV/nYIQIuLYQ+4rrTU+0=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=Z0DoxgkNlnI0q2N2orcdp2SQ03X/HTbDsRQAObP9UrEXZrOEmD9SHXpbyyzIoZmD5
 /IdD7kaKsEdeIpi3hpGGbAArEFhNzi2z1UhiLduZXdnbrFhPCsJh5OgBTCYW4M9XBU
 lZHIVkbPARL3wHgxFwj0DnU/A7OKC+4mWXJNyNOM=
X-QQ-FEAT: Kol1Dm0TdrDgxTFHWxIWhYdLYgtMT8hXEOylYNSili9ILhmikMCZuPxv/2RmC
 fKvgxLqNuZNGJ4WVqnT0Xm4ljYaB++VZmtkQ2rKgXVrUZWmrTecE2VaySI9Dgfffu6WkRn9
 ZMlgAszxhBpkHpWN1jpiwL60zDdf+55SblHOlWFGZ8t66oxQ58WiDEWGcJ3neWMtQi2xOyk
 vIFL8MxdijSb/QhZeeHi4G9E1qv/kIzIk6J6E3jcRCS1ZFYffymxu5w6VB4wHOP9+TPRDCa
 YlijCBpgA7eM/beekFoUwipb2xsgEIfxSfKF9LJBwHylySBA0AXuxZXZU=
X-QQ-SSF: 00000000000000F0
X-QQ-XMAILINFO: MtAC/sqvm7UdldA8tVZHK0cOB766McUCSlQFi5EnguvraLCSK925AxhDXW55R1
 6ophRRewKS2mmAaqt8Kod4hD0Vj/ppdj/UpVwnbbb2VfFqdyrROPi6E59teQondA66gRonoPRC52f
 Dw3AZLaodtTjmkI0ZZN3JnbHp0lkKPHh0SH6XIoHFrefog7JFUOoth7vtJvfPVwam3Jt40EV+KCeJ
 M/GnblzQplmR70AmWwStWfCQG+SOwsOezAEgEkLxyclRT0b/EvGGjFWmjHaQ+GBa46icKDuVZj3tH
 F1gTCL5CdG96pxu+6B9m8cqMudglZ6+swreSfRgwvw6Eml1rPSr21PdEC/SGjgBg+bssu3xm91I9s
 E6ejDyuLLNmDqjF8wH8P0iK6AQXoT7Pq9pjvOAj0LbQ9YxHfOjme10or4WbkRy76pZRG1c9y6x7w+
 VatXrVcTEtIQaakLRJLXgXf0pAlbfH4SmvtlDHb9MMl9i77ibh/VvcAdsg5DHF0k9gAsAAesVKgH9
 uZgd5YeAY7/AZHKScy6OcrU0VY/18tS09n5K8NBcmV7TR83S63hgLjyvyjMjU029+9dfsEGheOJ7h
 jz+uTabe9i15U1sG4HUMaThf4aBGXU4A6gIyoQ/jWImcz8hicvj+EBRVt7PpOMnsv3Jq1Yzp4ZZIa
 ZGqGwHbAHniCtT5JojplkI0j+q4CIqL8LWU2/ofdoHk7G3uvTvWKjBTlVOjsva1gt6pPwD/NbFObl
 2NSXRaEqhUYx59svbAYlwoT2iRr3NOn/6xV11O2tCjirZmEUEvq+sJPGtbY6CMZpcC78=
X-QQ-WAPMAIL: 1
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 222.90.71.77
X-QQ-STYLE: 
X-QQ-mid: riamail40t1594737036t1877265
From: "=?utf-8?B?eGluZ3hpbmcgcWlhbw==?=" <mnlife@foxmail.com>
To: "=?utf-8?B?bGdpcmR3b29k?=" <lgirdwood@gmail.com>,
 "=?utf-8?B?cGVyZXg=?=" <perex@perex.cz>,
 "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?B?YWxzYS1kZXZlbA==?=" <alsa-devel@alsa-project.org>,
 "=?utf-8?B?YnJvb25pZQ==?=" <broonie@kernel.org>
Subject: [PATCH] When snd_soc_card_jack_new is not called or the call fails,
 calling this function causes a null pointer access
Mime-Version: 1.0
Date: Tue, 14 Jul 2020 22:30:36 +0800
X-Priority: 3
Message-ID: <tencent_AA2F5D7A5EDC40E7E806D0CA5877CE8AB308@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 14 Jul 2020 22:30:38 +0800 (CST)
Feedback-ID: riamail:foxmail.com:bgforeign:bgforeign11
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:18:09 +0200
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: =?utf-8?B?bW5saWZl?= <mnlife@foxmail.com>
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

U2lnbmVkLW9mZi1ieTogbW5saWZlIDxtbmxpZmVAZm94bWFpbC5jb20mZ3Q7DQoNCi0tLQ0K
Jm5ic3A7c291bmQvc29jL3NvYy1qYWNrLmMgfCAyICstDQombmJzcDsxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9zb2MtamFjay5jIGIvc291bmQvc29jL3NvYy1qYWNrLmMNCmluZGV4IDBmMTgyMGYz
NmI0ZC4uNTFiNzk5ZWU5OGI3IDEwMDY0NA0KLS0tIGEvc291bmQvc29jL3NvYy1qYWNrLmMN
CisrKyBiL3NvdW5kL3NvYy9zb2MtamFjay5jDQpAQCAtNDQsNyArNDQsNyBAQCB2b2lkIHNu
ZF9zb2NfamFja19yZXBvcnQoc3RydWN0IHNuZF9zb2NfamFjayAqamFjaywgaW50IHN0YXR1
cywgaW50IG1hc2spDQombmJzcDt1bnNpZ25lZCBpbnQgc3luYyA9IDA7DQombmJzcDtpbnQg
ZW5hYmxlOw0KJm5ic3A7DQotaWYgKCFqYWNrKQ0KK2lmICghamFjayB8fCAhamFjay0mZ3Q7
amFjaykNCiZuYnNwO3JldHVybjsNCiZuYnNwO3RyYWNlX3NuZF9zb2NfamFja19yZXBvcnQo
amFjaywgbWFzaywgc3RhdHVzKTsNCiZuYnNwOw0KLS0gDQoyLjE3LjE=
