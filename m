Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB4E10512E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 12:12:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79AEE173E;
	Thu, 21 Nov 2019 12:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79AEE173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574334756;
	bh=Qbo6WA+9aQwWeF8ujScW2c+4ktaEXF0soCclfm6Aak4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WOsasJ177F5RbnxMCj2lRXJeZB+i/tOKBPEMk4nCLkr6KFcY3l7c65vPHi/5iGgcB
	 PJOAhHZjzlHEXviFxwCZ0t7+1I5ajxyLV0s48ErPYxLFPpHx9yRcJ22r+lZn5laJOy
	 wgAM/UzTYj7OUCT+/lttFZIpq/xIQsKNEg6D7ISc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB97EF8014C;
	Thu, 21 Nov 2019 12:10:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83C4AF80146; Thu, 21 Nov 2019 12:10:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474C1F800EF
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 12:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474C1F800EF
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 8FB4F3C057F;
 Thu, 21 Nov 2019 12:10:43 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppSTeXKvVKHo; Thu, 21 Nov 2019 12:10:38 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 164CA3C0022;
 Thu, 21 Nov 2019 12:10:38 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Thu, 21 Nov 2019 12:10:37 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Andrew Gabbasov
 <andrew_gabbasov@mentor.com>, Jiada Wang <jiada_wang@mentor.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 21 Nov 2019 12:10:23 +0100
Message-ID: <20191121111023.10976-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.72.93.184]
Cc: Nilkanth Ahirrao <external.anilkanth@jp.adit-jv.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [alsa-devel] [PATCH v2] ASoC: rsnd: fix DALIGN register for SSIU
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

