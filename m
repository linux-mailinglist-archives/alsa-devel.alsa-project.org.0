Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 025BE7970B2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 10:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D178825;
	Thu,  7 Sep 2023 10:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D178825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694074869;
	bh=B5hM6BfHNhVk5+tdUAoQmn74ZrzKMKTyLl0grWXBdlQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ipu45xfGf2Gj1bpehIg8MgN7VpVXpj+eXocKOFmXHv/Wxfi5o4DCOMaUWKl9udO+U
	 JDM4EYBZ1DcIuRt7TpoAHqqRX6LvUwrqNXScu7hNlsly/5j9Ts5LxKQZyaG+dqy6zB
	 TsmdYu0AWBzCFbMI09xeh+U4hsxngfLpyZP5ir38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC5C6F800AA; Thu,  7 Sep 2023 10:19:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A7BDF8047D;
	Thu,  7 Sep 2023 10:19:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4981F80494; Thu,  7 Sep 2023 10:19:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id AA4A6F800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 10:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA4A6F800F5
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3878J1GE0011873,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3878J1GE0011873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Sep 2023 16:19:02 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 7 Sep 2023 16:19:30 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 7 Sep 2023 16:19:29 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Thu, 7 Sep 2023 16:19:29 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>,
        Mark Pearson
	<mpearson@lenovo.com>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: ALC287 I2S speaker support
Thread-Topic: ALC287 I2S speaker support
Thread-Index: AdnhYc1ICnXo3MhpSkKP5rSPdCuD3g==
Date: Thu, 7 Sep 2023 08:19:29 +0000
Message-ID: <4e4cfa1b3b4c46838aecafc6e8b6f876@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_4e4cfa1b3b4c46838aecafc6e8b6f876realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: QUJQZSBR3UKV5YAGHQEZS5JDYGFUCO3X
X-Message-ID-Hash: QUJQZSBR3UKV5YAGHQEZS5JDYGFUCO3X
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUJQZSBR3UKV5YAGHQEZS5JDYGFUCO3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_4e4cfa1b3b4c46838aecafc6e8b6f876realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Lenovo ThinkPad P1 Gen5 had audio issue.
Attach patch will solve it.

BR,
Kailang

--_002_4e4cfa1b3b4c46838aecafc6e8b6f876realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc287-thinkpad-P1G5-bind-dacs.patch"
Content-Description: 0000-alc287-thinkpad-P1G5-bind-dacs.patch
Content-Disposition: attachment;
	filename="0000-alc287-thinkpad-P1G5-bind-dacs.patch"; size=2482;
	creation-date="Wed, 08 Mar 2023 03:07:04 GMT";
	modification-date="Thu, 07 Sep 2023 08:16:35 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2MzEzYTI0ZWQyZWVhNWNlYWI4YzMzOTY3ZmVmM2EzZjg5OWY4M2Y4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgNiBTZXAgMjAyMyAxNjo1MDo0MSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQUxDMjg3IEkyUyBzcGVha2VyIHBsYXRmb3JtIHN1cHBvcnQKCjB4MTcg
