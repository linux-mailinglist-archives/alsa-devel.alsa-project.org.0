Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8D25FC2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 10:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851EF839;
	Wed, 22 May 2019 10:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851EF839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558514853;
	bh=MwwwQRhccc2IStSM+g6c0/CJ5VmxsO/2yf97mmC5VpQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZBNHedPoWNb0LVF+kfJpgVRTz8zJGmPXl3g1d3PNBzAYhs5+9syO1ncaHePU3PivB
	 IsNXEHmH0Oah9/4GCylIOO1x8+ta0bUCCkliEtmTlmahr/yiJunSYxB7vhz48IbuG6
	 X2Y/gdqPxxEdOivZiVpm4AbbjlaarLVEPizxCApg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9371F8962F;
	Wed, 22 May 2019 10:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8459FF8962F; Wed, 22 May 2019 10:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A8DF80C20
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 10:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A8DF80C20
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4M8jZPp015391,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4M8jZPp015391
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 16:45:35 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0399.000; Wed, 22 May 2019 16:45:35 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Change Dell headset mode rule
Thread-Index: AdUQen5iZ+D7gnpsQsid9HWGghE1OQ==
Date: Wed, 22 May 2019 08:45:35 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D766C08@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D766C08RTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Change Dell headset mode rule
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766C08RTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

In Dell headset mode, it will recheck during runtime resume when headset wa=
s plugged.
This patch will move check headset type on unplug and system resume.
Many Thanks.

BR,
Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766C08RTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0000-fix-check-headset-type.patch"
Content-Description: 0000-fix-check-headset-type.patch
Content-Disposition: attachment;
	filename="0000-fix-check-headset-type.patch"; size=1904;
	creation-date="Thu, 16 May 2019 08:20:13 GMT";
	modification-date="Wed, 22 May 2019 08:45:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyNTBhMDllNDJiYmQzZTRkMzJhYmFiMjlhZmFiZmE3NGJkNzczMGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTYgTWF5IDIwMTkgMTY6MTA6NDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIENoZWNrIGhlYWRzZXQgdHlwZSBieSB1bnBsdWcgYW5kIHJlc3VtZQoK
V2hlbiBzeXN0ZW0gZW5hYmxlIEhEQSBwb3dlciBzYXZlIG1vZGUuClRoaXMgaXNzdWUgd2lsbCBo
YXBwZW4gb24gbmV3IHBsYXRmb3JtIHdoaWNoIERNSUMgY29ubmVjdCB0byBQQ0guCkluIERlbGwg
aGVhZHNldCBtb2RlLCBpdCB3aWxsIHJlY2hlY2sgZHVyaW5nIHJ1bnRpbWUgcmVzdW1lIHdoZW4g
aGVhZHNldCB3YXMgcGx1Z2dlZC4KVGhpcyBwYXRjaCB3aWxsIG1vdmUgY2hlY2sgaGVhZHNldCB0
eXBlIG9uIHVucGx1ZyBhbmQgc3lzdGVtIHJlc3VtZS4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcg
WWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGY4M2Yy
MWQ2NGRkNC4uNDUwOGFiODM4YjcxIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNDkwMSw2ICs0
OTAxLDggQEAgc3RhdGljIHZvaWQgYWxjX3VwZGF0ZV9oZWFkc2V0X21vZGUoc3RydWN0IGhkYV9j
b2RlYyAqY29kZWMpCiAJc3dpdGNoIChuZXdfaGVhZHNldF9tb2RlKSB7CiAJY2FzZSBBTENfSEVB
RFNFVF9NT0RFX1VOUExVR0dFRDoKIAkJYWxjX2hlYWRzZXRfbW9kZV91bnBsdWdnZWQoY29kZWMp
OworCQlzcGVjLT5jdXJyZW50X2hlYWRzZXRfbW9kZSA9IEFMQ19IRUFEU0VUX01PREVfVU5LTk9X
TjsKKwkJc3BlYy0+Y3VycmVudF9oZWFkc2V0X3R5cGUgPSBBTENfSEVBRFNFVF9UWVBFX1VOS05P
V047CiAJCXNwZWMtPmdlbi5ocF9qYWNrX3ByZXNlbnQgPSBmYWxzZTsKIAkJYnJlYWs7CiAJY2Fz
ZSBBTENfSEVBRFNFVF9NT0RFX0hFQURTRVQ6CkBAIC00OTQzLDggKzQ5NDUsNiBAQCBzdGF0aWMg
dm9pZCBhbGNfdXBkYXRlX2hlYWRzZXRfbW9kZV9ob29rKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVj
LAogc3RhdGljIHZvaWQgYWxjX3VwZGF0ZV9oZWFkc2V0X2phY2tfY2Ioc3RydWN0IGhkYV9jb2Rl
YyAqY29kZWMsCiAJCQkJICAgICAgIHN0cnVjdCBoZGFfamFja19jYWxsYmFjayAqamFjaykKIHsK
LQlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKLQlzcGVjLT5jdXJyZW50X2hl
YWRzZXRfdHlwZSA9IEFMQ19IRUFEU0VUX1RZUEVfVU5LTk9XTjsKIAlzbmRfaGRhX2dlbl9ocF9h
dXRvbXV0ZShjb2RlYywgamFjayk7CiB9CiAKQEAgLTQ5ODEsNyArNDk4MSwxMSBAQCBzdGF0aWMg
dm9pZCBhbGNfZml4dXBfaGVhZHNldF9tb2RlKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCQlh
bGNfcHJvYmVfaGVhZHNldF9tb2RlKGNvZGVjKTsKIAkJYnJlYWs7CiAJY2FzZSBIREFfRklYVVBf
QUNUX0lOSVQ6Ci0JCXNwZWMtPmN1cnJlbnRfaGVhZHNldF9tb2RlID0gMDsKKwkJaWYgKGNvZGVj
LT5jb3JlLmRldi5wb3dlci5wb3dlcl9zdGF0ZS5ldmVudCA9PSBQTV9FVkVOVF9SRVNVTUUgfHwK
KwkJCQljb2RlYy0+Y29yZS5kZXYucG93ZXIucG93ZXJfc3RhdGUuZXZlbnQgPT0gUE1fRVZFTlRf
UkVTVE9SRSkgeworCQkJc3BlYy0+Y3VycmVudF9oZWFkc2V0X21vZGUgPSAwOworCQkJc3BlYy0+
Y3VycmVudF9oZWFkc2V0X3R5cGUgPSAwOworCQl9CiAJCWFsY191cGRhdGVfaGVhZHNldF9tb2Rl
KGNvZGVjKTsKIAkJYnJlYWs7CiAJfQo=

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766C08RTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766C08RTITMBSVM07real_--