RnJvbTogTmlsa2FudGggQWhpcnJhbyA8YW5pbGthbnRoQGpwLmFkaXQtanYuY29tPgoKVGhlIGN1
cnJlbnQgZHJpdmVyIG9ubHkgc2V0cyAweDc2NTQzMjEwIGFuZCAweDY3NDUyMzAxIGZvciBEQUxJ
R04uClRoaXMgZG9lc27igJl0IHdvcmsgd2VsbCBmb3IgVERNIHNwbGl0IGFuZCBleC1zcGxpdCBt
b2RlIGZvciBhbGwgU1NJVS4KVGhpcyBwYXRjaCBwcm9ncmFtcyB0aGUgREFMSUdOIHJlZ2lzdGVy
cyBiYXNlZCBvbiB0aGUgU1NJVSBudW1iZXIuCgpDYzogS3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlu
b3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgpDYzogSmlhZGEgV2FuZyA8amlhZGFfd2FuZ0Bt
ZW50b3IuY29tPgpDYzogQW5kcmV3IEdhYmJhc292IDxhbmRyZXdfZ2FiYmFzb3ZAbWVudG9yLmNv
bT4KRml4ZXM6IGE5MTRlNDQ2OTNkNDFiICgiQVNvQzogcnNuZDogbW9yZSBjbGVhciByc25kX2dl
dF9kYWxpZ24oKSBmb3IgREFMSUdOIikKU2lnbmVkLW9mZi1ieTogTmlsa2FudGggQWhpcnJhbyA8
YW5pbGthbnRoQGpwLmFkaXQtanYuY29tPgpTaWduZWQtb2ZmLWJ5OiBFdWdlbml1IFJvc2NhIDxl
cm9zY2FAZGUuYWRpdC1qdi5jb20+Ci0tLQp2MjoKIC0gRm9sbG93IEt1bmlub3JpIE1vcmltb3Rv
J3Mgc3VnZ2VzdGlvbiB0byByZXVzZSBkYWxpZ25fdmFsdWVzWzBdW3hdCiAtIFNpbXBsaWZ5IHRo
ZSBjb2RlIGJhc2VkIG9uIEFuZHJldyBHYWJiYXNvdidzIHJldmlldyBmaW5kaW5nCnYxOgogLSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjQ5NzY5LwotLS0KIHNvdW5kL3Nv
Yy9zaC9yY2FyL2NvcmUuYyB8IDIwICsrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9z
b2Mvc2gvcmNhci9jb3JlLmMgYi9zb3VuZC9zb2Mvc2gvcmNhci9jb3JlLmMKaW5kZXggZTk1OTZj
MjA5NmNkLi5hNmMxY2Y5ODdlNmUgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zaC9yY2FyL2NvcmUu
YworKysgYi9zb3VuZC9zb2Mvc2gvcmNhci9jb3JlLmMKQEAgLTM3Niw2ICszNzYsMTcgQEAgdTMy
IHJzbmRfZ2V0X2FkaW5yX2JpdChzdHJ1Y3QgcnNuZF9tb2QgKm1vZCwgc3RydWN0IHJzbmRfZGFp
X3N0cmVhbSAqaW8pCiAgKi8KIHUzMiByc25kX2dldF9kYWxpZ24oc3RydWN0IHJzbmRfbW9kICpt
b2QsIHN0cnVjdCByc25kX2RhaV9zdHJlYW0gKmlvKQogeworCXN0YXRpYyBjb25zdCB1MzIgZGFs
aWduX3ZhbHVlc1s4XVsyXSA9IHsKKwkJezB4NzY1NDMyMTAsIDB4Njc0NTIzMDF9LAorCQl7MHgw
MDAwMDAzMiwgMHgwMDAwMDAyM30sCisJCXsweDAwMDA3NjU0LCAweDAwMDA2NzQ1fSwKKwkJezB4
MDAwMDAwNzYsIDB4MDAwMDAwNjd9LAorCQl7MHhmZWRjYmE5OCwgMHhlZmNkYWI4OX0sCisJCXsw
eDAwMDAwMGJhLCAweDAwMDAwMGFifSwKKwkJezB4MDAwMGZlZGMsIDB4MDAwMGVmY2R9LAorCQl7
MHgwMDAwMDBmZSwgMHgwMDAwMDBlZn0sCisJfTsKKwlpbnQgaWQgPSAwLCBpbnY7CiAJc3RydWN0
IHJzbmRfbW9kICpzc2l1ID0gcnNuZF9pb190b19tb2Rfc3NpdShpbyk7CiAJc3RydWN0IHJzbmRf
bW9kICp0YXJnZXQ7CiAJc3RydWN0IHNuZF9wY21fcnVudGltZSAqcnVudGltZSA9IHJzbmRfaW9f
dG9fcnVudGltZShpbyk7CkBAIC00MTEsMTMgKzQyMiwxOCBAQCB1MzIgcnNuZF9nZXRfZGFsaWdu
KHN0cnVjdCByc25kX21vZCAqbW9kLCBzdHJ1Y3QgcnNuZF9kYWlfc3RyZWFtICppbykKIAkJdGFy
Z2V0ID0gY21kID8gY21kIDogc3NpdTsKIAl9CiAKKwlpZiAobW9kID09IHNzaXUpCisJCWlkID0g
cnNuZF9tb2RfaWRfc3ViKG1vZCk7CisKIAkvKiBOb24gdGFyZ2V0IG1vZCBvciBub24gMTZiaXQg
bmVlZHMgbm9ybWFsIERBTElHTiAqLwogCWlmICgoc25kX3BjbV9mb3JtYXRfd2lkdGgocnVudGlt
ZS0+Zm9ybWF0KSAhPSAxNikgfHwKIAkgICAgKG1vZCAhPSB0YXJnZXQpKQotCQlyZXR1cm4gMHg3
NjU0MzIxMDsKKwkJaW52ID0gMDsKIAkvKiBUYXJnZXQgbW9kIG5lZWRzIGludmVydGVkIERBTElH
TiB3aGVuIDE2Yml0ICovCiAJZWxzZQotCQlyZXR1cm4gMHg2NzQ1MjMwMTsKKwkJaW52ID0gMTsK
KworCXJldHVybiBkYWxpZ25fdmFsdWVzW2lkXVtpbnZdOwogfQogCiB1MzIgcnNuZF9nZXRfYnVz
aWZfc2hpZnQoc3RydWN0IHJzbmRfZGFpX3N0cmVhbSAqaW8sIHN0cnVjdCByc25kX21vZCAqbW9k
KQotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
