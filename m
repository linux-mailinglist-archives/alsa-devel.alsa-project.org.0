Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA617403
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 10:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FEB18FF;
	Wed,  8 May 2019 10:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FEB18FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557304637;
	bh=smj0hq4epuMUilzxWcUxRUB5ano6VwN076tqEfdkQqQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U006m/cMQfV8o5+J3bfsw62C9vt3W7ZB5gmzZdIohbgNML6VdAv4lhe0dWz6S90z3
	 nwmn9SIJ3rSHjrjOZdnEa5hfzubXNkhMAiP93uUsNc8Qu/pW+aLg3vKem+XTmix6m6
	 5qAhdzMJhOaLTvuJNsaQ+8ueA+jkntupCt3vo8g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8AC6F896E6;
	Wed,  8 May 2019 10:35:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB89EF896F0; Wed,  8 May 2019 10:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E99E2F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 10:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E99E2F80796
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x488ZKn2014181,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x488ZKn2014181
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 8 May 2019 16:35:21 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Wed, 8 May
 2019 16:35:20 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Support low power consumption for ALC3204
Thread-Index: AdUFeKDs2gHtAyqMQVS9itljCVhSEg==
Date: Wed, 8 May 2019 08:35:19 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765C8D@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C8DRTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Support low power consumption for ALC3204
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C8DRTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

This patch will support low consumption for Chrome ALC3204.

Thanks.

BR,
Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C8DRTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0002-chrome-alc3204-power-save.patch"
Content-Description: 0002-chrome-alc3204-power-save.patch
Content-Disposition: attachment;
	filename="0002-chrome-alc3204-power-save.patch"; size=3146;
	creation-date="Wed, 08 May 2019 08:19:30 GMT";
	modification-date="Wed, 08 May 2019 08:30:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3MWY4ZjhhNTRjY2I0ZjljZDE1MDcwNTc5NWRhNTM0ZWVlZWUzNjJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgOCBNYXkgMjAxOSAxNjoyNzowMyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gU3VwcG9ydCBsb3cgcG93ZXIgY29uc3VtcHRpb24gZm9yIEFMQzI1NgoK