d2FzIG9ubHkgc3BlYWtlciBwaW4sIERBQyBhc3NpZ25lZCB3aWxsIGJlIDB4MDMuIEhlYWRwaG9u
ZSBhc3NpZ25lZCB0byAweDAyLgpQbGF5YmFjayB2aWEgaGVhZHBob25lIHdpbGwgZ2V0IEVRIGZp
bHRlciBwcm9jZXNzaW5nLlNvLGl0IG5lZWRzIHRvIHN3YXAgREFDLiAKClRlc3QtYnk6IE1hcmsg
UGVhcnNvbiA8bXBlYXJzb25AbGVub3ZvLmNvbT4KU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5n
IDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBhMDdkZjZmOTI5
NjAuLjZlYTY2MTg4ZThmYSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVr
LmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTcwNTYsNiArNzA1Niwy
NiBAQCBzdGF0aWMgdm9pZCBhbGMyOTVfZml4dXBfZGVsbF9pbnNwaXJvbl90b3Bfc3BlYWtlcnMo
c3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJCWJyZWFrOwogCX0KIH0KKy8qIEZvcmNpYmx5IGFz
c2lnbiBOSUQgMHgwMyB0byBIUCB3aGlsZSBOSUQgMHgwMiB0byBTUEsgKi8KK3N0YXRpYyB2b2lk
IGFsYzI4N19maXh1cF9iaW5kX2RhY3Moc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkJICAg
IGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxj
X3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKKwlzdGF0aWMgY29uc3QgaGRhX25pZF90IGNvbm5b
XSA9IHsgMHgwMiwgMHgwMyB9OyAvKiBleGNsdWRlIDB4MDYgKi8KKwlzdGF0aWMgY29uc3QgaGRh
X25pZF90IHByZWZlcnJlZF9wYWlyc1tdID0geworCQkweDE3LCAweDAyLCAweDIxLCAweDAzLCAw
CisJfTsKKworCWlmIChhY3Rpb24gIT0gSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkUpCisJCXJldHVy
bjsKKworCXNuZF9oZGFfb3ZlcnJpZGVfY29ubl9saXN0KGNvZGVjLCAweDE3LCBBUlJBWV9TSVpF
KGNvbm4pLCBjb25uKTsKKwlzcGVjLT5nZW4ucHJlZmVycmVkX2RhY3MgPSBwcmVmZXJyZWRfcGFp
cnM7CisJc3BlYy0+Z2VuLmF1dG9fbXV0ZV92aWFfYW1wID0gMTsKKwlzbmRfaGRhX2NvZGVjX3dy
aXRlX2NhY2hlKGNvZGVjLCAweDE0LCAwLCBBQ19WRVJCX1NFVF9QSU5fV0lER0VUX0NPTlRST0ws
CisJCQkgICAgMHgwKTsgLyogTWFrZSBzdXJlIDB4MTQgd2FzIGRpc2FibGUgKi8KK30KKwogCiBl
bnVtIHsKIAlBTEMyNjlfRklYVVBfR1BJTzIsCkBAIC03MzE5LDYgKzczMzksNyBAQCBlbnVtIHsK
IAlBTEMyODdfRklYVVBfVEFTMjc4MV9JMkMsCiAJQUxDMjQ1X0ZJWFVQX0hQX01VVEVfTEVEX0NP
RUZCSVQsCiAJQUxDMjQ1X0ZJWFVQX0hQX1gzNjBfTVVURV9MRURTLAorCUFMQzI4N19GSVhVUF9U
SElOS1BBRF9JMlNfU1BLLAogfTsKIAogLyogQSBzcGVjaWFsIGZpeHVwIGZvciBMZW5vdm8gQzk0
MCBhbmQgWW9nYSBEdWV0IDc7CkBAIC05NDEzLDYgKzk0MzQsMTAgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkuY2hhaW5lZCA9IHRydWUsCiAJ
CS5jaGFpbl9pZCA9IEFMQzI0NV9GSVhVUF9IUF9HUElPX0xFRAogCX0sCisJW0FMQzI4N19GSVhV
UF9USElOS1BBRF9JMlNfU1BLXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYu
ZnVuYyA9IGFsYzI4N19maXh1cF9iaW5kX2RhY3MsCisJfSwKIH07CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CkBAIC0xMDU0NCw2ICsx
MDU2OSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9oZGFfcGluX3F1aXJrIGFsYzI2OV9w
aW5fZml4dXBfdGJsW10gPSB7CiAJCXsweDE3LCAweDkwMTcwMTExfSwKIAkJezB4MTksIDB4MDNh
MTEwMzB9LAogCQl7MHgyMSwgMHgwMzIxMTAyMH0pLAorCVNORF9IREFfUElOX1FVSVJLKDB4MTBl
YzAyODcsIDB4MTdhYSwgIkxlbm92byIsIEFMQzI4N19GSVhVUF9USElOS1BBRF9JMlNfU1BLLAor
CQl7MHgxNywgMHg5MDE3MDExMH0sCisJCXsweDE5LCAweDAzYTExMDMwfSwKKwkJezB4MjEsIDB4
MDMyMTEwMjB9KSwKIAlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjg2LCAweDEwMjUsICJBY2Vy
IiwgQUxDMjg2X0ZJWFVQX0FDRVJfQUlPX01JQ19OT19QUkVTRU5DRSwKIAkJezB4MTIsIDB4OTBh
NjAxMzB9LAogCQl7MHgxNywgMHg5MDE3MDExMH0sCg==

--_002_4e4cfa1b3b4c46838aecafc6e8b6f876realtekcom_--
