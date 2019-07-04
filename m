Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493295FDAE
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 22:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D126216AB;
	Thu,  4 Jul 2019 22:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D126216AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562270818;
	bh=YM6OTdjl/mZbfItva3SNt3MtGfdQav2RaQ/nRFD4HS8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QyaxWthqSNLkBfifpnTWuFkHMD9vrpPJ9X4w4z7ixInEQTnfu714cIlnM/e27gVHV
	 vUVwCkyLX8bolL+00uiyGNCIZ7ePPd/iDUsrc+tzF5VF1Qh9cZwIb+4EcjQBa1XvGF
	 VvbkYx0o0u+llGFiT296pSuDfHf7STrMxQGlpGL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF96F80158;
	Thu,  4 Jul 2019 22:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D7FF8014A; Thu,  4 Jul 2019 22:02:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A22F80145
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 22:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A22F80145
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 13:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,452,1557212400"; d="scan'208";a="166329355"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2019 13:02:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  4 Jul 2019 22:01:04 +0200
Message-Id: <20190704200106.11289-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704200106.11289-1-cezary.rojewski@intel.com>
References: <20190704200106.11289-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: [alsa-devel] [PATCH 5/7] ASoC: Intel: Skylake: Do not disable FW
	notifications
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

RnJvbTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29t
PgoKQXMgcGVyIEZXIHRlYW0gcmVjb21tZW5kYXRpb24gd2Ugc2hvdWxkIG5vdCBkaXNhYmxlIG5v
dGlmaWNhdGlvbnMuCkJ5IGRlZmF1bHQsIGFsbCBub3RpZmljYXRpb25zIGFyZSBlbmFibGVkIGlu
IERTUCBmaXJtd2FyZS4gVGhlc2UKbm90aWZpY2F0aW9ucyBwcm92aWRlIGEgdml0YWwgaW5mb3Jt
YXRpb24gd2hlbmV2ZXIgYW4gZXJyb3Igb2NjdXJzLgoKQ3VycmVudGx5LCBkcml2ZXIgZGlzYWJs
ZXMgdGhlbSBkdXJpbmcgYm9vdCBzZXF1ZW5jZXMuIEJ5IGRvaW5nIHNvLApTa3lsYWtlIG1heSBz
aWxlbnRseSBpZ25vcmUgc2V2ZXJlIHN0cmVhbSBlcnJvcnMuCkNvcnJlY3QgdGhhdCBieSByZW1v
dmluZyBwZXJtaXNzaXZlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNr
aSA8YW1hZGV1c3p4LnNsYXdpbnNraUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IENlemFyeSBS
b2pld3NraSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwv
c2t5bGFrZS9za2wtbWVzc2FnZXMuYyB8IDIwIC0tLS0tLS0tLS0tLS0tLS0tLS0tCiBzb3VuZC9z
b2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgICAgICB8ICAxIC0KIHNvdW5kL3NvYy9pbnRlbC9z
a3lsYWtlL3NrbC1zc3QtZHNwLmggIHwgIDEgLQogc291bmQvc29jL2ludGVsL3NreWxha2Uvc2ts
LXRvcG9sb2d5LmggfCAgNSAtLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtbWVzc2FnZXMuYyBiL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1tZXNzYWdlcy5jCmluZGV4IGY2MDRkOWM2ODI0ZC4u
MDc3NjI1NDNmYjEzIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtbWVz
c2FnZXMuYworKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtbWVzc2FnZXMuYwpAQCAt
NTgsMjQgKzU4LDYgQEAgdm9pZCBza2xfZHNwX3NldF9hc3RhdGVfY2ZnKHN0cnVjdCBza2xfZGV2
ICpza2wsIHUzMiBjbnQsIHZvaWQgKmRhdGEpCiAJc2tsX2lwY19zZXRfbGFyZ2VfY29uZmlnKCZz
a2wtPmlwYywgJm1zZywgZGF0YSk7CiB9CiAKLSNkZWZpbmUgTk9USUZJQ0FUSU9OX1BBUkFNX0lE
IDMKLSNkZWZpbmUgTk9USUZJQ0FUSU9OX01BU0sgMHhmCi0KLS8qIGRpc2FibGUgbm90ZmljYXRp
b24gZm9yIHVuZGVycnVucy9vdmVycnVucyBmcm9tIGZpcm13YXJlIG1vZHVsZSAqLwotdm9pZCBz
a2xfZHNwX2VuYWJsZV9ub3RpZmljYXRpb24oc3RydWN0IHNrbF9kZXYgKnNrbCwgYm9vbCBlbmFi
bGUpCi17Ci0Jc3RydWN0IG5vdGlmaWNhdGlvbl9tYXNrIG1hc2s7Ci0Jc3RydWN0IHNrbF9pcGNf
bGFyZ2VfY29uZmlnX21zZwltc2cgPSB7MH07Ci0KLQltYXNrLm5vdGlmeSA9IE5PVElGSUNBVElP
Tl9NQVNLOwotCW1hc2suZW5hYmxlID0gZW5hYmxlOwotCi0JbXNnLmxhcmdlX3BhcmFtX2lkID0g
Tk9USUZJQ0FUSU9OX1BBUkFNX0lEOwotCW1zZy5wYXJhbV9kYXRhX3NpemUgPSBzaXplb2YobWFz
ayk7Ci0KLQlza2xfaXBjX3NldF9sYXJnZV9jb25maWcoJnNrbC0+aXBjLCAmbXNnLCAodTMyICop
Jm1hc2spOwotfQotCiBzdGF0aWMgaW50IHNrbF9kc3Bfc2V0dXBfc3BpYihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCBzaXplLAogCQkJCWludCBzdHJlYW1fdGFnLCBpbnQgZW5hYmxl
KQogewpAQCAtNDM2LDggKzQxOCw2IEBAIGludCBza2xfcmVzdW1lX2RzcChzdHJ1Y3Qgc2tsX2Rl
diAqc2tsKQogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0Jc2tsX2RzcF9lbmFibGVf
bm90aWZpY2F0aW9uKHNrbCwgZmFsc2UpOwotCiAJaWYgKHNrbC0+Y2ZnLmFzdGF0ZV9jZmcgIT0g
TlVMTCkgewogCQlza2xfZHNwX3NldF9hc3RhdGVfY2ZnKHNrbCwgc2tsLT5jZmcuYXN0YXRlX2Nm
Zy0+Y291bnQsCiAJCQkJCXNrbC0+Y2ZnLmFzdGF0ZV9jZmcpOwpkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLXBjbS5jIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2ts
LXBjbS5jCmluZGV4IDJhZTVkMDlkNzIyOC4uN2YyODc0MjRhZjliIDEwMDY0NAotLS0gYS9zb3Vu
ZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMKKysrIGIvc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLXBjbS5jCkBAIC0xNDQ1LDcgKzE0NDUsNiBAQCBzdGF0aWMgaW50IHNrbF9wbGF0Zm9y
bV9zb2NfcHJvYmUoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpCiAJCX0KIAkJ
c2tsX3BvcHVsYXRlX21vZHVsZXMoc2tsKTsKIAkJc2tsLT51cGRhdGVfZDBpM2MgPSBza2xfdXBk
YXRlX2QwaTNjOwotCQlza2xfZHNwX2VuYWJsZV9ub3RpZmljYXRpb24oc2tsLCBmYWxzZSk7CiAK
IAkJaWYgKHNrbC0+Y2ZnLmFzdGF0ZV9jZmcgIT0gTlVMTCkgewogCQkJc2tsX2RzcF9zZXRfYXN0
YXRlX2NmZyhza2wsCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0
LWRzcC5oIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC1kc3AuaAppbmRleCBlZDk2
OGYxMDQyYzcuLmNkZmVjMGZjYTU3NyAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLXNzdC1kc3AuaAorKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWRz
cC5oCkBAIC0yNDAsNyArMjQwLDYgQEAgaW50IHNrbF9nZXRfcHZ0X2luc3RhbmNlX2lkX21hcChz
dHJ1Y3Qgc2tsX2RldiAqc2tsLAogdm9pZCBza2xfZnJlZXVwX3V1aWRfbGlzdChzdHJ1Y3Qgc2ts
X2RldiAqc2tsKTsKIAogaW50IHNrbF9kc3Bfc3RyaXBfZXh0ZW5kZWRfbWFuaWZlc3Qoc3RydWN0
IGZpcm13YXJlICpmdyk7Ci12b2lkIHNrbF9kc3BfZW5hYmxlX25vdGlmaWNhdGlvbihzdHJ1Y3Qg
c2tsX2RldiAqc2tsLCBib29sIGVuYWJsZSk7CiAKIHZvaWQgc2tsX2RzcF9zZXRfYXN0YXRlX2Nm
ZyhzdHJ1Y3Qgc2tsX2RldiAqc2tsLCB1MzIgY250LCB2b2lkICpkYXRhKTsKIApkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmggYi9zb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuaAppbmRleCAwYTRkODljZGFhNGMuLmUyYTJmYzVjNTU0
NSAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmgKKysr
IGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmgKQEAgLTE0MCwxMSArMTQw
LDYgQEAgc3RydWN0IHNrbF9zcmNfbW9kdWxlX2NmZyB7CiAJZW51bSBza2xfc19mcmVxIHNyY19j
Zmc7CiB9IF9fcGFja2VkOwogCi1zdHJ1Y3Qgbm90aWZpY2F0aW9uX21hc2sgewotCXUzMiBub3Rp
Znk7Ci0JdTMyIGVuYWJsZTsKLX0gX19wYWNrZWQ7Ci0KIHN0cnVjdCBza2xfdXBfZG93bl9taXhl
cl9jZmcgewogCXN0cnVjdCBza2xfYmFzZV9jZmcgYmFzZV9jZmc7CiAJZW51bSBza2xfY2hfY2Zn
IG91dF9jaF9jZmc7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
