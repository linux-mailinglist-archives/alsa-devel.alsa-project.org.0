Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D99133D73
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 09:43:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2991732;
	Wed,  8 Jan 2020 09:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2991732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578473033;
	bh=Bw2G2CYyJAdnmFKEuUDbnb+svCNPnsBMZ/3dXuVDj0I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VOUDjftqNRmHCAqnIFiQmlsaY0UHwG3TF4lRYjFe6K/G637fXwB0x/XpzVT2uquka
	 5PKD82uD3s+B8gGwqzJ/7WLHbyjSUiiLZnz3pmP+r5GQcaAfe/2TxCuAsOFNiGOcGQ
	 dc5oD9lGNsCJ45CxfeGYFoCTEuod+JeHNZbaM3io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A7DF80159;
	Wed,  8 Jan 2020 09:42:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 114B5F80159; Wed,  8 Jan 2020 09:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FC69F8010A
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 09:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC69F8010A
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 0088fwoB013757,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 0088fwoB013757
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2020 16:41:58 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 8 Jan 2020 16:41:58 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 8 Jan 2020 16:41:57 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0]) by
 RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0%6]) with mapi id
 15.01.1779.005; Wed, 8 Jan 2020 16:41:57 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Set EAPD control to default for ALC222
Thread-Index: AdXF/020lNTEkstBQSeZDffyGyHpkQ==
Date: Wed, 8 Jan 2020 08:41:57 +0000
Message-ID: <5bc3822076d444febdc864f94716e55f@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_004_5bc3822076d444febdc864f94716e55frealtekcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Hui Wang <hui.wang@canonical.com>,
 " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Set EAPD control to default for ALC222
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

--_004_5bc3822076d444febdc864f94716e55frealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Add Set EAPD control to default for ALC222.
Many Thanks.

BR,
Kailang

--_004_5bc3822076d444febdc864f94716e55frealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc222-eapd-control.patch"
Content-Description: 0000-alc222-eapd-control.patch
Content-Disposition: attachment; filename="0000-alc222-eapd-control.patch";
	size=761; creation-date="Tue, 07 Jan 2020 09:26:52 GMT";
	modification-date="Tue, 07 Jan 2020 09:24:34 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlMmZkZGYwZmQzN2EyOWRiOWNkODM5Yjc4Mzg5ZDYzMWM2YjFlMDVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgNyBKYW4gMjAyMCAxNzoyMjoxOSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gU2V0IEVBUEQgY29udHJvbCB0byBkZWZhdWx0IGZvciBBTEMyMjIKClNl
dCBFQVBEIGNvbnRyb2wgdG8gdmVyYiBjb250cm9sLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZ
YW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggNzM0MDdi
MjVhNzc3Li5lMGM1NmRiMWU2MjIgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC00MTIsNiArNDEy
LDcgQEAgc3RhdGljIHZvaWQgYWxjX2ZpbGxfZWFwZF9jb2VmKHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjKQogCWNhc2UgMHgxMGVjMDY3MjoKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHhk
LCAwLCAxPDwxNCk7IC8qIEVBUEQgQ3RybCAqLwogCQlicmVhazsKKwljYXNlIDB4MTBlYzAyMjI6
CiAJY2FzZSAweDEwZWMwNjIzOgogCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDE5LCAx
PDwxMywgMCk7CiAJCWJyZWFrOwo=

--_004_5bc3822076d444febdc864f94716e55frealtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_004_5bc3822076d444febdc864f94716e55frealtekcom_--
