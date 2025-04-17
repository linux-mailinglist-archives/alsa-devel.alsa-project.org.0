Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D52A9162B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Apr 2025 10:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C18857025A;
	Thu, 17 Apr 2025 10:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C18857025A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744877388;
	bh=nUhvFbCWk95zgGrfVu2tiiWLRqKBPNxWZQ7uEou5f18=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GkUiGJSPP13chdME7pcg7jYQQywsTepnXmXFmP2R0WoLw/RhDLzAw6s1Q/cYgGNRq
	 o6scyylA1RcrReDN3xlZAcUGh8ZEAFD4i23qG17jpOEUtilP46sYCIow7UYZvINXFY
	 pnoMw4Znh5R+/c1mlTNij8ey/uQK+XhY8AVfFmSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44232F805D2; Thu, 17 Apr 2025 10:09:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 384A4F805C9;
	Thu, 17 Apr 2025 10:09:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFE5F8052D; Thu, 17 Apr 2025 10:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5810BF80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Apr 2025 10:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5810BF80027
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=PUTnTe1+
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53H88okY6555697,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1744877330; bh=nUhvFbCWk95zgGrfVu2tiiWLRqKBPNxWZQ7uEou5f18=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=PUTnTe1+zbg7NccaN68XbUUEVkVolsg5TFpaaN6QT5n6+clFXCojR9vsDs5DoL3Fu
	 qKr6th0mILOJnHKiCcwi8rkXov6VQcyg/e9J/gXtjEieaMTgxMvZPgMRKGg5cp8RLi
	 rInpRKgXEzUzrCcFhlqL64ABsShA8ItaCv2+t6B/Y87p2T1OCWvcTa+ggkPzHvd1yM
	 OULOwXl5x81msbYxnW4qIbIWOYDR0cZrglHr1EfoE6FsyVxl4oWuypH4JjkU+uRsoZ
	 /La8r+ZlGZDMyBMYUbuv1V3o7/iRqK0DnsWTKouobmZl3+ueCxOp6GU7E7Qo40YdK2
	 bwdckc1ri/kQA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53H88okY6555697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:08:50 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Apr 2025 16:08:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 17 Apr 2025 16:08:48 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Thu, 17 Apr 2025 16:08:48 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Speaker can't mute when headphone was plugged
Thread-Topic: Speaker can't mute when headphone was plugged
Thread-Index: Aduvb5FlJ2sjDv+mQRWEyeJdhFvEsA==
Date: Thu, 17 Apr 2025 08:08:48 +0000
Message-ID: <eb4c14a4d85740069c909e756bbacb0e@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: R6PYUDZJY46F775J5BBJF4KDY2M4DRQW
X-Message-ID-Hash: R6PYUDZJY46F775J5BBJF4KDY2M4DRQW
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6PYUDZJY46F775J5BBJF4KDY2M4DRQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Speaker can't mute when headphone was plugged for HP platform.
Add attach patch will solve issue.

BR,
Kailang

--_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc245-hp-OmniBook-Ultra-Flip-Laptop.patch"
Content-Description: 0000-alc245-hp-OmniBook-Ultra-Flip-Laptop.patch
Content-Disposition: attachment;
	filename="0000-alc245-hp-OmniBook-Ultra-Flip-Laptop.patch"; size=2334;
	creation-date="Tue, 01 Apr 2025 07:05:37 GMT";
	modification-date="Thu, 17 Apr 2025 08:04:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0YWI2NjhkOWI5MDJiZDM5NzFlZDE5MjdiZjRlZTRiOTU4ZGE4ZjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMSBBcHIgMjAyNSAxNTowNDowMiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRW5hYmxlIHNwZWFrZXIgZm9yIEhQIHBsYXRmb3JtCgpUaGUgc3BlYWtl
