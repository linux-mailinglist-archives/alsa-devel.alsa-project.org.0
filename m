Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D770809
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 19:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB171817;
	Mon, 22 Jul 2019 19:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB171817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563818397;
	bh=X2Wovxj54BUX9EeWz+yQ8sA2uXEbDvaVd6Df2+EuL4k=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmWJjH1Tv4JS+UZQI2+nPDLSBr8nK2hQsJBYRCs1A0TUEll6Rfki2ajcN9G0wufpn
	 tdmJTtPjMJ0s0CVqc111yqZwwfBR4dcdyFGRf+GfwCiKbEGrH2dPsVAL7j7bK/2J3V
	 iBYoGw43XLTXrSMpB6TFVBXE8cwAekRnqz12pKZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F246EF80481;
	Mon, 22 Jul 2019 19:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61A0AF803D6; Mon, 22 Jul 2019 19:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8FC3F803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 19:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FC3F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="kKxJ9vkq"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45sq6B5kvKzHW;
 Mon, 22 Jul 2019 19:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563818162; bh=GsdL27VirxgcYyB6/yKrLZ/ev5netk3LyKLVYjia/+M=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=kKxJ9vkq/itKGZp7S7QAYFRHtSY+zK2iW3MTr0xeu02kvYxbkxEKvPPZEHRNN+UKq
 mmglU2zmUeYSueQffoGiucMxUbADcd7VrDATjmQfgx5/C9tRznFR+buFJq/lIIMhsr
 dDlzkvA9JjxPWGVdODOTU3mp52wE9zyCZZOTulVpG+KTIBRdNKZ4OtDoknV2VL/1/n
 R1ZYmrB5hIBbxunwhEKSf5aplg1Ome5uP38XqeDxW+1l4zUZILvWMQiNOJZWJUH445
 51pD26DMTql1zZ+5oz6chyLxymgyzYbXcfz7mh3HcOXJ8SS0CphsZ9KaJ8CppKlXQD
 1O68zo/3cFwjQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 22 Jul 2019 19:57:21 +0200
Message-Id: <812430384c2d65fd1a51328e8b589700e239ccae.1563817201.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 patches@opensource.cirrus.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: wm8904: automatically choose clock
	source
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

