Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F7708A3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 20:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80E7182F;
	Mon, 22 Jul 2019 20:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80E7182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563820258;
	bh=CzPnz51v/3583jyCqBK2US/9r76hW37wJWgFv2+qgqQ=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CYI5q9GmrZbHC0pnOnqW/IFIM5AdkmeCepEjwmoJWkQQ6ShGhWawdCgf+JelVGE+l
	 cR34msfnFkVQPCkMMAba0gmfADhbam0i7XlORaBzYjiNyZPA6gJlgIzUOsG4sFCIkT
	 BzlogtTw8ywG7Tm8EQkLzn0QbXggqap7FMLcoFeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2870F804AA;
	Mon, 22 Jul 2019 20:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D8C4F80481; Mon, 22 Jul 2019 20:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6D67F803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 20:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D67F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="ES3s2M4D"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45sqmp49ylzLD;
 Mon, 22 Jul 2019 20:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563819962; bh=7cyhUdMhixBBUfBCeVUJRa2O8CBgW7Y0NQpqrriXNt4=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=ES3s2M4D5ryWIG2cBgGsH3T5NSgkomJbBeUIzIkrzszGiQWvy2VxmuSCOg58TNR3c
 skzgaO7XKEsxZ6Cdi1T2uKzrCxUNPCYJqj8+QdzJsHMb3Y/AW0Ljs6xE5OAU5dw+x5
 J5Vr0KZXcineQeW5lRxFt5UYUyqj38gcbPqNTu6BsNsKPgUBW45obKwK9T6Fq0AHLU
 JaOtwreeGEHI8sX8Wmhi3ooVrCnr5cKpE159lYXh29RKraq5IKXdvCMQB7hqeO98nW
 GgvEzA1EBv7NZTHTsCIddhc99oSd+mNrDDf+e0MwqOcUeAbjwp3PtJdv8qSVSg4EuS
 Lcd14xs36rr3g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 22 Jul 2019 20:27:21 +0200
Message-Id: <718983d82091da8cf619010c026dca541af3f4d1.1563819483.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 4/5] ASoC: atmel_ssc_dai: split TX/RX FS
	constants
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

