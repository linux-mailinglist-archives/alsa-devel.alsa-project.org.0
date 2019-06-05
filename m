Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDC35E3F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F766166E;
	Wed,  5 Jun 2019 15:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F766166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742533;
	bh=Y/ejzInhJg7YVGqYlfAaaM97CDtaJlRVKOvxTOgsjx0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bP3D30sqHAwfaETuYEIUni3lB/60XcxrEMHKjUvvbwaKnpeMoOrRxjSTnG81RAb24
	 7UD4SzevVFpMej6J31KMAJI5CabBA7LEC1/hFagmWIjVsf4irI7ICuNHNbm2dHE0eP
	 NL3if3pwcc4mO+CUJB6oHOHn+dRZlVOAO89cRHz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32340F8974F;
	Wed,  5 Jun 2019 15:42:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 251F8F89751; Wed,  5 Jun 2019 15:42:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD6F8F8974D
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD6F8F8974D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:39 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:36 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:50 +0200
Message-Id: <20190605134556.10322-9-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 08/14] ASoC: Intel: Skylake: Properly cleanup
	on component removal
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

V2hlbiB3ZSByZW1vdmUgY29tcG9uZW50IHdlIG5lZWQgdG8gcmV2ZXJzZSB0aGluZ3Mgd2hpY2gg
d2VyZSBkb25lIG9uCmluaXQsIHRoaXMgY29uc2lzdHMgb2YgdG9wb2xvZ3kgY2xlYW51cCwgbGlz
dHMgY2xlYW51cCBhbmQgcmVsZWFzaW5nCmZpcm13YXJlLgoKQ3VycmVudGx5IGNsZWFudXAgaGFu
ZGxlcnMgYXJlIHB1dCBpbiB3cm9uZyBwbGFjZXMgb3Igb3RoZXJ3aXNlIG1pc3NpbmcuClNvIGFk
ZCBwcm9wZXIgY29tcG9uZW50IGNsZWFudXAgZnVuY3Rpb24gYW5kIHBlcmZvcm0gY2xlYW51cHMg
aW4gaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNs
YXdpbnNraUBsaW51eC5pbnRlbC5jb20+Ci0tLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2ts
LXBjbS5jICAgICAgfCAgOCArKysrKystLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRv
cG9sb2d5LmMgfCAxNSArKysrKysrKysrKysrKysKIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3Nr
bC10b3BvbG9neS5oIHwgIDIgKysKIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5jICAgICAg
ICAgIHwgIDIgLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgYi9z
b3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMKaW5kZXggNDQwNjI4MDZmYmVkLi43ZTgx
MTBjMTUyNTggMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYwor
KysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMKQEAgLTE0NTksOCArMTQ1OSwx
MiBAQCBzdGF0aWMgaW50IHNrbF9wbGF0Zm9ybV9zb2NfcHJvYmUoc3RydWN0IHNuZF9zb2NfY29t
cG9uZW50ICpjb21wb25lbnQpCiAKIHN0YXRpYyB2b2lkIHNrbF9wY21fcmVtb3ZlKHN0cnVjdCBz
bmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50KQogewotCS8qIHJlbW92ZSB0b3BvbG9neSAqLwot
CXNuZF9zb2NfdHBsZ19jb21wb25lbnRfcmVtb3ZlKGNvbXBvbmVudCwgU05EX1NPQ19UUExHX0lO
REVYX0FMTCk7CisJc3RydWN0IGhkYWNfYnVzICpidXMgPSBkZXZfZ2V0X2RydmRhdGEoY29tcG9u
ZW50LT5kZXYpOworCXN0cnVjdCBza2wgKnNrbCA9IGJ1c190b19za2woYnVzKTsKKworCXNrbF90
cGxnX2V4aXQoY29tcG9uZW50LCBidXMpOworCisJc2tsX2RlYnVnZnNfZXhpdChza2wpOwogfQog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50X2RyaXZlciBza2xfY29tcG9u
ZW50ICA9IHsKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9n
eS5jIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMKaW5kZXggNDRmM2Iy
OWE3MjEwLi4zOTY0MjYyMTA5YWMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtl
L3NrbC10b3BvbG9neS5jCisrKyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9n
eS5jCkBAIC0zNzQ4LDMgKzM3NDgsMTggQEAgaW50IHNrbF90cGxnX2luaXQoc3RydWN0IHNuZF9z
b2NfY29tcG9uZW50ICpjb21wb25lbnQsIHN0cnVjdCBoZGFjX2J1cyAqYnVzKQogCiAJcmV0dXJu
IDA7CiB9CisKK3ZvaWQgc2tsX3RwbGdfZXhpdChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNv
bXBvbmVudCwgc3RydWN0IGhkYWNfYnVzICpidXMpCit7CisJc3RydWN0IHNrbCAqc2tsID0gYnVz
X3RvX3NrbChidXMpOworCXN0cnVjdCBza2xfcGlwZWxpbmUgKnBwbCwgKnRtcDsKKworCWlmICgh
bGlzdF9lbXB0eSgmc2tsLT5wcGxfbGlzdCkpCisJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShw
cGwsIHRtcCwgJnNrbC0+cHBsX2xpc3QsIG5vZGUpCisJCQlsaXN0X2RlbCgmcHBsLT5ub2RlKTsK
KworCS8qIGNsZWFuIHVwIHRvcG9sb2d5ICovCisJc25kX3NvY190cGxnX2NvbXBvbmVudF9yZW1v
dmUoY29tcG9uZW50LCBTTkRfU09DX1RQTEdfSU5ERVhfQUxMKTsKKworCXJlbGVhc2VfZmlybXdh
cmUoc2tsLT50cGxnKTsKK30KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3Nr
bC10b3BvbG9neS5oIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmgKaW5k
ZXggODIyODJjYWM5NzUxLi43ZDMyYzYxYzczZTcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC10b3BvbG9neS5oCisrKyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3Nr
bC10b3BvbG9neS5oCkBAIC00NzEsNiArNDcxLDggQEAgdm9pZCBza2xfdHBsZ19zZXRfYmVfZG1p
Y19jb25maWcoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCiAJc3RydWN0IHNrbF9waXBlX3BhcmFt
cyAqcGFyYW1zLCBpbnQgc3RyZWFtKTsKIGludCBza2xfdHBsZ19pbml0KHN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50LAogCQkJCXN0cnVjdCBoZGFjX2J1cyAqZWJ1cyk7Cit2b2lk
IHNrbF90cGxnX2V4aXQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCisJCQkJ
c3RydWN0IGhkYWNfYnVzICpidXMpOwogc3RydWN0IHNrbF9tb2R1bGVfY2ZnICpza2xfdHBsZ19m
ZV9nZXRfY3ByX21vZHVsZSgKIAkJc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBzdHJlYW0p
OwogaW50IHNrbF90cGxnX3VwZGF0ZV9waXBlX3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsCmRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYyBiL3NvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC5jCmluZGV4IDZkNjQwMTQxMDI1MC4uZTQ4ODFmZjQyN2VhIDEwMDY0NAot
LS0gYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYworKysgYi9zb3VuZC9zb2MvaW50ZWwv
c2t5bGFrZS9za2wuYwpAQCAtMTExOSwxNCArMTExOSwxMiBAQCBzdGF0aWMgdm9pZCBza2xfcmVt
b3ZlKHN0cnVjdCBwY2lfZGV2ICpwY2kpCiAJc3RydWN0IHNrbCAqc2tsID0gYnVzX3RvX3NrbChi
dXMpOwogCiAJY2FuY2VsX3dvcmtfc3luYygmc2tsLT5wcm9iZV93b3JrKTsKLQlyZWxlYXNlX2Zp
cm13YXJlKHNrbC0+dHBsZyk7CiAKIAlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgmcGNpLT5kZXYp
OwogCiAJLyogY29kZWMgcmVtb3ZhbCwgaW52b2tlIGJ1c19kZXZpY2VfcmVtb3ZlICovCiAJc25k
X2hkYWNfZXh0X2J1c19kZXZpY2VfcmVtb3ZlKGJ1cyk7CiAKLQlza2wtPmRlYnVnZnMgPSBOVUxM
OwogCXNrbF9wbGF0Zm9ybV91bnJlZ2lzdGVyKCZwY2ktPmRldik7CiAJc2tsX2ZyZWVfZHNwKHNr
bCk7CiAJc2tsX21hY2hpbmVfZGV2aWNlX3VucmVnaXN0ZXIoc2tsKTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
