Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FAF74FECA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 07:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11A783E7;
	Wed, 12 Jul 2023 07:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11A783E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689140507;
	bh=g5lbdt6hbFkp/MFqkwWRdSLIAS5SBH26P5ODpZEgGuA=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nk11uJkmGPKXzVkTUlbDWYx/Y7Ybbr8UJZBydlkNf+93gtlIFWG/ZK/psUqPSpfzE
	 xRXiGHpg1W21/K1sKb60v833kg6Bc0CTu99pqnP6beNsCF1hsBtYJ+QxT9ilvSJFWf
	 480TIZfgpfhctrpyNvdl/Hr2tJgnE5mbWustBx6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21B47F80290; Wed, 12 Jul 2023 07:40:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68849F80236;
	Wed, 12 Jul 2023 07:40:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C389FF80249; Wed, 12 Jul 2023 07:40:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 532E6F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 07:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 532E6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZfmXdtQR
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36C5eWZJ110043;
	Wed, 12 Jul 2023 00:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689140432;
	bh=g5lbdt6hbFkp/MFqkwWRdSLIAS5SBH26P5ODpZEgGuA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=ZfmXdtQRtURuK068Pgbvp3a/TVijWWDzu5b/qSRW+M5ydQJDRLSM3C7+9j9Nxr5bC
	 YrkHfH0n/qIsccQMlNMTOY2Mgd90WA2BuhKkb+ojp+YLG1ZBHtwAeK5mjjUhfJib/E
	 GXyPu92hEwfJSFhKnNtdxY/Xz2FyhCsCiQwN2Aa0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36C5eWvf025202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jul 2023 00:40:32 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Jul 2023 00:40:31 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Wed, 12 Jul 2023 00:40:31 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [EXTERNAL] {standard input}:866: Error: value -148 out of range
Thread-Topic: [EXTERNAL] {standard input}:866: Error: value -148 out of range
Thread-Index: Adm0gsaW3vMI7N++QFS4HsNAog0qpgAAA5ag
Date: Wed, 12 Jul 2023 05:40:31 +0000
Message-ID: <a9019847806c476f992e4c33045e6ca5@ti.com>
References: <aa4c25eec6d947f5a3d19860680541de@ti.com>
In-Reply-To: <aa4c25eec6d947f5a3d19860680541de@ti.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.162.84]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: VTLC4BIQJKAC3QQ57VAR3JRF4XMUOOD2
X-Message-ID-Hash: VTLC4BIQJKAC3QQ57VAR3JRF4XMUOOD2
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VTLC4BIQJKAC3QQ57VAR3JRF4XMUOOD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gRnJvbe+8mmtlcm5lbMKgdGVzdMKgcm9ib3TCoMKgPG1haWx0bzpsa3BAaW50ZWwuY29t
Pg0KPiBUb++8mlNoZW5naGFvwqBEaW5nwqDCoDxtYWlsdG86MTM5MTYyNzUyMDZAMTM5LmNvbT4N
Cj4gRGF0Ze+8mjIwMjMtMDctMTDCoDA0OjU5OjUxDQo+IFN1YmplY3TvvJp7c3RhbmRhcmTCoGlu
cHV0fTo4NjY6wqBFcnJvcjrCoHZhbHVlwqAtMTQ4wqBvdXTCoG9mwqByYW5nZQ0KPiANCj4gdHJl
ZTrCoMKgwqBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXTCoG1hc3QNCj4gZXINCj4gaGVhZDrCoMKgwqBjMTkyYWM3MzU3Njgz
Zjc4YzJlNmQ2ZTc1YWRmY2MyOWRlYjhjNGFlDQo+IGNvbW1pdDrCoGVmM2JjZGU3NWQwNmQ2NWY3
OGJhMzhhMzBkNWE4N2ZiODNhNWNkYWXCoEFTb0M6wqB0YXMyNzgxOsKgQWRkDQo+IMKgdGFzMjc4
McKgZHJpdmVyDQo+IGRhdGU6wqDCoMKgM8Kgd2Vla3PCoGFnbw0KPiBjb25maWc6wqBtNjhrLXJh
bmRjb25maWctcjAxNS0yMDIzMDcxMMKgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktDQo+
IGNpL2FyY2hpdmUvMjAyMzA3MTAvMjAyMzA3MTAwNDEzLmxQbGdwYVBkLWxrcEBpbnRlbC5jb20v
Y29uZmlnKQ0KPiBjb21waWxlcjrCoG02OGstbGludXgtZ2NjwqAoR0NDKcKgMTIuMy4wDQo+IHJl
cHJvZHVjZTrCoChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LQ0KPiBjaS9hcmNoaXZlLzIw
MjMwNzEwLzIwMjMwNzEwMDQxMy5sUGxncGFQZC1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4g
DQo+IElmwqB5b3XCoGZpeMKgdGhlwqBpc3N1ZcKgaW7CoGHCoHNlcGFyYXRlwqBwYXRjaC9jb21t
aXTCoChpLmUuwqBub3TCoGp1c3TCoGHCoG5ld8KgdmVyc2lvbsKgb2YNCj4gdGhlwqBzYW1lwqBw
YXRjaC9jb21taXQpLMKga2luZGx5wqBhZGTCoGZvbGxvd2luZ8KgdGFncw0KPiB8wqBSZXBvcnRl
ZC1ieTrCoGtlcm5lbMKgdGVzdMKgcm9ib3TCoDxtYWlsdG86bGtwQGludGVsLmNvbT4NCj4gfMKg
Q2xvc2VzOg0KPiB8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDcx
MDA0MTMubFBsZ3BhUGQtbGtwQGludGVsLmMNCj4gfG9tLw0KPiANCj4gQWxswqBlcnJvcnPCoChu
ZXfCoG9uZXPCoHByZWZpeGVkwqBiecKgPj4pOg0KPiANCj4gwqDCoMKge3N0YW5kYXJkwqBpbnB1
dH06wqBBc3NlbWJsZXLCoG1lc3NhZ2VzOg0KPiA+PsKge3N0YW5kYXJkwqBpbnB1dH06ODY2OsKg
RXJyb3I6wqB2YWx1ZcKgLTE0OMKgb3V0wqBvZsKgcmFuZ2UNCj4gPj7CoHtzdGFuZGFyZMKgaW5w
dXR9Ojg2NjrCoEVycm9yOsKgdmFsdWXCoG9mwqBmZmZmZmY2Y8KgdG9vwqBsYXJnZcKgZm9ywqBm
aWVsZMKgb2YNCj4gPj4xwqBieXRlwqBhdMKgMDAwMDA0M2INCg0KV291bGQgeW91IGJlIHNvIGtp
bmQgYW5kIGdpdmUgbWUgc29tZSBhZHZpY2Ugb24gaG93IHRvIEkgZml4IHRoaXMgaXNzdWU/DQoN
Cj4gDQo+IC0tDQo+IDAtREFZwqBDScKgS2VybmVswqBUZXN0wqBTZXJ2aWNlDQo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQ0K