ciBkb2Vzbid0IG11dGUgd2hlbiBwbHVnZ2VkIGhlYWRwaG9uZS4KVGhpcyBwbGF0Zm9ybSBzdXBw
b3J0IDRjaCBzcGVha2Vycy4gClRoZSBzcGVha2VyIHBpbiAweDE0IHdhc24ndCBmaWxsIHZlcmIg
dGFibGUuCkFmdGVyIGFzc2lnbmVkIG1vZGVsIEFMQzI0NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBf
RVUwWFhYLgpUaGUgc3BlYWtlciBjYW4gbXV0ZSB3aGVuIGhlYWRwaG9uZSB3YXMgcGx1Z2dlZC4K
ClByaW9yaXR5OiBQMQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRl
ay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBiNjliNjU5YWU2NTkuLmI5MTk3MjJiMDcz
NyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTQ0MSw2ICs0NDEsMTAgQEAgc3RhdGljIHZvaWQg
YWxjX2ZpbGxfZWFwZF9jb2VmKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDY3LCAweGYwMDAsIDB4MzAwMCk7CiAJCWZhbGx0aHJvdWdoOwog
CWNhc2UgMHgxMGVjMDIxNToKKwljYXNlIDB4MTBlYzAyMzY6CisJY2FzZSAweDEwZWMwMjQ1Ogor
CWNhc2UgMHgxMGVjMDI1NjoKKwljYXNlIDB4MTBlYzAyNTc6CiAJY2FzZSAweDEwZWMwMjg1Ogog
CWNhc2UgMHgxMGVjMDI4OToKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzNiwgMTw8
MTMsIDApOwpAQCAtNDQ4LDEyICs0NTIsOCBAQCBzdGF0aWMgdm9pZCBhbGNfZmlsbF9lYXBkX2Nv
ZWYoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJY2FzZSAweDEwZWMwMjMwOgogCWNhc2UgMHgx
MGVjMDIzMzoKIAljYXNlIDB4MTBlYzAyMzU6Ci0JY2FzZSAweDEwZWMwMjM2OgotCWNhc2UgMHgx
MGVjMDI0NToKIAljYXNlIDB4MTBlYzAyNTU6Ci0JY2FzZSAweDEwZWMwMjU2OgogCWNhc2UgMHgx
OWU1ODMyNjoKLQljYXNlIDB4MTBlYzAyNTc6CiAJY2FzZSAweDEwZWMwMjgyOgogCWNhc2UgMHgx
MGVjMDI4MzoKIAljYXNlIDB4MTBlYzAyODY6CkBAIC0xMDczOCw4ICsxMDczOCw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJ
X1FVSVJLKDB4MTAzYywgMHg4Y2E3LCAiSFAgWkJvb2sgRnVyeSIsIEFMQzI0NV9GSVhVUF9DUzM1
TDQxX1NQSV8yX0hQX0dQSU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4Y2FmLCAi
SFAgRWxpdGUgbXQ2NDUgRzggTW9iaWxlIFRoaW4gQ2xpZW50IiwgQUxDMjM2X0ZJWFVQX0hQX01V
VEVfTEVEX01JQ01VVEVfVlJFRiksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNiZCwgIkhQ
IFBhdmlsaW9uIEFlcm8gTGFwdG9wIDEzLWJnMHh4eCIsIEFMQzI0NV9GSVhVUF9IUF9YMzYwX01V
VEVfTEVEUyksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNkZCwgIkhQIFNwZWN0cmUiLCBB
TEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNk
ZSwgIkhQIFNwZWN0cmUiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCisJU05EX1BDSV9R
VUlSSygweDEwM2MsIDB4OGNkZCwgIkhQIFNwZWN0cmUiLCBBTEMyNDVfRklYVVBfSFBfU1BFQ1RS
RV9YMzYwX0VVMFhYWCksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNkZSwgIkhQIE9tbmlC
b29rIFVsdHJhIEZsaXAgTGFwdG9wIDE0dCIsIEFMQzI0NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBf
RVUwWFhYKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4Y2RmLCAiSFAgU25vd1doaXRlIiwg
QUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfSFBfR1BJT19MRUQpLAogCVNORF9QQ0lfUVVJUkso
MHgxMDNjLCAweDhjZTAsICJIUCBTbm93V2hpdGUiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNf
Ml9IUF9HUElPX0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNmNSwgIkhQIFpCb29r
IFN0dWRpbyAxNiIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV80X0hQX0dQSU9fTEVEKSwK

--_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_--
