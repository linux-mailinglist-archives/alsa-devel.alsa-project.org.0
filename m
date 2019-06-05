Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98435E58
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7099C168B;
	Wed,  5 Jun 2019 15:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7099C168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742648;
	bh=YshAio9xJqjBad0tO4ZgULSAWaXjgJewjHnZotUVE7Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBWPJo2FIbuP1NSnFGoOwUNxmVhS2ua9hZLSKtH03kB4+hUyd9gha0R2aBMYrQmHl
	 uZEgfxtDexfH/UMI7JX0UMn01xlu+F2obPbsIXPuF9eR8S6RcZBz2UXlW8UUGVtt4K
	 3yowUtzyH3zpeq/SoK8pj5u0mX5vsFTngNT4Udfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB7B4F8975C;
	Wed,  5 Jun 2019 15:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A903F8975F; Wed,  5 Jun 2019 15:42:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3077F89750
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3077F89750
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:45 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:41 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:52 +0200
Message-Id: <20190605134556.10322-11-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] [PATCH 10/14] SoC: rt274: Fix internal jack assignment
	in set_jack callback
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

V2hlbiB3ZSBjYWxsIHNuZF9zb2NfY29tcG9uZW50X3NldF9qYWNrKGNvbXBvbmVudCwgTlVMTCwg
TlVMTCkgd2Ugc2hvdWxkCnNldCBydDI3NC0+amFjayB0byBwYXNzZWQgamFjaywgc28gd2hlbiBp
bnRlcnJ1cHQgaXMgdHJpZ2dlcmVkIGl0IGNhbGxzCnNuZF9zb2NfamFja19yZXBvcnQocnQyNzQt
PmphY2ssIC4uLikgd2l0aCBwcm9wZXIgdmFsdWUuCgpUaGlzIGZpeGVzIHByb2JsZW0gaW4gbWFj
aGluZSB3aGVyZSBpbiByZWdpc3Rlciwgd2UgY2FsbApzbmRfc29jX3JlZ2lzdGVyKGNvbXBvbmVu
dCwgJmhlYWRzZXQsIE5VTEwpLCB3aGljaCBqdXN0IGNhbGxzCnJ0Mjc0X21pY19kZXRlY3Qgdmlh
IGNhbGxiYWNrLgpOb3cgd2hlbiBtYWNoaW5lIGRyaXZlciBpcyByZW1vdmVkICJoZWFkc2V0IiB3
aWxsIGJlIGdvbmUsIHNvIHdlCm5lZWQgdG8gdGVsbCBjb2RlYyBkcml2ZXIgdGhhdCBpdCdzIGdv
bmUgd2l0aDoKc25kX3NvY19yZWdpc3Rlcihjb21wb25lbnQsIE5VTEwsIE5VTEwpLCBidXQgd2Ug
YWxzbyBuZWVkIHRvIGJlIGFibGUKdG8gaGFuZGxlIE5VTEwgamFjayBhcmd1bWVudCBoZXJlIGdy
YWNlZnVsbHkuCklmIHdlIGRvbid0IHNldCBpdCB0byBOVUxMLCBuZXh0IHRpbWUgdGhlIHJ0Mjc0
X2lycSBydW5zIGl0IHdpbGwgY2FsbApzbmRfc29jX2phY2tfcmVwb3J0IHdpdGggZmlyc3QgYXJn
dW1lbnQgYmVpbmcgaW52YWxpZCBwb2ludGVyIGFuZCB0aGVyZQp3aWxsIGJlIE9vcHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogc291bmQvc29jL2NvZGVjcy9ydDI3NC5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9z
b3VuZC9zb2MvY29kZWNzL3J0Mjc0LmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0Mjc0LmMKaW5kZXgg
YWRmNTkwMzlhM2I2Li5jZGQzMTJkYjNlNzggMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3Mv
cnQyNzQuYworKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0Mjc0LmMKQEAgLTQwNSw2ICs0MDUsOCBA
QCBzdGF0aWMgaW50IHJ0Mjc0X21pY19kZXRlY3Qoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpj
b21wb25lbnQsCiB7CiAJc3RydWN0IHJ0Mjc0X3ByaXYgKnJ0Mjc0ID0gc25kX3NvY19jb21wb25l
bnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsKIAorCXJ0Mjc0LT5qYWNrID0gamFjazsKKwogCWlm
IChqYWNrID09IE5VTEwpIHsKIAkJLyogRGlzYWJsZSBqYWNrIGRldGVjdGlvbiAqLwogCQlyZWdt
YXBfdXBkYXRlX2JpdHMocnQyNzQtPnJlZ21hcCwgUlQyNzRfRUFQRF9HUElPX0lSUV9DVFJMLApA
QCAtNDEyLDcgKzQxNCw2IEBAIHN0YXRpYyBpbnQgcnQyNzRfbWljX2RldGVjdChzdHJ1Y3Qgc25k
X3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKIAogCQlyZXR1cm4gMDsKIAl9Ci0JcnQyNzQtPmph
Y2sgPSBqYWNrOwogCiAJcmVnbWFwX3VwZGF0ZV9iaXRzKHJ0Mjc0LT5yZWdtYXAsIFJUMjc0X0VB
UERfR1BJT19JUlFfQ1RSTCwKIAkJCQlSVDI3NF9JUlFfRU4sIFJUMjc0X0lSUV9FTik7Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
