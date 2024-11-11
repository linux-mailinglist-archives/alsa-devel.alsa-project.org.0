Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82F9C38A1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2024 07:50:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1BC105F;
	Mon, 11 Nov 2024 07:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1BC105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731307848;
	bh=Qg0m7cCtgNpLQr5oneSHt08zgC2VU5Sp2uA8uuOfkfw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HrNa6ZtNGHQBWtYANOV6mEvSjdOL/RVxZ6iiiq0decq8Safub35WR+VJevVbZfkbd
	 ARGYoN/3Sty0b7vrgIWsaqSEzRmZsTMtfikwKhmghS2eLLa1EKoNasQBKTS7bWx7un
	 4EFByXOKsdD1N7KDfkrC1EaPtB62MZGgY+bb7xZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46FAFF805BD; Mon, 11 Nov 2024 07:50:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D73F5F80578;
	Mon, 11 Nov 2024 07:50:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88021F80199; Mon, 11 Nov 2024 07:50:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F5AF800C9
	for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2024 07:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F5AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=eTUaioX4
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4AB6nsdJ71778797,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1731307794; bh=Qg0m7cCtgNpLQr5oneSHt08zgC2VU5Sp2uA8uuOfkfw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=eTUaioX4DR1FOztg+Rw3tyKp/UBlzKEjeQfRuETuIQFXHLrgyMa/R4LH1OmT/KTY8
	 EKaAgVkmJPmTc3Zg3yW3zgZeV5fKBkJlWMGL1TswLVol2UjbIrhxqBJ5bbvTOYA984
	 8U0Fe2GU7UyvLUvwLmXy78GK3j/h1ZUi6usSgDqLK2FNi/+AJB5GhTmdUMkhF6sfxT
	 MK5RtLmH4uYUUae7DmH0QkcrKoPPl7Xg9I7iWgSOb1cQBl3SW6NVr5nJg/yoPwckGn
	 d/cLpgdFZTRa0MCTHehQT/lJa/wOykkJq/qv9J8LPpVT2ODq6iWc/9T7oJcga9ntko
	 vN3ccFGt9ZqZQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4AB6nsdJ71778797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2024 14:49:54 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 14:49:55 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Nov 2024 14:49:54 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Mon, 11 Nov 2024 14:49:54 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Clevo Platfrom with ALC255
Thread-Topic: Clevo Platfrom with ALC255
Thread-Index: Ads0BaMtPCa3pUJzTVqnN43TAnkA3g==
Date: Mon, 11 Nov 2024 06:49:54 +0000
Message-ID: <b2dcac3e09ef4f82b36d6712194e1ea4@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_b2dcac3e09ef4f82b36d6712194e1ea4realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: DQ7JAZJ6HFV5BSWWAA6NGVNJUKYFBCKM
X-Message-ID-Hash: DQ7JAZJ6HFV5BSWWAA6NGVNJUKYFBCKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQ7JAZJ6HFV5BSWWAA6NGVNJUKYFBCKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_b2dcac3e09ef4f82b36d6712194e1ea4realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach was let Clevo platform with ALC255 enable headset Mic.

BR,
Kailang

--_002_b2dcac3e09ef4f82b36d6712194e1ea4realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc255-clevo-headset-mic.patch"
Content-Description: 0000-alc255-clevo-headset-mic.patch
Content-Disposition: attachment;
	filename="0000-alc255-clevo-headset-mic.patch"; size=906;
	creation-date="Fri, 25 Oct 2024 08:40:00 GMT";
	modification-date="Mon, 11 Nov 2024 06:44:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYTRmMzBkZjdkNjE1NGFlYWE4ZTk0YWE5OWUyZjgxNGViNTA0NTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMjUgT2N0IDIwMjQgMTY6Mzc6NTcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIENsZXZvIHBsYXRmb3JtIGhlYWRzZXQgTWljIGlzc3VlCgpD
bGV2byBwbGF0Zm9ybSB3aXRoIEFMQzI1NSBIZWFkc2V0IE1pYyB3YXMgZGlzYWJsZSBieSBkZWZh
dWx0LgpBc3NpZ25lZCB2ZXJiIHRhYmxlIGZvciBNaWMgcGluIHdpbGwgZW5hYmxlIGl0LgoKU2ln
bmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYwppbmRleCAxYzFhNjY4ZGMwZTAuLjYxZmRlODM0YWMzZSAxMDA2NDQKLS0tIGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKQEAgLTExNTY2LDYgKzExNTY2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfaGRh
X3Bpbl9xdWlyayBhbGMyNjlfZmFsbGJhY2tfcGluX2ZpeHVwX3RibFtdID0gewogCQl7MHgxYSwg
MHg0MDAwMDAwMH0pLAogCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzAyNTYsIDB4MTA0MywgIkFT
VVMiLCBBTEMyWFhfRklYVVBfSEVBRFNFVF9NSUMsCiAJCXsweDE5LCAweDQwMDAwMDAwfSksCisJ
U05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI1NSwgMHgxNTU4LCAiQ2xldm8iLCBBTEMyWFhfRklY
VVBfSEVBRFNFVF9NSUMsCisJCXsweDE5LCAweDQwMDAwMDAwfSksCiAJe30KIH07CiAK

--_002_b2dcac3e09ef4f82b36d6712194e1ea4realtekcom_--
