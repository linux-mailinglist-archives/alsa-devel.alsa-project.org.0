Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E54AB98AD
	for <lists+alsa-devel@lfdr.de>; Fri, 16 May 2025 11:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09700601B9;
	Fri, 16 May 2025 11:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09700601B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747387334;
	bh=B0v8zU29rY2q8QLEddDx7dOrND9I7IQ0KaYpXqJAq2E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nkdy+N/xuHd2ANCbiRmMHtNG9q7hZ+xFxFTvJ2zW8pu3ARYmt2f5DXW5Bm3iVZ8kr
	 KiKv2vKvtNC4mUAD4TstXn+0ue1prNpLIjPYb0npj++BcXpChkaM8nQ6/ZIreBpxQq
	 MsbgScQR8vGjqYQQmuqU6ckiimnhmLEloUjtsdM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE36F802BE; Fri, 16 May 2025 11:21:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37488F80212;
	Fri, 16 May 2025 11:21:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C934EF80134; Fri, 16 May 2025 11:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 212EBF80038
	for <alsa-devel@alsa-project.org>; Fri, 16 May 2025 11:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212EBF80038
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=aNAonh0l
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 54G9LPHB0637585,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1747387285; bh=B0v8zU29rY2q8QLEddDx7dOrND9I7IQ0KaYpXqJAq2E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=aNAonh0lphRGbOyAaBIge9Dpgf8PrFXSVmY4AJNHFTDw7I2jGxyGaWLyx3on9skzk
	 PycF3hcEf36rgPO+fTp11p/0YmqxvQhxJtAho5kvBWMYV/c+/RIJc4jiH8lJ5835YD
	 yWigRj59bar5iU/eQk0N6x1tw9GL1Q7bQba1VNK7hn/YgwqcIYxhk0eFJ+7il6jWAW
	 1XiqHGeglTmDsvX9mZQeRGazy0X7LSs6swM1KIzZLJb7Dm+sZPip4n3cFPZAopMKdk
	 fc3PP4GEwc86ss5GVnb4XGMixvNdUmr2+vddLycrtoT5cfohsZZU4IiGBXiI28b3yx
	 vCxTXOQZ2B2sg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 54G9LPHB0637585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 17:21:25 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 May 2025 17:21:25 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 May 2025 17:21:25 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Fri, 16 May 2025 17:21:25 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: restore auto-mute mode for Dell Chrome platform
Thread-Topic: restore auto-mute mode for Dell Chrome platform
Thread-Index: AdvGQy8L1k7zLFr0QiGWt2p8V7CA1w==
Date: Fri, 16 May 2025 09:21:24 +0000
Message-ID: <ee8bbe5236464c369719d96269ba8ef8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: RYKO735MSCA7WCKWA6XKJNNGNEV7ELIP
X-Message-ID-Hash: RYKO735MSCA7WCKWA6XKJNNGNEV7ELIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYKO735MSCA7WCKWA6XKJNNGNEV7ELIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was approved by Google guy.

BR,
Kailang

--_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_
Content-Type: application/octet-stream;
	name="0002-dell-chrome-res-automute.patch"
Content-Description: 0002-dell-chrome-res-automute.patch
Content-Disposition: attachment;
	filename="0002-dell-chrome-res-automute.patch"; size=1004;
	creation-date="Thu, 15 May 2025 02:08:47 GMT";
	modification-date="Fri, 16 May 2025 07:32:51 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NjY0NzdlMjlkZjMwMzk4ZGMwOTIyYTM4M2YyMzU0M2NjZDM1MTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTYgTWF5IDIwMjUgMTQ6NTM6MzcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIHJlc3RvcmUgYXV0by1tdXRlIG1vZGUgZm9yIERlbGwgQ2hyb21lIHBs
YXRmb3JtCgpUaGlzIGJvYXJkIG5lZWQgdG8gc2h1dGRvd24gQ2xhc3MtRCBhbXAgdG8gYXZvaWQg
RU1JIGlzc3VlLgpSZXN0b3JlIHRoZSBBdXRvLU11dGUgbW9kZSBpdGVtIHdpbGwgb2ZmIHBpbiBj
b250cm9sIHdoZW4gQXV0by1tdXRlIG1vZGUgd2FzIGVuYWJsZS4KClNpZ25lZC1vZmYtYnk6IEth
aWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4
IDg3NzEzN2NiMDlhYy4uMmVhZGVlN2Y5YjM4IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNjgx
MSw3ICs2ODExLDEwIEBAIHN0YXRpYyB2b2lkIGFsYzI1Nl9maXh1cF9jaHJvbWVib29rKHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjLAogCiAJc3dpdGNoIChhY3Rpb24pIHsKIAljYXNlIEhEQV9GSVhV
UF9BQ1RfUFJFX1BST0JFOgotCQlzcGVjLT5nZW4uc3VwcHJlc3NfYXV0b19tdXRlID0gMTsKKwkJ
aWYgKGNvZGVjLT5jb3JlLnN1YnN5c3RlbV9pZCA9PSAweDEwMjgwZDc2KQorCQkJc3BlYy0+Z2Vu
LnN1cHByZXNzX2F1dG9fbXV0ZSA9IDA7CisJCWVsc2UKKwkJCXNwZWMtPmdlbi5zdXBwcmVzc19h
dXRvX211dGUgPSAxOwogCQlzcGVjLT5nZW4uc3VwcHJlc3NfYXV0b19taWMgPSAxOwogCQlzcGVj
LT5lbl8za3B1bGxfbG93ID0gZmFsc2U7CiAJCWJyZWFrOwo=

--_002_ee8bbe5236464c369719d96269ba8ef8realtekcom_--