Q2hvb3NlIGNsb2NrIHNvdXJjZSBhdXRvbWF0aWNhbGx5IGlmIG5vdCBwcm92aWRlZC4gVGhpcyB3
aWxsIGJlIHRoZSBjYXNlCndpdGggZWcuIGF1ZGlvLWdyYXBoLWNhcmQuCgpTaWduZWQtb2ZmLWJ5
OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+Ci0tLQogc291bmQv
c29jL2NvZGVjcy93bTg5MDQuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy93bTg5MDQuYyBiL3NvdW5kL3NvYy9jb2Rl
Y3Mvd204OTA0LmMKaW5kZXggMDMzYTM4ZTQwOGI1Li4yZDhjYjYxYTJkOTcgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9jb2RlY3Mvd204OTA0LmMKKysrIGIvc291bmQvc29jL2NvZGVjcy93bTg5MDQu
YwpAQCAtMzY3LDE1ICszNjcsMzQgQEAgc3RhdGljIGludCB3bTg5MDRfZW5hYmxlX3N5c2Nsayhz
dHJ1Y3Qgd204OTA0X3ByaXYgKnByaXYpCiAJcmV0dXJuIGVycjsKIH0KIAorc3RhdGljIGludCB3
bTg5MDRfYnVtcF9mbGxfc3lzY2xrKHVuc2lnbmVkIGludCAqcmF0ZSk7CisKIHN0YXRpYyBpbnQg
d204OTA0X3NldF9zeXNjbGsoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBjbGtfaWQsCiAJ
CQkgICAgIHVuc2lnbmVkIGludCByYXRlLCBpbnQgZGlyKQogewogCXN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50ID0gZGFpLT5jb21wb25lbnQ7CiAJc3RydWN0IHdtODkwNF9wcml2
ICp3bTg5MDQgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOwogCXVu
c2lnbmVkIGludCBjbG9jazAsIGNsb2NrMjsKLQlpbnQgZXJyOworCWludCBlcnIsIGRvX2RpdiA9
IGZhbHNlOwogCiAJc3dpdGNoIChjbGtfaWQpIHsKKwljYXNlIDA6CisJCWlmIChyYXRlID09IGNs
a19yb3VuZF9yYXRlKHdtODkwNC0+bWNsaywgcmF0ZSkpIHsKKwkJCWNsa19pZCA9IFdNODkwNF9D
TEtfTUNMSzsKKwkJfSBlbHNlIGlmIChyYXRlICogMiA9PSBjbGtfcm91bmRfcmF0ZSh3bTg5MDQt
Pm1jbGssIHJhdGUgKiAyKSkgeworCQkJcmF0ZSAqPSAyOworCQkJY2xrX2lkID0gV004OTA0X0NM
S19NQ0xLOworCQkJZG9fZGl2ID0gdHJ1ZTsKKwkJfSBlbHNlIHsKKwkJCWNsa19pZCA9IFdNODkw
NF9DTEtfRkxMOworCQkJZXJyID0gd204OTA0X2J1bXBfZmxsX3N5c2NsaygmcmF0ZSk7CisJCQlp
ZiAoZXJyKSB7CisJCQkJZGV2X2RiZyhjb21wb25lbnQtPmRldiwgIkNhbid0IG1hdGNoICV1IG92
ZXIgRkxMIDE0MDYyNTAgSHogbWluaW11bVxuIiwgcmF0ZSk7CisJCQkJcmV0dXJuIGVycjsKKwkJ
CX0KKwkJfQorCQlicmVhazsKKwogCWNhc2UgV004OTA0X0NMS19NQ0xLOgogCWNhc2UgV004OTA0
X0NMS19GTEw6CiAJCWJyZWFrOwpAQCAtNDE5LDcgKzQzOCw5IEBAIHN0YXRpYyBpbnQgd204OTA0
X3NldF9zeXNjbGsoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBjbGtfaWQsCiAJfQogCiAJ
LyogU1lTQ0xLIHNob3VsZG4ndCBiZSBvdmVyIDEzLjVNSHogKi8KLQlpZiAocmF0ZSA+IDEzNTAw
MDAwKSB7CisJaWYgKHJhdGUgPiAxMzUwMDAwMCkKKwkJZG9fZGl2ID0gdHJ1ZTsKKwlpZiAoZG9f
ZGl2KSB7CiAJCWNsb2NrMCA9IFdNODkwNF9NQ0xLX0RJVjsKIAkJd204OTA0LT5zeXNjbGtfcmF0
ZSA9IHJhdGUgLyAyOwogCX0gZWxzZSB7CkBAIC0xMzM0LDYgKzEzNTUsMjMgQEAgc3RhdGljIHN0
cnVjdCB7CiAJeyA0ODAsIDIwIH0sCiB9OwogCitzdGF0aWMgaW50IHdtODkwNF9idW1wX2ZsbF9z
eXNjbGsodW5zaWduZWQgaW50ICpyYXRlKQoreworCWludCBpOworCisJLyogYnVtcCBTWVNDTEsg
cmF0ZSBpZiBiZWxvdyBtaW5pbWFsIEZMTCBvdXRwdXQgKi8KKworCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGJjbGtfZGl2cyk7IGkrKykgeworCQlpZiAoKnJhdGUgKiBiY2xrX2RpdnNbaV0u
ZGl2ID49IDE0MDYyNTAgKiAxMCkKKwkJCWJyZWFrOworCX0KKworCWlmIChpID09IEFSUkFZX1NJ
WkUoYmNsa19kaXZzKSkKKwkJcmV0dXJuIC1FUkFOR0U7CisKKwkqcmF0ZSA9ICgqcmF0ZSAqIGJj
bGtfZGl2c1tpXS5kaXYpIC8gMTA7CisJcmV0dXJuIDA7Cit9CiAKIHN0YXRpYyBpbnQgd204OTA0
X2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIAkJCSAgICBz
dHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMgKnBhcmFtcywKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