RW50ZXIgdG8gY2xvc2UgbW9yZSBwb3dlciBjb250cm9sIHdpZGdldHMgYXQgc3VzcGVuZC4KUmVt
b3ZlIGhwX3BpbiA9IDAgcmV0dXJuLiBBZGQgdGhlIGRlZmF1bHQgcGluIDB4MjEgYXMgaGVhZHBo
b25lLgpTdXBwb3J0ZWQgbG93IHBvd2VyIGNvbnN1bXB0aW9uLCBpdCBtdXN0IHRvIGRvIGRlcG9w
IHByb2NlZHVyZSB3aGVuIGhlYWRzZXQgamFjayB3YXMgcGx1Z2dlZCBvciB1bnBsdWdnZWQuClNv
LCBhbGMyNTZfaW5pdCgpIGFuZCBhbGMyNTZfc2h1dHVwKCkgbXVzdCB0byBydW4gZGVsYXkgd2hl
biBoZWFkc2V0IGphY2sgd2FzIHBsdWdnZWQgb3IgdW5wbHVnZ2VkLgpJZiBkZXBvcCBwcm9jZWR1
cmUgbm90IHJ1biB3aXRoIGRlbGF5LCBpdCB3aWxsIGhhcyBhIGNoYW5jZSB0byBsZXQgcG93ZXIg
Y29uc3VtcHRpb24gcmFpc2UgaGlnaC4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2Fp
bGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGRhY2NjYWNiNWZlMC4u
YzUzY2E1ODljOTMwIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwor
KysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMzE5Nyw3ICszMTk3LDcgQEAg
c3RhdGljIHZvaWQgYWxjMjU2X2luaXQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJYm9vbCBo
cF9waW5fc2Vuc2U7CiAKIAlpZiAoIWhwX3BpbikKLQkJcmV0dXJuOworCQlocF9waW4gPSAweDIx
OwogCiAJbXNsZWVwKDMwKTsKIApAQCAtMzIwNywxNyArMzIwNywyNSBAQCBzdGF0aWMgdm9pZCBh
bGMyNTZfaW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJbXNsZWVwKDIpOwogCiAJYWxj
X3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcsIDB4MSk7IC8qIExv
dyBwb3dlciAqLworCWlmIChzcGVjLT51bHRyYV9sb3dfcG93ZXIpIHsKKwkJYWxjX3VwZGF0ZV9j
b2VmX2lkeChjb2RlYywgMHgwMywgMTw8MSwgMTw8MSk7CisJCWFsY191cGRhdGVfY29lZl9pZHgo
Y29kZWMsIDB4MDgsIDM8PDIsIDM8PDIpOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAw
eDA4LCA3PDw0LCAwKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzYiwgMTw8MTUs
IDApOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsKKwkJ
bXNsZWVwKDMwKTsKKwl9CiAKIAlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAs
CiAJCQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9NVVRFKTsKIAotCWlm
IChocF9waW5fc2Vuc2UpCisJaWYgKGhwX3Bpbl9zZW5zZSB8fCBzcGVjLT51bHRyYV9sb3dfcG93
ZXIpCiAJCW1zbGVlcCg4NSk7CiAKIAlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4s
IDAsCiAJCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCBQSU5fT1VUKTsKIAot
CWlmIChocF9waW5fc2Vuc2UpCisJaWYgKGhwX3Bpbl9zZW5zZSB8fCBzcGVjLT51bHRyYV9sb3df
cG93ZXIpCiAJCW1zbGVlcCgxMDApOwogCiAJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0
NiwgMyA8PCAxMiwgMCk7CkBAIC0zMjMyLDEwICszMjQwLDggQEAgc3RhdGljIHZvaWQgYWxjMjU2
X3NodXR1cChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAloZGFfbmlkX3QgaHBfcGluID0gYWxj
X2dldF9ocF9waW4oc3BlYyk7CiAJYm9vbCBocF9waW5fc2Vuc2U7CiAKLQlpZiAoIWhwX3Bpbikg
ewotCQlhbGMyNjlfc2h1dHVwKGNvZGVjKTsKLQkJcmV0dXJuOwotCX0KKwlpZiAoIWhwX3BpbikK
KwkJaHBfcGluID0gMHgyMTsKIAogCWhwX3Bpbl9zZW5zZSA9IHNuZF9oZGFfamFja19kZXRlY3Qo
Y29kZWMsIGhwX3Bpbik7CiAKQEAgLTMyNDUsNyArMzI1MSw3IEBAIHN0YXRpYyB2b2lkIGFsYzI1
Nl9zaHV0dXAoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJc25kX2hkYV9jb2RlY193cml0ZShj
b2RlYywgaHBfcGluLCAwLAogCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9P
VVRfTVVURSk7CiAKLQlpZiAoaHBfcGluX3NlbnNlKQorCWlmIChocF9waW5fc2Vuc2UgfHwgc3Bl
Yy0+dWx0cmFfbG93X3Bvd2VyKQogCQltc2xlZXAoODUpOwogCiAJLyogM2sgcHVsbCBsb3cgY29u
dHJvbCBmb3IgSGVhZHNldCBqYWNrLiAqLwpAQCAtMzI1NiwxMSArMzI2MiwyMCBAQCBzdGF0aWMg
dm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlzbmRfaGRhX2Nv
ZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsCiAJCQkJICAgIEFDX1ZFUkJfU0VUX1BJTl9XSURH
RVRfQ09OVFJPTCwgMHgwKTsKIAotCWlmIChocF9waW5fc2Vuc2UpCisJaWYgKGhwX3Bpbl9zZW5z
ZSB8fCBzcGVjLT51bHRyYV9sb3dfcG93ZXIpCiAJCW1zbGVlcCgxMDApOwogCiAJYWxjX2F1dG9f
c2V0dXBfZWFwZChjb2RlYywgZmFsc2UpOwogCWFsY19zaHV0dXBfcGlucyhjb2RlYyk7CisJaWYg
KHNwZWMtPnVsdHJhX2xvd19wb3dlcikgeworCQltc2xlZXAoNTApOworCQlhbGNfdXBkYXRlX2Nv
ZWZfaWR4KGNvZGVjLCAweDAzLCAxPDwxLCAwKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2Rl
YywgMHgwOCwgNzw8NCwgNzw8NCk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MDgs
IDM8PDIsIDApOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDNiLCAxPDwxNSwgMTw8
MTUpOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCAwKTsKKwkJbXNs
ZWVwKDMwKTsKKwl9CiB9CiAKIHN0YXRpYyB2b2lkIGFsYzIyNV9pbml0KHN0cnVjdCBoZGFfY29k
ZWMgKmNvZGVjKQo=

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C8DRTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C8DRTITMBSVM07real_--
