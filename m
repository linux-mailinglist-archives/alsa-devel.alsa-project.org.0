Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A25FD9D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 22:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A5B16A5;
	Thu,  4 Jul 2019 22:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A5B16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562270614;
	bh=9iVnhme1urg9OJdDU3gZReUvgs7MAqVUiAiuvVzvEGM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p5yn8wlPdloA/T2zMckbjwYiXS+LCndJ27ErRTec43yd5UE/svwt2lg82ZVEe7nYW
	 J4Oy8udO3tOy7bb2TorwmdAt/NeJBnmXwtRoKxIzlaq7G8TeHkTFGF5FczNkp5lVds
	 0GeqTU0PoRkTvKsO7/9sa3/QUujMJAddXXlagtiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0B6F800E8;
	Thu,  4 Jul 2019 22:01:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F92F80111; Thu,  4 Jul 2019 22:01:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E711CF800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 22:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E711CF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 13:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,452,1557212400"; d="scan'208";a="166329113"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2019 13:01:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  4 Jul 2019 22:00:59 +0200
Message-Id: <20190704200106.11289-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/7] ASoC: Intel: Skylake: Driver fundaments
	overhaul
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

U2t5bGFrZSBkcml2ZXIgaXMgZGl2aWRlZCBpbnRvIHR3byBtb2R1bGVzOgotIHNuZF9zb2Nfc2ts
Ci0gc25kX3NvY19za2xfaXBjCgphbmQgbm90aGluZyB3b3VsZCBiZSB3cm9uZyBpZiBub3QgZm9y
IHRoZSBmYWN0IHRoYXQgYm90aCBjYW5ub3QgZXhpc3QKd2l0aG91dCBvbmUgYW5vdGhlci4gSVBD
IG1vZHVsZSBpcyBub3Qgc29tZSBraW5kIG9mIGV4dGVuc2lvbiwgYXMgaXQgaXMKdGhlIGNhc2Ug
Zm9yIHNuZF9oZGFfZXh0X2NvcmUgd2hpY2ggaXMgc2VwYXJhdGVkIGZyb20gc25kX2hkYV9jb3Jl
IC0KbGVnYWN5IGhkYSBpbnRlcmZhY2UuIEl0J3MgYXMgbXVjaCBjb3JlIFNreWxha2UgbW9kdWxl
IGFzIHNuZF9zb2Nfc2tsCmlzLgoKU3RhdGVtZW50IGJhY2t1cCBieSBleGlzdGVuY2Ugb2YgY2ly
Y3VsYXIgZGVwZW5kZW5jeSBiZXR3ZWVuIHRoaXMgdHdvLgpUbyBlbGltaW5hdGUgc2FpZCBwcm9i
bGVtLCBzdHJ1Y3Qgc2tsX3NzdCBoYXMgYmVlbiBjcmVhdGVkLiBGcm9tIHRoYXQKbW9tbWVudCwg
U2t5bGFrZSBoYXMgYmVlbiBwbGFndWVkIGJ5IGhlYWRlciBlcnJvcnMgKGluY29tcGxldGUgc3R1
cmN0cywKdW5rbm93biByZWZlcmVuY2VzIGV0Yy4pIHdoZW5ldmVyIHNvbWV0aGluZyBuZXcgaXMg
dG8gYmUgYWRkZWQgb3IgY29kZQppcyBjbGVhbmVkIHVwLgoKRml4IHRoaXMgZmxhd2VkIGRlc2ln
biBieSBtZXJnaW5nIHNuZF9zb2Nfc2tsIGFuZCBzbmRfc29jX3NrbF9pcGMuCkFsc28sIGRvIG5v
dCBmb3JnZXQgYWJvdXQgc3RydWN0IHNrbF9zc3QgcmVkdW5kYW5jeS4KRm9sbG93dXAgY2hhbmdl
cyBhZGRyZXNzIGhhcm1mdWwgYXNzdW1wdGlvbnMgYW5kIGZhbHNlIGxvZ2ljIHdoaWNoCmRyaXZl
ciBjdXJyZW50bHkgaW1wbGVtZW50cyBlLmcuOiBhdHRlbXB0IHRvIHRha2Ugcm9sZSBvZiBtYXN0
ZXIgZm9yCkRTUCBzY2hlZHVsaW5nIHdoZW4gaW4gZmFjdCBlbnRpcmUgY29udHJvbCB0YWtlcyBw
bGFjZSBpbiBEU1AuCgpBbWFkZXVzeiBTxYJhd2nFhHNraSAoMik6CiAgQVNvQzogSW50ZWw6IFNr
eWxha2U6IENvbWJpbmUgc25kX3NvY19za2xfaXBjIGFuZCBzbmRfc29jX3NrbAogIEFTb0M6IElu
dGVsOiBTa3lsYWtlOiBEbyBub3QgZGlzYWJsZSBGVyBub3RpZmljYXRpb25zCgpDZXphcnkgUm9q
ZXdza2kgKDUpOgogIEFTb0M6IEludGVsOiBTa3lsYWtlOiBNZXJnZSBza2xfc3N0IGFuZCBza2wg
aW50byBza2xfZGV2IHN0cnVjdAogIEFTb0M6IEludGVsOiBTa3lsYWtlOiBSZW1vdmUgTUNQUyBh
dmFpbGFibGUgY2hlY2sKICBBU29DOiBJbnRlbDogU2t5bGFrZTogUmVtb3ZlIG1lbW9yeSBhdmFp
bGFibGUgY2hlY2sKICBBU29DOiBJbnRlbDogU2t5bGFrZTogTWFrZSBNQ1BTIGFuZCBDUFMgcGFy
YW1zIG9ic29sZXRlCiAgQVNvQzogSW50ZWw6IFNreWxha2U6IENsZWFudXAgc2tsX21vZHVsZV9j
ZmcgZGVjbGFyYXRpb24KCiBzb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1pcGMuaCAgICAgICAg
fCAgIDEgKwogc291bmQvc29jL2ludGVsL3NreWxha2UvTWFrZWZpbGUgICAgICAgIHwgIDEyICst
CiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9ieHQtc3N0LmMgICAgICAgfCAgNTAgKy0tCiBzb3Vu
ZC9zb2MvaW50ZWwvc2t5bGFrZS9jbmwtc3N0LWRzcC5oICAgfCAgIDcgKy0KIHNvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL2NubC1zc3QuYyAgICAgICB8ICAzNyArLQogc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLWRlYnVnLmMgICAgIHwgIDE0ICstCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtbWVzc2FnZXMuYyAgfCAyNDUgKysrKysrLS0tLS0tLQogc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLW5obHQuYyAgICAgIHwgIDE4ICstCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wt
cGNtLmMgICAgICAgfCAgNzQgKystLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzcC1j
bGsuYyAgIHwgICA0ICstCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWRzcC5jICAg
fCAgMTAgKy0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3QtZHNwLmggICB8ICAyOSAr
LQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC1pcGMuYyAgIHwgICA4ICstCiBzb3Vu
ZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWlwYy5oICAgfCAgNTIgKy0tCiBzb3VuZC9zb2Mv
aW50ZWwvc2t5bGFrZS9za2wtc3N0LXV0aWxzLmMgfCAgMzcgKy0KIHNvdW5kL3NvYy9pbnRlbC9z
a3lsYWtlL3NrbC1zc3QuYyAgICAgICB8ICA1MSArLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtl
L3NrbC10b3BvbG9neS5jICB8IDQ0MSArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIHNvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5oICB8ICA0MyArLS0KIHNvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC5jICAgICAgICAgICB8ICA1NCArLS0KIHNvdW5kL3NvYy9pbnRlbC9za3ls
YWtlL3NrbC5oICAgICAgICAgICB8IDEwMiArKysrLS0KIDIwIGZpbGVzIGNoYW5nZWQsIDU0NiBp
bnNlcnRpb25zKCspLCA3NDMgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
