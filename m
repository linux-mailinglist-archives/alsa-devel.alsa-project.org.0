Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7C480E7
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9375171C;
	Mon, 17 Jun 2019 13:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9375171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771405;
	bh=FtsuM0XIypm8BJdFZHHJIvjTwk4TS08Dldkr57Jro/0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sEzyEalIQnAYC+cPX8qa3VYEyXyyn5xJLug0N3qFOdT9YAHpzqyZXhniGB7k9YSg3
	 Q68yD4YPce+OC1Uw5KqF79DGEqsmjndqDxrfzrwUFOBlvnocP8JBA6RGluX1uNtzs8
	 kHQjArX7/y3dtDz0EFfh047MA+vH8te0L9LUkJu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4080F896DF;
	Mon, 17 Jun 2019 13:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2914CF8075C; Mon, 17 Jun 2019 13:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2049CF8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2049CF8075C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:34:51 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:34:49 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:33 +0200
Message-Id: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 00/11] Fix driver reload issues
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

SGksCgpUaGlzIHNlcmllcyBvZiBwYXRjaGVzIGludHJvZHVjZXMgZml4ZXMgdG8gdmFyaW91cyBp
c3N1ZXMgZm91bmQgd2hpbGUKdHJ5aW5nIHRvIHVubG9hZCBhbGwgc25kKiBtb2R1bGVzIGFuZCB0
aGVuIGxvYWRpbmcgdGhlbSBhZ2Fpbi4gVGhpcwphbGxvd3MgZm9yIG1vZHVsZXMgdG8gYmUgcmVh
bGx5IF9tb2R1bGVzXyBhbmQgYmUgdW5sb2FkZWQgYW5kIGxvYWRlZCBvbgpkZW1hbmQsIG1ha2lu
ZyBpdCBlYXNpZXIgdG8gZGV2ZWxvcCBhbmQgdGVzdCB0aGVtIHdpdGhvdXQgY29uc3RhbnQKc3lz
dGVtIHJlYm9vdHMuCgpUaGVyZSBhcmUgc29tZSBmaXhlcyBpbiBmbG93LCBlaXRoZXIgd2UgZG9u
J3QgaW5pdGlhbGl6ZSB0aGluZ3MgYmVmb3JlCmNsZWFuaW5nIHRoZW0gdXAsIGNsZWFuIHVwIGlu
IHdyb25nIHBsYWNlcyBvciBkb24ndCBjbGVhbiB1cCBhdCBhbGwuCk90aGVyIHBhdGNoZXMgZml4
IG1lbW9yeSBtYW5hZ2VtZW50IHByb2JsZW1zLCBtb3N0bHkgdGhpbmdzIGFyZSBub3QKYmVpbmcg
ZnJlZWQuIEFuZCBmaW5hbGx5IHRoZXJlIGlzIGZldyBtaXNjZWxsYW5lb3VzIHBhdGNoZXMsIHBs
ZWFzZQpyZWZlciB0byBzcGVjaWZpYyBwYXRjaGVzIHRvIHNlZSB3aGF0IHRoZXkgZG8uCgpUaGlz
IHNlcmllcyB3YXMgdGVzdGVkIG9uIFNLTCwgQlhULCBHTEsgJiBLQkwuCgpDaGFuZ2VzIGZyb20g
cHJldmlvdXMgcGF0Y2hzZXQ6CiAgKiBmb2xsb3dlZCBzdWdnZXRpb24gYnkgUGllcnJlIGluICJB
TFNBOiBoZGFjOiBGaXggY29kZWMgbmFtZSBhZnRlcgptYWNoaW5lIGRyaXZlciBpcyB1bmxvYWRl
ZCBhbmQgcmVsb2FkZWQiCiAgKiBkcm9wcGVkIHBhdGNoZXMgd2hpY2ggd2VyZSBtZXJnZWQKCkFt
YWRldXN6IFPFgmF3acWEc2tpICgxMSk6CiAgQVNvQzogSW50ZWw6IFNreWxha2U6IEluaXRpYWxp
emUgbGlzdHMgYmVmb3JlIGFjY2VzcyBzbyB0aGV5IGFyZSBzYWZlCiAgICB0byB1c2UKICBBTFNB
OiBoZGFjOiBGaXggY29kZWMgbmFtZSBhZnRlciBtYWNoaW5lIGRyaXZlciBpcyB1bmxvYWRlZCBh
bmQKICAgIHJlbG9hZGVkCiAgQVNvQzogY29tcHJlc3M6IEZpeCBtZW1vcnkgbGVhayBmcm9tIHNu
ZF9zb2NfbmV3X2NvbXByZXNzCiAgQVNvQzogSW50ZWw6IFNreWxha2U6IERvbid0IHJldHVybiBm
YWlsdXJlIG9uIG1hY2hpbmUgZHJpdmVyIHJlbG9hZAogIEFTb0M6IEludGVsOiBTa3lsYWtlOiBS
ZW1vdmUgc3RhdGljIHRhYmxlIGluZGV4IHdoZW4gcGFyc2luZyB0b3BvbG9neQogIEFTb0M6IElu
dGVsOiBTa3lsYWtlOiBBZGQgZnVuY3Rpb24gdG8gY2xlYW51cCBkZWJ1Z2ZzIGludGVyZmFjZQog
IEFTb0M6IEludGVsOiBTa3lsYWtlOiBQcm9wZXJseSBjbGVhbnVwIG9uIGNvbXBvbmVudCByZW1v
dmFsCiAgQVNvQzogSW50ZWw6IFNreWxha2U6IEZpeCBOVUxMIHB0ciBkZXJlZmVyZW5jZSB3aGVu
IHVubG9hZGluZyBjbGsgZGV2CiAgQVNvQzogSW50ZWw6IGhkYWNfaGRtaTogU2V0IG9wcyB0byBO
VUxMIG9uIHJlbW92ZQogIEFTb0M6IHRvcG9sb2d5OiBDb25zb2xpZGF0ZSBob3cgZHRleHRzIGFu
ZCBkdmFsdWVzIGFyZSBmcmVlZAogIEFTb0M6IHRvcG9sb2d5OiBDb25zb2xpZGF0ZSBhbmQgZml4
IGFzb2NfdHBsZ19kYXBtX3dpZGdldF8qX2NyZWF0ZQogICAgZmxvdwoKIHNvdW5kL2hkYS9leHQv
aGRhY19leHRfYnVzLmMgICAgICAgICAgIHwgICA4ICstCiBzb3VuZC9zb2MvY29kZWNzL2hkYWNf
aGRtaS5jICAgICAgICAgICB8ICAgNiArKwogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLWRl
YnVnLmMgICAgfCAgIDkgKysKIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyAgICAg
IHwgIDE2ICsrLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3AtY2xrLmMgIHwgIDE2
ICsrLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jIHwgIDUwICsrKysr
Ky0tLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuaCB8ICAgMiArCiBz
b3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYyAgICAgICAgICB8ICAgNyArLQogc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLmggICAgICAgICAgfCAgIDUgKysKIHNvdW5kL3NvYy9zb2MtY29t
cHJlc3MuYyAgICAgICAgICAgICAgIHwgIDE3ICsrLS0KIHNvdW5kL3NvYy9zb2MtdG9wb2xvZ3ku
YyAgICAgICAgICAgICAgIHwgMTE0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDExIGZpbGVz
IGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspLCAxMTQgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
