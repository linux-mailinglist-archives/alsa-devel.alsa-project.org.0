Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4421B07F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 09:47:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21761616;
	Fri, 10 Jul 2020 09:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21761616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594367247;
	bh=bq9189NYD1kFDAJTUeapQxZRTg1t20SNcKNNi3GAqS8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rpO8Wh3gzJs1iyuAMBR8jixZrKlRo4Mg1BBwnJb6P6Uufz5l2EEPTU4gr3dol43fA
	 7o22rkg3jHXNiGtzprzFzTnjMEw4+mx19ISXZVHC+3sSRTzPENZceCzuK+1nSm0iYY
	 uCihd6u+NKSk06HgtcMU/uKGGVGwJL/pnxaN0lfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40031F8011C;
	Fri, 10 Jul 2020 09:45:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61816F8015A; Fri, 10 Jul 2020 09:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3FDF8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 09:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3FDF8011C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06A7jObO5031538,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06A7jObO5031538
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 10 Jul 2020 15:45:24 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 10 Jul 2020 15:45:24 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 10 Jul 2020 15:45:24 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Fri, 10 Jul 2020 15:45:24 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Change model for ASUS platform
Thread-Topic: Change model for ASUS platform
Thread-Index: AdZWjY2MFX16jKlbTTa/suiU0tMR6w==
Date: Fri, 10 Jul 2020 07:45:24 +0000
Message-ID: <d05bcff170784ec7bb35023407148161@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: multipart/mixed;
 boundary="_002_d05bcff170784ec7bb35023407148161realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_d05bcff170784ec7bb35023407148161realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

ASUS platform couldn't need to use Headset Mode model.
Attach patch will change it.

BR,
Kailang

--_002_d05bcff170784ec7bb35023407148161realtekcom_
Content-Type: application/octet-stream; name="0000-asus-model-change.patch"
Content-Description: 0000-asus-model-change.patch
Content-Disposition: attachment; filename="0000-asus-model-change.patch";
	size=1092; creation-date="Fri, 10 Jul 2020 07:39:52 GMT";
	modification-date="Fri, 10 Jul 2020 07:44:05 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmZjRhY2MzMTE0NGMzZTQ4ZTQzNWVhNGMyNTJlZDkzMjRkNTA3ODI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTAgSnVsIDIwMjAgMTU6MzE6MTEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIGNoYW5nZSB0byBzdWl0YWJsZSBsaW5rIG1vZGVsIGZvciBBU1VTCiBw
bGF0Zm9ybQoKQVNVUyBwbGF0Zm9ybSBjb3VsZG4ndCBuZWVkIHRvIHVzZSBIZWFkc2V0IE1vZGUg
bW9kZWwuCkl0IGNoYW5nZXMgdG8gdGhlIHN1aXRhYmxlIG1vZGVsLgoKU2lnbmVkLW9mZi1ieTog
S2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5k
ZXggYWQ0MzgxMmQ2M2I1Li40ZGM3ODJlZDA0YjQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03
MTA1LDcgKzcxMDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4
dXBzW10gPSB7CiAJCQl7IH0KIAkJfSwKIAkJLmNoYWluZWQgPSB0cnVlLAotCQkuY2hhaW5faWQg
PSBBTEMyNjlfRklYVVBfSEVBRFNFVF9NT0RFX05PX0hQX01JQworCQkuY2hhaW5faWQgPSBBTEMy
NjlfRklYVVBfSEVBRFNFVF9NSUMKIAl9LAogCVtBTEMyOTRfRklYVVBfQVNVU19IRUFEU0VUX01J
Q10gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX1BJTlMsCkBAIC03MTE0LDcgKzcxMTQsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCQl7IH0K
IAkJfSwKIAkJLmNoYWluZWQgPSB0cnVlLAotCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfSEVB
RFNFVF9NT0RFX05PX0hQX01JQworCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfSEVBRFNFVF9N
SUMKIAl9LAogCVtBTEMyOTRfRklYVVBfQVNVU19TUEtdID0gewogCQkudHlwZSA9IEhEQV9GSVhV
UF9WRVJCUywK

--_002_d05bcff170784ec7bb35023407148161realtekcom_--
