Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A7A5F4F1
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 10:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B343166B;
	Thu,  4 Jul 2019 10:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B343166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562230275;
	bh=JRH2a22pL5IjDoigHx6D8kqf9Y6HKNTXl8CuvBOYzJg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E4iBRgWzmLwagomYBYpG+c+uRZ13g+PTNc8u8rS9AhKJxuk9n42vkATPAuCQJCPj4
	 Tjj2EdvUAIaOFgTASUUBoFpEM4wI2Cw52zzc/bj2QIW9OsZIjGW/Ll3dHzS3ULimTA
	 n6XsQW6im4OAzGTe9V2AlBHbvZWWrKPKuz6jRwAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7C95F80110;
	Thu,  4 Jul 2019 10:49:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16698F80111; Thu,  4 Jul 2019 10:49:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D21D9F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 10:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21D9F800E7
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x648nJ5I016763,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x648nJ5I016763
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 4 Jul 2019 16:49:19 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Thu, 4 Jul
 2019 16:49:19 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Dell Headphone Mic can't record after S3 
Thread-Index: AdUyRQlDv4TAWF0UQWKPscJcu/b/4Q==
Date: Thu, 4 Jul 2019 08:49:18 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D76878B@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D76878BRTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Dell Headphone Mic can't record after S3
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76878BRTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Headphone Mic can't record after S3 on Dell headset mode platform.
The S3 mode was deep. S2idle didn't have this issue.

BR,
Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76878BRTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0000-fix-hp-mic-recording-fail.patch"
Content-Description: 0000-fix-hp-mic-recording-fail.patch
Content-Disposition: attachment;
	filename="0000-fix-hp-mic-recording-fail.patch"; size=1544;
	creation-date="Thu, 04 Jul 2019 08:09:23 GMT";
	modification-date="Thu, 04 Jul 2019 08:11:36 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhODIwY2YzN2U0ZjBiNDhmYjZhMzRjYjJmZjFhNWY2YTRhN2MzOTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgNCBKdWwgMjAxOSAxNjowMjoxMCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gSGVhZHBob25lIE1pYyBjYW4ndCByZWNvcmQgYWZ0ZXIgUzMKCkRlbGwg
aGVhZHNldCBtb2RlIHBsYXRmb3JtIHdpdGggQUxDMjM2LgpJdCBkb2Vzbid0IHJlY29yZGluZyBh
ZnRlciBzeXN0ZW0gcmVzdW1lIGZyb20gUzMuClMzIG1vZGUgd2FzIGRlZXAuIHMyaWRsZSB3YXMg
bm90IGhhcyB0aGlzIGlzc3VlLgpTMyBkZWVwIHdpbGwgY3V0IG9mIGNvZGVjIHBvd2VyLiBTbywg
dGhlIHJlZ2lzdGVyIHdpbGwgYmFjayB0byBkZWZhdWx0IGFmdGVyIHJlc3VtZSBiYWNrLgpUaGlz
IHBhdGNoIHdpbGwgc29sdmUgdGhpcyBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFu
ZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDQ4ZjNjNWI4
ZDZlOS4uMGY3NzY0NDRhYjg2IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMzI2OCw2ICszMjY4
LDcgQEAgc3RhdGljIHZvaWQgYWxjMjU2X2luaXQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJ
YWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcsIDB4NCk7IC8q
IEhpZ2h0IHBvd2VyICovCiAJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDUzLCAweDAy
LCAweDgwMDAsIDEgPDwgMTUpOyAvKiBDbGVhciBiaXQgKi8KIAlhbGNfdXBkYXRlX2NvZWZleF9p
ZHgoY29kZWMsIDB4NTMsIDB4MDIsIDB4ODAwMCwgMCA8PCAxNSk7CisJYWxjX3VwZGF0ZV9jb2Vm
X2lkeChjb2RlYywgMHgzNiwgMSA8PCAxMywgMSA8PCA1KTsgLyogU3dpdGNoIHBjYmVlcCBwYXRo
IHRvIExpbmUgaW4gcGF0aCovCiB9CiAKIHN0YXRpYyB2b2lkIGFsYzI1Nl9zaHV0dXAoc3RydWN0
IGhkYV9jb2RlYyAqY29kZWMpCkBAIC03ODM4LDcgKzc4MzksNiBAQCBzdGF0aWMgaW50IHBhdGNo
X2FsYzI2OShzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJc3BlYy0+c2h1dHVwID0gYWxjMjU2
X3NodXR1cDsKIAkJc3BlYy0+aW5pdF9ob29rID0gYWxjMjU2X2luaXQ7CiAJCXNwZWMtPmdlbi5t
aXhlcl9uaWQgPSAwOyAvKiBBTEMyNTYgZG9lcyBub3QgaGF2ZSBhbnkgbG9vcGJhY2sgbWl4ZXIg
cGF0aCAqLwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDM2LCAxIDw8IDEzLCAxIDw8
IDUpOyAvKiBTd2l0Y2ggcGNiZWVwIHBhdGggdG8gTGluZSBpbiBwYXRoKi8KIAkJYnJlYWs7CiAJ
Y2FzZSAweDEwZWMwMjU3OgogCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZUEVfQUxD
MjU3Owo=

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76878BRTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76878BRTITMBSVM07real_--