VGhlIGNvbnN0YW50cyBhcmUgdGhlIHNhbWUsIGJ1dCB0aGUgbmFtZXMgYXJlIG1pc2xlYWRpbmcg
d2hlbiB1c2VkIGZvcgpUQ01SIGNvbmZpZ3VyYXRpb24uIFVzZSBuYW1lcyBmcm9tIFNBTUE1RDIg
ZGF0YXNoZWV0LgoKU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhA
cmVyZS5xbXFtLnBsPgotLS0KIHNvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMgfCA2ICsr
Ky0tLQogc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuaCB8IDkgKysrKysrKystCiAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYyBiL3NvdW5kL3NvYy9hdG1lbC9hdG1l
bF9zc2NfZGFpLmMKaW5kZXggMDQ1NDFkN2MzM2ZlLi5jZjJjZmMzNDU2NzYgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMKKysrIGIvc291bmQvc29jL2F0bWVsL2F0
bWVsX3NzY19kYWkuYwpAQCAtNTcyLDcgKzU3Miw3IEBAIHN0YXRpYyBpbnQgYXRtZWxfc3NjX2h3
X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIAkJCXwgU1NDX0JG
KFJDTVJfU1RBUlQsIFNTQ19TVEFSVF9SSVNJTkdfUkYpOwogCiAJCXRjbXIgPQkgIFNTQ19CRihU
Q01SX1NUVERMWSwgMCkKLQkJCXwgU1NDX0JGKFRDTVJfU1RBUlQsIFNTQ19TVEFSVF9SSVNJTkdf
UkYpOworCQkJfCBTU0NfQkYoVENNUl9TVEFSVCwgU1NDX1NUQVJUX1JJU0lOR19URik7CiAKIAkJ
YnJlYWs7CiAKQEAgLTU4NCw3ICs1ODQsNyBAQCBzdGF0aWMgaW50IGF0bWVsX3NzY19od19wYXJh
bXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCiAJCQl8IFNTQ19CRihSQ01S
X1NUQVJULCBTU0NfU1RBUlRfRkFMTElOR19SRik7CiAKIAkJdGNtciA9CSAgU1NDX0JGKFRDTVJf
U1RURExZLCAxKQotCQkJfCBTU0NfQkYoVENNUl9TVEFSVCwgU1NDX1NUQVJUX0ZBTExJTkdfUkYp
OworCQkJfCBTU0NfQkYoVENNUl9TVEFSVCwgU1NDX1NUQVJUX0ZBTExJTkdfVEYpOwogCiAJCWJy
ZWFrOwogCkBAIC02MDMsNyArNjAzLDcgQEAgc3RhdGljIGludCBhdG1lbF9zc2NfaHdfcGFyYW1z
KHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAogCQkJfCBTU0NfQkYoUkNNUl9T
VEFSVCwgU1NDX1NUQVJUX1JJU0lOR19SRik7CiAKIAkJdGNtciA9CSAgU1NDX0JGKFRDTVJfU1RU
RExZLCAxKQotCQkJfCBTU0NfQkYoVENNUl9TVEFSVCwgU1NDX1NUQVJUX1JJU0lOR19SRik7CisJ
CQl8IFNTQ19CRihUQ01SX1NUQVJULCBTU0NfU1RBUlRfUklTSU5HX1RGKTsKIAogCQlicmVhazsK
IApkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuaCBiL3NvdW5kL3Nv
Yy9hdG1lbC9hdG1lbF9zc2NfZGFpLmgKaW5kZXggYWU3NjRjYjU0MWM3Li5lZmI0NThiNmQxODcg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmgKKysrIGIvc291bmQv
c29jL2F0bWVsL2F0bWVsX3NzY19kYWkuaApAQCAtNDIsMTMgKzQyLDIwIEBACiAgKi8KIC8qIFNU
QVJUIGJpdCBmaWVsZCB2YWx1ZXMgKi8KICNkZWZpbmUgU1NDX1NUQVJUX0NPTlRJTlVPVVMJMAot
I2RlZmluZSBTU0NfU1RBUlRfVFhfUlgJCTEKKyNkZWZpbmUgU1NDX1NUQVJUX1RSQU5TTUlUCTEK
KyNkZWZpbmUgU1NDX1NUQVJUX1JFQ0VJVkUJMQogI2RlZmluZSBTU0NfU1RBUlRfTE9XX1JGCTIK
KyNkZWZpbmUgU1NDX1NUQVJUX0xPV19URgkyCiAjZGVmaW5lIFNTQ19TVEFSVF9ISUdIX1JGCTMK
KyNkZWZpbmUgU1NDX1NUQVJUX0hJR0hfVEYJMwogI2RlZmluZSBTU0NfU1RBUlRfRkFMTElOR19S
Rgk0CisjZGVmaW5lIFNTQ19TVEFSVF9GQUxMSU5HX1RGCTQKICNkZWZpbmUgU1NDX1NUQVJUX1JJ
U0lOR19SRgk1CisjZGVmaW5lIFNTQ19TVEFSVF9SSVNJTkdfVEYJNQogI2RlZmluZSBTU0NfU1RB
UlRfTEVWRUxfUkYJNgorI2RlZmluZSBTU0NfU1RBUlRfTEVWRUxfVEYJNgogI2RlZmluZSBTU0Nf
U1RBUlRfRURHRV9SRgk3CisjZGVmaW5lIFNTQ19TVEFSVF9FREdFX1RGCTcKICNkZWZpbmUgU1NT
X1NUQVJUX0NPTVBBUkVfMAk4CiAKIC8qIENLSSBiaXQgZmllbGQgdmFsdWVzICovCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
