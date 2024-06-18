Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFEF90C4A3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 09:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A960084C;
	Tue, 18 Jun 2024 09:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A960084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718697366;
	bh=dfT1qxTZ/ArR6fhiq4wVZrkNDTK0ahZ7XRTJJDr/TuI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K/uXO5Gd2Pw/9vGOZd8iJ/JsPghJ/i5UZo1YfqNjYQsdavEm2FZAqXXFeKv2r5Xgc
	 XGOoolZ+Fm+YTcu4Iof9SbvRFlC/CTu8fR5XW7kCfqgwWL+Xe1dldl7jexgwC6S0An
	 Ph31qdjHliaNTuUFYl0zfGTHf21Xn+2Wl4+ZnVr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 470B8F801EB; Tue, 18 Jun 2024 09:55:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0EE7F801EB;
	Tue, 18 Jun 2024 09:55:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 910D8F804F2; Tue, 18 Jun 2024 09:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8930FF8016E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 09:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8930FF8016E
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 45I7fe1T3186197,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 45I7fe1T3186197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2024 15:41:40 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 15:41:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 18 Jun 2024 15:41:41 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Tue, 18 Jun 2024 15:41:41 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Add more codec ID to no shutup list
Thread-Topic: Add more codec ID to no shutup list
Thread-Index: AdrBUoYYRsxhMRk/T0i7whnhDA4lCA==
Date: Tue, 18 Jun 2024 07:41:41 +0000
Message-ID: <8d86f61e7d6f4a03b311e4eb4e5caaef@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
Content-Type: multipart/mixed;
	boundary="_002_8d86f61e7d6f4a03b311e4eb4e5caaefrealtekcom_"
MIME-Version: 1.0
Message-ID-Hash: 7W2NKXY45JYASILUNASRTPYLI4TQRWAT
X-Message-ID-Hash: 7W2NKXY45JYASILUNASRTPYLI4TQRWAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7W2NKXY45JYASILUNASRTPYLI4TQRWAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_8d86f61e7d6f4a03b311e4eb4e5caaefrealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will add more codec ID to no shutup list.
Many Thanks.

Kailang


--_002_8d86f61e7d6f4a03b311e4eb4e5caaefrealtekcom_
Content-Type: application/octet-stream; name="0000-hsmic-no-shutup.patch"
Content-Description: 0000-hsmic-no-shutup.patch
Content-Disposition: attachment; filename="0000-hsmic-no-shutup.patch";
	size=899; creation-date="Tue, 18 Jun 2024 06:17:52 GMT";
	modification-date="Tue, 18 Jun 2024 07:37:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhMTQzYTQxNWI5MTI0ODI0YmFiMTlkZDRkNjY0YzkzYjM4YmYyOWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMTggSnVuIDIwMjQgMTQ6MTY6MDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogQWRkIG1vcmUgY29kZWMgSUQgdG8gbm8gc2h1dHVwIHBpbnMgbGlzdAoK
SWYgaXQgZW50ZXIgdG8gcnVudGltZSBEMyBzdGF0ZSwgaXQgZGlkbid0IHNodXR1cCBIZWFkc2V0
IE1JQyBwaW4uCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5j
b20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGJkMWI4MjRiYWFlMS4uNzc5ZjllMDE1Njg1IDEw
MDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNTg1LDEwICs1ODUsMTQgQEAgc3RhdGljIHZvaWQgYWxj
X3NodXR1cF9waW5zKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCXN3aXRjaCAoY29kZWMtPmNv
cmUudmVuZG9yX2lkKSB7CiAJY2FzZSAweDEwZWMwMjM2OgogCWNhc2UgMHgxMGVjMDI1NjoKKwlj
YXNlIDB4MTBlYzAyNTc6CiAJY2FzZSAweDE5ZTU4MzI2OgogCWNhc2UgMHgxMGVjMDI4MzoKKwlj
YXNlIDB4MTBlYzAyODU6CiAJY2FzZSAweDEwZWMwMjg2OgorCWNhc2UgMHgxMGVjMDI4NzoKIAlj
YXNlIDB4MTBlYzAyODg6CisJY2FzZSAweDEwZWMwMjk1OgogCWNhc2UgMHgxMGVjMDI5ODoKIAkJ
YWxjX2hlYWRzZXRfbWljX25vX3NodXR1cChjb2RlYyk7CiAJCWJyZWFrOwo=

--_002_8d86f61e7d6f4a03b311e4eb4e5caaefrealtekcom_--
